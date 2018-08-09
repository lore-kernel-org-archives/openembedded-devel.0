Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 50974 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 09 Aug 2018 22:37:47 UTC
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr720044.outbound.protection.outlook.com [40.107.72.44])
	by mail.openembedded.org (Postfix) with ESMTP id 79B4B74599
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Aug 2018 22:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=9WyfTtlO/wPvFcR/rMX0OEkKSrRrSaALuYf/AmGdmP4=;
	b=hjLsP0storhBMw7rphAo8AaQuHpPxMPlZzSEwEUcz/rBeTiP7sWwJ9Jo63FPT17TeGvXYGGYs7ui/Ti0WysS2PvG0vHNeXdRdyGGm1W4r6PNMcEJIncY8+XitZRhsnfsrYpOwN6BJuku6okMTO0jPVTqBzUUvAmY/0KnDxQQt0c=
Received: from DM6PR02CA0015.namprd02.prod.outlook.com (2603:10b6:5:1c::28) by
	SN6PR02MB4463.namprd02.prod.outlook.com (2603:10b6:805:a8::13) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1017.18; Thu, 9 Aug 2018 22:37:47 +0000
Received: from BL2NAM02FT044.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::205) by DM6PR02CA0015.outlook.office365.com
	(2603:10b6:5:1c::28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1038.20 via
	Frontend Transport; Thu, 9 Aug 2018 22:37:47 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT044.mail.protection.outlook.com (10.152.77.35) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1038.3
	via Frontend Transport; Thu, 9 Aug 2018 22:37:46 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1fntYv-0006vn-E2 for openembedded-devel@lists.openembedded.org;
	Thu, 09 Aug 2018 15:37:45 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1fntYq-0007K6-Ai for openembedded-devel@lists.openembedded.org;
	Thu, 09 Aug 2018 15:37:40 -0700
Received: from [172.19.2.216] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1fntYn-0007Jp-2y; Thu, 09 Aug 2018 15:37:37 -0700
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 9 Aug 2018 15:37:36 -0700
Message-ID: <1533854256-12596-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(39850400004)(376002)(136003)(346002)(2980300002)(438002)(189003)(199004)(478600001)(8676002)(72206003)(48376002)(8936002)(336012)(50466002)(107886003)(51416003)(6916009)(7696005)(126002)(14444005)(2906002)(2616005)(476003)(4326008)(36756003)(50226002)(426003)(81166006)(81156014)(26005)(77096007)(356003)(305945005)(316002)(6306002)(47776003)(16586007)(486006)(9786002)(36386004)(106002)(106466001)(45954006)(2351001)(63266004)(5660300001)(186003)(19627235002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB4463; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT044;
	1:28r7Z2zkumTFyDkkxVFtjBkL7ThVKECfApY9rVLK5t0XWa/yJNKYMHPJd5/CzpLbI5j+giYIzY2y9lvUOLKDRSFlnUdznWDT8h6KFpNOcMLTuoZYi3qN18te74OlnyZ0
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d24a7931-6ea1-4fb9-7a0c-08d5fe48bad6
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:SN6PR02MB4463; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4463;
	3:6qlnX0Z/vuPukanyJK2uY6Ag/Y+MKLhAslAeHOaTqrFeDX05BdnC5+0bc5fERIhvT4tARLy9t02byCzOFbRZ9b3hV2YPlBLpatuV9islHan0C+x3dz9ft3Ti04VaMpeVAD1LuUNyZQIJvZOLe2RwPrrnUy5OrdnqVhvKawNicsI1gdIOqyx3sT+FLCD6dEyUazwJRiFtVWd6BS8PBijFDR1/oKqv/ngVvko+zb1KAYBZ+8HhgsdJPtKdc5XBPrhiCjSmH3NhCKWN9lcte+mESAoK7XtCdGE9n4OiErVM8/fA3NoXMYRVmPYrL+30mTJzWePj4M4iWHULmEVEEKYJk11wtP2u1s9SdwqX5KgjjWY=;
	25:dklEGgEMvKrE+jS0Z9kSEOy6hQpMJw0a5HSAWERL5zfORtsSdjkICr9qFLkaxUaQ5oUry15d+2uYrjHtYxcRhitSpLnqAN+Zy5HlAn78kLjwTp0X4L5+dZnmp5fpQzMOuoDwLpQrP4POT1O2sTnlzWObpZc9QEUURUTx/vE+zkMeN6iC0QR/si5HnWsctJOEO6kfvfXhVFm/9PXM9yJ7fhL1CKtxo2cSL0l3UxzKIffGnKciBJ8dFfN+haEye56TLMHddd5wli9UR1QidTeqCzEva6hDMun0VXGGXplX2uZCpkyplBFke620rqheRd/cHX8cPoP7qtizRlpYxxhOzQ==
X-MS-TrafficTypeDiagnostic: SN6PR02MB4463:
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4463;
	31:J9QzdfoUNVVyJf/0iOLKgXJz2RdbYaJth3SV5ez3GOVPzcBWjseG2r4a1hkNIIp+/yrzj4FuNiyaexOntejFkjhChetH6HCpFda6wmu9313Vm5kTHbJ0COM3SVOPSWPEkgSniuKMCpZDIKZx3A9RPHK6S/JrXWsmYUqPjVCfvgmHCkFXmJxACY/pY0JNAkM50iI97+v+xDlI8K6IGYZQrbccseKk2bqhQyiQGCe1REo=;
	20:ARMcgotlec1HIJKCIAhEMFoqjGdAhxwScQmblL+ojLOMJ5PK4Lz881KWVMnSGXgZFIlfsRfSn8J+DhNnh61mEnqtaYoyPLGFqu6s9kNMp/f6mW8lCFRgjGVvbClc/0zW4Bb2qtP1cc+35yISJu+AFCv9WG1OLoGa+YTuv9sM0+a6RnGZkNujLvsWJScL6aZSRqJgGd7+SI/VVIKtj5j+HF+l+q+2R3t2K5fMQqa/YK+FQIPKLWILILGj1UHbHm5+vPOlE6WLHssAU1ND1dLJj0xMtXQFnruE0vAwayaKxTks3yB3QlJUNfRwbriMts3/8JTsvqZ05xPROU4Fl0CocCi6AHFW6MoikOdTBs4HDfCdqmyt1V+gZ8sgRZ0dZSguNGc2CC1hV3lvwOqRQs7oMNJbQmjKuPVMETeaQbxyDEjPmBtOEBV4Dg424N7LSFxlfen18qVaqL5cTALKJFIZ1avOFgjZaBOWST5OOL2xJuepYDQKue+dhisns22oo9oT
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN6PR02MB4463D7FDCF5981508CEB2D9AB9250@SN6PR02MB4463.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(3231311)(944501410)(52105095)(93006095)(93004095)(6055026)(149027)(150027)(6041310)(20161123558120)(20161123564045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(6072148)(201708071742011)(7699016);
	SRVR:SN6PR02MB4463; BCL:0; PCL:0; RULEID:; SRVR:SN6PR02MB4463; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4463;
	4:CyxQ4QLY5uyP1JWScpED0m8nHHO9X78Jf+YtOMtmDqttXh2Yz2SrrbX3UfhYSrxWTlNhbjBd0X5E+xzfbnXvAFP0Isw5eBMY2V0BIVV93tLKdwz5TMOOM1PymWnouHBcObVUKpTw4hXXrpgyD6WAvSeqnpzbHKViTYeC7RZDGTSaeZIQKas88dj7htIBjXCk0oW8dIfo0fZWlZDmZ6fWNFur76tqGRB3e0Lx9OJARZqnna2gVX0hcxblttjB+dsVnK5m47spa/eLfeaud9eUay2eKl0BWMi/f12bpfmGpROlYzx/VcFiWMpS4sPOKvcJ
X-Forefront-PRVS: 0759F7A50A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN6PR02MB4463;
	23:0GL5hEM3oYdTHuDuRJPIfTk9DwvWdJoaHDNBj6nUC?=
	=?us-ascii?Q?kQWRtBe8UoiF2CyTfHy63nVOlvFYLOeWEvWI7HDKBqF8qYexOWgeks+QfWca?=
	=?us-ascii?Q?pZoFvR+SHn7dxfIlAVVM812P4NPoVJoAOzpjEn+VYetP7cQ517yEqJ20JHPU?=
	=?us-ascii?Q?qe8ZaqHSlGokaavEYALDR+l2pjXnRlOxBOxt95P0ohYLIS7vS19KoOZ1OYJD?=
	=?us-ascii?Q?vyE7RxmdCc1smHvJkwXwI4NYCun80osdKEjv+wxhmWEFXzu5bzetEr23O+2b?=
	=?us-ascii?Q?7vuUYEIbdUPYMNdI6456/IlzjC14tmook6jDvP2d1OWFYMbD82poDxE7639d?=
	=?us-ascii?Q?Al6nbwv/zUXbZ5Bi8iKnPT14t9aoObzQ7WWxs44EeCHKS4UuzGv4YAB4arpa?=
	=?us-ascii?Q?PKbAo6bmp+g6ibKI2qnz91gQacWabVpP3wUEyMfnBLBsdDZ2wqDxYBDyMSBy?=
	=?us-ascii?Q?HZItE80j1z8HjRPefjfdVf2iUqYumv2oOras9ZXQeHGkolbEkrTaCo/Qom7N?=
	=?us-ascii?Q?jdKC1RE7c68vKrOKrsimvWO6mdawGqRWmkd+T/QENcndAedWdIuXLEYl3zcq?=
	=?us-ascii?Q?iikaas7F1UjcesavUlcc+HETidZ66n7unysfSVAzf98R8xtJRPY/BZVd8cgH?=
	=?us-ascii?Q?msOxX+MN8eHXIXtMCULKX2IbA6TVM3MZzdq5Gmhw4mzA6QQXQYUlkTD/ZCcg?=
	=?us-ascii?Q?+zW8SwFsaM8X5l+dIoTaOmOykQ4rXiT9TeEvBVKnmvESk91NCe5FKI5TQ2Bt?=
	=?us-ascii?Q?vYmJ07+L1P4C16g+Z/vRMwx6qV330r6sNEqFD7BvEVC6KP6eUp+PG6JDkazp?=
	=?us-ascii?Q?2nv1ItWPH+wE9+n9EkNrcJQw1eGrlKroIwQRbcYh+2U5x6O/P3X9co45oqOj?=
	=?us-ascii?Q?lrpk2o0XSSzQKw6IYTDOUjeW1sYdArIwasac8M2552C8c7h7TWakzOBH9Qh+?=
	=?us-ascii?Q?sg7i1Nm6Kp/7xdlMQqqtz7sXDy1YCkSDBEAGOcOsD3Elh5ZyJ9vhXil13XIz?=
	=?us-ascii?Q?W/jZkCEXQPh7+jphlvUA3kv4EC2K3/bVc2/9WGgJpcZjub7Ecz1H95q7uVlR?=
	=?us-ascii?Q?wigL3lbBhD2ND7RbkkiYkF7zLDC3fS8tcBqFdsrEWJprzzJR6xnJadR+JZ2x?=
	=?us-ascii?Q?jAmFZ3AugtkYcHGTEXuOf3iMIZDjKv9?=
X-Microsoft-Antispam-Message-Info: 0gDiZ91EoVajfHzDL9BMiElylXVeI9kgrcoTGJgOHSINPehXKMwxJuEhvR6Jr7xi24Z/fA7c6lvRgQt6K3QgYXQ4W1NrFah8wFUGTuL4v7aRRVpvxuXWNsOOg3Vgsg5TO1YAuZX3/N784YyR5CY4y9ac162YHxmLZrDKCO9Xb0ypkGPdhf9AzXasWqW893nYk/OZIlC1qBXxCK386SwKyLTzuDuxO/LlFe75+WyilKDuFMkHcDvI/Dn/JtsSDfx2mFR81xb2oS7TMx8O4aTbQvetFyZ2AfcTGx40s5eqnOWYAIp0i3IItM1NCXVDOPsZFl/qBBLLrBXBJtrRy5xd2oW190HodMQmyo5HyCuoe2Y=
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4463;
	6:k8xeSrvaJH20nWKbD8hwzpYEB1DVys5YEuuRWS2cw1weVgT0M2Q+ilNxDBNjv883cpQPYbZvNEY3UnfB5nAhbEBWYZw8Zs/uOkAmkzKZrctgeoiJ4h4vY+avyaKHUk9SoCz52/N/QYAJFxQCEJlmL/QJ9CvhW+qoEiySIA2MdaK3d4fP5Y8sXzn9xM8DXOkzCJSDVZ4aiBS87IHIc11RDCwvjTg+ynzuY6Uds7ygc+e59U26ROKRQ8YgLW8OWLiZUCK6nwrxAD0vgdNAIoHAH/oY+yqSvSBWjCtJdgtiVAoQRKArw63cpliA82Qa4gKdoyYfhGQRFo9nscNnLoXUT4cVtegDffUEz8mBynWJA80XcH31KHIDN2+6A8k021RlSU7oqxEEXSiumCkZ9PH7A49TFhFE3bxakQnzrfSEsCXwPbp4FPfrXNR3l1b4O6EJoZy6r5Mc5COaP8wmDJRlDw==;
	5:s/tIjL1vjfr/1Fii3eKm1cdayG+DUCKG13lMnykBon/lDmQZ+6V5WzIoB0AQpjKHl5QRJM7ayngfH+mgiXWpQZ1Ejxr+0mzRuyhcboUclj6bPrtgjZnadOTerUUeaKb+su7C+vxo2kDMUXKZHN+FsxUbPfgS9fN2HTSoMe9hLB4=;
	7:zKpVW4LBjcfM7sD0IHelR1/qh0o44o5vznOvGeJjX52uMl/GuZc8jnEl5mOfjE0QsFw5j4WYrrx11I/kCF5ts/06AtQi2u/1jeZatQ2dAneoloRjNci5oBO6fuOglU41cLBAMKB758tr2E+ih6caQadO17Yja2LEM3+95lKsG+JUo+BGIWsNlvHPserNddI6q8dH6UX/iItR2JQb2oDkP1Bxwe92dHpPnbq9ITaPhyjR47V/v9mNboWSlwUOmh7l
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2018 22:37:46.3511 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d24a7931-6ea1-4fb9-7a0c-08d5fe48bad6
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4463
Subject: [PATCH] wireshark_2.6.2.bb: Fix the configure error on git describe
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
X-List-Received-Date: Thu, 09 Aug 2018 22:37:47 -0000
Content-Type: text/plain

This patch fixes the following error during do_configure task

| fatal: No names found, cannot describe anything.
| CMake Error at CMakeLists.txt:3086 (string):
|   string begin index: 1 is out of range 0 - 0
|

Using --always is a fallback for fetching uniquely abbreviated commit
object

Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 .../fix-fatal-no-names-found-git-error.patch       | 23 ++++++++++++++++++++++
 .../recipes-support/wireshark/wireshark_2.6.2.bb   |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/wireshark/fix-fatal-no-names-found-git-error.patch

diff --git a/meta-networking/recipes-support/wireshark/wireshark/fix-fatal-no-names-found-git-error.patch b/meta-networking/recipes-support/wireshark/wireshark/fix-fatal-no-names-found-git-error.patch
new file mode 100644
index 0000000..80119e3
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/wireshark/fix-fatal-no-names-found-git-error.patch
@@ -0,0 +1,23 @@
+fixes
+
+| fatal: No names found, cannot describe anything.
+| CMake Error at CMakeLists.txt:3086 (string):
+|   string begin index: 1 is out of range 0 - 0
+
+Use always to circumvent the issue if git tag is not present
+
+Upstream-status: Pending
+
+Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
+---
+--- wireshark-2.6.1/CMakeLists.txt	2018-08-08 18:18:05.388318652 -0700
++++ wireshark-2.6.1/CMakeLists-fix.txt	2018-08-08 18:22:27.829670496 -0700
+@@ -3078,7 +3078,7 @@
+ 	endif()
+ 
+ 	execute_process(
+-		COMMAND git describe --abbrev=8 --match v[1-9]*
++		COMMAND git describe --always --abbrev=8 --match v[1-9]*
+ 		OUTPUT_VARIABLE _git_description
+ 		OUTPUT_STRIP_TRAILING_WHITESPACE
+ 		WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb b/meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb
index 1735ae7..e949080 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb
@@ -10,6 +10,7 @@ DEPENDS_append_class-target = " wireshark-native chrpath-replacement-native "
 
 SRC_URI = "https://1.as.dl.wireshark.org/src/${BP}.tar.xz \
            file://0001-Add-libm-to-link-for-fmod-API.patch \
+           file://fix-fatal-no-names-found-git-error.patch \
           "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
-- 
2.7.4


