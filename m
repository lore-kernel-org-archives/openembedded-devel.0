Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web11.2180.1617244080117960553
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Mar 2021 19:28:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YQLbwVy5;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617244078; i=@fujitsu.com;
	bh=I+y7kcJFcO1hgABKom1vRbmL9xw7M/A/4jJ3/iCVaBU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=YQLbwVy56bkgLZfvw3ufy7xnBwnsRcAHcRpqE+eVaek2cz6++MdAzolc5Bn1XtKYY
	 RdNOnSr76IVnFmXVyo8C9aTxOSki1IYGCxvglA5ntWDBukf/o6/9HeMTBoy8UXEYW7
	 IpGOvEpl7xBj8wp3YAc3sE6BRqDEkTt0EKN7g+9WgnjrdEXQcyN8WXmkJoJgrX26fv
	 8nH5b4PKC1ri3qsbTRkt8PKm4LJ24ckZV4/UyK+zvyJWX+m837QPCGBxdMbNwLBn/j
	 Jx73kpAX71iFM8Qqr1IO3ifAzVC8eeIi4nE0nCfjExUd1CQ0Qwr9GQIfRgvZtkFCiC
	 DKTMwx1DdR7QA==
Received: from [100.113.6.195] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id 19/AF-23163-EAF25606; Thu, 01 Apr 2021 02:27:58 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeJIrShJLcpLzFFi42Kxs+EI1V2rn5p
  gML/NyuLi4aXMDowe5zauYAxgjGLNzEvKr0hgzZi9ZQljwXWOir69fSwNjC0cXYxcHEICW5kk
  /t64zALhHGeU+LW/namLkZODTUBHouNFNwuILSKgL7F09h5mEFtYwFriwu3/YDaLgIrE8s7DY
  DavgLvE07a77CC2hICCxJSH76HighInZz4Bm8MsICFx8MULZogaRYntO8+wQNhVEmdnf2GawM
  gzC0nLLCQtCxiZVjFaJhVlpmeU5CZm5ugaGhjoGhoa65rrGpka6SVW6SbppZbqJqfmlRQlAmX
  1EsuL9Yorc5NzUvTyUks2MQJDKaWQ/c8OxuuvP+gdYpTkYFIS5Z0yLSVBiC8pP6UyI7E4I76o
  NCe1+BCjDAeHkgTvY73UBCHBotT01Iq0zBxgWMOkJTh4lER4bTSA0rzFBYm5xZnpEKlTjIpS4
  rxcIH0CIImM0jy4NlgsXWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzCsDMoUnM68EbvoroM
  VMQIuvPEoEWVySiJCSamDSCbk+7c+SSdfs7k6rd70781v4k4mXrni5K0t/j22ryAzOkq9Itd9
  WXL7b8blmwbwm5Uv6qWsi5EXYbfSWnIysEZPvy9le1hylH193NP4p49T6SY9uPjDTO/yqYq+s
  r8r2zsq3D8x9svlT2F3/dk63bp3ft/TpaYaNX6xnTltgc/Wub3CxxiW3sOpdHQ+v2U1MWztN8
  aRRWhNfe/GmM9cXnl5ppS5asczrZPHOSzGyHlPETX11j7Wncj2VTbrSHKf2KHD3z7/G1ybld7
  5Ya/w0r/h2X1+ReMPn7Bm3N2YdVbP+5jEzbX3VVSGGfj+FLTfsfv/J4VrCynOLxepC9+1TkXs
  k7h5jk1CVPVWRPUOJpTgj0VCLuag4EQABMIWvIAMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-26.tower-248.messagelabs.com!1617244077!47699!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4016 invoked from network); 1 Apr 2021 02:27:57 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-26.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 1 Apr 2021 02:27:57 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1312Rvfw006058
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Apr 2021 03:27:57 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 1 Apr 2021 03:27:55 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] emacs: upgrade 27.1 -> 27.2
Date: Thu, 1 Apr 2021 10:27:49 +0800
Message-ID: <1617244069-91829-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 meta-oe/recipes-support/emacs/{emacs_27.1.bb => emacs_27.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/emacs/{emacs_27.1.bb => emacs_27.2.bb} (99%)

diff --git a/meta-oe/recipes-support/emacs/emacs_27.1.bb b/meta-oe/recipes-support/emacs/emacs_27.2.bb
similarity index 99%
rename from meta-oe/recipes-support/emacs/emacs_27.1.bb
rename to meta-oe/recipes-support/emacs/emacs_27.2.bb
index cfc089b3b..e3157ec42 100644
--- a/meta-oe/recipes-support/emacs/emacs_27.1.bb
+++ b/meta-oe/recipes-support/emacs/emacs_27.2.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://ftp.gnu.org/pub/gnu/emacs/emacs-${PV}.tar.xz"
 
 SRC_URI_append_class-target = " file://usemake-docfile-native.patch"
 
-SRC_URI[sha256sum] = "4a4c128f915fc937d61edfc273c98106711b540c9be3cd5d2e2b9b5b2f172e41"
+SRC_URI[sha256sum] = "b4a7cc4e78e63f378624e0919215b910af5bb2a0afc819fad298272e9f40c1b9"
 
 PACKAGECONFIG[gnutls] = "--with-gnutls=yes,--with-gnutls=no,gnutls"
 PACKAGECONFIG[kerberos] = "--with-kerberos=yes,--with-kerberos=no,krb5"
-- 
2.25.1

