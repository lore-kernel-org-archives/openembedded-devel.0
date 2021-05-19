Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.11640.1621431801493427336
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 May 2021 06:43:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=idLTayZa;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=077372f3ab=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14JDh45O027061;
	Wed, 19 May 2021 13:43:18 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com with ESMTP id 38muc709a1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 May 2021 13:43:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jLWDhSvmRoineRMLnHHDYbGpjZHz8U4n5/JeexirK4Lc0IOVXtMe2QMb95PXdDFaAuJcT7BdhYKlXf0WU/UfbJu0PmmhNy8jLGg0SB0jc5FqMKs/XMKnHDpWBP/eYS57w/WIY4XX1z1UKO4C3CJRjWiAO7heFWX9vGdAbMwoeM+05ixBC2uVeQx7DYNngNorxBIJFoPzOim0M7Y5C3tx+E5j8hlmYYV2fl9qpok1luN/XD3UKthdw4eWhL3nxPUFXBHph8j9iBJ6NOW7o9IiOCpBFXdhPmHAFWXlrTC4/LoaWRDb+H88/JLDwN9IzHl5lDs/jiOJvAOT3pbV+dM85A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqH2/P7gkv9S8mK9rM+pK3ergeTD3QLVLkx50sHUNTs=;
 b=kgpIDiE01qXDPqwsM0fAD14qxSWAr8amN7b9du0Ybifm/qxkyItOyVv0bFfNkXgCnzjv+h/T1COFBzrXYClX+FOba9uBeytLKzg9VbmGyo8+W+zjpZQoiP3tqAauIbe73fYaCsqQ4afgM6n/QVKLu8SupylcNuVWT+v8GY5uYdoRlDWTu5+18B6FrvQg5Y9cfcJBH+f3jXKsejQRwDRG50+/Uo8JiyDf4S+y7QOp0itnGnTMryhIraOiGU5LGEGuJ8YunPjXK1UzamtoAyG2VcGcEug7D6dILZ0tEYo2tdgce4NaIozsfrMN/rNzAyu/wAa2h63vTvKaSp6nLweKng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqH2/P7gkv9S8mK9rM+pK3ergeTD3QLVLkx50sHUNTs=;
 b=idLTayZaXCXPNmxcXEO0Eyv0XcczAKwjUoTuqBCahctiSRAG9kBRa95i6eqf3oebVdToPzeBVcHU1xYSymGHaHRdHwKyBa7843f6qTDgE/iJWs3P1wHNMePQ7KvDpD28DVek+xoP3+pZs+asc5V0x9IihJMArVIKkMhWG6IO9AM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MW3PR11MB4602.namprd11.prod.outlook.com (2603:10b6:303:52::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 19 May
 2021 13:43:16 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::fda5:ca87:9468:ad8]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::fda5:ca87:9468:ad8%7]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 13:43:16 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
Subject: [PATCH 2/2] sysdig: disable building for ppc
Date: Wed, 19 May 2021 06:43:00 -0700
Message-Id: <20210519134301.4175937-2-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519134301.4175937-1-saul.wold@windriver.com>
References: <20210519134301.4175937-1-saul.wold@windriver.com>
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MWHPR08CA0040.namprd08.prod.outlook.com
 (2603:10b6:300:c0::14) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by MWHPR08CA0040.namprd08.prod.outlook.com (2603:10b6:300:c0::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 13:43:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f4debe7-d109-4d7d-4fc7-08d91acc0db9
X-MS-TrafficTypeDiagnostic: MW3PR11MB4602:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB46022E87A96C6239C03DD971EE2B9@MW3PR11MB4602.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jx92AsDEMvfzcno+nICl+DpQAAxj/sJfds85YkI6JRpFQIX9OR8ljG9x5UlatJFCMSuEeTkI7+nDzjbfkaZwxnDoSRmqNkfUz88cdxXinRTb7bQ/GDQulEUiTnSB4J6r/r1Voc6LXDCKC83+Fqeoh4ZGk9rXPw9NL+9sEHwabxcCcaBKDeHisFRm2hf/0H2G+2hBKIiRrvwtqMXMD02XRMaNv5zoLr7r9Ck6jks7AGhxbwfNsFNSBTO0mco4tEba3gXEWaKugOxUXSLyRyUF3MzcLbXZIaUBi0r070MeneJSivHWbDuy3A6yiARB65zt/QHbZAK7KZxVNXYTHZxcgsd659Vw+41uAF7S4STsais4QNXUW7cPdRN5eXEYQ+soIID9HFEc4L45oAX1whvs9lkr8NWdu1Zow0StXnodpQShaUcGMuW+d7aaFrQe/wU6SbvgHVBqus4Luby7rna6IbnvRCFlsU9bwOeTe8N34FWrOOw6uNb+mLdwQ4Ox1PZRxOleBNi9SZXrvDbNU4MS/kcea4d+0R/ksyBFgdLXFUM2IG5Q2rLBJnWXSJuNyyNed7GGhVuR/0StJV4tzyubCCqGYBgivSnbnh335v1cZRzP3U1mVJ/Yi6KrwzHohHhY9arsQKM/p6KDtiZZkqUOIQSarEd4W/ES4U0tAld40w8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(396003)(136003)(376002)(346002)(366004)(4744005)(5660300002)(52116002)(956004)(86362001)(1076003)(38100700002)(38350700002)(6512007)(6506007)(8676002)(66946007)(8936002)(6486002)(16526019)(186003)(26005)(478600001)(2906002)(66556008)(36756003)(2616005)(66476007)(316002)(44832011)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?+4mqToJWRH/O8B11GmSDux+92un7vyS1JXdTlrN54AI5VW7yv1dTHm/iLIPx?=
 =?us-ascii?Q?9anWmFz6nhQiiLst055QYtNt9SkJobKNdM8Lzv4vqbG+jm7UISiU7ETp5nMC?=
 =?us-ascii?Q?rs0jl55f+tbAQWh//GrENFYSZjYSjjN/v8sKeoootFHi9pUun2DxXa1rkoE+?=
 =?us-ascii?Q?agomAG1R19lKC1l3MxSVjuSAjgmRXNPpg9NLeJx4T0xNfQX5MWEeomYelhv8?=
 =?us-ascii?Q?yD/pyTK/jZwmN1W8FZHipz4NE2P742ZxExVOxuDjNYNPFH0zalkUdo5Seawx?=
 =?us-ascii?Q?ICFyFoHRhJnORnObR3WrQNRfds0qeijM6J9+ude8HcNmLP4k/RTGNUphieOj?=
 =?us-ascii?Q?a6vu5LNp0Y5oEsvvvNt1K13/cYUlxZy9NRgogN621q74jUjrSowu+TmRaGJJ?=
 =?us-ascii?Q?GJVrmBHr4oT3aA62IwqErRr0urX7GjZlyJd2BD57dJPx1DYJ5M+NN8Ql9OZF?=
 =?us-ascii?Q?o9bi1JSl8jWZ8TjHz6+T4BDK1GnFNoOYfKZ0pnvehsr8SAoPQbX2mOKrgDH+?=
 =?us-ascii?Q?txvp8tiCMPCCKhF8kYfMRKHqmmsMli6zgdi346q/p1GygbT8l/iHtZUUZCCc?=
 =?us-ascii?Q?Qikc+LY4e7q2rbjRrvMyH3bmJ1HmoSDpB2hQPBc/UxkinwIJdc/RNJVihNUe?=
 =?us-ascii?Q?jXC8pcoAc+Y/tMgnzTF80S7jbJG+PppmrzzgHDoKMJYrBV545V+yOyvB8CpV?=
 =?us-ascii?Q?uMYumbB1c4XOaf5eMUcyOBdOCuQCXKrR33iQ0ZpvA0A2Fqu6znJU/y77VcJW?=
 =?us-ascii?Q?hOEnwi54SoASejU7RHgaac1HFw1GPYd/On2erYKWL+KxbtB1OTeddnTBTNOD?=
 =?us-ascii?Q?ht4kZ12J00L4npuo3XH4K636QUenhTJueyWgSOrV7j1dqdBAa0FBhwB2JVgj?=
 =?us-ascii?Q?QxW7CyGrhpllSRT1sUUheBy202bIy5bBBy8bzHeKq+NawG75x7quht7cSYUP?=
 =?us-ascii?Q?TJYquBfDtcl7PCQP39wfSKpiHR5w2GJpo+SOPjoh7kXH9Dc6XpoaY/WWJp6K?=
 =?us-ascii?Q?fLcQoAx+OXvuk18TAP6gMTXRAPfqqOUwA+zFxSsR3+vBHAVjkcvbdOhHAR8d?=
 =?us-ascii?Q?UTI8d6cJf39xo9DV34Bab/OCWIXrAjCIi7dU8UQEy/Pw97BD8iPUujo5MCvy?=
 =?us-ascii?Q?BdpaP/3i+/N+0Qh0gFW3S/z0ey/97X0QhVhLtmi6AMdwnetFu5WPk4cOchmR?=
 =?us-ascii?Q?tx8+5wX1vgnfp3ERuu0STAhYtY6/6qWhygE9eGtePeNH4y+rz/MZIuO5uhyZ?=
 =?us-ascii?Q?2JQhZWdWzBk/whF/6jd9WkxkVtJcS6Xacp9uKgzvtRE35rf+vcbThcuojeAd?=
 =?us-ascii?Q?LPPzWDNm6OItvAcBqryw6BKr?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f4debe7-d109-4d7d-4fc7-08d91acc0db9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 13:43:15.8133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8qULvwFQQ9k/qvxFmDPOkCiHPdbyFlNuNtvrBcEdvKL+bADCVBGtrIGnU2SO6c7RKUDX51FhW19NQHaVvi2zRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4602
X-Proofpoint-ORIG-GUID: 7_eNvUQ_x5xIumvHurSltL5dmnkbr2Pb
X-Proofpoint-GUID: 7_eNvUQ_x5xIumvHurSltL5dmnkbr2Pb
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-19_05:2021-05-19,2021-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 malwarescore=0 mlxlogscore=616 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105190086
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Sysdig depends on tbb which no longer builds for powerpc

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta-oe/recipes-extended/sysdig/sysdig_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/sysdig/sysdig_git.bb b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
index d9da19057..f1b77070c 100644
--- a/meta-oe/recipes-extended/sysdig/sysdig_git.bb
+++ b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
@@ -14,6 +14,7 @@ JIT_mipsarchn32 = ""
 JIT_mipsarchn64 = ""
 JIT_riscv64 = ""
 JIT_riscv32 = ""
+JIT_powerpc = ""
 
 DEPENDS += "libb64 lua${JIT} zlib c-ares grpc-native grpc curl ncurses jsoncpp tbb jq openssl elfutils protobuf protobuf-native jq-native"
 RDEPENDS_${PN} = "bash"
@@ -49,3 +50,4 @@ COMPATIBLE_HOST_libc-musl = "null"
 COMPATIBLE_HOST_mips = "null"
 COMPATIBLE_HOST_riscv64 = "null"
 COMPATIBLE_HOST_riscv32 = "null"
+COMPATIBLE_HOST_powerpc = "null"
-- 
2.25.1

