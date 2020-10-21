Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.82])
 by mx.groups.io with SMTP id smtpd.web12.6710.1603253605220655651
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2020 21:13:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NOolriQG;
 spf=pass (domain: windriver.com, ip: 40.107.220.82, mailfrom: babak.sarashki@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OV46vbFvFy28qOq4nX6WyBE2/NccQ6I1slawSnxYmNwygp984IXolIfDA5Tvv2lSPaFXH4UBgw6oLDC1huIDrG1UkEFrK+rajqtw+XIG7iR4gpJoQv67+H9aCqO20yBryp12dmqeecMXPQDheV29Cx+sbmOZXQ+cTeGAoOTiV5Tj9exaeRza9Hy5e41dYg2iZ5X5/+AeFRmSH6QP71tdmMzsqKXCMZ2XnWQhpid1G0S8kfPlSK8xr+dHRzHhtiVDTwumvm21JipMy5W+dJsiBB0uB6zJmXert0w2nvE7uk0qDplpcGP9kqoXKLp05Tjw8TNom4+WgUfQsQewOPcT8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+IbBGWhTNUkzDggi2cEnHz4OoFGT9kvg56ufDWFR8HA=;
 b=MM0P+2WODazKIXwZ5daYUjZ4+zqz0rBLDPy/LVla1y/OSsKd5SgrBHy5Ir4udA03d6GHfWZUVdC2CLEs9WEC9+5ocxK2O2M9N8Dp+IPbF9Z3AB58nI+MxJ9Hh7PiI4XSvEJ5v+25wwNBmoY59k/Cv4ggFZavHkV/DD9EPs+QrLK026lusXiKZnnt5W62ySyRRelj6JBoHaLnwDNKi+tnhpGWzp46C0BmjNeFrjkqNqQ+US4uQk5z2RZZBe5eK/v9+xFaz8bSdED4BCHim+X6zNoEBmBcyCxiQGWuYxDASka9hoHBZuYrMkGGjH9wTRa1IrPyVlDPB/oPdNp4ytt0aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+IbBGWhTNUkzDggi2cEnHz4OoFGT9kvg56ufDWFR8HA=;
 b=NOolriQG8QwVe+iQ9KwLUBX68Kq87rX33vfY4SNYKJ+sR1PAOx7BCbHm6AHBUOCb6SNBYEn8iEIJliBZMlHeCahniekSYE5OUEwrh4VXLABZHV9qnv7e/npjJtkAmd8D8VB+4bZLeP4Mc6G8O0GQ3JD1nSV+8/X+UkMBnshIHFk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2855.namprd11.prod.outlook.com (2603:10b6:a02:ca::26)
 by BYAPR11MB3205.namprd11.prod.outlook.com (2603:10b6:a03:1e::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Wed, 21 Oct
 2020 04:13:24 +0000
Received: from BYAPR11MB2855.namprd11.prod.outlook.com
 ([fe80::2914:88c6:145c:f360]) by BYAPR11MB2855.namprd11.prod.outlook.com
 ([fe80::2914:88c6:145c:f360%7]) with mapi id 15.20.3477.028; Wed, 21 Oct 2020
 04:13:24 +0000
From: "Babak Sarashki" <babak.sarashki@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Babak Sarashki <babak.sarashki@windriver.com>
Subject: [meta-python2][PATCH 2/4] python-amqp: add recipe upgrade version 2.5.2
Date: Wed, 21 Oct 2020 04:12:40 +0000
Message-Id: <20201021041242.14449-2-babak.sarashki@windriver.com>
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
Received: from scz-hmlb.xnacht.org (71.198.98.210) by BYAPR06CA0040.namprd06.prod.outlook.com (2603:10b6:a03:14b::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Wed, 21 Oct 2020 04:13:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af144001-67a2-4ef5-efaf-08d87577a739
X-MS-TrafficTypeDiagnostic: BYAPR11MB3205:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3205FC8D2FEE323048354132861C0@BYAPR11MB3205.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:147;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iG0l4LQQmYkSoNFqFgFIViYxiz7AM4u3SzBbhqtu7HFZD213Cogrb3z/EbTw/21kB47kl1fCejmnpDiy5zFRNwecrX4lQa8Ds4AR1fMRadb/oK8wdVY8gMfMC16KB0x394E1nlBlTmMmMFj0QOFV5ynnzCV11G3ebc8cxQyuFX54Q9A9UquVI9mcMg0VciHvfhSQwSl9ig0S6kA3Vh/Qu42D12I4nAWZuxkpOIxHcxEvMgtm6lIrGgkblEFPdpskJwbbKGBt48N80MYyFtEagVs/8gdfSO9sLEyx68m5zsrMm4C/N6YLeyu5uxpZuUCpIigNt2HOohdeo0K0Zn4HfsT7uhEPid6F53vptEpuWRo8mer4w7zND36PqJsO5Fx9Dnw8LSZ7iyvTvyoF+uwcog==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2855.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(396003)(39840400004)(376002)(86362001)(36756003)(1076003)(5660300002)(6506007)(478600001)(6916009)(2906002)(66476007)(26005)(16526019)(107886003)(8676002)(66556008)(6512007)(6486002)(186003)(52116002)(2616005)(956004)(6666004)(44832011)(8936002)(4326008)(66946007)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	S4vLUrQv9NbnmM/DlIbLXr/fAIimJ+Zyremek+Hgfq7aSlLmLCE9oIf86HLyJ5o0He2rpOlIATHPv91a6BWh2bWYvgsjBWtG8nTOBjA+EqpOe7ciDWyLeTJCNbfLuKTnNTZ/P5/Oii7VN6jR7OPqz7VguauX5mdP+uD0fSqXN3U5ez74kceGIdyk65+Yw0kkfHh/7+AzLRFsXD1VF44lwwXCn8rto6qnXuI2jh3Hm9cTxUpuNJ0CADPZB0UsxDWxlzrhLr/eMjJ2yinPbVk2elWOKJMHzdWQu3zrPNDC6dYuOqxJEqsE2MNyJeYhq6+1UX2u/FeZQ2Nzs4BulA/j2KszgPmIhe2UQHv8YR8xqVg3eI/HtqMJlxXS+7GZl1toonOtdHKWQCKmbH3Bjlp3Sx5jKRf2D5SziqIssbmroGjNFWjCEIRfzWE9YZrdkbeyz1kFv2nrF+ypFWolwzZgXPTwSyBCaEiK5ojEZcTMCdcIwRUFn6DAP/sR8h9BcowFDSqaIsNqJ0rkVk79JsXPJpJAcKQRguZXgD+7UNnu4TipoOMtZVCnuaNik/LaCUmip9j8QITwyoXv3e7NmAto7LEGUWDnsHDucAsk8D/g7bm8sDyhQdwhv63TrQ+fVHg+pfVHMf473qRog3MQA9FbrQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af144001-67a2-4ef5-efaf-08d87577a739
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2855.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2020 04:13:24.1214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zWZMIKyZYQsz21XKkgQrTXLYqvy7i8jO17QaPmqu+kaEpqg/ucFnziSwBcLpVrUAR15JAut/YcA4L4xA5Vw3zu2N6zGmMciV4wbod/usoTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3205
Content-Type: text/plain

From commit bd22d005259f90ad2b3f7e24e6b58805039093fe in meta-openstack.

Signed-off-by: Babak Sarashki <babak.sarashki@windriver.com>
---
 recipes-devtools/python/python-amqp_2.5.2.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 recipes-devtools/python/python-amqp_2.5.2.bb

diff --git a/recipes-devtools/python/python-amqp_2.5.2.bb b/recipes-devtools/python/python-amqp_2.5.2.bb
new file mode 100644
index 0000000..a8bb4a2
--- /dev/null
+++ b/recipes-devtools/python/python-amqp_2.5.2.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Low-level AMQP client for Python"
+HOMEPAGE = "https://pypi.python.org/pypi/amqp/"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9d6ba772ac59c08a25a12ce15bd5f27b"
+
+SRC_URI[md5sum] = "852ecff645c00f124c78915fcc8ea7c0"
+SRC_URI[sha256sum] = "77f1aef9410698d20eaeac5b73a87817365f457a507d82edf292e12cbb83b08d"
+
+PYPI_PACKAGE = "amqp"
+inherit setuptools pypi
+
+RDEPENDS_${PN} += " \
+	python-vine \
+	"
-- 
2.17.1

