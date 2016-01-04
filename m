Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id ECE9E731C0
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 13:40:07 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id b14so185031225wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2016 05:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=abbSfBJ7BtjUUv0+cRXEG3o6WGUkS2d2eUROK9AIxzk=;
	b=gyPPSsiPJpvUxE8AjRya98RX2UqpLyy+zzooA5tUeyGtniTBLi66Fbvyp3kjmT9Ob0
	A6aNMYhDu4KWUXb0B5EE7lARPe450XrM/nniAd3DMI1YOw0iRpnqDnCNXfBQV9quv2I2
	QBWQfYYXecJNnOSCuea3XthqX4vydVltCgQ7gmgvoRYVZU/tpS8oNMeX+0RIPRnumTrd
	vxKI2wjgqIbvB/G0lbi3hZIS3N2MYObpK2YWjzK3HrxJ4p460Q4tmYyLg0jN34a09DF5
	AtlCGq2it+Nq5f0Hq4vextaEtH4qoiGRq6a1Mxpi2TD/U5BLGv9QkDFfuRb7FlC6rkr1
	J9xw==
X-Received: by 10.28.170.139 with SMTP id t133mr53228485wme.50.1451914808251; 
	Mon, 04 Jan 2016 05:40:08 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	xx3sm27290047wjc.32.2016.01.04.05.40.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Jan 2016 05:40:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Jan 2016 14:44:13 +0100
Message-Id: <1451915055-28243-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1451915055-28243-1-git-send-email-Martin.Jansa@gmail.com>
References: <1451915055-28243-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 2/4] pidgin*: blacklist because of gnutls upgrade
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
X-List-Received-Date: Mon, 04 Jan 2016 13:40:08 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb | 2 ++
 meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb    | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb b/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb
index 18dbe09..8518486 100644
--- a/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb
@@ -4,6 +4,8 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=92fe174bad6da3763f6e9e9eaff6df24"
 DEPENDS = "libgcrypt libotr pidgin intltool-native"
 
+PNBLACKLIST[pidgin-otr] = "depends on blacklisted pidgin"
+
 SRC_URI = "http://www.cypherpunks.ca/otr/${BP}.tar.gz \
            file://ignore_extra-portability_warnings.patch \
 "
diff --git a/meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb b/meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb
index b635352..ffc81a1 100644
--- a/meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb
@@ -6,6 +6,9 @@ DEPENDS = "python startup-notification avahi gtk+ ncurses gnutls virtual/libintl
 
 inherit autotools gettext pkgconfig gconf perlnative
 
+# http://errors.yoctoproject.org/Errors/Details/25824/
+PNBLACKLIST[pidgin] = "Not compatible with gnutls version 3.4 currently in oe-core"
+
 SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/pidgin/pidgin-${PV}.tar.bz2 \
     file://sanitize-configure.ac.patch \
-- 
2.6.4


