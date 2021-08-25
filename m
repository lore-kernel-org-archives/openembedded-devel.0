Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.22951.1629931435376884684
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Aug 2021 15:43:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=ZyKtCRe7;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: eahariha@linux.microsoft.com)
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 68C4420B8604
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Aug 2021 15:43:54 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 68C4420B8604
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1629931434;
	bh=ps3Bz2b0mkkGp0ps6QsxEGc1353TkEcafHq6wEEasEs=;
	h=From:To:Subject:Date:From;
	b=ZyKtCRe7JNQ8yDwN4RN/v/GI11mOP7FYUR0ZTNA8sU8sE2A9gKHFKncpKCiN4V/9W
	 1f3hn1dC5AnArEr3pPi4wOBJ9BZVJxJ8SuPGXp29rrqGxbMsrUa5EcfxZCoMdcKWiG
	 dre1yYq4/uFt/H6aBYrcal4G6EDlE+z5UlETfTIM=
From: eahariha@linux.microsoft.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] chrony: Fix privdrop packageconfig
Date: Wed, 25 Aug 2021 15:43:41 -0700
Message-Id: <1629931421-18317-1-git-send-email-eahariha@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1

From: Easwar Hariharan <easwar.hariharan@microsoft.com>

To drop root privileges on Linux-based systems, chrony requires a
standard user to switch to and the use of capabilities. Fix up the
privdrop packageconfig to account for this.

Signed-off-by: Easwar Hariharan <easwar.hariharan@microsoft.com>
---
 meta-networking/recipes-support/chrony/chrony_4.1.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/chrony/chrony_4.1.bb b/meta-networking/recipes-support/chrony/chrony_4.1.bb
index 6a450c3..f009bae 100644
--- a/meta-networking/recipes-support/chrony/chrony_4.1.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.1.bb
@@ -47,6 +47,11 @@ DEPENDS = "pps-tools"
 #       chrony does not use GNU Autotools.
 inherit update-rc.d systemd
 
+# Add chronyd user if privdrop packageconfig is selected
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'privdrop', 'useradd', '', d)}
+USERADD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'privdrop', '${PN}', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'privdrop', '--system -d / -M --shell /bin/nologin chronyd;', '', d)}"
+
 # Configuration options:
 # - For command line editing support in chronyc, you may specify either
 #   'editline' or 'readline' but not both.  editline is smaller, but
@@ -68,7 +73,7 @@ PACKAGECONFIG ??= "editline \
 PACKAGECONFIG[readline] = "--without-editline,--without-readline,readline"
 PACKAGECONFIG[editline] = ",--without-editline,libedit"
 PACKAGECONFIG[sechash] = "--without-tomcrypt,--disable-sechash,nss"
-PACKAGECONFIG[privdrop] = ",--disable-privdrop,libcap"
+PACKAGECONFIG[privdrop] = "--with-libcap,--disable-privdrop --without-libcap,libcap"
 PACKAGECONFIG[scfilter] = "--enable-scfilter,--without-seccomp,libseccomp"
 PACKAGECONFIG[ipv6] = ",--disable-ipv6,"
 PACKAGECONFIG[nss] = "--with-nss,--without-nss,nss"
@@ -97,6 +102,10 @@ do_install() {
     # Config file
     install -d ${D}${sysconfdir}
     install -m 644 ${WORKDIR}/chrony.conf ${D}${sysconfdir}
+    if ${@bb.utils.contains('PACKAGECONFIG', 'privdrop', 'true', 'false', d)}; then
+        echo "# Define user to drop to after dropping root privileges" >> ${D}${sysconfdir}/chrony.conf
+        echo "user chronyd" >> ${D}${sysconfdir}/chrony.conf
+    fi
 
     # System V init script
     install -d ${D}${sysconfdir}/init.d
-- 
1.8.3.1

