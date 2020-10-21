Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.79])
 by mx.groups.io with SMTP id smtpd.web09.6736.1603253606585399180
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2020 21:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Wx3K4GUL;
 spf=pass (domain: windriver.com, ip: 40.107.220.79, mailfrom: babak.sarashki@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PgXfnGfT0vaMwAO77W/j/lJSWy3L4H5irsJRm8ir7wPgZPpsBK4kaGHxa9SfCb/Cf8xh+VI49tzYxQGgdhAb2ZBMq4eLRguAGpXyBCEzQkgOl3d9Y+yTluphE7XE1+VvTXyhJKm1nKxZKYgHnc4dsWhOICSlyzXFfOcx09qoo8U2EAj9dU/4NtEMCUG2wThKlQ11XYyY4AfewnMD6f2r470sttSgAPrTuHn7DCQM/UDyUvXz3Y/6nJBrFNmFcV/RD2cIEcTKONNDzNYPPosD3R0+G7kat8Mi7L2OfD3bK8/X7tEQczZYicTD7vaKfVFyAo4XbMd/EbqdZH3GuW13dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUYy706atXu30SlTCrofTqpnJNLTcwhXKTBCbiIaSVU=;
 b=VfA0BUdafOM61NoiW1ZSB9e7j2CfuqsGOzIa2vDaGuGTyuARCeYq+ptap5S/zQj07DRHo49G1m8bqWsyoX7Fz/muU+m1q48tYIHT4tRGNpB0uVUCQv0DbNshCgSQtGmqU65ytNJ/vbOkjqF/LXV2Q4ayhzY0bVK0ZCGxana8awARHZm/eySvhHKmqeMZrjuaX4VDwxkH0yD/O1iek2HQRb7ndXY77u4zE3A8873obbHODREha5OBss5Op65ZNUvawR4lVNu4SSpjGo4lekaOS/TNzT2wBgorYC+qAHlgeybQbV5FHR+ELgZAXb2uiYkst6WRHeMp949nNO2uB5qK0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUYy706atXu30SlTCrofTqpnJNLTcwhXKTBCbiIaSVU=;
 b=Wx3K4GUL3qrE+8XsZTkFt4lVCVr72R9XxlFkf7lOAZv4m7OlaKacA5Tr+3MbdjyRTeE63MeIQWznyA9gICeUjA228eUb+lzexsWPpNdb4juulGSkCfsAcJS15wlVSD8NAmZyy/1I4cOIkKoYAoA2uJc67jMw7/InENejUlHG4DI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2855.namprd11.prod.outlook.com (2603:10b6:a02:ca::26)
 by BYAPR11MB3205.namprd11.prod.outlook.com (2603:10b6:a03:1e::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Wed, 21 Oct
 2020 04:13:25 +0000
Received: from BYAPR11MB2855.namprd11.prod.outlook.com
 ([fe80::2914:88c6:145c:f360]) by BYAPR11MB2855.namprd11.prod.outlook.com
 ([fe80::2914:88c6:145c:f360%7]) with mapi id 15.20.3477.028; Wed, 21 Oct 2020
 04:13:25 +0000
From: "Babak Sarashki" <babak.sarashki@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Babak Sarashki <babak.sarashki@windriver.com>
Subject: [meta-python2][PATCH 3/4] python-vine: add recipe version 1.1.4
Date: Wed, 21 Oct 2020 04:12:41 +0000
Message-Id: <20201021041242.14449-3-babak.sarashki@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201021041242.14449-1-babak.sarashki@windriver.com>
References: <20201021041242.14449-1-babak.sarashki@windriver.com>
X-Originating-IP: [71.198.98.210]
X-ClientProxiedBy: BYAPR06CA0040.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::17) To BYAPR11MB2855.namprd11.prod.outlook.com
 (2603:10b6:a02:ca::26)
Return-Path: babak.sarashki@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from scz-hmlb.xnacht.org (71.198.98.210) by BYAPR06CA0040.namprd06.prod.outlook.com (2603:10b6:a03:14b::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Wed, 21 Oct 2020 04:13:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae1c6b3a-6ab5-463f-8711-08d87577a830
X-MS-TrafficTypeDiagnostic: BYAPR11MB3205:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3205C4810446CEC0C1D284DF861C0@BYAPR11MB3205.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	C7z0WxoG+ejN6AuZUPar8Qi5gpixUkftYeNurCSui5zz9ATZBGWxTQYGs82wCnRN+WShcLh1dzxV4u1rO5spLplu0Jq6Xkzgkajo12IfafGpYxkymHWChuAk3CqvLmw6sMMlRUB4Xafshbn9zLUWPxA1YC1ROrpdZalBMevr+sWzC+u4BzSSGLChQwoq/uSdvC/BR0WgjMAMzQbcEfGb2fRkvek8+xDeaE1z6Ygtn0g6edq6b1uGdpmuByIPSzXs1/JKvyoYKRiN+1KZ8386ygCR0xQcODshOIraOGeZhq6afroAYq2F5NVzCshOGC+AOZTG7IS1l1NX1tRUKHwhx0xBDrM8nbGA/Dh6nKJZ5RNcDINop9DmwNVRHivuMgNk4r/PbPUvdiIN89/gbabT2Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2855.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(396003)(39840400004)(376002)(86362001)(36756003)(1076003)(5660300002)(6506007)(4744005)(478600001)(6916009)(2906002)(66476007)(26005)(16526019)(107886003)(8676002)(66556008)(6512007)(6486002)(186003)(52116002)(2616005)(956004)(6666004)(44832011)(8936002)(4326008)(66946007)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	QIxsvnYv1uwiL8K1KhPpk1DDPrWLNjxHAqbV+CBnaImWffKNoIFZt2+geHhgsYPm6zug3Jkek2z5q3DA+vh9LmHuNVG2rOMOLG2ZaLGmolLBAAmQJojKlbxLUjZ4AKPGh6G7wLcGC8+fKcfscWw2Ed41JN0ESMhZ7pO94O68CBbsqm39Ota3DKjukGUssDVr9MEYhWY5Mrr79diWyIKHYkE6vOK57K8krDjTIezCt4Lk90dQA+im1Mykd5z8X/U1yOJhuAme2Vm1whRXTjRBqjg/TL+ksr9f6mh27ZHETfboJJk7HvFKehxGlJMN+pQBQQssyPW77/pzX1XgJArZrNF765BJIZGYcXE24WTyielz8UyIP+2LgsugJlIG5khMsxbivA6nLWtGLnyCorNGJWZwNUMlQQ50nbKyLA0AAfuAClL3tm8s29S2I/Spgdd62Vj+++MJM930V+ILzDwjj8uXpQ/JK0u3PzrHWaJZ0EzFj/Eyk/sii4cPhtKWe9sf2CK4bmOat176vIJQXDimY40CCbKmrHEctmS4uUaZTRVaijr8Xf/xPMGX2AU7R2Y9bC0XAcnEwegoxNwysiLsapiOJb9o4SdiynWFq0DVzqbjG4wd+elX+8YajIGn3in27UYeskkOibo45h0nZSfX9w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae1c6b3a-6ab5-463f-8711-08d87577a830
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2855.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2020 04:13:25.7634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Azfi86IrjjCcLB8dckLtXFaB0CCm6ZK1+pLcV/fbRuZFW107/16aKbwDbOPDHv6eI+JV+AJjLmGGw3fzEnsuTs2O7vKUCILQUSjeCG8pBOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3205
Content-Type: text/plain

From commit 1848f000bad47d98900ef945c76c750c3edf1a1f in meta-openstack.

Signed-off-by: Babak Sarashki <babak.sarashki@windriver.com>
---
 recipes-devtools/python/python-vine_1.1.4.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 recipes-devtools/python/python-vine_1.1.4.bb

diff --git a/recipes-devtools/python/python-vine_1.1.4.bb b/recipes-devtools/python/python-vine_1.1.4.bb
new file mode 100644
index 0000000..268675d
--- /dev/null
+++ b/recipes-devtools/python/python-vine_1.1.4.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Python promises"
+HOMEPAGE = "https://pypi.python.org/pypi/vine"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6fadb0e48ceb84b571372dd706ed76a0"
+
+SRC_URI[md5sum] = "9fdb971e7fd15b181b84f3bfcf20d11c"
+SRC_URI[sha256sum] = "52116d59bc45392af9fdd3b75ed98ae48a93e822cee21e5fda249105c59a7a72"
+
+inherit setuptools pypi
+
+RDEPENDS_${PN} += " \
+        "
-- 
2.17.1

