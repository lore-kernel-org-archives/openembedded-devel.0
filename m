Return-Path: <li.zhou@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 155BECD4855
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 07:06:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69887.1778569553858121603
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 00:05:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=N4Dwhjcl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=959290bac4=li.zhou@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C4s4jk3001100
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 00:05:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=SYhu+Qxdg
	ThcQKx7gFd09nKXxDi7XXxwOP3Jsg86FIE=; b=N4Dwhjcld2lBM+NiAta59CcSd
	hyrjOrAWp/JrbIM8qSewTu60QXEC7J95/J/ZgFrkkT0zHVJsnXnIbVDEf/SsNnqG
	BRi8VwFNncnnRUnkiJcGjxDCw4iZYQWawYGqYWMwU/a5UyPFsANqErhiWbJZbwzJ
	zPNkLjvQYmUi1DSXSZVROzpo8bLodSHcPYZKBBgrUT5UKWqoZsqx3tXbAze/99zk
	xCvxvTwPtdwdcS7C49R7inWi5o5xHMKBZgRtqnjvYEQMqN6/IYVvAxjaMXusw+Kt
	O8hrJbeyMsaEzTXJqkXvjY7cR8oB4DViVKs/Cq/iorjuEbFl1QYZwoT4+3D5w==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010064.outbound.protection.outlook.com [52.101.56.64])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e3nv90hsy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 00:05:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dv6mP78ttJ4kXrsXJI86axzLEkbAKcYPgVtV7tjl0FML2vBn0FXxvltwHu7TDd3ZbVplTbANb62+pvmW2kIDeHJiO2HoNUpoxICsI9bjk/5uYZ59W18pk5f5/Od+Q6Edlj0LmFnSQguKjmCEW97eKesOKmZQFeoJnYGF4pOvBYOiIgrBGmUrJpNKfW03Gh5Qb7hbg5v6zDa6IQD+A4Z8zKC7IaRk0CGNmQJp5Q0R89H5Qd6UiDnUKOc4ohVGS7NcW6BLY48pKeNjerj17RziABVMGFEE62mIp34vD6TqNK0J6WbeqQ1bKcWlbTpUSnZTNDocWzNRoASE7gicineKKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SYhu+QxdgThcQKx7gFd09nKXxDi7XXxwOP3Jsg86FIE=;
 b=TxhWjl2lQbWfEiU/vSZ62WpjfaWzOskBu/INspxdVdPr9OuzCUVXFQDD15UXfbFx9UY/UwpFRpM5qppJGPVCIHXyq39g++bZFuerJ66btc3aJBZBan26JICKNMnQaOPxuIyCwJp6DCK+LYJJjzcHKs/4OLQfsV/cPWFGj/+MYsSdAW/q0JHz48q3dhDa6f4fMoy99r33VjM1L2VO3iw8ssgmWEEQ3+SzMNtaemY+nqdkAfsWoVQxzruDVJkTRE1KyYz4MSx8Oxu3MnNwGLnoTs8X4gTZVNdA/V6nwkACg2W6HR7qFd2n8lcNFJp+BGtSERt7Frq6gociBRkJ7W0PaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ2PR11MB7453.namprd11.prod.outlook.com (2603:10b6:a03:4cb::19)
 by SJ0PR11MB7703.namprd11.prod.outlook.com (2603:10b6:a03:4e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 07:05:50 +0000
Received: from SJ2PR11MB7453.namprd11.prod.outlook.com
 ([fe80::3198:3bc6:ec3e:b2ae]) by SJ2PR11MB7453.namprd11.prod.outlook.com
 ([fe80::3198:3bc6:ec3e:b2ae%5]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 07:05:49 +0000
From: Li Zhou <li.zhou@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Li Zhou <li.zhou@windriver.com>
Subject: [oe][meta-oe][PATCH] haveged: upgrade 1.9.19 -> 1.9.20
Date: Tue, 12 May 2026 15:05:27 +0800
Message-Id: <20260512070527.127409-1-li.zhou@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0082.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c6::17) To SJ2PR11MB7453.namprd11.prod.outlook.com
 (2603:10b6:a03:4cb::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7453:EE_|SJ0PR11MB7703:EE_
X-MS-Office365-Filtering-Correlation-Id: 06c2359b-65c8-49bb-41e4-08deaff4e5df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014|3023799003|11063799003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	74xvs3SRHIBdz3A85qMEFAKyHDtwzi4EOzGIbkQ659ddyMlnSNzjHncHrfuEI6ZxPza7edHW/w+bMd/GSYi38YCiDKeCJuRIAu4rgfeRjFoQeqxqU6LqZgv3QNTKOBztuTQ07SSNc/yMd5cD/gh6cQu78jGjT2FVUgK3oI/R0+XWuC7x7MrzpJwVXwLP3tGNdhbIOpAnuGaTRPP8XFiqdppAlZHqyp2k3CJIht/iNNoBOgsMwBM8+WPM9Rv6E2YcbjA5Lsj3nwWnLuUG7jWqhw0FBxQV9K5iJ/9IEvOEsbdDSs8rp57/933Wpsur08kSqv+wJOvCNuYOQDfSc2hf5q3niCK5ka80ELfaucIrG89QfHo0zEX8b3kBL15YFtnwZ0RU+x1FRLiqdk3XOlgjeLE9Bol9IwuY6tRf29AkJd4/+HuZfoJUUm0213W+rj46tTJvHuSBqsR5jjN0r8vDXX3uPZ3hNTGl04Mr5+At98MQ3sQEsF7ZqQq3Gs5ZfcbIHJCJBY1SJBR5YMej3goRS5zVC2rO1Tl86UrLgBc4bjlsFZc3kO89Q/FRLXoHaN8FKdEhly5it+tkmNKmvL7GyZMD4sMFFfuO/BKgBVa2ChMb/LTMRT2KCXdA4ILBd+tDDIqQFdTQxmXVYZOO/AJjGUYKu/EKw9/qoPHA/irHY1O/pI/5xS06hhVNqwquSDLcwjv62RcfSI9Mw9hzEJklww==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7453.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014)(3023799003)(11063799003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UJeSOfSCoAYm6aXzq9/hlGslYLkGZFtpqhVxQOyoOk+AzPtEpg3DOBwKsWuz?=
 =?us-ascii?Q?YbJ5GeS/czSYtE6M1NPfDS/AbU4O00wSqWFolpExFC87xYC6bVXQ5TcPjS33?=
 =?us-ascii?Q?fzTL5CFN8ZJ2bui2tvqr46PQkC3RfOopCJmpLvTyJox57Nc27P2fVDj1oUA/?=
 =?us-ascii?Q?yJ/M5d1xvNh8Whq06aRMYSFKAr9K7Bh2mC7E4iB7vslKsLEZLRnpO/MD3pwu?=
 =?us-ascii?Q?pXNl/P1XJ+EVXyQ5akC0frsLVcH6XShFryV8mkpjKwPzz+niQxvq3LwMpx6X?=
 =?us-ascii?Q?je8X9nszBTlyfmV4QBKbiX3fKrZ1yfWIULrNg8wEKTDHh8BWjt4pvtf6yEyB?=
 =?us-ascii?Q?coS7olMWgFZUpNC2QtaAra0bSe9tBnCyf04SchpB1dYmoSJ8fbD2A9hs4P1j?=
 =?us-ascii?Q?DTED+QQ5BtxTagmYesi2B0KlDB7lQat9WEmReC1/YlHfhQALSH8ED7jy4MCD?=
 =?us-ascii?Q?qS97mUHVKzIQQrJYzXj+ksUi4CcI2hFUea+zbhc49WeBycxLfusNK/p0VmYe?=
 =?us-ascii?Q?46pCqoS1O7OBBGtzpn3JWwPbM+oPpLr2uMjF21dCQqfqEEQYR+vQHz4KUE/u?=
 =?us-ascii?Q?Ke9P63QSVDK27s/cLGMkne/+Gwi4F9ZYebpglrg7pQwM/L00RKl0+4Can6iI?=
 =?us-ascii?Q?v3ROFvrNALoiBfVBNQJdjn1S5W9xv87ow9b2sn70T9bALTZIQKEkCS5t25Ty?=
 =?us-ascii?Q?MVRAJOaDfwgDJocmlpviNtDiliBXonDkXPeXBp0wMFj1sQMWYsBNwKbXbFxa?=
 =?us-ascii?Q?oqukG/cc4FhO0RyXKvUKR1YUvJ/JwlEDRtR0fUa7W8WtQnpbkzpKdL3yiHKM?=
 =?us-ascii?Q?1EVNJg5Cv5u6a0ihm5OM+MtGPgKhaTQgzIISpvVFgtuu8cJ56jJlnSRJrpJO?=
 =?us-ascii?Q?eHzF7aTsmDsMatq0de8iW0Dr3SN617vZeNbTXc786kpkYDR8MwZr7Hn1TKtt?=
 =?us-ascii?Q?+WFQZKAt5aevUKrvAn/yMe/XjkaBBSY3oEXLcMlUwwRF/crypbDAn05RX5KB?=
 =?us-ascii?Q?LG9+ZQ/cMw+myyiKhtccWvLAhuR13f1xc43PzDINU+PfyJCs/xZzHZyntCvq?=
 =?us-ascii?Q?qEydf55cr0HVecOeUjks4CLe9dbMdzQ26YEAqNjI6pTxo2+9xBijr5cwITc+?=
 =?us-ascii?Q?avLWpGwNZKhCyGIT0rhicuI1XNKomXdeqtuE1wDhAMNvtHPtA7ByFqH6GByF?=
 =?us-ascii?Q?xmskbhRRnfWtODduWmkddx2T0epR8jmT0Hb1SYtmt+JI0PzLzcyWgAy43Niv?=
 =?us-ascii?Q?ojFMDTIqPtETiV5ULScGRB3FnjcgheWfws3E+KOUI4/smgMgWWpXQ1KErfV0?=
 =?us-ascii?Q?lG2k8LkX2fYftZ1VeLeBkeAETLUj86JfSJetoTODeYpeMrfta9jJ3QaM/zRd?=
 =?us-ascii?Q?lpsPIkSKLlcSxeUkvRHG3eW0TwfXPMOtCEELOg0ITwdaaXMAYbLlqEQeCSM8?=
 =?us-ascii?Q?ArqKNRSWzsv7ME2xI/Yh93HkiPumb3ONK/drIpVtIg9ieD+4SRESvlvOWFIg?=
 =?us-ascii?Q?mdU/W4NupZ7KaGj9pte8FvP9VRdaF59GC4yxO9MpQ25wG3Reni4XUwyKLkna?=
 =?us-ascii?Q?p6/RrWgHs74MXyyuV+TSj402HTL9AhtB369KAli+TzB+io3mo4hGsPzzk+D1?=
 =?us-ascii?Q?T/g0qhX+z1kBZuZBmccm0sDJCGYY31IfWdQgszZYv/H7U/3pcOv8w+JztEyc?=
 =?us-ascii?Q?MUl6lVrDAejHPJYC/okND5XW/gvNsoi6Ew6OgSkKFB9PMgjPWVKe1IRxFuk3?=
 =?us-ascii?Q?nf+ejlyDoQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	Sa+nFuQkl1ZNXqKmFpJiGtTMKLcDKSg7MmvPUAjGpAv3F4MFIRi1StzWt2uRlyxIKMhi4vON2XUWzb0EyQEEZ+lkU1JGa1ykasMNY+wZBU3WkcNSZrSCk0QWdfW6SM0tB3MyTRHvmYI3+QJIPyT68o7fk1xswjUnu0VyNUu8ecE7CfU6Mhu7ddIv28CkivUf/Cj0+k/6lZ76R5HN0Q0f5d/JkCjeEiTBle3JBkERQkfXRczXQ5+p7Y2zTpdgYqx/ZBro1oAln0UVftNYEg+UXFvZow6pzrEjucF5BcKPCOAiRJO1Mmx80E3urB6OiGQv+cVBuU7P4UrKKfhEXnpVQw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c2359b-65c8-49bb-41e4-08deaff4e5df
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7453.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 07:05:49.9245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1OA3lLNGqXbt3PDTI86gs0QlOkiSMVKfhLgHOZHCPtSbdiUZBrKVyc3u8andW+epNQjurHnUKb4nbpjVsYMwzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7703
X-Proofpoint-ORIG-GUID: NTjHjNL4mKIQE2xL76GNAVYsgucxZP1v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA2OCBTYWx0ZWRfX7OTlo+LLwxUX
 OsCC34w+FvT6CYU4JXge7dPDlAP1xGwKU39Eoz5f5/rMLj1jUsvLghY2N9SRpD1udxoXZvCeUdc
 6f9KR71iVWklOVpMvK5Hd0rUzicWDTzMsEe0CcPACVZZ5o+lGHO7Wlj4nkFBM0PM0bX6KzPSyWK
 VtzVf1QGhGLnYsL8LJNW9Ul78vzsvxuK71Gr34HQi7eU+437MXhDU1DDYBX7wOUlv5bWrt7pee6
 GKiq60HM0Xic/1GNJAAU6h3jYWoN022c/fuJWd2T8U5tn1VECdgWQJb8PRIwf42vHsrthB021Xs
 opyuue2PIDQZKO5Htof4xG0LB23T937+CbTOjimIzSGpzUhyXFJ08ugDpRJ462C3xuffkk/fqDn
 6YTfNxg0/sqswlX3dmfUq6VTGvEoXxkVyAyG7DGQwtYD0T/dNV9pohmePkMRHNIJqTJIN1ePsgY
 3rcgAgoZir9lGsxoTGA==
X-Authority-Analysis: v=2.4 cv=OaWoyBTY c=1 sm=1 tr=0 ts=6a02d151 cx=c_pps
 a=tGbvjRCxuxMasaU8K2d5rg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=8nEx1NFfAAAA:20
 a=kh0PQnTzAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=X0eX-YIhSDSQ1jh3HysA:9
 a=4Y7iCZ2k6v-lWCGmfGXo:22 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: NTjHjNL4mKIQE2xL76GNAVYsgucxZP1v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120068
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 07:06:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126859

ChangeLog:
https://github.com/jirka-h/haveged/releases/tag/v1.9.20

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 .../haveged/{haveged_1.9.19.bb => haveged_1.9.20.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/haveged/{haveged_1.9.19.bb => haveged_1.9.20.bb} (94%)

diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.19.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.20.bb
similarity index 94%
rename from meta-oe/recipes-extended/haveged/haveged_1.9.19.bb
rename to meta-oe/recipes-extended/haveged/haveged_1.9.20.bb
index 69de5628c4..2ea12b3977 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.19.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.20.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://www.issihosts.com/haveged/index.html"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRCREV = "0ef7dd915ee8be4ca2bb10b5cc2bee92b8ede61d"
+SRCREV = "e2d96806273caa9ce7457e2f8669a3c40517ca27"
 SRC_URI = "git://github.com/jirka-h/haveged.git;branch=master;protocol=https \
 "
 
-- 
2.34.1


