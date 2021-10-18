Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C680C433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 17:25:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.40298.1634577901226243314
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 10:25:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=cBtCR4iC;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=592552de1e=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19ICrocK031857
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 17:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=5Y0XfvAybus0qO0fN0ER8BIk6BJBhDf6c2cdIzyA/g4=;
 b=cBtCR4iCgltausH+kvKv/Xqgu8MCU2V4sGJvWaw9uCabTSBgO5KkodXdmUqmiSbz51OV
 k9BRK2iFFi/U9R94O33wGEQFZaVfONOx7QjuRpU1jdXpvtIvUByMzWkr2u9suCeHR1ub
 TPXqylBG+uCWkVb/9ilimVWUqqOknde4vr7Ev43OefdCOhZcP2mitn49pYTmjZd3IoHZ
 8d5UEVKTauq5WYko2LLpmESsUQJzj7U6Jx85S8yh76/pGfnDjgYL6ybZ+ELHJm4rVa+u
 x5qGmBj7cu/wpgpuCiYgNa3W8Uf3c8liQeN2AT181eqLAV301H5M17cqGHu6TZ3Ug52D EA==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bs9apg7ws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 17:25:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WZ/wG6NbmuMLnJuvBtRhbuR4V8o5CzcgR1zQGBLbgUPC2wdAUwHSweeLApIw6cTjk7QlUDDY0U02XIfbSQbgC9blI4FJm6Z2Ukuxmlq+WuW5Xi6TUN3l6Fox7dkdApBhdDy8QSWdP/Id2Cmaic17HH3CPCTAdy808ztOGdY4Sp5GxVP8ctwDLHElNuAwI4tGkUEM8PgFV/nP3r/HtovkIVrrbFZtlIZZ2vTW/XtsnZVSDUwx9EHqE9VaMYu5mQgrmSfPipQJCtNhrTxQ4yzh5cMdEtTMvqFV0vvHd7uYq36UdsQ4TfqZhCBp5cbjHcPlL2FNvqXMc/hJRvOLkK/4aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Y0XfvAybus0qO0fN0ER8BIk6BJBhDf6c2cdIzyA/g4=;
 b=Ec8cf1D+1/FgrCkj3S7ARA8mp4jidFV5RgStRe+vvrOunS+nZ44BAK0qi0UN7sHoipZxZpmKjRzBvgDPcv3PxODmUUaJ/sR1pfOMwN54Rxep1IQShn2AYL2iqC27R6pnEYUKPjTbXk/4n7dat9NqfZUS9BtdZGmbR/O54R3ayML1cbNfogyFw2zJ/PNX1YIwdCvBEKtKigDHvdxk7XTg/1oy1MlFktnfKeO5M4Wpd5jCepiUn8xzveFv9hoVHA1R9L4Kf3UMthVU3HcaXitym38j6vgKl7OQfs1hjiSY+5uMo5sjpXWu2baC6EwwO9HkwCKBskHeMhUXXYjAauSZDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4321.namprd11.prod.outlook.com (2603:10b6:a03:1bf::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Mon, 18 Oct
 2021 17:24:57 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::ccb2:28ab:f000:8440]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::ccb2:28ab:f000:8440%3]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 17:24:57 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][hardknott][PATCH] python3-pyinotify: Add fcntl,
 logging to RDEPENDS
Date: Mon, 18 Oct 2021 13:24:16 -0400
Message-Id: <20211018172416.136132-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0197.namprd13.prod.outlook.com
 (2603:10b6:208:2be::22) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
Received: from yow-tgamblin-lx3.corp.ad.wrs.com
 (2607:fea8:c29d:d7c0:fa88:8bc5:c0d2:27cc) by
 BL1PR13CA0197.namprd13.prod.outlook.com (2603:10b6:208:2be::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.10 via Frontend
 Transport; Mon, 18 Oct 2021 17:24:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7047ec7b-9f1c-4ddf-efec-08d9925c3494
X-MS-TrafficTypeDiagnostic: BY5PR11MB4321:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB43218B9A5F2F03D61C0321BF9FBC9@BY5PR11MB4321.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JAsoTyesiR4BYhqxTMkt0AWobTAjtQtitpT2ABcMuyYSujh54m2AyoVziZfYWgs7oMVB3ao0wGWe8Y3ApZUe86P1JaLoauZ3j0NOb/NZBIhYMqF2ylG1fM9ZrveYll1hdrG2W4znn7/zqKyTFXtVEAjinucT7CPry4pNdeC8aGb4RDgSDYAYUreYn69xPWkXiETGgR8vXbctfikWqQjlj/6tgpnE4YFA0FkUamtJISiNbIRNAn5R4YLvZT0pzEL4d1kZyeOf6rT8A5hjVuWslaPsVAcy4F4c0SRyVtVP79IJeBi7+wVS9fgYWQM6eGFTAC0QrbkYdE/vtySIDt/K4PgzhmpxD1lDdJG2e1RO2Wfi7lr4dD9H6TLH1ZLtb7AosbkID9gIPZlaF7CihmnOOeaihBhgPUe03KtLCoPYg+LoKOxSiYujTBnBTVQey3wVri8NhRSna0ztyyhKkkfBn6YW+fKfQjaLd3MhzdEC3hL7FmUuCnsXQfMzqIVOxDPFKlm5e0bPBuTtvfgbUcYIMKdo+3/xKNJgQ/WVzDwtyttVwoiUfGxDL8DQic/QYPq8nOh/u1cdDXvzFsPXKuH5GmP/V/R46RuNVKHnj6tFQSo5TdjMFnQssmidegVWTPrYPJVaxuYBbQ4u2a+3C6AydQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(6506007)(316002)(1076003)(4744005)(2616005)(186003)(2906002)(66946007)(52116002)(6512007)(36756003)(44832011)(6486002)(6916009)(5660300002)(8676002)(508600001)(6666004)(66556008)(86362001)(66476007)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?roOXbKCUaPiQslpCGUs2jH1dZUb5hwgVVaPqx+DMl8yxOqOCv9CtlOonx/nM?=
 =?us-ascii?Q?kfpY4DXbwbUBebr1wgQtdLoINz7zn7pQodJG6UWpJgGG265WERINLc7PtWX/?=
 =?us-ascii?Q?VgqyFONrQirERNVJvYOacYCxj38CJbPayAaK2aKOMMrWtPjJo8PXA+bBeJ4S?=
 =?us-ascii?Q?jOYPLjRxSePqTdBVSr81vJfIUj/oYu/xcoLqu1XIO73JOlleoqW/ieqrV8P0?=
 =?us-ascii?Q?9OQRSNEtiRwmNgLUTdqz5PqUr2ZpbWg/kkn/JpYJ+L+hY/BXCyOvrjcwJRJz?=
 =?us-ascii?Q?rxS6wM5+bDvUirNqg5EpS6jd3JGYYc/M9hMDu1YzRX4WdB9AMaTI5Cf2pmOP?=
 =?us-ascii?Q?ZwSWpWaINohs6ZchXcKtfZyoZDv4elWeYncpGvZSduS6H4KOVEo3k6Arvlon?=
 =?us-ascii?Q?mL4atjRBDjIubzPsjCsG+r61FigPTrMZjj1oSTQ9DF/eGLhRyauZOhaMSsSZ?=
 =?us-ascii?Q?2tEY94DTvFZ2d23rhstEKUgXS2zo76loWpPUrbPio/mF1r140Ki42z5sT/wv?=
 =?us-ascii?Q?pLvwBpxyZYvLEycr2Hge5rC9I4Slkbl54FjYRWDKsd8lu4c0Yg2XX5vvStep?=
 =?us-ascii?Q?TLQUQc92vs4dJ54e7xfi4gO0JlqMdugBz98cE0/uYp+Nk5LMRtzxQ71kBVVR?=
 =?us-ascii?Q?a1i0U4342d3yynvdoXzMVtqXvMUHRyXR46JlxowwngWeSSbvQVkIDOoSnF6x?=
 =?us-ascii?Q?cxVkwJkLIW8jGUeGMJIV1svCipEuprLg7ky3R9FlIVeNNgExhqXHhKukATSG?=
 =?us-ascii?Q?6W85nGLzdgY12WggMnCjChUL4JLM9N/g16t1/AL79hdFPMPnWzaOWqTy27TA?=
 =?us-ascii?Q?jo5qUhBzQtb5mISkadE9652BClXG7BvG0QdyBI+UwXFoV8j1wd0uTQJgzAxa?=
 =?us-ascii?Q?joXjhYzvmpoL6v0T5uhhl/oukXEjzkF1+5/NQrDt+affNqzvXni4KmIUMnpa?=
 =?us-ascii?Q?LL38FPO+tAguc9Mvj2u2dPl4Gxb8CqPRixElqejZbgcurHr+a9T1Xk2NrxCo?=
 =?us-ascii?Q?kzKZQqVz4kgZ15LHec7xBXgap9xpZJyCy95/LBHP+g+8k/CQpk/FDTgbALFq?=
 =?us-ascii?Q?IgTI6PirzmYfjP2PeebUxZ4Cs4jJ9UBDSZwtE/HVGsQ6GkEBi3AfL64WYsfs?=
 =?us-ascii?Q?Ca7caHS0szLa77Oh2aXLYcwswpWPzG5A/0yFojo9mFvL2o3OFLTBuNReiYGt?=
 =?us-ascii?Q?Q+QZbPkSRQazl2+MVcftH0opKwnauijQJPUJDx3jHChAmPC+YT+KAfYrVX9h?=
 =?us-ascii?Q?NvSnoLzf/KXR4WFHPZ00WPpMu1VxHqDjaslwQwwNQf/b8oV74ly+5jsgcavT?=
 =?us-ascii?Q?N6TYPpoDdE9YuSuYP3JKWuDg347dgv9zJwvieEZj1fu2r0vGJWAuT8GKgk7f?=
 =?us-ascii?Q?99cGixDXijI71B6aMKA39PSVdC2F?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7047ec7b-9f1c-4ddf-efec-08d9925c3494
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 17:24:56.8797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 fpcX690FQJuXIo0+Fb55QLaCQqrFzPnLiCNyt5lB4IlinRZp3AlFdJvSEz9WIySrptKbIVELV7hhG2aqeKrLSgsF8ao4oTMJo3MLxZir08k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4321
X-Proofpoint-GUID: HhoeGKBQExm0HZVG-nOcBOW4crQv7orB
X-Proofpoint-ORIG-GUID: HhoeGKBQExm0HZVG-nOcBOW4crQv7orB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_07,2021-10-18_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110180099
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Oct 2021 17:25:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93436

"import pyinotify" throws an error for these modules if they are not
included.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta-python/recipes-devtools/python/python3-pyinotify_0.9.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyinotify_0.9.6.bb b/meta-python/recipes-devtools/python/python3-pyinotify_0.9.6.bb
index 049c3c3cf..d5e0873d4 100644
--- a/meta-python/recipes-devtools/python/python3-pyinotify_0.9.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pyinotify_0.9.6.bb
@@ -4,7 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ab173cade7965b411528464589a08382"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-ctypes \
+    ${PYTHON_PN}-fcntl \
     ${PYTHON_PN}-io \
+    ${PYTHON_PN}-logging \
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-shell \
     ${PYTHON_PN}-smtpd \
-- 
2.31.1


