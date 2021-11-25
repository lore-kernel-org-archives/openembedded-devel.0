Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA24C433EF
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 02:45:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7343.1637808309930100350
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Nov 2021 18:45:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=A/mKEEf3;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=6963faa46c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1AP2iirl012422
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Nov 2021 18:45:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=3H271Ps15amoph5PlfF3WCDBTBSG/yamYiFXQaugcCw=;
 b=A/mKEEf3RL6vZqxhJGT64UlweYNcz0KHMYBiTxwCEI+Z3z5pN80p4Rk2zlv6CY6Mtvqx
 u/Wj+fHY5w/JkMpaROLuHxqCvUBfr5TYVt6o2jKqX/XOrEJ5+G769YiRJP59ffC4TRMm
 VcKAxlNZRLoC9xN8N/nYvgrytZCsMqK7/8LVnNVlSJFd0JL51isvHXjxcAS0vIlUinR/
 HjXNiGh4dXujWXqzU3T+cNtQI4xS81VabdHn69v9JYxryQJdnv6CQtMGs8bA0fLPWFYY
 YhuvFG3mfvtTHJPhGLhM3tWGIkaGwztC1Ctd5uN/g+AjphW75MtlbHJiOe7NNZqeC5MK xQ==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3chbbv1094-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Nov 2021 18:45:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iluJFlZhfgFfQ4bmVL7TbjLFIxVl2epGAJcAmRuO09PdSgqgvKKOdOADsqgzkTE/rRHOG/fk+NtF1YZhsIFMsOSd++A0tVUVOTdCY+EerepGdkOMYy8Igc3i+XweaBzKn0ltaiidv0MmRBaDyMQZR6t1ojOLmabxU1ZJqraKFRbVzBLvveGelkp5/kxNRfoIeZ3cF3W2E5O/5m+D7F/MTyZiBa9HfrXbCQABDPCe5AQOP79Vs+b4O0Ia/agLqNpP6YqPdR+RsNk4dJr4zUdxqprHYDID3OggmVn6r5qNKzumV2mp0EsFe+8pZ2e00dJnC9m0JlanaFYqKSvg5aBtJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3H271Ps15amoph5PlfF3WCDBTBSG/yamYiFXQaugcCw=;
 b=RfpTHADA9RRVS8shDlHEkT+CowYGRZ5Dn3RghQ3DjdqEfWe2zM9uBzNwwiyN/C6HL4Tj+fVf5U/+4zDOh3JBCd1FwXJCQWJaLX3SaKcW2G6lGgaeEF06SxwO4lcqRrh5q0f9hcQwZOnjbyOg+fzlDCPaWxkUn/5rRJoLitBF0NAxCsBLwfVgd2verfvCqSfFPHypMlJLZXTTURDkWzDEgOhwrqRKpMWM5TboddcyP5+Vwz1sQ7fxG5thM0dsJSjWAGnidGemOA+h1ckDShRYu/SbI4GMtsAYEM81LsYSQQz1UUK1c8NGYjHOLNMOj1gTM68t75/zMZrIMVYcKOY1kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR1101MB2189.namprd11.prod.outlook.com (2603:10b6:301:51::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Thu, 25 Nov
 2021 02:45:06 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480%9]) with mapi id 15.20.4713.022; Thu, 25 Nov 2021
 02:45:06 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 6/7] samba: add pyldb to rdepends for
 samba-python3
Date: Thu, 25 Nov 2021 10:44:49 +0800
Message-Id: <20211125024450.143364-6-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125024450.143364-1-yi.zhao@windriver.com>
References: <20211125024450.143364-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0062.apcprd04.prod.outlook.com
 (2603:1096:202:14::30) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by
 HK2PR04CA0062.apcprd04.prod.outlook.com (2603:1096:202:14::30) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Thu, 25 Nov 2021 02:45:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f5b3b8e-bca5-4f9e-c36b-08d9afbd96b6
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2189:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB2189439D532770A0EC4DF2F8F9629@MWHPR1101MB2189.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pu34xKH6tI++ivLXoKIyAopPaEFGjbyLFYZXiCd+c41yR+x+D6LdiEY+5QvQrK0CUsi4QBaLO6F25GIMUmtk2z90WEmTRc0qLpkXMzVgZSWJY/R75hfb9n4XfTAUYy9LF/I/WFrYRBgUxrA1ATC8mjKlgorsNV8fwf30AkDOxPeQNP/TBWtCChiF8fVi5yw5DejxirZBLIyZiSdcqnatrSQX9cmOuGPb5FxHhAMvvQXeUOgH6PREbedz4eow+TMOIboaXf1C8QlsyP8QlF4bh7AW/EPLUpmUHDDRaIrl4EskWmOH+HBHSBk9j1TuaODHiCCUCvlYv1SdGWojFSwP3n6c401eJTuqO+By0QHBI8rV+DnqYJCQSLyPsYxYKZn4Oit0S0eIqJ0dUwJCIhwYP4GP3d9quylOJSsgpUBv9SnFivgZm8aJB6zpdSGlvzz6CRjggZqNAEKc5bXMVR6iNvOzcR1wadtV1UV4jkuK0lGdbmEdVcT3Uh4KK/1aG5ndHu8VSbI1OQ1qoI4B0wBr8sUrU63SmpE9x0rahNHvmiKUB1/wUsulvvJd+HxQj8aXnXMqmm4OoMkPQYQTspnir4f65p2jeq/3+DygRDgNxKHgXyWHJh1jZLkXoiixY2ToM8gHp9tahMRJekZgH5Xs3kfj0v4VAkfGYiVU5d8/8hDiPj8w3VpM9bWJifLn3TeR/wwe9LHP9ZZwdSjivP3pVg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(316002)(38350700002)(66476007)(8936002)(66556008)(38100700002)(52116002)(2616005)(1076003)(6506007)(186003)(66946007)(44832011)(508600001)(6916009)(2906002)(6486002)(36756003)(8676002)(5660300002)(26005)(83380400001)(6512007)(6666004)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7edA1/l19A/0DTUpe7PT+/+7IrCAUdVUIy1OWgBZkuI+FCshwJL3MzePVARe?=
 =?us-ascii?Q?GNSBOrnWrNvRajfnPlN52n4B+NUl+D9h4iY5kssUBhkI1tm1Taslo6YOqNGs?=
 =?us-ascii?Q?kUNUJ2pkKoMG+1U44VE3dbmGj7kEfj8CTAcLwrHnYgS2ZpPCLG4D0ZeNJ+ah?=
 =?us-ascii?Q?dwxN+egakWkjlDxFZcoOGUA+mol0kOMy2WSjzoTdiwaE5v/rnEtHB9/zeoac?=
 =?us-ascii?Q?zdwg3BVnU4xLeMu80gXhONlKK9cKYOiWE0/gp8ShVl/ewV+iIjzsFrUHHp4+?=
 =?us-ascii?Q?mownL2pPQ5f8BkTR5gu9GdqQ8k6q4CUnFy6ezfIa4dliclg7x6v3moAORaPf?=
 =?us-ascii?Q?6UBQT+TOKa+u6hJ7u3v6TTubINRvdGk8ln8JECGIjhPPA0/droKQeMPzTx7A?=
 =?us-ascii?Q?H1CttytyI5kLe4eKPfH8q2E0+lhz0GFS93rU6py+JuB+q5XHLZbBR+agT2Hf?=
 =?us-ascii?Q?8U1zMf4W8rI9zG2CPXjDHjOdYzbE4XzByhQyIxaEnJPVMf8s8UwyBRruQtLb?=
 =?us-ascii?Q?a+feJxcsIj3y5NGynAulJZfUShVIBWrpYaTscZWHbXw/K4u9PTrxYYLbxGd/?=
 =?us-ascii?Q?xeJtSDaDDC87sM2xHEPM/KJEPP4sN6B/eZwMpdOoizK9hd7QuoOd23IwQ+cU?=
 =?us-ascii?Q?5qWaco8ZaC4h9bND96nIUQkqKAmSiSKAzGWzvL/L4hn1NJ3IqhX11b7srMys?=
 =?us-ascii?Q?4pzmNLpOiGVxTqiFW8OM1OOjNHh8HrT7ny6MGn30WbjC2CCTMbOSw6q3DhTW?=
 =?us-ascii?Q?Hg2EKpLWujB4XQAUO8H3AnVXa/yz0UF2HQECjUo4xnS4lMg6jIrvrzJuDrI2?=
 =?us-ascii?Q?KZDZwgfxF/Fcli+tsTs0Kr2vjMMnMVBeYLnwVRpAtcjPcUS/B63SCGD+Av1J?=
 =?us-ascii?Q?qKtfCdO67y4T24j0Ie4cgLcwZV3AYC8BUZmNG0PqO1SvRojdOudYriQFemDs?=
 =?us-ascii?Q?Z+AQngGeErYjXcfpYzESWc3l6v8Cw0+fYorxrU2yCu59YVoG6bB5d/EnUTFp?=
 =?us-ascii?Q?gxsEUxaFHcYsQtSG6wZpgrEiCNCVHoU/iKtOxN94jFxY0cEiCVoGoHMKk7lb?=
 =?us-ascii?Q?FhR4DRLyUpQYAyRoWoASqFX5490uJuty/bRcRLRC7By16yfu2Yx76OLdrvE7?=
 =?us-ascii?Q?pN+cMFq/Vd3cyo/laSpx+1gjNerUOvOdhtYvqrEHS5zzXPDouV3mHAjAV0Ci?=
 =?us-ascii?Q?iqBeXffL60sa9i2TtdfH/dRs3Ngl1e0NswMXKkWTEVTRw6PcaOvXZ4dJLznU?=
 =?us-ascii?Q?r98fqepjcBrmS5mIDK4w8XzLXtiL7mI2BZ9u2ehI2kjYeQhzPAWwyaSbFpbB?=
 =?us-ascii?Q?pe0UCoP75I0ZfONFs0xQTAhJrwy7aXDgqPKoai+5IdWXaDyUUfnVX5wtd/vu?=
 =?us-ascii?Q?vgqMTXWidfm7AJEc+RgDHHQ3t+v0SlZFh4LCI0n2lBtszEOdrJNdsK+6APX1?=
 =?us-ascii?Q?ytg2BTSTfe01c653xg/RYwGn8xQf0DGge3cUzomCxb+2Hosqj90Zy8L5SFic?=
 =?us-ascii?Q?CZFm1r26jfOQX2/R+OwAlMC3KLcTJpalIaBNTU0uV1RFHCH3vnLlzlrg+wYG?=
 =?us-ascii?Q?q8rXncebUdJD2BjcuYzzHZ9TWL1XUyZwp443MAsHi7zj4tbTNArEJ0sQ58r/?=
 =?us-ascii?Q?AhWr0TCVP075hxJHY06nIfQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6f5b3b8e-bca5-4f9e-c36b-08d9afbd96b6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 02:45:06.4932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 dKAsP59U+nTFGh+bQ23InsxevQm4sTepONQwHTxjSyJH0z3U7tMmmNz5oLyxwFYUQpmIsMmOLa4gHx1vzXbKXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2189
X-Proofpoint-GUID: 5T4M0A26WvidLRmGwQS4GDImR1l5Dh1o
X-Proofpoint-ORIG-GUID: 5T4M0A26WvidLRmGwQS4GDImR1l5Dh1o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-24_06,2021-11-24_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=724 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111250012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Nov 2021 02:45:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94121

Fixes:
$ python3
>>> import samba
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib64/python3.10/site-packages/samba/__init__.py", line 28, in <module>
    import ldb
ModuleNotFoundError: No module named 'ldb'
>>>

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.14.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.10.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.10.bb
index af0795458..0a5dbe9c9 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.10.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.10.bb
@@ -245,7 +245,7 @@ PACKAGESPLITFUNCS:prepend = "samba_populate_packages "
 PACKAGES_DYNAMIC = "samba-auth-.* samba-pdb-.*"
 
 RDEPENDS:${PN} += "${PN}-base ${PN}-python3 ${PN}-dsdb-modules python3"
-RDEPENDS:${PN}-python3 += "pytalloc python3-tdb"
+RDEPENDS:${PN}-python3 += "pytalloc python3-tdb pyldb"
 
 FILES:${PN}-base = "${sbindir}/nmbd \
                     ${sbindir}/smbd \
-- 
2.25.1


