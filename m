Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.5])
 by mx.groups.io with SMTP id smtpd.web12.79945.1629429500072283253
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Aug 2021 20:18:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=r7RP+kME;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.5, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629429496; i=@fujitsu.com;
	bh=XGIeGlxjOx4UQLmwvYlSlyTKE1MR0eeRNs4TtB9IdjQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=r7RP+kMEMIdRlA5eL7CbLa9ygmBAydiXF8oKMEB7+I1x99UGPKLWaK340iWQVPCu5
	 /p0BmJb/4ox9EZVzA7Elhs1TrjfRS75OSgcL5goaPGndJArXCshXJHdpnE6eqNUwhi
	 FlB/FqLt5CuNfRBdAqzz8xxodb+Ld9Rtj3lounZdfaR25QBWDENzq3y7wRNNmcdJ7L
	 uXBbeqyrm6OHuA26Sd2YAmIaVefn92MPzhv3JpMr1ildG/xGSA9Kf9q4ezM0hgACt7
	 gby0fNrOo7YhrAc3VXhARxBosSvEcuR0SegEbGKnSLPKCBYEwpiNCCRe7+YLOXO8hC
	 7kdgXlJz9XZUw==
Received: from [100.113.0.182] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-central-1.aws.symcld.net id 0D/99-17140-7FE1F116; Fri, 20 Aug 2021 03:18:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRWlGSWpSXmKPExsViZ8MxVfe7nHy
  iwcNWbYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWNey0vWgn2CFfO+3GNrYNzA38XIxSEkMJtJ
  4sP7F4wQzglGiQWn7rB1MXJysAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3DzuILSxgK7G5/
  y5YPYuAqsSUe19ZQGxeASeJtXvWgtVICChITHn4nhkiLihxcuYTFog5EhIHX7xghqhRlJh9uZ
  kFwq6QmDWrjWkCI+8sJC2zkLQsYGRaxWiZVJSZnlGSm5iZo2toYKBraGisa6xraGmil1ilm6i
  XWqqbnJpXUpQIlNVLLC/WK67MTc5J0ctLLdnECAyxlELmQzsYn7z+oHeIUZKDSUmU98YhuUQh
  vqT8lMqMxOKM+KLSnNTiQ4wyHBxKErzMwKAVEixKTU+tSMvMAYY7TFqCg0dJhDdcDCjNW1yQm
  FucmQ6ROsWoKCXOe1EWKCEAksgozYNrg8XYJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvI
  dApvBk5pXATX8FtJgJaLGQqizI4pJEhJRUA5Ps5s9zTdzqbV9I1vzmW9gXGzDF882G3+7yP5Y
  +DlnVE9zIf/HIo6laNRdNdU5N6vZcY6ZY/M3db3M8j9rRLuFm7/TeAxOs+/4cSnmvK/1KcOmO
  OOkHRzevbKvbfO3Q8WdK/JHTI5VDZ8gf+/yHuTz3WOX5wA0L4l/s9t+67diK2uiz1fk69ef2e
  DtXKC6QFXqxLUlWqfPyXPf1y7br1zX9XcYeesbuWMHFtGfRGoI/pP+lLcws1dpw6Q5jcv/h1P
  nsiSUCj6U91OINd//8NDd/P4NupWfjxYpvIXmBbR8L7z7k1vvMyL/a/Oj3rMDD81gElOemBLo
  ftmaMOvKpO03CcfHi/vu7Pe4le8+5uFeJpTgj0VCLuag4EQDU7CEcLAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-228.messagelabs.com!1629429495!42641!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10974 invoked from network); 20 Aug 2021 03:18:15 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-16.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Aug 2021 03:18:15 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17K3I3fi023652
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Aug 2021 04:18:15 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 20 Aug 2021 04:18:02 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] icewm: upgrade 2.6.0 -> 2.7.0
Date: Fri, 20 Aug 2021 11:17:46 +0800
Message-ID: <1629429466-45816-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Increase the maximum value for TaskbarButtonWidthDivisor from 25 to 50.
Add a --with-background= build option to set a default background path.
Improve the responsiveness of icewmbg when a new image must be scaled.
Reduce the memory usage by icewmbg by removing the image cache.
Make icewmbg much faster when scanning directories for image files.
Improve the reliability of icewm motion compression by also testing
for subwindow equality.
Decrease the number of system calls for path lookups.
Guard against array indexing with negative indices.
Double the timeout for the dynamic menu generator to 1.4 seconds.
Eliminate most of the inefficiences when looking for icon directories.
Postpone the loading of cursors, because some cursors are seldomly used.
Rewrite the task successor and task predecessor actions to properly
take into account the separation of TaskBarApp and TaskButton,
as well as task grouping. This resolves issues #602 and #604.
Allow to build icewm using cmake -GNinja (issue #603).
Fix building on a case-insensitive file system (issue #601).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/icewm/{icewm_2.6.0.bb => icewm_2.7.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/icewm/{icewm_2.6.0.bb => icewm_2.7.0.bb} (94%)

diff --git a/meta-oe/recipes-extended/icewm/icewm_2.6.0.bb b/meta-oe/recipes-extended/icewm/icewm_2.7.0.bb
similarity index 94%
rename from meta-oe/recipes-extended/icewm/icewm_2.6.0.bb
rename to meta-oe/recipes-extended/icewm/icewm_2.7.0.bb
index d736552177..a16dbd4145 100644
--- a/meta-oe/recipes-extended/icewm/icewm_2.6.0.bb
+++ b/meta-oe/recipes-extended/icewm/icewm_2.7.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4a26952467ef79a7efca4a9cf52d417b"
 SRC_URI = "https://github.com/ice-wm/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.lz \
            file://0001-configure.ac-skip-running-test-program-when-cross-co.patch \
            "
-SRC_URI[sha256sum] = "33cc69ba1fb762d85cc2755a930d6cf1a7c23e33f736ef2ec01c59d612f9b2eb"
+SRC_URI[sha256sum] = "c56b1d0f5d8efa2af3e38003770eab9165289aa87bd8f1627819c7f93f9433a3"
 
 UPSTREAM_CHECK_URI = "https://github.com/ice-wm/${BPN}/releases"
 
-- 
2.25.1

