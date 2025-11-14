Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A39CEACDA
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 20:26:37 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7589.1763151995163971754
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Nov 2025 12:26:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G0Id0I7A;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477775d3728so24475615e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 12:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763151993; x=1763756793; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YwaMO6fZ+1TDdQJ3W9MGSxxh65XWwV46LadyJU5P0oQ=;
        b=G0Id0I7AlxcbZLh58U7lIQpzSBpmgCI4HHdVxKDCMHfeTBTumdki6GQQMJWgIOneBK
         UW60RPLihP7NdnfrNAARr8EBvK68XJUSbSbOEwL94lPTJH8NVFjQrb9rhYn79rpv+O3C
         ZYyHTwACZ0vhoxCOJEomJaX12N8gI2czk+wFkiFzRCUP+eTyp3dQMKG9qwtyCJJwOA9B
         JOpluhLjvJuYgweEGed0lH7N6g96S9j1ETAsMHuokFeXQk3BZyPDxT2versIVaZW0lqR
         hX/acpKRIewkfYwM6qlsNOxQ2REO+3HeW9MTeOCCvUQld6IG54XzPaH2ZSh5zFBQVCIf
         Kebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763151993; x=1763756793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YwaMO6fZ+1TDdQJ3W9MGSxxh65XWwV46LadyJU5P0oQ=;
        b=cBDN4cXqAoEdmC37C2mR+D9z66Z+cVZY1zDTN3UWT6PraZPGl4Vz4+K43Z8JDpHAOV
         SQ/KMdjPVTIgv+/lieUWwLcUhkoIwNEpML97G25n14yX9PSyM6Yqbx8TYAlMD/51gwLT
         BPUbPVj374LrrmdqwCOR5qMFZaxGywBJnKYHksBnOmW3S9QIS5dllq1WCnWJP382P8nk
         Jgchw2RXy3kPQjl4+YCYvsmKMfryjKoYkCTb+OtnF8xdQmsjyyVEAbQnuVPTKvHVZrjY
         Px0a/RmSZCukdaENkP5cl2o4AsYpBEQ9dQFBr70xuAuryAtCKwowIQCrjPJwlTEfWRGT
         FBgw==
X-Gm-Message-State: AOJu0Yy0Gzd76CAlQOAnL0qISxSV3HzyjXoqDHin9wadyQ1FXhgpmufH
	OzE1+uONLXMRbaRbYGjwoUUkHBX6hy5nTlyMXjGXMIxl7FlndVDdmBZtjrvX00Pd
X-Gm-Gg: ASbGncu85sNxWWcgZPUYgAWcRAYpuhf7XUJgkgon/HPigZfMoMfQ6h8IPBxIzKaUY2n
	xod5jgTjmlMmLaYWW3giRy6tPmAdccXRKxusHus9aPKDHYabXrEB3lgBheize+VaQOjOHIbX4Ho
	E+sgtiukJ0Oqj4BbGQsWYY9C3npqWWGT/TNFLFcUuu1eYl8OYORC7vlOrVVHSQa46IsQwslvW8f
	Gf86HG+d5Q18kiUger4SRX9WuiLtMgqu1UmPDTJOg1dlc89IFaJ+FDMLx3HYtehHus2FgD+7m1J
	tBMtDIsIYLER6SWcLolIlTDqSr07vx/D35N+NeKilJc3ENUS+pUX2Fz495KytPez0kehRCteWjS
	zLD9y1wzrM0hTh5EJFu24k4xYjIIqcDJLqAP5Lpb85zSB/shRR6stQXg+lWwWOVUxz+/lTCjahz
	ul+ULnOFA/
X-Google-Smtp-Source: AGHT+IHJ2N9ZwvU8NYRovRZOvlfm0rMmKUpzly/R0A+GSA5RpG5R4epYLT/sjgEa1WOliqdRabbjvQ==
X-Received: by 2002:a05:600c:4594:b0:477:bb0:7528 with SMTP id 5b1f17b1804b1-4778fe9aec9mr45877215e9.22.1763151993154;
        Fri, 14 Nov 2025 12:26:33 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779527a656sm23617845e9.10.2025.11.14.12.26.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 12:26:32 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 6/6] libwmf: patch CVE-2016-9011
Date: Fri, 14 Nov 2025 21:26:27 +0100
Message-ID: <20251114202627.656631-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114202627.656631-1-skandigraun@gmail.com>
References: <20251114202627.656631-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 20:26:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121721

Details: https://nvd.nist.gov/vuln/detail/CVE-2016-9011

Pick the patch that explicitly mentions the vulnerability ID.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libwmf/libwmf/CVE-2016-9011.patch         | 50 +++++++++++++++++++
 .../recipes-extended/libwmf/libwmf_0.2.8.4.bb |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libwmf/libwmf/CVE-2016-9011.patch

diff --git a/meta-oe/recipes-extended/libwmf/libwmf/CVE-2016-9011.patch b/meta-oe/recipes-extended/libwmf/libwmf/CVE-2016-9011.patch
new file mode 100644
index 0000000000..e2044bc3e6
--- /dev/null
+++ b/meta-oe/recipes-extended/libwmf/libwmf/CVE-2016-9011.patch
@@ -0,0 +1,50 @@
+From 245ec5c80d8d9964d150507f5583ab890a327fe8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Caol=C3=A1n=20McNamara?= <caolanm@redhat.com>
+Date: Wed, 8 Aug 2018 14:01:34 +0100
+Subject: [PATCH] CVE-2016-9011
+
+CVE: CVE-2016-9011
+Upstream-Status: Backport [https://github.com/caolanm/libwmf/commit/2208b4881ceb8056480735dc330cfd52be03893e]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/player.c | 27 +++++++++++++++++++++++++--
+ 1 file changed, 25 insertions(+), 2 deletions(-)
+
+diff --git a/src/player.c b/src/player.c
+index cd87cb5..628cdcb 100644
+--- a/src/player.c
++++ b/src/player.c
+@@ -139,8 +139,31 @@ wmf_error_t wmf_scan (wmfAPI* API,unsigned long flags,wmfD_Rect* d_r)
+ 		WMF_DEBUG (API,"bailing...");
+ 		return (API->err);
+ 	}
+-	
+- 	P->Parameters = (unsigned char*) wmf_malloc (API,(MAX_REC_SIZE(API)  ) * 2 * sizeof (unsigned char));
++
++	U32 nMaxRecordSize = (MAX_REC_SIZE(API)  ) * 2 * sizeof (unsigned char);
++	if (nMaxRecordSize)
++	{
++		//before allocating memory do a sanity check on size by seeking
++		//to claimed end to see if its possible. We're constrained here
++		//by the api and existing implementations to not simply seeking
++		//to SEEK_END. So use what we have to skip to the last byte and
++		//try and read it.
++		const long nPos = WMF_TELL (API);
++		WMF_SEEK (API, nPos + nMaxRecordSize - 1);
++		if (ERR (API))
++		{	WMF_DEBUG (API,"bailing...");
++			return (API->err);
++		}
++		int byte = WMF_READ (API);
++		if (byte == (-1))
++		{	WMF_ERROR (API,"Unexpected EOF!");
++		       	API->err = wmf_E_EOF;
++		       	return (API->err);
++		}
++		WMF_SEEK (API, nPos);
++	}
++
++ 	P->Parameters = (unsigned char*) wmf_malloc (API, nMaxRecordSize);
+ 
+ 	if (ERR (API))
+ 	{	WMF_DEBUG (API,"bailing...");
diff --git a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
index bb1aecd16d..2eb7f44114 100644
--- a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
+++ b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
@@ -23,6 +23,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/wvware/${BPN}/${PV}/${BPN}-${PV}.tar.gz;name=ta
            file://CVE-2015-0848-CVE-2015-4588.patch \
            file://CVE-2015-4695.patch \
            file://CVE-2015-4696.patch \
+           file://CVE-2016-9011.patch \
            "
 
 SRC_URI[tarball.md5sum] = "d1177739bf1ceb07f57421f0cee191e0"

