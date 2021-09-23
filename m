Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.931.1632379052270035037
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 23:37:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ewdzKK83;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4900cdd5b4=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18N6R7fM030850
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Sep 2021 06:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=zJhI8uksfz1fGHKu+7Lgar9X1fPU19GbIqisRDRRFHw=;
 b=ewdzKK83lKNOWmvpcSjOCdLbVfzv4WAtfT2qADFDGlk8HAfGonifJ1WCXxKUXlAhNO5T
 5tQuqH4huz9rPyiUQEbwOVv+6YKYCe/VN3immXzrXY3Ut5Fo/xOhu2PxUP50uw7oELYC
 HRfV69v9WsUnND/Y0+0omlky8dOJGidAo6LuFcshDV3PqapHtKa7EE0XvlUtPLmLDxgo
 ANVkBtAnOrkTtlWJQ+qnIyEXXL8eVdiVLrfX5pBmU/pCaV+s3po8z4d0ZvD6IEPQGtBm
 iBxyvHBhieoA4sOIoh139J0PrwUrq/XT+dCWEt+7Fx5C+YFFe53I9jYt+gIEiMQKSc6e 3w== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by mx0a-0064b401.pphosted.com with ESMTP id 3b8k3mg1hk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Sep 2021 06:37:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Us2BkN5zUUknKqDImQPBWvSG1uYtAUyt3BM+g46dzAFKRBKhwKOrl00irIRLCxz5CnWpv99Y4Tfbf1Sh8QgDxET/002/jV/RkrL0JI0szPXZqDGfnWc2Bc2lzuQ5USAKwNYaaPGlhwLbYShEPQCS13Jf/9kHx/XcHKdkZqfRH4Kqa7i4MblWwCPLz6myL9zQoF2s2kcxscTonjlC6pDCpU6aZyO6tCcCmLYKNGXWQfF3MYUh7LgUSSfaEbRRIq8wzztcJHwi24rGFzBOlbDpYcLcw+XCGDDyclyfCPKZHCEJw2bT151Pin7k23ZItsqQX5y/gh1ibKSA/blb7/6H0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=zJhI8uksfz1fGHKu+7Lgar9X1fPU19GbIqisRDRRFHw=;
 b=VRgPpmvTGSpu4+TfwxDOe/btZed1ek2+sZm7hvMiVljxednZR1R8TEuZMytlOad434jtKR6uiAyRnK9Qy2+5L5GNfeW4JUgn8bxuhswJO/Vmy5i4/94H4xgZ044xHMHCwPQsw8HcejkbDADQz60PqJGjsNKmGoMTPPV89slbSwc5IXGkC+0AtnP0YdyUU5uDCX2AasADNzw87UzeYbNbd8QiOaIvseuMmirxEyhThhS/A1mW9XM3pP+GNKwT+rOjIZnC2TNSD7hQToVzo6s9ZCqezQqDWme5u3tXdiof877oJMth6MXTNmsa09WaLm/GiQgJymVYkjJLhk662L6a+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB4898.namprd11.prod.outlook.com (2603:10b6:303:92::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 06:37:29 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3975:1563:a18e:2017]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3975:1563:a18e:2017%9]) with mapi id 15.20.4544.013; Thu, 23 Sep 2021
 06:37:29 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] net-snmp: remove perllocal.pod when enable packageconfig[perl]
Date: Thu, 23 Sep 2021 14:37:18 +0800
Message-Id: <20210923063718.282192-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: HK2PR0401CA0004.apcprd04.prod.outlook.com
 (2603:1096:202:2::14) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR0401CA0004.apcprd04.prod.outlook.com (2603:1096:202:2::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 06:37:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 223f4df6-5572-45c9-4f48-08d97e5c9d7f
X-MS-TrafficTypeDiagnostic: CO1PR11MB4898:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB489836E59C2BB0650D0FC4CEF9A39@CO1PR11MB4898.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:619;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	T2gba27DbsEi/0RcH+Z3MUfrJD1ziPb0UY6TcOKmIy983DY6sY5CduUQpalJMhwhCx8YDy4hz/IWK5m/nPIQ/Rag4KYkgyOI+lRC9q/to7XJM/GRWI91IBKZaI9y4nF1y/gGWngg2V/t9cTpBxHIPFThKxBu5Ixn0FTTfs2gkAoD4lMyg/qH1P2dwQjnszI99zn/V8o9XXcWJjLjSD47cJyrMkO9hgby4qSiv58ghIbUzKn3UFVLdlaLq3/c6hC6DGmmFEgn73ErWhw8zasQD+jBb9+6t1xqcZdt75w05yit4KZUexh8YFt6pFM2SnUOL39PCIZzX8F4a56BqA77ssBepOSoUqIfQpsuzFe6+gphG3Q1Zvop4JxG9fsWsebvVcGdtW1B/y6fWYpTK2DcTW9EQtJpu5a0vmyPZAXa4T83hAQfjr667q6Oe95s/LmCmbdMBatj4heLVXbtQAzNsxPwtgQ6lRukz7Tx+iS76kLNfzA5X9FtzHfcFZ9WMSUzUXMdOP4h/tM8BJJiBSip0HEZvKn647iOxHavqTNRQHRK0jKVILjXV284o+wph/BB2e1bbAcEjkeLgYD1Y7TlVSkJLtdeKmNlzdIEUNbTS8FhcX/3tj4npLTq8bmyPrbnx0NiwyoYp6eOV6dQ9EmC9mM4heSw28AIeu3GdBaJhW64shi7tpcLU5e8+B3p/3fnf3ADzPPR1v1BmY8dKamOAw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(2906002)(316002)(44832011)(5660300002)(66476007)(508600001)(66946007)(66556008)(8676002)(6506007)(38350700002)(38100700002)(6916009)(956004)(6512007)(1076003)(36756003)(186003)(8936002)(52116002)(86362001)(4744005)(6666004)(6486002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WedL3fzcEQQX2plq5TD3zGxqW8tQ9n06mYZzDMJgfrwCq6uFC83+aViN8eaV?=
 =?us-ascii?Q?LjaDjXiJdr9U4bJNFXBvyDUSc+ndTjMVlt1m9Y0Fe15UscHzRN92gXf5hHtI?=
 =?us-ascii?Q?RlXyCVdhqFbZUykP5GN/xPoG/vwqYtOmA8nuRwGsZpDn/5I5HqamsQEWnpJ2?=
 =?us-ascii?Q?6IFcntaqNQytP2M3WiMQg/FiWybU3DNi35bXEFG1chhKa0lqoVWtN3BzcUDy?=
 =?us-ascii?Q?NxUBIdRK3dBz82FFVjkGPRaFkoVLh/bGT4fJSBtg14HcNSiPf3HKXjmmlGwx?=
 =?us-ascii?Q?CG3jwM1kLHJYKAqQ/rTSIbMdNZx0OIC6dGmgvy01f2zg8vI3emLfnmsOs/o9?=
 =?us-ascii?Q?GzXaZ9Pd6HV8iRew5QgI8/Vx0PDgZ9ImCeDdCL9WJRZPi/ipeDH4wN3tqMQJ?=
 =?us-ascii?Q?2K4R68c0RVwYliKqNB58fY8KnlrILjd5P8LuZRlImj6BGjsp1FRwu8wj7oZD?=
 =?us-ascii?Q?vGwZfrfgpR8VXrH8MfiRieFbgIpr23uqzsJ9C7Ra9olAHLqwnNkhvQEYOE4J?=
 =?us-ascii?Q?i9Yi8EK8sIZWWE71Ljlvx119hv+f6m+83/9+3sjKE5+3Mwva0bjckyBc8aYT?=
 =?us-ascii?Q?QHzDdmfcrFezrAVv5K6Dft3I7tA373KDXxhV6FbydJhxigvkbPUnVMCFipo9?=
 =?us-ascii?Q?46eDx5ODqHrvyaAe/LjoPL6JopXjEyf583W0BIiuJpy06RJmLEGDU6n7nGNi?=
 =?us-ascii?Q?GtVzFhlcoHXGdP8p7IwSWQWSBZvDQs6z+OrMNs2apczvzS9RngsdNSIYE1Jz?=
 =?us-ascii?Q?cZTFpbEcx/Fyr1is5rrQmPmJa7mShGEAy+24djTsCg8S5ggVT8v7BPWd12mE?=
 =?us-ascii?Q?M4y6RITykvexErYoJWGOVWDvFzn2mxND7Wu7PAgvmsjy+2S4Q59UcYlgwzED?=
 =?us-ascii?Q?IVNAIfk91gqByaW8lEvjfGdxWBFOACBZgw4PcNqL0hqW2nuMxps95p92rVht?=
 =?us-ascii?Q?bCKMUQ3xhO8/wN+gtPLfWXHHo/mB4ldQvG7OJCTxYOIWdu8x/GtlPVgNNj/w?=
 =?us-ascii?Q?yXGg1lMEYCOLOkRHxb6EPq9mCjgh7z880eFRlOzM4l+71KGJQK14AN8lK3UU?=
 =?us-ascii?Q?+AkHTciqe1Mg/XHhlHQ9cNa3X7BCTT7nF8XO1scBvtl0f7vjgmL8fDrm6Zbm?=
 =?us-ascii?Q?8lkOkRyMIl3E6oVB1dmXHcXFj7TP8JH5nDY0g6RW3FYUsUjCYADF6O+AAj+z?=
 =?us-ascii?Q?lX2BG8eIWXaNIRkJEi/GOwDlH8PszVnGEFEg6tNA46N4xiWmpwzIcfGTn8CO?=
 =?us-ascii?Q?zYDSSb7oita0TO1pdmPO+d5PDTxo3DsGhhy/uObfPgJPPDa36GCoqlEQi4cc?=
 =?us-ascii?Q?/74wz1P+igq+3DGpSo6aZGTh?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 223f4df6-5572-45c9-4f48-08d97e5c9d7f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 06:37:29.7109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sn4UlP6ACmCJ0aaVMzuZv34uNDHifVeW5vhJQquXSeSXwlvOBwbdSzueQ+7fddqjY28/O9uQMNihT4v4h8c0kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4898
X-Proofpoint-GUID: RMARl4GW6QC8d2xcj_FWG4TNy73DEPUJ
X-Proofpoint-ORIG-GUID: RMARl4GW6QC8d2xcj_FWG4TNy73DEPUJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-23_02,2021-09-22_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 impostorscore=0 clxscore=1015 mlxlogscore=809 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109200000 definitions=main-2109230039
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Fixes:
ERROR: net-snmp-5.9.1-r0 do_package_qa: QA Issue: net-snmp-perl-modules contains perllocal.pod
(/usr/lib/perl5/5.34.0/x86_64-linux/perllocal.pod), should not be installed [perllocalpod]
ERROR: net-snmp-5.9.1-r0 do_package_qa: QA run found fatal errors.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
index e6ea2ddae..e5a28de40 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
@@ -151,6 +151,10 @@ do_install:append() {
         -i ${D}${bindir}/net-snmp-config
 
     oe_multilib_header net-snmp/net-snmp-config.h
+
+    if [ "${HAS_PERL}" = "1" ]; then
+        find ${D}${libdir}/ -type f -name "perllocal.pod" | xargs rm -f
+    fi
 }
 
 do_install_ptest() {
-- 
2.25.1

