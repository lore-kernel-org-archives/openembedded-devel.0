Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgJyG-0000DF-Cc
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 19:45:25 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so2122427eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2012 10:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=+TkNfI3qYH0Wv3mWzjC3VOdLSZzWEGi6/3k7RrMwKU8=;
	b=nLrIBqQmEDQ865kvPVpnMTHFcSGegxHLV8MVAjGCiRbQn8elT6zj7Ee0MaRqc04Avl
	4OyRxw8Hp+yQ/uHLVCPgoPCkd+QAqIGEBlgVrOE3EeiDBEs8KhvvAR4O8Sg3rdk7FHZ+
	t2WZtwPRX5zbVmhlES5brF+YwJb/PZbpSymjzwg7JAImw435vbrtFWc4a9VEDypOganS
	/3FQwZ0QWT2oeTukekeyzG1kEY/MaVLRXNz/RodmX28t5DTrV0hlVtqk3Y74jjqWEfbl
	1kEwclbW4xC8pMPS83QyLIVOgGx3eQQL4LNYJZoqwQQr/Z1ZlGfBGYo4jYY+l3RpGqh0
	wh5g==
Received: by 10.14.199.5 with SMTP id w5mr37771742een.31.1354732260433;
	Wed, 05 Dec 2012 10:31:00 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 46sm10703050eeg.4.2012.12.05.10.30.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 10:30:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2012 19:30:26 +0100
Message-Id: <70ef34edf29d62cfc815aa5c70186026cb05c4cf.1354731625.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <bef5b1c61f91ea5f2b28a981c69a9ed35cf27d74.1354731625.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
	<bef5b1c61f91ea5f2b28a981c69a9ed35cf27d74.1354731625.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354731625.git.Martin.Jansa@gmail.com>
References: <cover.1354731625.git.Martin.Jansa@gmail.com>
Subject: [PATCH 68/77] systemd: add target python to depends
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
X-List-Received-Date: Wed, 05 Dec 2012 18:45:27 -0000

* pythonnative adds only python-native to DEPENDS, but we need target python for working python-config
checking for python-config... /OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/python-native/python-config
Traceback (most recent call last):
  File "/OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/python-native/python-config", line 24, in <module>
    pyver = sysconfig.get_config_var('VERSION')
  File "/OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/python2.7/distutils/sysconfig.py", line 602, in get_config_var
    return get_config_vars().get(name)
  File "/OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/python2.7/distutils/sysconfig.py", line 518, in get_config_vars
    func()
  File "/OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/python2.7/distutils/sysconfig.py", line 416, in _init_posix
    raise DistutilsPlatformError(my_msg)
distutils.errors.DistutilsPlatformError: invalid Python installation: unable to open /OE/jansa-test/shr-core/tmp-eglibc/sysroots/om-gta02/usr/lib/python2.7/config/Makefile (No such file or directory)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-systemd/recipes-core/systemd/systemd_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-systemd/recipes-core/systemd/systemd_git.bb
index 341e85d..9005abd 100644
--- a/meta-systemd/recipes-core/systemd/systemd_git.bb
+++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
 
 PROVIDES = "udev"
 
-DEPENDS = "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers usbutils glib-2.0 libgcrypt"
+DEPENDS = "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers usbutils glib-2.0 libgcrypt python"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SERIAL_CONSOLE ?= "115200 /dev/ttyS0"
@@ -19,7 +19,7 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r11"
+PR = "r12"
 
 # need to export these variables for python-config to work
 export BUILD_SYS
-- 
1.8.0



