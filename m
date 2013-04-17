Received: from mail-ye0-f182.google.com ([209.85.213.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mario.goulart@gmail.com>) id 1USWzW-0001Pc-AJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Apr 2013 20:22:26 +0200
Received: by mail-ye0-f182.google.com with SMTP id r5so299726yen.41
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Apr 2013 11:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=j+P9ApbsRDBdkXjsToPmsTq98AKOzRMi2oM6VMX7Q1Y=;
	b=Fl6a8cycOdtwthzlMHkgruRdTg6UZr1zHMuG4dcHtI89jBFhgRvXP86VEc1N4uPh8a
	IPuKcSOeMP70AqGRp4EoGkNeYqcK1lEmAkHFgivl4/Kh7hpNwuCr8SV8DjP9R5hyODpj
	NXT2teqj8xGe3wSoNW/Ul1h9zW/gqTDuyTL2VFQwphsZFcX4tRns1Im/fPoH4Ay+TfXS
	humNqIa0opolM1l/g1Lg986wmHR6+sn1UjlSOsrvWE95o8irk/vKxuSQAp6PmC9qtelz
	gbyHhverEWxt2HUX3a6BNCECkIXg4z0qUJYX7Un0/SZ0arLcUiIbtjhNQmiiUrtBRt+b
	iQYA==
X-Received: by 10.236.188.169 with SMTP id a29mr4784035yhn.131.1366221865972; 
	Wed, 17 Apr 2013 11:04:25 -0700 (PDT)
Received: from localhost.localdomain ([187.23.144.59])
	by mx.google.com with ESMTPS id s45sm11056187yhk.22.2013.04.17.11.04.23
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 17 Apr 2013 11:04:25 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Apr 2013 15:04:11 -0300
Message-Id: <1366221851-13863-1-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-gnome][PATCH v2] libgsf: update to version 1.14.26
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
X-List-Received-Date: Wed, 17 Apr 2013 18:23:02 -0000

Previous version was 1.14.21, but Gnumeric requires at least 1.14.24.
Since we are changing it, we pick the latest available version.

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb |   23 -------------------
 meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb |   25 +++++++++++++++++++++
 2 files changed, 25 insertions(+), 23 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb
 create mode 100644 meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb

diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb
deleted file mode 100644
index a4f1ec2..0000000
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "GNOME Structured File Library"
-LICENSE = "GPLv2 & LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=dc7371b50816c96e145fa0f8ade8e24d \
-                    file://COPYING.LIB;md5=61464cfe342798eeced82efe9ae55f63"
-
-PR = "r4"
-
-SECTION = "libs"
-
-DEPENDS= "libxml2 bzip2 glib-2.0 zlib"
-
-inherit autotools pkgconfig gnome gconf
-
-SRC_URI[archive.md5sum] = "2b702648b853402554c97d75405c60d3"
-SRC_URI[archive.sha256sum] = "eef0a9d6eca4e6af6c16b208947e3c958c428b94d22792bdd0b80c08a4b301db"
-
-EXTRA_OECONF = "\
-		--without-python \
-		--without-gnome-vfs --without-bonobo \
-		--disable-gtk-doc \
-		--with-bz2"
-
-RDEPENDS_${PN} = "gconf" 
diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb
new file mode 100644
index 0000000..286c28d
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "GNOME Structured File Library"
+LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=dc7371b50816c96e145fa0f8ade8e24d \
+                    file://COPYING.LIB;md5=61464cfe342798eeced82efe9ae55f63"
+
+SECTION = "libs"
+
+DEPENDS= "libxml2 bzip2 glib-2.0 zlib"
+
+inherit autotools pkgconfig gnome gconf
+
+SRC_URI[archive.md5sum] = "3c5a4fbd16a727c36974078e6d0e9575"
+SRC_URI[archive.sha256sum] = "8919e725aadd785380350c8dec7427d82cf33164bc9a9a549df9440a0c3da6d5"
+
+GNOME_COMPRESS_TYPE = "xz"
+
+EXTRA_OECONF = "\
+		--without-python \
+		--without-gnome-vfs --without-bonobo \
+		--disable-gtk-doc \
+		--with-bz2"
+
+RDEPENDS_${PN} = "gconf"
+
+FILES_${PN} += "${datadir}/thumbnailers"
-- 
1.7.2.5



