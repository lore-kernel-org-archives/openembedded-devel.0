Return-Path: <neenareddy.busireddy@nxp.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0073.outbound.protection.outlook.com [157.55.234.73])
	by mail.openembedded.org (Postfix) with ESMTP id 95ED06E666
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 May 2016 19:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
	s=selector1-nxp-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=otou4JGQ0jFxx74rDNf4zLzv8Hzmbyx9uWLd8XSJ30w=;
	b=DECbeciJMHzOah4OoKjZDnSBgziPA8lGfeUJ0XSr0e+pH+Gz2n30zjVxHzh08I6otkOF21UaVidDsPQWplX+b6Xkz8M4S1jQpfkaN5kSpk91R3ZGjWT89dcZfeIh7I7KJQPRnZqh/gGHUHRYx87X76yC+rBxMd9nI6u2puNoLCQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=nxp.com;
Received: from change-01.am.freescale.net (192.88.168.50) by
	VI1PR04MB1582.eurprd04.prod.outlook.com (10.164.84.140) with Microsoft
	SMTP Server (TLS) id 15.1.492.11; Wed, 11 May 2016 19:43:50 +0000
From: Neena Busireddy <neenareddy.busireddy@nxp.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 11 May 2016 14:41:48 -0500
Message-ID: <1462995709-6171-1-git-send-email-neenareddy.busireddy@nxp.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.88.168.50]
X-ClientProxiedBy: BLUPR0401CA0024.namprd04.prod.outlook.com (10.162.114.162)
	To VI1PR04MB1582.eurprd04.prod.outlook.com (10.164.84.140)
X-MS-Office365-Filtering-Correlation-Id: 98c96861-780b-460a-bfe5-08d379d493a0
X-Microsoft-Exchange-Diagnostics: 1; VI1PR04MB1582;
	2:yncmWaIOBNgd6R/wON+gqucJE/hOxh+Es3ZG3b03y7QqvwgnFtsjXZAiXGbY7EyygzBjQ9R0Ya5ycyIpyV/2l83fCkK6D/s810I/MkxGtTsh9pjmR0jhX/j2afsACETbsXzNOSGR3OGXfiPUOZEAH/pdbtw9k04Gy5jWY8/GhanNifeqaofLIMHHFjfXK61I;
	3:lil6i1rtslbx1/SZpFnlop2NVmvLneIeJUvgryeYaTOdCO0Y93ykOmiRnM+clEzsVCZ9W+TuseBWPW1GfVr+ozTEKoYWnxB+QQZD2BAIWANhgh6+PSEUqyTrjFNbH9qW
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:VI1PR04MB1582;
X-Microsoft-Exchange-Diagnostics: 1; VI1PR04MB1582;
	25:QDhWscwHvbhis4eZ/SoiV5wmUWMikjM7WMbA1NQ6ITuUJOLTE4HCLaSG5J0Aeu/J0Z7T5z1ErfBr/qBAT+PeoPe06todZd9cbgBSR0D7TEIVCoOjJhrtnRtiArkhFkhcdVEzpzKf6izl6fOylKVawx4SSiOK5So5ZJ8f6/HZqbMKP3blozfl4Yix1bTE6hrjWOrnKdYJ1NGi8MOV9Wvhn8wg/lKOKhMHMusPmgsv7z+IpPIMEtU+G8t3w70OjfgZ7+E/XoiFE7JeyR0y5RXmtbd8tCgHmbuM1N8ANo8PYg70XF+oBjqaiD0pEFKQ5dqD4Hwr/u4E+YU1hfn6nhYL3007MksrKkS9kSuGynT8HjUpVrInM+ND1RV3l0x/8uSJiBQv9+u3jGvSQPZaDAso1V6Kn9rwtPVXLbuc8HvSS10WuIGzHhBdWykw66yB8oTWP5hwYohvUI/ABq4Kw9uKUZ+zTq6Vwl/L8+lHHDGdRc+u/rD7qZ1P+KjfjeOlrrcJnGFs7ya3CS38ymax8HC7zwQpB7EJCz/ErbtU5hXl7PBNmyH9bBU2CIwQt5tWdsznDePz3nbqFuKu578JNBZiI2Aci5x5pw1tCFQfWIERXamwdWfjL0zcQiZowSIPIV2IYgzqzyvhQ56yW/VqXcWgRFDaCUOy8SuFHb6lpom0CwM0gOP8XS2K6Y6lYzcw6u6N5OHuCP7TXmZUqMxdUfy8vw==
X-Microsoft-Exchange-Diagnostics: 1; VI1PR04MB1582;
	20:FhhTFVE+kr87Lr5lIKpR9HU2Y7cFoK1eFZ2LPKj7OV52XCxN2oU7idGYk39XT3xPyI8D+9CYrnD92b0bL26NpcpwHcsskJuhnoK3aj4ScNCmhH55O7V9oPqYiX7bvyWKUT8A3av8QWpWdWZFGBidOyIT9Io2cDoNV3LiTJ6dpxLU66LdlzoYQ0gxH74IldInL+vXrCge17d956VKfQrsyAQYtpXPrvqCe0RS2ZTwEV3hMjk6mkrzj783v8sPCcWZ8XL1MRjJnJYzaPVy2kjechAJuSpYoV2ne1zW7U82ZURt1QSdPXievGxdu6LFlIfTL5/94y7toOOYZqH+O/13m4KbsBp/L8ReP0UiJkSsD5UNgQAbCDGejFw2bX+leylQ2KbL/jIBbmsIPSIMJuQTmbY0kBjnfyLEnBbkq8wjPwfYrvF4q9wz8ffE+uRQ+2MWRODkcFbBu0+A9oT+Wh1RIOKeLS3L/BHZYrBIm1BiZbJJHl9ToLxts8ezk2YQQINi;
	4:yXMt6cM/EPa6d6yKSWZMTY50neAwwBFWWox6kIQNPODlV4Z/AByX+JBwPQymWv2dGxCcCGQYEPCin0SCC4/jKTRGLOkKyt54TsVlJA9q28PcyNNW9I2BR07anJSxbOYIbjlK+DW6TC7MJpFoPMxIqNyStcULjbqFNDF+efOXhKDfzqllw4oaWJMiwI8iuFVGWyopjuSXRrHNMVz4p8RQVCNzAQvCWFAm997yF11SLEKIsifyFbjRcjXhcgC5DQEjHcIoMvWhKd8ILKEEISnfe7hnqe/TBk2eLfUsM/YyL2l4Dd80RW0s+mpCKyvyWciPbY0tBbB6Rb8YPMpZJGHc43B2qhRMi6+UxCCs5DhcCZzk2PEbi6iWxFMTnkh5+cKJ
X-Microsoft-Antispam-PRVS: <VI1PR04MB1582D80AF497863A98F5ABDC91720@VI1PR04MB1582.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6055026);
	SRVR:VI1PR04MB1582; BCL:0; PCL:0; RULEID:; SRVR:VI1PR04MB1582; 
X-Forefront-PRVS: 0939529DE2
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(5003940100001)(6116002)(3846002)(2906002)(4326007)(50226002)(586003)(86362001)(47776003)(450100001)(19580395003)(19580405001)(81166006)(92566002)(36756003)(66066001)(110136002)(50466002)(42186005)(5008740100001)(5004730100002)(77096005)(229853001)(189998001)(33646002)(2351001)(50986999)(48376002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB1582;
	H:change-01.am.freescale.net; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR04MB1582;
	23:2hxRYSTuSON2aXW5mkYuEWVtprv5SB94d4RcOKwahuerLdnkEoZT3gqz3J4re1JiTByN3EPoTaXu26yKpbiDIx8ikdWXJcx5FxEOrQexoR6pugy8ucMFqiykAJTwdSVSx2snOv63rWUvsFGedz9pXbY4b6u1X1YkwpYuC82HXkLz+m6vAZx6lp5INpOSWjWbCrLzfo0ePK1XrsPCTd2YrpKmZVcj3Q23br+vdXlxMmjlepvyCQgTnHNoa8ANaloLmdmQOGtqLKGaSycuBSdVqI9SKozKsvBMfsyj2i3srjQDMD5FJmw8Us+4V/pt82UwlyMpsUNOMHaRr0bW6srqlZq/H/X9Q49du9mJQgajI0Tyj/vQoE4b05HCA4co4+EhD5EGUSzIoQn+CNSsb/PRkbhxm9SbOqSC+UYnKPV/NobB4G+LHtSdAgX1e/rv6XNZpjArPTC30HV4PAoVwKOiQNx6C5B+PGe4GEZCoi3wVN4Cb4diUV/1firg7jK/Wk4pSwiVK8V87wmUo+BvwvKG/fX09156spw2vHVMe5B4UVNUXR3MHxY0k0UTTO4nfukrLK/tXA9NMcSnAWDB/Y2ke/syvEFJvtjRLiLxHqWKohEmrc1lWwQKgcAKmiMNUye1f392HHTzhJDJvULw20NBoshI0gIXcU6j+Nuokn8iQtpFNpSTkCTphJru0/IjHnImt6N13uhPEMWN3IxjYO2hHDMVNKu4iaVTobYAghq6HMHuET0ORWoAOx0EWXDTWNaHmA1etwutd7b10CnZpx7hzkEFGGEVlQ6AmstzQKIppgoKJc5fgSqou1l1s2w5d6dOUwkw0XCA804sTLhaU6GDig==
X-Microsoft-Exchange-Diagnostics: 1; VI1PR04MB1582;
	5:W4sQE3TSln41rOkyJO0XIskwRJDvCwrojI4+piHd6YVQAseEHNqzpuZSt4wD2ZHuYYCB5aiq7N+SSAbjrUMUBtzVvWF7RHwdhX2tEEf5rhT+qJKuZybxxt3MQ8+uoRMUIvWLuWGRaFVk6svpluFySA==;
	24:Vh78VK1N7bVRU+X4Im7pSHGpfyqT9lxuDJOdSG4G2emspHlABSlu2KSVCeDPtv/PO7TabiYUoEgDfVlNW8kikJAigrE5t/6Gm2iDhcnZS80=;
	7:KrUbotOhqYC/RFu7oJ7ijiGSVVSfPiqx7B/ncb/EGfaMi7UfpheAXlr9dx8sXjkeyfmkuu6GTrnzak/gresc+JYs6LFCAS5azM7nAq36124puYlvK16iKBCReVbBbdFVQpD7h0mObHuGJg2niLV6ys0mS97i8X5CSN5CWg0cOVnUCwl94V0+2RiZUAw2USed
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2016 19:43:50.0559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB1582
Subject: [meta-oe][PATCH 1/2] mesa-glut: Remove the recipe
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
X-List-Received-Date: Wed, 11 May 2016 19:43:52 -0000
Content-Type: text/plain

mesa-glut is dead upstream for almost three years now and it does
not generate library for GLUT.
mesa-glut is now replaced by freeGLUT which is a free-software/open-source
alternative to the OpenGL Utility Toolkit (GLUT) library.

Signed-off-by: Neena Busireddy <neenareddy.busireddy@nxp.com>
---
 meta-oe/recipes-graphics/mesa/mesa-glut_8.0.1.bb | 16 ----------------
 1 file changed, 16 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/mesa/mesa-glut_8.0.1.bb

diff --git a/meta-oe/recipes-graphics/mesa/mesa-glut_8.0.1.bb b/meta-oe/recipes-graphics/mesa/mesa-glut_8.0.1.bb
deleted file mode 100644
index 404ee53..0000000
--- a/meta-oe/recipes-graphics/mesa/mesa-glut_8.0.1.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "OpenGL Utility Toolkit"
-LICENSE = "Kilgard"
-LIC_FILES_CHKSUM = "file://include/GL/glut.h;md5=4aab626c830aed79d7b2e5a76dfa2dd6;startline=4;endline=8"
-
-SRC_URI = "git://anongit.freedesktop.org/mesa/glut"
-
-SRCREV = "ee89e9aeb49604b036e06f1df6478d32006b30cd"
-PV = "8.0.0+git${SRCPV}"
-
-S = "${WORKDIR}/git"
-
-inherit autotools-brokensep pkgconfig distro_features_check
-# depends on virtual/libx11
-REQUIRED_DISTRO_FEATURES = "x11"
-
-DEPENDS = "virtual/libx11 libxmu libxi virtual/libgl libglu"
-- 
1.9.1


