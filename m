Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 855FDD2ED11
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 06:48:12 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1278.1768891688602109723
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 22:48:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eUZQxILB;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so2816193f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 22:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768891687; x=1769496487; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OFGsBkxInggTrU5WPzq/Hxx70ShUXynncy9dYGVeSaM=;
        b=eUZQxILB2lC2gMltSfB2Gk+xtTYfGCdX63YlBF0KzeYkEjnwBcrsRd4InzR/Jivh1f
         GGTn7T+RS4Fn48KBDRDCMdeVhY0fYJfYveDo83BjN60pF6ZebIfYsdR3QYRYhnrFiNcN
         mjyBwtbmoHPmqCTqqJKN5lBLajDcFpDEC7V5JsiGf034WC2QQY1YFd6lwqXbU5Pqkoqq
         rBKzvrSIavTXTX94pWAlXtT6nga3zQhLUCwEqz91tfPEt2YXCs9SCIWUP/yQTmsX674a
         HVH9kMziIL+zLICRbkMuOQYKjLSg9YDYVT5PzB0dJohnHJLmS3TSe6lz0Pu/XKZMeNST
         u+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768891687; x=1769496487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OFGsBkxInggTrU5WPzq/Hxx70ShUXynncy9dYGVeSaM=;
        b=B7tp/umknaQC6MSK9AQrnfbyk5Xx7OUky1OLXQCfxWMxKXKySwBzHhBtbxeqydLjqS
         Xlax1iKkaVd2Awsh2Ws1H+COx000YBtwSw+96DY950KWfrhQNAtlsWOstNqSbEdypqDu
         gqK3O7HCkU96qnixbbnDE1fZAceCTbxpvYvwBJ9+cu6osLl23uqKFikWNzwOa3qoRi46
         s8ve/yi6dzJzcS+/oE/E/ajs00NImOGhKuvl93CpcGDqI+FV6yR2zwOA077bdhkFQsy/
         vTPGcIHjHtcAgLtxPBnu69zQgVJ9Jm02DJNfXk3Wyx60Rljw6jxidhk8iu/z3Y0gm9DG
         SCJg==
X-Gm-Message-State: AOJu0YzLf+uNInp3IhVwEyTZhF+220Jlz9UWAsvE/z7CcFvvLLppkggn
	Cwo8ho6x2BW/zMt1VQKMkUz0nVva/2jYXKSuJYonW55OiVHTxHaTQ+UgSUQJKA==
X-Gm-Gg: AZuq6aJRZm4CWA4j0bALLaw7L3izd7IUpLtyD9Z29/vQfVWhgRwrtCbsrqstGKZIfxE
	MoQJ9i6u+qp6fCPiOxPdd7f+D6csbruhzKX2H/s/YMcrwVSOR3tcJKM6O8fWdxt2Gf87U6zQpCg
	6VXa7OkttWecaX9Z0F20LiZhbg4FYgnQYyS/Obg06d9aZtAv7D1Rdikebu1EkwfCV3wcXQQ53L+
	QWuBVIcC2Lzg5xjJA1XQoi7xlVlsWDzjdK5DWmE8Db+gSRta7P26S52wxjGGdARortbqX8i2Mu/
	Ab1nu2J+sJgfCi501hZ7sY93oQXoufAwVaZwtJZZ8hhNSiAmHBuBYEbCoJpLISS56M5WNHHlurs
	DQJYC5re3GnNJOqqp6R88u9jq4Td/1x2BGxFDj6//u8+0wJmEv9PVJZx3TcmhV86qIkh9e6vZhl
	UjlRL/b0oM
X-Received: by 2002:a05:6000:268a:b0:430:f2ee:b220 with SMTP id ffacd0b85a97d-4356a029b02mr17727614f8f.19.1768891686910;
        Mon, 19 Jan 2026 22:48:06 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569997f41sm26469633f8f.38.2026.01.19.22.48.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:48:06 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 4/5] freerdp: patch CVE-2022-39320
Date: Tue, 20 Jan 2026 07:48:02 +0100
Message-ID: <20260120064803.831507-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120064803.831507-1-skandigraun@gmail.com>
References: <20260120064803.831507-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 06:48:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123657

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-39320

Take the patch that Debian has determined[1] to solve the issue.

[1]: https://security-tracker.debian.org/tracker/CVE-2022-39320

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/freerdp/CVE-2022-39320.patch      | 33 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp_2.6.1.bb  |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39320.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39320.patch b/meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39320.patch
new file mode 100644
index 0000000000..a668ad024d
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39320.patch
@@ -0,0 +1,33 @@
+From e9bbd8de33f8640abbd578fb511180853c4dccba Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Thu, 13 Oct 2022 08:36:26 +0200
+Subject: [PATCH] Ensure urb_create_iocompletion uses size_t for calculation
+
+(cherry picked from commit de7e0f062ee53d00b4a966a43855a716e3478150)
+
+CVE: CVE-2022-39320
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/68c6a8c1878b5294aecb04d5e27531a720b3793f]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ channels/urbdrc/client/data_transfer.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/channels/urbdrc/client/data_transfer.c b/channels/urbdrc/client/data_transfer.c
+index 9a44e6e09..82fdc729e 100644
+--- a/channels/urbdrc/client/data_transfer.c
++++ b/channels/urbdrc/client/data_transfer.c
+@@ -97,7 +97,13 @@ static wStream* urb_create_iocompletion(UINT32 InterfaceField, UINT32 MessageId,
+                                         UINT32 OutputBufferSize)
+ {
+ 	const UINT32 InterfaceId = (STREAM_ID_PROXY << 30) | (InterfaceField & 0x3FFFFFFF);
+-	wStream* out = Stream_New(NULL, OutputBufferSize + 28);
++
++#if UINT32_MAX >= SIZE_MAX
++	if (OutputBufferSize > UINT32_MAX - 28ull)
++		return NULL;
++#endif
++
++	wStream* out = Stream_New(NULL, OutputBufferSize + 28ull);
+ 
+ 	if (!out)
+ 		return NULL;
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
index 9489684e01..7cadae3d45 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https
            file://CVE-2022-39318-39319.patch \
            file://CVE-2022-24883.patch \
            file://CVE-2022-39282.patch \
+           file://CVE-2022-39320.patch \
            "
 
 S = "${WORKDIR}/git"

