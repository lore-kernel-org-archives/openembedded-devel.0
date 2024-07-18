Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44199C3DA61
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 01:25:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5698.1721265897388496819
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jul 2024 18:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=79291c7a7b=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46I0eZTo007256
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 01:24:56 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40ergc812k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 01:24:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VN57qumHCiutVRdTyxefkbSSjXhUr9R2zl/DtFr3vO1FDqj8LybQglSqoK//e/qjuKDGcI3z+wQa1eT9ltLFpsaTOzODT2w0SxxVlUvRccLu7MKCrkzPcuva+uzucOM6CueQjVBH/sEwpjn1iet9562JOIn/StyomeLOsPfCkyLB136+QwBz3vwWUj5jtP6GdzuoCQ/Aw8QMwBG4KHKRgvosnGiCOU5xaC+GgnerEIlCkQYZ/qBIBAQZjdnIgZQG5OCEGd7J0n4kn+xjy6cBrzNzxngGi69d0vO69ABgnb/h1oM3pb9l6k8Gb+XPR8MvqKXphhvKfobQXm9nWr3J7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G64+CFou4U2TpwWGvDe0V/kyKJmZWb4zo+LJPAFp1R0=;
 b=PURGOMimmVjaEtV2nSj7uaIIYw9z47nJdqSBpFvx7zNfqzp4gBThlQ8vST/qyyzVYF5Gl/2w5rIp8z+2PNyf/MHkE7WUPO90KMEIiRhUbv0HNb0Q0Rp+Hd+FxfJE/fqyQIguNCkKA2xFZCH0Hs4sMN9JOJWSjrVU/D8s4KOLOAyVj/NpRzTbxWOqI1tiLc8sDahKYdEHRakrl7wOfUApyPYes118teRHmneJxFslPLWcCm9SVVLjAydtp0LML1osE6aHmBuIRIFBM5mjNLIHhox1Bv638fhGpE/5M5wY6MEGFYFAvtAhJDmTVM8fsgAb9VUJ7xRiCa8zbm6kEUrUtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CY8PR11MB7267.namprd11.prod.outlook.com (2603:10b6:930:9a::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.29; Thu, 18 Jul 2024 01:24:54 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.7784.016; Thu, 18 Jul 2024
 01:24:53 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2] libnftnl: upgrade 1.2.6 -> 1.2.7
Date: Thu, 18 Jul 2024 09:24:41 +0800
Message-Id: <20240718012442.2618295-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0145.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::9) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CY8PR11MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: 02f6ccb4-11e7-4cf3-43a8-08dca6c86cb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hg/cGR0vmOlNmGXQvrW0qOK1vPg07BqW6eOYVONr9bnD4JXSXWcdJ1/kQKQa?=
 =?us-ascii?Q?Krs/Lmb/17Mzx/MkC4FhqqyF65ADUPeJWLI71/q2ESXdk7B6jRr9URCA+U8c?=
 =?us-ascii?Q?HgdY3XjlCuLpZFXg24f05LI61ONDV/YDB4qIZQ7nVwz9cDBsz17dRGRCDjKN?=
 =?us-ascii?Q?fA+C1TCId3FiHiMUtQkRuL7xUsn30CajBTXNVUpHPgQIZrXIjwYAhVuxsHRI?=
 =?us-ascii?Q?V01pqRjWanv/7tp4nYSq18Hb6Cp1a/so77twF2wcWc7REYg/pSoqq8UbR9h3?=
 =?us-ascii?Q?ie8/RKcsQvq0sOsjYjVTC1H5mIIGwQOp9zXUc/qJm+fViEMCNjOLlne7rt4q?=
 =?us-ascii?Q?2lDIHAHFlVO/pRr3EE0mfHgR08IAqsw10BujL8DO0takFmy12VX81fSYTXaT?=
 =?us-ascii?Q?7hNmwNsTUTTPNFlHLtZPAGu986Nm2mRJ+L7PS9uS5uefuSIvulHTL6OWDAgj?=
 =?us-ascii?Q?6uEubr4SHwCJW4jdQO3qk58pNsK8RLdqbWIBs0eIRUnLW3NEFKJmGY5CXxAR?=
 =?us-ascii?Q?8xyw1gePJFmRE9ImO8qOwoOChCYtJkp8FTFwPLs8gtfKNGLVVAX7fH+dm/MD?=
 =?us-ascii?Q?tU2DRO2MIRWXqtyQgZAKjFfOKTEqKk5hUpme4A0kOAr5vStENDp6ypsQ53XQ?=
 =?us-ascii?Q?1aqy7B7/aLQh0POBo/lezBhJdqhUZDWy4+sPC11h8kiG87upuW5DuLYYCxXE?=
 =?us-ascii?Q?iqrrNT5rvezBb6rUx7+VDl6yOiU+F5IH2NbS74H6XQR2cJUO56bp7knZm117?=
 =?us-ascii?Q?6AKhHo2rCUYabxuXCG5ps7b10n5uAF7jOvzpzJL4ehXfpO0+QKcvzT8F0Can?=
 =?us-ascii?Q?bvKJRwpmo0qt64Xcb1tElLg8VYit9xWukSgC7Q99eE5V0W2fIj/Ipduf9Css?=
 =?us-ascii?Q?BiN84zEMLxSExfgXOM7C3Q7cCi2fgg4HmJwZQfmZZNLF86hiiP6HAnpUCce2?=
 =?us-ascii?Q?vumVEP2S3O2GimX2F0B5DywiOzByr2/WDlrYTcBIgJ4sgI4YUVf/5GJRIBdu?=
 =?us-ascii?Q?Ww4/lQZLdtJReUG2e9P0H4CUpibPh+00aWxm60oQZPssfwI5cNhCJF3VVsg7?=
 =?us-ascii?Q?H2mg9XJxibVSvFiJPhjbBOCjT/xz0nEKxgKOukyZ74eWCbNXQ5N0xCMvRAmQ?=
 =?us-ascii?Q?9MULFlESsxtQP4wMwmzs3Bp4i4jbIPD5j6KMbEUar5uH3WB9gnsr40AZUWN5?=
 =?us-ascii?Q?qpCbegr8TZfeIIw6kULW/E3oHd2qgOXTtVp1z41wyUmpKFGxUntKtFRC4Ily?=
 =?us-ascii?Q?UgTJGJ9/ee+PbZ5+L9q48rtd++DXJQvdm/0htgBuGjFQux7z04PVt8iMQW0L?=
 =?us-ascii?Q?DK4PfHHuySMzKqPM6OqCrnZZcjGtLv+rAJlDNy6lP8PdwSHFHHPClGylEMCe?=
 =?us-ascii?Q?d/akqyqI5sS6dwGqpFVyY6k8Hx1jDambIMPL19SAKdTDzvrBdw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kMe2S/zi7Q6hfyTC9ibPZC4mXYHLZXfEKmQ/p1biHJp4UKl+FkSZvXiKoRfu?=
 =?us-ascii?Q?muG5kMCE4H8IHhDeIfs+Yw5z2dZRk/MhHm8PJ+sLlRh8GHmVDfhSfAMTCO7z?=
 =?us-ascii?Q?Jw6swg/k07wpHZWhHvfru5VuOiDcN+czZu53KhFuclEiHih3+1CziuEofxuR?=
 =?us-ascii?Q?XHTvKTYaJCDD1HFcq1Bg3hhgEIpLSnQrrkEZXJgXPRoNF+1U7nRBzZVwOFog?=
 =?us-ascii?Q?kqG8cEAkAIGD4RDnP+hCpDiCA5YRB79i609l+IBAAw2xKRFU74eOh5f3Q0zX?=
 =?us-ascii?Q?s4+k4UtGM9CXm95ImEfnKmwDJMSR9auXhIbxauVX+hM+opf9VGnmTQThB4YL?=
 =?us-ascii?Q?PH2ti4U6wvNtvPs4sSJJ5GXR+BHI+Dr+cFtMTvGxm6T5RRGtW1/jrxXd12iP?=
 =?us-ascii?Q?oTlVjIeKlWGOSF+BrcB0E02Xc7A6jeO8f44PkH1/i8dHxz+GLHz7ntRO/PLa?=
 =?us-ascii?Q?rqrB1CkcFTPKkcjOHb4uU7rBi9lkXZ9RDPL4ffN6nZdo7+gH36jh+AWazchO?=
 =?us-ascii?Q?6dnUB/FoXcxf6xSiCJSKce2fPJ0qWXDcf5v51Bb56Z8LohE+PPyZPC57VZ6C?=
 =?us-ascii?Q?I2D5oDT93Oh8JrJE+IgoNKcdPJKUAnjSHgSa/FL7ko12kb8eMjech76zUTRI?=
 =?us-ascii?Q?4qKU+FJY0t07xNxN22//iRwPWJ0w0AW8Z3nzVp4PfI2Wd65uKETANVaq+DAv?=
 =?us-ascii?Q?+TNsbQxtQ6LJKkcrwi27KulwtCxiKUCG/86m6WkDr/yvFan9APH7zaP5ysJo?=
 =?us-ascii?Q?q0vyJ7o5b1dtVv4OIQ1goCtVaFcYNivCwcRrY+2YmmSD81iTo7PmzLwAOZPz?=
 =?us-ascii?Q?6cXzg6DmVt8XTF+kxzs95euVVV0KkYGs4t59bEfBsYc63kSxM8L6GAsYaQVg?=
 =?us-ascii?Q?Hsx1Rm93BNUz/6I1DY2dW/i++eN2DswJj7kvZFvVpfA2REPdTC6Xz5QZock+?=
 =?us-ascii?Q?jKW5ZtadeZ8+rDkkc3Ym79oSMOjIHYtwApqa/PXQIkeOi1gK3m/8Xd4o3I9o?=
 =?us-ascii?Q?2RlB1Yps6GU9I0JMHDh2OqsPiL4SptAmZFOhjxMGeR0XwwqxcWYni6oO6gOK?=
 =?us-ascii?Q?gN7+w1Uvs1wsz8yBUFOs2IRa/tfs4W/aIUe/Sx+Y2jUcLV/q+L/Ksf7K5dW1?=
 =?us-ascii?Q?zVpNCY7DO96n/tKhITlt1isg63kFhvwsFv8SGVWhLtvVK5oRrHNHwnqfB4jS?=
 =?us-ascii?Q?doGG4JzGOiuf3RPwvIfAmaELFKHfPzlo+6gAzrswNDUFt/66T15eBY84LmKC?=
 =?us-ascii?Q?XDk8BGRxoCWrL3zumHzd1D0wQiQGJ4K3RhPjOXCkc1UEN7xLKYLeQQlNinYW?=
 =?us-ascii?Q?L+fuBYp3SWyGZI7/z45r1gyYmrsLRx/kHlrJIvJg3tS8akrV3swsGuJkr7nU?=
 =?us-ascii?Q?C1DO7ZqcdLnBTeYySEgHIRcM022V8cqcXsUYprCDr9S2eva5Itkcl5QktWJm?=
 =?us-ascii?Q?1pSqzWxlDtH02MLhcOTD4FE11bJlo4mx1/OLK54uzIPVJ5iaZNHPlamLP0xn?=
 =?us-ascii?Q?13h+Q611Kqry4BVhLBDihDreT9mUETZZgYx2iM8JFBsfD3MzAwAFyGWhfVvP?=
 =?us-ascii?Q?aPRKJUPgWDMqbNgA3IwW+MEFWIq5y9QdKlVur2Ai?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02f6ccb4-11e7-4cf3-43a8-08dca6c86cb6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 01:24:52.9906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UdeDujd+ahfVPkKiQqI0U+qpWtG+jpGPtuQBjAN+ert/s9B75pIhkbLnkTfEtmb+3FsUP7cPqzFXXIGnGNac4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7267
X-Proofpoint-GUID: mVRF5sUbgc3kycZzWJyFMq1Xv79-gn-0
X-Proofpoint-ORIG-GUID: mVRF5sUbgc3kycZzWJyFMq1Xv79-gn-0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-17_19,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 mlxscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2407180007
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 01:25:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111387

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libnftnl/{libnftnl_1.2.6.bb => libnftnl_1.2.7.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/libnftnl/{libnftnl_1.2.6.bb => libnftnl_1.2.7.bb} (95%)

diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.6.bb b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.7.bb
similarity index 95%
rename from meta-networking/recipes-filter/libnftnl/libnftnl_1.2.6.bb
rename to meta-networking/recipes-filter/libnftnl/libnftnl_1.2.7.bb
index 841a7267b..b46520938 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.6.bb
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.7.bb
@@ -7,7 +7,7 @@ SRC_URI = "git://git.netfilter.org/libnftnl;branch=master \
            file://0001-configure.ac-Add-serial-tests.patch \
            file://run-ptest \
            "
-SRCREV = "83dd4dc316b4189d16ead54cd30bfc89e5160cfd"
+SRCREV = "116e95aa7b6358c917de8c69f6f173874030b46b"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


