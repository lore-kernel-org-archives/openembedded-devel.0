Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0148.outbound.protection.outlook.com [157.56.112.148])
	by mail.openembedded.org (Postfix) with ESMTP id 8DB1176809
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Feb 2016 17:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=digiaonline.onmicrosoft.com; s=selector1-theqtcompany-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=xHIA47gb6OrdZ4qi784J0djQeQ4xd3E2LlMpjeBC/aQ=;
	b=hYAhuDjlCIg/1RrInhUwIrvNyi19XEJN2x5gJDAAPWdWmhXIs4iFfOKNtYDHeRPXr/K4YEDpz4XorCdhq8wjJIgrmKo2JdOUKi36yPYWxUBkh7cX0jVbv2VFPr83oNBtwz2rCpvFRAi8vxBH1NX3zdqTLrCRbrEwgpIt8eCV/pU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=theqtcompany.com;
Received: from piippo.it.local (91.217.248.11) by
	DB5PR02MB1175.eurprd02.prod.outlook.com (10.162.163.21) with Microsoft
	SMTP Server (TLS) id 15.1.409.15; Sun, 14 Feb 2016 16:25:29 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 14 Feb 2016 18:25:28 +0200
Message-ID: <1455467128-4533-1-git-send-email-samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: DB5PR02CA0030.eurprd02.prod.outlook.com (25.161.237.40) To
	DB5PR02MB1175.eurprd02.prod.outlook.com (25.162.163.21)
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1175;
	2:K7x2iMMkzn5otaopGYtJQl+OJs3JwZxrJTKoZVXV/SBXoH0FPlXfCXw9zsgPuaCSq6WtpOfsjd1MWVBhSUwAzdKkvZgA27Q7owTpHwWRLzoyNHUUz0dH88oc577J5mNl7M0DVl82HAyq6XVcYrLNEw==;
	3:uuEYfJHNywkPt6A18WY7lccIc8DJDBumK3ijahZcY1cjipw7xJxp77t36DUiNCS6/f5u1iAFA8QJtbqDmROOJcFLTOeUCrBbWntvMtwKSdGPt7N+MKFvjkchTsJKq3Bt;
	25:6E0aLnhP7dEUNOrpoFCNDcJd6m4uzi8HXqXRtupqBYHtqCGLbRG/SAoGwDjXlzB6tlUbdd2e7Wq8wWLxXoCttlXV0JUHtzS0/avr7PeZEodMlYZiiigEIL22/R2vnli9ncyqhgsGePXVRxYblYYO5BYtEbCsJ8Exupj+DXvWvvEHEozCsrYzfpRSg38g3Sz8jiogtccdOBRO5EDa7GXxPa+YcUKrnjoieZEaowt6FS/+uv9C6ZhoCQxDHzSp6caF01eUsmy4lkXFUJIJnUg0OZ0bPRuZvJfxKCR4FLuDHxSGlvKTpPlB0I5iJEby8HOf
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB5PR02MB1175;
X-MS-Office365-Filtering-Correlation-Id: 02657539-bba9-4b21-082c-08d3355b7475
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1175;
	20:9Zz3pMR+tDr503b0ZAPnxHmK+oRw6+EWtNTThgCQ7MgaV/IQpU4oQt/QPtdzFz+04OlWOtvFwKHEtsCICy/ktMXUJHkXT92qiFDrlHvXPxhtE1cdU98+MIIjbZZFwDENu46HFpOsV9AES45fUNrb1chYQ3XGDzw1xuSdcaHy1g72T1y8KV5uwheffGij8Qu61Jo26GtsfH8dFCw36mvde8iLNJxIN9ucFHlab2JWXJc1VZ4YzQQxZSqGcqDv0jF/Gi97LVTuF5IZIirtiHcWK7LrwVeKO51qM0qoGONc1dSstM/FhumG5XMNfWApMVCSN4Y+hMI5XvCwLqkO0CMPZ0Hj1Y+HkNqy83B0ed4RzuNK3Exa5bDJiTTluo3be7+PiKJkIOkY5l+Yy5ZRx8ubBiPXev7nCk04BkUBgYX/dCqjplFDT6LuRy8fUaABtz6VK7J1L5A4pFCQUyn8zWss8mrF+2fEKo9eBUPIA5g4IBtqOod7KkI01z/ZZTD4rcO8;
	4:39fk1pvge4MzXLkiREb6yBHaf+SnoJXA1kaYIdtLVxN/91g02mUQ+uByjCQfzyN1gaoNGJd0CkvpcKB3egOlQJP6eFGD2c67caR8dvSKIcRbyX2+0Lh84alpazcRpexzhCymh05Y7TqVqpIi3vAicSRNmcAAps7HPlDoQ3GgX9haevjbQ3/JH9r3+sBn/hnSOX+58hySDy4CfZAk5L8tACO+zrqolPujv3agKcOiMzjABO3ftcweFzpQ953NWQHfCKdIvJPQ9vXsL2ZYdsL6GdLTIiA0Y83hcg2BvQKBuul4fLvOlm/D+fKLHfW0rwGkyJOe8b1EMifdXqH/NenxgdgBxQOSpj7ZbI05kCww1WYs3rxnyLeNg1moCizY0NQV
X-Microsoft-Antispam-PRVS: <DB5PR02MB11759877F035FD251DA09F7B90AB0@DB5PR02MB1175.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001);
	SRVR:DB5PR02MB1175; BCL:0; PCL:0; RULEID:; SRVR:DB5PR02MB1175; 
X-Forefront-PRVS: 0852EB6797
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(5003940100001)(2351001)(2906002)(15975445007)(16601075003)(189998001)(5001960100002)(229853001)(48376002)(110136002)(92566002)(36756003)(5004730100002)(50986999)(107886002)(6116002)(586003)(47776003)(66066001)(50466002)(450100001)(3846002)(5008740100001)(87976001)(86362001)(50226001)(77096005)(122386002)(1096002)(40100003)(33646002)(42186005)(19580405001)(19580395003)(7099028);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB5PR02MB1175; H:piippo.it.local;
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB5PR02MB1175;
	23:wuRXwUeVSa4AoZTeM2JxeyYwR3hTs2Wc16RCL2yg/?=
	=?us-ascii?Q?pdov7/KxkuX4UrJ4M/awUCo3DCrkchpFaQcaysX3BFzoKqK9HKmM9gA6VQKa?=
	=?us-ascii?Q?KAjr4LMeZJiQN7CJYVtPw2XOnaOTZphAFWwok7Sd8kBItM6Uc8h2XskdJd7L?=
	=?us-ascii?Q?iTy3nG15NbS+Or5b0fQVoWmXsu1ngfZAWz/O2a9do7tStQgWa6Db+BJuMtew?=
	=?us-ascii?Q?eSwsH0LYGIP4WNea/TH7FPsgIEHBLN8vRhmIDrLg0qSZpTjsAZhbKVKnKU8s?=
	=?us-ascii?Q?0w0Ox9XYmd+bYiqay8eozG8KzPQ+1OeO9uPviYYOCpmRxfqwE4TElXe8quGT?=
	=?us-ascii?Q?P9Dvybvv62lCW81x7t+GO/dq5aDK9S9WQgPEhxj83VC6WiNPuZ9am25Qclwo?=
	=?us-ascii?Q?9mWLAxbDWrJDFGuBZ/AmnLZR6zmrh1bX+FTAmD0WjDpjnl8C7Iv4Hq/g/98D?=
	=?us-ascii?Q?WBJrXiF8emTyrkd5IQjnMt+SbhgCMK2sHOSJ0XV1ZQnS4yYlohXmaARkyX1d?=
	=?us-ascii?Q?GqQm2tbB5CqNDwm7t9mRQFzshrK3AGsi/ae1UMIS+NESeX/KKv5YVa6C/wG4?=
	=?us-ascii?Q?iosfLvcf9LV+mL/odJXc8usCDqZtoskywkaOAiIhhvAuJe9jvCy7pGD7Lx9O?=
	=?us-ascii?Q?bVShVYvUIWCZr7S3Qh1/cLBgMQPEfd6xiTyZpUxcHzH6wakMr/R3R8SkTDLY?=
	=?us-ascii?Q?EFmidvMh6Wu2gx0huGzElKkfzBNfJZqNeQWEICMjGT3tL34fEeQ1iFRJoQ0v?=
	=?us-ascii?Q?hcR8bGEyz8IlJuaq7U2GlzKmkJVQr+7i+jjQutaEWHZnNVMjbJrMFGyY703K?=
	=?us-ascii?Q?QrqxE+VccnDxjMKePS1ptFLWNFv6TWUgSYvd6P+VbZEb9JKgSiky34+DMFN3?=
	=?us-ascii?Q?hjrmUORT30jkWBn5eAP2qvdpqkRWG6LZLp1/2nXdpSPa3pL3cIu+v1MI8b+6?=
	=?us-ascii?Q?X40eZb6TB6118JfscHUN70W+qktdkAi812jP36NP8MnhWXvkpKUHKudF3cdh?=
	=?us-ascii?Q?+FEhlDowlCHkvQvPH4D2c4s?=
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1175;
	5:lOyyG1jZPzos2GQiL5DF+U8pHfctIl9aI7oODqda8D4hFrSfBuNuvzJhsqaipSm7VXC4Qvs6brNcsh7AuKPHLYnSZNzd0C9yuq74yN50GrQa2UgLdNfQ4VnpxQPdFEkTW8JlkVirMDZPdun5OB61qQ==;
	24:hD+9wIkCK4RbZuY/jdopny9Peyr7oztvX/aNLCidJ2cqZXHK+En/VF/vM1Ekj2oA+uGxr4kguI5l+IrXAltmpGq5SNXZRMi3jSheyON5vjo=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2016 16:25:29.9463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB1175
Subject: [meta-qt5][PATCH] nativesdk-qtbase: use runtime linked dbus
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
X-List-Received-Date: Sun, 14 Feb 2016 17:58:18 -0000
Content-Type: text/plain

Remove direct dependency to nativesdk-dbus. Instead configure
qtbase to use runtime linked dbus library, if that is found.

Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 4ac80be..d800b8c 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "SDK version of Qt/[X11|Mac|Embedded]"
-DEPENDS = "nativesdk-zlib nativesdk-dbus qtbase-native"
+DEPENDS = "nativesdk-zlib qtbase-native"
 SECTION = "libs"
 HOMEPAGE = "http://qt-project.org"
 
@@ -155,6 +155,7 @@ do_configure() {
         -sysroot ${STAGING_DIR_NATIVE} \
         -no-gcc-sysroot \
         -system-zlib \
+        -dbus-runtime \
         -no-libjpeg \
         -no-libpng \
         -no-gif \
-- 
1.9.1


