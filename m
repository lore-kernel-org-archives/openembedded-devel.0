Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.3])
 by mx.groups.io with SMTP id smtpd.web12.6462.1616058551910988024
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Mar 2021 02:09:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.3, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
Received: from [100.112.192.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.symcld.net id 49/EB-24644-6B813506; Thu, 18 Mar 2021 09:09:10 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCIsWRWlGSWpSXmKPExsViZ8MRqrtNIjj
  BYMMZJouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePmpT0sBec4KvZNX8TcwNjI0cXIySEksIVJ
  YtLplC5GLiD7BKPE4s4HbCAJNgF9iYb3r5hBbBEge+nsPWC2sECsxKG564FsDg4WAVWJL7fTQ
  MK8Ap4SExb2MoHYEgIKElMevmeGiAtKnJz5hAXEZhaQkDj44gUzRI2ixPadZ1hAxkgIVEkcma
  k2gZFnFpKOWUg6FjAyrWI0TyrKTM8oyU3MzNE1NDDQNTQ00jW0NNI1MdFLrNJN1Est1S1PLS7
  RNdRLLC/WK67MTc5J0ctLLdnECAyglIIDOjsYf776oHeIUZKDSUmU9y9/cIIQX1J+SmVGYnFG
  fFFpTmrxIUYZDg4lCd5MYEgKCRalpqdWpGXmAIMZJi3BwaMkwpstDpTmLS5IzC3OTIdInWLU5
  fiyaskiZiGWvPy8VClxXkOQGQIgRRmleXAjYJF1iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5
  IwbzXIKp7MvBK4Ta+AjmACOiKCPwjkiJJEhJRUA1Neq7lzwdpplbkPph2oD+E/ccm6q/y13YE
  5snlZjDxP7vEtkdYU5/jqvrvF7/SO5zZeJYZ/VTb3pxxbs2r1zO3K0ZNrXGSmLnUvXWi6SLGL
  s6xa2NJlfcRdqz9BWzqnWTas0Av5s17I88pOZndl4861RUENVZcZSs17IyJ12NW3BNnvlo+vZ
  H/Ib2xyncF+y42VB3v5ViqzLLaX41nWWBuZwqxyqcpojtIdwVnnY78+4imc8cBlRoLksbMFJ1
  8UhR75tfV2lmD1hI+Ft6w3al149bVxpukdpiPH88/63XyRnLhPLnX2V+19twoMXuoaTGLcNv9
  U2ulfOwTTUrP3phlGM3bf/2blkzfr8wE5VSWW4oxEQy3mouJEABnbESInAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-267.messagelabs.com!1616058549!38858!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32358 invoked from network); 18 Mar 2021 09:09:10 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-9.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Mar 2021 09:09:10 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12I999PJ026587
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Mar 2021 09:09:09 GMT
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 18 Mar 2021 09:09:08 +0000
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] wireguard-tools: upgrade 1.0.20210223 -> 1.0.20210315
Date: Fri, 19 Mar 2021 05:09:01 +0800
Message-ID: <1616101741-4884-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...rd-tools_1.0.20210223.bb => wireguard-tools_1.0.20210315.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-tools_1.0.20210223.bb => wireguard-tools_1.0.20210315.bb} (92%)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210223.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210315.bb
similarity index 92%
rename from meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210223.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210315.bb
index 4af7e3e669..f02303e0ea 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210223.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210315.bb
@@ -1,6 +1,6 @@
 require wireguard.inc
 
-SRCREV = "6d3b876492298d0e311053567ecd7084972a8bc8"
+SRCREV = "622408872fd6f3a58e98e88d39d30e98968314fa"
 SRC_URI = "git://git.zx2c4.com/wireguard-tools"
 
 inherit bash-completion systemd pkgconfig
-- 
2.25.1

