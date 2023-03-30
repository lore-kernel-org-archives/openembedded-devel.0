Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6698C761AF
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 13:43:11 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.25395.1680183790630478153
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Mar 2023 06:43:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EltdI05f;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id h8so76671626ede.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 06:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680183789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MMpoN5rh+W6fE6eODOaQ8XfKJHqqhDC+lXAY8gBh8hI=;
        b=EltdI05f2TlQRZ3EIdnMsqRk/BZqOghbQvARorcKJmS6Sg5pCRc+lm1lbpd8+F4o7R
         PNQiRJDPIKGA0B6P/R2a4W6i0BMSiVAaFcUyH6qmmH8vXusQ8Hqx2RewCRMvretK/6fR
         fchX3thX3dRczFiQcfdOExdV9+nAlK3CUbMImr05rwJ3vw4OTQ2VnMlwOI5P7czaFgv1
         f4ux+q/bTq4lnLd3V9dTTu/TBCxXcvyZY+JIDQ2pE5h6DWGmSo+vmpTnLUnIoq/ysbf2
         NhoKrLPIQuj9a2WTW7Lk2bEvJI6ikGFcRhJplN9f2QvDKrkTcplB6qrR+SowdpryWh0S
         1nQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680183789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MMpoN5rh+W6fE6eODOaQ8XfKJHqqhDC+lXAY8gBh8hI=;
        b=lgWKLUrv9qHtUndWw1HeVufyIt/0QZGnK1/PxaEoNVtX6W1GU+r78x2wng52SXo19k
         JKQFrzmETiGsHM1YW4CogLAxTuEfvd/ZOLmMwMv/z5t8GRofE2Jn4T0ahb1X2MKXV5Ux
         7fPuYNO1hwxPhPxiqkUFcBOR0oLNSiSeKH+laMPUU+CwadvpKxLFPhnutlnDGCayJSPF
         a68WPsciolNb6TjkyxOCXfQ+ISwFlTioS8ampV/RSpnrmWg1dS0HkpByg8xDIos9qBFD
         j9ucHwDTaKj2q/p6OvJMhRp9M6dSIH+tG0GrCh8sul76s4g36N4hgR0jrcOfb2wUzZ9d
         8+Sg==
X-Gm-Message-State: AAQBX9dKYqFZoT5JmyWk+jHM/79HS/3cd5rsID1tEdFj62y95j7v4/hw
	gqTSfVj0qhWe/QqXHlPRA8l7/ZlQ5vA=
X-Google-Smtp-Source: AKy350ajaHgG4MLAZP+ufyvh4RRc2m3QLMhovBe5Fs7FzNm8PPtLu94niHr3hfQ1ZjEgksVfv47Ahg==
X-Received: by 2002:a05:6402:45:b0:4ea:a9b0:a511 with SMTP id f5-20020a056402004500b004eaa9b0a511mr22751615edu.37.1680183788697;
        Thu, 30 Mar 2023 06:43:08 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id h5-20020a50c385000000b004f9e6495f94sm18388784edf.50.2023.03.30.06.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 06:43:08 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH 3/3] fprintd: New recipe
Date: Thu, 30 Mar 2023 15:43:02 +0200
Message-Id: <20230330134302.2789448-3-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330134302.2789448-1-zboszor@gmail.com>
References: <20230330134302.2789448-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 13:43:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101837

This is the DBus daemon that may be used for biometric authentication.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../0001-Make-building-tests-optional.patch   | 81 +++++++++++++++++++
 .../recipes-support/fprintd/fprintd_git.bb    | 51 ++++++++++++
 2 files changed, 132 insertions(+)
 create mode 100644 meta-oe/recipes-support/fprintd/fprintd/0001-Make-building-tests-optional.patch
 create mode 100644 meta-oe/recipes-support/fprintd/fprintd_git.bb

diff --git a/meta-oe/recipes-support/fprintd/fprintd/0001-Make-building-tests-optional.patch b/meta-oe/recipes-support/fprintd/fprintd/0001-Make-building-tests-optional.patch
new file mode 100644
index 000000000..5b1f3a2d2
--- /dev/null
+++ b/meta-oe/recipes-support/fprintd/fprintd/0001-Make-building-tests-optional.patch
@@ -0,0 +1,81 @@
+From 494df63b916bbf3ebf5e0bfc843a1b5298de63b6 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
+ <zboszor@gmail.com>
+Date: Thu, 30 Mar 2023 15:06:14 +0200
+Subject: [PATCH] Make building tests optional
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Submitted
+
+Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
+---
+ meson.build       | 10 +++++++++-
+ meson_options.txt |  4 ++++
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 859bcf2..2abdd1f 100644
+--- a/meson.build
++++ b/meson.build
+@@ -137,13 +137,16 @@ endif
+ polkit_policy_directory = polkit_gobject_dep.get_pkgconfig_variable('policydir')
+ 
+ # Tests dependencies
++if get_option('tests')
+ pam_wrapper_dep = dependency('pam_wrapper', required: false)
+ if get_option('pam') and not pam_wrapper_dep.found()
+     warning('Dependency "pam_wrapper" required by test suite not found')
+ endif
++endif
+ 
+ xmllint = find_program('xmllint', required: false)
+ python3 = find_program('python3') # No meson without it!
++if get_option('tests')
+ python3_test_modules = {
+     'cairo': true,
+     'dbus': true,
+@@ -159,6 +162,7 @@ foreach module, required : python3_test_modules
+         warning('Python3 module \'' + module + '\' required by test suite not found')
+     endif
+ endforeach
++endif
+ 
+ cdata = configuration_data()
+ cdata.set_quoted('GETTEXT_PACKAGE', meson.project_name())
+@@ -182,7 +186,9 @@ endif
+ if get_option('gtk_doc')
+     subdir('doc')
+ endif
+-subdir('tests')
++if get_option('tests')
++    subdir('tests')
++endif
+ subdir('po')
+ 
+ output = []
+@@ -205,6 +211,8 @@ output += '  Manuals: ' + get_option('man').to_string()
+ output += '  GTK Doc: ' + get_option('gtk_doc').to_string()
+ output += '  XML Linter ' + xmllint.found().to_string()
+ output += '\nTest setup:\n'
++if get_option('tests')
+ output += '  With address sanitizer: ' + address_sanitizer.to_string()
++endif
+ 
+ message('\n'+'\n'.join(output)+'\n')
+diff --git a/meson_options.txt b/meson_options.txt
+index 286889e..73b28f2 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -28,3 +28,7 @@ option('gtk_doc',
+     type: 'boolean',
+     value: false,
+     description: 'Use gtk-doc to build documentation')
++option('tests',
++    type: 'boolean',
++    value: true,
++    description: 'Run tests')
+-- 
+2.39.2
+
diff --git a/meta-oe/recipes-support/fprintd/fprintd_git.bb b/meta-oe/recipes-support/fprintd/fprintd_git.bb
new file mode 100644
index 000000000..6d8e69bd3
--- /dev/null
+++ b/meta-oe/recipes-support/fprintd/fprintd_git.bb
@@ -0,0 +1,51 @@
+SUMMARY = "Daemon for fingerprint readers"
+DESCRIPTION = "fprintd is a D-Bus daemon that offers libfprint \
+functionality over the D-Bus interprocess communication bus."
+HOMEPAGE = "https://www.freedesktop.org/wiki/Software/fprint/fprintd/"
+
+DEPENDS = " \
+	intltool-native glib-2.0 glib-2.0-native \
+	dbus-glib dbus-glib-native \
+	libpam libxslt libxslt-native libfprint polkit \
+"
+
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1f6f1c0be32491a0c8d2915607a28f36"
+
+#PR = "r1"
+
+# This is current master, the submitted patch does not apply to v1.94.2
+SRCREV = "09a3e5cf496e0ba0fe274003532c761e518fdfea"
+PV = "1.94.2"
+
+SRC_URI = " \
+	git://anongit.freedesktop.org/git/libfprint/fprintd.git;branch=master;protocol=https \
+	file://0001-Make-building-tests-optional.patch \
+"
+
+S = "${WORKDIR}/git"
+
+inherit meson pkgconfig gettext systemd
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
+
+PACKAGECONFIG[pam] = "-Dpam=true -Dpam_modules_dir=${libdir}/security,-Dpam=false,libpam"
+
+EXTRA_OEMESON = "-Dtests=false -Dgtk_doc=false -Dsystemd_system_unit_dir=${systemd_system_unitdir} -Dpam_modules_dir=${base_libdir}/security"
+
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE:${PN} = "fprintd.service"
+
+PACKAGES =+ "${PN}-pam ${PN}-conf"
+
+FILES:${PN}-pam = "${base_libdir}/security/pam_fprintd.so"
+
+FILES:${PN}-conf = "${sysconfdir}/fprintd.conf"
+
+FILES:${PN} += " \
+	${datadir}/dbus-1/ \
+	${datadir}/polkit-1/ \
+"
+
+FILES:${PN}-dev = "${base_libdir}/security/*.la"
+FILES:${PN}-staticdev += "${base_libdir}/security/*.a"
-- 
2.39.2


