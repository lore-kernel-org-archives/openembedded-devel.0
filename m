Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 165FFC0015E
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 09:03:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.28652.1690534991606344428
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jul 2023 02:03:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DsUHRs8k;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=657345a965=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36S6Sn03013527
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Jul 2023 02:03:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=Rd+luR35P0EnCHhd/T
	piXSp/C4RJfhZzG/Z4MJT4b3o=; b=DsUHRs8k8TR0l6LtTYxJEH8FGml1sFfaDM
	hEFrR72x5yfg7BAIE513pNl/fyzlMSG8pZDlMmZI2BVMggRSrPTKGKoAprEXoM5n
	iZJzVVNlaGwVr5O6M6qSnsBSgCTdzhwnIVQ003v7xfnODLoZUutuR2WzXyT58bk4
	yimcoSgcCWdL6HKhsYj6dQoP6UqZuS2/IItOQFqhe7BQo+1wFqsGkBN897te31Zv
	R/j31uZYj+zhmTw1kab4XQlRbDWUK8DI8HT3+b+XNnqbcJnHTzHIGqvaptUVchh7
	7vsuYCogRqP2+42G37RfQBLirHzXqXAQ1ZLYCj3cIAUsT6sw5Tfg==
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2046.outbound.protection.outlook.com [104.47.57.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s3beasgbv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Jul 2023 02:03:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AJLUfRb05Enp2CNgQWDfNOW+M3qg4Az4QEefjq292N1xiSxl9B1LcYsbmCKTMWXJweQFm6vs6nM42ozADgJdu3Gs6KlcDszdEM7OBKmsbbUtTmkCBXQ11ADYJ2MZyRfyZ7y0He1BNSxe324OoKjWmCqiEgmKDW9g96hpxJy/ROtnUJKrJxB3zIauCM6gF0zY+02c9KeykT/dHBnNJdHb/bQUXKMxGHhzpkoVCjoq4AQ7a4cPDkHw2q3gA4ZK+2yhRDhucXLQFuboLkdJaKk+/jlSHI++/vp/C3Vs3NLwH0Gk3f772KAmlko4rjKn8L5zJEuUZY44Iq8BNotrUI5mcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rd+luR35P0EnCHhd/TpiXSp/C4RJfhZzG/Z4MJT4b3o=;
 b=m4SS1wMOWH0z9qeNFUfE/9SgueNXM06XPOS7/fPQaQFrYUkpEVPmbrraxCra15bZGU2NSWZ8FEGcos9j2T3P/eVQzt+qht6QO2KfGt413m7W2wNJ5CyNrK1YAExMjsiWrRbJOqy0VR2y8W4zw5h6+uWb+PonpDvG/qF+Hf5FPV+s/y4ZsWYtVLvYaSOqwSyEeUYyUw6A5zqIM0qUP0Rjr5HOUPdVf1ZQBTf00OcYa1ZaKDFO3UfTzcP3ytATVxzNERayAQWKhQoDcmb2GbtPq/Nd9TXztgNY+QASq8gPpnFiOEsoMq9HZ1l/Jc7LvnC6/JF56U+TITK2osgRTNpiVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CH3PR11MB8188.namprd11.prod.outlook.com (2603:10b6:610:15e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.34; Fri, 28 Jul
 2023 09:03:08 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::f499:a2a9:85eb:97ac]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::f499:a2a9:85eb:97ac%3]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 09:03:07 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/3] libnfnetlink: enable native build
Date: Fri, 28 Jul 2023 17:02:53 +0800
Message-Id: <20230728090255.2577891-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0007.apcprd06.prod.outlook.com
 (2603:1096:4:186::9) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|CH3PR11MB8188:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fdda4d8-394f-4eb5-acb4-08db8f4975db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PTjDxi+GMn2UqWdqU84NBXFjIHRF3Edafe765OxZ8yuOgmiz5+fdxLtpCiL3HF+kMdjgyLIt2LzJDx+qqt+baH6OevXPDuMPcmcdfEdoJtrLF0seL/p9vr9eSNv03txBy4qHyUIZIBZd8RtrIQXdbmy2J72u1e2rd+x/VnvClDOjxe3P8Ap6URRGfk3hjYYRqzNDs4jpgXWfYfRtQPwMDmi3xRADIz8iS1IbV7ouUxZeAF/TiYBzUdEzZj/AMXmkG5QuilQzeKzXEpgAvTuM7YRl+hf/pW3LbCm+kSuiiWTag5aF3PWVMGsDWUTH7cpLnjjahi6epylQymud9I9G76cMrbP9CXZNq3IzZm6Moqmokkv+b0URuQWPAtzHJ/tGIv7Sz0AAbqnkuOWZYujIIk8oqvBGBNn5jdZaFN7oRcxfDSuNEn1WKFdSsTv+An7DllPxNOy+H7CB95yw+bEfC0Q1TNol0MfGOxJuP36fAm3rxDC0S8/hqSZtQJ3ieMPlD7XxKh7a6PUHHCtFyIOxLzYtDjAHGYlmvhAcTLMR3m7KP8Y69G9OnlnPwC8moeSKghLI5TqHYeBcmLdtX7H7iCQDGN6ZH8lSyqUzLccRyEstK0aiuhgGqrducD9zSe9d
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39850400004)(376002)(346002)(136003)(396003)(451199021)(36756003)(2906002)(86362001)(4744005)(2616005)(38350700002)(38100700002)(41300700001)(316002)(6916009)(6512007)(26005)(1076003)(8676002)(8936002)(52116002)(6486002)(478600001)(66946007)(66476007)(66556008)(6666004)(44832011)(186003)(5660300002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?23fOaJoogVH8H8xvUoZpuy+0b9Tjbble0hT4qIRfZ5YFVcAh4vY8xar52//T?=
 =?us-ascii?Q?YgboF1TqOUQ6ttZDjA8pA6JsOdym4a43EKjvSR2Zyj7zduIGG3oDblJ40Xaa?=
 =?us-ascii?Q?cznAMm07/2z4dLxK0ihVLQGAHxmEHoCGImFfcwaF4Dk0kFP45EJewRcFmvyR?=
 =?us-ascii?Q?AxXKuv6NrCXI1A5lqFcnOMZoBxkIyPJ2ZkEi3AB60fTZddKllHanJ6D+t9YN?=
 =?us-ascii?Q?jjeABYdqw+itrpexsS7IgZ1iYcFyxPjDBCchtC5jzX6C+1uq4mJ4ha0JoIGj?=
 =?us-ascii?Q?pnDd9EgzcQslVbe7Nw+EtPkDdZ8AQeY+8qCk7ToDyXQ7/Zi/MmBG2TjeALZq?=
 =?us-ascii?Q?+I4qYjp528HIND89YyDUR172rclp3TGDscALH0pKb1T1vdK57mi2Gdr5qP7y?=
 =?us-ascii?Q?27iqC0PwNR/hv8jWWO1HcKB8FT7ABOvZI9mm+zqCKwhPhxLjKkjlnezA1vZs?=
 =?us-ascii?Q?eZPZMHpMzX6Oeni9eyb9dlcsHGaky8OqLTZ3iJWHmqtIlXm+RGCn/CMUCKom?=
 =?us-ascii?Q?8Yju1ULjArVGgdbhaMAQUWbb9qsfHjdpXBJ4ZVgNyi6hHlrok1nZ04ahqI4R?=
 =?us-ascii?Q?L9fDJm2EFP8+mhimpjYzbjuPw8cobbOfezimriYGed5nqa8TotD8qeIu0D1k?=
 =?us-ascii?Q?qCx7R0fbLejcprN4yQPix95DeLXDYdpAx0hkuQBWuB2sih6gENjJjevrDV3X?=
 =?us-ascii?Q?KQxbp8QtU1qrkOyWxM1XQuEkZ6nJmxYXZAuZ0gKmIsTOYSfZmfAbzqCmOcbm?=
 =?us-ascii?Q?WvXQ+KbtCj575c4wqXnzWDe9lDOEQYxiF5N4VWKm0CjiCZ/e43h4Jg8siptY?=
 =?us-ascii?Q?fWyNOgxczBSo7k0ytfqTV1+KyIGpcArySnLUtuLCWPyCD1ndfLaMFVlr6vSg?=
 =?us-ascii?Q?vt3IYJ3BmzzyWnqTCjPinB+i67LeANX/y5GUGBzUI8TwYjKxOQE8LMXf/IHt?=
 =?us-ascii?Q?bcarCmSuQEL6pzaYqoV+Kz2pcTmfhNCmyvm26OAv2i0wbhOqN7tVpFB7kPzh?=
 =?us-ascii?Q?7F3xEkI6hvDab/bFX1GlBEq/+BOc/LvQKx7TUOyjcbtMZgPwpFva05smm1sw?=
 =?us-ascii?Q?3MZykel1axwjp+rvj7dmqrdqKWqlwna0nxYbVfpkF/jKfnzHEMCBC/6n9YTi?=
 =?us-ascii?Q?mgVyHFJgv8AnRms8OXrMMbpxAkJ8HrRdVvbEcSNoHkeGYjJNcJ5ugh6/gSrr?=
 =?us-ascii?Q?oyijqRDAPKMWAfCQyYljUlWJnVUpzTNnI1EYPQEriJjL77p6rXSn9D9+5yoY?=
 =?us-ascii?Q?IZsljEAzsFflACAftf/5ws+dIrfToWX+/0fJ/9vmndevqWuHFJIRLVqs3dVa?=
 =?us-ascii?Q?vpHAUPUyaY3/rRSLrve7zCwLvEaDNahYWyzzhBWcaiMztlZtAVAGIBJ/DPNS?=
 =?us-ascii?Q?JUaOLZ0gMhs43kmgmFHBAf3W/1SjacXuV1R3xINBvXnIwNwgBDaLd7NpU0JC?=
 =?us-ascii?Q?NlfakrPiFpV/pVY+lTXyKdcnHWfizOvTyLEJge0Qo4gGNjyMuBxh0pBbc34N?=
 =?us-ascii?Q?bRkNvbmTiBCxUrEbQcmTBY5wHSAeWqGtJfwEMNSESMLp2Kr0KBc5I0f4rv4V?=
 =?us-ascii?Q?fxcuX/TaXHDN/HXlGUVbHaXHwwbNCBhEl72mG7+R?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fdda4d8-394f-4eb5-acb4-08db8f4975db
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 09:03:07.8961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QxBG4m9dCN603/JBfliu4bV067hETUuFlESEM/kpknjC/c7l7pjQ6sdAbtruFycYE00lz+1TIkR/AzyH1vJFvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8188
X-Proofpoint-ORIG-GUID: Hnqt2kS38UztLNPzNQT9XGo3hxd3Z7yY
X-Proofpoint-GUID: Hnqt2kS38UztLNPzNQT9XGo3hxd3Z7yY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 mlxlogscore=739 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307280082
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jul 2023 09:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104067

Required by libnetfilter-queue native build.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-filter/libnfnetlink/libnfnetlink_1.0.2.bb           | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.2.bb b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.2.bb
index a43c345d5..277818561 100644
--- a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.2.bb
+++ b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.2.bb
@@ -18,3 +18,5 @@ SRC_URI[md5sum] = "39d65185e2990562c64de05a08de8771"
 SRC_URI[sha256sum] = "b064c7c3d426efb4786e60a8e6859b82ee2f2c5e49ffeea640cfe4fe33cbc376"
 
 inherit autotools pkgconfig
+
+BBCLASSEXTEND = "native"
-- 
2.25.1


