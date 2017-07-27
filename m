Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pg0-f52.google.com (mail-pg0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9712760685
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jul 2017 19:31:24 +0000 (UTC)
Received: by mail-pg0-f52.google.com with SMTP id k190so36258580pgk.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jul 2017 12:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BjuxUH1WExU8s3h9Ognj11vWlXCG7pFPGiFiajI5YLw=;
	b=J6+1X/FGYlo6jpcNgLSOHKyWTi9RqSOehuZ3xbqOrJsN5PYZvxg5potTbKl3hloz2O
	k2v33+VRkwSuwu/JU+x7virnnV5DTf7mnLQ2vqeICWANMJu38FgWYMnspNtBNT/Q3k3r
	sEdaxc125AQOS0sQnnw+qc8XvRiDhC/Y97/vhRA7/vNvGm4+uYmwXLodQTko2cv90eqT
	3Nk3AEvfQDHyYFQv7gyrXRzgKPs/2R9W8LPPquzXCmA/4gPKivA4Xtf2NrjvIUoGMABY
	SmyU/YkNrpGnrvPvFexKzecQIqWXRYFe83IDTcPJttVVTbsE88aZ3KchLpjLAxIMaFOV
	XtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BjuxUH1WExU8s3h9Ognj11vWlXCG7pFPGiFiajI5YLw=;
	b=XyGu6gPp8y7umaXSNRzrvJIilCgjo8bfZWyH2MTRm4OP6qbqwFzeMiagGvABMSLPtT
	TOzCC3HTn0rcYvpqz2xkqRnxoXoBIp4ZnSCjL174y8OX87eTVU9B71qxdEhAcIhD77h7
	y0ff53c+2iBC9lOq+cXRfg031TNtbpx9XtwUY4dVyxgNqjtcbU4HgKKlFOFSLG6LlRLl
	uqJHe6A2d+l+8GO1LhOcQy+LWBvtFrs0/T8TAAwgV18rrfUDz6zPoYvfAK/pAQAqARgp
	6JjY952GOtckz/fapIzoMN7n5RWR3haLUQ6W1hTuwnjQRiAZgl+gkU+X1UiOsJBvsCok
	r3rQ==
X-Gm-Message-State: AIVw110E0lBaDTAE7BSKEoLII5jblKe5ETMB5vGVRh5HYD/DXNsBpBG5
	uuzGy9MU/cHPoqUaSvo=
X-Received: by 10.99.170.1 with SMTP id e1mr4927496pgf.411.1501183885468;
	Thu, 27 Jul 2017 12:31:25 -0700 (PDT)
Received: from jkrishnanjanappa-VPCEB26FG.mvista.com
	([2405:204:5321:924b:2e44:9b89:19b8:b2d])
	by smtp.gmail.com with ESMTPSA id
	k26sm36801785pfb.145.2017.07.27.12.31.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 27 Jul 2017 12:31:24 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Jul 2017 01:01:15 +0530
Message-Id: <1501183875-5296-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] drbd: Add recipe
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
X-List-Received-Date: Thu, 27 Jul 2017 19:31:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

DRBD is a block device which is designed to build high availability
clusters. This is done by mirroring a whole block device via (a dedicated)
network. You could see it as a "network RAID-1".

This recipe provides DRBD9 kernel modules drbd.ko and
drbd_transport_tcp.ko.

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 ...ck_existence_of_modules_before_installing.patch | 24 ++++++++++++++++++++++
 .../recipes-support/drbd/drbd_9.0.8-1.bb           | 22 ++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta-networking/recipes-support/drbd/drbd/check_existence_of_modules_before_installing.patch
 create mode 100644 meta-networking/recipes-support/drbd/drbd_9.0.8-1.bb

diff --git a/meta-networking/recipes-support/drbd/drbd/check_existence_of_modules_before_installing.patch b/meta-networking/recipes-support/drbd/drbd/check_existence_of_modules_before_installing.patch
new file mode 100644
index 0000000..6414f73
--- /dev/null
+++ b/meta-networking/recipes-support/drbd/drbd/check_existence_of_modules_before_installing.patch
@@ -0,0 +1,24 @@
+If CONFIG_BLK_DEV_DRBD kernel config is enabled, then DRBD
+does not build drbd.ko here. Under this circumstance do_install
+task is going to fail with a below error:
+-- snip --
+| install: cannot stat ‘drbd.ko’: No such file or directory
+| make[1]: *** [install] Error 1
+-- snip --
+
+So, check for kernel module existence before installing.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+--- drbd-9.0.1-1/drbd/Makefile	2016-07-03 06:54:19.421538690 -0700
++++ drbd-9.0.1-1/drbd/Makefile_mod	2016-07-03 06:53:18.938801628 -0700
+@@ -158,7 +158,7 @@ else
+ 	fi
+ 	install -d $(DESTDIR)/lib/modules/$(KERNELRELEASE)/$(MODSUBDIR)
+ 	set -e ; for ko in $(MODOBJS); do \
+-		install -m 644 $$ko $(DESTDIR)/lib/modules/$(KERNELRELEASE)/$(MODSUBDIR); \
++		[ -e $$ko ] && install -m 644 $$ko $(DESTDIR)/lib/modules/$(KERNELRELEASE)/$(MODSUBDIR); \
+ 	done
+     ifeq ($(DESTDIR),/)
+       ifeq ($(shell uname -r),$(KERNELRELEASE))
diff --git a/meta-networking/recipes-support/drbd/drbd_9.0.8-1.bb b/meta-networking/recipes-support/drbd/drbd_9.0.8-1.bb
new file mode 100644
index 0000000..e943f24
--- /dev/null
+++ b/meta-networking/recipes-support/drbd/drbd_9.0.8-1.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Distributed block device driver for Linux"
+DESCRIPTION = "DRBD is a block device which is designed to build high \
+               availability clusters. This is done by mirroring a whole \
+               block device via (a dedicated) network. You could see \
+               it as a network raid-1."
+HOMEPAGE = "http://oss.linbit.com/drbd/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
+DEPENDS = "virtual/kernel"
+
+SRC_URI = "http://www.linbit.com/downloads/drbd/9.0/drbd-${PV}.tar.gz \
+           file://check_existence_of_modules_before_installing.patch"
+
+SRC_URI[md5sum] = "c1dd58043f46e9926b579aa65d4ea980"
+SRC_URI[sha256sum] = "87f72d46db9bad926415b3ab9f5f1397de8c581d2e2ec1addbdd5ce2604e6123"
+inherit module
+
+EXTRA_OEMAKE += "KDIR='${STAGING_KERNEL_DIR}'"
+
+do_install () {
+    oe_runmake install DESTDIR="${D}"
+}
-- 
2.7.4


