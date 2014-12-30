Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id B8F0372624
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Dec 2014 13:54:42 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id w62so1051882wes.39
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Dec 2014 05:54:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6MZdlTVa0I6Otc6lhMaGBx3Kuzq17sjKhJdOuT3RpzA=;
	b=DMF2ZgxlajN99VEC44lQbVHx8FFaNRRqx5pzhvX9Zq4Y21Q2AdHRdlI10xHcAyxut1
	xf5IV2EK/EKukLPqVVIYsXXEpubjiSO4BkDV67MJ9wJROJEYnRFZpLd7luX8FhXWXy5w
	vWamd5zkmn5/3cN/L7Yo3RC/a7kf0stDW0TxQltpOsVZ0qvy1Zdkp1H0bdB98g+7WoQV
	X24Ne+VUxaIKPbfHa9Nt1x2w7eGvQhu7woxQ/YF+3dZ72uhVTPCv3D0M6d1SkEyVjnEC
	FJUXaeBMjxF2xKOd60SeqlovuhkYR5EVc6AajU8vpkI9GIRu49aYCr7I0dhMAMNq2Y8i
	WubA==
X-Gm-Message-State: ALoCoQl5d4HNncsXLdwbgVKgH9yQRGgrHHcajtTU0MfM3hSwVJjyX0bpdSPSMZdbyt3J5ApB7Up8
X-Received: by 10.194.63.51 with SMTP id d19mr89552419wjs.77.1419947682951;
	Tue, 30 Dec 2014 05:54:42 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	gb10sm28759925wjb.21.2014.12.30.05.54.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Dec 2014 05:54:42 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Dec 2014 13:53:33 +0000
Message-Id: <1419947615-27947-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1419947615-27947-1-git-send-email-ross.burton@intel.com>
References: <1419947615-27947-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/5] telepathy-idle: add (moved from oe-core)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Dec 2014 13:54:48 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../telepathy-idle/fix-svc-gtk-doc.h-target.patch     |   15 +++++++++++++++
 .../telepathy/telepathy-idle_0.2.0.bb                 |   17 +++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/telepathy/telepathy-idle/fix-svc-gtk-doc.h-target.patch
 create mode 100644 meta-oe/recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb

diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-idle/fix-svc-gtk-doc.h-target.patch b/meta-oe/recipes-connectivity/telepathy/telepathy-idle/fix-svc-gtk-doc.h-target.patch
new file mode 100644
index 0000000..2cd2c78
--- /dev/null
+++ b/meta-oe/recipes-connectivity/telepathy/telepathy-idle/fix-svc-gtk-doc.h-target.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Pending
+
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
+--- a/extensions/Makefile.am
++++ b/extensions/Makefile.am
+@@ -37,8 +37,8 @@ _gen/all.xml: all.xml $(wildcard $(srcdi
+ 		--xinclude $(tools_dir)/identity.xsl \
+ 		$< > $@
+ 
+-extensions.html: _gen/all.xml $(tools_dir)/doc-generator.xsl
++extensions.html _gen/svc-gtk-doc.h: _gen/all.xml $(tools_dir)/doc-generator.xsl
+ 	$(AM_V_GEN)$(XSLTPROC) $(XSLTPROCFLAGS) \
+ 		$(tools_dir)/doc-generator.xsl \
+ 		$< > $@
+ 
diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb b/meta-oe/recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb
new file mode 100644
index 0000000..ca09f6d
--- /dev/null
+++ b/meta-oe/recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Telepathy IRC connection manager"
+DESCRIPTION = "Telepathy implementation of the Internet Relay Chat protocols."
+HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
+DEPENDS = "glib-2.0 dbus telepathy-glib openssl libxslt-native"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
+                    file://src/idle.c;beginline=1;endline=19;md5=b06b1e2594423111a1a7910b0eefc7f9"
+
+SRC_URI = "http://telepathy.freedesktop.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
+           file://fix-svc-gtk-doc.h-target.patch"
+SRC_URI[md5sum] = "92a2de5198284cbd3c430b0d1a971a86"
+SRC_URI[sha256sum] = "3013ad4b38d14ee630b8cc8ada5e95ccaa849b9a6fe15d2eaf6d0717d76f2fab"
+
+inherit autotools pkgconfig pythonnative
+
+FILES_${PN} += "${datadir}/telepathy \
+                ${datadir}/dbus-1"
-- 
1.7.10.4


