Return-Path: <mkelly@xevo.com>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0054.outbound.protection.outlook.com [104.47.33.54])
	by mail.openembedded.org (Postfix) with ESMTP id 475E374E2E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 May 2018 21:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=aupr9lEWJ9FYYAC1v166oB/H9NVQabfalfQfWgfJEjY=;
	b=xAcxsfsw2XjC4Cg66bDqKUZ6dAD6h8ro6OAFn6KvH+jbXEXldwOY/PR57lEtkwCsJLBSdh0KKWGWvZVgFmnv2imQxP1rD9vUXVBwEZUAV3gsIOQlGuDUsrKYqVVIfwBvvw/iMpcOxBl74GCAcgoU5rD1NhYeKeDeKR0cCrfGCik=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from columbia.corp.xevo.com (65.122.179.226) by
	SN6PR0102MB3424.prod.exchangelabs.com (2603:10b6:805:3::13) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.735.17;
	Tue, 8 May 2018 19:31:56 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 May 2018 12:31:40 -0700
Message-Id: <20180508193141.14077-2-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180508193141.14077-1-mkelly@xevo.com>
References: <20180508193141.14077-1-mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: DM5PR19CA0019.namprd19.prod.outlook.com
	(2603:10b6:3:151::29) To SN6PR0102MB3424.prod.exchangelabs.com
	(2603:10b6:805:3::13)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:SN6PR0102MB3424; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR0102MB3424;
	3:TECwGLLqcv16pvTk1j6mqMmTn+UI2ixowr6ef6oNpFdx1tlD+ymizwsSP7IKg94azNnh1ZHp2tPqq/n4M7AeNZH1lK0kYUOBH+OIgGjYUcGaoR7WlECm/7WW66WMh92MAC7ikA/r6KoG4pm+NeMqOoOG5ck95EI76iP2r7khvgNo3QtYcJ4UfRJ9UpoAKmf9l3xX20L94sZAOKqmYQLX2i7MKgGP28PyyDJT06IC7DuuqQtj3Ido0vq1I2PHO/vG;
	25:xhwo2M3XS1vKx6X0Rw5aRpkRs99xMeepC1tz2m7HEHFLQhbBvCZIRiqOIbuAWnFIMwbbmbHCGno9VQTqSIZsQnoyLNkfjy+ouLBWTMs0OpVqOsK3jAp9F3ZeC/Nh9nZKwv4YmXrnYL4/LOHjZ9Z2IrbMU6lVaIKS/IQAXnoILxH82tzvJe0JFfUhZwzS5SjHM58xP+mHuQspRublwD1WFo6uFy2ZuatUomAaed0i/4gjrGvNnhbUsbOKjTntBkFksSkRmMdr5gYmEZJh8vbuMqILDAOUtIhU/2jR9q8SLm1Bd+ADT59ncPfoRYJch40H2tMfWsaCLQ9TFMRnBTewkQ==;
	31:0gfVXtt6fVADXIH8jZoz3MIMwMEpehfOlASPmlGgCOOUJrmvN+2Ii+HUEKDcxdep43EfK9gfDBvA50/4WwcU8HueY0oIMck6W2GfLI7hnDRXqcblclnVH9LMY0fJuhKG1sxwmKClvYSDUbnUOgEZgzGgQ80JSAFwxMEbjBexmWPD/Kt5aDvvkd0n9yaYf+QrOL6gMDWnDy616JG0tDBicuWCaYfNRNPpC0pBa3msu38=
X-MS-TrafficTypeDiagnostic: SN6PR0102MB3424:
X-Microsoft-Exchange-Diagnostics: 1; SN6PR0102MB3424;
	20:dtf2MpGwNn84XeZEUuAzpAi8YB7aCiMdACLZsl7W/oCID519bNqMuUPS4TISp5RuZvZflsQR0MqUuFNIMKjU7RjMijp9nIfL9n8sQvfPAi72TXyMAm9mCMOKwWcunvyHt/ascoLclO5il7rrATDQdg6ghvq7JM7EB4GG3+/54H3tNVE/ts3+D/x9prxkY6iQpwihlBc+YLcXPDpOP+pTxQYKA8c3ldx8vmIgQOgl4cV/aHiuG7fhzVm3WSytj3wOPZh2F9r+mXRq+INGB5rZOj4+hxnpE2YwM+JuimF7B5PnKy2MDkxnPhTZvcdsPABI/KfVQPAWnboFTU2B89BM7hwApwCipRyMahcPxIYcLsHAYUTyhiAnRCK3laKIh33CoJtZ8xWeEp/1N7DvCgBqGfsWTKG+Ly4v2ht5YQAHVsQHN/0CWKfeBrMzSgBJ/10qXdU2oQPPcjiqfCMhsH0r9kitqFYCL/MiJna0o/j53n/6zAXM7Iucln+7DpTnpN25;
	4:1aUblA1ibl6Oz8zn1A8zlhx2iWQ54MqS2EfxCiQiaRafxpLamDvgxhQLkrOgWmEpQXkca+LTaoV2ikjNPiVe2sg4wfpWkAhfZko26hNGZdPDk5eUkpJdYJZd+E0DZvfXh5NxIb0l2WGyMhBkxD8+IkcnzaUn5WznmWbVyF4qHGhVzIudYt19jZlwe+lsMC0ByniWmPYa2oou6hSIHNnzbdQHBX6nXwR5dZ13Xpkm3I0PPlEo1ZZePlVAV+Fm1eEkd14bqBhj5VtuJMgYEtA8NA==
X-Microsoft-Antispam-PRVS: <SN6PR0102MB34241777ED2849E98D6ECCD4AB9A0@SN6PR0102MB3424.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3231254)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(149027)(150027)(6041310)(20161123564045)(20161123558120)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:SN6PR0102MB3424; BCL:0; PCL:0; RULEID:;
	SRVR:SN6PR0102MB3424; 
X-Forefront-PRVS: 0666E15D35
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(39380400002)(366004)(346002)(396003)(39840400004)(376002)(199004)(189003)(2906002)(53936002)(47776003)(50466002)(2361001)(7696005)(51416003)(6486002)(52116002)(105586002)(2351001)(107886003)(5660300001)(106356001)(36756003)(76176011)(305945005)(4326008)(6666003)(6916009)(97736004)(446003)(39060400002)(48376002)(316002)(486006)(54906003)(11346002)(16586007)(956004)(2616005)(476003)(1076002)(59450400001)(3846002)(81166006)(1857600001)(6116002)(186003)(8936002)(26005)(86362001)(66066001)(575784001)(68736007)(8676002)(7736002)(386003)(81156014)(478600001)(16526019)(50226002)(25786009)(6306002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR0102MB3424;
	H:columbia.corp.xevo.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN6PR0102MB3424;
	23:7QxfzQzEH0xVKLzY6PZfeDPvJCBMSfIVm+tbF4W?=
	=?us-ascii?Q?z3Ny+VSsI/MM0ItUUYRcXPvNRs/B5rNegPN5Gk4vPRfdvYOTLgoXwvav/maR?=
	=?us-ascii?Q?F6HgCURuStT6BWUsC5+SCLYUW/9mnxLN4x0x3mw1IjQd+BMQdQW63OUfsKpr?=
	=?us-ascii?Q?3kwLL8BXnytTgw8EF43s13FLhFVEp1gL7rsD5MCehbpk+1xY0kV3u7N4fot+?=
	=?us-ascii?Q?f3uI8UejxiLB8I9u4WAaVFeIWwl/cb6mrsRimqrlGO35Kfo426crBsd5+BD5?=
	=?us-ascii?Q?lIKgHC157MmvD8zlXlxHRGWBIzQ0FZGlVEm1GbslQikY9DI/RQ+nAaKkf9sC?=
	=?us-ascii?Q?hO0LyDSoe6z+jV2JPJQrg2t8TXdOCH06iyngbsprbYUqI2LgpmiAarLwgv77?=
	=?us-ascii?Q?ZqVMHJuYAdqN0BjqmOXBk8W2uT2oPi+1pHvtVX/GavkpU6ZL4d5qzlNncudA?=
	=?us-ascii?Q?XTExqTNQhrP1dHkm9aTPFWjGCwdesmnuXCv+lBviTFMmWtFvonRoeEYGBOgg?=
	=?us-ascii?Q?RrQDPfnw/icIbcFN1J5Mfg5pSgaiHYnVtjsemGPhStK7VeDE455ElQPhQ1Oc?=
	=?us-ascii?Q?lZZe6W5LWzeptZpiSHDNeD5HNsP2l+6tO+UBu44PZhpXOUjPt9Lqq6CiMOJu?=
	=?us-ascii?Q?yn9nVKqZ8qBBStfPbvqYlH/MnelNO5OLfy3AISp8JsHmSoOo4lfCpbch7pHe?=
	=?us-ascii?Q?mfHR5UYEYXdOBm0vCuc6DrWCDwa4rRNA3csOg0Ed4C12OWhaHkxQY3v3iFsf?=
	=?us-ascii?Q?pB3YZJkNbdvUZtPepeWkD8/ZT3Qc+OaWXL+tfWDwEq7ucXyFGs76jVV5TG6T?=
	=?us-ascii?Q?zg2s2ZxIbqfSlk3hIidOkz4fRkOxqhYZB0GCH3vvbGnF5KrgJiND7B/vJz22?=
	=?us-ascii?Q?wjorS8bokiW6J1kc18fs0ildEwym4X5IG1V5cccvZ6TCGzZEY30qSVNZiWIn?=
	=?us-ascii?Q?lZ53/awr+fOEH/JDbsDmMTVlwxKLBj3WdnGXO/XYLTFwypbqahBvHwtxZabb?=
	=?us-ascii?Q?YrU3e0Z+c/M7stemCwnc/e1Em+2UxWi7y3+LoPts8Hl7ottpozgsVuWFRtqj?=
	=?us-ascii?Q?iCgcESlEFsgAd8ITo6DhEDJxHYCWQJsQ9+8MSMjN0m121oOf3oFyzOJvYzq0?=
	=?us-ascii?Q?D7x1og4iB05PGhj86D+vMCTyPNobYlNknHT7MfTpl5Ft63uX7XguDQ4erg5L?=
	=?us-ascii?Q?Tarz8Fi61cB/8xAR0a3VBTivZzgP3uhvhvfjcIyvo5MtQXyy9m7pLs6DDK0t?=
	=?us-ascii?Q?3BN8uuq4SQZeV5Y94DH5UhHAbleIN4GpeWUSPIfMCsu0TJda5S0N59kQKP56?=
	=?us-ascii?Q?g5vLFbxBWQ5kzUO5AdJg10nEsJQ7uv7+a62kOFI55KtqtQ/Reeh9LaluOVvG?=
	=?us-ascii?Q?4tOmwU1f7gkkmi2x3t+wpCve9HsM=3D?=
X-Microsoft-Antispam-Message-Info: H0aN7hiOe8K/U16N0cRsiWIEyFmXYzTujDmRxFQ/1z+qC/yP5EKh076Emi/b6Lcp6m6O6XArmR+V+SyMSrd5P0wVpiQNMEg7VoDdkNjohQd7z7pMlbKUqG3Q2F02Z7RA6o/oiH+bAb6j1tAUo4pIh8xPJjVZvB7vIo7iafey1yqph54WJmVuQ/+E6RlQfI5j
X-Microsoft-Exchange-Diagnostics: 1; SN6PR0102MB3424;
	6:lLL3G1R2sBfUi21I3SZD9WyJCyQ57XxHJVOtvr+8N3yIX1RxFR7WQon7xhA8W13/4eFSgII7lRyU84w3QCvUB/aecMbyTyh3dJTRKl/VXPNVO3bUAcSWwkbbvhlqyFjU8luSI4gZ5Gf28I/pMDiuiruYiTpc/3XWJoVdNEjmi0at5S8gHGdyj44VgdDIyqxjEEg9EdzADX0vmpsvAJnB5jq31/VO+IhFtLLj9Wt3o9N2BEnasoPELiisnmlYFg0X6YYKYb/5ySD+e17EtF6b02q4CoZZQuoM0a6BBhWZEmd/5ZA7qQ75w4hP1TbdTSuB8ds1zOoPd2NDa22TlEg1yvbhmO3d5dMDmAT/T04u35vuGX/Zvyk1UT060n28fsei+wyZpLeCFBQqAEv3PZoF3wkvjKjc9v7VvA/emxKMZkmrISyTrHaQ3CNVKT3n1VzLnX4TR30flJ5VS3SdaifzZA==;
	5:hT6R0ZJKVLST/y2UrCHd6HM+Ozo48dPljfW6Zk3PQYjEr/d17P6PeT5HkTMLyT752i4NM36I5GP3fkZaYVA11/CPGYw0qPzuvHl02uqPHaw2OJ/39CMkDOKtwpq1L+xxOsu5BXProDbfpGnjPhex7FFtDPtfXxf18Nn1WO04Wfc=;
	24:aLXRiv5h+MC1N7i88gaIOmBJbE9Z1Cb+Y5eafddStr4HdJrB9tD5f2N12/H6bA79zYtQSTV1SUu64VkGNr6VjP+aTkeWhWb3VCCggJCIrfE=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; SN6PR0102MB3424;
	7:Vc4CkxyH0n7DeI6Q5AWqYCOaU6IAf5nQawhHUZx8GoVagXcFEpTtoRBvE/8iA+0QvJYjrcx4WJucr7qLnk/8BLSEUGgR2p2BBXZYVNlcNylX6dp+r8sJWGp2RX20aPV0q9EHcYiCxqgLnbXpRJu7rozyrNZVOeIYBvL/LUxpF/DPTGeQ/Asf/PNZpKEgwGeNJZL3T8BDoHX4PGx2t6ptG3XS/mpTgO5nbTJOKNJvpsL0/9nXcUYaT3LnVBUjOTvD
X-MS-Office365-Filtering-Correlation-Id: 5bb10a28-82db-4b38-7b6f-08d5b51a5cbb
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2018 19:31:56.8611 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb10a28-82db-4b38-7b6f-08d5b51a5cbb
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR0102MB3424
Subject: [meta-oe][PATCH 2/3] modemmanager: upgrade to 1.7.991
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
X-List-Received-Date: Tue, 08 May 2018 21:05:18 -0000
Content-Type: text/plain

This version has a ublox plugin for expanded modem support. The underlying issue
that enum-conversion.patch fixes appears to already have been fixed upstream, so
we can drop the patch.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 .../modemmanager/modemmanager/enum-conversion.patch | 21 ---------------------
 ...odemmanager_1.6.4.bb => modemmanager_1.7.991.bb} |  9 ++++-----
 2 files changed, 4 insertions(+), 26 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/modemmanager/modemmanager/enum-conversion.patch
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.6.4.bb => modemmanager_1.7.991.bb} (88%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager/enum-conversion.patch b/meta-oe/recipes-connectivity/modemmanager/modemmanager/enum-conversion.patch
deleted file mode 100644
index a3fb0f3eb..000000000
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager/enum-conversion.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Fixes errors found bt Clang
-
-| ../../ModemManager-1.6.4/src/mm-bearer-qmi.c:774:50: error: implicit conversion from enumeration type 'MMBearerStatus' to different enumeration type 'MMBearerConnectionStatus' [-Werror,-Wenum-conversion]
-|         MMBearerConnectionStatus bearer_status = mm_base_bearer_get_status (MM_BASE_BEARER (self));
-|                                  ~~~~~~~~~~~~~   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-| 1 error generated.
-
-
-Index: ModemManager-1.6.4/src/mm-bearer-qmi.c
-===================================================================
---- ModemManager-1.6.4.orig/src/mm-bearer-qmi.c
-+++ ModemManager-1.6.4/src/mm-bearer-qmi.c
-@@ -771,7 +771,7 @@ packet_service_status_indication_cb (Qmi
-             &connection_status,
-             NULL,
-             NULL)) {
--        MMBearerConnectionStatus bearer_status = mm_base_bearer_get_status (MM_BASE_BEARER (self));
-+        MMBearerConnectionStatus bearer_status = (MMBearerConnectionStatus)mm_base_bearer_get_status (MM_BASE_BEARER (self));
- 
-         if (connection_status == QMI_WDS_CONNECTION_STATUS_DISCONNECTED &&
-             bearer_status != MM_BEARER_CONNECTION_STATUS_DISCONNECTED &&
diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.4.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb
similarity index 88%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.4.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb
index e60cd4b74..4f9400169 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.4.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb
@@ -11,11 +11,10 @@ inherit gnomebase gettext systemd vala gobject-introspection bash-completion
 
 DEPENDS = "glib-2.0 libgudev dbus-glib intltool-native"
 
-SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz \
-           file://enum-conversion.patch \
-"
-SRC_URI[md5sum] = "06488186c7dd53f8104183b86f7a1568"
-SRC_URI[sha256sum] = "cdd5b4cb1e4d7643643a28ccbfc4bb354bfa9cb89a77ea160ebdf7926171c668"
+SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "4efe6a240cef212bf8855c95424e7c7f"
+SRC_URI[sha256sum] = "4e366243bd4983f2e6efe35cb901cf5da51939307b5d6299fe622a9fcf411745"
 
 S = "${WORKDIR}/ModemManager-${PV}"
 
-- 
2.11.0


