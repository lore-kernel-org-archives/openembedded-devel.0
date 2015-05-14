Return-Path: <B40290@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0136.outbound.protection.outlook.com [207.46.100.136])
	by mail.openembedded.org (Postfix) with ESMTP id 7D4BE7402C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 May 2015 02:37:11 +0000 (UTC)
Received: from BY2PR03CA055.namprd03.prod.outlook.com (10.141.249.28) by
	BY2PR03MB443.namprd03.prod.outlook.com (10.141.141.152) with Microsoft
	SMTP Server (TLS) id 15.1.160.10; Thu, 14 May 2015 02:37:10 +0000
Received: from BL2FFO11FD037.protection.gbl (2a01:111:f400:7c09::136) by
	BY2PR03CA055.outlook.office365.com (2a01:111:e400:2c5d::28) with
	Microsoft SMTP Server (TLS) id 15.1.160.19 via Frontend Transport;
	Thu, 14 May 2015 02:37:10 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11FD037.mail.protection.outlook.com (10.173.161.133) with
	Microsoft
	SMTP Server (TLS) id 15.1.160.8 via Frontend Transport; Thu, 14 May 2015
	02:37:08 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t4E2b4kV012412;
	Wed, 13 May 2015 19:37:05 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 May 2015 10:37:02 +0800
Message-ID: <1431571022-14263-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD037;
	1:LwfA/MD4GYjspl9unMgkw19PkftuSFYYgAVS9KrxBU5iUp3fVvG6Aez2LCWU9UHz7FbmxoI/eVkq/Sm47vf/8mvBjh9GSj2kVl9OxmKxywfmWqlUuVF4Ldb0llWYoo+pm1oZmPxS2amrf1OnE3TIXH1MU/MXoEyWNGqN8GqzxXVpQYzDM+A1tf5eTF7QxwrWVvs9FI7ClNcvfw2ZoLY8IUBgnr5lwlHUsCyd2C+yN81cDMY1FW5Rc5TKkTxICTi+5rD5HEfwFKlzwTUnOrbSw2yehmYl2dwQ/wlO/kg31DUPKkNSIBjwamubrQEvx5ywtR77/jXVau2JL7a7kPBrdA==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(189002)(377424004)(199003)(106466001)(77096005)(104016003)(62966003)(77156002)(450100001)(48376002)(110136002)(33646002)(50466002)(19580405001)(19580395003)(5001960100002)(107886002)(36756003)(2351001)(92566002)(189998001)(229853001)(85426001)(87936001)(50226001)(86152002)(50986999)(47776003)(86362001)(46102003)(105606002)(6806004)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR03MB443;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB443;
	2:5yOwegBxG7ucDFGZ8pVyevryDiIp5QVAGPh7QHSWEt8OhTtuNFQR+27S9y4cSlK0;
	2:1gqhYnqJ0WJNzUUDw8l96GD4Zglp0a1cH5Ob1ez6RpzzwfOpNMKdOFFuJUrt/v8rqmDe4aRkVW4F6DZv9CgOvGY4uWAb1kp6y7skvjPLZ/8NETgVmvEV5E/bPSterwgS8MnZU/WocThW2tmXfp5RD9YrwE1oQ7utkodVOfEEh8x4XXovqgJJ7m3Jc2LFwm9ZQPClnzFeCVywEL/PjGHhCcNPO40b2uhUSPzQxiuCCyo=;
	6:RKHUOPI/ftnp2GRzpSMrYOSuy3/42szwXf1ugRWHfsMc+sEjxb75lBEiz1LsNCUADYunRwqzKbZn+j05gcBO1dUj/7S2vl21Ipti043C3WEYvrL2aFhu2eKjhhs2693my5k5NTfFF9muF8m2RNkuszuU8mxMd0WxSGPJqqgpKCmw8xTtb+sne1LfhebljGuSf68B8ZyrU5DMYo+JdiDQAwJgkrGkv2yRCGP9VcleWFV6klpkJZa44Xa3/7oLBA3C2t7qezw0E2fKES2o9Dbj8Ky9Z/Y6M0nAnNErY7Oi5N/i8pnelKt72ufO8Fu0cigNtevMdfxCTXwTRq/lmYttrQ==;
	3:HKaFe7egZOarcP41uOvwljKt5d0z8uGBWxk8jRS6/P9wMhMftdoaxFP4ZB89t8hFjqce/CbiG09nWjYCmaAw3F6FlR6pxVmD2VMWzlsO/ih1+XBgVDLGuimHOQW+E2dY1xI51+mbFXaQ1QgtPZmPIEygN8QYRThk3h4L4gWrLcSv4VuI43N+9PgYw+birDP51gmapMPcdIRAcy4b0J0xTp1+8VEX7knsNgNSLYN+56WzXWbJOs+S7tqXdKQQ2VoN/NjNy1JdWAJFb8aFIY4jfKIK5rO14SMlbmxLM3CjPkI=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB443;
X-Microsoft-Antispam-PRVS: <BY2PR03MB4436C3A40BCF5D039C9ED6584D80@BY2PR03MB443.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BY2PR03MB443; BCL:0;
	PCL:0; RULEID:; SRVR:BY2PR03MB443; 
X-Forefront-PRVS: 0576145E86
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB443;
	9:AV2Dw7CHbyEM4wMkiBOMjlIfRytLauh6lamDgG69AfXkYPxJ05MpvK0BxP1zcKOH56ylnW5zUgToWXgko6LkW/WiXOrl7cS3rA6v67SfyAfiNzjkCIOodidsNa9TbUS1riWhhcsVeDSB1J1IgLOSkYnL8b6DM9UeC+5jmLiRhy6YSM8NXe8w7PCPIFCvGPwZEMii8TUY1BX58dR5Yl6RVx+IvWQiZ+reQRpARY3rLY65oLj5X/ifIcoboj+Qyo1oLz4S9eAO1QWDe7/+QwtXC9ltolujedRievdlxPlplk69iGJpSDgsMc13fs+MUX2Yw9hRu5WkN1EA+VJAv5iCHqOW74EdSkvawghck8wktgqNuBhHzDBWTm+qaY5CNUD/hD/6BjWCzHXHqF7wjQmpST51aKTz8m4tDfoNCDgXLm783RsRG13++apCbefBLT7DIwBLq+H1xSDBojb32ORTAF3edDgdtt/dPqsQU61pY6CbsYQOOZ/3Sq26EYGNT0DNB6RmkWvBXG5+Jszoyi6WQMzB2Bb8+1ElubxVwUeQwUXRyDAjAcrnBAGYzSPad9uolbJKcuJ6ZzppA6yPyQj5nxwUp5oKTC44elVF4uBhOWZMaPRrH8ErJtxSCCONajIR49XXTq/hOQj4XtWZvn9Zple9YO23s57hSMCeIN7dq6P2U2tf/ZmcLqLor2pS14Yhl+4HNi2ZEdpnoxu8NvNBIpM2HpyE5tQ9MAe8RodKw7RgGX0pscqI/Abe6D47IiU/UEEC9REm8BFlkYIYj2SG49aQGc2yJchaxzk79Cz0KzII2Ew7zlkJS55ZebjQfDjp4z6So8HSx1j4LuND2td+vGqpD+YSCDMg80nqbgGGLna7/fionaAcWkFDjc3bzzJ9lZGxK90NW2vGGH4pKKDsqXJ3986ddQEoAaRpjht0fnc=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB443;
	3:a7L/7VGZyhe0DVZO9FvrjIpwLwIvXkoFLVNAJPrZKAhj0E4t2UrbFuHKGVWMR1jXSnEuR0p9ttMM8rWkjbSgGavaFCUn/j9xdsiY3SaF1peie0m5e5HJDk9xB3rOny20vTKysbQLRlpuqedRVBlH+g==;
	10:VBvNusaRnkzTSCl/SdVosPJ9knkm1fDIbVuLNwj1W47g7Q6osp5CW+MPtVrmDMXhV3DZ71H9qr6NKXfZDsDkJQZbSWiXIWs3Ps7eg8nEpRM=;
	6:RMcpG6lWH/iaJMrI7+340e1LxjESYgr8/Q9+vfjWqsmw83lTN7Fo63qdbAeAjeK3
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2015 02:37:08.6571 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR03MB443
Subject: [meta-oe][fido][PATCH] mozjs: fix the compile error of powerpc64
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 May 2015 02:37:12 -0000
Content-Type: text/plain

From: Chunrong Guo <B40290@freescale.com>

     fix the following error
     |error: 'jsuword' does not name a type

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 .../mozjs/fix-the-compile-error-of-powerpc64.patch     | 18 ++++++++++++++++++
 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb         |  1 +
 2 files changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/fix-the-compile-error-of-powerpc64.patch

diff --git a/meta-oe/recipes-extended/mozjs/mozjs/fix-the-compile-error-of-powerpc64.patch b/meta-oe/recipes-extended/mozjs/mozjs/fix-the-compile-error-of-powerpc64.patch
new file mode 100644
index 0000000..43c4590
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs/fix-the-compile-error-of-powerpc64.patch
@@ -0,0 +1,18 @@
+fix the compile error of powerpc64
+ 
+Upstream-status: Accepted
+
+ fix the following error
+ |error: 'jsuword' does not name a type
+
+
+--- a/js/src/jsval.hold	2015-04-24 01:15:06.692970731 -0500
++++ b/js/src/jsval.h	2015-04-24 01:15:41.792969478 -0500
+@@ -304,7 +304,6 @@
+             int32_t        i32;
+             uint32_t       u32;
+             JSWhyMagic     why;
+-            jsuword        word;
+         } payload;
+     } s;
+     double asDouble;
diff --git a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
index 91ee9a2..f6e4157 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
@@ -11,6 +11,7 @@ SRC_URI = " \
     file://0004-mozbug746112-no-decommit-on-large-pages.patch;patchdir=../../ \
     file://0005-aarch64-64k-page.patch;patchdir=../../ \
     file://0001-regenerate-configure.patch;patchdir=../../ \ 
+    file://fix-the-compile-error-of-powerpc64.patch;patchdir=../../ \
   "
 
 SRC_URI[md5sum] = "20b6f8f1140ef6e47daa3b16965c9202"
-- 
1.9.2


