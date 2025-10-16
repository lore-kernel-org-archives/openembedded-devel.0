Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C447BCCD194
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 09:32:51 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.4090.1760607162771741762
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Oct 2025 02:32:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UeZ0IJ6d;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3ee13baf2e1so367553f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 02:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760607161; x=1761211961; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=x5ofIk0ltGzXdf3N/iNuy/7e5TnAqKnf5oscRMyTvQM=;
        b=UeZ0IJ6dO/yRHy3MzA8ps25xCbJoLXsCcgzR0WHht+UZAZnLWbcgYZzbRZOGRl1O/B
         DvF6n9zM3UaT47IFk3oe/36TXz17Z5dz3AS7ihL34KJI2PgLJI1+ppHi1ZG359Fvno4p
         N0sBgpV0G7nQ15iaK/QpKgsAPV5lKvQatIqdBm+NZvD6/IDMtBF8XL7Z9+V2iVnqs57K
         BDvFw/giwiV9y+xaUK8XnlvGfPGd8KEZpJtvS93+2lOkCBzKwlcJ3aGPzV2ipjYcPm8e
         y5ulG1YD2ynubwlSWCDmfDY11gZCe+PwjQkfP+8sNqljYNV3hvB8Q/wNx21rC2a4PmBK
         vbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760607161; x=1761211961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x5ofIk0ltGzXdf3N/iNuy/7e5TnAqKnf5oscRMyTvQM=;
        b=vYPTVtl1M0kdtLCuuRFYmfLKLUr2CjeunFUrngXSkRATTNnBdJtmBWqQAeYG6A1+rO
         EcFCSV53y1meMargXxoIHpHqK2bFz8996t555GN5yabwlyjvj6zK+37ke+vLINHhvcu2
         zGqQaRhhoVbQgtBvQQNXJPKYJtXAs05r7OlAGhrDbaFWLVzWAfvKDCFoOCQES8KKMaSo
         w+RpeDkbwt4H0I1/VhHs8dpukf78dX0UgfpxVFxSRyP/zFTGfUApHxGriWliIf23rYue
         QpM7hlxq8JbcLKq2JRTYEQXbRwPR5m5+zDPhdWD/h3lnk0JKETseUG0nwgBxkQ2zVwSH
         mBOg==
X-Gm-Message-State: AOJu0Yzvn1WTW7Ge3fNhEGBr+ZkqiSza+KUnzHwPFEiJP6MaU4zaDL8M
	0RyX5Tu5EOkDSr/sdLvGDp2CdWZ2AnlyBlIYq6R3RFCIoCcjIWIOznueJY32aw==
X-Gm-Gg: ASbGncu7qqtx1wMis7GYkEmmU8GzSKKuhpgIOIt7T/vfNCIPRVZR5GB1qxzd+xPa9U9
	yjjrTLldHTHj1fmfxyHf+P3ZBlwxWZYohRd7yAJ0HfTuuWl3xE2tRjj92Hc5L7j7J+xdlXIr8pm
	414HQOnQfWC/x4+1f6NXGB/pzWShFkW7LtKYtpAo9kkhDYCQou6dXccY+6/wkMr858ZvdEwS9DN
	g7fFZXWiLYhpgbnm3NhlPKieK7ajZ92XuDMsmtz371YfZPfBOLgjwCkZ/gVJLTCVvhXzmQTPZKc
	2bsdKSMmS7XFZIyPzNm+8OtE7auOBXirZYBnoQ6qihjaNY8JwTRPQsblV+dFxVthcVEbWaBhh/d
	MLA5T/M1G46XcsCy8WbVXlAYV0Jp5BWNIX6ZjsHgegbQA+le+IE01g3/NHvCWQR1Ls2CHGnbMpj
	FtjUSu+Zqt
X-Google-Smtp-Source: AGHT+IEMRtEVaqIiPYpfXwofhnr2e9tjFYl8bTcZZkAxyV0Wv3ifzIE7SvLAC7AW504UKqbfqteLJw==
X-Received: by 2002:a05:600c:8b41:b0:45d:d88b:cca with SMTP id 5b1f17b1804b1-46fa9a87fc6mr208440015e9.1.1760607160764;
        Thu, 16 Oct 2025 02:32:40 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce582b39sm33219345f8f.15.2025.10.16.02.32.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 02:32:40 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] faad2: patch CVE-2021-32272
Date: Thu, 16 Oct 2025 11:32:39 +0200
Message-ID: <20251016093239.1947399-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 09:32:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120728

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
 

