Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F1BD46952
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 06:43:45 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.62299.1769150617216589597
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 22:43:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WVvvaGz8;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-435a517be33so1147813f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 22:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769150616; x=1769755416; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OBG2Fx59+8IiUbCYiRFhE13Dh/VHjO1+UPPxz47o/jo=;
        b=WVvvaGz8J+80sQgKQv1LwKVxIJSk5K9ozcEhnmEHMMCNzP5IEuDSOG8BxGBPj9pjXa
         YyBqcD/EUDwiZh6Gkf4j7QlONM4daP12fbFaybiL398OGgDkFVGoJEgE8w9ITBrrM7Lx
         90vpCj+8Uk4hD1lGhzppIKHQXcSroRp/Ue6/r7uJ3d5FrnEjePlmvk/jXw6q16uurZWP
         087tn86P5nfzwS7z+5NCGILH2rdJ+Dn5W8+2MSv7Z1cBlMg/qh+E6EFd+Ya3VMb0EkJ4
         IgCazflq0f6xDw4oFI4L5Y9SWp2D9bUHoFtSMF6MZORzb1sR3OAfRvX6qHEye6xpc7sj
         Fduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769150616; x=1769755416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OBG2Fx59+8IiUbCYiRFhE13Dh/VHjO1+UPPxz47o/jo=;
        b=XHijHfTU2HBGNfqxJcSwJf2KaUpDW7mMfGMNdBQ4liJ+vyD8c4VRG4eKoEiFJDRPz3
         Ju6LYWTAagAtTQm1YTROsgh4w35L1VGiTSBSDTDZbmsgvLWgVuHZYrEnlZNWheNAQECC
         wdlcyBmsStOwI9hB13wsG3GYr8NqgBaGpBd8y+MBvsTVrXLm4umMPWfyX+YqcYV9gXSq
         fGSvNaWe/+DpJm+BCP1nfoW0qorAX/1leH2sItl1vqAG2wAMGYpapiWHuJGr52thCAG+
         9iCG1RMEGYsmUhEwS4apwtUEQCEyaRMEm5OeRYMmOn0262IH+4HsGzTAFlBiT1W1g9dQ
         +Q0A==
X-Gm-Message-State: AOJu0YwRUaFh6vK+5BZcE22N7CRcG2Kpn0/94VdUhoM0D3b5KWHWRFA5
	FSecORaD88lLOllNFRtBjfoSz6lh7RxLYJL9OkIzeA9PO5O5TOEpZctNCdJu2A==
X-Gm-Gg: AZuq6aJUjZojUkT9bEwUO22XgOga7ca4pGxBFDaG25mk+WakVw6b5blhu+BXOYxsz0u
	Q3WpXpZBe7ZC30AHB3loskzS8mUvIu2FWimnBLnHaBThqPFhobzxD3zlz3yiWvENQT1u5ClRat1
	tqE63sy81+azKoWmL42isVlkaXpwUNYnjKtxoeJvOhlXFnOy1XqCE3Cln8djpVjI59VSqjcsFsO
	VYxC36QhEpmvKuuGIInmsgNS+Z7bw4wifwSktbMD71VDXyrs8PtrEAK8FtlHxKApWS55Ny9M1iK
	ZqyLzndWASw084XkJrZWLUcwpUw1OSAfsi/odQf0QAEns2/6szh58dp5crp3nseWJyYGdP2E6Wx
	a/ETCIRXVywje1W7HqZb/lxqeiWhta2fcoCNa4ZPBDP0UBSPwN8jTHk/XKqDDlXyW/L9W0+fRE8
	fwSsrp2Hob
X-Received: by 2002:a05:6000:400b:b0:435:92d3:d9b4 with SMTP id ffacd0b85a97d-435b1597b65mr3595363f8f.26.1769150615557;
        Thu, 22 Jan 2026 22:43:35 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c02cd8sm4051608f8f.8.2026.01.22.22.43.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 22:43:35 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 5/5] freerdp: patch CVE-2024-32658
Date: Fri, 23 Jan 2026 07:43:32 +0100
Message-ID: <20260123064332.4001588-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123064332.4001588-1-skandigraun@gmail.com>
References: <20260123064332.4001588-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 06:43:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123768

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-32658

Backport the patch that was marked to resolve this issue by the
relevant Github advisory[1].

[1]: https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-vpv3-m3m9-4c2v

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/freerdp/CVE-2024-32658.patch      | 36 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp_2.6.1.bb  |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32658.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32658.patch b/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32658.patch
new file mode 100644
index 0000000000..7467991f62
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32658.patch
@@ -0,0 +1,36 @@
+From 9b8628f014d14d85baeb0258d5558946603abc45 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Sat, 20 Apr 2024 17:59:49 +0200
+Subject: [PATCH] fix offset error
+
+(cherry picked from commit 1a755d898ddc028cc818d0dd9d49d5acff4c44bf)
+
+CVE: CVE-2024-32658
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/2b9f30a2fa4b13559a367f7cbe158e1bafe0f482]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libfreerdp/codec/interleaved.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libfreerdp/codec/interleaved.c b/libfreerdp/codec/interleaved.c
+index 58ddfbbfe..0c9e78fe0 100644
+--- a/libfreerdp/codec/interleaved.c
++++ b/libfreerdp/codec/interleaved.c
+@@ -214,7 +214,7 @@ static UINT ExtractRunLengthRegularFgBg(const BYTE* pbOrderHdr, const BYTE* pbEn
+ 	runLength = (*pbOrderHdr) & g_MaskRegularRunLength;
+ 	if (runLength == 0)
+ 	{
+-		if (!buffer_within_range(pbOrderHdr, 1, pbEnd))
++		if (!buffer_within_range(pbOrderHdr, 2, pbEnd))
+ 		{
+ 			*advance = 0;
+ 			return 0;
+@@ -284,7 +284,7 @@ static UINT ExtractRunLengthMegaMega(const BYTE* pbOrderHdr, const BYTE* pbEnd,
+ 	assert((pbEnd) && "Assert failed: pbEnd");
+ 	assert((advance) && "Assert failed: advance");
+ 
+-	if (!buffer_within_range(pbOrderHdr, 2, pbEnd))
++	if (!buffer_within_range(pbOrderHdr, 3, pbEnd))
+ 	{
+ 		*advance = 0;
+ 		return 0;
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
index 85d24428d4..1ad67b0a3c 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
@@ -37,6 +37,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https
            file://CVE-2024-32458.patch \
            file://CVE-2024-32459.patch \
            file://CVE-2024-32460.patch \
+           file://CVE-2024-32658.patch \
            "
 
 S = "${WORKDIR}/git"

