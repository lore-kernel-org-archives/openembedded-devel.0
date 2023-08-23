Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA04EE49AF
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 01:34:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2416.1692754482652245542
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Aug 2023 18:34:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jZB+a17Z;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7599c7e7ca=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37N1Nd5K022287
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 01:34:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=TqGrchhac3xa1C/jcnU27wNsaN5/9DOnMdI0UExZijo=; b=
	jZB+a17Zl2beLDWqgtZhMfXYL+8kGADHfcoKdvlb3daErbvmF+xxBcfoWN3X0IRZ
	yMi9DQCS0+6xl8hC4a5wwmTasVdJgNq0tdT2wiJKZ1vh4VralNT/GLszt3Syfb+A
	zyK2Zmv8z4qP7AGpe92qzEY2go0g6VaAoXfqGdl4YrLgufq18EicA7PH8JTboldX
	Q8p6bYh6DGP1T5pdxukvUft/Tkpf7TBVkt8gyaDzYxbLsWIcK3oCt7u7rsIcZqWK
	uZxORy5CcJ7aQBlk1fQDrjPSUVmM0ey8lQBJjaSn9NRscryRv+UoA77I6alk1TtU
	sowgGvcvFBIV5+Z8cqYoyg==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sn21mg9sv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 01:34:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AhuDwTNcWO8KsBQiEgYXOWx9USTy6ncVnqCCzptp5O5Lu7t1BKn7Ae5GbjxunjaX/eTT4E/aiEkk4jDxeLbnDULwq+kY3Loj5Iod6c8607XcCSV4sAzYFD8QbT4lhkN2mptlealvRX98+WvC6hEz86ptcDAFgHFP3WpUWqEA1OR3pvQfRky6pHExop5yDdNy2ckz/oI/9dzD0cimzGlwXFPAbdyWJKtSnXKxE3VTn7xsYP6bwoTY6oFt7yUV3Ie217UwRW9LuS7bW1u0r912oGtbdwebgeJc0soeuVtLMs/585ttZBDjT/8R9O9sIxLebF6uaEn2SK3/qjneSEYVIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqGrchhac3xa1C/jcnU27wNsaN5/9DOnMdI0UExZijo=;
 b=kx/c57uFxUibDD24q8XxWZ7lKHCfUYmNR88dDfSP7kFmrICdPizOsJh5UD7W3uEwwppQix1+UFnYe7AUHZYU2/vzW2/kfKj07h3+qcmmRfjoJHcwAQYhOcf0VEuYYi6wNvkf6e8uMaOuAiFIKiGaUaHt81iRFWQIeMoRqjBBlE7ek8lgQkXhlE+kXaTF5pGKefhm8Hcvx4lsoEXc68ArzV7Ac30jQih9Mndy9xRUfoN5y9inaAnp6fYgTaQcWd3dd4wP5/p9gXWcZEU7MbMGOQwf8G6ZQ2EXLoENLlFkvFoN+iANKW9dItlLa9jpfo8vPcCEkwgdto5hvQ5g4MCuYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SA1PR11MB8328.namprd11.prod.outlook.com (2603:10b6:806:376::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25; Wed, 23 Aug
 2023 01:34:40 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1ba9:4bef:c1a4:306]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1ba9:4bef:c1a4:306%2]) with mapi id 15.20.6699.026; Wed, 23 Aug 2023
 01:34:39 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libyang: upgrade 2.1.55 -> 2.1.111
Date: Wed, 23 Aug 2023 09:34:24 +0800
Message-Id: <20230823013425.2252936-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230823013425.2252936-1-yi.zhao@windriver.com>
References: <20230823013425.2252936-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::9) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|SA1PR11MB8328:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aecb666-cdf6-40f3-22d7-08dba3791e38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qOQqlvX5CyqJUPCe7R/O+uhP4MONUO8sC4evyceuugD6eGriwTy5S9pWp8Hie6woG1o3o9p6TByK0PFGWK4r0bFEaBNZPOFy+oGnq1/jrDdXDx1cT02VXX5hwSgBCOqD66lxrTyk+hZu3IefOgPHbOmYZwtwi+AOBQW39H4cSF1wFbO3ljuw+jsqE/+BfY0yd0ohd3ngp6/ZV5xN2QDhk+W3l7twLL/2xahjahCHFhhYdrImHuXr+RGw7X0eHg1gcXcxQW9RDgxMzaTgsVYQTuzVdqHeEOuCLBS2JQtGRtGvY6n+hPXOyE4MCwsw2fQsaXJwzcRpwx3QBFNy/r2WzbT1jg31p0dlH3pUZ1ZaXN2N1l2EknjbBs8t4xIrt2HLELpP5JUo3C8mhjMvNW8V+MWBR9CwSq6Rj9QZuAzTIRTYObrk7N6AT7sL/tuzNsmi7pj9ea7mOiZmYPeCmMwbuSZfYLi7dsIabjVa4aaExJrqFLz4aYcrzmtrjULN+aAZqLgan5z4LKUqRnDwlvx4TWy2ptQkNNZAgD4Ci+iAMfqHR43Y1y4UTwU232zeGRQkGuGHB0K1CjUDeXuyi0sHIr89Ivu3y0GkLskp09fNDqg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39850400004)(366004)(396003)(136003)(376002)(186009)(1800799009)(451199024)(36756003)(478600001)(41300700001)(6512007)(86362001)(966005)(6506007)(66476007)(66556008)(316002)(6916009)(52116002)(66946007)(6486002)(6666004)(2616005)(5660300002)(1076003)(8936002)(8676002)(26005)(44832011)(83380400001)(38350700002)(38100700002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8qMnUcKsV9ZbD0Rr1sEoV0ByQwGIs+YD9vI0trKzLpjBSIxD3I8ntWb61P/M?=
 =?us-ascii?Q?a+SQ4PbtVLxXDCcmBlzHw9Rctchau8ogxZF0Gbx8tC9z6XusBqEHPkl+T4l6?=
 =?us-ascii?Q?WYXMBZrKu901gYmDUJtJn369ScO/M4P2rC6g6keOjcicU67XjdBKDjrvu77i?=
 =?us-ascii?Q?wbBR8kJYzb/uMjIZXOR6mvJAO/ZS1EgaCeWPYYrJIWZbI/GZkAp+4hD52dJ5?=
 =?us-ascii?Q?mGv52boNIM9d8P3+pBM3xuCUnkqhj+VLuOWXjjaUevsuHOVbO/TmCGufMwCi?=
 =?us-ascii?Q?vMJnO+5Y8bH8iT0tNOaAmtqvIHWyKpcwR+/vdbvv3ZTUrLAnk7tHirzrld3N?=
 =?us-ascii?Q?JxGh/b1O0RkM7qUTcnTLYf5wEtLyXpAZF31XwPKlPKM+/FIBkalQu2L87Gq4?=
 =?us-ascii?Q?w8oPm9oSOr8IAygwJo6QTO2u+0EX0sL71fIz97tkrsmTiOHTy4ceL6CDeOdq?=
 =?us-ascii?Q?514MfL0RaVwnUm9w8WhQtyo6QaixVm6lHFKf6dzCI4UVYtIOY9j1P3nn9HjS?=
 =?us-ascii?Q?ONDt5cr4QpQx5DhKX/KAUlhxBmur+Pp9FKkuaGbPH4klZjScIZa0MWDcoB0u?=
 =?us-ascii?Q?KZWmY/hH+83IIlc34nPQsdeZxR2GJh3osR5I8icXzPWvHZVw18LwOocZzUGW?=
 =?us-ascii?Q?0182aVZ6/8/3t01FeD4WcCM1FzstOKvGNe7GZ9Ly9SaY6uEPCTcpWxGPMG6T?=
 =?us-ascii?Q?v/zJnCtKY5j8neaBSTwuD5LYtmNfE90XWKY7dg4SaM/Y9W2+TRi8O0EL9Pvt?=
 =?us-ascii?Q?FcttS13WjfRihzWV4Ivx65ndWwAjFanoEqcXhU3XDtGuCvoQBhCCHbhTfBAL?=
 =?us-ascii?Q?c5wyuZe0YbaqnLBTxBxKPtucbP6S4OplKBdjW6LFEynX8SmCciftJP79zaHH?=
 =?us-ascii?Q?8ksAMq4iiBEo7fe7ZlzB+FcZ6R6f1ZOo+jBJuLr4DBnUq9GmUaYTnizhHCaw?=
 =?us-ascii?Q?5TD/HNf6dLPS3hdsYtE5oJ9VbDA/7aK94nMSLIPxgqrXqip2vkAXvnj/Pd0I?=
 =?us-ascii?Q?l3jzq4DER+RWspbIRjMjJNjC+67bgzMgHvbloTaVIAOckoWSFuk4wXXyMaHI?=
 =?us-ascii?Q?FSQ0A6IY/sH1mL+3AMSLBfMHO4QYXYSv1n1IOB6VCzJr/iaxCKEt/1LeduDz?=
 =?us-ascii?Q?A/286vEJN1z2aquLaXQJdBFTwZs7syCf011j6YRYkYv3wQzKjvxHPjOF45QO?=
 =?us-ascii?Q?URIg2SCJpNH1bqsi7EG7flxYCscfgS2r3mZpkAz0IE4k61HteSjCOu3Fwlni?=
 =?us-ascii?Q?cbWqyi2K+g2Z2R0nVOeLsmFdEZfpiisumGYr8/JZi2YqdtN4IQiRAZzjv+Ax?=
 =?us-ascii?Q?UXt4QECZS9Bkzzkt8gusBNSByl4mmJ/UixbK4PMQvBTdqdpFIAt3LYufnw7T?=
 =?us-ascii?Q?37Cd/RV5JfxCf5HgMcZDg2UG33OwEh5Mj0OhkJw4YlUZwanuxS3XCFGuHN4A?=
 =?us-ascii?Q?QVGo7qgove8MKLcuSFJVx6eUghn3Wjr5Q1DmkxWXnrcesuxJYqO8lpkc/o60?=
 =?us-ascii?Q?oIS1xR82HvuafpexxUNHIcvPoELisOmMTqBaUBwzyvIq2mzh29BmNOPHFVt2?=
 =?us-ascii?Q?eoO53PGyaZAwTQx5qZb6N38h1gnirjBewTgIutbp?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aecb666-cdf6-40f3-22d7-08dba3791e38
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 01:34:39.9613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: stfR0oaxQsOotfy+obZzhm8ACK4UU+r9M36nU5vZI8R6IcXAU57LZpkKAB9PoTD9lRiSa8Ezuk1mUN9qKTjVOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8328
X-Proofpoint-ORIG-GUID: AaI-QvmVApjKIFblX27XxlLfNgO_8UWi
X-Proofpoint-GUID: AaI-QvmVApjKIFblX27XxlLfNgO_8UWi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-22_22,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=662
 spamscore=0 mlxscore=0 bulkscore=0 adultscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308230013
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 01:34:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104526

Changelog:
https://github.com/CESNET/libyang/releases/tag/v2.1.111

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libyang/{libyang_2.1.55.bb => libyang_2.1.111.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libyang/{libyang_2.1.55.bb => libyang_2.1.111.bb} (96%)

diff --git a/meta-oe/recipes-extended/libyang/libyang_2.1.55.bb b/meta-oe/recipes-extended/libyang/libyang_2.1.111.bb
similarity index 96%
rename from meta-oe/recipes-extended/libyang/libyang_2.1.55.bb
rename to meta-oe/recipes-extended/libyang/libyang_2.1.111.bb
index bddf30bf6..e59235690 100644
--- a/meta-oe/recipes-extended/libyang/libyang_2.1.55.bb
+++ b/meta-oe/recipes-extended/libyang/libyang_2.1.111.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f3916d7d8d42a6508d0ea418cfff10ad"
 
-SRCREV = "9a4e5b2ce30b9696116d6e654ee55caab5aafed8"
+SRCREV = "8b0b910a2dcb7360cb5b0aaefbd1338271d50946"
 
 SRC_URI = "git://github.com/CESNET/libyang.git;branch=master;protocol=https \
            file://0001-test_context-skip-test-case-test_searchdirs.patch \
-- 
2.25.1


