Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A09AEC43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 06:57:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.3246.1655189848723325222
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 23:57:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Maze2Chx;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=3164603221=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25E6vQJk028000
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jun 2022 06:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=5jJN8wciZ0Jir/rzX7TdVP6kLVYVROn9ErAmHdOeYHI=;
 b=Maze2ChxuiWd+RQ990zW4QSX4Mb2AizN3WfBpNpY/+yhMEo/93pkvOm4N0ARFklcIhkB
 R8hHgJGumii/KEFfxJpuqOYhEdvwUNJZJF9YOxHRgKoqq4aGhSayyXaomFMB5lFpQOP7
 Py785us46+6XVxwxPE0cIJkfpGo+wbZhbq4DNXbTA5T8NuN1MTxuynfvvdI771NBUBQt
 nyjPGI4pBShH6QdSHXN3cUuNQkmNZC/k4keHhd7Mysvdzjov5ic7DmPPSMEx9Ptd6UNW
 RQqlNS4tfB+tC3DXZiVhU2P+nG6opo3wHdWEsKCc1bxjo5ofPpn3WKgFR2PcOj1prMsy 2g==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gmg91t7tq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jun 2022 06:57:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mj1gZQB+Qwn6T1rn3NEWRXm4hK/Ax4OZE9AkbbHgX2fLgCLDH3nnE5CuKMhbi8KK6RkPHeboZTKSMGKtMNP5h8GQBNf+8QVy2bCoax382PClfp2ljigFZTx1QgR35F32qX+Ykm7/Xl/vhxR9/dr9rBIg5MtU+VYyvVVawv1umo2IjukvUeqsctQ8c15QwjR6Eh8gOngvXFlubBIikPXJqUcGQj0/YfrDuh35zNlgvVrKoz9ROqzLOpvQhXfWElf+3tqn78YYw1X5H3ipsgnFcKtB44L5zhxIfiHTz2MzAnVTDuWZsk4ZPcEh16Nmo8VGmy+Trtnf78y44Ejp5mphNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5jJN8wciZ0Jir/rzX7TdVP6kLVYVROn9ErAmHdOeYHI=;
 b=Y1Fm1nBQ3p774baqDCqFncNoMtaK8xIO6oQ9PJ+Dp1SlSf5qhYe+l5t4v6luf/tPt2kQfBfdvm1yqpng4Zj9dt7KJ7ApyLWGtgGri4/C2gP2yo6DTHfZM0QXCvVZJz9GLcUfYWvvXty/ma5RZQnQxnnCgaYnAWGEjJfb1iN/kpIXZ1pbH++mphVk0JMb3HiCHyxL6kp41I8JGWbdDI3BpeAlZbY2TwsHg55S5k4NA5CjP0WIGQUrGV25281BTvHbO6f+IIafwxGj3kpHqRriZJ/cMnIXWweuhf2u9XUU0Wx9Kh5UYPOBXytIjBvCNDmxRKhX+nYLN2T5eSk3jCFjVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB4878.namprd11.prod.outlook.com (2603:10b6:a03:2d8::19)
 by CO1PR11MB5043.namprd11.prod.outlook.com (2603:10b6:303:96::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Tue, 14 Jun
 2022 06:57:24 +0000
Received: from SJ0PR11MB4878.namprd11.prod.outlook.com
 ([fe80::f853:6ffc:1879:faa9]) by SJ0PR11MB4878.namprd11.prod.outlook.com
 ([fe80::f853:6ffc:1879:faa9%5]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 06:57:23 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] evince: fix typo for RRECOMMENDS
Date: Tue, 14 Jun 2022 14:57:12 +0800
Message-Id: <20220614065712.986096-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614065712.986096-1-yi.zhao@windriver.com>
References: <20220614065712.986096-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0046.prod.exchangelabs.com (2603:10b6:a03:94::23)
 To SJ0PR11MB4878.namprd11.prod.outlook.com (2603:10b6:a03:2d8::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d37befb-7f41-4d66-7350-08da4dd3224a
X-MS-TrafficTypeDiagnostic: CO1PR11MB5043:EE_
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB50435DE5A7E759F4F0806915F9AA9@CO1PR11MB5043.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OUh7ClmgBjzpB3ZyHC2YdGjbS9+LKLz4chjWm/V0r6OvhcIadS2nVWFvWjzMkAdcn0mAOkpLnOvNHRXHpU5tFALhYyWgGRMHjVgjDnhDdSOcSYBCz6bP9ghnj4JR48zAJCOD8+yJQ7R8tmO0eqroFqsB0PtX0IfDbc5kj05piDeKPlDZOutCuYxk77YeBFfyy6bB9H8fbJEpIjYrqjwgcAHQBrXj3nib5talMATYi+WD/fjhVLZGIJdbSgiaoBqCsBYSJqtol8vvGTCVJ/HK49qgyaOYepHarggNfHibKJ+sBy3CkRiszq6CQlaXzCbfRQdWK01KbSV3x7iwAk34XTUneW5A6O5kaxhzUNYr+6PxRiH8lrvfprRexsXeIjH3fbmI5e13iqOBvG8AdUy3waBPJ4LtakUPnH5ucSi1uwDLl8tpn5wk/23CnAVokTDWHpPQbNTgg7GhaBSv0QyoT0Ezexq1mWqff+graonXmdUDhjegj8OvOZu4Vy19jcupd5g5CCxu6etg4D1mS0w0cEsPHi3sS6FJmP40cG1b0ZO6KM4h7PZCGtvmaRLfvKtMrmMPpi6Sib0rTyK4p0WHKknbdhf5oPUM8UZw0hLnuxUDhPU3JF6/pY2tz772r6Jh3l8SNp7T8dPRUyROK4EBIfdhBaKhfmNG++HChuxTZ83pboZWgvgfhXA94tEO64gcpFKCmWKY7j5pdr0X0m46Zg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4878.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(66946007)(66556008)(186003)(36756003)(83380400001)(6512007)(4744005)(5660300002)(1076003)(8936002)(66476007)(44832011)(26005)(8676002)(6506007)(52116002)(86362001)(316002)(38350700002)(38100700002)(508600001)(6916009)(2616005)(6666004)(2906002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RdtzjDHN6V0/8upElo+H95YULjPnWAsOAWFL0tfNp6lXCrrlrLPOn0o8fuWM?=
 =?us-ascii?Q?VbGRzmMt8O50vhwhuzt0zNFjCcXT1lYG9XTjj0UnbdYll4ehhUszTgzsWxid?=
 =?us-ascii?Q?KSwY3f7WtrNmZ9GvjugayJrN8XJvM4y7hhiFg07C0hgz3uip9M+50jkyIjAO?=
 =?us-ascii?Q?LpoxjBJRyqQ99q1ZhFejXqPwje4Ep9qCkLwvLbyHIKBkAORzTL5YCRBytYBO?=
 =?us-ascii?Q?pTch3C4s3x8/SaYP2MudcIfkaGblV978tP8LNEw/kk3cjbo/e6YBmmtDq20E?=
 =?us-ascii?Q?pVLzJHxvY2b5FIbmBJQNl7re65SWgqOeym8vvvuh2bSXK6SeDVW74GrUsGBF?=
 =?us-ascii?Q?IuZViRu0IR7D4OcBx+GwOPJIKMAokPSEI8PW0ZaFQByQdIqh12+bQtkgV+2l?=
 =?us-ascii?Q?C3sI1l6xmsHy7xWMl4U+gl1ZSnaFulin6gMecBxl9CHLwXR9qCVECRoBmZUN?=
 =?us-ascii?Q?/zMOCeOZuOR0MbfcLECEXpBQ0ax8em/6zhowZZcl6bUebOfICvIrDdrfAiyH?=
 =?us-ascii?Q?f+jX6dK71AtUDsPhfAjz5/zd8PklkoceqeZBFHVskcWRQRiOHIM8qCTPKp6H?=
 =?us-ascii?Q?suK11XfuZpq7MoRFpM6qptNGNqDIS8sD6bmUhSnfEh9MZMmue0dN5FH7I1tE?=
 =?us-ascii?Q?N43NIrsC/jbNHvRZfysjOyIboMT//Op3Eu0shmSSejPBEEYHinyYpDJBaOS6?=
 =?us-ascii?Q?RFjiC2RH75IvDbmbKLL4YRH1w7fUGozbOL2bj6U/zGc0QlmOQpG0toA6lxP0?=
 =?us-ascii?Q?FK5L2DSY9gebk9bfvTI2dPl+fMXSPy/C71WaoIZcQPoM2gd2RPAJcGYRgEYz?=
 =?us-ascii?Q?H1JrG70GoQu/sFtqHognCiaSQDiTsC33WMk94NpjL1wJ6/RqZwQ1M/RPeEVg?=
 =?us-ascii?Q?8v8ABOVNH9jRItp7/nxUgzgmoNYoqS7uX7tiap70XNX+wusdu3iz0wNmy7aj?=
 =?us-ascii?Q?Ta1lPyopza7m/HMMCPLaYvYcmkf8L+SczEPIp8cekBAY56FhaCApbT2RRQIt?=
 =?us-ascii?Q?I5+Jsxh2nk+10WXwfpyyBIJTFlc8QnWVEcVziGiwE92SxD9McaIVgbinPIdQ?=
 =?us-ascii?Q?PVaI/eKTopxzNilcEElmgY41teLT2BHF24qxkY3wJYIfql9H8G4DIAvPh0dX?=
 =?us-ascii?Q?OpHTT3ESUfLJFajtYF+QA5r/OqG/90Cm0OcgxPI6Z2ddUerLwE+wE9V75Yv/?=
 =?us-ascii?Q?gjOWtVLLXbVFbxYcFy5jN/3vqeoXhDeYOEwsOT7U5T/W/pWFWbcAtk6TOjIE?=
 =?us-ascii?Q?O32Tqd+i9xdEgz7X3EIpYH5/yjbgcICXEEE+wAfGUEQ2/l/4otdesr0L1FWe?=
 =?us-ascii?Q?hZfhEH7CVTo4skPpA2dDqEQzbQrnZgqHuRyzLRcE07VcMORhUC2btGUjKcOf?=
 =?us-ascii?Q?NMWt2qnuUTGgss2gn7RlEb0TDLG9tYX087QuKfMkEKIVdtMT1NKMWiER+BqB?=
 =?us-ascii?Q?6v5xfohB0fIqWkxF/pEV4xlxHel+NQ1W3qShalBBrACfWlzIf9FU+cOUdkKm?=
 =?us-ascii?Q?QGXG21FcuxEuLQCz7+OGCQ8zjyoUr0Hh//QpQsQVwOEXfNVtI1rjCwc3Q1Im?=
 =?us-ascii?Q?Yxfci3XHK3NyLblHnDCNs1JQGrevyqnLJkysr2sqGafwuwAhBvMx1pnd58T1?=
 =?us-ascii?Q?fviKWZJnxmLoHVGFs+3dWA0z9hydQp3iIoqSb7xJ1M+oLI/CCr/WNWEWJLia?=
 =?us-ascii?Q?oyjVyJt0M4KUtlcIo2wU7SIwBXJWnLyN1u9g8fJg/zrG6QD6LJGdFZ/NCGeH?=
 =?us-ascii?Q?XQBgVs8kFw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3d37befb-7f41-4d66-7350-08da4dd3224a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4878.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 06:57:23.8369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 D3Y6H1GCKfjvzkrHLo5ySKkTob3/WD95mSoA7xEqDFWrdfHgu/XVMz0x5/MNWC2chhdku7K3FQ9c8QNkadPQmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5043
X-Proofpoint-ORIG-GUID: GT1eE8lGtlWbDeXOKXI4RVbcI2jh1qi_
X-Proofpoint-GUID: GT1eE8lGtlWbDeXOKXI4RVbcI2jh1qi_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-14_02,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 mlxlogscore=273 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206140026
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jun 2022 06:57:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97506

RRECOMMMENDS_${PN} -> RRECOMMENDS:${PN}

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-gnome/recipes-gnome/evince/evince_42.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/evince/evince_42.2.bb b/meta-gnome/recipes-gnome/evince/evince_42.2.bb
index c9e5617e7..b84674fa9 100644
--- a/meta-gnome/recipes-gnome/evince/evince_42.2.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_42.2.bb
@@ -40,7 +40,7 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[nautilus] = "-Dnautilus=true,-Dnautilus=false,nautilus"
 
 RDEPENDS:${PN} += "glib-2.0-utils"
-RRECOMMMENDS_${PN} = "adwaita-icon-theme"
+RRECOMMENDS:${PN} = "adwaita-icon-theme"
 
 PACKAGES =+ "${PN}-nautilus-extension"
 
-- 
2.25.1


