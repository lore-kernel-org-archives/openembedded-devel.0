Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.8784.1623132139470411786
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 23:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=N9Uy/OkC;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=179390addc=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15862IdR023061
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Jun 2021 23:02:19 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by mx0a-0064b401.pphosted.com with ESMTP id 391j7b8nhv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jun 2021 23:02:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RCoPFsWm/qWeUBe2tOlhIyfVzE6hRujSTC9Yrsnvh8CIG3B/QNGeJZY9diYY+ds9kqmWHOVhRGmNat8ctyloR9ttT6NO+GGetx/vGSWEIt+z85mQ52gdL1m0WKE2h0hTP5HfIu054DvV1QDP89ceb6owK4OqT0uLHqgSN9duZ5o90j+e3b63myX0dExA2UFhaySyZeJxAulo4swQZIEoYwsBlwSg3rIECBRugcwaQyTdQqkqBRA6duiXJ/TM7vR9B2kND2jOc5/4Hbpxz0ypjpc8dp2c3aZHeL27COWsHnG9D8AXJ1H+O0Q12sjOJUUqW25KkV6q/5lSyYHPQUEjCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13YJY2BulD9vcmpDulir1rO9SHuvDpiP3bsd23LSJAE=;
 b=D0uBs4H2Kzqv7pmfNGK0IuZFa02GMIGKaTEmi2QiBEBDvbvQ3yUqkwz5PyEFA1fPIGtcF1XPqtwwy6Jg2W48Y0fWp9+KZaNih1D+2UqRq/+D7YAfCZgFOqA0Jo4cUUIDvBsTG13lBOpqRx/Ge45W4JOyqpD+EVriq9gOkv6gdOkMAzGNJqUVJU+hyW0kyCyRbu6ABAnlghnmdv6cB3dC5cgrd632bHt+U1Ssa/Fu2KG8wffvGGAKYylFfpKgO2XGc4tGGYInENu6nFa6r+Gu9VehTric5BbyHEX5v19QqFDRXUaIlzlvYI/LBLn8+FE23CvAQGcGFKZIRdefyXTgPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13YJY2BulD9vcmpDulir1rO9SHuvDpiP3bsd23LSJAE=;
 b=N9Uy/OkCh091ptoLykBRqo+y03RSD12ucvqeerXjOv7CmWRyNsSG1+YJsraLUA50E1SK9kkA6z1vmW+QlucUwxCjQrwY2x1+FBYDv6FyzeOuFhXnlQbEx8RScSe6e43OhVEmMAuADXqd2cVsATq9O8Ry3VcYK9orKeRhe0RGZ2w=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW3PR11MB4698.namprd11.prod.outlook.com (2603:10b6:303:5a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Tue, 8 Jun
 2021 06:02:18 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::55fe:763e:6961:7bbf]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::55fe:763e:6961:7bbf%4]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 06:02:18 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 4/4] packagegroup-meta-networking: add dhcp-relay
Date: Tue,  8 Jun 2021 14:02:04 +0800
Message-Id: <20210608060204.38115-4-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210608060204.38115-1-yi.zhao@windriver.com>
References: <20210608060204.38115-1-yi.zhao@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: BY3PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:a03:254::35) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by BY3PR05CA0030.namprd05.prod.outlook.com (2603:10b6:a03:254::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.10 via Frontend Transport; Tue, 8 Jun 2021 06:02:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f74a980-026e-4734-a02e-08d92a42f8cc
X-MS-TrafficTypeDiagnostic: MW3PR11MB4698:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB469806590DD24C1DA3147DB2F9379@MW3PR11MB4698.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5GdWLz7wXmif+6V5A4hFM3DzMoFA9fDtJiyul6lA7VLPvK1wYcbjpvtCMmy+7UDHRf4F5oyZVvaFeWkKRf7g8PeHVCueq03oL+BBA3hE6fSCyndV5Vv1nHhEjKDbfgKY7193bAvDap8UsSLt7jSrkyw4o36ku2c86XvzjQISO5JTEnk74G/EknqNbm3Uh4haDIvq+FjI2M9kdjYTslk7wFPv8FQm7z2d5NAssGlSwvk4gOccVU8xd6ZLX1ZfVhj9Hz93LWWRr74H9j9UrHZQt079nxp81TPMNguBwda9LZlCFY9CR61LQlFQ+K0karrW1xfeBQvOHRYf4KnompojLrkqXuJ4wlkWOFq6woJCoN7g/LMcKO7ZhUFJ3D9D3O7yQqWiCKQ+ff+Z1Hy9CtV4L1SQaov1a2u9DE0y2VoQS8S/lQIKWGeFtxdxwcpFUR/7mf+zoFeaeRP/qZQSG6DdADCEcrI9dWS1mIC/+9dzj+q9vh1srvmuHif6rsD/IWfUtZ7TLgairBqs8HZ1Z46Mv7XjFtr81Yx2Hq4U8ZqsSeZcxXeQPYLWqOB2YtL9ldE35uhvSvIgCpoNo43uLn8Cq+Qc8BLw7hfo2ehR++5U0Bwa41K1yDgt/xbic1L3agvE0XudfJ5ccFTaFVYaul85q1p84NV7v3/m7/ImQJPIh8E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39850400004)(6666004)(6512007)(316002)(38350700002)(186003)(1076003)(16526019)(86362001)(38100700002)(5660300002)(66556008)(66946007)(2616005)(956004)(36756003)(8936002)(52116002)(6916009)(44832011)(8676002)(6506007)(6486002)(2906002)(26005)(478600001)(4744005)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3vva0vbE+wiTIh2dxyIo9CY4+Y4F3Q9HOHAmgm8kSPCN9eTRfasjmX07gnck?=
 =?us-ascii?Q?KdbH/pC8r7judCp7naLScCc+JbaTY7zhMeRdRd+KX8n+/fEq6SRB8+u7KRvd?=
 =?us-ascii?Q?p2L+owiTRSemyF/AfbYLJig1AMvCICj11vmtG4iotiRzCPsqtyeH6x0jtqPB?=
 =?us-ascii?Q?lp2TfFJ6G4jTwwvg+4M09BS1XGJIZVgvHhSTip+2Pd50DFAfAGYDNgEmquwo?=
 =?us-ascii?Q?fgSCUf8YzkXc3Bpy3+OqZYNpo7/msi851AM75KYNFXJKIRfqUdLx3QZlGyCu?=
 =?us-ascii?Q?XWpPA9Blwt2My0Icb5iciCjddaiRbwUD0Ak3ikRwLuFIB6Obfj4+/7QzrJp4?=
 =?us-ascii?Q?0ObQgt6P0i3Ndx+QknG0+tlBLuDb5//TbwJP/Wqmh6yzinGs84SI2ttxKp0Z?=
 =?us-ascii?Q?Gwk/bbKFQw2B9HLdYOH1tS9GX5OpTTmIi75NDocWMe84OWBaL0omS24odd7X?=
 =?us-ascii?Q?3MWZ5pvworSWAnG9CSfv5qDE8s1LGs/cPIs0a/ZnOwg6p1MNrU1H1Eva1PW2?=
 =?us-ascii?Q?pFcBOsxNCRYbjlECooVnR7sFHsNkKDeH3RHEUGR8a6Y5yNoTMUIicTUFitCu?=
 =?us-ascii?Q?rYh8o7K37KVfjphh/zpG7JzS8mIPBmeh082D6gS+VhRxv/gXVu8G5nvF6++X?=
 =?us-ascii?Q?Ka8m/kTFlOGpBUjhLRC8P8C5RMJCIH1qf4eBgJmpFra0IOzucnUumtxYPy6w?=
 =?us-ascii?Q?MhOkTokJQ0d8bqYEXvS5zWuEIsi3cVU9y9gVy3EgGVtaCn1tbA9ZuM3M8PLK?=
 =?us-ascii?Q?/bH6dgeiFneFwcJDHq8s9qx9ak3KO46GLGkXjfZDra5xTj2kWTOfVHus+eAp?=
 =?us-ascii?Q?2tXWoNDGcrWSMMAkozwaoNREWF3ocaMw60OAzDEDwH977NiUxqhOt3cEWNHO?=
 =?us-ascii?Q?c7QGyTgwLgsZ4i21csen7+DiFszg3h13/QL3fYbjAOf/2KJ5u9K5QGVh4qBg?=
 =?us-ascii?Q?bBGLq08XXYDtwVWTdkiCXwu6S7iCXwfh4FCfvvdE5S3eSMfWinYD/ubR7qYy?=
 =?us-ascii?Q?adH7XfqR5utavQ5GXIlg5mT/U0oXs1j3/YBPDhuDlJrfuqhQZyRHnJLBb+o0?=
 =?us-ascii?Q?G31I9e6oAehjC4wmEwhQoTeiZmtZroSD9grEnfSgOnEmAwN2eBOB0HsLzFCt?=
 =?us-ascii?Q?JnaAnQ8rfEbhcsmZjRthKcABPIYOBus5vN5pQ8geyk4yIQbc3rIFl7ivJjcO?=
 =?us-ascii?Q?D7MoeHEfC/z4wn0AvnRuWDAilWPZ54wDIyLr/DYoUh1v9tZ3n3v74AWGQqYn?=
 =?us-ascii?Q?lSdyPOStNnKXugxH8PvTDKcx2N4fPykkWYBUTgHqM9uv8yiR0XckAr9FcDFF?=
 =?us-ascii?Q?4+r8A0xDPspHwYqsppHtTftI?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f74a980-026e-4734-a02e-08d92a42f8cc
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 06:02:18.2821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VzAhivyQP7d421P+MQarY6VR09Zuh+rH31XloyK3y937fiT/jtsoX1z9JIX45jy05E64vMwlEeCbjddrnW+NMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4698
X-Proofpoint-GUID: PTcmTfzKXkdm1Nf5A6QFlyodn6f_TjhJ
X-Proofpoint-ORIG-GUID: PTcmTfzKXkdm1Nf5A6QFlyodn6f_TjhJ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-08_05:2021-06-04,2021-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 spamscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106080041
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-networking.bb   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
index 24b9a1b49..31f9aef48 100644
--- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
+++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
@@ -67,6 +67,7 @@ RDEPENDS_packagegroup-meta-networking-connectivity = "\
     wolfssl \
     autossh \
     bearssl \
+    dhcp-relay \
 "
 
 RDEPENDS_packagegroup-meta-networking-connectivity_remove_libc-musl = "rdist"
-- 
2.25.1

