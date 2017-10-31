Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6763377DCC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 15:03:42 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id l194so20779036qke.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 08:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YafMzjttUrDM+ZdlwIZdoOgt+f5o67JCXInOr56PRHA=;
	b=UIw+zHaOQfeRd2O+eV/qR/bVtWAQTTP4X1MxF5j3vg8/0JOudCCnR6TY/B9OxV/2RU
	eYwVkax+nkTznAdNnX/FXT6FayqyhVcc0fD4FHvRV6GW0Eut6l5Q250Yv0n3R9iD2r9h
	yWLh2TKq7Mw1Aq2ivNX04Bxom0kbFk2kQ5kySrrXYTxEczAZKzJxntfHIl7+n+xzV+JZ
	QStjJdo1VZZPvFBjl4ltRUKxVErBheCJN8B1ve7w6iELPiHHTazj0RicB3N5+4NGMdAn
	at6vTzxSPqqjGhOh4SmOp8dM5JhId9EVWpouskPNhpR/0PhUKPUEHRtMh7hlcX95q70P
	bnKA==
X-Gm-Message-State: AMCzsaUGoPwd5J6gddcaPb1sTA02nigG/FbSNZypNpweiyWcHWPERn3D
	8inmdh1k0eM+jgITHWuOeCb0X0Ki
X-Google-Smtp-Source: ABhQp+RgLhMftQrOOeXbG59YRCek0pQLaTpWFIQjzSSKHszoxjQ3nusn21HcAFNDZcnGpvmOnlqrxw==
X-Received: by 10.55.33.150 with SMTP id f22mr2933043qki.207.1509462223469;
	Tue, 31 Oct 2017 08:03:43 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id 188sm945865qkm.89.2017.10.31.08.03.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Oct 2017 08:03:42 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Oct 2017 11:03:36 -0400
Message-Id: <1509462216-13065-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] netdata: update to version 1.8.0
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
X-List-Received-Date: Tue, 31 Oct 2017 15:03:43 -0000

Update license checksum for copyright updates
Rebase existing patch to remove contrib dir from the build

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../netdata/netdata/0001-makefile-Do-not-build-contrib-dir.patch    | 6 +++---
 meta-webserver/recipes-webadmin/netdata/netdata_git.bb              | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata/0001-makefile-Do-not-build-contrib-dir.patch b/meta-webserver/recipes-webadmin/netdata/netdata/0001-makefile-Do-not-build-contrib-dir.patch
index 9a3a4a5..6a0d75e 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata/0001-makefile-Do-not-build-contrib-dir.patch
+++ b/meta-webserver/recipes-webadmin/netdata/netdata/0001-makefile-Do-not-build-contrib-dir.patch
@@ -11,17 +11,17 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 3ccf82f8..a852e529 100644
+index 2ea9e40..acb1bd8 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -52,7 +52,6 @@ SUBDIRS = \
+@@ -56,7 +56,6 @@ SUBDIRS = \
  	src \
  	system \
  	web \
 -	contrib \
+ 	tests \
  	$(NULL)
  
- dist_noinst_DATA= \
 -- 
 2.13.2
 
diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb b/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
index 1003662..b0f1602 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
@@ -1,15 +1,15 @@
 HOMEPAGE = "https://github.com/firehol/netdata/"
 SUMMARY = "Real-time performance monitoring"
 LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a4a3b650ea3f74269cdfd45a3550e219 \
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=95b49e9ea979a337578f13c2a3ab9535 \
                     file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                    "
 
 SRC_URI = "git://github.com/firehol/netdata.git;protocol=https \
            file://0001-makefile-Do-not-build-contrib-dir.patch \
 "
-SRCREV = "f5fa346a188e906a8f2cce3c2cf32a88ce81c666"
-PV = "1.6.0+git${SRCPV}"
+SRCREV = "89ed309252981ddd50f697fde4fe93019cb3e652"
+PV = "1.8.0+git${SRCPV}"
 
 # patch to disable timeout because timeout are not available with actual version
 # of core-utils
-- 
2.7.4


