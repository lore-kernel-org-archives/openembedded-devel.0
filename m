Return-Path: <adam.trhon@tbs-biometrics.com>
X-Greylist: delayed 4688 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 19 Apr 2018 14:40:36 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0084.outbound.protection.outlook.com [104.47.2.84])
	by mail.openembedded.org (Postfix) with ESMTP id 498486011F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 14:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=tbsportal.onmicrosoft.com; s=selector1-tbsbiometrics-com0i;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=YkOrIlgQF+ikF/evRnqIjbrRlYS8YrtG30RCsKSs6JY=;
	b=NRLa7W/CUuBG2krc634qX069nRWVpPeqANge0J1RRZjtI1yeXBq2FIMOV0duYuylFCACB78K3Eb9jDO8jJasWNHZzEgWgMc4Qz3be+0WG3Olhl8kSjobkk3/wBGmw4uzN3vXM5frQUoYWrV2JiyPIWUZQ92tOEnKNK33L9xvArw=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=adam.trhon@tbs-biometrics.com; 
Received: from loki02.local.tbs-biometrics.cz (176.74.132.138) by
	HE1PR0601MB2282.eurprd06.prod.outlook.com (2603:10a6:3:93::8) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.675.11;
	Thu, 19 Apr 2018 13:07:32 +0000
From: Adam Trhon <adam.trhon@tbs-biometrics.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Apr 2018 15:07:01 +0200
Message-Id: <20180419130701.1713-1-adam.trhon@tbs-biometrics.com>
X-Mailer: git-send-email 2.16.2
MIME-Version: 1.0
X-Originating-IP: [176.74.132.138]
X-ClientProxiedBy: HE1PR05CA0250.eurprd05.prod.outlook.com
	(2603:10a6:3:fb::26) To HE1PR0601MB2282.eurprd06.prod.outlook.com
	(2603:10a6:3:93::8)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(7021125)(5600026)(4534165)(7022125)(4603075)(4627221)(201702281549075)(7048125)(7024125)(7027125)(7028125)(7023125)(2017052603328)(7153060)(7193020);
	SRVR:HE1PR0601MB2282; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0601MB2282;
	3:L7oVqWI45gMj7Ebl4aFrsKKIKay8pEOogoE+D7oWXLJDv8UhiZ3+ukkWT15p2a/eY4WRcwrxMx6VhXE4b1mPBS16ZRK8LO/m3lrToWNwVjsZgn5a7Nb8CdH/AiHrnCkqhy6uhYNhnJq12cQ5S7J4AWJShfUnWuUoDIIkgCII8TyhoRdWc+OqSS/ZZckK/q7R9DjEX58xLJuQNxPm2pTwxNfAadcVR9EPlyU+owZ4lXbKL0aBv03n5pT/nZLWqFtX;
	25:Ntzq6z/TF3fDGUTYTCjm2Y2SxkKYuPo2AbhWYBJOdau9U+twuih1f38Na3ZqgrsQbkQcCTXg9282ROl1/NklG2YZx0Y7UoGXrF/7VRqqqtB16Qoli7LeeQGFCfg1tizilFrs8iMcJxDZyfKvXyLQLYTUPGnnNlfkXUX8OgzRdlx9jbapN3iAZSHj7CvHgWsFm3Ont6um/NeMmZcbJVTXxCvivVdPBn62wqqA/uARUZ8TSt6flc59DuiXvcQgwT5hAPJLm5sRR//TZweTjdDYJz2awzq2HI9GzVHngN4k+WCWPB8Ij+r0refRgYvFSoDGrhul0wBqowLtssIMTFtaIQ==;
	31:rS4KY9RknruLq6SfdcsQxrQeRSyRBHsbv3wGB0DgGmBniQRIkPg6gxwuJP8OpvQaQKMWd2l+twrr0OW3uyrINYMMNOsODsIAJOdmrdgp39Qhkgo/s2f8ySfQuD7VsdgQCHtEO8M1wK/5m0oo3Yyk5Q6IeDSdsWt10355nF84ljKuN/kqdt4dgcYau56hqIxwqgXpoDWodU3JUT4r/+VTZXhvBkJDi5xqouH/6zSJr5s=
X-MS-TrafficTypeDiagnostic: HE1PR0601MB2282:
X-Microsoft-Antispam-PRVS: <HE1PR0601MB228202F52B343C055400F993A6B50@HE1PR0601MB2282.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3231232)(944501327)(52105095)(3002001)(10201501046)(93006095)(93001095)(6041310)(20161123564045)(20161123560045)(20161123562045)(2016111802025)(20161123558120)(6072148)(6043046)(201708071742011);
	SRVR:HE1PR0601MB2282; BCL:0; PCL:0; RULEID:;
	SRVR:HE1PR0601MB2282; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0601MB2282;
	4:Dd2xaHZyR3L+n1jGVUagpaCM4R8baBfuf3q38dNyGJpNl7nUUxys082VSOI//y9RJLUimHgRurxWuhkYtUA3dscSvu5/BW8wxPjxAVrndRiUn6bnEXaQaK12uyLALjFMPx+XXNVlIuLcOr3XWrj9Z0swj8ef1+Vyha6rhNIJaB2eU3lqFDR3SHUNBZzOtivNtc3sORPZOjMWQ1LTgyhMjy2VyG2N28ZrB2fRepVjj+Sg2RJAdlUf27r3QgpwR+RARDRZ7wFBqEOAB7MjKCO/Dw==
X-Forefront-PRVS: 0647963F84
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(979002)(39380400002)(346002)(366004)(396003)(376002)(39840400004)(2616005)(4326008)(16526019)(476003)(6666003)(5660300001)(25786009)(6512007)(6486002)(8676002)(305945005)(956004)(1857600001)(81166006)(50226002)(8936002)(316002)(44832011)(16586007)(86362001)(186003)(7736002)(478600001)(6916009)(50466002)(2351001)(26005)(2361001)(107886003)(1076002)(2906002)(36756003)(66066001)(53936002)(51416003)(3846002)(6116002)(52116002)(48376002)(386003)(47776003)(6506007)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0601MB2282;
	H:loki02.local.tbs-biometrics.cz; FPR:; SPF:None; LANG:en;
	MLV:ovrnspm; PTR:InfoNoRecords; 
Received-SPF: None (protection.outlook.com: tbs-biometrics.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; HE1PR0601MB2282;
	23:ZWS9TVyP85F2GUjcz/zlJd76JpHyKlHhjX2N5TE?=
	=?us-ascii?Q?XzkddyflcvJpYTVVCFikcpYnZaevaR8X6j+h2skrTJSkfkOAa6c5dTTM/2c1?=
	=?us-ascii?Q?nnYkf6VolFqONZwTqOQKhQBrWsE29XFk8wETHdEk96rVeR2Eqf4vTgNB1BFf?=
	=?us-ascii?Q?bD6AeOFEpldt95o0BCiFL8DZlcn8klNNCw1zybMXzWLSdDmpGJWreLExqukB?=
	=?us-ascii?Q?c8IhI4bRSKfF9Dsz1CGdkssuntoZFU+UAmbNX799rSe4hAxuJeQ2fC1ezYnw?=
	=?us-ascii?Q?+XWSnNM33Jwd1VRvUvx7v/sS3MdUoYBv0WD5eiwC8aWxdeZRxzMhznuo6lR1?=
	=?us-ascii?Q?tXZ1srcniIUksFZMwcdnn/xy/VxIp67HimD+PrpD9Oo2ORNw8i3CL6e+g4MR?=
	=?us-ascii?Q?8vwMGkSxKmabJdkVC6ICe7IMrOF6CRiEsRWY1E/HuXEZe+j6bGuCfL4l+rzo?=
	=?us-ascii?Q?nEQfc475iIBBntMjzjxDCe8+T9Pj+h+E3mN43oD68vQeVKxYgAyw6iFRI3fa?=
	=?us-ascii?Q?hMGMwyNXNdfEKtDFusCVEcijVXGH42TSE8uIVHIeUNqALSaWhxbKJNO9Xa++?=
	=?us-ascii?Q?fCn5SW4X0DiC1OSVbTAa/a/pHJJvNqc39NZJi+X99apy2f0Jb30DggJh3JkP?=
	=?us-ascii?Q?e5l8jXxVw+SNlS8nTNQKYGEe63AnFqOPLzJg0hmIEcNA6J0rOYYoydmi8P/2?=
	=?us-ascii?Q?yeKVlUsHgCOuxbtHF1jjvW4/dKvewCalbLSCc+Rc9HHbBUHnl5ij+rNpw6kk?=
	=?us-ascii?Q?8cumP/+loOiQHWdfvXhUHfuzAZ/+sqJG5+rH8BLtW4hzkIM7aoQwfHnRBQwO?=
	=?us-ascii?Q?9JzSllqRsAkQPlkSMm03zT2GX6HrngrfkOkeikV68DDG/c1bmk8CXiRg4TDL?=
	=?us-ascii?Q?dxLdbO0FSWgCh/gSkhFoA/boOQi/lKfgOpr5iAlXBURXFncty0EJEKfkFMhX?=
	=?us-ascii?Q?NRkdh6aLewErNfGKZbO338206OPR7GiffbCKUXbhsU3EloLqeHKPwbNXpmRZ?=
	=?us-ascii?Q?I7zMV4S/MWISWTx1CHpo31apbbiHVbZAwvFCb55THwcKCWcNMYTZ7fL79TC2?=
	=?us-ascii?Q?wv9o3M0PtGQ6vkyO5uwsw67BYIXJHF6PfFpNh2u4W7jYsa+xiaW4R6Gh0I6h?=
	=?us-ascii?Q?URpjrhHjeNolwGJF98kdP86SOQgnBFmzSym5GygIr7wpUK8duX6Lkf77CMYu?=
	=?us-ascii?Q?EWId2CZSuQVUOsBA=3D?=
X-Microsoft-Antispam-Message-Info: MCuRjGpVKSqTxYYw1u6rc+75wLjbV23ttBJbXZnj2mjskvW7YbO1Zsb3Lui0aCkkj/F9XFhy6pJEPA9w+FIm+/hkD8VJ7fXvPMYe3AVmF4AhtCBxyQS3kWvgyagNmA8I8fEqyuSop6lT1AysWAO45zROGRYy+mmiivXNIFLrokf1/56mWcfs+9uEbkX/IZsN
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0601MB2282;
	6:YMkjpGRCQvwgdacl+qc9IsDaHr8SKIDcfbANcdpi6zHEztDPufDnnYVll4SQQV+b86+xbiGZOvpArdWUxG9jws+t2ctuiB0tF2p1z6DVMSkT5Wgz8guT6oJQ5jUGj1d6mQhzmBU/hrpIbCmwGbJDUqNe/S1TN2sC2ssvtST2nlQFzzgHnkqZHJyhUkmjJrqWj35mmHXAq5mI2oPtZEx1T7VkXQPHBcor2MmnSYQz2h8AtmQrRdd3ZOueJbQVAGvx6VQfrvY4tTytutoK9Z5NBCt+sdVT+OsPlb6LoR7tTb59k0p0Z+Rs3DfMj0gM/lbseZOzNmCl1Ziic3yMwdtYAY3j2PB5NZ9K0MJM8UoFwP6YtSTQhC9T0xIHhe/Sclw90v7cc5CFcG+IX0mWTVOvVa4Vl+6geAc//MswobiSXz+jfv2YrCzvOEIjYeX6YILquTnJdvQ/LqpW63M/ZeQRbA==;
	5:nRHBf+DhRWkT7eGeKYD9x5K8s0tbCSp6ndQvnkAFde6kyFZQjqFYoLA1ELJR0keSXwZY0+LO0xUadyhzTOBfz9ydTgIgNwH2JQF4VHYYnhule0u0IGjlXH8JdDe1Z3F6Gkd8sD3mduD8GV0K1g6yONzzOYP9nFexv1eMYrs/aZ4=;
	24:qdsIXHMGjLYVxXUazPwGKlf3NnaI10E4LOlWV7Hw7IeV3+2qeVd9ZyAwr7fhzXvFO7gmnTD+anFGEDw0SFEl4nfsTvSB5OEFPg1rKSlhEKM=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0601MB2282;
	7:mghHIXDbAWT0ymtXeCeWOChHZA4GluRbcZxYtW7IV7wfP1w1aHAPFgZ4B2WQQHnZRSnFJ+fRsZmaTQE1P2grEdbhNedQOhwN4kDtkFGe5tAeMpBnR1/JwsA151buMMS/u3aKX2WLfYY+gMaByKaK3otI48tdzI2iGhjVe3Xn0Jjg8YyfVAAp1Ul8Raa60zxJrlkWiCACP1f0dyaivEYN9vwHoh/ADJtphrWC1H5F0EzJ/vaq46bKu/5AbRxw+tC1
X-MS-Office365-Filtering-Correlation-Id: 40ef4e71-f010-4938-df0e-08d5a5f68394
X-OriginatorOrg: tbs-biometrics.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2018 13:07:32.8402 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ef4e71-f010-4938-df0e-08d5a5f68394
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 03c5283b-bdcc-41a6-b827-b66aa8b838e3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0601MB2282
Subject: [meta-qt5][PATCH] qttranslations: annihilate qttranslations-qtconfig
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
X-List-Received-Date: Thu, 19 Apr 2018 14:40:37 -0000
Content-Type: text/plain

In Qt 5.9.5 there is no qtconfig translation (see commit a6b3446cb023
in qttranslations upstream). But packagegroup-qt5-toolchain-target
RDEPENDS on qttranslations-qtconfg, which breaks SDK populating.

Fix this issue by annihilating qttranslations-qtconfig from meta-qt5.

Signed-off-by: Adam Trhon <adam.trhon@tbs-biometrics.com>
---
 recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb | 1 -
 recipes-qt/qt5/qttranslations_git.bb                          | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
index 234cde8..df80514 100755
--- a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
+++ b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
@@ -45,7 +45,6 @@ RDEPENDS_${PN} += " \
     qtbase-staticdev \
     qttranslations-qt \
     qttranslations-qtbase \
-    qttranslations-qtconfig \
     qttranslations-qthelp \
     qtconnectivity-dev \
     qtconnectivity-mkspecs \
diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index 59949cf..88a390f 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -22,7 +22,6 @@ PACKAGES =. " \
     ${PN}-qtwebsockets \
     ${PN}-qtwebengine \
     ${PN}-qtxmlpatterns \
-    ${PN}-qtconfig \
     ${PN}-qtquick1 \
     ${PN}-qtscript \
     ${PN}-qtserialport \
@@ -83,10 +82,6 @@ FILES_${PN}-qtxmlpatterns = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qtxmlpatterns_*.qm \
 "
 
-FILES_${PN}-qtconfig = " \
-    ${OE_QMAKE_PATH_TRANSLATIONS}/qtconfig_*.qm \
-"
-
 FILES_${PN}-qtquick1 = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qtquick1_*.qm \
 "
-- 
2.16.2


