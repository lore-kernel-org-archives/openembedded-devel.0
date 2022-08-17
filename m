Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B74A8C3F6B0
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 15:09:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.29775.1660748971273413101
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:09:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=R5xT15Wp;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=522867605f=saul.wold@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27HDePap003944
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:09:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=K7hzWDn3vC9YHSx3vggBGyfNJOffQoUixZgHbiCP6uA=;
 b=R5xT15WpcaCUO0LsUslgZKDt5JhQF766giA8Ej8SSvCd0RWcJfcxTyxURhdh4mxINOED
 GW77UOsS7p7nxSadipwwT9PZ8USTpHdIuYLD0DbPMHB4yyDlIm1WrsbdncfluvsKeqUh
 /AOZa9OY0lpf2apaONZz1DD5UhKsiysiJMGQEFw3gpmLqhOSOa0YRQhdwjhqf3isjhe0
 3F6X602WLUQcD0bYb+OVmgd69OLlVrOkwmatU6r+KJpv4dGxrey8e0l6NVLOcZRD/ypU
 Vw0kWDulCy0EUFsx3Q3+Y1Kpk6lbav0au4YiyEB+57e4YVQFvuBV4yOXfTWCN4czq1WE GQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx783besx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:09:30 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27HF9Uha031006
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:09:30 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx783besv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Aug 2022 08:09:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jA0UM12ghCPXlmbvOUAMj1pN+lDv2K21aSTyaNhSJKMf+/wW2ixtq+F8wODp2XulS1O2sZiDJT8bXpYmTvcRnHOHH3mB85HPswWPdzf6sad+41MnbPrIffAvw16OhAHFFw2qFD5u+tVsyKB9q+cXqJRBpARRTnZNXRF9AFgweekMqke/RemdpdqoM3qdw1MEba/WzBwrudCjAb4Hxg18UA4gElkM/st4Fx8kxX1iH/0GvKND8OgXG41/icMZlrGCuhBosHC2rV+ddj73n3/aS6MAQCEYlh4sCM4DzQDt7FTH+PiTiJhXSEPVcWmcKD41lblqjJmUqLnG9PKoYVu33Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7hzWDn3vC9YHSx3vggBGyfNJOffQoUixZgHbiCP6uA=;
 b=ckSchWC4yQbovygU7YRxDBcGvukf9Wh8aK/AC+dheAj69ibQ0rxhGJNciYJ4ocMQUt1uUEVRv5o7CdWPzWB3DAsPjXh/0+z4r/yADqJq3Ts508lI+zAIzY9H1PH/6qkhWuIvWEjkWLTwjHsXXzEpdZ9Dkkr03bimotI20wNJRO/FSebvIZOHHSWDQnujEVaJVOTV6et763q3j1RUi22tYKn/o2IwcIibSTa4ya2HibgYiH1ASdPfPMF/kagkc34OVqhaLF0i7giRyYnyxfTfbLmSd8VYcFiFIBeR5K5EsMbwaoZPf35Cnhl1rRMSJa/IovY7NIkFwr0g7hMXFwMDwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11)
 by MN2PR11MB4493.namprd11.prod.outlook.com (2603:10b6:208:190::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 17 Aug
 2022 15:09:21 +0000
Received: from PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::2db4:2f02:b7de:e4d8]) by PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::2db4:2f02:b7de:e4d8%8]) with mapi id 15.20.5504.027; Wed, 17 Aug 2022
 15:09:21 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Subject: [oe][meta-perl][PATCH 04/10] libio-socket-ssl-perl: Fix LICENSE
 string
Date: Wed, 17 Aug 2022 08:08:47 -0700
Message-Id: <20220817150853.2823101-5-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220817150853.2823101-1-saul.wold@windriver.com>
References: <20220817150853.2823101-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0035.namprd04.prod.outlook.com
 (2603:10b6:303:6a::10) To PH7PR11MB5818.namprd11.prod.outlook.com
 (2603:10b6:510:132::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ceaaa9c-3da5-4e61-fc33-08da80626fbe
X-MS-TrafficTypeDiagnostic: MN2PR11MB4493:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YvHQQizmMYnz3eSmSUaRxCHm6k406buvxisdFjlCb1XsDm9VcEQe4hMGGk4Muu4W2fyKNtyVYybqQKMQPINUm8TkpejLi+i+eSQwE1HLL2m2Pa8yqp+L1iD9r5EseT/a5z7yoDKHRBFdW0NID3NQJVTFcJhMWFAbJTgdNgdY/PAhMIkFgEfZ+P6f56JDz37T1cBDWqLspuwqf/Bk0EdEgZvPY/F8i01CGUxqMDucULcoOqa6EKrM6kP0baUCG+N+dYISvP2tBMsGMW8bj3/5b/b0L9lmUViVyolKybarh8cOoNMp/407ECZKzC+z27zv2jMJr5N0vMzH/8Ivh5dab3lNWuIjf66Qf9QefZEThHVW4m7RaRljxpbqU0yJozLy441T8pWNAlncEAtYUZPVDsQcV2Pml2cdunEtfZaIm6+h9OF0YbP4gfWR0ameTD2VMHso9f3dkEGgRA0+ye5Z6ODv5L0YSdAjfGkQkrbStC/MP9anW2RETas/qear65L7YJ3lmjDkyHE7b5spYwNeCb6Wp45NPGflFH6ZNd9nO6udv0vgxNAZsdnNAB87Wgc7dEPknmZIoeO46H+3xLuvnqhTGmn64QuPF/dg44n03e/BTkLPdV6lsUCFdcP9A6ASvtJGfcFhHy2im9LAPeet4djyNsYHhiJ61ohj5CMCaJQV7hR7DPpvFpyi09xqmEUeFmIv2IDUwJ0ypveZDMsrn04/5sFBbpxe465ZqQNbFhdMfTCS5pErBX6OFeUDqTuOG+g1d0sWT0zgbg5IXbFwz0NsPdSreom1GFb00hFth2R5sspLY/zykcYGcMoQ4h4m
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5818.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(366004)(396003)(39850400004)(41300700001)(4744005)(316002)(478600001)(38350700002)(38100700002)(6486002)(66946007)(8676002)(5660300002)(66476007)(8936002)(66556008)(44832011)(26005)(2906002)(36756003)(186003)(86362001)(6506007)(1076003)(6666004)(2616005)(52116002)(83380400001)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cjCPaZ8WantGhNYJhimAbtsQWoZA9WBHr9JOBMXnT/4rb1fmnmYCEdyO2jGd?=
 =?us-ascii?Q?iSH6ySSAjLd3ozvchpW53SNGuANvJ4U0A+gitdFHvyUiS5uXpuCvmBNkiWjI?=
 =?us-ascii?Q?fjJ6IrI/ufbNaV0H0CsFIxmxnYf+Cxoy5evPpUa2PtCZ9lY5s42SGcrSP+bH?=
 =?us-ascii?Q?HEEOfZbyQcPl51moK9VaIzd6ks2CXohLtPtu0VRH9nBCUErsBDmX+VmIE3Oq?=
 =?us-ascii?Q?9Yv0GkWH358lP3O1JDEi9dF/4RqIiFNR5yJNU6RjgmRzHtEgpSbFask9Jo1W?=
 =?us-ascii?Q?VAxiO85a/q7g2+F//DCV0JsiAn9zVG83md6WXkYqghPYNOjXBaXYeGuFBseY?=
 =?us-ascii?Q?9NIV5kwv2Z0CDfsGV5Z6KBYT9krMwAl064qlSrEBo24y/02BFEU+v0jSDrhI?=
 =?us-ascii?Q?9rk73HRTEQUNXnwc8ASYR74uoFE2whcOaoX9T5UrFVMsM6GH/WTaYEI0SHCN?=
 =?us-ascii?Q?nkFMLEAuD26zpW9gCa+OgBTAQFHFRezTr8IGZ4hneXFhs6cKEYtcxxcNDo8c?=
 =?us-ascii?Q?q/6W1zr3FAjTKe+5YdTnn0wW3xlQZ9R9WL9rTInHgiAIuneieSVgnXCNw9Ks?=
 =?us-ascii?Q?Mt2aF6l/FhEdfk7zXp7VpK98sn8ngq4z2uVr2zrbqf0uPmRYBm6RPbfsgrbX?=
 =?us-ascii?Q?RYn/QotMLpV7qN6jWvYHvtQPoBk89VdKvvaoML4c1Pad7hWH3se8j+Z9eY10?=
 =?us-ascii?Q?x1MzgqKktrEhhG8BxR259YRxTR5zQ5WdBfD4TiKnD1xTV2YVUCZ851vu0Tuq?=
 =?us-ascii?Q?EWXgAmz8O+GtuD08amD/AmTjkdH5vTHTmbv8AWPcFU7os0j2/KizYqhhQe45?=
 =?us-ascii?Q?FEKusTjz/tmFOM0uANEnnPqB1iOfLJor3uc4jcE/U8SFsrrSm2SSetUSpoJX?=
 =?us-ascii?Q?P9f26RMxs1u7HoZUk+C0MHnwwMA+gxjmv2y03hC06KfopYidaxWkKcDszTOB?=
 =?us-ascii?Q?wlfQb/OFBa+OC+O5jplvtsYN7NvzE4FSY8YeBIS20CjZGohHKczyDWv3EZAL?=
 =?us-ascii?Q?a0ExoynKTJwlK9OGtW1UJUc6On8moOZd2geTKvb3VCpuBl/RreaRU/bx67/T?=
 =?us-ascii?Q?aLkfG2/ZyOWKNn0WMawgGdX8qUDIpkZPP1b4PQjmA8soArG28NRHDBhYBH15?=
 =?us-ascii?Q?WXpfCHoZZ7mHIGYwPpgmGtUVCfIMlF8+/Vc/00M5wlzghAK1FBbT0ok8o2/P?=
 =?us-ascii?Q?tTHHv5mktDmJ7SYG/ZLznmCh7LqtiRsomv7+iWC4XZ8vEdvWEgsWxWsz3Abg?=
 =?us-ascii?Q?SL7WAUkAmq7FEDCfMiPzEFc5xtezPbLIPa/3X9dsy5zAI1vC0cOzacHhomgF?=
 =?us-ascii?Q?uKODpylCrVfKWQ02nLLtRRxSBkV7/v40KUf/LOe+Wm6WSnA9kkME7oUrMxWn?=
 =?us-ascii?Q?kmWptfdauEsgwPAML8ATzZgM8wHQk3d8R49MZ+6rtgSQEDKb0Tu3s+FzTytZ?=
 =?us-ascii?Q?fnL1HhZ74+00pj7trnUspb5OioNILmum3NJy2aiihkta4C8mYq9v1VS0sBph?=
 =?us-ascii?Q?salxrrAWUz+47rw13ukaij72gEhjU+XySAL/kRz3FFBy0sF2oL5bbzkTuKV0?=
 =?us-ascii?Q?Gbme1qU9Pp90QJEeeunW9Ep2Yq3L4iad0G32vEffoQtv9PlMh///kygElWnJ?=
 =?us-ascii?Q?AA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1ceaaa9c-3da5-4e61-fc33-08da80626fbe
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5818.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 15:09:09.8939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ENpMSTD9DOsx2GiSNZGj0/efqxJwXzNvRVqk5p6SluszGK0f8i/Jd7eC5hBl47NHcWBAx1ppgIUaW07CbFdVUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4493
X-Proofpoint-ORIG-GUID: z00jUuP9JVdsxxgDVi5QbdsCbzEZVBOs
X-Proofpoint-GUID: NKwxPXB16NfCnof3BxzmoAYA1f2mA1Mt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-17_09,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208170058
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 15:09:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98299

The create_spdx bbclass does not currently handle the lack of
spaces around the op (| or &). For now fix the LICENSE string.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb
index 1d04f0054..6249fd1d7 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb
@@ -9,7 +9,7 @@ mod_perl."
 HOMEPAGE = "http://search.cpan.org/dist/IO-Socket-SSL/"
 SECTION = "libs"
 
-LICENSE = "Artistic-1.0|GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://META.yml;beginline=12;endline=12;md5=963ce28228347875ace682de56eef8e8"
 
 RDEPENDS:${PN} += "\
-- 
2.25.1


