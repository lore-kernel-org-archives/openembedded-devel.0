Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.15323.1625620401363488753
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jul 2021 18:13:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=e145tnBa;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=28228ce458=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16719tig028791
	for <openembedded-devel@lists.openembedded.org>; Tue, 6 Jul 2021 18:13:21 -0700
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2041.outbound.protection.outlook.com [104.47.51.41])
	by mx0a-0064b401.pphosted.com with ESMTP id 39mp120g6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jul 2021 18:13:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNwbrt9XJylij8i67FRxKCdYZb6CZ5QgRcvYUZW5FO3km7mqrxq8cmeUf0H+DAdiBoDoGX/v+DP2BYfpgTwK6QeAErBhbwcVzot0MTwnq+qQGdxuxuvdPAV/kRe8RgDOsOeeR2wI5C9pSiGpSzHDUazYj+zutkbleVO2DwwvYcByYSuLip0oOIim1XTLcJZM+0pvfVrhJWPHiTGHAkWDFIIclYHuUc5EXGQoZIofZ/jufx6Bb5fKuqmrFsSX0lInZgPwbh7KnqMUnzbdyXLMPhOJ4WNYKO4+ri/EAVyOmzjiBvsPv7EbYym1E3r+pj82Je6DqamshTnvVPkKfk6w3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDUnUa88kdPoW3g+5FqwFMfj8nvBgF56oTddU9nPRqc=;
 b=Rx/Y1WxmbNHrZJJVymZrc776yOYt7+YvbPeV3ZYG4dxAhAzp8/jecoKYFgImzdlkz6Lx1tVCqofgjuJJH5ziNga1Gu6fWKcEIwzyNB7wHkfHBjCjFkwyd5KSS2I4P2l1BouxoLZlW6WSHiLUkNcB1SqZRISyvZ4vzK9zFQfX99ixUqwkXkqJWATR2lzzDwFET1Hqx7lOWaIcAa4rWnw7uvOUdBNQRG1+PvhJ+m/cbybhZquYVuIko85nCMOAG67Q5c6ouyoTmYeF80LSOSPof7c+/ogUP9wVC3PeVwq9xOTj0Ii1A4tqo1cYKh6R1qzfQ8GTfDOigVGe8CGiKaT5NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDUnUa88kdPoW3g+5FqwFMfj8nvBgF56oTddU9nPRqc=;
 b=e145tnBap1dMw6Ed8VXsvvaRZfjcrncYgDsLOwMsT5mdbnJ6MekdT5EtvRLF5rMawW2rHvmej/xOc0snN1Bp3Sl3vXGchIML6ZJQHgQ7hUeWpmI0li07juMci+aWUTBVBzGQksESJc0jyCBBQo5LS79mWATNDCWkKsokkpyCfBY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB2029.namprd11.prod.outlook.com (2603:10b6:300:27::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Wed, 7 Jul
 2021 01:13:19 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ca0:3d02:dcd0:626c]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ca0:3d02:dcd0:626c%8]) with mapi id 15.20.4308.020; Wed, 7 Jul 2021
 01:13:19 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] audit: upgrade 3.0.1 -> 3.0.2
Date: Wed,  7 Jul 2021 09:13:08 +0800
Message-Id: <20210707011308.216369-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: PH0PR07CA0003.namprd07.prod.outlook.com
 (2603:10b6:510:5::8) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by PH0PR07CA0003.namprd07.prod.outlook.com (2603:10b6:510:5::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23 via Frontend Transport; Wed, 7 Jul 2021 01:13:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ec780db-d7f3-4f9e-1090-08d940e467be
X-MS-TrafficTypeDiagnostic: MWHPR11MB2029:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB202982900D45D544E15ED300F91A9@MWHPR11MB2029.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/dB1AHNBvasCX2JaY0BaB0hL9L15r448ecKDm53hEC8kJEZYzv9AXxi8SRSjtFIQwWIO5kSwtVuqjh7o8GZF+yI5/SrnoBYQ6B/ZDv5a0XlzZD3YUfIySq9/6Dkzi3h9pyiSXCtuNq0XzMMQy/KgeqmA4sX1oqSF8ZGDnIlFc7FfHs5Wo4WeOgZCmclMfYJ+b91S5w1wX7WF9i+TZGz5DEbCfgbymTpROsOGPz8gXRO/IPaOdOj24JGUtpQSoQNV87FnokzGSjAxdisdl6Xvc186QBqUsi4m9lghj5biW7jA0D/b5WRwOWIiMgU7qSmqxYsN5XcdXSCyBBI7EKJ9sly88Ey7ChItezxEcVJQbjVpHWUL2ylHd7XjKJ3YFOSqMS41V+qFUeflAM0ym/hSs7IoqkR+cZl6UxZig6og4J+3wjxHn0EXSkc/4dQPujgm51/wQr/KHfNL3ZKMubG0bhlshFWlGGLWWGQEbRF1nwZjayO9ivAFvWhpj5a1qd4yHsGKPMftrcMexPiWLUdV5U6F96D53c60CuwlJegxZEN6/DacFAnO+isXO7qoE2Xa+A8ziTa+T/sCSTJW3zfRrJNNNZjViYECGb01364VS4S2QBW/frn/l5oSNiU4UDuIYyeP9Q3rTccVVkgLnebsI6UuOFmo2osgnxnB5LJwvjn8OuSY5JHYFnGoy22HaZfa2Q3xhWc88EoF88Qe7XXZoQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(396003)(346002)(376002)(366004)(316002)(86362001)(5660300002)(38350700002)(38100700002)(478600001)(6916009)(956004)(52116002)(186003)(26005)(6512007)(2906002)(8936002)(1076003)(66476007)(2616005)(6506007)(36756003)(66556008)(6486002)(44832011)(83380400001)(4744005)(66946007)(6666004)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+atkWH9XIKxIZt07jKi7bfpRqKqzaFK07kWegfrYZ5HIQMVBa9ymbdzRraR9?=
 =?us-ascii?Q?dUiFGL7F1TtsGyKZ3OMUfByMDdZYvXymXKEWXAvs69/qtUNWq3Ss+fxVIn+B?=
 =?us-ascii?Q?6ent4SmFU/gSxD1xqoPyCwCJoufODm+TC1bWEBWoLInAFbriQtuxb8mgAURv?=
 =?us-ascii?Q?t7hOCbGhwVgRyL1jmbXXIR4bxR/X/Xdburs3h9dC0CO6zDSX4VfOiFtqS3Qa?=
 =?us-ascii?Q?fNwVcFhyM8Aw8R4ytbFDkIBg1JuRRSxFJQd0g2qN7/GrYN9TKBx0jo073d5n?=
 =?us-ascii?Q?Go+nKS3afLWoWDMbyxxt4IhfbGxCnldcoVxz2Se0wd54nq+3v8mkgke1fNN2?=
 =?us-ascii?Q?N4/2fDtXtPBBuaxawDKoCOTPxCu5y17Hm5yfrf7B9oiuNsKKRDWTJfugb+jH?=
 =?us-ascii?Q?33iF0iu4AGknTYuMu1v53T6C1m3AOLRr7snRUygdPcwLMpF9JJ4tXfCMtMJu?=
 =?us-ascii?Q?i8Sl/rqZyr5SrmhSZ4RttjsLKM+Vbv2pPdxUhBclmNDNnSEJ0yn7UR1dTF+v?=
 =?us-ascii?Q?LymmypO8gy1lIIkSNs9gfLeWX7SNOApYlB7Ox4BA+phjLu30qAHrC8peafH2?=
 =?us-ascii?Q?LeDB49vB1C9bqXB6pYEolPMWCE5qqN/yRDJh2DGxdxNlC6+ueP7j1cbYr4Na?=
 =?us-ascii?Q?TnWsb0IKJN93luxIf6+pF9Nww+lenPyTyq6C/A5SGKPKd5TXtAEUlMCKcr5v?=
 =?us-ascii?Q?1kURcclngr6WgZUMApLWHf4VqxHNZPpsx8d37EcTs6fgNC/LBsZE/b1gaiIe?=
 =?us-ascii?Q?kSoG1jR3dN/CVuaW0F2i6h5nGm4hfZdTfDtmlMr8bfirlbkFDnuHyDwQlpol?=
 =?us-ascii?Q?SpMFVWxne4kyN2OVtTXpl7hMmNmwlovDETR8XcX2enkCPbBqPGSWPv54o8JW?=
 =?us-ascii?Q?JJm25O1FiOacCpxEz6gUgHvVMjGdoCpaZe10lKgHARSuq2Fuc2Q22FX8t0Rp?=
 =?us-ascii?Q?TC9yXxgQmiunmIYRi7VYhPuEcklw2E8e36U8c8dtotU7i7D1bW8X00k/8cGt?=
 =?us-ascii?Q?IVA/Zttq3VGigV54JVdFuczoGUNwdBr7dD/AhGyqc9qzvxGCr5bfOAI3CPxr?=
 =?us-ascii?Q?gvNvnKc4gK7cpLyBd63hDcrYi2uC0/wU5tT++aJ3WBubxcpfowKroSLZQyUl?=
 =?us-ascii?Q?82mcoJHDlxaPipfm69TM7LljCubT4p4uPPP52N0hDLzh827vr4prLJEr6PGm?=
 =?us-ascii?Q?LL4Jgwcgs38jw3SWmekyuSdiIIZjW760epJezmOvVZcdOG+rG3DouY0ai1oS?=
 =?us-ascii?Q?S/7ZMooYglbmotjhhouPk+UuXIYRWhfxy5TiN8fdcrkUfqLV05sK6w5wQelB?=
 =?us-ascii?Q?rXUCxPlFodMAXgs35tXRK784?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec780db-d7f3-4f9e-1090-08d940e467be
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 01:13:18.9883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 132KpfT1+9OOgobehX07oKDS0yqD5mM4+kB48cLyCY5C+swdSzi4nWpipq18c22PvWME8iqlpIVFdL5i0WvJ9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2029
X-Proofpoint-GUID: hOukLf5W_p2rChuitL_19uHYLLsT8KHb
X-Proofpoint-ORIG-GUID: hOukLf5W_p2rChuitL_19uHYLLsT8KHb
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-06_13:2021-07-06,2021-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 phishscore=0
 mlxlogscore=995 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107070004
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-security/audit/{audit_3.0.1.bb => audit_3.0.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-security/audit/{audit_3.0.1.bb => audit_3.0.2.bb} (98%)

diff --git a/meta-oe/recipes-security/audit/audit_3.0.1.bb b/meta-oe/recipes-security/audit/audit_3.0.2.bb
similarity index 98%
rename from meta-oe/recipes-security/audit/audit_3.0.1.bb
rename to meta-oe/recipes-security/audit/audit_3.0.2.bb
index ba24d360e..7d2cec18b 100644
--- a/meta-oe/recipes-security/audit/audit_3.0.1.bb
+++ b/meta-oe/recipes-security/audit/audit_3.0.2.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=master \
 "
 
 S = "${WORKDIR}/git"
-SRCREV = "46cb7d92443c9ec7b3af15fb0baa65f65f6415d3"
+SRCREV = "40312ddee3035d13e287355544cd7bd7e49b5499"
 
 inherit autotools python3native update-rc.d systemd
 
-- 
2.25.1

