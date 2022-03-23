Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 713ABC433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 17:33:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.170.1648056833246414878
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 10:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=lV7uzTJh;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=00811796c1=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22NDeW2r014831
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 17:33:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=QXojoHF/bfRgdF06rxozYylYDltCGnBfkTeJPVni4Mc=;
 b=lV7uzTJhk+F0n1YfZ8DW/Hw5mcjovLh/SPq284+uxLw1Os0G6kymrSvk/dff1u/ovorj
 BjZAGwV4/8A+972H78Qz7R1THgsDiZ0pTyK0IzJInGP4rbaU7MxAWSqhPMtPiug+1OtD
 GnmMyyC4C6tIwtPfeJp2Mzk9AZQvSBcgHc2u/zBmFe0OVwvUnxZjTSQEb+xz66WqFEhW
 os/tU/7WLPb7glcVp1yudIwGccfmXOMPDZrjG5aBjK97MwHHBv15g52HMp8K+LsjmPFM
 Z340AdFjdo9MF+U9kdijPSq/K+RhvvX8c3gP27N4UL+o99crSN3Ha2rNlhsElu9wjU6W TA==
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ew4d03qup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 17:33:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3VZt4ycPj++SMmVPWRBYFbMpBFdNyoJARF6ODJWl5NzDA2/mYv9Vj/LrSCX93UtpmUik1xgxIZBWGFSvx5GKG+MgMk0qpzGZCwcEXSfxqtAitdoux+QNv/IyrH19wwmWLWvQbVmy4sBtHWkrZxNQ2ZGdsrU/ZspmH2KemjasIktYZ1+GKkiegwE0xpR0ZIiOX/jvxhWhfed1Bu224BlW+T98LnP3a7mEDVCnAMydipluHWHKL8PPyADTEaw39/nCSonpepA1au6CobXjyM6Hq3msbZ2p4/Q0jv5eIRf0eKG8LWoCPFKqUbGMA7uGG8wA3QFxCtDtW8igkXGmTTLwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QXojoHF/bfRgdF06rxozYylYDltCGnBfkTeJPVni4Mc=;
 b=hQEBglPGHb1yxREqgYy2+CIzxwhLMHLytBGuBhgd2t6/pbpiJK/qUNfvSpvFv0zTgJPwalbC1dWH4g1KVjgKDJncFr8Qyxh7k5bhYA32Ljmcid8jKM46+PHeT5i8S4mvEy6jIbraYiZr4NdpuWx4GwiJEVQr1gGiFA4FhfgVgiJ1EfHCyhA7VbK42HJxhswEPE/LrfPCAGXAuBQz5zR5CSpSye+FxK2JYS0KSWfcrhQg/gHSaTbx2l76PzBXb2ENQvpRHFfmjkmdHj2Ti1Oxm8KvlIL1KRh88nS+l/BAWtLB0XWyKNL9nb5smZ59sPVWau4/tNocxXU8G0fhcha8Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BN8PR11MB3844.namprd11.prod.outlook.com (2603:10b6:408:91::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Wed, 23 Mar
 2022 17:33:49 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::c1c7:209:c28f:67dc]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::c1c7:209:c28f:67dc%3]) with mapi id 15.20.5081.023; Wed, 23 Mar 2022
 17:33:49 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][hardknott][PATCH 2/2] python3-django: upgrade 3.2.5 ->
 3.2.12
Date: Wed, 23 Mar 2022 13:33:32 -0400
Message-Id: <20220323173332.16576-2-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220323173332.16576-1-trevor.gamblin@windriver.com>
References: <20220323173332.16576-1-trevor.gamblin@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0141.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::14) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a6be199-f417-45d5-a715-08da0cf34a11
X-MS-TrafficTypeDiagnostic: BN8PR11MB3844:EE_
X-Microsoft-Antispam-PRVS: 
	<BN8PR11MB3844862CAF365F6A6489ACDB9F189@BN8PR11MB3844.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VWfciE6Rrd24bPqhc+x+tBqTeAtywlMUSKQFa4X2ILf8QECxphKDoeX0Ltn8vs9wpPf7e2PSXaP4vJVQ19e6OoMrgM+705GT3/28OVqXVVXKAxFjTewCAnj0FelAuyYUVjDgc3l04lZYafsiC7ESpbzUCC4CT+NaH2oKTr0+K01Iv9w3C4bFK1c4hL95AiJ49sMypPYz14dBthrpcqahvkR2IXiaRXSA7dJMyyxaHZ3DaNOr4cywxBTDoEJDPXBFGsTnUPU2H1szPatK9tD5DExJE79yGahDZ8FmUuzw/yZXdMccZZwOC2e13u28xh4hsH09+4wr/SnjnE5/Vd8mSoPmI0wyI2DnsbxIv9rKiaN3yl0Kk9MUS7byvLrrFJACWypQLVOPlzWQzWRbvEA/KPURNnQO58sJW97O1J3WEVGZ/2kjQOPEr6cS/Bw81YSqpJRSdtCPCkULtEsOzVrNZlxHJrLdG7skBWCYlsOIgky5G68m5AMZ0CWVdIwNMH9IAt7qDcOUj7JjBWa7arh75w3ZudiJUCbYLyDnoLOIUJuj811ueH+IKxbxKoSxh/8v0YVp3CertPkHBdDLUSt9G6rRD7ONOQPeVVA1a81ShIvU64Dd9bKJ8zCr9bk+Mzfw86G5sm9jWtRu7lwjXZGWVOFJY9OFCjxKB1C4QKDTZp/6oc+Ix8l6QDh+l7EUqoBuEyBHbdH4N1mzt/80r3cunw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(6916009)(66556008)(66476007)(8676002)(66946007)(1076003)(36756003)(6486002)(8936002)(5660300002)(44832011)(508600001)(86362001)(26005)(186003)(2906002)(38100700002)(6666004)(38350700002)(6512007)(6506007)(52116002)(2616005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?D+B+Xs4KnqCGDC2IPvZi/pZ98DeXaH/VdJouLZ4YBjcEo0Qpgh15naXa2KzL?=
 =?us-ascii?Q?fKVuf3gJTTlhv25y+CB1E0Os5RhszINsNhPaKW0z/OWq9OfcTv4y4KjE0qop?=
 =?us-ascii?Q?jGurS2FsTok2os/G2yTmVW+GK/dfnVFbtxUD7sCKQzCFDSwV6EYukp4BZJnj?=
 =?us-ascii?Q?CLP+v11viyvtuNrRH+Q7WlL7MDbNitFdzFpgNIJ1KWpRl9b0kq/IdZKJKgC6?=
 =?us-ascii?Q?dms5n1jzREYyYeU2Bb6CUKyWl3ePR+pU8X2Y6Fuu1Rmfsc684D1YG59aGC0U?=
 =?us-ascii?Q?S5p7gcDiGWWD9uAW5N0KiHyYkadPzgBKOLo/R+Tpq/dpa8dnPGyUI9cdc1k7?=
 =?us-ascii?Q?zR4jXNfWnsnS7BM9DMhrRo0rKSrjagf1dc9KXrJlJhVu4IFdWUDM9p23850u?=
 =?us-ascii?Q?fDakOO7XNRApATOImUEiSzK+ld+o8M3UAbEJ4tLH3Vqv/7++NbNZ28jeCCbv?=
 =?us-ascii?Q?imlHgIzuTmCih/HaBD/YBxnXM3Xct2Gnbd8Cr3AKhFDH5dt4msiTpFjsQfGm?=
 =?us-ascii?Q?NQxPi1goRFQYtlXM9YP0gjBQbCi3H9DGsQZVY/8WNxURVJ3nW5DUC8YpjHi3?=
 =?us-ascii?Q?3LC2Jvhy+aT7AA6ZWTzvSRMEUoymIq/cOd1fIkT0VcH9ZInobkxdpPPqxgnC?=
 =?us-ascii?Q?QnxFJGPXJG8AV5ys3L3Q7DO9GXqIaTaDziJpGLLoMhNfkeH+hl0dFK2D9904?=
 =?us-ascii?Q?MAk1J+4BM7d/EULi8LgWtrtyryDGlO8gQJIwJ+P3VFuEhDMVakA0HOId+yxW?=
 =?us-ascii?Q?rX3Ud8F1HJes47h4TLOYcehOwd7eTEs5csdEn5DeRfZXOD1DPsnB7brwajcD?=
 =?us-ascii?Q?64mauHYsFC7wuszBXUvaJkWgsXTcwPuYTI9kp+IKcZOo5rNBVg6IGAJlYpUp?=
 =?us-ascii?Q?2iCKgkuazu1Kdlz3k3CiMXiIJiVYQRstGmsvvgDyr+FTTuARPo5+/gM5wo2g?=
 =?us-ascii?Q?nlyGOGGJyQBedgVpDralEg3+uSv5ifxY7RLXch7EWQPqkvA8zsa8K8n6S2v0?=
 =?us-ascii?Q?6YVXhrpoBx52Ltf9zf+eQlpy5NPcbOgqrCfbSdaCbquwPk4bMDkApFN7zQYP?=
 =?us-ascii?Q?4RxpVZJYYkkVnH6yr8ubmYAHDoiTHMbi+6c9UAlVx1QYwE0NFSsngqcD6gLt?=
 =?us-ascii?Q?5gnSxH9DJLM8qsv9nUVnVaa1sfrIVUaCmlWqkxwS7mvKVPSB2+WaTMqRIbzX?=
 =?us-ascii?Q?Hpuzq4Si6JrJ70zgRys58kerg260b1qy5wPY8M+P9HvG+pSe3vEhS3uuwDj8?=
 =?us-ascii?Q?sR6vjlfr1v9P6mJOdQHPXD42IwTX5eRhOwz8zP2JrPfmlrFa1Ri/dAdxZLZ7?=
 =?us-ascii?Q?QoBk5Zu5uP+XXffEQJvGDYaBoiqC5zZvqQqSVpnOGGCugIxH2Hil3To8GOhZ?=
 =?us-ascii?Q?C4K9ItY0wkznxrNo0tkQKikWO79Ys94IFAiM/vBo+dbzsBxwdYGBDz/tZiwn?=
 =?us-ascii?Q?xyXrf9GwG1Erep/h2ozVr33HvsnyfXuqRfvACBlBESHsy/fM7Ri2kQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7a6be199-f417-45d5-a715-08da0cf34a11
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 17:33:48.8259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 87ILYmTK1zunPpo5eBVczgeCUgf4FfWblKtw0VtcTA3sqUMdSxnj5BWX1yhWiNiBbXCS+icM+zGpYEz7H7YPspgtuFmYX32+4rU1QzENLVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3844
X-Proofpoint-GUID: cP-tl3E44I2C8UcmPy_OUe6AYm4K_FbC
X-Proofpoint-ORIG-GUID: cP-tl3E44I2C8UcmPy_OUe6AYm4K_FbC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-23_07,2022-03-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203230093
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Mar 2022 17:33:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96163

The delta between 3.2.5 and 3.2.12 contain numerous CVE and other
bugfixes. git log --oneline 3.2.5..3.2.12 shows:

fdf209eab8 (tag: 3.2.12) [3.2.x] Bumped version for 3.2.12 release.
d16133568e [3.2.x] Fixed CVE-2022-23833 -- Fixed DoS possiblity in file uploads.
1a1e8278c4 [3.2.x] Fixed CVE-2022-22818 -- Fixed possible XSS via {% debug %} template tag.
a7e89fe776 [3.2.x] Added stub release notes for 3.2.12 and 2.2.27.
027f4c4ceb [3.2.x] Added CVE-2021-45115, CVE-2021-45116, and CVE-2021-45452 to security archive.
0a9a46a1d7 [3.2.x] Post-release version bump.
6e499a28ac (tag: 3.2.11) [3.2.x] Bumped version for 3.2.11 release.
8d2f7cff76 [3.2.x] Fixed CVE-2021-45452 -- Fixed potential path traversal in storage subsystem.
c7fe895bca [3.2.x] Fixed CVE-2021-45116 -- Fixed potential information disclosure in dictsort template filter.
a8b32fe13b [3.2.x] Fixed CVE-2021-45115 -- Prevented DoS vector in UserAttributeSimilarityValidator.
b0aa0709a5 [3.2.x] Added stub release notes for 3.2.11, and 2.2.26 releases.
ae242235db [3.2.x] Refs #33365, Refs #30530 -- Doc'd re_path() behavior change in Django 2.2.25, 3.1.14, and 3.2.10.
ecd2793897 [3.2.x] Added CVE-2021-44420 to security archive.
1cea03ab00 [3.2.x] Post-release version bump.
0153a63a67 (tag: 3.2.10) [3.2.x] Bumped version for 3.2.10 release.
333c656030 [3.2.x] Fixed #30530, CVE-2021-44420 -- Fixed potential bypass of an upstream access control based on URL paths.
6014b812e2 [3.2.x] Refs #33333 -- Fixed PickleabilityTestCase.test_annotation_with_callable_default() crash on Oracle.
cb724ef6c0 [3.2.x] Fixed #33333 -- Fixed setUpTestData() crash with models.BinaryField on PostgreSQL.
0cf2d48ba8 [3.2.x] Added requirements.txt to files ignored by Sphinx builds.
487a2da02e [3.2.x] Added stub release notes and release date for 3.2.10, 3.1.14 and 2.2.25.
742d6bc8db [3.2.x] Corrected signatures of QuerySet's methods.
99532fdadf [3.2.x] Corrected isort example in coding style docs.
31539a63f2 [3.2.x] Corrected "pip install" call in coding style docs.
76a0a8a917 [3.2.x] Configured Read The Docs to build all formats.
04e66e245d [3.2.x] Fixed crash building HTML docs since Sphinx 4.3.
dfa1145a22 [3.2.x] Corrected multiply defined labels in docs.
9d171643d4 [3.2.x] Refs #33247 -- Corrected configuration for Read The Docs.
327dac6e7c [3.2.x] Fixed #33247 -- Added configuration for Read The Docs.
bc691d555e [3.2.x] Corrected module reference in contributing tutorial.
3357ad2de2 [3.2.x] Fixed typo in docs/topics/logging.txt.
34e5e61479 [3.2.x] Added stub release notes for Django 3.2.10.
21a56d596a [3.2.x] Post-release version bump.
1b3c0d3b54 (tag: 3.2.9) [3.2.x] Bumped version for 3.2.9 release.
e299cc2d2c [3.2.x] Added release date for 3.2.9.
947d2707c6 [3.2.x] Added Google Cloud Spanner to list of third-party DB backends.
128179c0f8 [3.2.x] Refs #33182 -- Adjusted custom admin theming example to use correct template block.
f5802a21c4 [3.2.x] Fixed #33194 -- Fixed migrations when altering a field with functional indexes on SQLite.
fdc1c6435c [3.2.x] Fixed #33198 -- Corrected BinaryField.max_length docs.
dbcd81841f [3.2.x] Refs #32074 -- Removed usage of deprecated asyncore and smtpd modules.
137a9899d7 [3.2.x] Refs #27131 -- Removed SMTPBackendTests.test_server_login().
1128291650 [3.2.x] Added 'formatter' to spelling wordlist.
82fee0446d [3.2.x] Refs #32074 -- Doc'd Python 3.10 compatibility in Django 3.2.x.
1aed4663c3 [3.2.x] Refs #32074 -- Added Python 3.10 to classifiers and tox.ini.
53fad80ffe [3.2.x] Refs #32074 -- Used asyncio.get_running_loop() instead of get_event_loop() on Python 3.7+.
f6726fdc3e [3.2.x] Refs #32074 -- Fixed find_module()/find_loader() warnings on Python 3.10+.
d0dc446444 [3.2.x] Refs #32074 -- Removed usage of deprecated Thread.setDaemon().
8bebb1c04a [3.2.x] Refs #32074 -- Removed usage of Python's deprecated distutils.version package.
faeae84dad [3.2.x] Skipped test_archive tests when bz2/lzma module is not installed.
329311ecbd [3.2.x] Added stub release notes for Django 3.2.9.
85e4af6a22 [3.2.x] Post-release version bump.
4540e976d4 (tag: 3.2.8) [3.2.x] Bumped version for 3.2.8 release.
65367b0500 [3.2.x] Added release date for 3.2.7.
51e4dbfeb2 [3.2.x] Refs #27694 -- Doc'd lookups that can be chained with HStoreField key transforms.
031ffc5c84 [3.2.x] Corrected field and model check messages in docs.
7607fe922f [3.2.x] Removed obsolete GEOS 3.5 requirement note.
6760f4fa25 [3.2.x] Fixed #33083 -- Fixed selecting all items in the admin changelist when actions are both top and bottom.
e235c7815a [3.2.x] Fixed broken links and redirects in docs.
51e76c922f [3.2.x] Used :rfc: role in docs/topics/conditional-view-processing.txt.
d4a587a5fa [3.2.x] Fixed #33077 -- Fixed links to related models for admin's readonly fields in custom admin site.
561a1c0905 [3.2.x] Fixed typo in docs/intro/reusable-apps.txt.
454ee4d3b8 [3.2.x] Corrected outputs and made cosmetic edits in GeoDjango tutorial.
b51e0a37cf [3.2.x] Doc'd Jinja2 form renderer.
a7be74d017 [3.2.x] Clarified type of Window()'s partition_by and order_by arguments.
54684a3ec0 [3.2.x] Refs #31055 -- Doc'd 'databases' argument of check functions.
1f86ff31b1 [3.2.x] Fixed typo in docs/topics/i18n/formatting.txt.
b61f44c339 [3.2.x] Fixed #33082 -- Fixed CommandTests.test_subparser_invalid_option on Python 3.9.7+.
707239eabf [3.2.x] Added stub release notes for Django 3.2.8.
d5710f405a [3.2.x] Post-release version bump.
45a0c54b67 (tag: 3.2.7) [3.2.x] Bumped version for 3.2.7 release.
4b80a40272 [3.2.x] Added release date for 3.2.7.
4e55806720 [3.2.x] Refs #25264 -- Doc's that not all default options are supported by every management command.
fe3a854e1d [3.2.x] Fixed #32992 -- Restored offset extraction for fixed offset timezones.
382374a360 [3.2.x] Corrected BaseDatabaseSchemaEditor.execute() signature in docs.
11b2cbb65f [3.2.x] Made sentence about Model consistent in docs.
69009f4952 [3.2.x] Fixed #33046 -- Added note about using length of cached result by QuerySet.count().
d95a0144e5 [3.2.x] Used backend vendors in custom model fields docs.
358e65a5cd [3.2.x] Fixed #33030 -- Fixed broken links to GDAL docs.
d29a9ed504 [3.2.x] The geodjango mailing list moved to the Django Forum.
eb26b8a0fe [3.2.x] The django-i18n mailing list moved to the Django Forum.
6bb74f3de8 [3.2.x] Fixed some broken links and redirects in docs.
f18da11b8a [3.2.x] Updated BaseDatabaseFeatures link in testing tools docs.
2c46e55314 [3.2.x] Clarified URL patterns in tutorial 3.
87e7399760 [3.2.x] Added stub release notes for Django 3.2.7.
e1cad66dca [3.2.x] Post-release version bump.
eb0f298e76 (tag: 3.2.6) [3.2.x] Bumped version for 3.2.6 release.
70840232f9 [3.2.x] Confirmed release date for Django 3.2.6.
d9e05ea17a [3.2.x] Refs #31676 -- Updated technical board description in organization docs.
99d9a3ef7c [3.2.x] Refs #31676 -- Added Mergers and Releasers to organization docs.
ed29959812 [3.2.x] Refs #31676 -- Removed Core team from organization docs.
55daaa0c79 [3.2.x] Made minor edits to QuerySet.update_or_create() docs.
5fa70c91b4 [3.2.x] Fixed typo in docs/ref/contrib/admin/index.txt.
aace6c531d [3.2.x] Fixed #32933 -- Documented BoundField.initial as preferred over Form.get_initial_for_field().
bdd4cbe84a [3.2.x] Fixed #32957 -- Improved visibility of arguments sections in Model.save() docs.
b2f7b53fac [3.2.x] Fixed #32947 -- Fixed hash() crash on reverse M2M relation when through_fields is a list.
de5a044cf4 [3.2.x] Fixed #32950 -- Removed myproject from imports in admin docs where appropriate.
f4cf86f870 [3.2.x] Refs #32949 -- Adjusted release note wording.
1346381760 [3.2.x] Fixed #32949 -- Restored invalid number handling in DecimalField.validate().
05e997c404 [3.2.x] Fixed typo in docs/ref/databases.txt.
9a65e62c93 [3.2.x] Fixed typo in docs/releases/3.1.13.txt.
0ee092c8dd [3.2.x] Fixed typo in docs/topics/signals.txt.
b7d25d025e [3.2.x] Fixed typo in docs/internals/deprecation.txt.
6931963886 [3.2.x] Fixed typo in docs/internals/contributing/committing-code.txt.
f36edbc378 [3.2.x] Refs #31676 -- Removed Django Core-Mentorship mailing list references in docs.
527482c513 [3.2.x] Fixed typo in docs/ref/contrib/gis/tutorial.txt.
1d53d2502d [3.2.x] Documented in_bulk behavior with nonexistent id_list items.
9fadb97583 [3.2.x] Added CVE-2021-35042 to security archive.
92efd69107 [3.2.x] Added stub release notes for Django 3.2.6.
3ab942f10a [3.2.x] Post-release version bump.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../{python3-django_3.2.5.bb => python3-django_3.2.12.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_3.2.5.bb => python3-django_3.2.12.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.5.bb b/meta-python/recipes-devtools/python/python3-django_3.2.12.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-django_3.2.5.bb
rename to meta-python/recipes-devtools/python/python3-django_3.2.12.bb
index 5890c8541..ee71f953b 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.12.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "3da05fea54fdec2315b54a563d5b59f3b4e2b1e69c3a5841dda35019c01855cd"
+SRC_URI[sha256sum] = "9772e6935703e59e993960832d66a614cf0233a1c5123bc6224ecc6ad69e41e2"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.33.0


