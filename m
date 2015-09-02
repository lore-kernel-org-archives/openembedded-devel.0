Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0110.outbound.protection.outlook.com [157.56.112.110])
	by mail.openembedded.org (Postfix) with ESMTP id CBF4776F8C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Sep 2015 09:29:22 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	DB5PR02MB1175.eurprd02.prod.outlook.com (10.162.163.21) with Microsoft
	SMTP Server (TLS) id 15.1.256.15; Wed, 2 Sep 2015 09:29:21 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 2 Sep 2015 12:28:56 +0300
Message-ID: <1441186136-13539-2-git-send-email-samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1441186136-13539-1-git-send-email-samuli.piippo@theqtcompany.com>
References: <1441186136-13539-1-git-send-email-samuli.piippo@theqtcompany.com>
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: AM2PR03CA0025.eurprd03.prod.outlook.com (25.160.207.35) To
	DB5PR02MB1175.eurprd02.prod.outlook.com (25.162.163.21)
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1175;
	2:erBUtBxNiMzTgfqGAkbe3Gk8PYPe12OZd4DHPVs3+xdbEj4ot2SyRYtN6kT412YtK3Sd5d8Mk7hvOPP+vXrJ0MS6MrOL/laH5442XmsYIp1Jv37phs48doAhnhNZJ24hNyfbB0mMzHUYY8qF4fsyLfe6z4aAzFSiUHffyjgRIwc=;
	3:tONv2Jm16cQENzSfBkmwHCG5j4DdpqyHFZFarCdSK7VtlUZkCOrlt+UPNiZ/IXelVRwyu2uION7JTD81ZEtkFtvrghfaUh5f4lnBQc/C8PHMqi5uTMD/LZNjdFKNWON4RAjJKuugM4U+w166xXpeAQ==;
	25:vUSqeaj/SkMzZS0sR/937VqWvnXSa2BIaNw1xBkMveMGLqxw9Gkbm2kpwoRLtjrZnGqODquNU1BsV5OfGth07S32QL8xkMRLFRX8Xep0jj/zOzz2WwaTJKq9ccjvGAMmLw8y5M1gVqapxseUSNKu8EmqTnCr4Cf6kbSkNOONpOIzbVAG6fNSKmn3wf5XNGcI9xaR0nITLlGjMMwrj+xx+SzImfZtp3a68heecNQqf1mOsqudRhlKkWp9PObWrnN6MOdu5IRFkZJkJgDZ4uGNJg==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB5PR02MB1175;
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1175;
	20:okQ+2FmtLEAQGVteM/vw8rDvc6wHp4L2lJkD4nUNcv7wzFPM/DKMvkT0+UdJzD6y1sYtpXISM+raSabB0/k+t4SHnXUV8ZpI/QMzbiZomnKESMcxe1D7e8K0WRgquD/dbDGiGdWvULDZ1XdzatPibue2wBzU20YJF64EPJhSuhc2ZPHIDKJ+PKJppp0i7CvOxiLvC4JzPK2PCpvQNjPVRm3SbAbA8E2BzzSHsvGk8AnKAe66tLTxTYetaT+sYhYAnfOeIk5f4MGIXQSoF37Vwfsr2eJP1WWMWFvdXPuYM59tHSpGfsmRl29FHJPW5RjfPoHdoZQkWY1yq9iz/AQXdvA6SxCwiWYhC6aQcWAkgFSKQi09yu0s4mSertLAMXKz2oXG6JpnqTqwlIGdEInforn0nRQe/u+TXxPl1MxNT/hfoJ0yY8MZj0F37hBrUsVfy0Dc1Fo/7CRD3ICGVPTjtRgieVHFfkeb4hThA6uVZDhSv+w8W25ZgggEbdBiJ+yB;
	4:mqX+xyRyP9zfkpuoqiK9Iv9I2NWPegOkxt46658PWNfouo7y183ZuYD9VZ3YhST2fm2fEuXj8DQvBPp8xYTNOZWia9Ue/ZeuBOeLq3LrDDJQcgm64PScGYkg4Larrq3iFTJP45O09S4QUQRExprxtSqF3N79jpdFzcjwTSSWpuuWgWicIpHj6ypnSd8CAcv/sYPEHGNXUvjDP7iL0Sz1hGv6HfgHmAyB44SAxuasFIR7rtNUUyzV4JlyB6FubRwzNioeKvNG7nH4n2GVfpztdrwboTLuvs69H/JlIvj44W/6dJAVbeU09I+OAokU40Jz
X-Microsoft-Antispam-PRVS: <DB5PR02MB1175CDD8E833ABC34348540890690@DB5PR02MB1175.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(8121501046)(5005006)(3002001);
	SRVR:DB5PR02MB1175; BCL:0; PCL:0; RULEID:; SRVR:DB5PR02MB1175; 
X-Forefront-PRVS: 0687389FB0
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(50226001)(86362001)(48376002)(47776003)(5003940100001)(97736004)(19580395003)(5001960100002)(19580405001)(189998001)(50466002)(105586002)(229853001)(450100001)(46102003)(106356001)(64706001)(92566002)(77156002)(4001540100001)(66066001)(5001920100001)(33646002)(101416001)(68736005)(81156007)(50986999)(77096005)(110136002)(107886002)(5001830100001)(5001860100001)(122386002)(2950100001)(42186005)(87976001)(2351001)(62966003)(40100003)(5004730100002)(76176999)(36756003)(5007970100001)(7099028)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB5PR02MB1175; H:piippo.it.local;
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB5PR02MB1175;
	23:EkwENLz3fz0Shmossd4yBh38iR9UfjKhogB3eGADb?=
	=?us-ascii?Q?3sMMbvRDkQA4nmSobby47itUKmKWco0O3+W5WKfDrCUMX/SDg9/23pHxoihe?=
	=?us-ascii?Q?Rrus6qKf3/dHmkqIbOABaVV3woBtUQm5sQ/NwRteH6FNMM298R1RQl2jJajb?=
	=?us-ascii?Q?Jqr8x8LwW67CI3SVCDief3kxRHO1FVgvTAhu79OgBOvNvyOSRrCniUeuhi//?=
	=?us-ascii?Q?aeVt1GljETOVXreemvLycVrQ2zSuZjcm4XqZGJlhaJYCU8LxU9wbrZ6faJ70?=
	=?us-ascii?Q?6S4vm0Ggv0SaCEhh2hHmyuvdrJSbOAGffMrhfr0Hzv4Utvu8cXkSTU5D5MHc?=
	=?us-ascii?Q?9AO63uz+3kImrx6szTzPjc91b0YjjwATn5ekv/TIa9zC3DJHdK4Ls1hkZLWb?=
	=?us-ascii?Q?7WamXozzHiQwKE8N+qpo3qvSOGgPQocJibHwyTYSVM6JgNGr6vao+M02QlGG?=
	=?us-ascii?Q?RuJgPyZe9KmSGzmXPwLBJ9XVkbUMYjVzj6V/YAp7VfnT02uuebLztr3DDLfY?=
	=?us-ascii?Q?lxsLKNwVFD/u8E7jtM/rQsunZS/O1iuhYZwNZr+ZqCNOtpZ6Nc4VzyEVUUqG?=
	=?us-ascii?Q?qkR0M1e6SSaLYtRu9or5ejuO4Y7zBuCErdR/TLMiCLeltzwLdgj6AQSrtR7O?=
	=?us-ascii?Q?JpyrKAJzFhdYkY38q3gJDtCNv88h/8sdRhcCWyzzfJ6OvSEQwhfzMhe0bL6u?=
	=?us-ascii?Q?JWKVXUun8D9zeYtsgPhhkvUzI63gUn03hq2XXdEfHwhgjuXj9fC2f8a2GzSo?=
	=?us-ascii?Q?2XwhwL2TOXKIHpwDLGr2+o7mr3kmKFbRTWfe+IOg/px1Sda5ClFztHtfvsum?=
	=?us-ascii?Q?43ad097/u2rEd08mCKPTuytPl3aC6kyHBmXEIqEjPGK62ikr7cKsgfO6y2BN?=
	=?us-ascii?Q?qGXVz7SQRxt/vh0bTgOpYR4xXX/CRl7xr9p3F/oF0jozMwfT2Ov20wNtJNxZ?=
	=?us-ascii?Q?AfXY/I6JXMHetkOZdbeZSD/rBo6yRKZCBjiw6foiT1uLfrGvJ+7Ka9kCT0lA?=
	=?us-ascii?Q?L7qkPdlwKtgd25Q3eBEcHLHz0A/B8ZP4MPFnqtX9ZaMO7FI2bn8TbOUOrecs?=
	=?us-ascii?Q?eyX7G3mDIztpZpMoKqTmrLZFQzEpadH/WZRlSUOHsvBtvyTaubhMKrZWM2Av?=
	=?us-ascii?Q?CwGP9rChL5P3DWaiJRecZHynTN9davkiCLrkE8oKueeWZcHdVJVeQ88KEsrs?=
	=?us-ascii?Q?rXRpk/BnWJzPlVVYZXR7WILNOIbjk9y4+lFWjIab89eQTxh8Ax1Pq8JVLj1F?=
	=?us-ascii?Q?wmpbgnVo6lWfCt70pOtdgXb3C+UyugPjz054M8QrBXlbNLsgjFvMVGL2V+73?=
	=?us-ascii?B?QT09?=
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1175;
	5:yMgRH37Q/bwrp0nHXGSF/D1Bai/KWjKD7qTNNK4WyDzFAGTZXXru5DomE6jU28bx/J+mSzp/H4LnSdIc80CLnICtadm5RiN4CSFPb6zI97Rvo3tJfPju7nlQVuLqzRdr45HLOc0mtsRHYwhH7WSbdw==;
	24:95qQRgMnofUXc0oc2Tv7Kok46/5ET8BevYUABKyOJIMdzoZ3fyCbjhUK3TFqFTTUG8Q0SA+bSzvLopR5e6GUNEMCxPaNdH6MAZ7QgP6F2o8=;
	20:xFJ46EKknjSMVmaDWD42NcJGPtlfuRUqiorBNBzNEk/Wf/TnlvDscCXD892IvowHBQpXEZtiU71TgMkv18TCjw==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2015 09:29:21.2921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB1175
Subject: [meta-qt5][PATCH 2/2] qt5: add host paths to qt.conf
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Sep 2015 09:29:24 -0000
Content-Type: text/plain

Add missing HostData and HostLibraries paths to qt.conf for qmake.
Using the target sysroot for the HostData, allows us to remove the
symbolic link for the mkspecs.

Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
---
 classes/populate_sdk_qt5_base.bbclass | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/classes/populate_sdk_qt5_base.bbclass b/classes/populate_sdk_qt5_base.bbclass
index 4a1eed3..b6ce596 100644
--- a/classes/populate_sdk_qt5_base.bbclass
+++ b/classes/populate_sdk_qt5_base.bbclass
@@ -2,10 +2,6 @@
 inherit qmake5_paths
 
 create_sdk_files_prepend () {
-    # make a symbolic link to mkspecs for compatibility with QTCreator
-    (cd ${SDK_OUTPUT}/${SDKPATHNATIVE}; \
-         ln -sf ${SDKTARGETSYSROOT}${libdir}/${QT_DIR_NAME}/mkspecs mkspecs;)
-
     # Generate a qt.conf file to be deployed with the SDK
     qtconf=${SDK_OUTPUT}/${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}/qt.conf
     touch $qtconf
@@ -26,6 +22,8 @@ create_sdk_files_prepend () {
     echo 'Examples = ${OE_QMAKE_PATH_QT_EXAMPLES}' >> $qtconf
     echo 'Tests = ${OE_QMAKE_PATH_QT_TESTS}' >> $qtconf
     echo 'HostPrefix = ${SDKPATHNATIVE}' >> $qtconf
+    echo 'HostData = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_QT_ARCHDATA}' >> $qtconf
     echo 'HostBinaries = ${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}' >> $qtconf
+    echo 'HostLibraries = ${SDKPATHNATIVE}${OE_QMAKE_PATH_LIBS}' >> $qtconf
     echo 'Sysroot = ${SDKTARGETSYSROOT}' >> $qtconf
 }
-- 
1.9.1


