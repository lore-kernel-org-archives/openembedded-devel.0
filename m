Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.12315.1622901757277515728
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Jun 2021 07:02:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=f9orLqkr;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=179073020c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 155E1hXI027195
	for <openembedded-devel@lists.openembedded.org>; Sat, 5 Jun 2021 07:02:36 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-0064b401.pphosted.com with ESMTP id 3908sp01y0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 05 Jun 2021 07:02:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i33CnWMyjjy7AAebTnZz54vEQMlaW/9wwi4K5n+B3JKFc7ZN3P7uB/yPYs/ZjFpx32lABLtkix8/MgZcx37cVOIVtyxCRLMhIrvRD94HFLfn/cIpy4gY5Fzg0FFNb8CpOM7SboGBhx2ogbjjYEZzcQU5SaV3Xy4huSCpOfHslMYVpVjJHAybgqa0DRlErzXPp1jsFRETXmkSlBuiiHNtxS+Djlbt0YjOMq8UjQPm4fofdhyyrspkeg5XXqxQqhx/01hp8R653uWOr1Y5uOlxji/QjLBfzEBjXJNjSFc8SW6k9wwU8TBszqys52f9EMMBUpnUSCPzCyjJjXz+cv+zRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEPK+bBt+k53+pcEwmzEeOrxrr52DPWSeCbg1fFq20M=;
 b=ExoT1DVJbypSREcJ3toHvFdVn+VSTa7KJfxuVLa3QvdVlQ7PX7N1/lVFQALPtDRr06ayRXDlFvnoetDrUCHkWpyr66H3p02qg7QV2DXxaGpKGrv8VRzXgUj+/oPIxtbF+frDKiLCqz9h4dI9mFuWaOe/PeMYF5dvd9AYWE0Yzbg9Kr91Uh42d/Ui1bWGYtjCAA+1ZgfHMSLuZ3VxKWvCbE91KHk0b3hyArfVvnk8ffUx793CgeJPdMef9bFw0Qm4IWESFMePaR8dTRsETC3DlcVpi3pFAGnaYUjJODXgGt4ByMSxjwMYQwf/D6NcR0u4m8LBihbqfQMZaPvMtMP6GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEPK+bBt+k53+pcEwmzEeOrxrr52DPWSeCbg1fFq20M=;
 b=f9orLqkrypYqPNgVt3YOA+ZFbDsCFxliiP9jGRm7XwyEfMBuFGoX+C64Jjj8gLJR5dbFGfOaaeE6Dxd6uBiClF5Ruj929y3/JlMhHB0tMZGiLoIgtmwUZ6Tz1Tx9gKNgjqpknoIlgcxIhoPDl98KIjOU8ggBOa+QpKOw+Rb+zM0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1853.namprd11.prod.outlook.com (2603:10b6:300:112::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Sat, 5 Jun
 2021 13:48:30 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::55fe:763e:6961:7bbf]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::55fe:763e:6961:7bbf%4]) with mapi id 15.20.4195.029; Sat, 5 Jun 2021
 13:48:30 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/4] libparse-yapp-perl: add recipe
Date: Sat,  5 Jun 2021 21:48:15 +0800
Message-Id: <20210605134817.163302-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210605134817.163302-1-yi.zhao@windriver.com>
References: <20210605134817.163302-1-yi.zhao@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: BY5PR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::35) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by BY5PR04CA0025.namprd04.prod.outlook.com (2603:10b6:a03:1d0::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20 via Frontend Transport; Sat, 5 Jun 2021 13:48:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 182479f4-e913-4e82-224b-08d928289a46
X-MS-TrafficTypeDiagnostic: MWHPR11MB1853:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB18537ADA8ED38DA0DA9E1B29F93A9@MWHPR11MB1853.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	37BJUgqnol8vka9fQs2WCrGaGLJQc8rlxLBd886DwNi4kmwVoP7/7j+lJvc/WwCAKBmhMbUCD4dTyCMXXfEL8IKMzV+sg6RUCTEHcVws20nhVqauFGHD7GX+ragDJhn2+OOmon4F9oybQT4CN/RcAmFEGdafmPDaHxuCq8HtumSbagL6V1zWzrhCoqsUxxa6XzYp625vyV3zfb6hTmSSFrlCLJfUYto3xYbqOkkUVG/vbYhdxSOmmIk1vppXPpSdSnRW4EDla7fQR2HVWd2mRU7K8UexwnedfgsALinjagJjXVgCRtNNwO111j2uccfe+B3OYRLpRIjBoo+l+tjqD8tAvXoWT1XSpoGM3GpeUxX6oiJMMPRPjUaIahjhGdGR81ho1wtRaQc8zBNZP0QqGsJtWEbkbvMmnHvlUTX5pqlAVbaRNzTXoUGgsu+88Xn4abteUL6uf3BO5QzukGpssrfU53GwQ7jJ/ZItsJXYwWhdfwxvSDJbhV9YRpSzeEmwq0izyz5bLKMjvKt2F0giULJdqnAmrOsCm06SYkhv0t6hNrI7kM9vZ5BN5Uhe+ENAmUZ5/h7LCshlaAmL+CE0Y+6TqFopXuDL3Pa+MR0vhY0AA5pj1w+iJm/WKg8iLxEuWGghIolqMPsyZjNg4FfjM0bs9jKGstmhOFxmdvtOIV3PO4Nlrjz9XAR/L2hDQHLLsbfToDUjr11U4taXu8Uo7G6gYfV5WAW7IQpXdQQ+7OOB1HtZ9OYpk0x0pxMxRruaEM5OBA0OgV+xUY7YebOLZg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(366004)(39840400004)(186003)(16526019)(6666004)(6486002)(86362001)(8676002)(956004)(6512007)(26005)(2906002)(38350700002)(38100700002)(8936002)(316002)(2616005)(5660300002)(1076003)(66556008)(66476007)(44832011)(66946007)(16799955002)(6506007)(478600001)(36756003)(966005)(52116002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?BVXWRcc+wp3goYrOSfD1HrgjvIGNtQ9diphjzb+GC40RAoKKSoQIHTzBTnoV?=
 =?us-ascii?Q?eKCMAIK6LKJoqetpmy39QMUILM+LMDtHjlJj/wwyjuQOSZdbOkwVVqbohPff?=
 =?us-ascii?Q?MQ5PfAwxjUqUp09kJtkNhRVyohOWQybG/kd00cSfr+661bOVWXYFhq0N549L?=
 =?us-ascii?Q?+fiQdSTJPVvYbsoZvPvUHzmBH0H54frahM3V/Qj03OJ6PaJDseIodrcyogay?=
 =?us-ascii?Q?pCwY1Kndd9+OeqLUavVcC583B2J0Y0ltfuQdxpDT7APSTTnK20+fNElMUmD2?=
 =?us-ascii?Q?rxAQoalNbO8dx1suzgF9AE6u9DkilY4Tq+359YMSCwVb50IW3DFc4K0lkti/?=
 =?us-ascii?Q?cSgSwT+phtTaxi5Re3cZqffWfTYl19Jjgz20tEoY8Q6qEsQPu18hPkB/hpH3?=
 =?us-ascii?Q?fPrVh+UdmevOU5wROSvIrqvsGFtXyswvG3fsC/d3MXCCSwmrF6VHrFZ79nu6?=
 =?us-ascii?Q?BQhPt3wJp3s42iUKHkF1ky/eshTq5ZDymjCOUpXESRHZ1sIfTLc0NajAl8mF?=
 =?us-ascii?Q?8cdfuDx49YizmVAP0hZ4UB9bwZYU0S3BoA0fzSkeb+Srp4yY1bjz0qHpyQDb?=
 =?us-ascii?Q?P7Y186vZE0pbwc6HF0hPqyt+yMSVJ9VMYvcxha2VGvnNkcgAjZkUusXILE7M?=
 =?us-ascii?Q?PDmNZKgROWk5a47AveHTyEfT4kYRpFWTAdJhE05LJWRQ6N/HnKBSO2SweekL?=
 =?us-ascii?Q?GxtF4Aw9JySN0Pj7WPRxBwgQ3qP2lRFl2U3jy8XB5lob7ibXvI0/tOsMDMsg?=
 =?us-ascii?Q?UtsubtDJMZ2bAz/gkbtlSq+LIR0RE3Nihxq5DCPFze/Evxu1o3xpEAM+mbds?=
 =?us-ascii?Q?sMJkW+MDGTHZUWDoHvBV8+V7DQc1nzZAbLn2XCEha0+c1qHuMI/vIY1/L6MK?=
 =?us-ascii?Q?imLAUNAc9x9klFDny8nzxNyVFDx/qKQwEu77AmiWYEShwKkeX8zs69QJP1jK?=
 =?us-ascii?Q?/uiFhAOd56zPUzhiTbtukIMpF26YQm/+nbyNhR7jZP2TAKGslLeH40p7jDzY?=
 =?us-ascii?Q?iVo4j/rdfom3TDwpM9t5eacrvs4sLUd7bvQfJItq9lGnq04oQA7+6fQlVO13?=
 =?us-ascii?Q?TnNxE0xcI0C8AowyNwtI01LPZT9pQpbdj2y4SzDbzdiIVV6D6OBsh1axUVBB?=
 =?us-ascii?Q?w8kqvMG5Sax6fH9NcO8142ZUud8DGygGQBP9sEW7t3XX965fS+5t+0KMPMUb?=
 =?us-ascii?Q?7+oi6XDBoXkNMMdFmNiMB1Op5uByPqclSpq0vnvWbPdr3onJH5tTXyQEMh1f?=
 =?us-ascii?Q?sq5qlM7UbJOHNwnz0777/MoJBkS5hU2h0PoqYMBYaJM3bPjJWGZ3BKtooF4W?=
 =?us-ascii?Q?ozFy67xwQaPvE6ydhchbcofv?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 182479f4-e913-4e82-224b-08d928289a46
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2021 13:48:30.4474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oJJtZuYp4MjaZQ2+of6K1ryOIyci21r2PO9bfUkh2AB9h6kW4A0xnd9Tax/DSwdB6BuYuk2EI1LIT65R70ZiwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1853
X-Proofpoint-GUID: 6J0fyP85-Habzu75zU7jntsZPzesm6oX
X-Proofpoint-ORIG-GUID: 6J0fyP85-Habzu75zU7jntsZPzesm6oX
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-05_09:2021-06-04,2021-06-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 mlxscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106050101
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This package is required by samba 4.14.x:
https://wiki.samba.org/index.php/Package_Dependencies_Required_to_Build_Samba#Mandatory

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../perl/libparse-yapp-perl_1.21.bb           | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/perl/libparse-yapp-perl_1.21.bb

diff --git a/meta-oe/recipes-devtools/perl/libparse-yapp-perl_1.21.bb b/meta-oe/recipes-devtools/perl/libparse-yapp-perl_1.21.bb
new file mode 100644
index 000000000..27a7f9da7
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libparse-yapp-perl_1.21.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Perl extension for generating and using LALR parsers"
+DESCRIPTION = "Parse::Yapp (Yet Another Perl Parser compiler) is a collection \
+of modules that let you generate and use yacc like thread safe (reentrant) parsers \
+with perl object oriented interface."
+
+HOMEPAGE = "http://search.cpan.org/dist/Parse-Yapp/"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+
+LIC_FILES_CHKSUM = "file://lib/Parse/Yapp.pm;beginline=508;endline=521;md5=41a4542fcde97a600c9de0d782a90256"
+
+SRC_URI = "https://www.cpan.org/authors/id/W/WB/WBRASWELL/Parse-Yapp-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "69584d5b0f0304bb2a23cffcd982c5de"
+SRC_URI[sha256sum] = "3810e998308fba2e0f4f26043035032b027ce51ce5c8a52a8b8e340ca65f13e5"
+
+S = "${WORKDIR}/Parse-Yapp-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
2.25.1

