Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A77CCA476
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 18:13:44 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.5222.1760206424271696039
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Oct 2025 11:13:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HJPiSDhL;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-afcb78ead12so478337366b.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 11:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760206423; x=1760811223; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fY8HV4dxjNnTDozxyKQ8jdWlx+DY37q9TEN12eNXgwc=;
        b=HJPiSDhLxPkbif7gu2Jbj9fy2YTcW0C9SGpfbEng7nnm1kLGnHqDKTa4wFSYIsi3+Y
         /On4qn2kJl9FV8Gp3ql+gbNHmDGiUVpOhlKZwun5IQtVv9IycjDoRRqhzRxWHYQe3dc0
         bgymwWbl8KbGzHdlJwtFJv5yrm8ARVaHrmDGjG3cLPTXDsZOxmvGtIbGYiE0FCVd8B3h
         8lcQXlvHkhFK5mMN4co8quQsIVdmFXO3XcO5JMwhQomUvmsrMGfUCMmCl66mr0AJxY+Z
         69jUTo3Zz89Npsj9B8BLGGzvyHRxk9y31PkmKr+gIKS+dZSAKi8HlGNrS5OwuOMQUeo0
         1AaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760206423; x=1760811223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fY8HV4dxjNnTDozxyKQ8jdWlx+DY37q9TEN12eNXgwc=;
        b=Snkit6QFadi76x6LSM9eFIQEWX1z+3Db4WsTBBoNNUxMCpWSqSqw1FibUwUwdHqEC9
         QkX5VISOe2nFjlWAzb3uHTdx10I77aM60bGkbfId9kDB4hgfej05TaYFox/zoW+0mxyC
         KIXk4fyT4bv2Wps130/u7IPMTJWXBIWdntoWOqK/edVrHLXkCy6isXwV2Y92oH9bTAi9
         hB1tc7yUDKiN3/aTnm+uiuCk/oiSzMZ6K4WtAQQu8PqkqzbciJME6ogZ74Ako96HFL8O
         Z4fpeYvYm/H1mvjKuH+YecsUe1hZ5KCf1vyjT1/svAuseGzxaHL2gXiufysxU5fqnheF
         bY9g==
X-Gm-Message-State: AOJu0Yws8NsbqRTRaTLhVliwTsx0OE0+6btouo/U6GEgkbRUvTx/ov/F
	v+0Opjcc/G6VJSZoCArTi611TGRzsmppP2P+6r0KCKI9gyIVGETArEPgcT67xA==
X-Gm-Gg: ASbGncu69evh26dgBy+g3GL/2xox24oXaU0RUWiMoh926/aCVa32O+ZxjmOTD5o0LMu
	u0VM1SSEXC93g0uuQjO1s/U445m/Y+qqo6jQ0cvMChZn5VorqGlzG9b3pzLsDi5MR/D64PbIaLH
	b9cLXx4A5m/Ktm1083h90Nim4r9E8QNLtnmwWYIpOqRxE1DN8XCEYHMIHZXDGm2gDWseftuzO2K
	pWor7VxA00JL92VofONAWqp/5SYrb7jfmihcwwhV5Fu2FGgb04mavSlvfQOVO9+kN5gJXafxEem
	BDGAbQo+9Q+3W2UU+d1OzA9nGXo5fmtIMc1oarz5FZB7F0718r3LX6GQaj9MfmI0RLTOu/aZiJ4
	az5Bd+rVRXfhcJwiNXUaxHV8BlNIK2MnDQs/qSVc=
X-Google-Smtp-Source: AGHT+IHi0b0p10n1XZ1eTB1XBycE1erytlHiTujaQm6gMwoA02qZOhx9y0E31/py5IrChouSgiD2Yw==
X-Received: by 2002:a17:906:f5a6:b0:b3e:9818:30e0 with SMTP id a640c23a62f3a-b50ab08a127mr1447211666b.29.1760206422532;
        Sat, 11 Oct 2025 11:13:42 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cad8adsm547156166b.7.2025.10.11.11.13.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 11:13:42 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 04/10] freerdp3: patch CVE-2024-32459
Date: Sat, 11 Oct 2025 20:13:33 +0200
Message-ID: <20251011181339.2127670-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251011181339.2127670-1-skandigraun@gmail.com>
References: <20251011181339.2127670-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 18:13:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120503

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-32459

Pick the patch that is marked to resolve the related github advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/freerdp3/CVE-2024-32459.patch     | 30 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp3_3.4.0.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32459.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32459.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32459.patch
new file mode 100644
index 0000000000..8370f055a5
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32459.patch
@@ -0,0 +1,30 @@
+From 8e385887fb3ffe0ec50f8c2cbdcbc66b5ff1569e Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Tue, 16 Apr 2024 08:45:03 +0200
+Subject: [PATCH] fix missing input length check
+
+CVE: CVE-2024-32459
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/91a1535f88a00bbb2b212b6a808a021aa4f486f8]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libfreerdp/codec/ncrush.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/libfreerdp/codec/ncrush.c b/libfreerdp/codec/ncrush.c
+index 4a7162c89..69921853b 100644
+--- a/libfreerdp/codec/ncrush.c
++++ b/libfreerdp/codec/ncrush.c
+@@ -2068,6 +2068,12 @@ int ncrush_decompress(NCRUSH_CONTEXT* ncrush, const BYTE* pSrcData, UINT32 SrcSi
+ 		return 1;
+ 	}
+ 
++	if (SrcSize < 4)
++	{
++		WLog_ERR(TAG, "Input size short: SrcSize %" PRIu32 " < 4", SrcSize);
++		return -1;
++	}
++
+ 	const BYTE* SrcEnd = &pSrcData[SrcSize];
+ 	const BYTE* SrcPtr = pSrcData + 4;
+ 
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
index 8d41063811..ede4551a87 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https \
            file://CVE-2024-32039.patch \
            file://CVE-2024-32040.patch \
            file://CVE-2024-32458.patch \
+           file://CVE-2024-32459.patch \
            "
 
 S = "${WORKDIR}/git"

