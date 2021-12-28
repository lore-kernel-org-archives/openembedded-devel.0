Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D54B0C433F5
	for <webhook@archiver.kernel.org>; Tue, 28 Dec 2021 07:38:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.35958.1640677114984597560
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=IxqFnYOQ;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=7996075b3e=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BS7cFxj001166
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=STPuyCKp46ug49Iqwl3wL4cBJUGM3DzIoFnb3RMeqBE=;
 b=IxqFnYOQ8hDyxdhOxoCEXzS6B0FkesyBbhS1LR8imkjHaitdJe+sqvPEhdjSywgvkdPz
 uZPXaWAwOgubNhUxa0Vh/oDTOU7GrhpblXiLDe4zkFMPhTQPaffYjixilPNAzHZkm4VO
 fbBdpwI9doEvbjn78mWgA+ZRLTDu2M6I3q1O0/9fry6MUdBNbxzCjqIEbqTh2YFKfopO
 Tx5ij9zZ/8rH/RIlDxaRvARO7gmlSe6pCUCrzIg0P9hszRatK+wrrDU6ooYlyo7Mgom6
 c99TbLv8Zm6+sB1y9x/VHwhtWZ094MBTUSMYJy0tXkzQvMJzOOGBFoqHAnyjpKdOL5H8 9w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7kpw88ng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:34 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BS7cYru001303
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:34 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7kpw88nd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Dec 2021 23:38:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O1+qr8qp/I5/nPD3HADmKQp2JK/X4paCcoW0SmjvxmsAZJueQ1KdvcfFkHCc96Np+4BArKqpIARLB0qG6NPgU2lJDkjnLH01ie0oD0xYmQML1DqCYjPh+9DlKeG8wCEB95uhxkG3ZEzl3LEd4flgK7AgS1+1bXWfZz4JGPr23oi04UBDTHROHbXiqjnIbbcRwslKdvfD+/mZKYAvxW36+MtN745+2mhuPvd5c1ttrD1LqRKi0QAPHo/gGhsZngj89EuTkdCtao1TvzCENwHLbf8vc1BaMiZWBY23dciwFuYLeem4k7gpzdmW4q9rudxFXvMvUl+RhtmJJ+LLggvxRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=STPuyCKp46ug49Iqwl3wL4cBJUGM3DzIoFnb3RMeqBE=;
 b=Tc4BCRcPixq8RyU5NykQF8zgWaDYp7//g4fGdywVnT95FEjvuXbrjPrq5LO3nebtzjM+TF85pq4QHIqpa3UTz1ZqBHPwuTiBh2AkVPo9HURkg90s2rwD2gL52+Z8YT7vSPYF+u8qkAETiJTDGguqh+r7dm5iKL7XL6e6B8hbvDGWKy+FqRz0tiq4sn3x6bv+0pqevGpcfqVoplOhZV+pdPAoRrPLNsiNqVidYCtHCwoP475vP93zbnhXJWgdP6L7fd79N7wvqTZ8I+EWHCEAKxtqrPysrZlvTzod8VJdJoqopfq9DLbFevYrxnXVrXOnXUgRbHbCRvWqq4UE1Z7YPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1584.namprd11.prod.outlook.com (2603:10b6:301:e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Tue, 28 Dec
 2021 07:38:33 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4%6]) with mapi id 15.20.4823.023; Tue, 28 Dec 2021
 07:38:33 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
Subject: [meta-networking][hardknott][PATCH 11/19] samba: upgrade 4.14.5 ->
 4.14.7
Date: Tue, 28 Dec 2021 15:37:58 +0800
Message-Id: <20211228073806.868759-12-yi.zhao@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: b9708591-1649-4700-85e0-08d9c9d50cc3
X-MS-TrafficTypeDiagnostic: MWHPR11MB1584:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB15843730D5C7D3AEECC682D4F9439@MWHPR11MB1584.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CB6qoB5UiD6SPGjJTBJ4F5WNbm1BTpJzxe/trXgZOFvDft5R31RWPneJfjFPK+ZJ5ockTWgI1Yen54Mm3CdBOdfeQrg4wbqjgOD3IMXVKPS6E0ydC10uVoOqlv0USii4sCuuPJbPoHJoxmVIKmlTQgy8ga9PjmDTSNbwcv5u1LvKruC27CxA/9EtTWd/7u9ai2rZ+hLlBjHe1BSi0ibeo7a9iCQmk88U7s3c7SE9ONmUYke1zEiom9O0/SoyHm4PyD/hBF5eSyFeuOs9DAOwGXdvUqFujwVZNDc25ulVMle3cDwHaDp9kZpZ15X/6XwoImPjUua7r4Jnc701cLhSsXEOD2nv0lQiVyU+Vmkki2cJs6plCx9JwGaM93rHeBDsHOHhfxRHT1NktVu88Ggk54aTDrK5Kk0BRpU+fZmvjmqIlSyDZ+O/Uvz04be8RMoz7dx6LTENG2RaJWin9IAYPjOtOryFF1nlvtPphOCZouB/DGvq5DhcWqNZGeQGaHxibklNSqa3WrFk+PFKPIDbb3V9z75FS7RMGRQJQzxR5vInfqyiY/1aDHMgHsiqBHj/n0EWaw0MqG+U/jYPOulBpURy2gpvuHlI7Bf47Y34yoGIK0rfwEGaVud/kBIcaFLmfu+ot3YPoYW4lqLkt3crKgE9vzc/N7/FOrV+47c8AvfCum3GPKnAWWQe3KyAhZVl+NnUNk+FIRDcbXK5I1U2DJ9Qt0ZTgIg0UJ2rN56vVfVbP7VSqAOsWw6Ues0jSynaN/le5Yh9XrMRJW6sBAuZeGwWCZ3R9sNgc6lCLajb6ik=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(66476007)(66556008)(8936002)(508600001)(83380400001)(2616005)(44832011)(36756003)(1076003)(6666004)(8676002)(5660300002)(52116002)(186003)(38350700002)(38100700002)(966005)(6506007)(6486002)(6512007)(2906002)(86362001)(316002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EzmFfg0tQkTB0QjAscApTK/ceBkj7LuCaqSz5DyQEje1OC7ukRpWRzbanejm?=
 =?us-ascii?Q?3U/Szr4HrfueC6MKMJgCUMDbcsDYvun31YiMpHLTdyHouluaSX72RoVF/qPQ?=
 =?us-ascii?Q?oSP58yuKXHQPLqVwS7+cwR3qBPySzboWfhxqBl1lGs27MRG9S6poCAEH8tj9?=
 =?us-ascii?Q?z5EVqzrABwpzjmW9OvyKkrTwBDhVMpsimY4UWv31SIJtp6F+0V9kIjyGz+yX?=
 =?us-ascii?Q?0YpfmEgy8h6zcHXfwD9Ie8UFnQolA4GfRo5Fc0jM5Nd/T314WI2l07mbPxTy?=
 =?us-ascii?Q?ckVNHJgVCICX3T5WB80ymLtS7XbVjnb5WG0SvTqXJlparqh/58LWcb3HuO4/?=
 =?us-ascii?Q?OYX3noJfe7SWSsB8SOvWGKGC4fn8qd6ZBGXUDfZlrHAJ8ymP+6z+q2vaW4Tn?=
 =?us-ascii?Q?q5tfsXxx25e5mAn6Q6sVP0JZlP+iBQltAHLW8EzSenp8m72ncxrwro87Iq/8?=
 =?us-ascii?Q?MdKEUQNGJ37eqz5OVX5Ld2oZioEXCIHVks83SFerAxqAoevBaxET8Sl/Fn4Y?=
 =?us-ascii?Q?P8D/yvYH3bH+O8oGZIAQjvRp+ycp5OQ1AS8GIA0G5AeEqVSKfIqyLfFWdtdv?=
 =?us-ascii?Q?6DhX+IfZ0VqKj70n9XprYquRKhW+5RZGr4es8qAFR9G9k88LZXtCWx42fQHy?=
 =?us-ascii?Q?Al6KAUl3bcvZmt3/p6ascDagvFtRGc9Nb40xtn5bvfxye/i/B+YGN4QwZiG/?=
 =?us-ascii?Q?/KvTal9rwxXP2v64y6tQoxqgRRb7jimMSRH47P2g0BDUXEUvsnad/spoH3zu?=
 =?us-ascii?Q?ymiYzPNgKWZ9DLh5EfG0TwNsN2vwVDi8gDgTI+G4lN+F7qU5wzPt2dnIXtbH?=
 =?us-ascii?Q?Q9QcrIcB5Uwgg06C+BQD8RwNRd03BG9ybccGhFXfn4GqTliOlyfiw5r2Vpbs?=
 =?us-ascii?Q?HHE+YF7dGPKZA84n04cTeiKT8JEN6ws1K8KOFLK1WRkEvEDyfv4HWq5G9i1i?=
 =?us-ascii?Q?MKCIbp/cDW+x2kakW5j+Co0ZYgYViUekHBo+qv8PMw+mwllOfzZkdb+/DDH3?=
 =?us-ascii?Q?lYwvXe64MsYzfGNC6EBm/pcqXLfu9yorfehaAwM2qxasn8fP6VUCrWENsUNp?=
 =?us-ascii?Q?QJZG/t5o3fKZcu/entgTiiSGpqp7ZmVfHjz/zgZAX2PGrHm9jOzWlQAFuX0P?=
 =?us-ascii?Q?bxyK6EbMWiSIj33WfiMPxjXGnKqZJH5AZFmNLmsMnYcE+/MTrd09syf3UJpH?=
 =?us-ascii?Q?lj6kYEIOALZvMRINY+WNqQmWDTSXPNjIXP3e835kRVHv3F3gqh2eKNyFMD0u?=
 =?us-ascii?Q?0PbTsr6ja6et0nT+xadh8mxTiKyKlgZ7rFWczlEq8OW6cM3GC5wcoj+emJHh?=
 =?us-ascii?Q?Ic6QmWDGacEsn0WRU7FQypir+3cdyxi4r9DGTbipxz4gT6ozw4S2iEHyITyY?=
 =?us-ascii?Q?6vKI7bacLILuY3XUwowKM3+VTYbFiDxopWEI9LlEie4fNUZSm48suvVurTUX?=
 =?us-ascii?Q?rCObD7D3pxBW3S/uctSClHskRGgcvJo48q/oq7N1HrRau9OOPLHRuYH0YKFk?=
 =?us-ascii?Q?Hen4CWhypAM9S/fDvy7EgYJlUstj2OLYI3B2RiHf3VDRFsjIW6gmdNXdQPru?=
 =?us-ascii?Q?XONguSAjBJ3FaxjJV3zi+3xqgucwjK60JMnlE2wygGjQDMNHmmptvbf1v0+0?=
 =?us-ascii?Q?ohb7hm+IWv4Qdz8+RCLTs3I=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b9708591-1649-4700-85e0-08d9c9d50cc3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2021 07:38:33.0685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 dNWptyXvcXeOBvZLtP1n0bFGR/u7iXSUoHueehLEnhGa27lyoy5N36RmqJ18itV9ticSddljIR0dY+6f/7cXMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1584
X-Proofpoint-ORIG-GUID: b9TLDtJe27CzU2w7oT6RfKhmbraPg1JC
X-Proofpoint-GUID: P89l-Ghrc-ctgg7cOgjE1-U9eSGIMoFs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-28_04,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112280033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Dec 2021 07:38:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94538

Changelog:
https://www.samba.org/samba/history/samba-4.14.7.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../samba/{samba_4.14.5.bb => samba_4.14.7.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.14.5.bb => samba_4.14.7.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.7.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.14.7.bb
index 5c5ce3670..bf57cd637 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.7.bb
@@ -34,8 +34,8 @@ SRC_URI_append_libc-musl = " \
            file://samba-fix-musl-lib-without-innetgr.patch \
            "
 
-SRC_URI[md5sum] = "96d275e31387e6c403d6c16465d15b7e"
-SRC_URI[sha256sum] = "bb6ef5d2f16b85288d823578abc453d9a80514c42e5a2ea2c4e3c60dc42335c3"
+SRC_URI[md5sum] = "f0db8302944bb861b31f4163fd302f66"
+SRC_URI[sha256sum] = "6f50353f9602aa20245eb18ceb00e7e5ec793df0974aebd5254c38f16d8f1906"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.14(\.\d+)+).tar.gz"
 
-- 
2.25.1


