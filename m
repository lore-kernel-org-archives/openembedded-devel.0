Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AF7DA6025F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Feb 2017 21:46:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v12Lk4oc014827
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 2 Feb 2017 13:46:05 -0800 (PST)
Received: from localhost.localdomain (128.224.56.212) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 2 Feb 2017 13:46:04 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Feb 2017 16:45:59 -0500
Message-ID: <20170202214559.4126-1-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] udisks2: add libxslt-native to DEPENDS for xsltproc to be in sysroot
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
X-List-Received-Date: Thu, 02 Feb 2017 21:46:06 -0000
Content-Type: text/plain

This started showing up recently on machines w/o xsltproc in
their path:

| checking for xsltproc... no
| configure: error: xsltproc is needed
| WARNING: udisks2/2.1.7-r0/temp/run.do_configure.29255:1 exit 1
| ERROR: Function failed: do_configure (log file is located at
| build/tmp/work/core2-64-overc-linux/udisks2/2.1.7-r0/temp/log.do_configure.29255)

Presumably the splitting of the sysroot made this happen more
frequently on such machines that didn't have a host install of the
xsltproc binary.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

diff --git a/meta-oe/recipes-support/udisks/udisks2_2.1.7.bb b/meta-oe/recipes-support/udisks/udisks2_2.1.7.bb
index fbf6701ac3ad..976d36a2ba99 100644
--- a/meta-oe/recipes-support/udisks/udisks2_2.1.7.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_2.1.7.bb
@@ -2,7 +2,7 @@ SUMMARY = "udisks provides dbus interfaces for disks and storage devices"
 LICENSE = "GPLv2+ & LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dd79f6dbbffdbc8e86b086a8f0c0ef43"
 
-DEPENDS = "acl libatasmart polkit libgudev dbus-glib glib-2.0 intltool-native gnome-common-native"
+DEPENDS = "acl libatasmart polkit libgudev dbus-glib glib-2.0 intltool-native gnome-common-native libxslt-native"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 
 RDEPENDS_${PN} = "acl"
-- 
2.11.0


