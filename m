Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5824C433FE
	for <webhook@archiver.kernel.org>; Tue, 28 Dec 2021 07:38:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.35925.1640677112427793634
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=SmS6Mm+1;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=7996075b3e=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BS7KalE016182
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=qOoVRwKpM8UjZzZLV9LtYN/nbTlQil3CZPqjzQjCqYw=;
 b=SmS6Mm+1GfGSR+TgUtYTJSaFFAKOR+c8SeFPeoCaLPzftqDsCE/KVLS0lRWfr4FipIny
 G3gKpvhYsp228z9JpMr7RIWFtmggESlC4L22NH1Fx1ugmOOfA2U+BoUCOICRoaaeZSHk
 EN7tf3zuAg8vgO6Jn27eETcO2BcoGmBc2lpCybOuUkh7SHzt/qC4AgDAakhf+IMYsHaw
 W77ukX+vxpN9KMdpBS7cRD9pmiKnAftqIWVM3MBBahyt7rCXlDpY4oA/OyI+oNnC87jl
 YSZC22ARoLP8mg1W/z5H3yvxlM5Hmp1ekEpyKgJewE66eAMQroZtwjy77ExCDP76u8cj uQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7m0c08ay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:32 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BS7cSJf015340
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:31 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7m0c08aw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Dec 2021 23:38:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b6rx94O1H7F1TTCI8pcplO2T8Oj2MQOdhMIrZSphUs2Occ4PRE37LEy0yvl3pKh7H0VQNWKej/0XZS6hSClYXIDYxCzcuyhxNpU3Zo+qjpDnCv9Pd3Nuu6amNWcQcOj8m2WHqRImkvMVkkpdV3d6gJ2bkcczFXoxlSpvzy9BZJP1o60C3uHCcM7eUcXchs/Mgz5vqpyv4IuHYsTIEamZVz7eQGLKZuhL2bLtRqlE7wv5JcoOlGoF+jrlapdBtwlpCp4gvA2yWYt1MH6jB8z0ZrnQuDFJtGaVcQu2hxXQv7hdgkwRxvQmLYk2qyI/2Jrn/eSvgR6gadMbxfzZsX+BLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qOoVRwKpM8UjZzZLV9LtYN/nbTlQil3CZPqjzQjCqYw=;
 b=HtFr7cdTIHSefg5Wjx4mKAI0NKiLxZzGaLqbU1AroRtFTWDcR8ksUne+bKQSUXt7mNaiPWaZupqWZpNxz9L4FdDhUDb/R478H/EZdzUbUJZQXuC0kEaL1h9fHTjOR8ctcGTahAOHvrFzVqUYxqsV8EuXzJjlsdzaMZ0z7036OKZshbjl/pgpuzmJ5P5YXg0uOW2U1hKpYVKS3rue6sYpnsO+uCv6GJzs+ZLWp6x61EljQshD6J+E3Kko0/PLLAJ/forjjCm+aCaz77k887XSOeWoFednrrfTJxHAwz2QTVOdotyJ6fYjeFdJ7OmdAx9klaZYl+8LJ/2XFGtrfKsALw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1584.namprd11.prod.outlook.com (2603:10b6:301:e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Tue, 28 Dec
 2021 07:38:30 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4%6]) with mapi id 15.20.4823.023; Tue, 28 Dec 2021
 07:38:30 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
Subject: [meta-networking][hardknott][PATCH 09/19] samba: fix shebang for pidl
Date: Tue, 28 Dec 2021 15:37:56 +0800
Message-Id: <20211228073806.868759-10-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211228073806.868759-1-yi.zhao@windriver.com>
References: <20211228073806.868759-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0057.apcprd04.prod.outlook.com
 (2603:1096:202:14::25) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3d4c89c-1c8e-4dae-4019-08d9c9d50b1e
X-MS-TrafficTypeDiagnostic: MWHPR11MB1584:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1584E443B230214357866641F9439@MWHPR11MB1584.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	S3gxk5H+7xMI4jUP4vrULk4OC9iGBfd/KuHtqTnBB1IBxja4rwjtob6rZZz56KpiC9FrD1XdroXmpYJ4/cTZ+0S3DmJzjM+ByECaTnykW/B3ogKdtGEpXnziUybZP/hEahKdycqaIlS5YSwN6DgHFWr4Ls0oQDs1vdE6OgRaFJmCrvfNVwsViFdi982xT7Ms4nq65WkbHhoH2VoyzCG+KUIP/3L2vUjU0Ki/0Yqp8fZHBpg019EIkGZCHp/1qDOa3KBTVldDfbPX9I0ZdCbh2Muw3NotpaVEsCGn9vFmFMHE5316viMpCDS5LyqigMuMI9SwmAA78ZHP1z3xDOQFRc8UQalrmUZ94zp95lx9ZuIzDJqMmuhnZlAmlyg3671GYYHUeMm9MF1hCBoMVdJk5VztlMuYI3kPpbCv4jEI9dMTeL4Oo+hXDwWo8/IUtHXHBWI64n20NEszFrH4oef86BgRKLeth8DBFrSiz7tdBChMKFi+FC80529vWPx5tHS8BhB1vJG4ekz3hNL9J+AXXruFQwxvIkJWFoSmVjJf2jSciOxKfTGN1IZTed2Ut3j8M4QIKD9g8EYultU+KUnrAcXyn3bJ0oX8Ki3d6w8DZr0nLgD81YcOR0hfSzaaamD8pTZeSAvPXJaSZ1R0+i+weApzUi70CrX8d2b7uPzHjE8aB0ycYXKr8O5/GptnWpiCvUappv6dWk8mCFOrW/nWIg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(66476007)(66556008)(8936002)(508600001)(83380400001)(2616005)(44832011)(36756003)(1076003)(6666004)(8676002)(5660300002)(52116002)(186003)(38350700002)(38100700002)(6506007)(6486002)(6512007)(2906002)(86362001)(316002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?c/wGHMi9b0HlqoyeAb+KknWAiYOJMMKvDZJYkGs9TxAKHatBaVtTpfY6Rq2W?=
 =?us-ascii?Q?Fg+RasWHsDAmdctDLHChyJBveiEgs8WDecMnupM//1Xd8q8Wc5qN8bi0xKfd?=
 =?us-ascii?Q?mer1f3L+lOFZg0bsYDwlFGm4uK3khQXQsMws3FfwWSFtos7qG3eTAASwY2MD?=
 =?us-ascii?Q?GI0ASmuiPqfxBMmHntTi6xKvGf6IKuKlU5yuIQh+BW1w6+HUXadLNMbLv6AF?=
 =?us-ascii?Q?jODdJDgcZoeYLVxD3VjsN1yEqNJJX989ilP7+vsuupGKvhiksxu/H+zvoat4?=
 =?us-ascii?Q?YNDTfdUrNcrOTX6h5ZnhqS+RKpUPDT5F1XKnVJCLPbkF0CxLovDDZt8d+zK3?=
 =?us-ascii?Q?BclyYayPSA6GqsCmc2te+scV8dyCSDZvyEbmCQMNN8yXmiP0Y+1MGS/+3NQj?=
 =?us-ascii?Q?bNt6tTOT0zc+CQnLlKwEtHPuWZCiFBQq/j4+1uxcbDxgEWDco1VKr9XLMPxN?=
 =?us-ascii?Q?AnllmLGcaBUSal+jczscGY8faBAPNSfRAarXpvSY3kdPYA/lrgDHfG3pi2K3?=
 =?us-ascii?Q?t64lFHQOFU/PB051VGaWTaY9Snk1n2Qc7swwR8D00+4gZi/Ijhuk+2D95oRI?=
 =?us-ascii?Q?1nq8hfBudcVq7Gs0LYE5gqS0llB9FRYzoCo7sAdB47wxcYiM8BFaDIcb5dFV?=
 =?us-ascii?Q?fxxHLBvCcWzi4o+MmI8ZKe3ZyMF/oFJ1fWzHoY5W4QCQUh81/NooCGMv90FD?=
 =?us-ascii?Q?QDhIODJZQ9bAdZLBMAr2nZ+HxQ+3NED+M3xh0q5TaTKPmbwctGthYUAwvvSR?=
 =?us-ascii?Q?lA8aXnxFcmaVs2IqXfigD5qVj+aFhxfbEGaziobnRKFjgWjjgdfWQbq2ITQq?=
 =?us-ascii?Q?549T6jHqtFh+2KUot8oiPoMBVdTqH6ZGpgRE8g/0v3UaKTmDbUo47hdymq+N?=
 =?us-ascii?Q?Eozsj66+ezvTC+6QAlMJrNwrUxVYtdXvHka/m4I4pO0Szi2Ss4m190X/1yAC?=
 =?us-ascii?Q?i2yRDJ+81bveRXkyVZqc2ltDsk1Q36t4r6LdlHt5smI3R+/ikUz+z/w3Fp6m?=
 =?us-ascii?Q?eZ3h10KWCsC4lxnXNzWqpc3Wn3Wcs2B1xKHuYyaeMfrrOmKIe30+JDLfXraS?=
 =?us-ascii?Q?0XACMFgcWWq4/T/fnY7mjDoJf4gxkThwNPETp1Xy0hrtZGj6viq8W4W1bfiA?=
 =?us-ascii?Q?AZLZocNOvLmEyUcKNLjyS9nN+35V27Dwm6U6qhEH3VFMlXux/oFuhcBGYZFj?=
 =?us-ascii?Q?oPA1X2ix7au4MWcpeujOfFLoFlF4nkqMVLPfMclEwPgRgSbApiYjiTiisnK7?=
 =?us-ascii?Q?oUEQA90+HBYZFr9oyiJxghCFNf1CDXnnJZWl7LTWUPLq2MCEww9K0iDADWe2?=
 =?us-ascii?Q?mToG/QnkmRXweNmWEGb4BkvYDEibmTIpmCHi37gAEPEI+y/xOUh1XPGuubWJ?=
 =?us-ascii?Q?lozlQqbUcQzfTdYxQS+KG4Wfp3PJY9nniCna4EXKFFNW7SmTTirJ8LY9lWxo?=
 =?us-ascii?Q?ks573aU5BuNc48h0C0299cIHfRlUdEJ2Vh694VUYnW/5xvoB9LvicUVsygMu?=
 =?us-ascii?Q?aM0gAyQWia9Wpb7HWPFiCVrHPOBGVX5lDQxYDXI6o9/TZmSmmKT2hKG4S94w?=
 =?us-ascii?Q?wANY0FO2BkKruJ24QbiqQUL3/IcJiOlbqZe38HPCZFYEYIJNavJhib3HkYGH?=
 =?us-ascii?Q?WBT3u/tIsO6BEXlknaOY1KI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d3d4c89c-1c8e-4dae-4019-08d9c9d50b1e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2021 07:38:30.4849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 L79ZVhN1xiPu+19IgGgxz+0bSos6fNVHobBvGIwzkHJj/4XE2dagUjpM86u4MGIjnSl0P8pgDTEo/07pgfZmKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1584
X-Proofpoint-GUID: fSGqUqxqlIBaz6Jh-kMjNZMD3gdfroOg
X-Proofpoint-ORIG-GUID: -ue8Akph2swi2aSRC2jtbtMr9fOcMBLp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-28_04,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 mlxscore=0 impostorscore=0 suspectscore=0 mlxlogscore=885
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112280033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Dec 2021 07:38:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94536

The shebang in pidl points to wrong location:
$ pidl
-sh: /usr/bin/pidl: /buildarea/build/tmp-glibc/hosttools/env: bad interpreter: No such file or directory

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.14.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
index 018bbf163..49259c7e2 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
@@ -211,7 +211,7 @@ do_install_append() {
     oe_runmake -C ${S}/pidl DESTDIR=${D} install_vendor
     find ${D}${libdir}/ -type f -name "perllocal.pod" | xargs rm -f
     rm -rf ${D}${libdir}/perl5/vendor_perl/${PERLVERSION}/${BUILD_SYS}/auto/Parse/Pidl/.packlist
-    
+    sed -i -e '1s,#!.*perl,#!${bindir}/env perl,' ${D}${bindir}/pidl
 }
 
 PACKAGES =+ "${PN}-python3 ${PN}-pidl \
-- 
2.25.1


