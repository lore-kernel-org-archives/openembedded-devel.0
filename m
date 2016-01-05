Return-Path: <samuli.piippo@theqtcompany.com>
X-Greylist: delayed 8275 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 05 Jan 2016 10:04:37 UTC
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0142.outbound.protection.outlook.com [157.55.234.142])
	by mail.openembedded.org (Postfix) with ESMTP id 6213660053
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jan 2016 10:04:37 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	HE1PR02MB1177.eurprd02.prod.outlook.com (10.163.173.147) with Microsoft
	SMTP Server (TLS) id 15.1.361.13; Tue, 5 Jan 2016 07:31:12 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 5 Jan 2016 09:31:02 +0200
Message-ID: <1451979063-17003-1-git-send-email-samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: HE1PR01CA0036.eurprd01.prod.exchangelabs.com (25.163.2.174)
	To HE1PR02MB1177.eurprd02.prod.outlook.com (25.163.173.147)
X-Microsoft-Exchange-Diagnostics: 1; HE1PR02MB1177;
	2:AOQs5eX0TyFW8A8Oye/DRwlLP8qROT9hT5AHnkZcgFVtrUZhZuPs+JdFfYnfkQtZ0ZFQ08qYtQ9pctc1suokech5x1YbWNyDj32oPq6uX3cSYW/p6cS1NMCFcdFlJXKCRb+pFRjaRgjp4K7b+PH+Fw==;
	3:rhnojJLmwzkN2P4xHsZ/I51wOlcUa9c2LLLfdzOtmnaJaregkVca4G92P4h0bdcZElLQB2en2uoZVTUIrYN0U40aTzsO0YxIzH9lDa3VeUD2B0WlDW+RYXIxedASwm/j;
	25:uo5PVD7efzp8IlWc+ehw6ZzPQ4Iy24eS3mQwF7UptIxbYOsuavIOTRoDvT7HFEgsFpIYyvc98qPyygD1Dtv2bUWc3EmCzSyk15Q4gGIjr2wE7GsPklFW3965xg1ibu+N5EXT/jSOL+9TKymJr8u/CW2i9+lwRrtm8sNJTHjhRzEM5v3fKGu5zAwltXyQ8QQceaZH+s5+/UIuRaZQ7LbjscnpGYxnjRAFznDAovTMxPJ4MC9skWuNCSo58if43L71vkN76Q9cLwU9gRKSqip67g==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:HE1PR02MB1177;
X-Microsoft-Exchange-Diagnostics: 1; HE1PR02MB1177;
	20:cShPR0PFzexLxBTN9NmTdVFMIWc7v3D/SNRCnSRX1CWH58CZYoixOIlRdQetDwtOFTeyuCNcnMJqDNngIqKzxk9Df7aGdanu1xXp9pDZxv5d0CcQslmjw6QCN6qnPqdSNphdxF7Z13sYuQUCw7mNIqOa3FgaJW2bemPbrWzRsg9yq4uSjR2vbh3Ks+1je8OX3Fx4FABT/nMqxs8eoMuwFz5p/6EB2Vly/RHfBW4U7kQ2hmn/r3Qf2NJ8Bn6pAiotcfR1GFOP0+C0ZM7XidDehnwLI3JTJ0kQHJt9E31Aj3n2Zq2iLdM8kaBGaD6zHzaoWyk6rUnenKDM3s2fay8lXUCkTl3dR26pMU+PTTC+7X0tLXmdtaCfxw2OigjlNHoBdEvzMnO5zOxKy+f9MQ0NwHk50S30KBdpf94W4qnwbPX2/j4PhDQ7x1pTbAqsd/82Qu4MrHlfmzpxoypR6rZJbaz56rJbXuU9YvtFiM+fmjbgdajr7pIFFRP2kI7vhzry;
	4:FCenJDdHXlE9GAujjrWBHSz+p0DNxbeQKPeeicbD1h0DeJ81rzU6ZsNdxmXCF6rEv9Qh2/qs3dVrCOgZq89eXyQJV8KklxyzskqrT2BkHGUf+PMAcD0hObsaW1DF8wqN8eQKh9D+ZusQ62KkNyWPl8MCdxHQsrUfT5FKly+SF7LyI4QQXS+TUCZy36RkjPQr89hiwwRqPymmqhdNFvew04mfQ0+bmO9Vx+B1yXH8tQDAS/0LwglvzkCvsRGWAN2Cj776vlsGOw20gROW1WgmkHQH+puyy0H/AYxsBWXAm/8Me7qrTCEL05xfjdLAy6P3nMjOfBFe3tg8x6DHrRBvIAd3wF+qmwayftbl91gz6VpOfqIFkwDcS9HfowIL7QfQPutOmacFf/eMr40y47ITxVOmiaJxlIjl2I+Mj3+3aA06oZEPU1Qmo8rk21sGu3ub
X-Microsoft-Antispam-PRVS: <HE1PR02MB1177A3D4745C7CDB2197022690F30@HE1PR02MB1177.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(226695750432114);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(520078)(8121501046)(5005006)(10201501046)(3002001);
	SRVR:HE1PR02MB1177; BCL:0; PCL:0; RULEID:; SRVR:HE1PR02MB1177; 
X-Forefront-PRVS: 0812095267
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(19580395003)(66066001)(47776003)(5004730100002)(4001430100002)(6116002)(87976001)(122386002)(19580405001)(101416001)(586003)(2351001)(229853001)(33646002)(50986999)(40100003)(107886002)(110136002)(5003940100001)(106356001)(1096002)(189998001)(3846002)(4326007)(36756003)(48376002)(77096005)(5008740100001)(105586002)(450100001)(81156007)(97736004)(50226001)(92566002)(42186005)(50466002)(5001960100002)(86362001)(7099028);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR02MB1177; H:piippo.it.local;
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; HE1PR02MB1177;
	23:KxXNMlsPlrP/+vazYuUH/GSm0cQd/8ais55fSnze+?=
	=?us-ascii?Q?mgXmVvNYB3o8Lb++A/eDLgCwGGOkOn0i4yUVjUDn9i4g8n7RogowyMDpf7IC?=
	=?us-ascii?Q?HqlMJZOWFlfHKj85lrDpIBz+VdgH9oC/JYNuSqCQ1SaQqKqCHbJi8jdB2i2+?=
	=?us-ascii?Q?bIhcoXOyYo/kLpJ+VcKSyhfaRdOCVe0u4qcHmX6PZtXh9uF9nM2wx46J2OKY?=
	=?us-ascii?Q?DhgqYEQwCQ1SXXkTufHfLdwC2aJMw5i1vxcZzwRVoKXE8Ov40+TmCIB0tnNq?=
	=?us-ascii?Q?dcSJ4xsyglOq8tZgHXW8wKdhiy7gUgqNTCD44KE41nDr/EPFaDAwD7bDO1MB?=
	=?us-ascii?Q?MDIYX6GVhixxWeWvUpKJ5FX8LMcxKIE8xv8ifyD6/+lXfvZDNn56u9G0y0rm?=
	=?us-ascii?Q?khxCWJE0gd8zmnb26cY+bHLezQn0YJpuyeRwblkLG3lq+5zUI399h6PHxW6q?=
	=?us-ascii?Q?+X7YeJ7pKOkDYu5AxVPtwZmHfAHArRvHdmvLz++Y8iIIhZJB2jZ3NZ9DLOmA?=
	=?us-ascii?Q?Wlk9jMUWew+7+ecdOTeu8FvERc5nrTyy6yQtYXhuD3e4A8lFmBroPfNsGsr8?=
	=?us-ascii?Q?CZJwlvcZFbcEiSDTwmGYrPk5+V1gWcr1onEnxrFk8RZNXgABLZSs48csBAPT?=
	=?us-ascii?Q?i98T4acELTdjsFAWI2OeRysUpp4FDzLo7PlYUzHWj4ZkIjMQdoJMEy/Rar9g?=
	=?us-ascii?Q?QPcixmcNRaikwEfGlacLI2378/3WtKM1Ji1OC59yus/FjLVoJXHHOf9T9FzE?=
	=?us-ascii?Q?QseujMZps8TdZGJXVe3KRLBocXOjDwaMefGY64q4aB69BhBqmrYAOHPZMDy1?=
	=?us-ascii?Q?ENFphqlhfqHH7wtc37JDMHQfX0ED2bTu3BH/bcgeZAw0fHv1gwoUJQgDbk8A?=
	=?us-ascii?Q?qiaqmK/mIe9DmNFd4hLv39dVCKDZbaIt9tfFhgeLUfsMIdGLPdjNNDjVhN/i?=
	=?us-ascii?Q?NSn8ErYkqQtkf8bUqoYqHNrfFN6GfRLyAvdNmdF3MF0dncwtK28tPI8Np5+0?=
	=?us-ascii?Q?KJlLyAz5uRAUGkBhrt8ftD1JeG1Tv5TLhW6VVMzv8WDzq+NqQ0t0qeNfSUfp?=
	=?us-ascii?Q?029nIp24fv7hYAQZnC5ZNupy4reGB9qCM7BB/FPqVYIzMtHw2sdmwryMpjR2?=
	=?us-ascii?Q?POcsn/YuaA=3D?=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR02MB1177;
	5:WQfR4ZE9gINpN9eNeFzo9ll8v6hpTMuXr2FiSANec4ZUS2Q29KVkTJ0wTc10ZqM6e4/eB8XNxiCpFtvdhRR6XV/LWwhx0YKIrAOvGEKx1yz4ybZEqYeoBrZejafdyYbbZSsf7mX/iPh8PtDIiINwZw==;
	24:h2wgO5vgPcK9LRWlUUHg6YNg/7azoyVVLM7J8bN7aw4NL003fHUCr5rltqG46xU5YwQLJLfmP9jNV2TxWje4jyIYBMVAZR8tSvyCtsRX2a8=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2016 07:31:12.7029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR02MB1177
Subject: [meta-qt5][PATCH] qtbase: use PACKAGECONFIG to ensure runtime dependency to libssl
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
X-List-Received-Date: Tue, 05 Jan 2016 10:04:39 -0000
Content-Type: text/plain

Using openssl-linked configure has side effect that gdb catches the SIGILL
signal, which openssl uses internally on ARM, every time when starting
debugging any Qt application. This is annoying and somewhat confusing
behavior even with QtCreator.

Using the default openssl configure argument prevents this, while using
the 4th argument for PACKAGECONFIG keeps the runtime dependency to libssl
correctly in place.

Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
---
 recipes-qt/qt5/qtbase_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 7ee5f56..2ef8a75 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -121,8 +121,7 @@ PACKAGECONFIG[kms] = "-kms,-no-kms,virtual/mesa virtual/egl"
 # needed for qtwebkit
 PACKAGECONFIG[icu] = "-icu,-no-icu,icu"
 PACKAGECONFIG[udev] = "-libudev,-no-libudev,udev"
-# use -openssl-linked here to ensure that RDEPENDS for libcrypto and libssl are detected
-PACKAGECONFIG[openssl] = "-openssl-linked,-no-openssl,openssl"
+PACKAGECONFIG[openssl] = "-openssl,-no-openssl,openssl,libssl"
 PACKAGECONFIG[alsa] = "-alsa,-no-alsa,alsa-lib"
 PACKAGECONFIG[pulseaudio] = "-pulseaudio,-no-pulseaudio,pulseaudio"
 PACKAGECONFIG[nis] = "-nis,-no-nis"
-- 
1.9.1


