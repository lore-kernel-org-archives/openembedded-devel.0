Return-Path: <jed.openxt@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id B8C5371CCB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2017 19:08:41 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id q71so7072598ywg.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2017 11:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=zpSBiP6u3GwRwJgljhfx2RkNcwL0L1hzYLZgPt0M4GQ=;
	b=lnHAj/davptsNapDUR7KIsM1wmfx0lH+94X7K0PqRaqBOLoqli3sBshOYkerQzrNfd
	aX1gxG+QNZUPE70T7qAeS2v9xd4hLHzGRrTuxZupgKeThY2SDY8fJhDyyUP0eN1EKNPr
	FqUvMmoa4vbywVfgme4hUUrRiM8HKRW0OQ1LwMwCfGZviP0F3zszoYjLYy4M0CvrEn61
	+ccGeAua3cYvjQnAPMGp1dyfPF54ynmmkK+Xw6ujKmICmjVWpnygzrMKlqIuPmEnEMet
	5pP0L6i71xoIPJ+DUuMYSfqRFBsdw2fnT2rdVzoGW7d9+e2ET/Hua6wSrlf2eDBiAbDt
	AKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=zpSBiP6u3GwRwJgljhfx2RkNcwL0L1hzYLZgPt0M4GQ=;
	b=PHzxBSN/N6HsFXO0tC3W37FMhjyMJZ0eXQmm811oMfgqclCHITFDiLsg7vTJK5Gfl9
	LKQXqWZfBFr3x/LjMhlNUu5UUNpTN6wp4KgsJQXU2+EvKe3gAb44mLw5hiW4Lxl9zJNc
	4xOsWvHdAYDuHhdSf8gXoIYEdkpc8iZk0X2U/J7OD3TIfVRO3lVgglwJL/Dlzni4AFdV
	0dHtdK2B9DABfAv8nOQKhqVe4qW2BlNZFlNDsLwxY8/bOScr0YbNzJKlZ5q2laug74Z6
	FHA+MuauPnt566celzy/eCgdBeFsizgaXHduRSM5YejofZXjKk6qU03RU9YgwKhLmGsA
	ySQg==
X-Gm-Message-State: AIkVDXIjmk4IgDob6atX4f+g3HFxztsUu2FTnF97nacJkG9yMHkB6bsVs8yJYtjP1fXCTA==
X-Received: by 10.55.201.141 with SMTP id m13mr13006197qkl.247.1484939321589; 
	Fri, 20 Jan 2017 11:08:41 -0800 (PST)
Received: from [192.168.2.32]
	(70-88-247-169-ma-nh-me-ne.hfc.comcastbusiness.net. [70.88.247.169])
	by smtp.gmail.com with ESMTPSA id
	u54sm5100395qtu.35.2017.01.20.11.08.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Jan 2017 11:08:41 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
From: Jed <jed.openxt@gmail.com>
Message-ID: <308a03dc-12f1-8df3-d093-c17d85046bf0@gmail.com>
Date: Fri, 20 Jan 2017 14:08:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
Subject: [meta-java][PATCH] jdepend: fix URLs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Jan 2017 19:08:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

From e94279f3bd2bc60054bff02d54818b17e6923981 Mon Sep 17 00:00:00 2001
From: Jed <jed.openxt@gmail.com>
Date: Fri, 20 Jan 2017 13:41:36 -0500
Subject: [meta-java][PATCH] jdepend: fix URLs

Signed-off-by: Jed <jed.openxt@gmail.com>
---
 recipes-core/jdepend/jdepend_2.9.1.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes-core/jdepend/jdepend_2.9.1.bb b/recipes-core/jdepend/jdepend_2.9.1.bb
index 9f74f44..be48325 100644
--- a/recipes-core/jdepend/jdepend_2.9.1.bb
+++ b/recipes-core/jdepend/jdepend_2.9.1.bb
@@ -1,12 +1,12 @@
 DESCRIPTION = "Design quality metrics generator for each Java"
 
-# see http://www.clarkware.com/software/license.txt
+# see https://github.com/clarkware/jdepend/blob/master/LICENSE
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5777d32a7709d558c2877d4a6616230"
 
-HOMEPAGE = "http://clarkware.com/software/JDepend.html"
+HOMEPAGE = "https://github.com/clarkware/jdepend"
 
-SRC_URI = "http://www.clarkware.com/software/jdepend-${PV}.zip"
+SRC_URI = "https://github.com/clarkware/jdepend/archive/${PV}.zip"
 
 inherit java-library
 
@@ -18,7 +18,7 @@ do_compile() {
   fastjar cf ${JARFILENAME} -C build .
 }
 
-SRC_URI[md5sum] = "0cbaf43493cd30838bee261f69e76fe9"
-SRC_URI[sha256sum] = "b9f34236aaea5ddc070caa29794d2f5ae79bc12e199bec6ebba6c29093a17a9e"
+SRC_URI[md5sum] = "9b91efe1d770e023893f89f4dde8434e"
+SRC_URI[sha256sum] = "536b5082d64e4f4dddd514ce30178f36c7a31b34d969275f278f72e522e7f7c9"
 
 BBCLASSEXTEND = "native"
-- 
2.1.4


