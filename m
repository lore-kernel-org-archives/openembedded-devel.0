Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E02EC54EBE
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 05:26:38 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.16737.1673414796971615250
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jan 2023 21:26:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=L4Wmw3hZ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673414795; i=@fujitsu.com;
	bh=3JeBBnz8z2qixOAE5EeB6hRtCIrTQWepywXT/+GkSAU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=L4Wmw3hZKm9ROsBOXg7r8spEESyjWtF3bb9rx9LDtKaWZrUazQtBK4Bcbh9v9WoV7
	 i+5VK71YmHe+yO9pgZEpWApsWjKAkpDPatMhXWzkDGeB6eeUKCzGpqTmLWEB5CbbUX
	 ETnIeDSCvs50AUObx1msXiuOzOxt2z3qnLWilQ6H1n/KA/hpL/8lfhM0+2h4bSXU1M
	 RwOzHZV/GBdwB1ZOG+SwNVjek8H8uR/Oi8DFKra1+Eo5QcQq+Qg+4Xlh8UXe135Uhv
	 A2+xDtLIgss/69etvbu3UGi5ft2o5dhsshQMYN0SsMqCF++p5ir4SlCy5zOC6RWLCs
	 ++9lRqITRiH1w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8OxWbfLY1+
  ywZKjBhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bLSRcYC5o4Kx78uMnawLiYo4uRi0NI4CGj
  xMXz95kgnCtMEg+XbmSBcPYySnTc/cbYxcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAt8TqM2dYuxg5OFgEVCXOdoKV8Ao4SWx52AnWKiGgIDHl4XuwOKeAs0TTyR9grUJANR
  eWbGeEqBeUODnzCQvEeAmJgy9eMEP0KkrMvtzMAmFXSrR++AVlq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaFacWlSWWqRraK6XVJSZnlGSm5iZo5dYpZuol1qqW55aXKJrpJdYXqyXWlysV1yZm5yT
  opeXWrKJERi8KcWKCTsYDy37o3eIUZKDSUmUN09iX7IQX1J+SmVGYnFGfFFpTmrxIUYZDg4lC
  V4VV6CcYFFqempFWmYOMJJg0hIcPEoivLWOQGne4oLE3OLMdIjUKUZFKXFeZ3eghABIIqM0D6
  4NFr2XGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzMjsDTeHJzCuBm/4KaDET0OLDXXtBFpc
  kIqSkGpjycrJ/O5w6ZJC22rrg7d+nv651HDVLrtwV0io8USc/Yp5PX1KyeNRMOZmZcyM2rFLi
  Fejb/tKtX/hGB1fgJeENu9Ic9L+rtAqdumLIwbiE4WIQZ7tm75aDtz3sozfe9pua2xDMvqCv8
  uZVVREzt3dtfn8WvFt3Uli2V+SCcuvT3jXJL9xbn5Y5mMzbZFfRlVfo2Nq/20rcVH3e3zMdF3
  pUXv+fuiHfkOGNyFmvuB7/aW9/lv2J/DwvZ3aoqmyb6cId235xbX2eo7ygW108pSX+6XVjn+t
  SFQY+3+TvakXNFOVxd2CM2MZtuVO5zXr91V6Thp75waEyp5fcem53IE3tvEKbv+zLr/kTnpyv
  UGIpzkg01GIuKk4EAPRrlm1ZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-548.messagelabs.com!1673414794!55495!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29447 invoked from network); 11 Jan 2023 05:26:34 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-3.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Jan 2023 05:26:34 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 82094150
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:26:34 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 693F673
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:26:34 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 11 Jan 2023 05:26:33 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-ipython: upgrade 8.7.0 -> 8.8.0
Date: Wed, 11 Jan 2023 13:26:17 +0800
Message-ID: <1673414780-13856-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673414780-13856-1-git-send-email-wangmy@fujitsu.com>
References: <1673414780-13856-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:26:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100534

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_8.7.0.bb => python3-ipython_8.8.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_8.7.0.bb => python3-ipython_8.8.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.7.0.bb b/meta-python/recipes-devtools/python/python3-ipython_8.8.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-ipython_8.7.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_8.8.0.bb
index b5bb99b1b..5b3d85db0 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_8.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_8.8.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
-SRC_URI[sha256sum] = "882899fe78d5417a0aa07f995db298fa28b58faeba2112d2e3a4c95fe14bb738"
+SRC_URI[sha256sum] = "f3bf2c08505ad2c3f4ed5c46ae0331a8547d36bf4b21a451e8ae80c0791db95b"
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-setuptools \
-- 
2.25.1


