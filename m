Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04862C77B7F
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 08:58:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3907.1750755488392064663
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Jun 2025 01:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8270701add=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O5dPkd020719
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Jun 2025 01:58:08 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dr14tr47-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Jun 2025 01:58:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xAC5WpTdgnjjIRJjLb9CjknVNJj+gJKkgwjL0JfxMpC2j8VFOrwDOREUaP/KSamWdrljGlXcQbjycLYpdi2SiUnV7xTgeA6switfJpRVg+mnuKXFsLp3g5A8zXxa5nJpuj+bV9Ff6TOdw+YgoNPQyzAMe75po2mkg/Lpd9XmszRyXSW28gf2llaEFkYqDM2396zlaeDs8trcSM89aRz/QKeTZU6a3Jzkx6o1IMjqj5Jlvlg535HgVqlDjj49AnNNkFv6uWj72JtjVDaGekQFokzBq1pJ1LEVbqZKYCisVVKOuGQfquRWDJpdfBYF5Kt57aX9XPhuo5vXASD+vwal5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1+C2/sdC9LS/TcyNMvegBuu/WdoSXqKmirt53/XGTI=;
 b=VUlrS8rN4mhM6m0zyqWfGUFlKtSZiOLbYGcba6D/BbLIWqUn9FA5B3HNXjaLk4TlIFZ963l0NU/HFEDd6CCTmfUcJTkd8RlV1TTzSvqmO77hvdRgKPzRJrrtNUICrKArmf3g7sEndPqS2CFOvnWjiyMQyM/f2eoLnNDkiUMbCthzoArBZD4V86bWRUgWMoJH+T05P/wGZVHYPxCXOn5zULatI/hmNVc+amPTpTOQeO1bGMeYvofuvrorZSRZAZRyt9G9YqF8+te4Hfv9A3R63VOB9ulvlhDOWMhP6+tVFkbjVcGF/TfGf4cnA9+d8SKb/gw0nE6AmX0DT2ZiPndlfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM4PR11MB8129.namprd11.prod.outlook.com (2603:10b6:8:183::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Tue, 24 Jun
 2025 08:58:06 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 08:58:06 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][kirkstone][PATCH 2/3] python3-protobuf: fix RDEPENDS
Date: Tue, 24 Jun 2025 16:57:47 +0800
Message-Id: <20250624085748.3060194-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624085748.3060194-1-Qi.Chen@windriver.com>
References: <20250624085748.3060194-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0246.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::12) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DM4PR11MB8129:EE_
X-MS-Office365-Filtering-Correlation-Id: 93c53756-782f-4b3b-f7cb-08ddb2fd3bdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hnmcYaJFYHEVlwjPOI5AYtfhSHxm63n82ce2VogyWTxYWohCfjf7fBHgbf+t?=
 =?us-ascii?Q?LkS/SUptxctdHoizDUYt8oXym2WI2CaRg2GdN/GJYl2Myl+hqB8t23dX3lVl?=
 =?us-ascii?Q?Xt76HzxE6PPf9MqJgfc1FUBZu7RM79IfWmGAhyrRKzKVQBXU2xvhLOg6Sk5a?=
 =?us-ascii?Q?eFvxoj9l7FRMQ0A/Fg6CxG24txHSI+QJMaqvQoJTd0jTf9VuG7R+1cfijjq9?=
 =?us-ascii?Q?21sWoY6sRjCfQ7OEwt/aXM9XBqLpOHKInv1Bs1/X/fgA4nQc+j05RR9OTrK/?=
 =?us-ascii?Q?Ch6TdsZbmI579Xq2Jeh4H3mmZcn0/Q6vV8MiHnYYiaUGWF31b0lCotxKRgC/?=
 =?us-ascii?Q?BJfs8/lMFNjjPvt9qETLtUS0h2KZbyRJ2hyXEE8jR9PUTzg3cYk2YHlDtYgd?=
 =?us-ascii?Q?mFolvYwG5PV8tzUgmua4sab7kPJxLSrsK44E0huVQOh/RYNQijG2pZyFHELT?=
 =?us-ascii?Q?Sx+teWdUsHHuwKYegOFtEVisIY4NqQfJa9oSNdl0RcWzH56jB/6d51Q3EF31?=
 =?us-ascii?Q?n1s7qGpW2W24jFtebm13EQZg19fEHozDAVunjCXIIo93z+HIOfkYQ7MZg3Nq?=
 =?us-ascii?Q?G/rJNcMCCV6Ywh2/I1qj9W21t4vISxdWF0xO3fWrL47rg5z3GAQVdwqpMCAJ?=
 =?us-ascii?Q?R3if2lozMLb+HSLJUQ/dBgx/xxE9urWdndb9sTvhnaRJJbe69Ql1iYQYRiHg?=
 =?us-ascii?Q?/ufo7UTV9VTmhVGI8Tyhk0sXf18FDd3Zx08ZoBBYxD/6kDjtfrLco1xryLqO?=
 =?us-ascii?Q?h0IYJh+sAQQqEZrQXvxtFBPwtd6seSQrmz1eNHxPTUXI6YFBTVjzus8wU0cE?=
 =?us-ascii?Q?iRJOF+Nlmisb1EHqRCzTWVFE3BoJWbBgyBjMCE0ynANdZLKvRk06DHfeVEn9?=
 =?us-ascii?Q?v8KtH4JMdYL4EEPIUHYRXS8VPvZ6c3UCpqkOVCZvDkSTmMZh+6VICgByeFuZ?=
 =?us-ascii?Q?E569lkozHJHWl0a76KhcR4DVmpuPknv084DNMrWjCA3TuAPgFegU9r3Bu4UZ?=
 =?us-ascii?Q?pYwP9ZXawIxx6rAQuweRAWoXSLZrtol9HOczpz0Nug8j7v1D+cCajTj1VXZH?=
 =?us-ascii?Q?jAHqLYW3xECnoyeDN9J7w8q7BdIHSaxXD11QX83tbSeTHnUIOS8NHdiABn2C?=
 =?us-ascii?Q?s6wqx5gC2ZmdURd7ovSh+AaOtpDjFwgJrids7s27JOPx4hMV1MAIfjwfO/G5?=
 =?us-ascii?Q?Lzt+8gAxstLRfnciN9TqVTN35gpB3xvIvQtblUx3yPmq2ZZ4eaSmE3gYNBh3?=
 =?us-ascii?Q?wlg8hpIFnZcAm7iaHhamIVAunDB8QuRIw5mpbgmwfJ04C2GGbjw26lqkKy9n?=
 =?us-ascii?Q?REnw3pIeUCtIAIN8j12eIhWBkG/uajC3Qif1DYNfVL467wa/5abM2870toaK?=
 =?us-ascii?Q?8ot1IP4NMOgBU81PkuthrtRArXVJPeVuNMG3QDRPxsS2qIWlANWx2++DF6Gv?=
 =?us-ascii?Q?tVShjOLRrgu0mM2eBvRY1mvAJ9s9PB0r3TWY3rbxWcdr8MX9RGYJsA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?W5h+RcLOzV9tlpf4nGK2FYzQ4XFiPToirTLZxrwWj6WGGRZDiSbiM3euW/FW?=
 =?us-ascii?Q?fQLFNibcdWwU/EOSMp55CERRfTdJ8rGZ5TeV7rcUK7ucvKtCCPVxlf+y/O6x?=
 =?us-ascii?Q?GKOnsH9FzUHVh0kxcJpF+5cvw0tSndziEiVBGF9wFrkWqcouxT8P+Pl9E2rI?=
 =?us-ascii?Q?UN2MzS+F+40L1O4ckyCv1ZoOGz9SMLrYBg1fg4xGz5yhAF6PaFl1HSpz2nXa?=
 =?us-ascii?Q?FXmZsHhiqJbGwpZaaFAj0dWsscF14qvT7ngPsIRHmMF6WH9hmQyXiL/Cnc/1?=
 =?us-ascii?Q?vUi6KRlUji+9BzUV1gxwS7aJFSHGZkUr4pf6UozQUA740PVonur9MbZSJaZl?=
 =?us-ascii?Q?ibeNOcheYu8yxk+OKqWHX+DtHcUYO2V2aXQxq9JddRdcV1MF4Fs6169N+xso?=
 =?us-ascii?Q?0Ujr5uBTp6JfkoaVWmb2bFx93YbKI2MLNhhQBRuj4zg1tsNc37MygozQasuS?=
 =?us-ascii?Q?eVYUqs63LnbIeXaob4pWdyuLS5lHlh5m0cJ0PALez0vxu3HrrFj8S2TJdrbr?=
 =?us-ascii?Q?VcUBUenVjuxKt3JsDRWzKahPT31nERbN5WIYWvTA81T/c67NhNw3GrDXjuy5?=
 =?us-ascii?Q?o8B2rVPq4UGQLsfBMZwdtu9oCUSAS2nYdLbIMdcMZCA2owhtjRedQyo4do/V?=
 =?us-ascii?Q?If8HA4Jvm6ake7l1mJVsA5yH5S0F6QWQ+X4ET83Ib6Ts9wwtqb9HGQfu9uaO?=
 =?us-ascii?Q?NmsU74tzkeAJDHN831FFIp+mYLO29PISDpIMzW+XNGiI/4m1P+e6YA1fY2jq?=
 =?us-ascii?Q?OZmQF/rg3BxCKooGtMQThUs1Le2xuywKYkdb0IjcwljjqioJMBK0+ZXy6FF2?=
 =?us-ascii?Q?QvGDsIm9h/yxdeaCrnb1hggxigN6pTZeressLjiV/8XghPopTAiiSxFZlWG/?=
 =?us-ascii?Q?+AhDtgUKK3boS8Liojl6/RnzmU/nfNT+E66jtFVBlI2R2kM+JrmlZGKv0Rj+?=
 =?us-ascii?Q?Gv+NMzQNIgODbH8za0Og8hOl6ICb+AjuuzgR9KvieoalLQx8FQmlK07+tyHz?=
 =?us-ascii?Q?pbbz4QBv0xTEVCDlbmuR/zgvFhM1YqGXWER/Hjzc8tfX4d0i6e0JUGRaUms8?=
 =?us-ascii?Q?bXE8kXkOxZ0Te6t2m10Pnyzug9wacYq6+/4dpYCz0esPJp2B89nyrmY3fUAI?=
 =?us-ascii?Q?W+ri3umO3dEJYVN14SdkpzvazuTMnoFUAF7wnOXYvOici6l47tcakEd0SFmw?=
 =?us-ascii?Q?BW959dAs5fAsr7xUXXBmlblvfF6jdXum6ohjTu39DwUQAxf8DfimcFkYiKhr?=
 =?us-ascii?Q?9jFLak8F1bqXAZfNwnlS0vCAJmPceDBEqvHYFL5JAvdqse5oHvKzKkN/P/hH?=
 =?us-ascii?Q?UbdD6VqvQMxl84yR33N6EZYWMriCXkBtDgpbMy1yWrKQJu/PGlNn5nvbeDf8?=
 =?us-ascii?Q?L94xCLatRfWVWu+z2c6d79YjAkFBFygb0TEyvv+dsMxOg4/lDJ+cZEMf9mou?=
 =?us-ascii?Q?i4kzBKJUUhr3rOVJeA9O7lPPWHgrNsL8PtuPmh8ktbRdFeBzgAVsG/pdpP72?=
 =?us-ascii?Q?N3MMGVKN4lvBNq6Gzsoibg+EHI6894uAGq6s3NWqbsoHFtGKNTcwrVpIuKzI?=
 =?us-ascii?Q?baXEbGGP0k1kaU5XANxN9jEuV7nx/z9y1I+yDIlJ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93c53756-782f-4b3b-f7cb-08ddb2fd3bdc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 08:58:06.0160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RKTgfHEdOb7uUpqbL3G2TQr3g2gfrRPPf5fcMQTIMJvt6cUlBldjROALz+RBr0+lVEEM5LwiK6gzyoE+jFwNOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8129
X-Proofpoint-ORIG-GUID: _CvVceIpN9Riw9pEaA8lZ_8D3y35ptLN
X-Proofpoint-GUID: _CvVceIpN9Riw9pEaA8lZ_8D3y35ptLN
X-Authority-Analysis: v=2.4 cv=XYKJzJ55 c=1 sm=1 tr=0 ts=685a689f cx=c_pps a=9tBfwoQ6/+n2CpjoB+3+cg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=wjU5IotzqukA:10 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=pOlGuJjAsfv4BIA7ZyUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA3NiBTYWx0ZWRfX31cc8wxm3tTl +fdGOnOHfzKpuxHEJb/IkvzpYWwDUs1tmDEbg1WBCCy65yEwWcX4QyGMLHD9F8Zc7KRUSxhWQsZ 4CXxgFVgH14TMfTmImN+Bm6PjJgCPXJB8JM26+/2z/rKLR87ma3XjSY3v7BgMm4HM+MeZLt9rrY
 8utwEm3/jtCvVkVL5S4TQ8K6GS0+oQ4Mo90on5n6CQGn896T2gnzgxPDqtiRfeeXBs48TV212E9 OFK8mjQpDomd83sgkkB4BI/zq/iBcySNtb2ytQ8V3jkob7UUCLsbnWagXyJxWijdM7vlPd4jj20 cOtbXrcyHjstiBlUFjpOFDEMTtkLIpFx6RwDUOX3e6276ABWRKpF3FKjOneyAreXAM8hLTDiYCs
 +x0aiczqQ0vaRpZP26Wj58OwuoVYGZuNVY/Nk0VO+V9RtSNm+XYY4lFBqGCArV4EGU5oGhnL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 mlxlogscore=956
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506240076
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Jun 2025 08:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118100

From: Chen Qi <Qi.Chen@windriver.com>

python3-ctypes is needed as a runtime dependency.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-python/recipes-devtools/python/python3-protobuf_3.20.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.20.3.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.20.3.bb
index 76b48e1ffc..a4088a2de2 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_3.20.3.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_3.20.3.bb
@@ -18,6 +18,7 @@ UPSTREAM_CHECK_REGEX = "protobuf/(?P<pver>\d+(\.\d+)+)/"
 DEPENDS += "protobuf"
 
 RDEPENDS:${PN} += " \
+    ${PYTHON_PN}-ctypes \
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-json \
     ${PYTHON_PN}-logging \
-- 
2.34.1


