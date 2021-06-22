Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web12.3426.1624329233930121280
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jun 2021 19:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pdrr5VI3;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1624329231; i=@fujitsu.com;
	bh=368paJss9IY+3KB9AWocislU1yF3jd/ULkIFMektzV8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=pdrr5VI3TQEuOn2cvHUVaTtsF1PFjwZo5MNMNgwyHePvKrBo/lpwjNOOmDSVjWkWA
	 2ac2dqBQsrrzHk7sP9PhEjyQ+22dmRz+KnQODUxOJ6aVoAstDkJDt3tGD9TEwd5Wpp
	 LZzlyYuOkm/J7f3bt0QDQ3KZZ/ZsrMiMM2Xh5P2YDZa60rv6Qn6xDP5WYPT+ZSO0HB
	 ziKrT+8STuj99jutJold6I1yWbNtmwfAJ6auyYdajh535tUcR3NWvsWrcewbuwoIHt
	 y/6bqahvFQ4nkCkjNyJMEir0Z8/7ZgOykJAfWYLWkDaBg0gwKmAqnENmlHYIZtNrVF
	 t354L/nzwuHiQ==
Received: from [100.113.3.92] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id 4D/0E-19780-E0C41D06; Tue, 22 Jun 2021 02:33:50 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8MxVZfP52K
  Cwc7n8hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bi1Y9ZC3YLVRybsoK1gXEDfxcjF4eQwGwm
  iReL2hi7GDmBnBOMEjd2ZIHYbAJqEtNv3WAFsUUE9CWWzt7DDGIzC6hIvPjdww5iCwtESRx9s
  x2sl0VAVaLl5EIgm4ODV8BJYnOzAkhYQkBBYsrD92CtvAKCEidnPmGBGCMhcfDFC2aIGkWJ2Z
  ebWSDsConXhy8xT2DknYWkZRaSlgWMTKsYLZOKMtMzSnITM3N0DQ0MdA0NjXUNdY0MzPUSq3Q
  T9VJLdZNT80qKEoGyeonlxXrFlbnJOSl6eaklmxiB4ZVSyHh+B+PUNx/0DjFKcjApifIedL+Y
  IMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mC964XUE6wKDU9tSItMwcY6jBpCQ4eJRHeZpA0b3FBY
  m5xZjpE6hSjLsfOo/MWMQux5OXnpUqJ8+4GKRIAKcoozYMbAYu7S4yyUsK8jAwMDEI8BalFuZ
  klqPKvGMU5GJWEeQO8gabwZOaVwG16BXQEE9ARq9jOgRxRkoiQkmpgkijen6cetiF5veTkzdr
  54bd+LVH9//KFisJVxx+HV4o2cLhudC8+vebgviOrtY+XbHj6Os1m8ybVRy9K9YrrPT4w7nFd
  wVekOpt14qovkzw+P2taYxAWXR+Vs0vua+P/d9clddSWuXewqLXODVjFc9hhoXCZoO+JTbkmq
  hIpc1VjlpivXRfLm9nw67x5gXD4/sqZk7Mu3I/6Yt9Wsvn0lpDuel31K89amcvFJaccu/tR5N
  qP29Pmr2hYzBMSfPwX/5atCxgrTn1QXBAgqT7X835wlrrMzO8fa3q8r607su21v3W3/WKGFPt
  ft1awGop96Wx54yDI8G+emuicabntL48Vuv3KnD796OpJ7dqONkosxRmJhlrMRcWJAGdSWfo2
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-226.messagelabs.com!1624329229!34808!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7599 invoked from network); 22 Jun 2021 02:33:50 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-9.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Jun 2021 02:33:50 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15M2XgwN008868
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jun 2021 03:33:49 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Tue, 22 Jun 2021 03:33:40 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] samba: Solve the dependency problem when installing Samba
Date: Tue, 22 Jun 2021 10:33:18 +0800
Message-ID: <1624329198-77666-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Error Message:
 Problem: conflicting requests
  - nothing provides samba-pidl needed by samba-client-4.14.5-r0.aarch64

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../samba/samba_4.14.5.bb                     | 24 +++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
index efaf4f2a15..e0a4f0a8c7 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
@@ -39,7 +39,7 @@ SRC_URI[sha256sum] = "bb6ef5d2f16b85288d823578abc453d9a80514c42e5a2ea2c4e3c60dc4
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.14(\.\d+)+).tar.gz"
 
-inherit systemd waf-samba cpan-base perlnative update-rc.d
+inherit systemd waf-samba cpan-base perlnative update-rc.d perl-version
 
 # CVE-2011-2411 is valnerble only on HP NonStop Servers.
 CVE_CHECK_WHITELIST += "CVE-2011-2411" 
@@ -130,6 +130,19 @@ EXTRA_OECONF += "--enable-fhs \
 
 LDFLAGS += "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
+do_configure_append () {
+    cd ${S}/pidl/
+    perl Makefile.PL PREFIX=${prefix}
+    sed -e 's,VENDORPREFIX)/lib/perl,VENDORPREFIX)/${baselib}/perl,g' \
+        -e 's,PERLPREFIX)/lib/perl,PERLPREFIX)/${baselib}/perl,g' -i Makefile
+
+}
+
+do_compile_append () {
+    cd ${S}/pidl/
+    make
+}
+
 do_install_append() {
     for section in 1 5 7; do
         install -d ${D}${mandir}/man$section
@@ -195,6 +208,11 @@ do_install_append() {
     if [ -f "${D}${bindir}/samba-tool" ]; then
         sed -i -e 's,${PYTHON},/usr/bin/env python3,g' ${D}${bindir}/samba-tool
     fi
+
+    cd ${S}/pidl/
+    make DESTDIR=${D} install_vendor
+    rm -rf ${D}${libdir}/perl5/${PERLVERSION}/${BUILD_SYS}/perllocal.pod
+    rm -rf ${D}${libdir}/perl5/vendor_perl/${PERLVERSION}/${BUILD_SYS}/auto/Parse/Pidl/.packlist
     
 }
 
@@ -301,7 +319,9 @@ FILES_smbclient = "${bindir}/cifsdd \
                    ${libdir}/samba/smbspool_krb5_wrapper"
 
 RDEPENDS_${PN}-pidl_append = " perl"
-FILES_${PN}-pidl = "${bindir}/pidl ${datadir}/perl5/Parse"
+FILES_${PN}-pidl = "${bindir}/pidl \
+                    ${libdir}/perl5 \
+                   "
 
 RDEPENDS_${PN}-client = "\
     smbclient \
-- 
2.25.1

