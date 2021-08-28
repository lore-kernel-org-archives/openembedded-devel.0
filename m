Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.3421.1630156884818620496
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Aug 2021 06:21:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=K7iS8hze;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1630156886;
  x=1661692886;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=iUgIN5ZkFMCDj29o3wBVk8VoGOKSy06GcVFM8zvNgwc=;
  b=K7iS8hzeVskGRQ0zGAWwScWAVFn4VUCkk8TbCZPRJiiLHPNt2L/Pgn0O
   UNrV5ttzfaMuozvWqigPVIAAnCS0FHOMDLUH3VsraYWRy2EZIpavvs3sE
   9veq8pKaFeZGUBr5wV+DQWdOFbytkbJxv8lz8gugqq3FEgkSAe8GNO+Y1
   MLxKsUwPYjAnrxBxnk0SNcmi4MYgd5yvVKkwW8E2rrLr98QQXfkcoy4hm
   H7JAou0y0mshvayvaKWKCfa+zCyCPgWHbyxZZ7JCPeeJMh+2jB9YNcl+A
   pJI5FlBI/eOy+YKHe3K3AVR6BVqKmEFO1nqrXbnY+A8MwNO+WiPALWE4I
   Q==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/2] gpsd: Do not install gpsd.hotplug unconditionally
Date: Sat, 28 Aug 2021 15:21:20 +0200
Message-ID: <20210828132120.26395-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20210828132120.26395-1-pkj@axis.com>
References: <20210828132120.26395-1-pkj@axis.com>
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

gpsd.hotplug is only needed if systemd is not used, in which case it
will be installed by scons.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.23.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.bb
index 98f0e67a8..aaf742929 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.bb
@@ -72,10 +72,6 @@ do_install:append() {
     install -d ${D}${sysconfdir}/default
     install -m 0644 ${S}/packaging/deb/etc_default_gpsd ${D}${sysconfdir}/default/gpsd.default
 
-    # Support for udev
-    install -d ${D}${nonarch_base_libdir}/udev
-    install -m 0755 ${S}/gpsd.hotplug ${D}${nonarch_base_libdir}/udev
-
     # Support for python
     install -d ${D}${PYTHON_SITEPACKAGES_DIR}/gps
     install -m 755 ${S}/gps/*.py ${D}${PYTHON_SITEPACKAGES_DIR}/gps
