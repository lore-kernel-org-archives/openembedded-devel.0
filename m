Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id C7C2B781EB
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 12:53:31 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id g76so16364730wrd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 05:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Cf7p4ATyz1DuWRicWrT5Tgh5DIILytbSn49bbnAt3kk=;
	b=bUl2jzlw/I4y8+V4YT2s7ganJKMKnIz5uFLUiBrBcxZ6e5ftjbcdLNdGH0BBNVfD21
	AMfJIDor+ug1Z1Uxw+m0qWxLejrGeWLrhbWrgKxlcncBwTo0GUPB32G2uCrDPMsLZyrg
	VJclPXhHKnEcAgAAcbUbsBsEOMwpTmVdd1CF/z2vmBUsB8sV7d+foh112Jfup4d0ktH+
	TnuJSz38uAyfMQVcNCEpMyToXXuaH2ltDaDSCTivnre3QWMjZ+g/M+i2UO/cNXBNVkt6
	AMu4/Y+mXoAgEwiXsJzbEcy0JrVMPMqQHBsGIr8cY4tN+orT6KQA0a5sabo1JMQtYjC1
	KDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Cf7p4ATyz1DuWRicWrT5Tgh5DIILytbSn49bbnAt3kk=;
	b=rwAUE75BjNk8nr1wymSHq9+RCDYBl+BC2KOUbmsAcRkVLNmVFXqOEwO+FbyFgWIdsS
	M79lPy9b+V6Wiqq2R+QAr1NRPm0hJ82ZSRTGotIg3l7DV4WT/LqsYouc4WePHjd7K2Lv
	XVBMHx75oCrEBeSQIsAAQ5yriS3hjFSZMTsMKQlGhw/lBDmlc0lJ0f0X5h8GLVRoEJio
	6P8Ianewm32R398rggb2k7T+8fr0AEHkriwaBhWUCCnPuInpj39hWNewl0Sbp0Iu0oHi
	/Np1WuVZxGnrSh4DUGSQYKCN9t5FPOwZhih6GPiX+nmSqaeePT0s9ywG1d8ialDavF8k
	nFYA==
X-Gm-Message-State: AODbwcCZHhUjQTnUP9ocZ+jUwfmM79rzxsoMeYP7wMtY9H+fbQYeZzX6
	rLO1yOtC0pQgdbhA
X-Received: by 10.80.162.38 with SMTP id 35mr38894315edl.99.1497185612189;
	Sun, 11 Jun 2017 05:53:32 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.206.46]) by smtp.gmail.com with ESMTPSA id
	d37sm3676741edb.54.2017.06.11.05.53.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Jun 2017 05:53:31 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Jun 2017 14:53:21 +0200
Message-Id: <1497185601-1384-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-perl] [PATCH] po4a: add recipe
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
X-List-Received-Date: Sun, 11 Jun 2017 12:53:32 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

The po4a (PO for anything) project goal is to ease translations (and
more interestingly, the maintenance of translations) using gettext
tools on areas where they were not expected like documentation.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta-perl/recipes-perl/po4a/po4a_0.49.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-perl/recipes-perl/po4a/po4a_0.49.bb

diff --git a/meta-perl/recipes-perl/po4a/po4a_0.49.bb b/meta-perl/recipes-perl/po4a/po4a_0.49.bb
new file mode 100644
index 0000000..e52e5f7
--- /dev/null
+++ b/meta-perl/recipes-perl/po4a/po4a_0.49.bb
@@ -0,0 +1,20 @@
+SUMMARY = "PO for anything"
+DESCRIPTION = "The po4a (PO for anything) project goal is to ease translations \
+(and more interestingly, the maintenance of translations) using gettext tools \
+on areas where they were not expected like documentation."
+HOMEPAGE = "https://po4a.alioth.debian.org"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a96fc9b4cc36d80659e694ea109f0325"
+
+SRC_URI = "git://alioth.debian.org/anonscm/git/po4a/po4a.git;protocol=https"
+
+# v0.49
+SRCREV = "79ed87a577a543538fe39c7b60079981f5997072"
+
+S = "${WORKDIR}/git"
+
+inherit cpan_build
+
+DEPENDS += "libmodule-build-perl-native"
+
+BBCLASSEXTEND = "native"
-- 
2.7.4


