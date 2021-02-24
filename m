Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.1054.1614192039778220054
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Feb 2021 10:40:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57288 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lEz5R-0000Ak-39; Wed, 24 Feb 2021 20:40:38 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python2][PATCH] python-pygobject: Add version 2.28.7
Date: Wed, 24 Feb 2021 20:40:28 +0200
Message-Id: <20210224184028.28355-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Add version 2.28.7 without GI for backward compatibility with
legacy systems, for example LibreELEC Settings add-on for Kodi.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ct-0001-add-PYTHON_INCLUDES-override.patch | 32 ++++++++++++++++
 .../python/python-pygobject_2.28.7.bb         | 38 +++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 recipes-devtools/python/python-pygobject/pygobject-0001-add-PYTHON_INCLUDES-override.patch
 create mode 100644 recipes-devtools/python/python-pygobject_2.28.7.bb

diff --git a/recipes-devtools/python/python-pygobject/pygobject-0001-add-PYTHON_INCLUDES-override.patch b/recipes-devtools/python/python-pygobject/pygobject-0001-add-PYTHON_INCLUDES-override.patch
new file mode 100644
index 0000000..d883f60
--- /dev/null
+++ b/recipes-devtools/python/python-pygobject/pygobject-0001-add-PYTHON_INCLUDES-override.patch
@@ -0,0 +1,32 @@
+[PATCH] m4/python.m4: add PYTHON_INCLUDES override for cross compilation
+
+As the configure script mixes up host/target python. Equivalent to the
+similar code in dbus-python.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ m4/python.m4 |    4 ++++
+ 1 file changed, 4 insertions(+)
+
+Index: python-gobject-2.28.6/m4/python.m4
+===================================================================
+--- python-gobject-2.28.6.orig/m4/python.m4
++++ python-gobject-2.28.6/m4/python.m4
+@@ -43,6 +43,9 @@
+ [AC_REQUIRE([AM_PATH_PYTHON])
+ AC_MSG_CHECKING(for headers required to compile python extensions)
+ dnl deduce PYTHON_INCLUDES
++if test "${PYTHON_INCLUDES+set}" = set; then
++  AC_MSG_NOTICE([PYTHON_INCLUDES overridden to: $PYTHON_INCLUDES])
++else
+ py_prefix=`$PYTHON -c "import sys; sys.stdout.write(sys.prefix)"`
+ py_exec_prefix=`$PYTHON -c "import sys; sys.stdout.write(sys.exec_prefix)"`
+ PYTHON_CONFIG=`which $PYTHON`-config
+@@ -54,6 +57,7 @@
+   PYTHON_INCLUDES="$PYTHON_INCLUDES -I${py_exec_prefix}/include/python${PYTHON_VERSION}"
+ fi
+ fi
++fi
+ AC_SUBST(PYTHON_INCLUDES)
+ dnl check if the headers exist:
+ save_CPPFLAGS="$CPPFLAGS"
diff --git a/recipes-devtools/python/python-pygobject_2.28.7.bb b/recipes-devtools/python/python-pygobject_2.28.7.bb
new file mode 100644
index 0000000..c373328
--- /dev/null
+++ b/recipes-devtools/python/python-pygobject_2.28.7.bb
@@ -0,0 +1,38 @@
+DESCRIPTION = "Python GObject bindings"
+SECTION = "devel/python"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
+
+DEPENDS = "python-pygobject-native glib-2.0"
+PR = "ml0"
+
+inherit gnomebase autotools distutils-base pkgconfig
+
+SRCNAME="pygobject"
+SRC_URI = " \
+	http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz \
+	file://pygobject-0001-add-PYTHON_INCLUDES-override.patch \
+"
+SRC_URI[md5sum] = "ae48b60c690c4aa894e69e0c97802745"
+SRC_URI[sha256sum] = "bb9d25a3442ca7511385a7c01b057492095c263784ef31231ffe589d83a96a5a"
+S = "${WORKDIR}/pygobject-${PV}"
+
+FILESPATH = "${FILE_DIRNAME}/python-pygobject:${FILE_DIRNAME}/files"
+
+# necessary to let the call for python-config succeed
+export BUILD_SYS
+export HOST_SYS
+export STAGING_INCDIR
+export STAGING_LIBDIR
+
+PACKAGES += "${PN}-lib"
+
+RDEPENDS_${PN} += "python-textutils"
+
+FILES_${PN} = "${libdir}/python*"
+FILES_${PN}-lib = "${libdir}/lib*.so.*"
+FILES_${PN}-dev += "${bindir} ${datadir}"
+FILES_${PN}-dbg += "${libdir}/.debug"
+
+BBCLASSEXTEND = "native"
+PACKAGECONFIG_class-native = ""
-- 
2.17.1

