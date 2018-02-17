Return-Path: <kwangsub.kim@qt.io>
X-Greylist: delayed 10756 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 17 Feb 2018 22:11:20 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0104.outbound.protection.outlook.com [104.47.2.104])
	by mail.openembedded.org (Postfix) with ESMTP id CAC1A784D2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Feb 2018 22:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=pD3dTF/uQ4EkMsEhEB5NKKX1wSf+65sYDDzODu5BUD8=;
	b=FSq3dx/NM2nlKjs9akiXc9fVfGKa0m6y27sx81AEW7552YbJx8BAK0qwjwvyzVzkLmNmRUkK2NQt16tPx+Y+q32/67sDa4yL+ffsS9HohYC/A4ondVeAiAd9gu8a+GEVlXFP8XQYMszmHZhegi3VI6ZiyA6JaAKmtLbBq+vd9Jw=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=kwangsub.kim@qt.io; 
Received: from localhost.localdomain (182.221.180.81) by
	DB6PR0202MB2485.eurprd02.prod.outlook.com (2603:10a6:4:1a::7) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.506.18;
	Sat, 17 Feb 2018 13:38:10 +0000
From: Kwangsub Kim <kwangsub.kim@qt.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Feb 2018 22:37:12 +0900
Message-Id: <1518874632-22199-1-git-send-email-kwangsub.kim@qt.io>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [182.221.180.81]
X-ClientProxiedBy: SL2P216CA0020.KORP216.PROD.OUTLOOK.COM
	(2603:1096:100:18::30) To DB6PR0202MB2485.eurprd02.prod.outlook.com
	(2603:10a6:4:1a::7)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87c43f3a-fa1a-4cc2-6a62-08d5760bb084
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(2017052603307)(7153060)(7193020);
	SRVR:DB6PR0202MB2485; 
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2485;
	3:3pV3ZGLHVvDWQElNgH8oGaU9zLHampWYDqhkpI5TyIOHexWI2OETWM8Vwv0/9RYT75GpcGTUwqTTtVg4TYMsrjAVZHLFH77OEWY8X34Es+Cy7dXk9Ym1IjDDqI+9hBdIxLP2Cd62AKbCx6UVLmU5wFH9iRyUJmXtY9fkK7IVVAH9D4d7xMBJqCB3jx9o1EhAczuf90/iRjZG81aQT/CshCG8rTYl418SssKVlDZhi4HqUTzBg0AfayHld1R/Mmo4;
	25:5P12BgJEsqcyROny2HQgKNm+/PULJCzGfNUtQyTXzPYi1oLXcbY26kzNjBscg6nNUNba1tTMgOYo86bpSPTeyTZdi/9DFHvZ7EXrd3XE2POQT5YrzaNs9LSpp0iuimkX0+UBINlj/J0/xR5n1f9/94pquijrYfSImv2SQn+TEVZr7nCG3ZbKrQsvZ5LsAthEVHqNa6KnUcU6W47OnkxqXuz/JW4ohn7ZhhjwhftyV3QHm/fx8CBZNZlmU+5b/pUB0IxxJz1+Fvf+rsIdpGFDlm8yyB1EUgT3EbakqLDGVipVCVRLALxnXk+sTjmIoiQMszv23Xbum2UX/UgSWIFJvw==;
	31:gSGx9jwE7AReDB5lkPnZPT75mSPLiPDftxYDimlV866GFQ3DxLve20Gm9CcgWUBHxid046Q8daxf0AcN98tz6nodKTfqSENNCGZkOtXRwKhzJ3QM2X0mySyXcL8ZVk6mCxgxrNOomWyoLyvlm2QUcBkfPPhCFm/cta+OFZV6n0T8MVGWPdDg6aGsC9d7At7b9ddmu7iXRyvsrVO5JhEcoPNz7uHWuGpEPzLqdj7DxhU=
X-MS-TrafficTypeDiagnostic: DB6PR0202MB2485:
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2485;
	20:YlH1jAf69YuoC1l7FlKPyawtdCeGqqbq2elvkSKHcp5wfl2r/RyDOYFJ8+6lHkgK1+NQYKD5J7edm3fKb6EWgI9nFDNeip5aOoICW59EPT2INVARno4uVI+weaRrzEBiq3/I392DAjpDR8YiRVxHB2aF+mJd7jQvgy5VTi6+ihuZeGTo3dVeHbFh/+NiGJ+aIpmQ7sbLliRsA0oCVye9OxPJJPUPYa4EL096fgxxK5c9t/bB1ut8atYFP7FLLWM+wd0RynNCY9JWJS1e48+QDgR6ewRnowsr28x/u7zKURPq0TYq1swhrNYdVr5Ur7BiyMefXF+3VWEYB7PSRwSR7W4n0tPL3GaSTvVkIKwBju6SlclC/gIVFTJUea1tIFW9kJlOyiHmYxPvSZ3GH9My/1Y7kp/gdABmmyh7RqEht1o3VHjzEY3QUSElWTQjmQOoA82+l2h100UU5KCSHl3532HSe3pU4uON5HuQ7fZe2nmGdsrITiEtpHB1nlgUBuU7;
	4:05FCAYyo5NAgz9W00H2G0lfvy8Mg8xYZJYlGuDY2xXoy0pQdRlt8WiYeqagArm1uxqOddX6Qj+m10iy3NK29jjVcw6Wk8VMOa3dP3kN0wo9TOMmySyIX2asqqU2QwjXwUyRUrqEey/DDDDBGyd8y1kJeQWhhxAasAHCPcJy1TJLL2N+5rO8Bnp8BuY+ZZkCYgk+atx33GEmcGMblD3i60Pgyd/PpllKQmkicZT3A8bCD9LtqfQcDCMbiXDm+Yrd2iO7ghRmCfDrocURYGPGbiiqjg/RsWs5EFN6ZfYmpW2IwoxtT1oi6oR3hQPBcDxHF
X-Microsoft-Antispam-PRVS: <DB6PR0202MB2485FCE2E859A23C6144EBB986CA0@DB6PR0202MB2485.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(278428928389397);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(8121501046)(5005006)(3002001)(3231101)(944501161)(10201501046)(93006095)(93001095)(6041288)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(6072148)(201708071742011);
	SRVR:DB6PR0202MB2485; BCL:0; PCL:0; RULEID:;
	SRVR:DB6PR0202MB2485; 
X-Forefront-PRVS: 058637CA05
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6069001)(396003)(39840400004)(366004)(346002)(39380400002)(376002)(199004)(189003)(8936002)(105586002)(50226002)(25786009)(53936002)(6512007)(1857600001)(26005)(16526019)(186003)(66066001)(316002)(6486002)(6506007)(386003)(36756003)(47776003)(33896004)(48376002)(81156014)(5660300001)(478600001)(68736007)(74482002)(86362001)(106356001)(8676002)(52116002)(51416003)(2351001)(16586007)(81166006)(6916009)(2361001)(50466002)(4326008)(3846002)(7736002)(2906002)(97736004)(6116002)(305945005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR0202MB2485;
	H:localhost.localdomain; FPR:; SPF:None; PTR:InfoNoRecords; A:1;
	MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB6PR0202MB2485;
	23:MPQ2qdaV3zA48q7f1FCouloU7gMpYqZog3D1vDq?=
	=?us-ascii?Q?8Tc62Bgip3DYrYhkZAov78XcPlCL3XshOFLQai0c5Vfk+VVMPMcxS2Rbi1lM?=
	=?us-ascii?Q?JLwrg94Hl1P13J/9abSbkn5Ukd/WRx8hkzTHc0FPDccw0efJt38rcisq/bDJ?=
	=?us-ascii?Q?SZnMTGaU18n7v1ZQi91L8m9MdZsg4nASUsfdIdgDXH/d+8dqU23FIiuG5e8K?=
	=?us-ascii?Q?pUyNkU/42Q/eX8+H/pootwS+hSB11ATh8XM8AP4P+5X0A5X/pVkUcBq+hFpg?=
	=?us-ascii?Q?CY+GLw+qq03kq+bwyvmzt1e6UgOvpq6bh2gGoRqVI26M9G5hIcODrKGh7BH3?=
	=?us-ascii?Q?mPxxY1Rj8e2pvQMYCsXc4WhqPFIXksLeM8z9au1eVpePe3xFjuITYpVls+Qk?=
	=?us-ascii?Q?NIFbZHoZFCriBhgKE34TJA0VOjjXR+BbMR5BBfT/peoHAxj5wa2SSD/W/du6?=
	=?us-ascii?Q?8BMrmjjQCAwQg/8XGVyuK1TW+TRol/5ZwZ85Pyf+n2Tb7VKz/xEUmvfw9xiS?=
	=?us-ascii?Q?1OfoIMiH1D+vtBc05bApO8T6RAaJcwoz8rKespCkfzS5lTUv7xJQ0SffjvDZ?=
	=?us-ascii?Q?t+cTV/ZnKrDvWW6cr2oAWVf+2AzHDndhXWdi6mHnLnNRGp8MguvBaes93ymm?=
	=?us-ascii?Q?hnmmCSdS2VO2+gbr6rwJEuCsByO/FRRA001j3bxkNGVaxBkN+rXNzAcf9RTq?=
	=?us-ascii?Q?g8GcOC32v0hmJ0tYJOI3DkBb5fOqxDdUW1leUbr8R+IcXutjBICFWZXP9BMX?=
	=?us-ascii?Q?o1Zi22+VMRv0Xgn4qrPaOPJ/0tjmUWsBdir4uzpe053RrIJl25yFTyErhV4p?=
	=?us-ascii?Q?jj/UWansba+Sp7+HqiBa9HlBqs+IWlL4UNI372aOw7+D2RkLe3kHSezQUuvg?=
	=?us-ascii?Q?m8kiCeazFxs6QRFPjR7QXo3Wo0NPQo1OXaDkWLW7WCeFa+8BOILodrnr4Z3W?=
	=?us-ascii?Q?vxUL3tWGV96BriBmefvIcCcu1+XZjbqbpueuRKuOvqUYFCcQZGAcflzF8ZO7?=
	=?us-ascii?Q?oayG9LbmDhxgaGWrtCgv/Da4+Eg+Vafm56YbvB2GtvUA2TGHb1Y1x6GTuiNU?=
	=?us-ascii?Q?cmqFakIGTcx+YaLPh/D6gl7bkjsSuPjuSIRlLuszvbRKzYCg4Z+cTEaYFA/a?=
	=?us-ascii?Q?mwcatHEamZFUMmH1SlFHOt2HtJfgf/nQxSTamzDHi5Bp+lIHRW1XpOg=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2485;
	6:2bOFPlGFrwBSsqEtoGZGBxKrDCP5SyVwqfOJyOSP/FhuUWzK4svQoxG+piYTymiLQkypa8sU1dmrlbMGUllhFDTC6y/nGyVpKG1NpEorbqgVi8HfQC4qRy0W6WJNSFZRcUC4bcdIVmrm1DC+zKWHr8GIQtWuOR+Z7xUFQvCqC5WRf/y32ls0pfbGxy4mzxbp42O/5LtjEYMfkIdTYNamV0E0r6KUxEsJxTAZjMo4UuSIxj36qNKtKyvq0ZWWMm3ONl+NzotEdtIp4jwEBFbPWYkUO7VsQEVb7BdipSDdqX6986LOMaa0N7m6nz+biCcFupBDfUot/QJ74lGYoXjMD7AeQ1mAVQLDXoNVjuO4dkY=;
	5:V1I32jOvRUHPYmsyF866AIz1Q5RV8NEb2PQN1ltdtcHnN26pD3adJF4xhfBz8ylN0O7/wJ09GM5rloQiEIublLLyNFy38HB0yU8opXQEmg/xVYWVALxjjoiaclDzGF7BMpkgctMl/vdqSLYw3kZsK9Zo8DPJlmmyKIMm4Hucxio=;
	24:W+CY9egVAYpNH5tTff/BrZQrK4dBwrvBnxfe2GaLLsJT1edsiHn8xjsmys7CqLui4cEm7zqz+S78vVvAduTB3t1zBJmV4dT4szJX3zYY2MI=;
	7:tB9dm3p8SZ3YRRL29N3gLjhTr2SZYtwzdj9sTnSILS6RTgtJ8ux9lLe3Nek8VGouxX0KhJXGaDgTV+n1HAOqSHwqOEb+HtY9uShaD9B6tclEWyu1ek6npBVgtfws7ibWleJczTpDII3FQAIzbUYl4vJUPSaCfD4svlb4NauS8oHWYhtNiPd89w4EFFfRVLKNhc0b2LmwMX1h7eL7/CEFln0reL1QH0KcuJS50aIGZumR9chgIIoxAT1Rn2DfNh6N
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2018 13:38:10.8166 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87c43f3a-fa1a-4cc2-6a62-08d5760bb084
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0202MB2485
Subject: [meta-qt5][PATCH] qtbase: add a config option to optimize for size
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
X-List-Received-Date: Sat, 17 Feb 2018 22:11:21 -0000
Content-Type: text/plain

The '-optimize-size' option would enable the compiler to optimize
for size instead of speed. It would affect the whole Qt libraries
and Qt applications as well.

This feature is available in Qt 5.9+.

Signed-off-by: Kwangsub Kim <kwangsub.kim@qt.io>
---
 recipes-qt/qt5/qtbase_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 4f3ade2..8dda6a2 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -90,6 +90,7 @@ PACKAGECONFIG[release] = "-release,-debug"
 PACKAGECONFIG[debug] = ""
 PACKAGECONFIG[developer] = "-developer-build"
 PACKAGECONFIG[qml-debug] = "-qml-debug,-no-qml-debug"
+PACKAGECONFIG[optimize-size] = "-optimize-size"
 PACKAGECONFIG[sm] = "-sm,-no-sm"
 PACKAGECONFIG[tests] = "-make tests,-nomake tests"
 PACKAGECONFIG[examples] = "-make examples -compile-examples,-nomake examples"
-- 
2.7.4


