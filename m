Return-Path: <neenareddy.busireddy@nxp.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0085.outbound.protection.outlook.com [157.56.112.85])
	by mail.openembedded.org (Postfix) with ESMTP id 5C41060721
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 May 2016 19:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
	s=selector1-nxp-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=otou4JGQ0jFxx74rDNf4zLzv8Hzmbyx9uWLd8XSJ30w=;
	b=WDnvV0amhD1BbIUNtIgVAsKWaOqUie2VANAcism63OsH4YMrYYbKFmptHXhg+MyAhRhc37tlrEa9z8UDGnpFNOYP4OH2raSoVmG6BEeyhIoJ6q2l6Nl8s+iikXx03uHYteSZ5ywx+jQHWQctB+CjWD6A8+2aQVc+sdX7+TF9U2Y=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=nxp.com;
Received: from change-01.am.freescale.net (192.88.168.50) by
	HE1PR04MB1577.eurprd04.prod.outlook.com (10.164.48.139) with Microsoft
	SMTP Server (TLS) id 15.1.492.11; Thu, 12 May 2016 19:27:48 +0000
From: Neena Busireddy <neenareddy.busireddy@nxp.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 12 May 2016 14:25:57 -0500
Message-ID: <1463081158-10495-1-git-send-email-neenareddy.busireddy@nxp.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.88.168.50]
X-ClientProxiedBy: BY2PR21CA0026.namprd21.prod.outlook.com (10.162.74.164) To
	HE1PR04MB1577.eurprd04.prod.outlook.com (10.164.48.139)
X-MS-Office365-Filtering-Correlation-Id: 1783ae78-1b07-4ce7-6da5-08d37a9b80fd
X-Microsoft-Exchange-Diagnostics: 1; HE1PR04MB1577;
	2:TmZaQpgj2KEsnxwHkAVXFWgBygkInlRvZTFinnS5nA55f03H7C1KgIqvvIv7gONr453E4CpmIDdLp2u5G7wqR5wUT+Z5MgnWknCqHQpgETbWK5IJHbBEMyPiUYjEZbHQkW/EOCs7GcYCk9QPvSkgsprg1MGkYHHdFXbdLXMz+Kn0L6sxyLFn6+6bDh1kUlbh;
	3:lRBx8XLrXjR8vOViZAsjX+WrQjDZEcDmX0JY0RoPTU/5MKhbfEvMa7WICmrsNzAfRuPT+UDFHBojbJHwgpQ2Hb/eQJm9x8iwn/hkgIBq9UJf6gUJju+gJId46MwRc8QJ;
	25:0w/1i3t0dd+mlV4O/bjaTciimnZ9ZFU3imy7+j1a/pJBZM22YdlzoieQAez+pyzuMRhcQ3Gnp9y90ut3gsIZvi8OSLxz+w5Ppe6nKbNvs2pJLGRug/F5NYkv1dwGlrdCgm1MZglqo9FWBkHAyCdynqgP4zpnHG4Oq+9RCYixK21F0CFJD0jnWt7pnmSu39ZSRoW8uz9OwQpH7+RmUgqR0l9qr4O72dCgCtgJtNXlU+M86xcUTLVmoKrhA+a7OlTdwJoJ5cOa91zWPJGDQcQvi+1offz3aKuE33PGtNRONdRiPdk7cY/Czie6bGN75WTu/QjXjTw3UgwcqQuhQ41ENBxqPV0e8LzMZfa6JQ2Dd+0NtI5p2Hdr2DHHt5JyFlZ+fuWHuIdFhWxEQY/XqPXQp5CvkdiU7tmx8MxqOgbY1Sw=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:HE1PR04MB1577;
X-Microsoft-Exchange-Diagnostics: 1; HE1PR04MB1577;
	20:VlcIKZtHPMfUCk/T2jwO5zz2VPw4M6k/iPjqPoWjcfbDxXVCbBNm5eoio55R1Ir6m8AtF53fbI8/bM/MqcKVOxyFeB6lUOk2ir/OkLDPsr++Uj2MrZODY01t2ck8u4HYejAsu+T6U9p3ncEFe2z/L+mB44bCidxYUNbJsdzA9dUxt2BXplWCkuQuGT7+q0xZxCJ0qhFQH2feGTo28ZwXtR89NmRCDgIBFujU3n7coNreQfadH/6iNZXn+h3QLdTmCb7RlU8cNSLwedVF6OzD5l6QiE3mmqj3P2TQ6z2gIPDiZlCxE4nESOSDBqhUYM6JhfHinvnJ0BRqAlJrv9R2lOlEEHBrP7mUnxSRDyhpdKRMBxCKttp1JPaJ/+4bDSvMqb64Us9cijVkURRC37Af0QM+p98JFXiJ6VNJK7AvO1VL/bkvCdCXXdHNpVy52rnNxPWM9WBfTX47+5xpSmwlXtiYyOWF7+2o0/FJHWQhIjeegz+Ph46xSmq4YCL5aw3/;
	4:5kUKIE0MC7XmZ+C5nEJjhb073VozlVEh5JGHL24AIImrdI/UVDZ0cKNcblqSawjDOtU/j2Yal7gOcOUZIFAPdiXLTGaWEtAyul750poPwhvFgGw+pKg6S6KmzyylEG4FpBpY0jJIJm2jbUWPpd2mnNP+avLr8W1Qm+yYjYm1AVSKVkuK0Wa32R9sppCXxg0G6WG+O9QMz1Z0izxiwLcLNAhIm54hANi0oygIqaYKNYWPyajQn3JSlzNvftn0XWSGv2y+Jz7jSZYOyb0yNj7MwpDue2JxKdFuc8AQKnwhfveMk5Kcn/37gU4yXyA/9VeQFf6bO1UJgS4dwaxmMnAwUaGCQo2hgfoznn34dvCrQtVWzYuCWsEc1ePSQAh8UtcK
X-Microsoft-Antispam-PRVS: <HE1PR04MB1577952EF2AC291CC98DAF4191730@HE1PR04MB1577.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6055026);
	SRVR:HE1PR04MB1577; BCL:0; PCL:0; RULEID:; SRVR:HE1PR04MB1577; 
X-Forefront-PRVS: 0940A19703
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(50986999)(4326007)(189998001)(36756003)(110136002)(5003940100001)(5004730100002)(42186005)(66066001)(47776003)(229853001)(33646002)(2351001)(92566002)(86362001)(81166006)(2906002)(5008740100001)(50466002)(19580405001)(19580395003)(48376002)(6116002)(77096005)(50226002)(3846002)(586003)(450100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR04MB1577;
	H:change-01.am.freescale.net; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR04MB1577;
	23:vMGbDFT5l+6kSJHsvukLRv7uaeQdnWUWyjswKqKUb3nswgOzXuk6N1f0AN4i8oyvCyj7U/BPB9tRk/doBbFVPaXs4gOqWjxUVkk5gmPu83vJ7eDXZyxW7qkhd3rDLrnEQIb+G4l+Ryi1Vs6l+O+gk7nYG9ilR9tRSviefEfj39ORJVLFyBxIt8itrQ5ZuYhbQhzi7i1fP5rb1fDQJDVavNt6k1ejfPJd3I95fzypecUs5CEf20ZUFsMQx1lpjVyHVXhk0Mp8t47MiMLoWVozvsQczTCSsdKLPSBgg6dIAEyPQIKZmk64BTpzhK9zl5ds8/eS06giAU00LnPj2m84WFuewAwa146MXA77LOD7uQpUox6yxRKu/NEREEXMDxZ/4u9L0FKWOO7g/n6JdzgaNxgi94FO4ITDTojffe5jDTquiULk5rV42M5N7OOcII8h+kAM1rCqVmCZkMkk6GwTikXpMbggG/+7/aziYixNnoowXbWipy+GCspKRKLwJpq55tHiJtUxzUwmmFr6xFJEMnnulGgPw2S4KVkdNeiTTwZmyHGSrjUbtZz1kCfm2LbOCu4Gito/sus+UAoxa5v0gVp91SDJZ/UvloSZt2PyuP+qrkUWrja+T+Xe5sbyKUbuCSJj0otRnS+Om2o6CE58XfKM7gqfZZ90VB6troICwvcWz5zZx3kByPgLvDUcTSrlDaBDJbF9F3vXc6Nfh/hkYI4IeYCaMptrF7jJ9YOvxGBYLJxVc/IxQw6zsqHbrhHEI35yV2SGP0SGX7+kIE2qxsYrIApjnVCglVzCHtI1wVfqNtqfdVhlfGvI3ceGwhnWGAEjJvbucfphFGNYfRK3ZA==
X-Microsoft-Exchange-Diagnostics: 1; HE1PR04MB1577;
	5:VkyED10c8LLfP3vg/PGKwz8YYV0O0l2YiGIgv1F8uhL64+XyAWPbz8Oomaj50lMxUPOH8H4Vc/S0Ny/rV9jpartaowLqKXSPK0BOuGHzBBvzzD/IhA7upv5cNT4SZghjzFyr/jAARdZwL9HW2V6Tuw==;
	24:OgpZTGw6tRxyvFK6Odw9IQO4rqRImTY982pgjoeJle5mj9krPelQNXYk3OW/pYJ8QEkylO2hT7HGDua0kS6tt6lE5+hW81C3dHI/TjTfobU=;
	7:KnBxkgyb29hQV9cRNxYT1zIYSxvMDSmCjMex4ckojJ42NE8L6aLLSYMwRKNK6UQ069+hC2PPymJwhULUlV1GHxZt6+ZUmbyRmNFNqZxKPHEWtFsWf9sKa2CIrnIflD+fIZPbfeuIxVy8b2tR0R1C6k5RfgN5+M1K1mOblh0yAkbeL87tsHdbjI0QUaxZqVld
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2016 19:27:48.3076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB1577
Subject: [meta-oe][PATCH v2 1/2] mesa-glut: Remove the recipe
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
X-List-Received-Date: Thu, 12 May 2016 19:27:51 -0000
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


