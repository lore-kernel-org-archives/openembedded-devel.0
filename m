Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0128.outbound.protection.outlook.com [157.56.112.128])
	by mail.openembedded.org (Postfix) with ESMTP id 0712C77291
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 12:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=digiaonline.onmicrosoft.com; s=selector1-theqtcompany-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=1iXyVO+CAeb2xLzMIYAXc11q0MUEc2eC7MN2RDrJ6sM=;
	b=EMqtO/zRxEVOwNbw3YYcaQOSl6g7ionlAUHviymyj0przZzAv20wq1g18/LEfOukDvMcS1csd9sfYl60GGt1hwrAK3GHhqhhwd68RInt/pNmtGGKxlKEJgsGsRUjALfY4P12oXgz8Hb0OaG2ah204LvngCG1ZP/zDYuMaTZoyUQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=theqtcompany.com;
Received: from piippo.it.local (91.217.248.11) by
	DB5PR02MB1175.eurprd02.prod.outlook.com (10.162.163.21) with Microsoft
	SMTP Server (TLS) id 15.1.409.15; Thu, 25 Feb 2016 12:57:05 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 25 Feb 2016 14:56:53 +0200
Message-ID: <1456405013-5384-1-git-send-email-samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: HE1PR06CA0064.eurprd06.prod.outlook.com (25.164.28.160) To
	DB5PR02MB1175.eurprd02.prod.outlook.com (25.162.163.21)
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1175;
	2:/0ajMQd3a6FwgcFAQnguKI+mNI/0zpfVS0pgIDIYpJLsfrHGyc5paLvgF8loPCMfBXcH46AAYFLyqNYdLFwIKFPkJUsEsMt3RbhD2BhJu47PE8i8bAzK0FMGJhw5m56uElFneYV0oJvvn5cxhbjO9Q==;
	3:Z1icJfmfXM4lKtN5P3LLWPHSgTtPbdv6xz+0Eb3jvoOWXHvwTghGEDbHciPtbFtgGSolvkwnJ/tD+ThxTC6x+SnGTSWdDj/jGJnz7iIegMLcJgKiaVcT4wBn27a7X5v/;
	25:eqHJA8mNHIaKH7fW0tpU2Dn3t+b1DYVmFqvCZgfivaEjQ/3wJRWxGjpgnAtnO/hQXbznJOmLviYJaCkxPAtUOAZWLnoPKFM9HLn3xYdWjkveQQsjOhvfoMMyyvmtzCBTT6g4vboMnsJyd1MWldmb3YkxDp1Oj86E403idK7HXH32Ff1JnIObYx/QH2gloAisntEfCNAS5qeup/7dXGGrBC41dSNwMSUuO7UsvDuVP2ux4+LY2rZCuGFcesGqINwn1dbC6nb7P6bYLo/6oA2ZeFo05bXitUIX8amqqh7LWxHioRIxygv3G/EiaELZpl3pYofZ8QMkRUL9K9Q5LXaTqQ==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB5PR02MB1175;
X-MS-Office365-Filtering-Correlation-Id: a978bb40-f7a3-4c50-e958-08d33de3299f
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1175;
	20:19frWc0tjjRwZUdFi4g4kNoTZZEYIKIap8GS4BZjukMVBFD5YG2X05VT7JhmXsxylU2AENU5Pl1TfMgxzZBE6QCncSCayr7ymy7iUQ2ski7EkGP1anYs1NXwvIsTkeQDCCmGRVqbm09UemrQwPGp6lqyI55cmaPARq9YtEjW4rGlUapZAqtSKF50cf3zUABnjRXNbeM1KycETDN7rSmYFbilUr9lk9PIBacvbYZL8hDjsV/HV1b+LXqdoSezygs7rHMGxWCP0/E+VEo1aj8fPo4YEv8/MFz9utx8cdBPmQBjlsFmSUNYfq1RksaIQeBK/aE4lgMcIeEhzXqWPNTcUzhGgQLRn2yGr0MEkgKagsqwY+Xe14Wys02Sm7oIzfa1T79xJA4F1HZBX9p9Y8uQWON6yMoXoxuoCRntmvhPTdWBUY3e8KzZ1hOTPjCI5Xqszegg5MfvwYB757MniOA2VDS3UF/ghFB6+CcONpUHWNb984atSPetYZeu8jizMpHG;
	4:v0Juo163OvDVTNB85YjQfD75uwx+IWyHdqgU9hEyTH8SztnYRt4ZBYRTc5hgvx3ucV2Z6ojji+v9BMX1KiLEgBcbhJgVg67kginNmaprqIAzmhhsZBV/IR5Xc75VitRh34GzXqnKYh+qx1S685pxjWyZvWD5debKlVlVDtFqi2PCgNcg8Wizd25Xqz2zxvY3QtdOhfWX4A1D7BTqpHXJIgY3EcujPp9qTmte56U4I5I+VyT01/Dd2YZZjB9PnaLYqrPZapcq975wvbmf0gKn/KQ2/HybLE+lok6vJOq2tnChACOcAQDyfMRXmYh5vES0imOVaxRZiz+phibs2wPHS/5HyuEldUEeDyS0n3RA5sbtAUy38sVHozQ2RCe06YYV
X-Microsoft-Antispam-PRVS: <DB5PR02MB11758139D1B25845787E214190A60@DB5PR02MB1175.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:DB5PR02MB1175; BCL:0; PCL:0; RULEID:; SRVR:DB5PR02MB1175; 
X-Forefront-PRVS: 08635C03D4
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(92566002)(2351001)(229853001)(50226001)(40100003)(50466002)(19580405001)(77096005)(19580395003)(33646002)(6116002)(48376002)(450100001)(122386002)(5003940100001)(2906002)(42186005)(107886002)(110136002)(189998001)(50986999)(87976001)(3846002)(1096002)(86362001)(47776003)(5004730100002)(5008740100001)(586003)(36756003)(66066001)(5001960100002)(7099028);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB5PR02MB1175; H:piippo.it.local;
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB5PR02MB1175;
	23:16trcCY1FwXnDd2v9Ygzt87HYFTQQutyFp2cyyiJH?=
	=?us-ascii?Q?YRhcvSQPapJ0Z1azeo8ejogWN9x8fMcDaHJtF6vXqHtziYYrdUwuvfRa1uu2?=
	=?us-ascii?Q?LWLJU6JB3AieZTGxAdndhe3OkO/wYwcgeAZgzNQOQDV8fJLxVSzUmqoczY0I?=
	=?us-ascii?Q?PefZcJY4i98UKSCiHywbi87i/xoI5SW5eOQ6It/+1Z5qiSYlDFO2oevy966C?=
	=?us-ascii?Q?P1XkKg6hpYZ7dlwBD4VnZAVlIrLxw6QqGuExFnbRpKN4v1c9IlGKXJbwQ2yd?=
	=?us-ascii?Q?6V92h3Yp0WIa2Qa0uF16pFsWJvT78a1K7l6unsGmMBEh7lCIWwzDHQQyGk9h?=
	=?us-ascii?Q?RkYuE7CTfzFQVVj05P076uxP/T20BmNzDYA4qbtN53RPrKrdM6DUVXFhLXPt?=
	=?us-ascii?Q?ZxZntR4tlGAT9vyop70SG5+UZqj7gm9rSb9ba7tWG5abav0BucMsCVwUHIkY?=
	=?us-ascii?Q?k5RFihGDe7gU6ELziaTVS/hGBSS8WoD0ecEYnoPBxwHqH+g6fnCetWzaQzhZ?=
	=?us-ascii?Q?2Uez6Ml6wXUHK/3ywSNFNkKAVhdZXOpRYEWuW4GnQ3X3xezWPvy3m/8eiw3M?=
	=?us-ascii?Q?ht2ycM3zX1On2/ZYg/qtuLoW6+8OX3eLBllt9k3c48VqnljPZOCTVQZCIrz2?=
	=?us-ascii?Q?FO6ebC6W7uPO6tkmpfUSjpU4crN5P8qiHvpvyONv5Z2Ay//QiGdIZElO8sI1?=
	=?us-ascii?Q?ZBugxg54QsfEMOf5aotv/ODZM/uCwikq2THo/YCbUY08bNnQ2Ds3sEmLmvq5?=
	=?us-ascii?Q?TAEeBedpV6c4M3J38ee9bjO3jcb7pm8pkvtkz+NVX/3zez0VuVsiHP89EWJ/?=
	=?us-ascii?Q?e9pqwyVmWS7UD1dL1MqJ9WT4K/XlMf8jVTeinyW3YTmqGYESowzM6OI4QwxL?=
	=?us-ascii?Q?cGuMfjMmrgi7Q/jdwo5ef67/2mKjJjtut8pqrwU3AHrTk2LtZ7w3rzcf1xMT?=
	=?us-ascii?Q?RJ745qczyAvgoX1s0T4dkh57veMhG90cCHhi5W+fg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1175;
	5:YTb5yO8jqoTPDxHgVejFoxjrBsrKp+I3ph5HiVM7iOLaMwshQlj+p8Ph65xcyZvbmUOEQkzEeQfsutNdfjA+7opug7unrI9De+vFP1c4KkmsxfQhHWkwO3h3sJIePkXqWZgTZuFyqTXlaYJEoWIa6Q==;
	24:RKpMElrTLmcv4nKv3ixE9OliPhdtmqkwkZptuQc4xQBCnIBJT30Ih6BFIDpuArF6LIoRW6fH5K1qdbbWLFQwUUJeA9/PA5kEOpWEzQftWDU=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2016 12:57:05.2713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB1175
Subject: [meta-qt5][PATCH] qtbase: add runtime dependency to xkeyboard-config
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
X-List-Received-Date: Thu, 25 Feb 2016 12:57:08 -0000
Content-Type: text/plain

When qtbase is configured with xkbcommon-evdev (usually without X),
make sure xkeyboard-config is installed to provide keymap database.

Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
---
 recipes-qt/qt5/qtbase_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index ce07380..794cd8e 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -108,7 +108,7 @@ PACKAGECONFIG[xvideo] = "-xvideo,-no-xvideo"
 PACKAGECONFIG[openvg] = "-openvg,-no-openvg"
 PACKAGECONFIG[iconv] = "-iconv,-no-iconv,virtual/libiconv"
 PACKAGECONFIG[xkb] = "-xkb,-no-xkb -no-xkbcommon,libxkbcommon"
-PACKAGECONFIG[xkbcommon-evdev] = "-xkbcommon-evdev,-no-xkbcommon-evdev,libxkbcommon"
+PACKAGECONFIG[xkbcommon-evdev] = "-xkbcommon-evdev,-no-xkbcommon-evdev,libxkbcommon,xkeyboard-config"
 PACKAGECONFIG[evdev] = "-evdev,-no-evdev"
 PACKAGECONFIG[mtdev] = "-mtdev,-no-mtdev,mtdev"
 # depends on glib
-- 
1.9.1


