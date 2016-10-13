Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8EAF26AC00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 12:46:53 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id l131so9710713lfl.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 05:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=jNK0c2dHPscP5t0LczfQcXs9PqhDIVkcpaJoY7dMQqM=;
	b=kjUU+ddLN7+oEmIiNsKZG3XRnQj7vKTcZiwhr00lPZoDYDKtzoPtivoRlrdAWFvw16
	JAJgFq+INZeOfB5CCWyQd3wNfGVl2zE7UBccemPPXL48sFHvZUK24lKVNxwMcnK7kqlm
	dXmyPxG8Re0IBVexaJeoFXcVWcroAgydNIhstIE7G6Ng1C5RSGm/J3quY3BDMSxu6Jfy
	ydHPfyxbdLhlOOS90gi0DMPK7+XfTDQtBUnV/hZwz1ySxHHM4iy0j0EfTG+0OxZ+Uah6
	fVPQvTb6HODnqFn8nMhpgnAwSIhGAJC3yU9Frg0eM2FuGzuwQEnjr8Uxq1q2p/IH1TpM
	Qe8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jNK0c2dHPscP5t0LczfQcXs9PqhDIVkcpaJoY7dMQqM=;
	b=XUUz5VUpRtoDyiv2lN/8nBk09q8xKY3TokXSXlHUHmBiosjJiut5PXjhGgBH5QI95S
	zVkc+zrYjsetDZeEdc9QoO0gcbs8j0rYxQqCUIKV1IBEmLiunPIIkbaLVbGQYAUzqCS1
	dfhr+l46LQdKwHkkarB49qcSBWkmW3nbfMhuaOQKJXwh7F/UjQbyuhpVrlh59YYY4mTh
	3CirfJKOMHZwk6iGcEcaIe3YS6ErSJ6N3aLo6Q1IIlMZ2fDh3wX1jul6IBM53fc+thSX
	c5s4BriovJZFdmzU1JQ3gfPDHIXPgdqDDecSr8i2uqDvBsgRrRV+eMBnUqUwNfYMrQzH
	SnHA==
X-Gm-Message-State: AA6/9RmRiZ1f+qWXrddfBIaHgXIx0OrjsT+I2hy9exkdZNqtVsDCAxsRc8+WvSeQxcDexg==
X-Received: by 10.28.64.213 with SMTP id n204mr2041727wma.64.1476362814866;
	Thu, 13 Oct 2016 05:46:54 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	h3sm22301942wjp.45.2016.10.13.05.46.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Oct 2016 05:46:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Oct 2016 14:46:51 +0200
Message-Id: <20161013124651.4285-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.1
Subject: [meta-oe][PATCH] ipmiutil: uncomment PARALLEL_MAKE
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
X-List-Received-Date: Thu, 13 Oct 2016 12:46:54 -0000

* it's randomly failing for last year, so it wasn't there by accident
  at least one race condition is on ipmilan.o:
  | obj/ipmilan.o: file not recognized: File truncated
  | collect2: error: ld returned 1 exit status
  | make[2]: *** [libipmiutil.so] Error 1
  | make[2]: *** Waiting for unfinished jobs....
* oldest failure report was on 2015-08-30
  http://www.openembedded.org/wiki/Bitbake_World_Status_Jethro
  and many more were reported since then in:
  http://www.openembedded.org/wiki/Bitbake_World_Status_Krogoth
  http://www.openembedded.org/wiki/Bitbake_World_Status
  and even more
  http://errors.yoctoproject.org/Errors/Search/?query=ipmiutil
  e.g. good examples (not with musl)
  http://errors.yoctoproject.org/Errors/Details/88674/
  http://errors.yoctoproject.org/Errors/Details/85986/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb b/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb
index 9e74df5..bdb3d47 100644
--- a/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb
+++ b/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb
@@ -15,7 +15,7 @@ HOMEPAGE = "http://ipmiutil.sourceforge.net"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f9372493401f309e6149dd2ce0a044b"
 
-#PARALLEL_MAKE = ""
+PARALLEL_MAKE = ""
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/ipmiutil/ipmiutil-${PV}.tar.gz \
     file://fix_systemd_path.patch "
-- 
2.10.1


