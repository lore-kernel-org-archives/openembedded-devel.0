Received: from mail-we0-f172.google.com ([74.125.82.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UB2aX-0004Wn-EK
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Feb 2013 13:28:06 +0100
Received: by mail-we0-f172.google.com with SMTP id x10so1408312wey.31
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2013 04:11:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=YlxOHRAbP5kH87k/6MdVznoOzQYDf3t8iImVS08sL2s=;
	b=ihawA4oAIWNMT39afUU/Jb10R2g85QDwNeBGUiq0ATaN1iI+/2kSoJwEbALtWWzp0G
	ylW/nbc2HR6zt5sWZ+WWuaCr0tK1T/DXMCd8CrBEMyFhMm0xEtGAmoF4JHXDrko+SDPQ
	B+S2uxaJXJwi51vugta78qPmjidbO7G2b3JaCqzhM1clVnkST2hFCnYc8g6JNcDYuAiq
	XZ2+CcjRZkyYLNOzYISnM4MCL5LCee0z/84k0DrnJMMdG7bQRYbkJwig6R8hU9oKnghi
	99+g1kzLENQTFjAWNPfcc+YVC2umkI/way3HTy5wMB6wxIfzfgXre+pcZ6g9yWyybLOP
	rXxQ==
X-Received: by 10.180.109.82 with SMTP id hq18mr10233463wib.0.1362053491451;
	Thu, 28 Feb 2013 04:11:31 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id eo1sm32969583wib.8.2013.02.28.04.11.29
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 28 Feb 2013 04:11:30 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Feb 2013 12:09:01 +0000
Message-Id: <74932e637d2a8e2834db22f98a67cd6dc25ac415.1362053187.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1362053187.git.ross.burton@intel.com>
References: <cover.1362053187.git.ross.burton@intel.com>
In-Reply-To: <cover.1362053187.git.ross.burton@intel.com>
References: <cover.1362053187.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkpLrJfmo/Yo6aCz3lv2vAINNoFrJIltn0D4oV8oRIccbvnt9QEzhoygWqSKAS/M0F6vknF
Subject: [PATCH 2/3] clutter-box2d: add, from oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Feb 2013 12:28:15 -0000

This was removed from oe-core but it's still useful, so add it to meta-oe.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-graphics/clutter/clutter-box2d.inc    |   15 +++++++++++++++
 meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb |   14 ++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/clutter/clutter-box2d.inc
 create mode 100644 meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb

diff --git a/meta-oe/recipes-graphics/clutter/clutter-box2d.inc b/meta-oe/recipes-graphics/clutter/clutter-box2d.inc
new file mode 100644
index 0000000..056b091
--- /dev/null
+++ b/meta-oe/recipes-graphics/clutter/clutter-box2d.inc
@@ -0,0 +1,15 @@
+DESCRIPTION = "Clutter Box2D"
+HOMEPAGE = "http://www.clutter-project.org/"
+LICENSE = "LGPLv2.1+"
+
+# The main clutter lib is machine specific so we need to be too
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit autotools pkgconfig gtk-doc
+
+do_install_append () {
+	install -d ${D}${bindir}
+	install ${S}/examples/.libs/blockbox ${D}${bindir}
+}
+
+FILESPATH = "${FILE_DIRNAME}/clutter-box2d"
diff --git a/meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb b/meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb
new file mode 100644
index 0000000..d256a28
--- /dev/null
+++ b/meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb
@@ -0,0 +1,14 @@
+require clutter-box2d.inc
+
+LIC_FILES_CHKSUM = "file://box2d/License.txt;md5=e5d39ad91f7dc4692dcdb1d85139ec6b"
+
+SRCREV = "de5452e56b537a11fd7f9453d048ff4b4793b5a2"
+PV = "0.12.1+git${SRCPV}"
+PR = "r1"
+
+SRC_URI = "git://git.gnome.org/clutter-box2d.git"
+
+S = "${WORKDIR}/git"
+
+DEPENDS += "clutter-1.8"
+PROVIDES = "clutter-box2d-1.6"
-- 
1.7.10.4



