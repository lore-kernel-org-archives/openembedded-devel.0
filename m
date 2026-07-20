Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E52BBC44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 16:06:41 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.939.1784563354647327963
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 09:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KBhbJx+/;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: nguyenthaithuanalg@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c99eaa1f020so6889111a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 09:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784563354; x=1785168154; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cGRgNFyRMfslJQvX0upAwXbfDSfQu4ONSQPhgfo6tm0=;
        b=KBhbJx+/SjEtC9L0RsItM593kR0Yq5uoS9yBBsP3v2StJsETRTJ3W10F51ld/PHiOK
         /ay/Kbxn/OONNAIPllQNpMTn2rHiuKZGQ8OUnDUqdP87u1ys5I6FcaLC1gs0Baay5M0F
         iVX4w2mOliTP946LeoTXuhmE0zPr5oEF7RTRH/N0v4REyAb8pDFSCH8Q2dHE0GcnbkoE
         WZUg6uZzub17udHFzdIY4Gxf/Nt5qyPiCtg3DKiFlAwts+QxAvNN1Ct41ikPK1t+UnVC
         r5G7kyBMqr3u5p2ADBWf6BFnATLEruwNmSbu3Srw0gHenWwDMqbydcWEpzFYG0os1kwi
         ozvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563354; x=1785168154;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cGRgNFyRMfslJQvX0upAwXbfDSfQu4ONSQPhgfo6tm0=;
        b=ofee1ZMwKOx/9o5FaFj1BNH+IWfiS2y6k24HhsjnWbp+DO9It/Q5dLKV/dXcbe/1hA
         po+6c86zw6rzmtCU8avrFD91LUcEtl6prXxL9mdtnhWvhP6K+ajSth7Z1iiWJpS20QSx
         mG0SSVca1TZiBRPfqjQAG7dapLHpZNOYzZKpFirtyiBjBzBPI6ysd9CAQdV3Smjkcl6+
         UZO6z1P2PvG9hILk42xqSvESeS1ppO6tYm0i6OAdA3hJfBaxtbRfSXmgXN518eeZm4+C
         CdIvnMPaDtuVXyBY8Yiyp0/GVg500OwaYMyvmKbFA38gdutBNs8n/CUv68YJRplEdxp5
         1w7Q==
X-Gm-Message-State: AOJu0Yzd1M1U4fYqhmwa7Lpf7BGS3so5Ev8OjJ1UtKOTzeYact/S6SLI
	CLetT3sM603xWTBlQVjVvgjMCP4Eyp8AQb0sOG7bhWjpSdySRm/popG+XYxrDg==
X-Gm-Gg: AfdE7cmAzcCZ/fDnyq1T2czu+38sV+MTC9oCA6mLc/IgLlF0O/HZgxGTBeoWRftavtb
	c3330dg6w8Q11Vi2UCfpXAuMOHlYzDt9vDqTqAA/gQLAf2GSMo7HAsUEOONB88zfnSBAE0tHrgc
	GXXlWkitUdqGHxe/5xAne6WuPyLy2QXne1hx8qaEa1jwBF/g9nGvMFXeD/YvcIQvBuMsedPBDng
	DpxYuJyzOn/1YALvximKpTdxxS5OPYV0LNbw9X/WJBRREVUv9FELAPuW+Mk+54IWfFjn587o8sO
	7t0hQQIXzNK2eVdRWDSiTKjnf+VGtkb+Y7QUI3OPXnMHP8foH6oz7JLZh/iQnFEomJIMVwuO3hB
	IXuNj9qXhTHNTZ1OcQNDaX0Yc0k/voEWihjSblL6Nq1dOCx7kWae1/CzRS3XWXLf7vESPzBpJE5
	cTFyA81SDdN1g3JHV6nMyFABCSV8QSXJpzfA==
X-Received: by 2002:a05:6a20:c407:b0:3c3:b5db:d24a with SMTP id adf61e73a8af0-3c3b5dbd286mr10701854637.68.1784563353816;
        Mon, 20 Jul 2026 09:02:33 -0700 (PDT)
Received: from thuannt-Z87M-D3H.. ([42.113.218.129])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1dde81sm65457948eec.21.2026.07.20.09.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 09:02:32 -0700 (PDT)
From: =?UTF-8?B?VGh14bqtbiBOZ3V54buFbi1UaMOhaQ==?= <nguyenthaithuanalg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Thu=E1=BA=ADn=20Nguy=E1=BB=85n-Th=C3=A1i?= <nguyenthaithuanalg@gmail.com>
Subject: [meta-oe][PATCH] libsimplelog: upgrade 1.0.8 -> 1.1.0
Date: Mon, 20 Jul 2026 23:02:26 +0700
Message-ID: <20260720160226.6848-1-nguyenthaithuanalg@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:06:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128280

Add note to answer from meta-openembedded maintainer: Khem Raj

And explain -D__LINUX__=1, -D_GNU_SOURCE=1 and musl (strictly POSIX)

Signed-off-by: Thuận Nguyễn-Thái <nguyenthaithuanalg@gmail.com>
---
 .../libsimplelog/libsimplelog_1.1.0.bb           | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/libsimplelog/libsimplelog_1.1.0.bb b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.1.0.bb
index 53c13d726b..7a385d537b 100644
--- a/meta-oe/recipes-support/libsimplelog/libsimplelog_1.1.0.bb
+++ b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.1.0.bb
@@ -3,17 +3,27 @@ SUMMARY = "simplelog-topc - Simple, STABLE, powerful of logging library in ANSI
 DESCRIPTION = "Async and Fast C/C++ multi-thread logger with topics. No external dependencies."
 HOMEPAGE = "https://github.com/thuanalg/simplelog-topic"
 LICENSE = "MIT"
+#The checksum of "LIC_FILES_CHKSUM" changed b/c I did change from "2024" to "2024-2026"
+#libsimplelog  is allways full "MIT license".
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=594fdc3cb85f0b684cf5d7b332a741be"
 
 SRC_URI = "git://github.com/thuanalg/simplelog-topic.git;branch=main;protocol=https;tag=v${PV}"
 
 SRCREV = "151e83902ca9755bcd285791d2f49de6fc30bfe6"
 
-S = "${WORKDIR}/git"
-
 inherit cmake
 
-# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
 EXTRA_OECMAKE += "-DUNIX_LINUX=1 -D__LINUX__=1 -D_GNU_SOURCE=1"
 
+# From v.1.0.8 -> v1.1.0
+# Note for -D__LINUX__=1 -D_GNU_SOURCE=1
+# If don't use these flags, v.1.1.0 works like v1.0.8, and well adapt with musl (strictly POSIX)
+# If use 2 flags, they helps the source is more effective. Please test for 2 cases, you will see.
+# Please check "p->r = sched_getcpu();" in "simplelog.c"
+# You can use as below without any problem
+# EXTRA_OECMAKE += "-DUNIX_LINUX=1"
+
+# Drop 0001-allow-build-with-cmake-4.patch as it is now integrated upstream. 
+# Please see branch "main", commit "4827c4325063266f6d2a7e133a9d3a9050ff6a3c" by 
+# Author: Alper Ak <alperyasinak1@gmail.com>
 
-- 
2.43.0


