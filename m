Received: from mail-wg0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UV2wd-0005B5-NH
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Apr 2013 18:53:29 +0200
Received: by mail-wg0-f47.google.com with SMTP id j13so918357wgh.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2013 09:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=FTKdW25Pm9bxUMBERljl3S1IvKOJptnfimSrs4skycs=;
	b=BUzt/UOZiny3oj+bjXD3er+aBzvPoSdmzVrZzwaDy3wpj6b+Er/R2ogT2HiSXIM7Kh
	0G/sDGKsdnjcdEUYnPOJnvPGRd3Ig2ZmPwwL6iRUqcW6GuUaN3OEuJKNhafYccLdvlSl
	yRjPThbm4i9+wuhgzN0uifYOsM13VHcgow8vywzB2OyKqIgr40LgxVyaLB9jCgtLb4od
	U+hB3fqUAplsoeoOIjpHwA50brqY+MdVw76+Z6Zq1betEt2pumAITrccW2scmOObJbel
	hP87EYVTtetno3LYuRcCrB+Q/uuQwlXKImc95hRTI+wTZCgcj3fhKc8fCUj3ljA3fRJV
	Td1g==
X-Received: by 10.180.182.110 with SMTP id ed14mr66512419wic.6.1366821341493; 
	Wed, 24 Apr 2013 09:35:41 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id er1sm33432791wib.5.2013.04.24.09.35.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Apr 2013 09:35:40 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Apr 2013 17:32:42 +0100
Message-Id: <83aca51e5e0866d965d4d9f621cacb29c84a6875.1366821077.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1366821077.git.ross.burton@intel.com>
References: <cover.1366821077.git.ross.burton@intel.com>
In-Reply-To: <cover.1366821077.git.ross.burton@intel.com>
References: <cover.1366821077.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkz/rM69kU8u+CsnveFphD2s3EFWqJDRAzDxKWPS/A8rxU0VOnVUNuBgPvKM9VURHmUF7k/
Subject: [PATCH 1/2] libgnome-keyring: add (from oe-core)
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
X-List-Received-Date: Wed, 24 Apr 2013 16:53:50 -0000

This was in oe-core previously but it's not actually used by anything:
webkit-gtk claimed a false dependency and the new libsoup has removed all use of
gnome-keyring.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gnome-keyring/libgnome-keyring_2.32.0.bb        |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb

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
-- 
1.7.10.4



