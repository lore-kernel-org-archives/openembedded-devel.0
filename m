Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UV4E9-0005Yg-KY
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Apr 2013 20:15:39 +0200
Received: by mail-wi0-f171.google.com with SMTP id l13so7665012wie.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2013 10:57:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=BXWXgTgLbpevr3+otYsiqHt/ml0ILgp9CyRnTd034Qc=;
	b=bzTtQdSKteZxYKUHizbDqeXuuKogpB9GZToyHiAxJNvpXofhUjJnOikvRItxEEnZNN
	QiSSxBy8+pksyX+kIJZkgUoU1Xw6DLjdMeBLiTNC98GpFTTEMcRifr51s+P957BOAP3m
	uwXHYmDcDn+zVkBqU/ny9WSMp/WLH0Jughu6U944n2vhp1wpZfIbKHOtz2HBKHjFvfdv
	cJepQrK7vZnwAMAEymX3FJsi7PYaxDtLGctIXMmVPSskyk7/OZ5MVXFEdAb7hjHlsxWM
	Gmpk2m47UJ4YwK7VfpPuh0CgZH9trWr2uiQMpdBhNtlwPjgkQpIN5GVje0E5EKa/1ukz
	5GFQ==
X-Received: by 10.194.240.132 with SMTP id wa4mr16299551wjc.52.1366826269938; 
	Wed, 24 Apr 2013 10:57:49 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id nf9sm16251175wic.3.2013.04.24.10.57.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Apr 2013 10:57:49 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Apr 2013 18:54:55 +0100
Message-Id: <1366826095-26594-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQm2N+7tQ3X4bBw3aWztE3knkwM9oQi1xHcGNbVfow+d2/noWA4Ytd99f0dUdXX0rF7fh+I3
Subject: [PATCH][V2][meta-gnome] libgnome-keyring: add (from oe-core)
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
X-List-Received-Date: Wed, 24 Apr 2013 18:15:53 -0000

This was in oe-core previously but it's not actually used by anything:
webkit-gtk claimed a false dependency and the new libsoup has removed all use of
gnome-keyring.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gnome-keyring/libgnome-keyring_2.32.0.bb        |   19 +++++++++++++++++++
 .../libgnome/libgnome-keyring_2.32.0.bb             |   12 ------------
 2 files changed, 19 insertions(+), 12 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb
 delete mode 100644 meta-gnome/recipes-gnome/libgnome/libgnome-keyring_2.32.0.bb

diff --git a/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb
new file mode 100644
index 0000000..8ed44f3
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Compatibility library for accessing secrets"
+HOMEPAGE = "http://www.gnome.org/"
+BUGTRACKER = "https://bugzilla.gnome.org/"
+
+LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0914b9d3ebaba41ef2e3e0ae16f296cf \
+                    file://library/gnome-keyring.h;endline=25;md5=68ea64f81c160d670c37da5f137be4fb \
+                    file://library/gnome-keyring.c;endline=26;md5=8d7a4fb674aaa012ea5a98e7c368b4a5 \
+                    file://egg/egg-dh.h;endline=22;md5=1626c16af2a8da1f88324cf3ced33f08"
+
+SECTION = "x11/gnome/libs"
+PR = "r3"
+
+inherit gnome gtk-doc
+
+DEPENDS = "dbus libgcrypt glib-2.0 intltool-native"
+
+SRC_URI[archive.md5sum] = "c42b2ca66204835d901d3dbfc1fa5ae6"
+SRC_URI[archive.sha256sum] = "56388c0d81ddfdb57d30e4963c83ecc1c18498aab99395420e0fff69929a0f0c"
diff --git a/meta-gnome/recipes-gnome/libgnome/libgnome-keyring_2.32.0.bb b/meta-gnome/recipes-gnome/libgnome/libgnome-keyring_2.32.0.bb
deleted file mode 100644
index d71c782..0000000
--- a/meta-gnome/recipes-gnome/libgnome/libgnome-keyring_2.32.0.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION = "Gnome keyring library"
-LICENSE = "LGPLv2 & GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://COPYING;md5=0914b9d3ebaba41ef2e3e0ae16f296cf"
-
-SECTION = "x11/gnome"
-
-inherit gnome lib_package perlnative
-
-SRC_URI[archive.md5sum] = "c42b2ca66204835d901d3dbfc1fa5ae6"
-SRC_URI[archive.sha256sum] = "56388c0d81ddfdb57d30e4963c83ecc1c18498aab99395420e0fff69929a0f0c"
-
-- 
1.7.10.4



