Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8124CC5516D
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 18:03:05 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18151.1785434584048547549
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jul 2026 11:03:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=luY5qUl3;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c9c26a5fb98so762292a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jul 2026 11:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785434583; x=1786039383; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u4YsMcBDw5PCJMXM8xz+HIBRR+5yluk3YkW0OG0wSQU=;
        b=luY5qUl37EL5U+rnH6dFcqTd1Df1bjUmAL4MXyaYzWkolcwvpXS+Vyg6Dosvg1zONO
         nzfRqEXIEyzcYY12H0m6afsbd+jCZquU16DvhMPvtIFtchsOgIgX0TbWprgp4e/XhGOC
         GdCfWcxFPv9Nspp+sG8sG5mOhcbWNS4QzOVGa1p/nO8yGjWRn8p0k98IitFhJ+jBX6mM
         bV/xm8zXKbUZhBkLamwludQIXT0lOkHD83j+wuLs5QK9ixJ3edL/tQSMd7lXIRkWJWP2
         10ud+OPuVj1Rp65w8oRLX93p64TfO4ZPd3QNqJxOVrdQkIgzNhbJuKmY6bcIdU+Ec+jK
         72/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785434583; x=1786039383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u4YsMcBDw5PCJMXM8xz+HIBRR+5yluk3YkW0OG0wSQU=;
        b=pb6JS0dNMdKdsfN64HlOThp9gepHyH77hyDggSCQCR8kqcM95aqC7XSI+5gRUkLw4Q
         N8tcTwcFd2yvzp53ndQdQKTP2yhWIuEnD5yNd0msBLvAdqDdFd5EO9mNYFGG+WF10Enm
         QYmJMecFszNjLN7/DUeEyDAO1cFoWW/FgPe6ADebDf7tWGqEqUx5xHXx2qlxpGO9DgA6
         5ZACW84uKWIFeAmEjDkQvIAWTIn1nVkdmHeTxStiKMJa76do0q4QEDHwqXOaBtknG6F7
         jvRcpfMm2Qi11hghYf9oA2/5hdYV0EIkkG/Qemk+ANUzClIpYi8SjHNwkPUyxz4i3pAj
         kFFw==
X-Gm-Message-State: AOJu0YyPqVTvevgAHWkRtqanvCJDOG8DqHeLtKVZpjhdA9I4/cn2b5Pi
	vMXja72Tj76K2TZ6ciPrfWk7bm2EWy4Bj22nDMuMNrmscsc62qZw5Po/6aNeBLmY
X-Gm-Gg: AR+sD131nGC/a/8SejX7jwtpw9XVacpjqDTdqvLtkGhPDdxvxSSsOGRyxxVLnxHvmGl
	mf7QoZR0uOZR5ovbn6qwVNRaAr4kwIhzDms5t94wSGEMd5BYpgv2RHsIy5OcL1jOdFrJQHU+Pfk
	zg08VwHXseYoZjkpSwyrTcH3Sqhv7CP/3PQYqkKN9ybm3NobHBjNabVb7Xz/cm5wf6fUj0bUShs
	uZyoDfOgej0YUJ2AhrgAQ4okmVBy0sV7bPI5kuxt87QbabXIBTgaZ0fL7irxCKBmItAiHM9vkKJ
	NTF1gahfQjJ+0jkKNhSav9XfnX21uaGFcKAm+5OnlVCwHV2L6Mu79Rj5cGJG4XSLPURp2JrvmRc
	Twr9iKto2h9l0TD748Jm2N75GZEx+B8IRE2blsTbgUKhQL50ET6r5XwSuP/wXYGb4uRit2ucXOl
	InHASoB5kbQCqpljQWzBTjqOoZvowbUUnsAawl/2VZktpHCqogpyC7npkhjRTjlz3aWZQDwa/8J
	588fm9RnQJ/QOYmPHMrTQvdKCecfk8A8sV2kLlknTx+H3nH+J9qsE3qeuYNvi5TigbKcppkUBdn
	Yn8XpqwqL9EOyRjgMTOabtuuiFs0UNVpuOB27guxTSrsHP0RR/VBSNSYLqQvJLxRwcm1y3nVR3x
	cPg==
X-Received: by 2002:a05:6300:6bc6:20b0:3c3:7195:fd47 with SMTP id adf61e73a8af0-3c90d9624e1mr687062637.24.1785434583023;
        Thu, 30 Jul 2026 11:03:03 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7265010esm24015408c88.6.2026.07.30.11.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 11:03:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-webserver][PATCH 3/4] webmin: upgrade 2.641 -> 2.653
Date: Thu, 30 Jul 2026 11:02:55 -0700
Message-ID: <20260730180257.3733387-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730180257.3733387-1-khem.raj@oss.qualcomm.com>
References: <20260730180257.3733387-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jul 2026 18:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128575

Upstream changes:
 * 2.650: new Systemd Services, GRUB 2, and Kea DHCP modules; WebSocket
   proxy support in Servers Index; Alpine Linux support; Let's Encrypt
   IP-based certificate support; editable SSH public keys in Users and
   Groups.
 * 2.651: Certbot certificate request/renewal fixes; fix live activation
   of Linux bond interfaces.
 * 2.652: global per-user ACL to block URL downloads from non-public IPs;
   fix hex HTML entity recognition; fix session checks with HMAC session
   keys; fix Usermin switching to use one-time login URLs.
 * 2.653: fix missing xmlrpc-lib.pl; fix partially installed Debian
   package listing; Authentic theme improvements.

Recipe changes:
 * Drop init-exclude.patch: both hunks (init/index.cgi commented-out
   runlevel loop and init/init-lib.pl exclude= support) are now
   incorporated in upstream webmin 2.653.
 * Refresh net-generic.patch: upstream added alpine-linux to the
   os_support line in net/module.info; refresh the patch context.
 * Refresh net-lib.pl.patch: context shifted by 4 lines with fuzz 1;
   refreshed against 2.653 (same fallback to debian-linux-lib.pl).
 * Remove webmin-openrc-init from do_install: webmin 2.653 ships a new
   webmin-openrc-init script that references /sbin/openrc-run, which is
   not available on systemd-based distros; remove the file to avoid an
   unresolvable RDEPENDS QA failure.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../webmin/files/net-generic.patch            | 24 +++++++++++++------
 .../webmin/files/net-lib.pl.patch             |  8 ++++---
 .../{webmin_2.641.bb => webmin_2.653.bb}      |  4 ++--
 3 files changed, 24 insertions(+), 12 deletions(-)
 rename meta-webserver/recipes-webadmin/webmin/{webmin_2.641.bb => webmin_2.653.bb} (98%)

diff --git a/meta-webserver/recipes-webadmin/webmin/files/net-generic.patch b/meta-webserver/recipes-webadmin/webmin/files/net-generic.patch
index cd9a522bb6..30f1d3dcc4 100644
--- a/meta-webserver/recipes-webadmin/webmin/files/net-generic.patch
+++ b/meta-webserver/recipes-webadmin/webmin/files/net-generic.patch
@@ -1,20 +1,30 @@
 Add support for configuring network interfaces on a generic linux system
 
+Refreshed for webmin 2.653 (upstream added alpine-linux to os_support).
+
 Upstream-Status: Inappropriate [config]
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+---
+ net/generic-linux-lib.pl | 2 ++
+ net/module.info          | 2 +-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/net/generic-linux-lib.pl b/net/generic-linux-lib.pl
+new file mode 100644
+--- /dev/null
++++ b/net/generic-linux-lib.pl
+@@ -0,0 +1,2 @@
++do 'linux-lib.pl';
++
+diff --git a/net/module.info b/net/module.info
 --- a/net/module.info
 +++ b/net/module.info
 @@ -1,6 +1,6 @@
  name=Networking
  category=net
--os_support=solaris coherent-linux redhat-linux/5.0-* mandrake-linux united-linux suse-linux/6.0-* open-linux unixware turbo-linux/4.0 freebsd/3.2-* openbsd debian-linux/2.2-* cobalt-linux/2.2-* msc-linux gentoo-linux macos/1.5-* trustix-linux slackware-linux/8.0-* openmamba-linux cygwin windows pardus-linux
-+os_support=generic-linux solaris coherent-linux redhat-linux/5.0-* mandrake-linux united-linux suse-linux/6.0-* open-linux unixware turbo-linux/4.0 freebsd/3.2-* openbsd debian-linux/2.2-* cobalt-linux/2.2-* msc-linux gentoo-linux macos/1.5-* trustix-linux slackware-linux/8.0-* openmamba-linux cygwin windows pardus-linux
+-os_support=solaris coherent-linux redhat-linux/5.0-* mandrake-linux united-linux suse-linux/6.0-* open-linux unixware turbo-linux/4.0 freebsd/3.2-* openbsd debian-linux/2.2-* cobalt-linux/2.2-* msc-linux gentoo-linux alpine-linux macos/1.5-* trustix-linux slackware-linux/8.0-* openmamba-linux cygwin windows pardus-linux
++os_support=generic-linux solaris coherent-linux redhat-linux/5.0-* mandrake-linux united-linux suse-linux/6.0-* open-linux unixware turbo-linux/4.0 freebsd/3.2-* openbsd debian-linux/2.2-* cobalt-linux/2.2-* msc-linux gentoo-linux alpine-linux macos/1.5-* trustix-linux slackware-linux/8.0-* openmamba-linux cygwin windows pardus-linux
  desc=Network Configuration
  longdesc=Configure boot time and active interfaces, DNS, routing and /etc/hosts.
  readonly=1
---- /dev/null
-+++ b/net/generic-linux-lib.pl
-@@ -0,0 +1,2 @@
-+do 'linux-lib.pl';
-+
diff --git a/meta-webserver/recipes-webadmin/webmin/files/net-lib.pl.patch b/meta-webserver/recipes-webadmin/webmin/files/net-lib.pl.patch
index 949525dfd7..cacd8c94f2 100644
--- a/meta-webserver/recipes-webadmin/webmin/files/net-lib.pl.patch
+++ b/meta-webserver/recipes-webadmin/webmin/files/net-lib.pl.patch
@@ -3,15 +3,17 @@ Upstream-Status: Inappropriate [config]
 XXX: need to work out a better fix.
 
 Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
+---
+ net/net-lib.pl | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 --- a/net/net-lib.pl
 +++ b/net/net-lib.pl
-@@ -38,7 +38,7 @@ elsif ($gconfig{'os_type'} eq 'debian-li
- 	$net_mode = "netplan";
+@@ -42,7 +42,7 @@ elsif ($auto_net_mode eq "dhcpcd") {
+ 	$net_mode = "dhcpcd";
  	}
  else {
 -	do "$gconfig{'os_type'}-lib.pl";
 +	do "debian-linux-lib.pl";
  	$net_mode = $gconfig{'os_type'};
  	}
- 
diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_2.641.bb b/meta-webserver/recipes-webadmin/webmin/webmin_2.653.bb
similarity index 98%
rename from meta-webserver/recipes-webadmin/webmin/webmin_2.641.bb
rename to meta-webserver/recipes-webadmin/webmin/webmin_2.653.bb
index b513ec14e6..a46c3aad16 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_2.641.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_2.653.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=0a6446108c96d0819d21e40b48109507"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://setup.sh \
-           file://init-exclude.patch \
            file://net-generic.patch \
            file://remove-startup-option.patch \
            file://disable-version-check.patch \
@@ -19,7 +18,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://mysql-config-fix.patch \
            file://webmin.service \
             "
-SRC_URI[sha256sum] = "220015eaff2b666b9bbdf2ce2bc676de72d33e5cc5f35b800b0fa14934bdb95a"
+SRC_URI[sha256sum] = "9acc680d3d45cee876f36fc8810ce68bb6e44a0365e245a4298a180e0d016696"
 UPSTREAM_CHECK_URI = "http://www.webmin.com/download.html"
 UPSTREAM_CHECK_REGEX = "webmin-(?P<pver>\d+(\.\d+)+).tar.gz"
 
@@ -91,6 +90,7 @@ do_install() {
         | tar --no-same-owner -xpf - -C ${D}${libexecdir}/webmin
 
     rm -f ${D}${libexecdir}/webmin/webmin-init
+    rm -f ${D}${libexecdir}/webmin/webmin-openrc-init
     rm -f ${D}${libexecdir}/webmin/ajaxterm/ajaxterm/configure.initd.gentoo
     rm -rf ${D}${libexecdir}/webmin/patches
 

