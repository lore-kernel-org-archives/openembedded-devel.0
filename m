Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.10182.1625595553897555026
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jul 2021 11:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=aZ5K6oHu;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=28214a6dd8=joe.slater@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 166IHxSF020411
	for <openembedded-devel@lists.openembedded.org>; Tue, 6 Jul 2021 18:19:13 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com with ESMTP id 39kyka90j0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jul 2021 18:19:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RbuWe9LhfRBDKjFP8orVajSpG1yjr0EZ20sPd35vQTs1TKKnr/VCHpj2g9IdZ7wMskJMbtg5UtV0SIWPLA+RC9gw59MdtZYuUojKur8+sLmDfK/MVJ6cixRMO6HHSgeWTKek1iSmUXa/exILfNbKJpNtQGSa6QOrqsJ8+bsAZWXG1YGR3CQ1Vs179rRhTI4F4lSckSbg8fD2CV+imUOC+QXlOo9881bxq+M1LVPJZ8L+b1sZ5WZ3Fn7juC4d+HLYdddKj+TVyLE3vnuyWX2A1au68ZeZpuXS1GyXf/Q9njzCyae9hHpTDtM9dxp1+KN31NNeGG90AImRxEk8/djnyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QyjP7AsZ/Q/h81APz+VgJ5clxB7ThBqpNqU9pWHhMao=;
 b=VwClrs71w8i/A8pYZ1s5jItoUmuuByg/5nU3p/XeOZT+A9rSY1+OmfVjg3kETJKIGa5ve97tT0ZCAHrHMDoiB7MSa9PNNl9HgCafFI3xFdhdDn2PWzJVDB6nYwReCsb+aVzxWqautK3m5Cxwo25U0hMTxf5goegTlxIB8Z0vdLT6vj0/LefxopjdWRbVVJ7JTv/7IiqJRAQM3nY1IjCx79nQIyoru4q2tJqqGTdBqebosDQbTSyKXYPBn4zV2JCxS8vnS0W9XhXMAsIVlOc4OX+o45I0fjGWZbreNConWelwRPiaS1oneHIZ5EcaRj+Zc0mi55TGmon7OYQUDjt/QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QyjP7AsZ/Q/h81APz+VgJ5clxB7ThBqpNqU9pWHhMao=;
 b=aZ5K6oHuDNrmj3bD6txQSJH7lxYMRrUyduBsYk4tPAn31t4SL2gYbU7hCIVB5goZK23nEGXW+BQo4JGrpCsWtxi3HzBhKMibcavitci4oKD5lRyu3xMTNGXiruafoR/N2IEBmrOgM5CtImTQBRigFoNHyMSN/IiMuIgOnnHNUeg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by SJ0PR11MB5024.namprd11.prod.outlook.com (2603:10b6:a03:2dd::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.27; Tue, 6 Jul
 2021 18:19:09 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::21e7:f902:62e6:1f04]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::21e7:f902:62e6:1f04%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 18:19:09 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: joe.slater@windriver.com, randy.macleod@windriver.com
Subject: [meta-python2][PATCH 1/1] python: use update-alternatives for python link
Date: Tue,  6 Jul 2021 11:18:49 -0700
Message-Id: <20210706181849.18345-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: BYAPR07CA0014.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::27) To BY5PR11MB3992.namprd11.prod.outlook.com
 (2603:10b6:a03:188::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by BYAPR07CA0014.namprd07.prod.outlook.com (2603:10b6:a02:bc::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend Transport; Tue, 6 Jul 2021 18:19:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90f678ee-01d4-4c20-8aa3-08d940aa8c0f
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5024:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB50244E65E5971038E73689C3881B9@SJ0PR11MB5024.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9OHKZP5a2EWqz1tMYu2Fym7lbzinjRDsDSh1A6fTtv43lqIf/K6ntcVCbldW7EsQ2qtH1LD0YyjbQrCsD2ryVzEB7OHI0iy7oXHPwXdeOLDsW2W4dLXpgi3Qd9mM69n7SD988NbaYWru1CARj5HKqpCbo4+A+c5QduBQOpFijg41W6krXZpMQHoAi3dLZsoklMWIR00pcL4H3B1PKFGuZ80nCtKpVrOTqT8CaJVXfJDyM6oXXFZm7lehkAdiYf7OCiRz5iDjaTn73PuVSFb+8FqCPPvYGZe557W7jFL+Y1T9goNvRnPM/Fw+bUowWYwH0lptFVV8VSX460+XFa+hwaW2+Eblwqv6UWiymD4P8T1YoZyiAMaENU5NTLNVMRmpQPJVzf/i7vIyEGX6NPCfvs5gzn/+iWyRGG5Fs756qCPtjvnpW/k4Vkb7az46IVDAJnZD6+eWTtgR7y+TeZW79wQc+o8A2a4N9AGr1ySZEXm4T4/NK8/EDSCRCca9EnqM0mbhh1YlMvySsPa2gMS8ivXZ2fJq+7e1NUWLiiU+hLXmounNiva3FykX8knHpswX5J5mR44tXIw/pOLorZfhAkh61yjkR051EUdtjVrb8UQ0CURm/FQSAhK/7SkQMSZ5kMc1Q1W+oBEW7FUcBX3KRNg+yfqZbGOm/Ss9tjAknhrSBok5cuHxoY8U29M9U0o93pz1KYXil8X7L95gUyPrtA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(366004)(39850400004)(376002)(1076003)(6666004)(2906002)(186003)(8676002)(6916009)(8936002)(66476007)(66556008)(6486002)(38350700002)(83380400001)(26005)(66946007)(107886003)(6512007)(15650500001)(38100700002)(956004)(44832011)(6506007)(2616005)(4326008)(86362001)(316002)(36756003)(52116002)(478600001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jL+d0WYMVsY+/ntmmcTi5RaV7kSblUEaTlgAtkeIINehB08uWLfxee7bMzo8?=
 =?us-ascii?Q?6a1OeMVUAa3g1U43XtQpckYNJGA6WctbdKQVpq8cpb9CX6Q4oP0rrokruAYW?=
 =?us-ascii?Q?S/auVyQ9/wHlbgI34/uoLIU6xBcZZ9I822w1LmjdYcAP5n/QcChmAmEU2qZl?=
 =?us-ascii?Q?X7hLzCVRK7JxS6/TRcWU4UsiSvwoIHQrSWmsF2PXq+cWttiRBk8WAFRZMYhA?=
 =?us-ascii?Q?/A0ldU11XUrlSE+EYwPT19qh3RHcmB/eH2xcSU8UjdpziRXQY8Mg7slwFq3P?=
 =?us-ascii?Q?RAdXypej/OA6eIUGw4NYl70sbWx4WiB/Rx0SnfqxKvSn7Hje3aSB6gM29Ep6?=
 =?us-ascii?Q?kY5XLYWOavrKaYgMg9Fm0QBUwrdhkCkZ1DP+7gON3xvW0Q/CGDTM43B7EPZ5?=
 =?us-ascii?Q?DHTWQifEfxhQeUqqSZYCXXaTCxcu7UXd43762/nbxpIDtWL76dtEy3xw7SnM?=
 =?us-ascii?Q?YcF4sDmrzSQ8kpJax2kannkLFoMPrKlc7hAVui9t3yWMye5dxutjH0tm+UGS?=
 =?us-ascii?Q?0m3wE6rKL54BcpFiwNVRwkrykMlIIDOR87KNOhyvLI9uWcHY4IfuCh5ARJgd?=
 =?us-ascii?Q?zkL2CkIqslwSfYgTurfYU7Po/ZTz9eeMiazOazAXmOBwoh/qU9WSsk2QuGl3?=
 =?us-ascii?Q?kBJsUjTffstRcoUD0SvI1KOFH1DniRXoW8bKMWNspm2QTM/LSgJpOKTab1Nw?=
 =?us-ascii?Q?P9GS3Z1Ura7oyC2szNqxOQ+9abfNa9BMI4/XBzkAgg5jKBVH1zL6nybl036C?=
 =?us-ascii?Q?EHANPCEYyWSJyt8Qyeck5U5VUC65c43AfAmCcerNXWJqjvcjA4KhLwDp9ADr?=
 =?us-ascii?Q?5HTZqPYna2S9tUMV0V7iwJaes4n1W3aLkhaFH7RdHH3eCmCZ3G9gyRvSsgFD?=
 =?us-ascii?Q?ezGsxcg6kv2F+2yB+ak6FSx9BcAaX4vM4onNwIj+Zdbx5+IANTjZnS8nhZJq?=
 =?us-ascii?Q?mRFcGSFWIpyucWVegVUVEadNF37gmp1jbYEPPJ44YnjuOSBtf/2vdJg4YSOc?=
 =?us-ascii?Q?SDc5xHaQcfiz0gGhntPFW/1gwl3Q1L9umnfNya3PSniFaSdx8f0yS+akC4TV?=
 =?us-ascii?Q?uQNrnTLBGNmwOgBu8EzmLidBQTvMf+04K4Va3Wjo0jr8sRQmTT3CFojbz5hx?=
 =?us-ascii?Q?A42OZF7so3gqjQ6WeB3rqJvSi4X8iZF8o65VCU696Q3ypvCFA3hpyg90ywzz?=
 =?us-ascii?Q?6gP785QrZ6fYqfKX8dh2adAskq1dT/fNgYm5AK/KorGCO7stkmXJBrvIycMF?=
 =?us-ascii?Q?4ergmwYZE3B5U51w7rAqqlBHsfrAgPwshm8SDqdjt+i5jepk20pPq8Lh+8K8?=
 =?us-ascii?Q?5vVE70xBoYdbvtHhw9xobgsh?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90f678ee-01d4-4c20-8aa3-08d940aa8c0f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 18:19:09.0481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O+7RWyzqa2rmgBoxoqN6EtejaQVvZDU32/asiA2AF+ihu79OEdUI8WKPr2y6BZb1fZteP/adNsJLS7ZO1QhgHVsR6nbEBV9YV5RG3pllcQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5024
X-Proofpoint-GUID: 54KPIS39uKUXMVmpl9Opzyec0z5wpJ9j
X-Proofpoint-ORIG-GUID: 54KPIS39uKUXMVmpl9Opzyec0z5wpJ9j
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-06_10:2021-07-06,2021-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=665
 suspectscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1011 spamscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107060086
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Make the link of python to python2.7 an alternative.  This
allows python3 to provide a link if we are not around, but
makes our link override any python3 provides, assuming he
uses the default priority.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 recipes-devtools/python/python_2.7.18.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/recipes-devtools/python/python_2.7.18.bb b/recipes-devtools/python/python_2.7.18.bb
index 7350562..3faf154 100644
--- a/recipes-devtools/python/python_2.7.18.bb
+++ b/recipes-devtools/python/python_2.7.18.bb
@@ -34,7 +34,14 @@ SRC_URI += " \
 
 S = "${WORKDIR}/Python-${PV}"
 
-inherit autotools multilib_header python-dir pythonnative ptest
+inherit autotools multilib_header python-dir pythonnative ptest update-alternatives
+
+# Make 'python' an alternative so that if python3 also provides it, we will be the default.
+#
+ALTERNATIVE_${PN}-core = "python"
+ALTERNATIVE_LINK_NAME[python] = "${bindir}/python"
+ALTERNATIVE_TARGET[python] = "${bindir}/python${PYTHON_MAJMIN}"
+ALTERNATIVE_PRIORITY[python] = "50"
 
 EXTRA_OECONF += "--with-system-ffi"
 
-- 
2.29.2

