Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA241CCD194
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 09:29:21 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.3911.1760606960169463958
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Oct 2025 02:29:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FsNfaMyM;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-46fcf9f63b6so2503325e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 02:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760606958; x=1761211758; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=x5ofIk0ltGzXdf3N/iNuy/7e5TnAqKnf5oscRMyTvQM=;
        b=FsNfaMyMGJRuVYoeF+L/IL97Uga7Uc/l7dl+y9VHeAPRYTrJebG/UaXWhL9HIFzVAQ
         SuiIm576gC+SMJT5QOTacX3e8r0fKc+42lwblB/xH2wNan6rAYktIxF4uP8ZAl5Jn6FX
         jGAsD0b2iuPw247Wv4Cb9kZMQiKNkI530YP4I/I3xJFxsn3BZRNEA9U/7IDvNpCjZ+V9
         DGWwYSYBRu5Ig3DvUg4p1JqBqDe2PnY1rv9/DIv7g6o7pEJfGa3+5RS3plYQX8lrWxpm
         jYAFtjSJHNTz8hrgRW8Vz1VosM3NVu36MvEvWLeiV7mtWR/t+wFiGstvEpbRw6bnVs3Y
         GjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760606958; x=1761211758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x5ofIk0ltGzXdf3N/iNuy/7e5TnAqKnf5oscRMyTvQM=;
        b=DmO+fb0yr2xrGWoyG87ZB5RK2nSrjC+wkV5uPyfOkFUkqaKBmY+rCGWJUiyTu7kADO
         wclAFo6gxwOwKbKUKpwcYEI6CY37ZAnKVgKs/1s8qC7cFnCHy2BqYSj91lbGvu1Yii9Z
         6S7UirmPwSjaa2YLEAD8b74B37emiBYOkueZjWSoZguQ/RK0Vt3LS3ySPKTGFP3erCTD
         GNjxx3zYZVot8mWxrbD13QRy3v4PN53ru5//Exg7X4cdg+oqtfTaSQdRuWu480QfoigQ
         P9P1R3HkvlvlCc2/+NO3SGU9uu1L7XndaTqXhlfHDIevIgBTrAWZieqs9qi52k1c3vCx
         pFWw==
X-Gm-Message-State: AOJu0YyLFLfgLBmUZbU57lLf2tiVmlYPLJU8B/PQAXQnFO5iWofcu3p7
	8MC2PjORHG9tZSCBNtrrtyAC31KourJ92moDFDVbhSE96wItylM+WPjQCAmy4Q==
X-Gm-Gg: ASbGncv1lXZWsUApCee0kB2wDpjQamHyr43/gClRAJrvADgH4yrYDQNIpokaqnA81N9
	1e7PeGo/Ro2I8MGJtq4//5tHE3fPYAaMumh5c/dstK6oV5JDy9uqFSwucYpPD50C/4ozUugz1mw
	zGPBSMLLAHIkM5CFHHKo40vqAFlJ1Mq5qZb4kUINnykomObvwDxlEMHqBn7QV1jkecKO3ctLWxP
	uBV6WDVIhSgv/2R5Htx7etOrNtaYyEf7oFDKlQyQ+88N7huXnIWdzdD8043DjNTdkdfdqH4s6+V
	XH9AYG3abMKDVqMVdc9rcV5j1XkqLiNncZCkfa5n0hA/Ura/Kzi1eklcKUnc5RaKRF3Vrd3UvDH
	bzq1+eUNzSmiOiKyAtdZJUjshnf9dJBljTL2pajE6Uerh6qPUdYA/v8WB6rBpOUZirGln9RNAMp
	t9MWrOPcyd
X-Google-Smtp-Source: AGHT+IGZzeOzi23OYTKCGH5EB8CIlxKHolo8V2TIyAvMMR46Owjwt+yxui9MXbf9xPeUhjIy99AKmA==
X-Received: by 2002:a05:600c:8288:b0:471:6f4:601f with SMTP id 5b1f17b1804b1-47106f460f6mr39938395e9.19.1760606958367;
        Thu, 16 Oct 2025 02:29:18 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4710ed9e7d7sm16819345e9.3.2025.10.16.02.29.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 02:29:18 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 1/4] faad2: patch CVE-221-32272
Date: Thu, 16 Oct 2025 11:29:14 +0200
Message-ID: <20251016092917.1946972-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 09:29:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120723

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-32272

Pick the patch that is mentioned in the ncv report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...ix-heap-buffer-overflow-in-mp4read.c.patch | 37 +++++++++++++++++++
 .../recipes-multimedia/faad2/faad2_2.8.8.bb   |  4 +-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-multimedia/faad2/faad2/0001-fix-heap-buffer-overflow-in-mp4read.c.patch

diff --git a/meta-oe/recipes-multimedia/faad2/faad2/0001-fix-heap-buffer-overflow-in-mp4read.c.patch b/meta-oe/recipes-multimedia/faad2/faad2/0001-fix-heap-buffer-overflow-in-mp4read.c.patch
new file mode 100644
index 0000000000..c739e82fb0
--- /dev/null
+++ b/meta-oe/recipes-multimedia/faad2/faad2/0001-fix-heap-buffer-overflow-in-mp4read.c.patch
@@ -0,0 +1,37 @@
+From 57850acf9d40fc2898ded492b9ce942110d0c426 Mon Sep 17 00:00:00 2001
+From: Fabian Greffrath <fabian@greffrath.com>
+Date: Mon, 31 Aug 2020 10:00:37 +0200
+Subject: [PATCH] fix heap-buffer-overflow in mp4read.c
+
+This originated from an integer overflow: If mp4config.frame.ents
+would be read-in with a value of (uint32t)(-1), it would overflow to 0
+in the size calculation for the allocation in the next line. The
+malloc() function would then successfully return a pointer to a memory
+region of size 0, which will cause a segfault when written to.
+
+Fixes #57.
+
+CVE: CVE-2021-32272
+Upstream-Status: Backport [https://github.com/knik0/faad2/commit/1b71a6ba963d131375f5e489b3b25e36f19f3f24]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ frontend/mp4read.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/frontend/mp4read.c b/frontend/mp4read.c
+index 9767383..5dc36b7 100644
+--- a/frontend/mp4read.c
++++ b/frontend/mp4read.c
+@@ -340,7 +340,10 @@ static int stszin(int size)
+     // Number of entries
+     mp4config.frame.ents = u32in();
+     // fixme error checking
+-    // fixme: check atom size
++
++    if (!(mp4config.frame.ents + 1))
++        return ERR_FAIL;
++
+     mp4config.frame.data = malloc(sizeof(*mp4config.frame.data)
+                                   * (mp4config.frame.ents + 1));
+     ofs = 0;
diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb b/meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb
index 56d5e1201e..d70c18f43d 100644
--- a/meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb
+++ b/meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=381c8cbe277a7bc1ee2ae6083a04c958"
 
 LICENSE_FLAGS = "commercial"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/faac/faad2-src/faad2-2.8.0/${BP}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/faac/faad2-src/faad2-2.8.0/${BP}.tar.gz \
+           file://0001-fix-heap-buffer-overflow-in-mp4read.c.patch \
+           "
 SRC_URI[md5sum] = "28f6116efdbe9378269f8a6221767d1f"
 SRC_URI[sha256sum] = "985c3fadb9789d2815e50f4ff714511c79c2710ac27a4aaaf5c0c2662141426d"
 

