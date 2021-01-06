Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.41])
 by mx.groups.io with SMTP id smtpd.web11.1483.1609894683714950403
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Jan 2021 16:58:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=J9Zz69Yv;
 spf=pass (domain: windriver.com, ip: 40.107.237.41, mailfrom: wenlin.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AxxkQUxMDttQmL9Oe9JxfDyD8/6VaaSHrGxhztA2M7Fa8SFR1mXgoWwXXFJHUNq4pV5orLH8+DqYXKUkkV7uxFk5mqJIT4mVlUzUkz9+HLeeYBPZoMcmgliX7AM59S51mFcJogZfmHycO8DX1VEjAvXXaO6kHDIYfM16wWcr8dbEYGuhkZWhyZ9QtXaeTwzFLaQrO5tyBa9zCKzA1SBVWdr6ZRa6U1KPiiwEtxXc59kiC48A7r71psOprx2Uhc7N2vn1qh40gj0/dpA4n5wpRgezf8mUZ+sJqFxyPuhzk3vkLaRgH+2Vx5HsQ4BVlRUFgiFs/pWFk9cdvq9MsLl/EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlaASzlBRfSdzOY3VwUOEwkgOxJ3QUcPJbhs8x4+xkY=;
 b=ZzFc0DhCYrOYRKHxjbkAvh16ZtIFUTzQFghkjmH/rIDUOvlCJ2qoo6gMOk3qgbLUf7Ri+WZV3xF1SV5IlsGRVbUrd37LUu1WfIVK8/5qkL08LxE8SmawKix/XiRr3agetzSDL3qz9b5/qKiN5JCVZwiQEMsR1y4JDS48H/4Um8G/9cadU+NHNKbZnQBqONcEDH4O76JqB47u0OHSgheotuwS7KFhzF24jafqquOjzooGbbEn7UL8rH8MXTZ8A1cFbk10Tp3jlZjuYrGjUCCtU+IoFuJBAh+wGTuQD9M2fZkRKdRdkF/Y71r3/lCsH8Cak9ngY9wxRX9XFk8ISdKApw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlaASzlBRfSdzOY3VwUOEwkgOxJ3QUcPJbhs8x4+xkY=;
 b=J9Zz69YvKLXcI7MoE0qvvdHtlj3bRMw8WwK9p9Nqcc6GJbxkegI9J60j//2OFbVtjXP/BAytX92krKzEpsTXYej03pnir1Gm710iRfLRqCZFCDQM9HBAjhokPMkdvzZ8y/8SdWZrzBMm19MeMW15s4qKATMRYZ+7o6GpJ6yRdiQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN7PR11MB2658.namprd11.prod.outlook.com (2603:10b6:406:ae::16)
 by BN6PR11MB2036.namprd11.prod.outlook.com (2603:10b6:404:4a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.22; Wed, 6 Jan
 2021 00:58:02 +0000
Received: from BN7PR11MB2658.namprd11.prod.outlook.com
 ([fe80::e550:890f:1479:e68f]) by BN7PR11MB2658.namprd11.prod.outlook.com
 ([fe80::e550:890f:1479:e68f%5]) with mapi id 15.20.3721.024; Wed, 6 Jan 2021
 00:58:02 +0000
From: "wenlin.kang@windriver.com" <wenlin.kang@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] syslog-ng: add bison-native to dependencies
Date: Tue,  5 Jan 2021 16:57:49 -0800
Message-Id: <20210106005749.82659-1-wenlin.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [147.11.105.123]
X-ClientProxiedBy: YTOPR0101CA0059.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::36) To BN7PR11MB2658.namprd11.prod.outlook.com
 (2603:10b6:406:ae::16)
Return-Path: wenlin.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp2.wrs.com (147.11.105.123) by YTOPR0101CA0059.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Wed, 6 Jan 2021 00:58:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bc172c2-d161-4348-ce87-08d8b1de1e88
X-MS-TrafficTypeDiagnostic: BN6PR11MB2036:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB20366B44BD2F24D8EE9FA5D2E1D00@BN6PR11MB2036.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	g9RuF8S6yBmj8fF7w4pp8/+cFYNBRcTr7lTRuMRAQ4hfD4f+bmLnqCO4P8caBIBvz064Q9/2xEsDJnkL7DbiI+pVd5hMxjcroW8Q/SWmhGCJDa/WQlk/nhipPPRT+ULYiLzIGmX9HOF0kw+VQw9whi+DC9qMJQL0EjoG1uLYA8JWp7hGsf3rWKvt7E5hyJwTeFPE3Miua9Z9ty3gH3dnCvZWGpklYzLp7N72BfDpKz/DtX4zMM3OD9hiIqk/SRzBRgxFCtJoTyNcGKvVQ7oQmey3AWVdKmJKUseXWjLmv2eT9SUfhSpaWwXHuwLdxVSQKJDu6Ux5LVRvwh2kMDN7K6VlQ9SM7ttJm+wYNwgL9pKjrxX6HIVPGjVJJyjvm3mHw+zz7N+/xJQrMNE+TNb3EjYz6Qalz6sFQ7KN8Xn5ZykUamU9hGKxdJOoLMv6s5VhHeNSObD0MNJuW+lAHNYaaA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR11MB2658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(39840400004)(346002)(366004)(2906002)(86362001)(316002)(956004)(8676002)(36756003)(6916009)(478600001)(6666004)(2616005)(6506007)(52116002)(66946007)(6486002)(5660300002)(8936002)(26005)(16526019)(1076003)(66476007)(6512007)(186003)(83380400001)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?WDbIDJOZfVH1V9NbLmTxQULhjSdCF1j+icGrlbcc28WBLz9Y74ookVziwP8x?=
 =?us-ascii?Q?OJbs7D/xT3utF5sdFN897dEug1FdeQnvhpmRRFyjAnFaoh8oJZcizy+/HOsx?=
 =?us-ascii?Q?VD8XENuXU30GkRaaUUj1g9223f4Sx8zkcrES4id7DPdPS2W4MBYhRgmkr9LE?=
 =?us-ascii?Q?4hJtTC7rtAlzpxUkwenv8CMPA3FxmTCugnUGbOG0QlkivvB6yC/rmZRlilv/?=
 =?us-ascii?Q?lSJGibjTIi91BRrw7UreLQQqg3Yrpb8Vy2n9N5VyvLZFE7mB9TWcBzfypxRm?=
 =?us-ascii?Q?2gLUObNMiBlZ0bTF4rxmf3fHmlM1cdniSiV3TlpQ6IMpgWXQCbwcaPnU6vFY?=
 =?us-ascii?Q?NAwc+CimR+tQzbZ3peNK4gexdTrzUL5D0y/qr3qczUdBlFvaWVjJughu7THW?=
 =?us-ascii?Q?SzeZ1RIcOsjDAxHeQe3mARsIaozfZ9CibrbG9UfWxs0jiBDAOogxLgVzTwBZ?=
 =?us-ascii?Q?/QKRIWHXdmI7Glkx8SMSuL0rvDfiYyreGN351M3A4/xhag0cBweUcl7H/R/z?=
 =?us-ascii?Q?OfI2AnhyjpzkvrHXM3ycspH+aaq1iHUnl6crJIpVlHuTDTwLYX3ulIOr32PZ?=
 =?us-ascii?Q?9Wb8p3aMcqvsbPljZVTjYXTm1luhzoYk381vzsMVGx5dsv5YC1K6qX7RyTYa?=
 =?us-ascii?Q?xoi8L5t9cglZ89dykYk5RPy27C+JGeHBfQoajg1gTPofc2UkPWkTXM3kQKtC?=
 =?us-ascii?Q?gWDG83nfjOx5ChG0mW3QYlkyfRSTyR7EL55FEkQKbV/Ca7f1rTe2mI97LEax?=
 =?us-ascii?Q?pA67m66R0JzsKNa2boFw+Cqld7MsMe9ee9ahPVd8AJ0ZMMD4/T9djgzAH+W/?=
 =?us-ascii?Q?AJE5APpm4/USiPdbnnqgtnatzRr5JIvsl7wmLwlccYHTcf9DIH1uQkXKercj?=
 =?us-ascii?Q?pKo/6Hw6V76H16E8+LgQkmkwdmrp1FIFev87qBCf1ZSuaeEnbvCz7PkYok7N?=
 =?us-ascii?Q?Sd9GEEx1/E9PLXM+jHOxNXMlFgYBvsnjp7IMUDjC6tsV7ft6mlqMgf89D63b?=
 =?us-ascii?Q?Ei8M?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2021 00:58:02.5203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bc172c2-d161-4348-ce87-08d8b1de1e88
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XL0CkZ43g025BvtNZzzrVnQChq9wrIddQj8KflzW4/1FAu+jpaPitmDd6qMtLqlAMHx+R0DWhI8JYduDshOBZBj3BZjdXvuwhx3iSMAkacQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB2036
Content-Type: text/plain

From: Wenlin Kang <wenlin.kang@windriver.com>

Add bison-native in dependencies, this is required by the syslog-ng
Open Source documentation(https://www.syslog-ng.com/technical-documents
/list/syslog-ng-open-source-edition)

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index 2b38f4d69..818cad5bc 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -13,7 +13,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=24c0c5cb2c83d9f2ab725481e4df5240"
 
 # util-linux added to get libuuid
-DEPENDS = "libpcre flex glib-2.0 openssl util-linux"
+DEPENDS = "libpcre flex glib-2.0 openssl util-linux bison-native"
 
 # We expect the recipe to add anything specific for that version to these defaults.
 #
-- 
2.17.1

