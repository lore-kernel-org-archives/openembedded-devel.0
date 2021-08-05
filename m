Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web08.4349.1628133414642225642
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Aug 2021 20:16:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=iqC1V/cA;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1628133412; i=@fujitsu.com;
	bh=DtcV4kovC9qGK5/m3igZbxX77muywWdXUebqBrrZJ6o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=iqC1V/cAo/B8pcWI0JHKzKnazp/kBRgda0iv6PGiuxqYtH9iDZyffDrx6EAFimwv1
	 wPWAn77V4IMn5vr9uskPk0/4cAtPuXZYge7YOFdIBQOjulLI3pvbG3T9R2BWJF8Cnu
	 viBwWdp4jk2xPYvMYCHlvDchCYCGUz8cOOtn6hyuS80KXEai5cQHEghAXVwAV3sggb
	 y+oem+XfL1kl5T6ub5wIZs4y+qwPTbxJkBAdmSXZWNPYowgdBrUqyPEFMcuKMJJmN4
	 CPkSoCXPDUJm7BW/z3IFT4aIg2rqUHo53UqitXjZUvTv/A8lSzj5XlcIxTpOEc8wxR
	 9uiBMbUukrt4Q==
Received: from [100.112.195.193] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id EF/3C-07839-3285B016; Thu, 05 Aug 2021 03:16:51 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MRqqscwZ1
  ocOcIr8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnHxxQm2gp0cFY82XGNtYDzP3sXIxSEkMItJ
  4s78A6wQznFGiUX9n4AynBxsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N0DViMsYCmx79Rzs
  DgLUPxC6wIwm1fAUWLfm6tgvRICChJTHr6HigtKnJz5hAVijoTEwRcvmCFqFCVmX25mgbArJG
  bNamOawMg7C0nLLCQtCxiZVjFaJBVlpmeU5CZm5ugaGhjoGhoa6RpamuoaGZrqJVbpJuqlluq
  WpxaX6BrqJZYX6xVX5ibnpOjlpZZsYgQGWErB4es7GG+9/qB3iFGSg0lJlPeDBHeiEF9Sfkpl
  RmJxRnxRaU5q8SFGGQ4OJQneCaFAOcGi1PTUirTMHGCww6QlOHiURHiXhgGleYsLEnOLM9MhU
  qcYFaXEeQ3CgRICIImM0jy4NliEXWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzFsJMp4nM6
  8EbvoroMVMQIsvxHKCLC5JREhJNTDNC/m1Tv+E4NzdD9l3reIr7nizXVgvYBVzqJ7XNR0tteN
  uywU4fvHOnJfut2HJ00TlOct6vwVWMJ/P/PV3ZwFXqoApV8Gq5CsP5t6/O8v165LV27cpPe9p
  Pnt6z1EjqXSxCU4/ret0e5UsTCRsnPX+RH3W+nk3r/DtDMfEt1eXy047y6Dael0mQHfKH8cJ+
  Wbtu4U6lITOhxrttORjuxTm58K3S+fcTfmfGWkct/aE2zsaL353eXL2Kv29/0/5NHmqPNLUYr
  cNu7nITiP53ET1VlPO5I6uG3IT+2ueLtgW8uDlzBorRT3GVPGfv+ySTbLjPi4Vv7SNW3bj5Vf
  yBYf/Vj75x3c1drrN8airN84rsRRnJBpqMRcVJwIAqS7pyCsDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-271.messagelabs.com!1628133410!201749!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21277 invoked from network); 5 Aug 2021 03:16:51 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-7.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Aug 2021 03:16:51 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1753Gj1r026282
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 5 Aug 2021 04:16:50 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 5 Aug 2021 04:16:42 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] iwd: upgrade 1.15 -> 1.16
Date: Thu, 5 Aug 2021 11:16:31 +0800
Message-ID: <1628133391-4914-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-connectivity/iwd/{iwd_1.15.bb => iwd_1.16.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_1.15.bb => iwd_1.16.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.15.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.16.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/iwd/iwd_1.15.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_1.16.bb
index bb7538739..6bace616a 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.15.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.16.bb
@@ -8,7 +8,7 @@ DEPENDS = "ell"
 SRC_URI = "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch \
           "
-SRC_URI[sha256sum] = "a7ab8e80592da5cb1a8b651b6d41e87e4507a3f07e04246e05bca89c547af659"
+SRC_URI[sha256sum] = "af548398aea2089a3a5103e5586561f24791090a17d4b2e50785e2faab5ed03a"
 
 inherit autotools manpages pkgconfig python3native systemd
 
-- 
2.25.1

