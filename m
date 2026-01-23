Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B42D62602
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 06:43:46 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.62298.1769150615818883929
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 22:43:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mgustIlL;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4327555464cso1135827f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 22:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769150614; x=1769755414; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DlLE3rISwWJSkmR+q/ygdHoJeBvIfZ1KFAx/tnISRcY=;
        b=mgustIlL7enCjsurkMIIEGZCB38SMrEskPRu1RJwUM6OavL7dvp+H6MFQ78kninjM+
         84YB4J1PB5z9LRSiymsK4cICbXbnlJXOT5J9tjcj95U3Vp3KgMHpa2wi7akOzZhfiVBb
         TFk0FSlOpic/idKQ5cXOFU+zcPRwpciOjxzObypZYwk4y0XuOpU3c2FUD9CVpW5ImvOg
         XnHtQE8l6xVnL58Pn3YumTtjEzVHYjyc1SdzARfbX4W0t/S2SJqyfCgplXwjKJp2iK6a
         YYGXEYuAvXS9QBmYNidacgCoVuP8b8bFO/jUkalfwySCO/P9kb7JaAIr8z1ju/FX5FbV
         Q83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769150614; x=1769755414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DlLE3rISwWJSkmR+q/ygdHoJeBvIfZ1KFAx/tnISRcY=;
        b=js+qrbim1ySHI3YCHs6t8CuCYvhVK9TN4DkytwuoXw5+xUMpCOxRD4SK671gUjR7SJ
         1nXheKjwdjYTB9OdbBPmMuY7dVVzgZBXwm+AmUup0BVyZjVwGKFEswM0lpKkXPYynQgk
         N8+bKTweCGQr7T+tmEk3Q5jZ+hfr0i8JqJqZnf6hjVnA6Gwqn83vPS5PwQylZdX5CqSP
         vLJLZKtnsosBr/xPEiVNZ/Acp6RNoberijW+TqtnfQHpkJr9Voiwifbc+iJ0iGe37VGV
         slBwWD9rVitzzbtkuqJKX2QLtWByfrKa7LPuKolzSCYL8iI7JssPW5/nCl4ea3IiJfaL
         YuFA==
X-Gm-Message-State: AOJu0YzycIc2ACwCJo35qN9AWyXe7LU7MJnAIBO7l0Xd+ORRrTFRI6HV
	TFxEbHfjeD3sYINPmvC741mxySmiPgCQNnw+opLFqor2LGPVoo24pRJWfbnLhg==
X-Gm-Gg: AZuq6aLMfGc+kYbTDLgjPWILgKoL83H/cEWY/+sKvmPhR+/o8z+3Q9TkUNhBDQKgSm6
	LBoATxrEcHE5Cf1UP9LAQJXXbiUZk152ZZqg6Uvf3AFM/tdO8C//F3xz5wIXkDHthPNlasBfFHL
	wBTLqj1Ton519YcMdjCApAxUBQLwPFLKQZTOEnBZnH7MoNWp/+ngayvOU3fAURDbqKvNlTxVQkm
	3Po7mtiqFDu1o5QUIUC4wG7NxH3w+yz6dq5NXatAEnyBP5Yh25ast9tJzVe2wThnnpTF4Zy2cED
	Wj9KtcRuiVOVw3IhKrWhT/hk5yIQ5NdytdGIvSYzeGQhfKh52+0twjGTLFItG9p2O1PnYCqEgD4
	66xs2u+GFOcJtWjQrXB9hYBsNcOfeaPJ1P5uAacTwIUQLlS14kxADWnY/ZUR8R2l/OmrlWBxypg
	vxIUh8JPdKPg9ME1IbzGs=
X-Received: by 2002:a05:6000:26d2:b0:435:ad51:ac82 with SMTP id ffacd0b85a97d-435b15d6e8dmr2991859f8f.18.1769150614150;
        Thu, 22 Jan 2026 22:43:34 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c02cd8sm4051608f8f.8.2026.01.22.22.43.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 22:43:33 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 3/5] freerdp: patch CVE-2024-32459
Date: Fri, 23 Jan 2026 07:43:30 +0100
Message-ID: <20260123064332.4001588-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123064332.4001588-1-skandigraun@gmail.com>
References: <20260123064332.4001588-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 06:43:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123766

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-32459

Pick the patch that is marked to resolve this vulnerability by
the relevant Github advisory[1].

[1]: https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-cp4q-p737-rmw9

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/freerdp/CVE-2024-32459.patch      | 31 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp_2.6.1.bb  |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32459.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32459.patch b/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32459.patch
new file mode 100644
index 0000000000..ed665da447
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32459.patch
@@ -0,0 +1,31 @@
+From 7570f1a12a5718a47c4260130e6a05fd518e1268 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Tue, 16 Apr 2024 08:45:03 +0200
+Subject: [PATCH] fix missing input length check
+
+(cherry picked from commit dbe5d521001789511bbf1db97c9bc565d168e03b)
+
+CVE: CVE-2024-32459
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/b70c8e989d2807cea47bbf89e57700b5a10b2ca7]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libfreerdp/codec/ncrush.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/libfreerdp/codec/ncrush.c b/libfreerdp/codec/ncrush.c
+index c1d622a9c..199f1ed7c 100644
+--- a/libfreerdp/codec/ncrush.c
++++ b/libfreerdp/codec/ncrush.c
+@@ -2041,6 +2041,12 @@ int ncrush_decompress(NCRUSH_CONTEXT* ncrush, BYTE* pSrcData, UINT32 SrcSize, BY
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
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
index 0a01b2095a..6d98ad36f7 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
@@ -35,6 +35,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https
            file://CVE-2024-32039.patch \
            file://CVE-2024-32040.patch \
            file://CVE-2024-32458.patch \
+           file://CVE-2024-32459.patch \
            "
 
 S = "${WORKDIR}/git"

