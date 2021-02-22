Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.web09.37990.1614012011865785671
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Feb 2021 08:40:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@cisco.com header.s=iport header.b=ZbnGhau+;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=4508; q=dns/txt; s=iport;
  t=1614012011; x=1615221611;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=D5kF5r5WM9zHscT+/LHn/lIeIMkio+utkLY609HeJRs=;
  b=ZbnGhau+MqCZfcS1dNWtopIel2YqBZQZNCFfwHB9tm45K8Z7iV7WD2ts
   k+t4NCTMxOOZxtdiWwP//S0yGjeFmbgEHfwG6sw4ChkWesgSDaMLyILVy
   lSMP8oBUV/5KTCt1IOD+/8WFivO0AXy8V51rhsWhBpiF41LXvIJoQG11u
   o=;
X-IronPort-AV: E=Sophos;i="5.81,197,1610409600"; 
   d="scan'208";a="839726754"
Received: from alln-core-12.cisco.com ([173.36.13.134])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 22 Feb 2021 16:40:11 +0000
Received: from sjc-ads-8148.cisco.com (sjc-ads-8148.cisco.com [171.68.208.186])
	by alln-core-12.cisco.com (8.15.2/8.15.2) with ESMTPS id 11MGeAmG032744
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 22 Feb 2021 16:40:10 GMT
Received: by sjc-ads-8148.cisco.com (Postfix, from userid 500841)
	id 4DAE6CC1251; Mon, 22 Feb 2021 08:40:10 -0800 (PST)
From: "Oleksiy Obitotskyy" <oobitots@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksiy Obitotskyy <oobitots@cisco.com>
Subject: [PATCH] smartmontools: Improve reproducibility
Date: Mon, 22 Feb 2021 08:40:07 -0800
Message-Id: <20210222164007.23254-1-oobitots@cisco.com>
X-Mailer: git-send-email 2.26.2.Cisco
MIME-Version: 1.0
X-Outbound-SMTP-Client: 171.68.208.186, sjc-ads-8148.cisco.com
X-Outbound-Node: alln-core-12.cisco.com
Content-Transfer-Encoding: 8bit

Backport changes added to master smartmontools.
https://github.com/smartmontools/smartmontools/commit/24838916b4c0e91f5c897d44fcdeedb22848f684

Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
---
 ...Define-SOURCE_DATE_EPOCH-in-CPPFLAGS.patch | 84 +++++++++++++++++++
 .../smartmontools/smartmontools_7.2.bb        |  1 +
 2 files changed, 85 insertions(+)
 create mode 100644 meta-oe/recipes-extended/smartmontools/files/0001-configure.ac-Define-SOURCE_DATE_EPOCH-in-CPPFLAGS.patch

diff --git a/meta-oe/recipes-extended/smartmontools/files/0001-configure.ac-Define-SOURCE_DATE_EPOCH-in-CPPFLAGS.patch b/meta-oe/recipes-extended/smartmontools/files/0001-configure.ac-Define-SOURCE_DATE_EPOCH-in-CPPFLAGS.patch
new file mode 100644
index 000000000..87c0e1458
--- /dev/null
+++ b/meta-oe/recipes-extended/smartmontools/files/0001-configure.ac-Define-SOURCE_DATE_EPOCH-in-CPPFLAGS.patch
@@ -0,0 +1,84 @@
+From b621a313e0bc67803abfba18e1ae15e7a8b9b59f Mon Sep 17 00:00:00 2001
+From: Oleksiy Obitotskyy <oobitots@cisco.com>
+Date: Mon, 22 Feb 2021 17:21:33 +0200
+Subject: [PATCH] smartmontools: Improve reproducibility
+
+Backport changes added to master smartmontools.
+https://github.com/smartmontools/smartmontools/commit/24838916b4c0e91f5c897d44fcdeedb22848f684
+
+Upstream-Status: Backported
+Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
+---
+ ChangeLog    |  8 ++++++++
+ configure.ac | 12 ++++++++++++
+ utility.cpp  | 10 ++++++++++
+ 3 files changed, 30 insertions(+)
+
+diff --git a/ChangeLog b/ChangeLog
+index 39eac2d..6a3b4ee 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,5 +1,13 @@
+ $Id: ChangeLog 5155 2020-12-30 16:49:18Z chrfranke $
+ 
++2021-02-07  Christian Franke  <franke@computer.org>
++
++	Improve reproducibility if SOURCE_DATE_EPOCH if set (GH pull/89).
++	configure.ac: Define SOURCE_DATE_EPOCH in CPPFLAGS.
++	utility.cpp: Print SOURCE_DATE_EPOCH value if specified.
++	Don't include configure arguments then.
++	cppcheck.sh: Silence related 'ConfigurationNotChecked' message.
++
+ 2020-12-30  Christian Franke  <franke@computer.org>
+ 
+ 	smartmontools 7.2
+diff --git a/configure.ac b/configure.ac
+index ee6f0e5..c37c9bc 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -61,6 +61,18 @@ case "${host}" in
+     ;;
+ esac
+ 
++AC_MSG_CHECKING([whether reproducible build is selected (SOURCE_DATE_EPOCH)])
++res=no
++if test -n "$SOURCE_DATE_EPOCH"; then
++  res=yes
++  test -z "`echo "$SOURCE_DATE_EPOCH" | sed 's,[[0-9]]*,,'`" || res=error
++fi
++AC_MSG_RESULT([$res])
++case $res in
++  error) AC_MSG_ERROR([Malformed SOURCE_DATE_EPOCH]) ;;
++  yes) CPPFLAGS="${CPPFLAGS}${CPPFLAGS:+ }-DSOURCE_DATE_EPOCH=$SOURCE_DATE_EPOCH" ;;
++esac
++
+ # Check for SVN.
+ AC_MSG_CHECKING([whether this is a build from SVN])
+ is_svn_build=no
+diff --git a/utility.cpp b/utility.cpp
+index 0483c6f..8ab38c9 100644
+--- a/utility.cpp
++++ b/utility.cpp
+@@ -134,9 +134,19 @@ std::string format_version_info(const char * prog_name, bool full /*= false*/)
+ #endif
+                                                           "\n"
+     "smartmontools configure arguments:"
++#ifdef SOURCE_DATE_EPOCH
++                                      " [hidden in reproducible builds]\n"
++    "reproducible build SOURCE_DATE_EPOCH: "
++#endif
+   ;
++#ifdef SOURCE_DATE_EPOCH
++  char ts[32]; struct tm tmbuf;
++  strftime(ts, sizeof(ts), "%Y-%m-%d %H:%M:%S", time_to_tm_local(&tmbuf, SOURCE_DATE_EPOCH));
++  info += strprintf("%u (%s)", (unsigned)SOURCE_DATE_EPOCH, ts);
++#else
+   info += (sizeof(SMARTMONTOOLS_CONFIGURE_ARGS) > 1 ?
+            SMARTMONTOOLS_CONFIGURE_ARGS : " [no arguments given]");
++#endif
+   info += '\n';
+ 
+   return info;
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/smartmontools/smartmontools_7.2.bb b/meta-oe/recipes-extended/smartmontools/smartmontools_7.2.bb
index 3c01e589c..cd9793359 100644
--- a/meta-oe/recipes-extended/smartmontools/smartmontools_7.2.bb
+++ b/meta-oe/recipes-extended/smartmontools/smartmontools_7.2.bb
@@ -16,6 +16,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/smartmontools/smartmontools-${PV}.tar.gz \
            file://initd.smartd \
            file://smartmontools.default \
            file://smartd.service \
+           file://0001-configure.ac-Define-SOURCE_DATE_EPOCH-in-CPPFLAGS.patch \
            "
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'libcap-ng selinux', d)}"
-- 
2.25.1

