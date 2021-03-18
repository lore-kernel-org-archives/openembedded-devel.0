Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.6337.1616058498410069938
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Mar 2021 02:08:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
Received: from [100.113.6.176] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 38/61-38008-08813506; Thu, 18 Mar 2021 09:08:16 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYqtsgEZx
  g0HpGyuLi4aXMDowe5zauYAxgjGLNzEvKr0hgzXh/9xVbwX6uikkTpjA1MN7j7GLk4hAS2MIk
  sfT2VdYuRk4g5wSjxLrTbiA2m4C+RMP7V8wgtgiQvXT2HjBbWCBU4tnH7ywgNouAqsTSjh/sI
  DavgKfE02WNTCC2hICCxJSH75kh4oISJ2c+AatnFpCQOPjiBTNEjaLE9p1ngOIcQHaVxJGZah
  MYeWYh6ZiFpGMBI9MqRsukosz0jJLcxMwcXUMDA11DQ2NdcyDLVC+xSjdJL7VUNzk1r6QoESi
  rl1herFdcmZuck6KXl1qyiREYRimF7Jk7GCe/+aB3iFGSg0lJlPcvf3CCEF9SfkplRmJxRnxR
  aU5q8SFGGQ4OJQleM3GgnGBRanpqRVpmDjCkYdISHDxKIrzZIGne4oLE3OLMdIjUKUZFKXHek
  2JACQGQREZpHlwbLI4uMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmrQYZz5OZVwI3/RXQYi
  agxRH8QSCLSxIRUlINTGeNA9N/pHHvsNIU41f+/X7e7KXH/wny3PA7+/2MN8dWU061xKlnuF7
  0OjH3xF1kj/Se/D6CQfPZGjczvmDBWe9Ezqzftibvb6RZVJDrlomnbm5ayB/BLONmFriw7mmJ
  U9f0QDbxDzPe+ximh96xP/VUdP7ErxfPFnE2XNipc2Lmm5S9lxZV3t0y8WO+PONxnw85Fg3l5
  bd+yMaFmLC+feikd+MG9zudwpu2vE/lDxjUK098E+ulbfPbYZrMt8wb/4IZl9h8fCeh+1FiRd
  h9dlE7o5k7TN7EVT16vv6qmFL16+rvIY06636rnQ9V/9zDuGGV7/uSDsFXu+2m54XK/5q8cdH
  BR7+C+oKYVnQV1yuxFGckGmoxFxUnAgChtBC2HgMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-19.tower-238.messagelabs.com!1616058495!87820!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7811 invoked from network); 18 Mar 2021 09:08:16 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-19.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Mar 2021 09:08:16 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12I98Fqx003256
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Mar 2021 09:08:15 GMT
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 18 Mar 2021 09:08:14 +0000
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] iscsi-initiator-utils: upgrade 2.1.3 -> 2.1.4
Date: Fri, 19 Mar 2021 05:08:08 +0800
Message-ID: <1616101688-4651-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...-initiator-utils_2.1.3.bb => iscsi-initiator-utils_2.1.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/iscsi-initiator-utils/{iscsi-initiator-utils_2.1.3.bb => iscsi-initiator-utils_2.1.4.bb} (98%)

diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.3.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.4.bb
similarity index 98%
rename from meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.3.bb
rename to meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.4.bb
index 4a9cf9db40..8a3dd011e4 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.3.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.4.bb
@@ -12,7 +12,7 @@ DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV ?= "34e3ffb194f6fa3028c0eb2ff57e7db2d1026771"
+SRCREV ?= "095f59ca464220eae285de6b5f2ee31185a6a84c"
 
 SRC_URI = "git://github.com/open-iscsi/open-iscsi \
            file://0001-Makefile-Do-not-set-Werror.patch \
-- 
2.25.1

