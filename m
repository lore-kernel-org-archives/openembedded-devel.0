Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD1BCC6FD1F
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 06:03:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7088.1678341825412794705
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Mar 2023 22:03:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ALnwueTT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2432b735dc=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3294RJbJ021654
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Mar 2023 06:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=fAMJKAyuDZJutkFyu6MtunhPwXmHBceKUt6UzSskYG8=;
 b=ALnwueTTL/eMzs3bjEiZFrLT8RJFDdrZIiFEwaTawnwOCMKJCWY0HQ9Z+FOHU9GHYBr+
 /iwShfGPEj3FZxBq3SW0hntlpfYnEM1cKfCT/eSjiHRtt++WzEu9vfJJo+Lwwt/P1/Ce
 qO9AQWsVu+gS5NUkLD+G2bF7dLAJeRzu/VFeoSycw4amNKHaY8egrk5COrTgT4SvGJDX
 RUvxQEQkV4GBHZRDfGXkN+G2CWovyvrrmNvQa9BeII1nEBgVMOPuO3AHeblIEhyeZ0+D
 TSJR3WWCymPeY8qWOgQXZPoPvrv1hCxVOOq0Sw2z4AuVsyzUyjInOjN2pNR8p2E438HY Mg== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p76amr48c-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 06:03:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e5V27+ms+W8/N+YKsKrzH36K5Izcdg99jyqSE9PxmDy40+ZH5w/KTFa+gsQ7g2Bfn11IfGmT7vN+Gp4iy2+s3k4ZwMiAxWIvFwq6I0elsM/Mb8O40KdpL/Uhh59fu+aMMUIpkr0pa7iVgV3OFFNiME9rgLzg9y+OYjFLrJ7NWBLIbJYMxuoMxehkL/AiriYKJ08+sHRkTaVt0gP0OrsBUg1j7rcB3xHRI6Fq34XBZxUl9+gEkzhO9NW1bs2Sanl0+WtecCbq8rybRrNGFgG/it15Pluc+qqo8XNjmYeuu0Wtnen45u/ZRTHqkNvhdvnSzdYzUsibBPHHygvgFQKUOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAMJKAyuDZJutkFyu6MtunhPwXmHBceKUt6UzSskYG8=;
 b=JuRiiZwg944wZeJzAzLgYBqEQux+3eEOH1MSqhL14iObAje4QhUz3zIC4fOA9d+J+fm1pAJXYME7QJGQYlz11EG1NI5t+OfuTxfNwlBAYP2klhvrpcNiEWUb2ClLjvOXLIyeqUCFZbFYPCUK2oURDkpEonl4nkeqC8sSwAlc6EslTHjdLGYDxk3qctlSSFlYkocf2DDAgx/mzf7mqWGJlVypxbS6JwMScFurA5AeHdINEzY4DDACYuxSTMk1O1MuvxLIsSercUYLR5DvBjV6dQWqFeE/HGmnJNS2L6L1YIIc5DQLGgZh9YCSyazeUfTE/89HnFK0mMBP4yOtSlpN7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by IA0PR11MB7863.namprd11.prod.outlook.com (2603:10b6:208:40c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Thu, 9 Mar
 2023 06:03:39 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::42a3:f515:f89b:4eb3]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::42a3:f515:f89b:4eb3%5]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 06:03:39 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] packagegroup-meta-networking: add frr
Date: Thu,  9 Mar 2023 14:03:24 +0800
Message-Id: <20230309060324.1860660-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230309060324.1860660-1-yi.zhao@windriver.com>
References: <20230309060324.1860660-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::21)
 To CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|IA0PR11MB7863:EE_
X-MS-Office365-Filtering-Correlation-Id: 5525da84-2d99-44d6-2e66-08db20640759
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RUPQ7AZmTH0+W0CmwjX4IdgVmsMyLtGfpGfeuA0lEvRN4imjJ5bpzBx78lawygFYtPjJKSX9q2xjxNaAWc2wMTNs+7Nsakx/frnLdBXJhgn2MTk2C/Nph5FCnM2AfmcThXxnZKc2HJVSZ2rVJyoANx46u1MwG21jiY7dkDsoISWjd0qdHT4CVZ83vakh2hTDC6cRZG6NNmfBDh+ZNlO7s46HU0jrYAKBBIhDXmtCKJv2CET0aRKWDM5QCgHgDEgsiN0KjtvqvbDg1ldhaxZ5+FaIhC51n8NoxBhAO/7c7Q56DVYdnfcs+xZ4KpbGC2t2IJjc/Dc9hQ6O9hE2SNq8aeL7PZTCI89V03Ikxf5oLfOFMhxI7NfHC3u+L2Ru+oOVyaVuNQxtxpyzZ0q376xL9VWdzZ+Z6BKOZXQdURCaBtJKwtrXJu6Dr6U8oXXsj+9vynV2HX9YJZBe61Mjc3fkxpQLc3sTNLl3UjEY5jQiypu/4NEuDagtgua+6sT6TfnXLtXnQ3ZDGCIcF1PcOPmLw9GBfK4gyMfTTNJY1sKMyIPP81xxbUtWV5IiDDddt1k8b4qxJBZlO7Xgp2zyexcJ2swmT7ruMuAc888JQDfVMyKpGZfozwewDe153RDEoYD0BYFl2UEfnPNNIpQoSghzoWizD8/MgVT31WkdDjBq6+V9BTBjdvgoPip5BWBk+iujTOeAYAr2rNDmE6qSgFHl+Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(366004)(39850400004)(136003)(396003)(451199018)(36756003)(6506007)(186003)(6666004)(4744005)(52116002)(2616005)(26005)(6486002)(6512007)(66946007)(8936002)(41300700001)(66476007)(86362001)(66556008)(8676002)(6916009)(2906002)(5660300002)(44832011)(478600001)(1076003)(38100700002)(38350700002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6JxghYDRf77cOTn4Whx4LcThQz2ichjPFBYzl709JyDKyx9DXhatUwHqMN9t?=
 =?us-ascii?Q?qs0FPvUFuINNtnvitArH2q4ZFIOJHXx7DuYNU/X0/FqUyWecwf0uoMOV2jTo?=
 =?us-ascii?Q?uUNCFYRKFXs+IlpsR3bprnK4/LKrQU+AFo5+EYf42eexFxkjwLW9sTBTmhHA?=
 =?us-ascii?Q?J8JYNwsK8eSmUXAFeltrEZKj0P+P0YcwfAr2uaGDeaF66JIseURes0pmyQ8N?=
 =?us-ascii?Q?e7hFoEmygSbcszwGyKgwmDSzW++jTM4MJMOLEwRer29ASRRjDhr2ALh/xP5u?=
 =?us-ascii?Q?rwM1J3jEQTePjcJSTcesOxVO9E6cuc+HV2s8LoWLu9ksOXdUYyqkshewqNae?=
 =?us-ascii?Q?1pvvQ2GeSYrR7b2xjhmJWH9+B/iN2tSHMsY+HT2k581eAO/LKRswL6mytchM?=
 =?us-ascii?Q?ertnJdLpYGo6prvSqWni1Q+q98jDTDBuzaATRaKiHeCOhCbjQswGB9iz1xFw?=
 =?us-ascii?Q?FFqqx8uSuoXqRscFB994dpu1uyDsHj4uIHzU1uikVTKvFwvjj+xJ6JCzR8KW?=
 =?us-ascii?Q?j0/CZRyXRfSE/1tZ5X/dw3AW9YPlDBXZfmFMqrmRETuMuCR4CkDaodQUxBQd?=
 =?us-ascii?Q?FkXS/uzMF6oTFlK5QubMWta7ydYS53acLAdhjtrF2JoSS8D62fyns1CSZ5Qy?=
 =?us-ascii?Q?06CoEn37uiLojSgLoAtYcnBi+uVPsm6sIYwSMwkPEinZjkTWdt4SalpNqZO0?=
 =?us-ascii?Q?ebRyFw30qz4iDImwdxOeYOWYErYXrbUQD6ljDfsaVWJfCad7QzKYQuD9f5BC?=
 =?us-ascii?Q?QGzHEy6ZkGqwa6o6SNW/4r3OyFse4b+jakiNlPWieoSnIZSqutFXlRSgs9Zr?=
 =?us-ascii?Q?iMKgD8rJW5YkcbBulGfwg3BR2CAelZG0jrKpSaxoFSP37BPelrXTrBI7vsOr?=
 =?us-ascii?Q?5ot8Y7GmGN6JkudsNn/kR2vRT4cgPegWdxbegWtusMdpLwPmxPNhGvRNmezi?=
 =?us-ascii?Q?Qp3Hfu73u08vd4vF9OsXCBqq0teOfZual99rGZrJ0nFk0lfUQLAsJnfKjdbv?=
 =?us-ascii?Q?iTJBe/qCWp0HArPQSh6YAt9K0XBsXQS0JeeXoqyTLEc7YiFd9xPP/6iJMk/r?=
 =?us-ascii?Q?zbrmTel7Aw2j63WKH3jTmuRtSTG6qVe6FMePn+QNh1QhXvrfAMdLcYVIUD1O?=
 =?us-ascii?Q?+0MRrGDD0dzAcRHt+Lj4puwt6X9Sg04y/8AtMqPJDtLqUj33+Y+WshTLiJu9?=
 =?us-ascii?Q?PMy/L5OqIbRzfhdIgGfV1zIQht6nHm7hPgTxlTueAhfGU6EqCvkl/kh/6Ypa?=
 =?us-ascii?Q?XgKxYSfevfFL+ruF1+ZrezdD5HtDoyFPjAdonxUa8siGOijrTea6TSLf8ETs?=
 =?us-ascii?Q?nYm4CDCqGqOBKLuyUb3J1T9MA/KhdlzwKc3s3n2Z5X5lbwuVrldTujdpTveq?=
 =?us-ascii?Q?GDMsx1tRONgLW8ZluYlMK+Fps3xG+n6iOwNJqkeR1FlsWVoGGzoAaH9jztr9?=
 =?us-ascii?Q?9vLudguv509QbPcGJMfcY9mDLAAbzyrZuevvRAWsDx51B/gzbwSX1fNA+9ot?=
 =?us-ascii?Q?nTcujVl8XHT3QYpBwf1JhfKoOm3c57CmGlMMJ1MCgBYGLX4noYxIUbrimFIi?=
 =?us-ascii?Q?dI9wbNqyeHRyc62TYGTZ14/Z+5b1fN++7xGX3rYE94Rs2iuEzWOsbiN/v/4P?=
 =?us-ascii?Q?SA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5525da84-2d99-44d6-2e66-08db20640759
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 06:03:39.8285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YyB/mXPFoTc+rYGLXM6pO+Lxr4RJzdk58KRyTNiD6FClf4OXL5PhXeMcM/FWsbLrLgX3hSgVkQnl8JqZnYKa7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7863
X-Proofpoint-GUID: dHWgtc3TZl3tO22gLLLmw9wYJUfq0j31
X-Proofpoint-ORIG-GUID: dHWgtc3TZl3tO22gLLLmw9wYJUfq0j31
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_02,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 mlxlogscore=906 clxscore=1015 lowpriorityscore=0 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303090047
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 06:03:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101431

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-networking.bb   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
index b681031c5..8a8dcd5ac 100644
--- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
+++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
@@ -152,6 +152,7 @@ RDEPENDS:packagegroup-meta-networking-protocols = "\
     babeld \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "dante", "", d)} \
     freediameter \
+    frr \
     net-snmp \
     openflow \
     openflow \
-- 
2.25.1


