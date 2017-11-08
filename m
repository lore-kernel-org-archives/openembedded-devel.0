Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 1134 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 08 Nov 2017 02:33:12 UTC
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0053.outbound.protection.outlook.com [104.47.41.53])
	by mail.openembedded.org (Postfix) with ESMTP id 64054784A7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Nov 2017 02:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=iomsQrvEnYVVhncTn4CHvkuUeJZwHJue5NITDk9fwhg=;
	b=Jt5Q13vd4Rl09B/Ugdt/QRhoqvNvMG+/roeXhzEFg7cRvdW+RUA4aSSkga9XgDg65BP99eyNyPOYiub0p8oyA9e0f2D//g4lPLly30qZDV+TItz3+t75pynWVjDUPOfHPMdByKsIW3fASKheJw0kLyc3PiUWEy+0EFXnpmpcziE=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from columbia.corp.xevo.com (65.122.179.226) by
	MWHPR0101MB2944.prod.exchangelabs.com (10.174.170.15) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.197.13; Wed, 8 Nov 2017 02:00:16 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Nov 2017 17:59:56 -0800
Message-Id: <20171108015956.30135-1-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: CY4PR06CA0032.namprd06.prod.outlook.com (10.173.44.18) To
	MWHPR0101MB2944.prod.exchangelabs.com (10.174.170.15)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de0db230-2af7-47e1-291c-08d5264c7521
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
	SRVR:MWHPR0101MB2944; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2944;
	3:T7CiiTHFoW/1DlhRWfYmZXaMH19ZQEDcjj+ny8SWNZiB6ZYIQl1gDWG1Tqt4GO6RtEqL6fQ/+Fdj3VPnnbrjZZv8M6aEOv4WUAjWUl6X9NNl3ydfbHfCTu6Zw/V+9PYuZxOJMgnWA8NtQ3WzxWXk1nGs7nTZsotLPAxmuIcvT1dEOgkq7FH5g/rqpZd+PG8qxbYM56q8TCvjtp/0ck6FeAEJ8dN8Qww4DihnwUQyR9SY3bRui/PlBmBMWcv6tT7D;
	25:HiajccLBtltKTcuHRaZEwEqGNOj8Yldbniiectkum4uT7zxmwVhtOP8Q06VNHNIWCebRKwunCZpYhzjiyJWxeScdSQIbtQLJFpW1RQi6A1MzPimEwKMppZnBIP0y6p3oj8uGhV7KDkhyGBsYefE8LB5f18cBEWuZO/Dxscb4oy7s+yFVO5cJXNRkekP4omBD2r6iIQ27Z4ZUw4idaImdQRPr85sJx7XVucOqtSWn41ASWLxwPd8Kcc/dQ3nAbAUHAIOeIWOj/bydNwiZ9djdMFZXIBcynbXuaiGQttvxuw5JhOjjlidKwe+4jqjKwE9Iu8BZaQB3WWzpVp75T5bCIA==;
	31:mk+8YFdREFEJGUK3+gZHqZmx6MXmMj+1wRbDRqnylCrsgdwET6UpWLoZCn4eLyjtPmrmnAqpim6AcRJkoWho6aDA/U+2fbq/t8D1GqM6Mg0NAaCyrxJR+hPz7ZzsT9w774eACXwyDjpcoVckSdWwfvYC4Xpe9wZt5nkrF2Fd6jZHf6+tlpXPYa4rUVRTe/i7vIuGz4EXMO1THWNWXAkmot7wugsEQfrnxOZ0GqBxDfc=
X-MS-TrafficTypeDiagnostic: MWHPR0101MB2944:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2944;
	20:yi8W8NAgFShbJQMG1DFEy4snHNluNEQwZZf12nD/393W/JKhQz2JFegimSVvO5Fyico4HPNrIoo+SAYt2Rhjsj2MiPGe4tJ+o4eXU9EZFqU0pZXbzCmAN7beX0fxaIkJh/ZUHml3ezhl6jRBVLRenXYtBgiye4I7Ov2ENIsfovIuMB0dUBbFo1Gb46g9JKZ/DWpAGfFejARyM7u+MRyZaemUJE4kQ6jg3oUV3hP7RT4id+Ll4aY91P1JJFub8zx68ef0t/4N9oV8MpLOy89cFJwjq72rbUm4a9Oh/Gqeh7nQPKn6bdpjlRDxS7PlGMs8IJ+7pJqTv6Cxu5KjiVFZgUHA5HdfTELP2ds4bC3Z3WFo63dWHYzK++l7SJshKa/8tcgt8HPsMpwqC/pk9B+1Pke0j0sP7v+ckutdKGdtieY=;
	4:lO1pFP05N381FXhFX2AYnQJYuOC6Mcg5SRkqDGvv7TEJIIQkEATAyoUPqLbemucqB2N5xMkuDWUWc2t6YNuzYqsGr1A1lQExxlXb+Q7r8kvunqy6GhCMDnyLWmG0XijnamV087bnZREuWeYKWTaoc2V3ACNQ51LSiozjhE9clD1MhHf8Mt37S1L2raw5UBbJMpjkNN9m98gk4NlcMJGweF5gZ4gI9xL6PUL4b7eWdD75tLQm4wLeOVyp8erwtd9Rt527nc8eUaRBHxOGe9DeAQ==
X-Exchange-Antispam-Report-Test: UriScan:;
X-Microsoft-Antispam-PRVS: <MWHPR0101MB294410971247591F9F77E9EDAB560@MWHPR0101MB2944.prod.exchangelabs.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93001095)(3231021)(100000703101)(100105400095)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(20161123562025)(20161123555025)(20161123564025)(20161123558100)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR0101MB2944; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR0101MB2944; 
X-Forefront-PRVS: 0485417665
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6009001)(346002)(39830400002)(376002)(189002)(199003)(6306002)(48376002)(6916009)(16586007)(50466002)(316002)(105586002)(50226002)(106356001)(5660300001)(6116002)(101416001)(6486002)(2906002)(25786009)(6666003)(97736004)(3846002)(2361001)(53936002)(2351001)(7736002)(305945005)(86362001)(50986999)(8676002)(575784001)(1076002)(81166006)(81156014)(66066001)(36756003)(33646002)(5003940100001)(68736007)(4326008)(8936002)(47776003)(107886003)(189998001)(478600001)(16526018);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0101MB2944;
	H:columbia.corp.xevo.com; FPR:; SPF:None; PTR:InfoNoRecords;
	MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR0101MB2944;
	23:1iaHfhTauGTbI+lwYnXp81C757uGulhqTb16fyE?=
	=?us-ascii?Q?l8tF5FgXdTH9wGKL5jGNqOCWgpkLNMldqnyN/BHWk1lEG9CvgNm5fAh5Vjid?=
	=?us-ascii?Q?vvniR3uIvj7rDCl7I+zUzikZRkQoMpjMWl5UQ0LjDsOK4MxAhhIhd6/JQ+u+?=
	=?us-ascii?Q?cE/5TW5pOydjCVDL8XJPYSsF6AjWVYXcNbCSIc0ExBQ2R13vCF+kcVkltwOd?=
	=?us-ascii?Q?gcA1W2dSiob3oCXibnWXytmjWpjnkEBMIQ8zsL/q2W/M29/xOb7pwaOFBx8k?=
	=?us-ascii?Q?kvpSKyQkb/9axl5lFEU1+nuJVa29UewmA3quPSVWKxSH1QWMpNXJkcdYoW6X?=
	=?us-ascii?Q?hFNU+FF7bY5ggwb5Ar3tT6xkeNT3uMggeaX6fyddTXeQ+zLez5q6bsRG1cbr?=
	=?us-ascii?Q?TgaLbsgloOU/rJD4ZMwHysds+qFlHBj9Ivkyr554RY0qudBVjh3nLzMFc6s1?=
	=?us-ascii?Q?0PF1eveGyYUhG8tCre9HPSd52h1O2QGKgwusRSM6Py5cubPzvPL8ZtilPL1a?=
	=?us-ascii?Q?SNmx1gfqoDzTo3QVup6bkrPRiWVEtd8a8IEznFyxhrWZJMg/H/vN4TQc9dnY?=
	=?us-ascii?Q?/E6MGT05lMfKG3Q5ywO1MRBkoOoBpP66jq6EYanoUaWmPsmTmF/YW1pgfnQR?=
	=?us-ascii?Q?BkmOXXa8S9wePCf97zjjSx1R6uMakP5YJ8/s5T5Ml231yYYLnldJnM/hTr71?=
	=?us-ascii?Q?/ruK7DmokaMv4Y7hUnCb3XvGJnU+Q0QnC1CIOtQR+tYEXduhkTmBmpomKKCU?=
	=?us-ascii?Q?YtyFrcO+qCVgrVqIPv0b8WG+EvTzrEz8SEkanEqHJ6YVxvZDWBjdPZBMlBh5?=
	=?us-ascii?Q?jUA5KgXSb5XOrcKc7bPcy9IQurGgZksAcbp9BdbXTgNyNdWHDA4swtn3TKNm?=
	=?us-ascii?Q?GbMAUpXEIqIJghABq5n3YwDe9SYHuv0Tz1jGQWfzsRUvd4UdbCeIgjLNKfUb?=
	=?us-ascii?Q?ZzoDHgwToxnvXNHsZ0p7N7jVjEGbXKw4DiKCM7/ff+8YmCyzfOUEKUDpAGFQ?=
	=?us-ascii?Q?Osig87wKTM6/Ub8EASXfK+5of3smUA+5784z5vqepK/7DSl3SL4ErrPWXn6L?=
	=?us-ascii?Q?I1jLLAJBJKCxiVs8r9svlZGi8llX8PyLMfzK/yLEK5lXOb7pz/wAsjttVTy2?=
	=?us-ascii?Q?bT3IWDHXEqRI=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2944;
	6:ZR+RR8bvPYlBllBvHMXFkLJ1xDHHPdU5FCXCIlOJxW9L0oVoipwLYAPFF71BGH3f+7Qn0CJV4V8SbgSxSCnzxSurrsAo9CAUPTKkBSAh1oC4f42trpdaA+hzh8/Swxoh3NJRkecV65ffuBTSibRd5yFsbyHT9X+rntyyn9BQ77A7fkosokLMz594dSyT68mjE+PtP8bl0PIJnhG4b4WBzfRLK5DR58oYjlqlZSyzWZ4721Nx2j9Xeu43+b2Eu90MUPm/8wrBIiC1FHfX1lBDbXboKXUvhbidmwaivFrrDrcCm1r0Me4aLke3zpfYhHyuFQp5Sjgw7y79n+gCZ/LgCp+7YXYKsJUcFk39VTJBqSE=;
	5:wXDrRYmEnmGI29lk/Y5bYh5RBDjH77MRMvJtxmrBlf+0Q1KnSk04WAjEqQOykDhwiPSkZBHdwnVyFC0bbqfbALPhZXCFyQcvvh4MN+JRl6C7L0nUgu6cfbsZ9iBxUmLdW8AAPV1qcQ+G4AQGT8o9U8O40dGqsaBWIEikSp5nwJM=;
	24:hLVf6ATOOkdvMyoTpCBwfeWq2vS+hKZYNp9z77EjEk6qOJjcEOSyvr2WuXWm9dckNTWgbn409Z7MllqUPV6lWsjjqHwbI/7ucy5KxZHabQY=;
	7:FKgaV9LLZGQggVNjliKfkVOAap9dBmyNViawe75j1wTRpLnn5TPb5sfj9Bz8OrCwrV46VRYNIyWiq6YvRnrps71YSUEqrDBrS1uvMk7kZnvr7PUXcqSU3IvnPLdaOHBxy31BF8b8igB+rfYvLfeL1PfnZN3818LjXUOIP0rsdT5Z83k7nA37mUJgq7d6UYx374ULDkf+o3s+UGcPcd8XYqudnOE0zrL06jGhi4ykSSNWxXQy8mTXJbgHgxjds0u0
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2017 02:00:16.4614 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de0db230-2af7-47e1-291c-08d5264c7521
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB2944
Subject: [meta-oe][PATCH] usb-modeswitch: add usb-modeswitch@.service
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
X-List-Received-Date: Wed, 08 Nov 2017 02:33:13 -0000
Content-Type: text/plain

This service is essential for making hotplugging work correctly on a
systemd system. Without it, USB devices get recognized by systemd
instead of the usb-modeswitch udev rule, so hotplugging breaks. Once the
service is added, hotplugging works properly again.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.0.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.0.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.0.bb
index ff439f321..ac0df8bab 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.0.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.0.bb
@@ -8,7 +8,9 @@ SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
 SRC_URI[md5sum] = "38ad5c9d70e06227a00361bdc2b1e568"
 SRC_URI[sha256sum] = "31c0be280d49a99ec3dc0be3325bef320d9c04b50714ef0ce1e36a614d687633"
 
-inherit pkgconfig
+inherit pkgconfig systemd
+
+SYSTEMD_SERVICE_${PN} = "usb_modeswitch@.service"
 
 EXTRA_OEMAKE = "TCL=${bindir}/tclsh"
 
@@ -18,4 +20,8 @@ RRECOMMENDS_${PN} = "usb-modeswitch-data"
 
 do_install() {
     oe_runmake DESTDIR=${D} install
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}/${systemd_unitdir}/system
+        install -m 644 ${S}/usb_modeswitch@.service ${D}/${systemd_unitdir}/system
+    fi
 }
-- 
2.11.0


