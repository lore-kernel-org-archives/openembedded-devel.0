Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.1144.1624497617032820545
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Jun 2021 18:20:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Ggh8g6sY;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1624497614; i=@fujitsu.com;
	bh=g7rxDdwAj5fLik/JwB9uJLa6AHZQVfvcn3w0m6B9CQM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Ggh8g6sY5x7U9nxoszd4Rpl/d3rzlUXSGiIadDsj/1oI5MrzoD06cAvU+2TbvKaYi
	 r7PuuO+DJnwkVRst/5N2/656kUCt+AUvUq25oj+ic1oQZwIjJhSEGuqxp+qiT+Dai1
	 SUF5T7qpPaGSmD+LA+py8dOWERFBJ4e+TqA0i6dS2EtDvmt3QP/uXH2vyXFLkTwjNB
	 pm7UCEtmGPNNgL+Dyp6YS8tA6ySnFT4f/FcnUmhEWobEeHP6WHpIytoVjGBSt8dVCE
	 sJjuNKrnhtTugcDs+wk3ZCCRJjKWWN+uSGj98U5jg5bbYPzrRjXR+imuqcW4NK/hKh
	 ptLBBw2iFzDFw==
Received: from [100.113.1.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id EF/C0-37841-DCDD3D06; Thu, 24 Jun 2021 01:20:13 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRWlGSWpSXmKPExsViZ8MRqnv27uU
  Eg5X7RC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oxVl26xF+wWqti+5CxjA+MO/i5GLg4hgdlM
  ErfW/GOGcE4wSmy9t4iti5GTg01ATWL6rRusILaIgL7E0tl7mEFsZgEViRe/e9hBbGGBWInld
  3cxgtgsAqoSz45PB6vnFXCSOPfpEVhcQkBBYsrD98wQcUGJkzOfsEDMkZA4+OIFM0SNosTsy8
  0sEHaFxOvDl5gnMPLOQtIyC0nLAkamVYyWSUWZ6RkluYmZObqGBga6hobGuga6RqZGeolVuol
  6qaW6yal5JUWJQFm9xPJiveLK3OScFL281JJNjMAQSylk+LODcfWbD3qHGCU5mJREeUvbLycI
  8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuDlvw2UEyxKTU+tSMvMAYY7TFqCg0dJhDcEJM1bXJCYW
  5yZDpE6xajLsfPovEXMQix5+XmpUuK8T0CKBECKMkrz4EbAYu8So6yUMC8jAwODEE9BalFuZg
  mq/CtGcQ5GJWHeNJApPJl5JXCbXgEdwQR0hMLviyBHlCQipKQamMQTiout+y3nToqa3lGTonX
  rqV3IxJfvvlhIr/t+JXelqabZcjeJE1/5zJ5ut80ofbt/f7TwPr2Zp/7e0fkQYdab5CsspZvt
  l/+t4Qrr3wdiN9Z6vcy0ftO/zK65f43cpslPmkoPtkv8tX72fFZ67vJ5y+3XWUQdVn3m5WFZk
  PNf9XdZ3uHOif+1b8nFdmpvKEsrikjPWz+9sdzWOJ5RzHrO9w28Gmp9x4OsWA9/23rAQ7v4jo
  7fksifFctPLHUNtngf2iAioCD6SWV1w+vg/g1fGBa8MuN4Zmv0pvdyeoFiFt87Y7vvEgdOct2
  9Jqbt3VtfIillE5KXd7D16neOQhmu19a2m49LmBh/mLRciaU4I9FQi7moOBEAD0oG1jgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-226.messagelabs.com!1624497612!76941!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19977 invoked from network); 24 Jun 2021 01:20:13 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-8.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Jun 2021 01:20:13 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15O1JwgO006819
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jun 2021 02:20:12 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 24 Jun 2021 02:19:56 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v2] samba: Solve the dependency problem when installing Samba
Date: Thu, 24 Jun 2021 09:19:35 +0800
Message-ID: <1624497575-83398-1-git-send-email-wangmy@fujitsu.com>
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
 .../samba/samba_4.14.5.bb                     | 22 +++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
index efaf4f2a15..82108842f6 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
@@ -39,7 +39,7 @@ SRC_URI[sha256sum] = "bb6ef5d2f16b85288d823578abc453d9a80514c42e5a2ea2c4e3c60dc4
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.14(\.\d+)+).tar.gz"
 
-inherit systemd waf-samba cpan-base perlnative update-rc.d
+inherit systemd waf-samba cpan-base perlnative update-rc.d perl-version
 
 # CVE-2011-2411 is valnerble only on HP NonStop Servers.
 CVE_CHECK_WHITELIST += "CVE-2011-2411" 
@@ -130,6 +130,18 @@ EXTRA_OECONF += "--enable-fhs \
 
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
+    oe_runmake -C ${S}/pidl
+}
+
 do_install_append() {
     for section in 1 5 7; do
         install -d ${D}${mandir}/man$section
@@ -195,6 +207,10 @@ do_install_append() {
     if [ -f "${D}${bindir}/samba-tool" ]; then
         sed -i -e 's,${PYTHON},/usr/bin/env python3,g' ${D}${bindir}/samba-tool
     fi
+
+    oe_runmake -C ${S}/pidl DESTDIR=${D} install_vendor
+    rm -rf ${D}${libdir}/perl5/${PERLVERSION}/${BUILD_SYS}/perllocal.pod
+    rm -rf ${D}${libdir}/perl5/vendor_perl/${PERLVERSION}/${BUILD_SYS}/auto/Parse/Pidl/.packlist
     
 }
 
@@ -301,7 +317,9 @@ FILES_smbclient = "${bindir}/cifsdd \
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

