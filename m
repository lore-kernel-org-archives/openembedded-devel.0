Return-Path: <niko.mauno@vaisala.com>
X-Greylist: delayed 21396 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 09 Apr 2018 22:03:49 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0045.outbound.protection.outlook.com [104.47.2.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5C7F974A35
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Apr 2018 22:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=Wi1snmDAX/GjpEYsjyppYNoryLbrC7R8uDScIEvB/wo=;
	b=U+rG7+yurqnE9ycMWMILmzGMcmCy45YcJWdtAmD0Sqg47D/6wPxMyKmR3lUhdlEy6KU8nN+T/alNPqmGfX+theoG457i2aSpEEKdWz67aoGFzpWK7diD43FdgWb9CZxa/jbKQss3moh+UkV88A5eMQmSuhL1iEM+YoSeQuxABG4=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=niko.mauno@vaisala.com; 
Received: from ThinkStation.vaisala.com (193.143.230.131) by
	AM5PR0601MB2529.eurprd06.prod.outlook.com (2603:10a6:203:42::15) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.653.12;
	Mon, 9 Apr 2018 16:07:12 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Apr 2018 19:06:52 +0300
Message-Id: <20180409160652.4835-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [193.143.230.131]
X-ClientProxiedBy: DB6P193CA0003.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::13)
	To AM5PR0601MB2529.eurprd06.prod.outlook.com
	(2603:10a6:203:42::15)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b237440e-db56-40fc-584f-08d59e33f4f1
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:AM5PR0601MB2529; 
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0601MB2529;
	3:JJOUnzSQJeQ/xeyQH4YXAj2e/YzOeHdbKze0PlJ1+wqjD6Q1o0WyhBAwyM/TCnbYS3Z4PqIClo6/++6kJ9D7i/JWYjbVexo+cpKa2cc2dHuF12TVvGEng00SMQpRNgyst7krU2hnMMfnDsgvEaKW6OSmuW0L6RsBV9+CPS7LOoWIMFDSwNe6HtiQHGeOvyRmD4MEE84MgtjGlTctq0Jnpa3+77F08umj/ZAGOriV9VDUffRotTuvc4za9Gv8ceAh;
	25:CX7eeKYOcuzmqNI/CwIPj7KvjRz/ZDBEcWvK78QmQX3mcFc06Tv4bjO5d5KfEbz+F5smpOlbyc+jiukd0pmx2OhgWx3+Z0/Qjfug8XwbqrMO/GNOtbnWrO7Cb+P7/ZyRd6YaxF7CWwsHBCTcjwCffT+oXGuJ0Evokb/0jyjnTN9+3nHepljULRx3QGi1ByTlO/M+LdhzWo8twtFEsOAdZfS3n0dXtkeiiolEFEo1xVAjufLxXq9J/V5OntuCPoCHQJ5ioe9ruK+7y90toXVyKpoZofIFVvtvvVnvWq1evC9ksPTrrSZZafzWIqRQaQ2ZoMXmrWfge2siLaiVViSljA==;
	31:GsTvt/AWMx+VJ4UTfv6Qtv8yhCAqsXzgy5rHJV2EJv7FDiA2fxOU7Q0fyIIuA8jpd3FlfZ0NXtsSokE+b57ZnJ1csw4nOSdCQiyqMtl5R1Rh/8ATYGOQnNIL82SDkveWZEM0vQtrbJ9WDHPwqHcUUF8dNxTHCQ4qICjsPRrxqsqpjFpJufbft11WcUQHujlrxdiIkbw6XTyUq9pm4o9mLWQVYxpXHuNOnwLcTnMk5ag=
X-MS-TrafficTypeDiagnostic: AM5PR0601MB2529:|AM5PR0601MB2529:
X-Tenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0601MB2529;
	20:hv/sqkxnQnY606RjjUIrWWM5jpdv8SeJzo/h4n5NZr6zKkWK5jugbV8cvDDHFkiY0ftawxT8AvB1gZHrvXvuMcDgjdwWEwR22+a4hjHr3yvuJ/hz9BFL0HICCIeigO9L42Xw422Qy5HzRFe4lCFw2L52mZ5q3YGj6O3xzd7DsgA=;
	4:KoS9e0ipIyEjS+UDo3XBIp2D0lE7TGIu0+SxEnOUxOsXGoYulro5mhLIJswbeDfoCTj3yt+ypRqnvUYQCm9DchQDIjDd4iVM8nIiYg2Q7MazZMpsz0u8lbFBJzrPF940I457iY2AZHh6h/u84FMfWxa697xocTuEZbHN1Wy+FagpaQRziTd0ERrOZPK/v2/NR3bfjzcLV28daNPSnggPquOSN9jMY+MVl9v6nuYpa7cx5DpgVMrSOWThGwO5j5MiUX0YDAhS8kBPQmWzl3v00pW8vnVC5Z1IrmoJGkwrlJzZSnb29TC0xrv2YjaDIAYT
X-Microsoft-Antispam-PRVS: <AM5PR0601MB2529F36E0BD436E9F2D5D13081BF0@AM5PR0601MB2529.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(3231221)(944501327)(52105095)(93006095)(93001095)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(6072148)(201708071742011);
	SRVR:AM5PR0601MB2529; BCL:0; PCL:0; RULEID:;
	SRVR:AM5PR0601MB2529; 
X-Forefront-PRVS: 0637FCE711
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(39850400004)(346002)(366004)(376002)(396003)(39380400002)(199004)(189003)(486006)(2616005)(956004)(305945005)(476003)(68736007)(478600001)(7736002)(50226002)(8676002)(8936002)(81166006)(81156014)(106356001)(25786009)(105586002)(386003)(5660300001)(26005)(4326008)(1857600001)(186003)(16526019)(48376002)(53936002)(2906002)(6116002)(3846002)(1076002)(59450400001)(69596002)(7696005)(51416003)(316002)(6306002)(2351001)(2361001)(50466002)(36756003)(16586007)(107886003)(53376002)(52116002)(86362001)(53416004)(6666003)(6916009)(97736004)(47776003)(66066001)(6486002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0601MB2529;
	H:ThinkStation.vaisala.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: vaisala.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM5PR0601MB2529;
	23:Ds4f0uWP7y3H57yHJFY4qV5Khr3yoL+ZXun5n0q?=
	=?us-ascii?Q?xwEbRiRtCr7cwZv/XPmRQE+/ayLZ8yF6WhyTlvkvJWiRUXKz9kjND4O76HrW?=
	=?us-ascii?Q?/8MxIOcEIT1spo58aFOGx/MXW2Pb6jFBONMH123uLPrPeJ52FMvPl7RYXFxV?=
	=?us-ascii?Q?lEVK2nApKhQucXXRLkdMQni/ZbHqz2AAEvmdrIM/3qVhMbgJMiK4XH6hqcOx?=
	=?us-ascii?Q?70VDWjWP4dDluQx6tf9gsOpU+Ym9nSMwkKzFdTtIWuCVAJq6MWrZh6xG6NzA?=
	=?us-ascii?Q?rfXDZ1hka44tD06TbninR8NtZj+B1DZQHk93oN2fEJEd6LGjmv4m5ve0QiZt?=
	=?us-ascii?Q?Gnzr/3vUEgkTqdkLB+iK0rqSUVC1dbJ2hWclQDtCoWvpQ/Mn8pCMMeqBQPNg?=
	=?us-ascii?Q?o/hi6XJD+QXqlssauAOClR56UFtnj372OTOIl4X/szxLRyi2BYKySlM7QMhw?=
	=?us-ascii?Q?qKOxRavfy2Q9syTfRyQiEBctQBvzcUmWDDRiPSA9ohj0a/qi0aNXnjhOvniq?=
	=?us-ascii?Q?cXxaK+kbHWNUskNRRCWhH24gFlYj/3LfMqkw6jafnWssT4pR6Bk8f69pd5VZ?=
	=?us-ascii?Q?L5nHdemyhgYrnWI+P7noMKE80dkIArzrqV0a6jTa7bHh1JHk1HxYbY4Wlhyv?=
	=?us-ascii?Q?vpXDQGue8Zd5bAYjAGlB6nAN7OGVlUL5IN1uo0SHDdk0M8r6KB+HvB1tlMpM?=
	=?us-ascii?Q?NDP34jpAH/qzQCTQOvb4d7z/RpanZPIeamP2HmqEgUsvZ90zNbtiu67qPuD7?=
	=?us-ascii?Q?wdFsuj1uOhyMjhl0uw05+rMqbdB3TOOZSfJstw5DwMgJ7EHerLc0ZDVyKfdt?=
	=?us-ascii?Q?6DzhQLhwdHpHZVU674wcRJ8D2DrHwRNX733fmtEVxRtgg/r9A/kFbx4PnJK7?=
	=?us-ascii?Q?lEFXZzBbG34o1tPCmJhtlp6Q710QN5KlnNfIB25PKn97mUA305O0F0szy9Mw?=
	=?us-ascii?Q?axnldEggdNZgz2i3xqo4OUtW/skB5NBEXCcC/AoYy3NJv0JC+FrirwdAHT6e?=
	=?us-ascii?Q?6yqsVijvGVZ4Ils8GhnFXemwinx2YBp4abInan3lpbwHqaW8xoCfciSMXwC+?=
	=?us-ascii?Q?joDvYR0m/Lb1I4QV9Vkb7UDxgNH4smJX8uZnZPZndCeVe4HHj5t6dXf+/8jI?=
	=?us-ascii?Q?/c5+7chR8Aa1m5YhTK5LFdnekxP455oHCIYgiQ3bnaXsjIIPkKJz09D5mwK3?=
	=?us-ascii?Q?sNjATEjJ/UVoNu+U83i7q9Q5Zk9TgFXV7e0orF8fCjQMyXINAp8ug82J0NAQ?=
	=?us-ascii?Q?0y8/2OVZxUlR0DtMzvmn2QlI7Wle9yWQOU4eqIgu9eaYVtk93hYzXr15Vv2k?=
	=?us-ascii?Q?6KfyGC2r6sYeMq2NW5dGjfX8=3D?=
X-Microsoft-Antispam-Message-Info: TYQQGMswuS3GfCONdvw1uAX/wsaBamOnL0VC4nBIl4iMSV1f6wd8KS8ifyjaBwsGbDEGGUbj9f/GUyYvpF3387Eq9413E+kopItQvdGfoXcgoCaRDsuLuvyUTKHe3UhzNrwOdeHMGljv1DBWGtcGh3RoI8XBnBxe3MMPK0+pzpr58X2Gut3rUlNAvFiCi3+l
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0601MB2529;
	6:zbhekISBvm5GCGgQ3kgmo1wwAO5wllKfsOaqHwZKI12Plzl6AP0exQKkMlNE1H82uLTbQfKET/9kyd3YO4ngkFdzTV+Ueu2rkODFCPAlwT4A2DNp91ylYPv675C/ScnHXwbGbQuD4U5eomSvV3ue4LAziHDf4ndCM2LN59vSzqF8nv7Lnj4ti6OJ/7Os+JtqX7MIKZ9ASmFQrZYIuIlQ1jysw1QTD/PmzDynTP0hR5KsX4JWGFou/vV8cdru1O1kLuOBYld5QPf5jyPduLQYxQgWd0ouC6U3a7eG08F8X9UTiN403woe1Z0OnRVWEyUIHzz6Vr0DSKSKl2tOcLIXCw71v+O7Al8je4r9P/348+T3SJc/W7DNMfBJ2ucwcclp07eW9/WaMwxyAz4nto3+99+oZWuFdFdMSd+PUiki7v3iwIaGs8wFpG9yDUR5PoLcAunVNbSfjzHpLN8rJ7HOdw==;
	5:zK9PHWH41ZrPwkFkfoqkqfn12HkGOyLIpTxcR5D5c09pxChwdXAT7taN1Py4eJy/yWzsUNHqv3zAz6u4cnedhhXiKLSLmED4sNorAxxb7VILQX01/KPM3SC59gUlP0L5HldLWhHao0hayuYNVXNov480mSYTgs46b46VZjfTPdw=;
	24:A6BoPiPWiPGFi0csdiSx055BPyaI7fN6nIaUk/PkrQtvlHePfxxMQD6HUCRicQXbvaDNKfWocRsVM8NDQ241D/+dxEU5Fw3nSMhASBYJx4U=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0601MB2529;
	7:DDtoit007axRwHnjz/KQe2sC3WJmyFETWW8+StnIb0S6zU/CUMdyDNNTtfcJcR1KsIMxUptp5jWfXydoiVi8UDsduQfjeAd/LPx/MX5Pd9VwECnLg9SQObKvDErnKWj8dbgh+j8hSlTsa12PSi1dg+P7W95DzJmly9p5MQ6OqOru6dzrw0LeXis+KdZgw84225DeU1PBWGNl4XYgnCQTkm1l7g3PIu1wZFMBFQz30EkgYjraZvbnoRk798ylsMKj;
	23:QtLfORk4f5tMC8FS7vXGmeWj7OmDA7kfajTXZId897I1ERHt6JWgKqRAgC8AiLDN+U6dOcOdJCv0QWfbKlzGnWON4ckAUI0MpqRbhQH/CQFiI2Wg7dgGWVatnZ51uaf2WX0zZ8IkJgksz/GAl6V38g==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2018 16:07:12.9959 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b237440e-db56-40fc-584f-08d59e33f4f1
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0601MB2529
X-OriginatorOrg: vaisala.com
Subject: [meta-oe][PATCH] tslib: Align recipe content to better match v1.15
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
X-List-Received-Date: Mon, 09 Apr 2018 22:03:50 -0000
Content-Type: text/plain

Respective changes to recipe:
 - updated AUTHOR field to match current author in tslib/AUTHORS file
 - updated LICENSE field to 'LGPLv2+ & GPLv2+' to reflect licenses in
   v1.15 (LGPLv2+ for shared library parts, GPLv2+ for command line
   utility parts)
 - updated LIC_FILES_CHECKSUM to contain COPYING files for both license
   families
 - dropped EXTRA_OECONF altogether as it contained just obsoleted or
   implied configure options
 - removed commented-out detect-stylus lines (a detect-stylus recipe
   was apparently available in OE-Classic)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-graphics/tslib/tslib_1.15.bb | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-graphics/tslib/tslib_1.15.bb b/meta-oe/recipes-graphics/tslib/tslib_1.15.bb
index e87b411a8..dca5506b6 100644
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
@@ -21,8 +24,6 @@ UPSTREAM_CHECK_URI = "https://github.com/kergoth/tslib/releases"
 
 inherit autotools pkgconfig
 
-EXTRA_OECONF = "--enable-shared --disable-h3600 --enable-input --disable-corgi --disable-collie --disable-mk712 --disable-arctic2 --disable-ucb1x00"
-
 do_install_prepend() {
     install -m 0644 ${WORKDIR}/ts.conf ${S}/etc/ts.conf
 }
@@ -32,9 +33,6 @@ do_install_append() {
     install -m 0755 ${WORKDIR}/tslib.sh ${D}${sysconfdir}/profile.d/
 }
 
-# People should consider using udev's /dev/input/touchscreen0 symlink
-# instead of detect-stylus
-#RDEPENDS_tslib-conf_weird-machine = "detect-stylus"
 RPROVIDES_tslib-conf = "libts-0.0-conf"
 
 PACKAGES =+ "tslib-conf tslib-tests tslib-calibrate tslib-uinput"
-- 
2.11.0


