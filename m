Return-Path: <mike.petersen@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C18C00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 17:32:40 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web10.767.1659115956157936010
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 10:32:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=l1ibI01j;
 spf=pass (domain: ni.com, ip: 148.163.156.75,
 mailfrom: prvs=5209489cf0=mike.petersen@ni.com)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26TF0kVC022009
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 12:32:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=from : to : subject :
 date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS11062020;
 bh=aqGMhm5fIhaTKEOQk/HD5UBcjImbR/i28ucf5AfCN/c=;
 b=l1ibI01jRX4Ee8qx9NhcnRk8st4dukyqlizzE4YGdQpqsUfYYpyfqFKt1rSak38faB17
 FMI8pdplBy7qzsheF7oeYEXYiJhOVMCu6dzahaoxWbPU+chuRd+DTmDcEGm/UfQSersT
 afs2bnGE7Oj8Nf0J6XG0uja3BWQGz6+BadxDJplLsmjAdAAnW1FNnsJcAPSQBhtJQVJB
 WyQbg6DzuTg3GhqYV8k0q36idG4oF4QbBg2NSOo4brLZ4Hva9iR7MTgHhmRfgypUwVz4
 A849f4aQlBNhYLtzoZ386sS0D134NDHdPDmeIGp11sgHAFSw7CmCk75aH9vi1+vz6CDN zQ==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	by mx0a-00010702.pphosted.com (PPS) with ESMTPS id 3hgegud0j6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 12:32:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/0lJg0BuHCm8ywij8eJJ0F/v83k2ps8VsyjAgvPOo/FOOUUS5LRWwP9aMz/QmSxVY3jZJ46ptn5NIs9RHoTl4+bLGokC7srbRuW9E3if2DBj56k/gdEO1amTjQQg91zc26J2iMB8LZIR7JT3qaJmmAu/eRPbDSMMPXki6Bz60bfNh4DRrWcTaijcv3a/lij6tPNa8LPrRyAeS3AoUMNM3MK1BRYkiWGZ1ilnHZTvh5pCQ8NdXjUHdJFrKd1jsWX3mTowYfHUk9uqYIKfdCbZ3Wuu5QPSHF70hdQDjzrUhnL6eyLtpiHl1zQ4bDo9t6ep4pIsGwE34eYYB5d8YfIUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqGMhm5fIhaTKEOQk/HD5UBcjImbR/i28ucf5AfCN/c=;
 b=BuC+LhJKDW819rqQS7Og40KjMOOpZVEpSleVdlG8J28xeLae2RbfChzqGhBTWLEJV+OE50pGV959SShCUJ0vdYWrY+vNOVq3giRGBp1X7KBDOXXyAa72vHxVyxuNlsbYSn2m5Olg+NPLu0+Bu7x8zorknoWyDE7RdVPJ/plWIwghhhMD3c15WZcbcsdV2Q4NbXITjk1dPR0cLD2ACJ/yf943P1ljQAB+5KkGF+C4qFCMZpB/0FsNLLk8jz8Ygknn8n/g3HB2OxrmaftWb6R6JY0yle6kd0TBtTEoCk06CrFeP+JwKae48hqyaFuxKVhR72rWVH8B/WqwYZvaHXqASA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqGMhm5fIhaTKEOQk/HD5UBcjImbR/i28ucf5AfCN/c=;
 b=aXc+QUZMedgDwjo6ZlCPHI7BBPwoCxIIJewVEeMHcU1D//VLbqatlNBhSt217UxUbVug+RlsJO7a2vPoG6StTVd5D62HCIh836N3SFNmMnJZ/BNBwhMC+dKpsBgksj/g7Kl9pQoYLPsQWg0a9IygYPMYek1FU7Gj23IK0hhMIN8=
Received: from DM6PR04MB5420.namprd04.prod.outlook.com (2603:10b6:5:105::30)
 by MWHPR04MB0366.namprd04.prod.outlook.com (2603:10b6:300:7c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Fri, 29 Jul
 2022 17:32:32 +0000
Received: from DM6PR04MB5420.namprd04.prod.outlook.com
 ([fe80::fda0:b935:cbdd:4d93]) by DM6PR04MB5420.namprd04.prod.outlook.com
 ([fe80::fda0:b935:cbdd:4d93%3]) with mapi id 15.20.5458.024; Fri, 29 Jul 2022
 17:32:32 +0000
From: Mike Petersen <mike.petersen@ni.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH v3] sshpass: add recipe
Date: Fri, 29 Jul 2022 12:32:08 -0500
Message-Id: <20220729173209.69103-1-mike.petersen@ni.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN6PR04CA0080.namprd04.prod.outlook.com
 (2603:10b6:805:f2::21) To DM6PR04MB5420.namprd04.prod.outlook.com
 (2603:10b6:5:105::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0c36c33-cadc-4169-fdb0-08da71885172
X-MS-TrafficTypeDiagnostic: MWHPR04MB0366:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	071LDO9TE6V0BApxnqjC0Gfc1FcRwVCpK+06LXpKOo4VYcS8mIqEhnU4inySBH7/hVeJD1AQlD2kAsnWCSLsbRIKLvc7jPRZ6zu57C9zRAxKs3ruhgAD/j6OF9jw4yXOGTi3EZ/M0a/zaNV4wpTDJJVayY/yWh4i/sOKw4m8BcVPBGpsBhEP19hOBA76kDW5ZOjBTltomd0IcSyii0WiwgNzMBy35r8iUQka+uvV2dvNeKsrZckD1WG61Yt5j2DghfPO8o6kITsLLxKfayH+Ofk0wfXlZGGHhhOmJV4KkIr2W8yP3PYxSlV9vvGpPi/xLcWk5j8b91+iiuWe49GyHdOqJyX4XLIqemKaVcfem67VaV3YVDLm9p68omValp1uNqSTIYw56U/u4f4whJLWnKJbdxi0v5XNF3VXqIyWjiRbDh3wacy01qZLY3xQrY8I6B6KunwDrKmprmYu2bpRQtOQNaS18jYIASeV80Np/UCnSFBvN9Wy+MmAhStidXSzi2rdwU/COqsRX5t7uF25XpzAwmSr1jOWqTx/qd6djj6wU2rFdVrgMjx+PgMUTnkMWzeqMuq0keYF+RdolO3uUtw+vO2d3Nv4TpNOeaPHy8K7QBU8vsAfgJw2SzQCoDWUil37cqn1CqiLK61390YbuSlUJqZvkztu7kLdwQCQhBeRNGBT9jtei17WPOHCELO3rzA+GiG1Nno32Bjd11t7sr+G2MZVIJDyfXxCpeA4kE0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB5420.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(396003)(39860400002)(366004)(136003)(86362001)(558084003)(38100700002)(478600001)(66946007)(5660300002)(66556008)(8676002)(66476007)(8936002)(6486002)(316002)(6666004)(6916009)(2616005)(1076003)(186003)(2906002)(41300700001)(36756003)(26005)(6512007)(6506007)(44832011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5/EPhPN8DwGZua0FUYDNXm13rGa52g3TP7EZR6ucLOkxCoEsPWl1R0YYCOtx?=
 =?us-ascii?Q?O2vCDuZMHl6G/I6iGeXq6DmVYydgPAp5/beJ4vX07yA5/vPnXKK6N0z+/KMT?=
 =?us-ascii?Q?ZGBkFEg6/1g57b9DR8jXBdwsi9E9e6imFW2OUNGlufnUQbXqTKwyI4TSqXx0?=
 =?us-ascii?Q?ibXiBq6a+2ypuoHdXyTRAPSRMWM6I+cVQKg6ldYLSEj6vE5GY760N0096vOr?=
 =?us-ascii?Q?p7yC2wMhh7DOeppSCsgWiGcIbgcIc8FFoOv/Qd8D3qhNevtxIXokVuy7HWPb?=
 =?us-ascii?Q?kcHfFVlEOZYdNMK8usYUJ0f6h8176ezGiQxCz10qJEB+jwBRdSE/4U931LDc?=
 =?us-ascii?Q?S0r0pI6xII/U07gTPTwlxDRd1iruQtfSYU4l9ixY897Joav2kBlALLQKEXdK?=
 =?us-ascii?Q?xGi5tjJ1P/FCf7WneoZaOT6PhtTJakNbrBVUPQZs25QIo/w6VvcWe1stoe/2?=
 =?us-ascii?Q?ZAfCgNgYASgoxHrvt+ZM04eJmYp3ZQKYo1vCseiepbRRAXjCoVSyyYKCH1La?=
 =?us-ascii?Q?MnDmyE8va9zqn7TAV0sqcw13kVFSUBbEjRmSdtlI50SATIaFF4WNhCh8y/iY?=
 =?us-ascii?Q?Js4qzuUXXf0zRZx+o+7eA95/3pPPDcsJezrWxw9PvM09V4ToO8/pd2B2daP1?=
 =?us-ascii?Q?sNiGKPdpq7/A2f+0kq/HMZ7xeCZNHnCuaM+qrD3jZOuagDejVMryIFYXi3Km?=
 =?us-ascii?Q?haJ1ZAzevWqU50E5EK/hWkH+z4qtoO6wc/1Du9rdsE9CgrTfVQiHLP03r2qP?=
 =?us-ascii?Q?Lw1YJ8E/saglUzairpCcp8uGr8YuJWZ2olDs/e2LyVOC4fxfu8LGpfhXHfg5?=
 =?us-ascii?Q?LsBwqUb34lP7IDyN5bRmz+KU0S9ud0rt93RTKiCICMX/cX4yl8D59WM/1NOU?=
 =?us-ascii?Q?Q0QT7ipRMsH3HsHaPfl8gD2DlPo86zRI4mr/ix1k7AFDmGYCm14sU01vrhEl?=
 =?us-ascii?Q?RhpozwJLqbg904K6lLDtHqj0rSFvGXf1yOFdzoW0P8F1KqdE0IfsB4jb/JTZ?=
 =?us-ascii?Q?h8C1puWYkXzLV7OGs/cE92LjTP3bQ3qqQ0eGihqT6JU1D8z3v75QtVbyGY0q?=
 =?us-ascii?Q?QTNg4rM5voJgH1hNG3BeajIpwKJrRiz/GQov55G2CVCck7BCfhkvK7zTeFrO?=
 =?us-ascii?Q?1CBb9VGMZ764RZWzQaZN0tolTyGBdprbuPps02DvtkplyltedpU9xxV2nPaq?=
 =?us-ascii?Q?2SohOXYYHHyGITrxjoCI+92Lnmbmrgz3izdhB6c/ulYvlLVhx5jcj0rwv/se?=
 =?us-ascii?Q?t5eNY93GqUNuLkwwUs+mcv2E70F9+okqmn72qo+xt0AKhUq4XHVce8V3IDrs?=
 =?us-ascii?Q?BH2+aSv6NkgdoIVfVBCbHKIWkcHPHBD634HXY3oVAWXvzoExO657c8g9Ijyc?=
 =?us-ascii?Q?WCRhMp/mkmaX3nXnGkGQGNklUxA55FzEJ8rgMVyboIEzy/pA/wGrPv9xisKW?=
 =?us-ascii?Q?O0DOytBJeUwUILIuZK6YX4KSmL268ZOTuQv3nZp6UDdL9shfjNayhikZ7vPc?=
 =?us-ascii?Q?o1yzPXpRP52gMz4aJ9gKEB3fz5mo+vSlalDswpu2NLv9kQ7w9T7EBsF9CoXr?=
 =?us-ascii?Q?+vOwpA65rj4R7S46LKVtWIZ5YG7quGezj73p37w5?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c0c36c33-cadc-4169-fdb0-08da71885172
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB5420.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2022 17:32:32.3734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 NqcIXxn8ICFaDFipsFrlWb5C3P/RWM2Bbq2MFTnkHnANFlErD0fhogEx4jFADqJ4T9LL8HSy3IMQmQKJ0sDrGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0366
X-Proofpoint-GUID: ydE3PIMszIilavVrD5bg7W3gJixwTyCk
X-Proofpoint-ORIG-GUID: ydE3PIMszIilavVrD5bg7W3gJixwTyCk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-29_18,2022-07-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
 score=30
 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=594 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207290075
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Jul 2022 17:32:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98052

Changes in version 3:
 - remove SRC_URI[md5sum] assignment


