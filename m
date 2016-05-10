Return-Path: <ann.thornton@nxp.com>
X-Greylist: delayed 5599 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 10 May 2016 21:58:33 UTC
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0065.outbound.protection.outlook.com [207.46.100.65])
	by mail.openembedded.org (Postfix) with ESMTP id 61B2A6E668
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2016 21:58:33 +0000 (UTC)
Received: from BLUPR0301CA0035.namprd03.prod.outlook.com (10.162.113.173) by
	DM2PR0301MB0605.namprd03.prod.outlook.com (10.160.95.21) with Microsoft
	SMTP Server (TLS) id 15.1.492.11; Tue, 10 May 2016 20:25:14 +0000
Received: from BN1BFFO11FD006.protection.gbl (2a01:111:f400:7c10::1:150) by
	BLUPR0301CA0035.outlook.office365.com (2a01:111:e400:5259::45) with
	Microsoft SMTP Server (TLS) id 15.1.492.11 via Frontend Transport;
	Tue, 10 May 2016 20:25:14 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=nxp.com; lists.openembedded.org;
	dkim=none (message not signed)
	header.d=none;lists.openembedded.org; dmarc=none action=none
	header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1BFFO11FD006.mail.protection.outlook.com (10.58.144.69) with
	Microsoft SMTP Server (TLS) id 15.1.492.8 via Frontend Transport;
	Tue, 10 May 2016 20:25:13 +0000
Received: from [127.0.0.1] (RA43240-03.am.freescale.net [10.81.17.26])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id u4AKPAwk028974
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2016 13:25:12 -0700
References: <1462532454-10125-1-git-send-email-Martin.Jansa@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
From: Thornton Ann <ann.thornton@nxp.com>
X-Forwarded-Message-Id: <1462532454-10125-1-git-send-email-Martin.Jansa@gmail.com>
Message-ID: <573243A6.5020204@nxp.com>
Date: Tue, 10 May 2016 15:25:10 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <1462532454-10125-1-git-send-email-Martin.Jansa@gmail.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131073855140348926;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.158.2; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(2473001)(9170700003)(189998001)(4001350100001)(77096005)(110136002)(107886002)(86362001)(50986999)(450100001)(87936001)(5005550100001)(512944002)(92566002)(80316001)(586003)(81166006)(19580405001)(19580395003)(84326002)(8936002)(83506001)(85426001)(106466001)(2906002)(36756003)(105606002)(2351001)(1220700001)(65956001)(230783001)(120886001)(5008740100001)(16236675004)(11100500001)(87266999)(65816999)(54356999)(33656002)(104016004)(6806005)(2950100001)(270700001)(76176999);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR0301MB0605;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD006;
	1:RcVXJt/NbOxpFoFNS2E6YhzKL6smOw4qHfwRoqV1heLzkNOcuMO+ZBeXjBbDTLiX9ZyJXo/fsl93gWk5L/BYgohhpN9uxcIQbu5b4P+tluLj2M+xSjBYQMn2HEUDlcJsmoScDPHcXfRyD5DuUt1wOc7an9+FTU95nxiLngGNPsMhD53Q+onLEo9Eo/TM01aTQdA3dIUt5ZuGUFGl89zVmRa/qhexGY05iHuaeN7SV4M1Wc6wHtC65N13Xg5+xJ9R3g8wfdGT1gMr5HRQKOKqv/ohplVbREvgdVS7BEpMFdDC9AkKTNNVKd5s1z92z8AvFbWFNDmDAGeVTEOB56RK9AZNQd2EbQn1yjx6NTl/xL/keC0BWNQZIc9w+sjvgF0YGNt3kwhmIld/bXDRhXqckKt/H5HuniC4+mN9DMdlFVro8ddw1A6c47wYAcN2+UiaquvXqQFGM8sN4xxEdHAzAU0GczXhO32c83ClqoVE+xdyl4zkJ/EuBFbcwGWYLHEfusGaornmtr/ZRU9x9hJaUUP5ULqf4dUayvTuqjlayM21m/+1qlj8tTBX4HhTF4ws
X-MS-Office365-Filtering-Correlation-Id: 82477720-1f5b-4f9c-e29e-08d37911316f
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB0605;
	2:r5oqtmFaSyM95RuWzjhG0s4v4arY7/u5ski89wpf7QtxE2e2XjkkrmIjcL8cMrPTHiTajLCalN085hQ2dMrK/AlSitimSeqdUQX5NE4wuvj0iQ+ms7uhe2pDeuWz/DWQfFZt3FOBBM1lFfdV3rug313kUAvjxg39GYPdfatrvp9yHDO2rsbYoatLPYz1q3zC;
	3:lsM1tyCmaO/qmOjU9o/3uvNmf6vp3c9veaTG1vMXmddUl0RyY4MeyUJ+YTFpjfqLyCWbZMqtl9XWxEqlilX90ezpafLKii9WgbymwnoxDVqdUqX5wdwRoklAF9C4Su1z0m18Oqw1IrStHaNNiIHdc4XgPlVasEB6Qgr7ZZc95EYEZj43MoTwjYA0/qySv0uxmc23LwLFgcSv6a69jTCh+rO+BjE/jYfCDSTj/XxGUFU=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DM2PR0301MB0605;
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0301MB0605;
	25:ZAePsYDle9DedtANqQ4RnLJ6ECJCGJ1Er17PAL+?=
	=?us-ascii?Q?y46hE75JKh0yMaCq9eXtWtEf6F5odyYEFR0lqDq1pzxUYCAuNXz3/C7ashDk?=
	=?us-ascii?Q?ualzL0AbWHXujBc5YQONjbF0tnGv8gVh/f+WKJm2zLDwHs6MPr5W7rJYShD2?=
	=?us-ascii?Q?1Y0f1a2HwxIA+HUJQe0lAZgK/8Ej+ZK8MbcJmjOuJ1tyx4nyY/ZaKw8ZRn3h?=
	=?us-ascii?Q?J36SOovGVNZy2ZNL9OTQpfG1kWH298YaGfWnrOrjmdL0fHCih7elQWujEDk8?=
	=?us-ascii?Q?AyVo1POm4FD4wLR5sHpWB2pTnBNhY6ZaEpnem9EU64K8gijqmVGoT6NlmDud?=
	=?us-ascii?Q?G6vIrtwwEc36QPud5p2bBbCr6pp2tcFcKNewGQ24HyqhzsdCA4+ZTk3yp10y?=
	=?us-ascii?Q?NStRZNrImMUhZQoMrEjR3QnzOuZ4i5qypdGLPE8LvYXHS0cP4hmapjiokdmR?=
	=?us-ascii?Q?dC+pLQso/SrNePHSrGN7Ax+16V0+77GXE/SAgJv8BBbI0PUCjyh0esZTo5PZ?=
	=?us-ascii?Q?WKSM6G3v9l6+FxclkW40A4xBTESUAq2ZwxF8/2xK2BRdHPWzlKMtlLga5pIt?=
	=?us-ascii?Q?yvWrpPU4ENHGd8qvW6OoFDTTRsLW71Cdc/yJB0kRE+zrTmvW6Lino1rPNXBZ?=
	=?us-ascii?Q?SMeLKXyvQxFh4mgrzdaQYf6vosVLo9UKJAz71DyPji6dbGa5h6YXAh1a/Tse?=
	=?us-ascii?Q?+zZPV3vl0DfurbnWcx8Msn/P1Vc+Cy2KpJ0SB6IMfrF+H7GQd73enmBSom63?=
	=?us-ascii?Q?i1x3gOeakupiPN46rcAUXhHP/lpMZzYyZEZsWQE4zCff/GUVv1ZS2SvDqZNE?=
	=?us-ascii?Q?/KLYSg6F1QzIpjIcHfRNawGeICiHPA0hqiP4CaKlpz3m2Ubow+eJyY79axeu?=
	=?us-ascii?Q?J4PYFT+OpMXaK5qH8MHqbS2LMPzyaKh0VyjyNXskPi0o4/xd6sRVMwy32BHx?=
	=?us-ascii?Q?hDZChs8t23aytCBZMp1bk0EvJAUKt9SeuG3eXeAFeOQ=3D=3D?=
X-Microsoft-Antispam-PRVS: <DM2PR0301MB0605E86E1FE7D837A08BE9FD86710@DM2PR0301MB0605.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13023025)(13024025)(13015025)(13018025)(13017025)(8121501046)(5005006)(3002001)(10201501046)(6055026);
	SRVR:DM2PR0301MB0605; BCL:0; PCL:0; RULEID:(400006);
	SRVR:DM2PR0301MB0605; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB0605;
	4:3NkyCfNGkOlUQjT+JDgOxh8s+FW8ZGs/ghG/v0P65LKidAfTjrnartR71fysy1a93rI4PXdIXpn7hoNopUpnR7F7JFrvomw3bpQvPFr+fTd+apmQy8UwfBPmGNZHyFDJj1ztRGroXboELWkt8Zca/KlK+5r29EEDSfYMQIlwSLyHHvnBI1se1yzY7fyxh+otp2EfIUYHh5BJhNyaar54Wn9YUDJ+WBjy/LBPUYucH2UI6bVSka4kUapKERddqQ6oZSn2+np2l/B99k9PO6oImwymSTrsfeDZpILga772TPpxJ8BWro3gzPmkBKaBDJb9MJKFNZR9eZLeTUOoeJdpsjprBC7IpnNyV8c3rmp2DBZ29VsvBxPEADhhDH+lCOyZwjtAERBxchT65426iz8bCgNscg+H14d33qKyBm0FL0enWVcMXgWrRaCP5L4KpKZ35C+1ZRMIuMZUlaboQ4Pv2fkKFS07RhWUL96umoHka/s=
X-Forefront-PRVS: 0938781D02
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0301MB0605;
	23:GB2iow7VwspOsScWMKkZDRAlBC/xAAUKVzJ2h7F?=
	=?us-ascii?Q?spO0MZEM90yfKCnZm4ZR+cPiE05cubit2820FdRrCdFB1AEeS7cdJcSnSADF?=
	=?us-ascii?Q?9R42PfThGXfun+BZmTVBd2vteDzLI9dWDPwBfx0xzqBSx3tCkrtFt8XRhLoJ?=
	=?us-ascii?Q?ORPgDjgbRpE6+P5pISzslJbEOgEuQ3x4fauCnoflDug3Ek0wk+STT+aSvlBg?=
	=?us-ascii?Q?gM3nC7RAU04uK7YvZ7XcMuyxvXQejBpXSMUgDG91n5OkkW+UTU+H/j0Oujlu?=
	=?us-ascii?Q?Yggr2so/yyb0dlxIqGKc4FjsMSZfbSptEaiF0Q6oGx8eM4ZKmSO7TPs62YTo?=
	=?us-ascii?Q?N4XOhPyG3YSILPLcOjr5o6JIYXIhxFWQUJiwMbDK9p3Q7ld2a13V/3gnEJvO?=
	=?us-ascii?Q?/xEuSZbBZ2iZxZ+L4sw10r1mpIRjNvBg+nmhxuzH/ckuqyB4yiLuc9KdydCf?=
	=?us-ascii?Q?I/6NQgpUy+VNEvnBev3xZ0FGMNQSubqBlVJ+WnE8mYQjyU5SJR6DyxU6Eri8?=
	=?us-ascii?Q?pNO15GKbaeTilYweHmyTP+0/z+4RYYC/xk0TlgDFIUsT7VpWW6k03JVVGzVc?=
	=?us-ascii?Q?ouIEetR/q0UFegwp06EvpoXOImAQVFHagYLyflBmEaTvPne10AFxEUsOOQqs?=
	=?us-ascii?Q?hinJpsCYFenFDoTqCjG9rKkIxuwDpQ/nWjjTn2mXjPCES3Fo2DNOnXmRNCW4?=
	=?us-ascii?Q?PFX5aZcWGy2ZD9gMv8lDy30KJeFiEBNp5Ur74EbhyHFCxhWMLoNc3t5hwqFg?=
	=?us-ascii?Q?XHgezjct0Hjt1IxmyWmtvq6TJ8tCd0togMIAxM3q7Jn0dT4ga5Lm0d8cYHj+?=
	=?us-ascii?Q?axbnMUCHCow+EWlz2rDX8QsNVhVv8+cDpSAyoNBCypR+IDbr45+TA7PWE9xS?=
	=?us-ascii?Q?MrOIlnRE5aPFvw3vKDya0Ip7hpQghjTKzAiFWIM8Zdw2nJXJTkv/G03X85OG?=
	=?us-ascii?Q?uLItZrXFtQBnpbH1Qr8+MoAo5cBpsAlDWepEGohxfWSP5s7gDxlFCke5Z5h1?=
	=?us-ascii?Q?4ABSWrpUQiB5mOXaqh0+NtHyjIwGOyz10pyJur8LWQ9Vc+Rxiitke5Ce8b1a?=
	=?us-ascii?Q?52DsNzlG7UGuMrgDKKcCh5t7doCzh0tvCJyZZHByR5XZ5Jj/B0ROQckRERsz?=
	=?us-ascii?Q?cyOVL2r54vwxDz77MjXRw69vZIuA+5HeHBJc+3y5cJ2CKBcb/oek2MFhs/sC?=
	=?us-ascii?Q?uvsPh0m4i6Aae8aw/Qerjbvq8r9qzXVyyClyzYACT6ybFVL3lILLdMEoG+X0?=
	=?us-ascii?Q?OOHj2EW9nhNoMQODsSciCj1rUy9VysFjs+j+IO3kdvzqHOrgVuf8nddb3K33?=
	=?us-ascii?Q?9IA=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB0605;
	5:LBBmwokfoJU96gQLQXCybYbGQzbK9SSR5WRbcS1YDt8QxUsY8mNByoi4w5m5BDltnvuh0jk4qq+Ppj/NPncGHKuJjRTVBLq+Vk7QgdPlRGqegO6LbsJjWzXllPsXsCrmvWjfX7VYGzotSg22IC6NyYCZREBYjOHbeI3pdSrpN1g=;
	24:BOxi/DF4XwjcpG+mWPKsP65Os5U/HT0BiFv2wHyzITqLIWnLN182ZkLDnffSEfPARrIA+9HAsvZSIdpSigchFz23CYz4FUOtedPJHOJ6HWI=;
	7:dfkMz18m+uI7LxvXCfqBMPY6xhOJfu6gLRBnGA5dQ5n/wyy/iVPlgVYHyNRR8UAG13ZIbDIXAWZqWShbH1yhxdAyJ/f9osv2+ckqgazk58yJ1OLMeMEgJnwprjHOP2fgb3NzBGTqXUrhXOsR42xzl6Yl+9G7R2BIgbUx+3vQjkEzzuSjoxad5vAYCms2LqeK
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2016 20:25:13.7852 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB0605
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [PATCH][meta-oe] packagegroup-tools-bluetooth: Selects the tools appropriate for the version of bluez being used.
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
X-List-Received-Date: Tue, 10 May 2016 21:58:33 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Thank you, Martin.

Acked by: Ann Thornton <ann.thornton@nxp.com>

-------- Forwarded Message --------
Subject: 	[PATCH][meta-oe] packagegroup-tools-bluetooth: Selects the 
tools appropriate for the version of bluez being used.
Date: 	Fri, 6 May 2016 13:00:54 +0200
From: 	Martin Jansa <martin.jansa@gmail.com>
To: 	openembedded-devel@lists.openembedded.org
CC: 	Ann Thornton <ann.thornton@nxp.com>, Martin Jansa 
<Martin.Jansa@gmail.com>



From: Ann Thornton <ann.thornton@nxp.com>

Signed-off-by: Ann Thornton <ann.thornton@nxp.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
  .../packagegroups/packagegroup-tools-bluetooth.bb  | 43 ++++++++++------------
  1 file changed, 20 insertions(+), 23 deletions(-)

diff --git a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
index bdab389..dde4599 100644
--- a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
+++ b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
@@ -5,36 +5,33 @@ LICENSE = "MIT"
  LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                      file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
  
-SUMMARY = "Set of Bluetooh related tools for inclusion on images"
-DESCRIPTION = "Add bluetooth tools based on the version of BlueZ in use.\
-The tools that have been tested and work the best are pulled in \
-automatically.  The same packagegroup can be used in a recipe without \
-the need to know which version of BlueZ is in use. \
+SUMMARY = "Set of Bluetooth related tools for inclusion in images"
+DESCRIPTION = "Includes bluetooth specific tools for this version of BlueZ.\
+These tools are used at runtime. \
  Supports BlueZ4 and BlueZ5."
  
  inherit packagegroup
+inherit bluetooth
  
-BLUEZ4_INSTALL = " \
+RDEPENDS_bluez4 = " \
      obexftp \
  "
  
-BLUEZ5_INSTALL = " \
-     bluez5-noinst-tools \
-     bluez5-obex \
-     bluez5-testtools  \
-     libasound-module-bluez \
-     ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', "pulseaudio-module-bluetooth-discover \
-                                                            pulseaudio-module-bluetooth-policy \
-                                                            pulseaudio-module-bluez5-discover \
-                                                            pulseaudio-module-bluez5-device \
-                                                            pulseaudio-module-switch-on-connect \
-                                                            pulseaudio-module-loopback", \
-                                             '', d)} \
+RDEPENDS_bluez5 = " \
+    bluez5-noinst-tools \
+    bluez5-obex \
+    bluez5-testtools  \
+    libasound-module-bluez \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', \
+        'pulseaudio-module-bluetooth-discover \
+         pulseaudio-module-bluetooth-policy \
+         pulseaudio-module-bluez5-discover \
+         pulseaudio-module-bluez5-device \
+         pulseaudio-module-switch-on-connect \
+         pulseaudio-module-loopback', \
+        '', d)} \
  "
  
-# Install either bluez4 or bluez5 if they are in distro.
+# Install bluez4 tools or bluez5 tools depending on what is specified in the distro.
  # Otherwise install nothing.
-RDEPENDS_${PN} = " \
-     ${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', '${BLUEZ5_INSTALL}', "", d)} \
-     ${@bb.utils.contains('DISTRO_FEATURES', 'bluez4', '${BLUEZ4_INSTALL}', "", d)} \
-"
+RDEPENDS_${PN} = "${RDEPENDS_${BLUEZ}}"
-- 
2.8.2




