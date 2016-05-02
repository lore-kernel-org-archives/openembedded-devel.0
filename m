Return-Path: <neenareddy.busireddy@nxp.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0089.outbound.protection.outlook.com [157.56.112.89])
	by mail.openembedded.org (Postfix) with ESMTP id 69DBB731A6
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 May 2016 19:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
	s=selector1-nxp-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=etqO6342Gf8OWR7kFAg1lwc40UwAMCbn2zTRT1lqLRE=;
	b=VEgDabVpUyQk88Tgga0PGvLU6Q6LL9qOobwVlsLMsUE9B5awZgkNx9P49p8FgDow8aSbkGj7M0v7Ln+iBZoQR/3scNf8I/x3GL3B6vF78EVAg5JQZXpBEaUh7qli//wXZYMo/VCAVInDmrhudbRmk6fUwQlAxtY4SJGpF2+QjDo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=nxp.com;
Received: from change-01.am.freescale.net (192.88.168.50) by
	DB5PR04MB1576.eurprd04.prod.outlook.com (10.164.38.142) with Microsoft
	SMTP Server (TLS) id 15.1.485.9; Mon, 2 May 2016 19:24:17 +0000
From: Neena Busireddy <neenareddy.busireddy@nxp.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 2 May 2016 14:22:34 -0500
Message-ID: <1462216954-8790-1-git-send-email-neenareddy.busireddy@nxp.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.88.168.50]
X-ClientProxiedBy: SN2PR80CA042.lamprd80.prod.outlook.com (10.141.39.180) To
	DB5PR04MB1576.eurprd04.prod.outlook.com (10.164.38.142)
X-MS-Office365-Filtering-Correlation-Id: be21906a-e940-456a-a420-08d372bf5b47
X-Microsoft-Exchange-Diagnostics: 1; DB5PR04MB1576;
	2:dArl7f2GGyAw2o2dAZS5VuKDeZRp2eD4IWnr/aFomiP+CwgNm8yuV1g/SdFrwF86Op+TOsBwL0boRaNpWjR5mg4/nUhpc+ONO8DpKi5jtXdpz8b8vtljDvhqUGUEmepjKDjUsIeGeE08YTgH/j06BD6srJuJe4aR7HPSs5isvSgWL5Mx8nJOjOsJJ8B7JgLf;
	3:3oARZJGPLvcmGEGWYnWOFxPkMXgDafLT+fJDxWpM5zfCAjsOIIuD3RWXY549UQt/XdUil4uetP5e0+kmtMeFIpM5zzsNhottuFZvz+RbiAz61FOUAoDi9kzewTj771Ke;
	25:2yWlhakgsDnwg68od88wob4fiVdh4rfuiymN2XaK/LbVXjTuEChSsXei+0Uf6M5p9pK2JD3z2UZIQyNRiVg0xrmPkzV93Y6/nizjae/5MmHWyThaQUZBltmt18a1EBD7FFDjv7GYeNsRdJzA5OsXnbYOpYLrfdIJPsmM7LRawTuJ3XvPWVDruF1gxGwmBGJSD6mZMoYvqBz1wWmZ4kATF1taptLFvgUpAcwf32bjxZ2mknYVoIktbffWvSV8hWhr/8DZEj4Cpkqz+AFcRMt9TdNOYcVNbxUHg+T091DBuEdkZ+s4qAvmOJ6+kuehv7KpR5+ohpkUG+MaIRt4XGmiaqweSOptebrteYnSMBp227js/1qrGAE+NC+VteclExm9XPniWyMjITjxAD7oE2bcLjIKRWVUDiEbvL0/Pcj23ENhOPDQNQogpUiR473AiMme
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB5PR04MB1576;
X-Microsoft-Exchange-Diagnostics: 1; DB5PR04MB1576;
	20:lP9bIrIQyAkbntx3ft98Hvheb6RcIji9sRbdJvYLqg4y5psPz7l40Zi31Hq6M7X/MEJ0FqrR3zUfXcUssIvw4Q3ATOu8MRqyAeeDatB74hoFFl8cGGHR2NqriMghH8NsVi0MIjhU2vAD6T4E1UnU3ZHmopTeMFwYEdD1I575FWVgFOKHT6ggbHKC35k8SSe9+l7FemiC8E18sGpYBpL8+L3K3kxSXa7+PeflC6knOhOmwMVb7W0iid7CziyCwSpJuADL5ZVjfT/smqJGxoJePU+os8fvx+emUioK86L+x1nziCAOD0gSW/vhQ+t8rfQPaNBiy96+Qqwhw3QfYXgFj/8voWTE9CI5NroMh+RWKuaPcp/SxieCPpb7Wec8NcML28JiZUb1gm6Z+KtiO2n5vckbbciWMcWIQHleEbxAZ79T2+dRQrGVfDKjqu1n4prt39dt0wilKPM5qzdzNyzWwIu7Baytgs54oyS7756ZKpiLtnn0HQqMZWebIOxRRjeU;
	4:o/lyleRKUGj1GkdC12i/7kdGNZD3WPCYcp8mZ6cXhJcfea998nG9VUsOMnrsAzjAdSYKfWRo2zfP2gNhT4Tqx9yRqwVe2Ue1RhGxjIfZo8/iXFAINzaddN7UFwxWUX5gP4u4lcUduMElN5l1APaULVt5mkaGa8uJFRwIvqwzSvOaFlg4zPTXUCuOAee0bGJtDkP5Z4ZBqD5Igv7RyKJETaobT2kUUSYKaEaQ5fckaspoSeG8/lRNF5lrGjh3XHaFiHZ4r7/eofofIF513qjQQUTeY+bzqwurO1Q/UXJP3CVQotONM79o8AaLVQ6JSmRMmuqj0NuwjAUs4N1fgBlLf6AIc2VwwIbC9wDfoL6x+/ibeakCveZQnmWCNbpBFDZZwpJ4feiJ/f+D5+fxfTWiWjqWqYhNXCFHr4lAVyaKe8Q=
X-Microsoft-Antispam-PRVS: <DB5PR04MB15769BCE5E82D9A36AF7F62191790@DB5PR04MB1576.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(9101521096)(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001)(6055026);
	SRVR:DB5PR04MB1576; BCL:0; PCL:0; RULEID:; SRVR:DB5PR04MB1576; 
X-Forefront-PRVS: 0930AAFAD9
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(66066001)(48376002)(47776003)(450100001)(50466002)(5003940100001)(19580395003)(19580405001)(50986999)(4326007)(81166005)(229853001)(86362001)(15975445007)(36756003)(2906002)(2351001)(92566002)(5004730100002)(189998001)(110136002)(5008740100001)(42186005)(50226002)(586003)(6116002)(3846002)(77096005)(33646002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB5PR04MB1576;
	H:change-01.am.freescale.net; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; DB5PR04MB1576;
	23:J8w0OKsA0SERmE1q62jP3ASEC9x3V+vGS+BN5vbC/K7T1+lq43OjOAyUgF9S0jWG8kj0oABkRKJOyiKDgG7ESvgQegXI+jeiON0zQ1z2MP71KFGBwLinvLxfJzI3EDJfeMPR7/2FoRehJrgoYGYNdk45EYFXpPoGg+PWqueIutc8q+OzLguchw6BJjo5XLtetVQw4y8FQcQ5qootEIZB2K8dZTObo032MaABA8hWtmqkaqnbBO3wIyfar1i/igIM122zll2FjtthXtWvdKP2MQO9H87RO2AndidC+2ATEA9FXeZN2Cuc1FKEpl2Q8RWqIdSQ9+hijTKJmMcUYwIkte2ibCSqhkZsSvhu8KWw0gpFP6+zfDdtwFDii0xOMPOGDUy+RtT1qPvPhVGLgM4nyAWsrXagi+cLSpxNjzPwdQulaO9UoMf0bp5y9U75s+4Gzv+NjU2Fl9ZDidr33tMGNlnMptJ5y7FGsYYfby4n8aE9N2oOnm9gVXnV3FGMrIwzKrfl6/SE/TotFZ7MIXmyC8m3ptMQ6DeYsg0fC7CKuLtm72FPxObqoroFhlNLRDdChw6kjGEWg55L3NGi1lNDgBzZE3pyIvsmDw+yGMSn+w4t+NcnIY16h//ykNfB5kP6MFzQKdb1/ICKgv5IJ383lL7WTWqMe4j0zZGok/TB+gsNOPY1EsWStFJVWIrbNzTbl2+4JMvr9B+iz9dY8GPJEJYjpuuFi0O9CY2d8rawzUFEjK6H9qSsG+NxnHcLM4PJpVUpHTAGD4wAc3BlHlrpGd2wk+RoHi2VwV2L+keh35of26C/kcRUgSB6Ok3HlBKW8TcqsF3gaeBbsP+U8BO3VAtVZgk2DeSP6FLKRNTDGJgOQocVsaHi4Rj5f5j32fH5
X-Microsoft-Exchange-Diagnostics: 1; DB5PR04MB1576;
	5:71q+q+8JMU+eMj9/L43fSLoZEQcnoysACc7BUiLTH6XfBQNQn0kUhNSJRPrAE9dk5USquigHjJMgbJG0QU7P26iMr3AoQ81s891scxyXSJrSRe6Qfo5irtDdPrfMTNN4G4d15o01/RIEa4OcYbjc7A==;
	24:M3GiU0BJC7W/VANkk1L6Enak+6jA6hUysHSLbLUCNKqYmCq+z+iAf3W+xIxbiHAzKaH+5aolShKw3Ln5L/VudSJf4wKE6fXhIq7fTE7lJzI=;
	7:QGdJhOFZcA08n/TdOgEgBj5Tle8ufvRPYO26XlNTfeZEkeL6v4Uu63OCxDGgZWl5qcmJWZtEAcbmXu8HX8DhXFUG6VvXDSU0iDU5yE7weFf1p/puJFr4eMd8XVJUE+ZJTA7sZqu1AtBiO6XvyKn9pNOIznurzHVSZzNaeZlzap7gHiZ8xtX9aRNFWQcgs2OR
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2016 19:24:17.9644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR04MB1576
Subject: [meta-oe][PATCH] glmark2: wl_surface should be destoryed after destroying wl_window
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 May 2016 19:24:21 -0000
Content-Type: text/plain

If wl_surface is destroyed while work thread is still running,
segmentation fault occurs.

Signed-off-by: Neena Busireddy <neenareddy.busireddy@nxp.com>
---
 ...ace-should-be-destoryed-after-the-wl_wind.patch | 34 ++++++++++++++++++++++
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb   |  3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-benchmark/glmark2/files/0001-Fix-wl_surface-should-be-destoryed-after-the-wl_wind.patch

diff --git a/meta-oe/recipes-benchmark/glmark2/files/0001-Fix-wl_surface-should-be-destoryed-after-the-wl_wind.patch b/meta-oe/recipes-benchmark/glmark2/files/0001-Fix-wl_surface-should-be-destoryed-after-the-wl_wind.patch
new file mode 100644
index 0000000..4395081
--- /dev/null
+++ b/meta-oe/recipes-benchmark/glmark2/files/0001-Fix-wl_surface-should-be-destoryed-after-the-wl_wind.patch
@@ -0,0 +1,34 @@
+From 9c74ec83e2929b1d5ab65d5137b6ba42edeb332d Mon Sep 17 00:00:00 2001
+From: Yong Gan <b45748@freescale.com>
+Date: Tue, 27 Oct 2015 18:15:20 +0800
+Subject: [PATCH] Fix: wl_surface should be destoryed after the wl_window
+ destroyed.
+
+Upstream-Status: Submitted [https://github.com/glmark2/glmark2/issues/12]
+
+Signed-off-by: Yong Gan <b45748@freescale.com>
+
+---
+ src/native-state-wayland.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/native-state-wayland.cpp b/src/native-state-wayland.cpp
+index 41fc743..cdcdf34 100644
+--- a/src/native-state-wayland.cpp
++++ b/src/native-state-wayland.cpp
+@@ -56,10 +56,10 @@ NativeStateWayland::~NativeStateWayland()
+             wl_shell_surface_destroy(window_->shell_surface);
+         if (window_->opaque_reqion)
+             wl_region_destroy(window_->opaque_reqion);
+-        if (window_->surface)
+-            wl_surface_destroy(window_->surface);
+         if (window_->native)
+             wl_egl_window_destroy(window_->native);
++        if (window_->surface)
++            wl_surface_destroy(window_->surface);
+         delete window_;
+     }
+ 
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index 98ce377..e29921b 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -13,7 +13,8 @@ DEPENDS = "libpng12 jpeg"
 PV = "2014.03+${SRCPV}"
 
 SRC_URI = "git://github.com/glmark2/glmark2.git;protocol=https \
-           file://build-Check-packages-to-be-used-by-the-enabled-flavo.patch"
+           file://build-Check-packages-to-be-used-by-the-enabled-flavo.patch \
+           file://0001-Fix-wl_surface-should-be-destoryed-after-the-wl_wind.patch"
 SRCREV = "fa71af2dfab711fac87b9504b6fc9862f44bf72a"
 
 S = "${WORKDIR}/git"
-- 
1.9.1


