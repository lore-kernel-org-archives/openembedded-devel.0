Return-Path: <niko.mauno@vaisala.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0088.outbound.protection.outlook.com [104.47.2.88])
	by mail.openembedded.org (Postfix) with ESMTP id B64FB746DF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2018 12:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=02W/vwEteOexI+QSHjfRCbDoLB6RG2juhsmu2A2lzlo=;
	b=tUPd23s3eDIIf1rIoAeVttCSSIKBRTQJF89nIkh3A9fJrUubl6NJgLvAl6M6uwSq9f7gHUB1yBettHAIfjCS0AZMlam33mrO74isHLf4pfGOAAEB/nxQ0vQ5AL4KzhWd5DWD/KWYjyMVOV1N7DmOP/sHCiU2U7JTphbCkt6PO9Q=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=niko.mauno@vaisala.com; 
Received: from ThinkStation.vaisala.com (193.143.230.131) by
	AM5PR0601MB2529.eurprd06.prod.outlook.com (2603:10a6:203:42::15) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.675.10;
	Wed, 11 Apr 2018 09:46:59 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Apr 2018 12:44:48 +0300
Message-Id: <20180411094448.15363-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [193.143.230.131]
X-ClientProxiedBy: VI1PR0501CA0003.eurprd05.prod.outlook.com
	(2603:10a6:800:92::13) To AM5PR0601MB2529.eurprd06.prod.outlook.com
	(2603:10a6:203:42::15)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:AM5PR0601MB2529; 
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0601MB2529;
	3:TRyJ8TXShmjBY6QkVFgc6EobNXos+F31WM+Mc8FmAeRxPcx/z6Paj4SmRgg1+zHI6gkfjz6MlGcDSrO1q1pyCpTr3RlKyPAt37+vK/RdO2jK9QWSY2v9hxXRu7oF1sh/xKrnUwCENOXiu4sYUu429KcbN9MZDGDehgh5OlbG483d6pC8wquVG6ezw4qGXHJcMCHFm/d+cizPnO+v/WsfC+FxzRh3gnOvS10W+hglkx8mkvu+a3v1eD6LOW9QJDGY;
	25:i7k71JuEvBgF7dL5WbF3GnoMHdUp08f2dF57F126RBH2fjeTROW50tKZmYRDly7XJGB/dJhkq/vcJKZu18w8EpUo6rR26Bd1f2ngdChhqXVeaaQbvd0l9W2yGJuufwoT3hiq3NdTB8EZLrnqRlnm7ZY9CwOhmSthyX+fNJWIjxFWV+PphlUZ6SRvY6sB+TrU1EJ2CuLOYUTXkVb1F/jRyalCyVfBhgYto8nZ93kNqMoZiP5ofgDN7zz8Sdnjnt3uR7IBFIVYdlrpMh3SK/0fOsZw92BcPEAhIDssFW6OdSTkkM0uE+e2dRNGW7SV0sGPOv2NMK8TdE6CRpHBbJHQBA==;
	31:6M+J/OS9dwjD2/KvTDts6p+L/3eeC+wanLwYPNGPp1LbsAJ90L86DV69U57rLlOlN32nW413y4tqWjPCRIJsqtagCMfWRS794mzO85IQtTfRmLrm+7CnXVY1UZPBx24G7m8kQjcsFH7W7ZJSi/GTzjOKKW2HJYLgq8QUOvrMfDnIeDPeKFr5g2iGwkeCPqM7V4Qza6EkdutC1Sl4v2N86FGemspSEvlY27a7Z3PRhzA=
X-MS-TrafficTypeDiagnostic: AM5PR0601MB2529:
X-Tenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0601MB2529;
	20:5m437WPTgXSbqg/Y79mtNUAwvzw4RctDMOtXzDRH50lFoaoNpDH9BX5c/UHJ1jpVEaDQb0AF5DHIOt6CBndLDruD3r6MXpS//oW751zYID7aJZR11hb/ljiZ7jgrt0I9tKMonqVuWVe0HkQ3Z4oQvaAknd7cstJYRANeilcuKlE=;
	4:einAQ92UusD8KXJg4jcrzPnTCZbjsJkR4MKgaqMnYhbAQzBSJ9BhBntj/J4ntnDxCYoQXWb1KxJhgwDZt9bDcAOFQly16vJAcMSsrqJsd0FLthh7Yr+JTdX+S/n+kX2uRoBTtS4cTXsZV49EmnamOq86ktRpirsRcjDzv90KOfi1EPsWWIFXeT/mZ1GuGYwG/1qDWo2g84dyY//jfzMpt5VK+DFXoDuEQlRnGQOFVt2cIDBRX40OGumxQwqndt74Z3SXG+wp7uenEb7CRP8EpXdN1gAj9y1YmQaT0IHHs96pUD8XSmR+KEcv5PmnLX5bgKWNzAR0GYeVmZscxDVerZKyupUN3+abWjXAFFqeuFw=
X-Microsoft-Antispam-PRVS: <AM5PR0601MB2529323373D8AD5CE4C3E5B281BD0@AM5PR0601MB2529.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(15185016700835);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3231221)(944501327)(52105095)(3002001)(10201501046)(6041310)(20161123560045)(20161123562045)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:AM5PR0601MB2529; BCL:0; PCL:0; RULEID:;
	SRVR:AM5PR0601MB2529; 
X-Forefront-PRVS: 0639027A9E
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(346002)(39850400004)(366004)(396003)(39380400002)(376002)(189003)(199004)(97736004)(305945005)(36756003)(486006)(66066001)(47776003)(53936002)(6486002)(478600001)(6666003)(6916009)(16526019)(186003)(6306002)(69596002)(1857600001)(53376002)(7736002)(105586002)(2906002)(68736007)(6116002)(476003)(107886003)(1076002)(2616005)(956004)(53416004)(3846002)(86362001)(5660300001)(48376002)(316002)(25786009)(26005)(16586007)(50466002)(2361001)(7696005)(51416003)(81156014)(81166006)(8676002)(8936002)(52116002)(2351001)(59450400001)(386003)(50226002)(106356001)(4326008);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0601MB2529;
	H:ThinkStation.vaisala.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: vaisala.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM5PR0601MB2529;
	23:05CEZx/YGSJJU59YD7JiC1+5SYPKifNbcf7qHGD?=
	=?us-ascii?Q?Dx8pCCLt6cXk5N265viZYPmC6/dxG8BDBxDWIAcsjCb2FYO1S8n4MM6OEabj?=
	=?us-ascii?Q?+rCtowAJapoOjGg9ePDngNFPsluYNEYo9p+oWWcnKPEtEuUdzRtXC9t9Yjum?=
	=?us-ascii?Q?KRRMhXTNfXGu9+Bvr9LHbYI7SctVGbIW67lXZxoQc/LIEXPm6TWOqiey18Li?=
	=?us-ascii?Q?ooaDAJ5FvthNptmvr+skfQyQhjz+75t+boUecgSwEroduIQqSV8EaOwMbUYD?=
	=?us-ascii?Q?9XcieSch8SxIJqsOlPaHpdFzf15P5Ccbu5/mNqFwxzC7/cjPY3W52XGTmFo4?=
	=?us-ascii?Q?+U63zOV2UzW93wYLUcyZr5EltE1tY58HUtPNluzfDqKLx9q3yGyRUrf9pmfv?=
	=?us-ascii?Q?mrVB9uCF+sPr7/i5UplCe0+s4nUapr1tugiNR/Q0HJ0NVt/PMVs9yilHib/R?=
	=?us-ascii?Q?U/RtD7pDCEp2X4Ak//EF+GeDuM2fOSoRnoz0Zt3BK+rO2oBFY0vfoOHhhG8r?=
	=?us-ascii?Q?UsbFI18jcJUG9m+Ewcrr9XhNk67NZLNB2UkXcf3I6YuxJkf3pP0KM4RhZQlX?=
	=?us-ascii?Q?YcPACbWN90+yLK2UlkLGsnmhyR3/gaUd+W7+UkC4z9Dj1LZf66yy6/JiOLZ3?=
	=?us-ascii?Q?eCmTG7kSFbTeo15qI26q8HhtiuxOTAvtS1bSQkkM2C1Mjw2kvG6T1jcRQ8dL?=
	=?us-ascii?Q?piJtnP3OinkEo6sHzKifyxjNLrSrF0H7V2VedOBgSsbuz33Efxt+xAnXx9gi?=
	=?us-ascii?Q?xaR1Rr4b9q/hfNieFZzPkjAXFvTnVQ6R3eQoxlfbRKBdXJk7lu3K6w7jH8WW?=
	=?us-ascii?Q?XmLNL9A6Or1F0fCL7pAydlZq0WQ06zaTWONsPvu4TuIPqZqmlpilVF7SJ9dX?=
	=?us-ascii?Q?2OPaCzQwJwsevBKQD7LWp5+gIDGDxZ29eAi+ANiV4aPPitI2qeQO1/LrIkVb?=
	=?us-ascii?Q?S8oP+mz3SJGxArXZhPa7abYo3hdNRNjfsYtscvFgZpdHptKOoqzmn14wVjrf?=
	=?us-ascii?Q?Pzes/qBFH9Sc8TV00NSG/VNlDzGWOYhn6O2ZMV/DyfhCJ0ujWSgrVuzVYX9S?=
	=?us-ascii?Q?WsiNJJMNqcDibi4LbIY22xuvHn5sZzjJsP8qNqT4RbKJ5nA/QEc+5OU4rHGM?=
	=?us-ascii?Q?tSiHRsUPCUJKSl82oqlw/8wRnpi1SHv27j70aUuXwQxPnpH3i3VI0kQeUA+6?=
	=?us-ascii?Q?yNNGk3Fn5y5GuvZTjlAi7/td780yJNtIQvusc+xfYICzkHdIWJsmoyXPCX6W?=
	=?us-ascii?Q?cQTfscOdhDd4HVkizo6LceIow/BYLly3wg//KnynwKchY1ANwwFOf+LOGL4W?=
	=?us-ascii?Q?/9WXGjRAwPr8o53AlQhWch4c=3D?=
X-Microsoft-Antispam-Message-Info: FCkdV9CUnai0bMEXdRV4xw8CxqznMjWl4Y/hnMtKUOXALV6S1D0k0Aq4tprJRvtww4863DjxLVZIDCdbuPH3FaBpt30+qP4YPEWmF+jtZsqgnYMJGbuq0c8a2M1Q2tIlFdujfTpgMu/vtWTYqOuv51MahG0YCxeFifAfKOkhPvUDqfD09+wI038c19kcA8Id
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0601MB2529;
	6:SEkGN0Ps8pX8X8/hZVR1ZJ2P6Bk9Llsvb41CzD3sTmBcLMyOjXBnYJKH1tRsTVGJmCoVd3bw0lwBirQpNglYg+NoaIzXhpO+xcOdCbzL+SP5koRvZBI3IB3vRz1UyCZxlppksC6e59pN2nldxJfylFq3+BakXSpU6ze6fFDH+RGq9muqbkVKjqCM13/xCwpeR82lYl1XsNCs43ModB3TLF62eFHNDOf/5hrSly88QkLbDFL6Jvs3Y2u3e+9M5+7iewUPhPJNyG00aiBBJ1J7iE8dI18iSo5684SG0+TcBAudg17Wx8Gd7itciryVScgwrmPItJzzg8spPUdXQ2qM7fodh832CmJnETqk1fQvAjeA+4RxRzDjGFYNkX65kRA2VMxbo9CM+i0zwouINPJMaj8ZV6loSo8F5cRO1LNnD4dp2EiKS7UjgbT+GaG8V4J/zlkMmql/CHQrj3JlrLvfFg==;
	5:Y70cKjpQwzSk2QmVTsP5CM6RQpthHVtvYUVGjniPiNQYB8J0kuyoWzA5pRQ11NA3xbjg03AjVYEZj+0I1j6BjXbKnlHZhndQ0ixQpsrWSJUzxPilIV5SK5Rptr0KRbLzHrd5PmQ/MiqUjrAJwkF5xuJusF5/zeiqMIsMAoMhdLU=;
	24:riCHpXFtH32cH8cZIBqqPd5nCXgeEUD4nYNNJC+hZ0ktyZttNLcu3BIqNDmgFzSnZoHztIriC6t4xxs9HypAWV4p8bqkm/mAebUA2jTOpLA=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0601MB2529;
	7:ZqoP6cbH6rgLrZIXxcjwa55Bzet40PVNKSuVPyJc2SA3rbhJYZSDnxW7DmIVbGP9OXkTXU7znB9P8bMoi5Bg7JJgNsXnLd6aiqNttijTsGLcda3NP583A4JF9itZEGNzLAcY/QLZWBgdFBq6DknDGs/vEZTbRl2BbJQ8fz83A48LlaaWbpyoMZk4wtqnoLYJd322atEqSL9layVSGhxyvr7Cj9c0hfPzvKynqC/va/7lwygszEjwRA2c+Oyj2zKF
X-MS-Office365-Filtering-Correlation-Id: 6819eeeb-8561-4f91-f186-08d59f912bf8
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2018 09:46:59.6946 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6819eeeb-8561-4f91-f186-08d59f912bf8
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0601MB2529
Subject: [meta-oe][PATCHv2] tslib: Align recipe content to better match v1.15
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
X-List-Received-Date: Wed, 11 Apr 2018 12:20:46 -0000
Content-Type: text/plain

Respective changes to recipe:
 - updated AUTHOR field to match current author in tslib/AUTHORS file
 - updated LICENSE field to 'LGPLv2+ & GPLv2+' to reflect licenses in
   v1.15 (LGPLv2+ for shared library parts, GPLv2+ for command line
   utility parts)
 - updated LIC_FILES_CHECKSUM to contain COPYING files for both license
   families
 - Replaced EXTRA_OECONF with PACKAGECONFIG that is aligned to current
   configure defaults, with exception that "Tatung Webpad support" was
   disabled (as it was enabled by default for some reason despite being
   seemingly specific to a single manufacturer/product).
 - removed commented-out detect-stylus lines (a detect-stylus recipe
   was apparently available in OE-Classic)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-graphics/tslib/tslib_1.15.bb | 40 +++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-graphics/tslib/tslib_1.15.bb b/meta-oe/recipes-graphics/tslib/tslib_1.15.bb
index e87b411a8..7ae941a3c 100644
--- a/meta-oe/recipes-graphics/tslib/tslib_1.15.bb
+++ b/meta-oe/recipes-graphics/tslib/tslib_1.15.bb
@@ -5,10 +5,13 @@ Tslib is generally used on embedded devices to provide a common user \
 space interface to touchscreen functionality."
 HOMEPAGE = "http://tslib.org/"
 
-AUTHOR = "Russell King w/ plugins by Chris Larson et. al."
+AUTHOR = "Martin Kepplinger <martink@posteo.de>"
 SECTION = "base"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fc178bcd425090939a8b634d1d6a9594"
+LICENSE = "LGPLv2+ & GPLv2+"
+LIC_FILES_CHKSUM = "\
+    file://COPYING;md5=fc178bcd425090939a8b634d1d6a9594 \
+    file://tests/COPYING;md5=a23a74b3f4caf9616230789d94217acb \
+"
 
 SRC_URI = "https://github.com/kergoth/tslib/releases/download/${PV}/tslib-${PV}.tar.xz;downloadfilename=tslib-${PV}.tar.xz \
            file://ts.conf \
@@ -21,7 +24,33 @@ UPSTREAM_CHECK_URI = "https://github.com/kergoth/tslib/releases"
 
 inherit autotools pkgconfig
 
-EXTRA_OECONF = "--enable-shared --disable-h3600 --enable-input --disable-corgi --disable-collie --disable-mk712 --disable-arctic2 --disable-ucb1x00"
+PACKAGECONFIG ??= "debounce dejitter iir linear median pthres skip lowpass invert variance input touchkit waveshare"
+PACKAGECONFIG[debounce] = "--enable-debounce,--disable-debounce"
+PACKAGECONFIG[dejitter] = "--enable-dejitter,--disable-dejitter"
+PACKAGECONFIG[iir] = "--enable-iir,--disable-iir"
+PACKAGECONFIG[linear] = "--enable-linear,--disable-linear"
+PACKAGECONFIG[median] = "--enable-median,--disable-median"
+PACKAGECONFIG[pthres] = "--enable-pthres,--disable-pthres"
+PACKAGECONFIG[skip] = "--enable-skip,--disable-skip"
+PACKAGECONFIG[lowpass] = "--enable-lowpass,--disable-lowpass"
+PACKAGECONFIG[invert] = "--enable-invert,--disable-invert"
+PACKAGECONFIG[variance] = "--enable-variance,--disable-variance"
+PACKAGECONFIG[input] = "--enable-input,--disable-input"
+PACKAGECONFIG[tatung] = "--enable-tatung,--disable-tatung"
+PACKAGECONFIG[touchkit] = "--enable-touchkit,--disable-touchkit"
+PACKAGECONFIG[waveshare] = "--enable-waveshare,--disable-waveshare"
+PACKAGECONFIG[ucb1x00] = "--enable-ucb1x00,--disable-ucb1x00"
+PACKAGECONFIG[mk712] = "--enable-mk712,--disable-mk712"
+PACKAGECONFIG[h3600] = "--enable-h3600,--disable-h3600"
+PACKAGECONFIG[dmc] = "--enable-dmc,--disable-dmc"
+PACKAGECONFIG[linear-h2200] = "--enable-linear-h2200,--disable-linear-h2200"
+PACKAGECONFIG[corgi] = "--enable-corgi,--disable-corgi"
+PACKAGECONFIG[collie] = "--enable-collie,--disable-collie"
+PACKAGECONFIG[arctic2] = "--enable-arctic2,--disable-arctic2"
+PACKAGECONFIG[dmc_dus3000] = "--enable-dmc_dus3000,--disable-dmc_dus3000"
+PACKAGECONFIG[cy8mrln-palmpre] = "--enable-cy8mrln-palmpre,--disable-cy8mrln-palmpre"
+PACKAGECONFIG[galax] = "--enable-galax,--disable-galax"
+PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
 
 do_install_prepend() {
     install -m 0644 ${WORKDIR}/ts.conf ${S}/etc/ts.conf
@@ -32,9 +61,6 @@ do_install_append() {
     install -m 0755 ${WORKDIR}/tslib.sh ${D}${sysconfdir}/profile.d/
 }
 
-# People should consider using udev's /dev/input/touchscreen0 symlink
-# instead of detect-stylus
-#RDEPENDS_tslib-conf_weird-machine = "detect-stylus"
 RPROVIDES_tslib-conf = "libts-0.0-conf"
 
 PACKAGES =+ "tslib-conf tslib-tests tslib-calibrate tslib-uinput"
-- 
2.11.0


