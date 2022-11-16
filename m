Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 786B8C43217
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 10:43:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5816.1668595391198540049
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Nov 2022 02:43:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Eeht7rNK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=831974c6ea=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AG8sfuq023910
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Nov 2022 10:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=aH874qsrmt7M1vlnwf5RB8p+Guk2Cqwl8ek/oJRvfdI=;
 b=Eeht7rNKDqL7uXkVr8VS67hD24TM+eXY60rNio4aXMJ3AjHmJbdUNpf/SxkXNRgPsQDH
 nsLx4Bq24Frxa2LFg9D3t4oMSPTtdX3c3PaspQeIqZbA/cAz0VuSWM2zEncL8lJSrThh
 7L6mMTkPk0msUhM1zThYvp0bePaGPFvxblYz9ERuEYW+VER8OvFQUCjsdFOAOHj4dRV4
 wDVFBM4sBPIfgVcS746Dw41pCMexU4TeReewUx1PTeMfyxnp8U0yTHWsH5UFUW+e8kaM
 xb6NnLvMq5lDwkysjozG+gG3ZhVA8Er77yASLeTw7cuYybOBfRmODYm6FX6OxjpwJ/in wA== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kt2fab862-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Nov 2022 10:43:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kAy2tjl+iExfW+yOSy7Y3NllWEYQ3eP7YCbfu41+q3ulMncrpVDDuOk1rjF6NWWCTu4eiWVo9pztUtftywWu/7JlR7kXGoVBaKc5Qabl0YFcM5uJOavHmHuEyr9Og+I3ONBAaE3l0n5jFU5/SOPX4GZt9IpDcenbj2UnevohAhH+M08TLufrGEgwsPesXnQtV70qlULv+Lvk5L+2paN6/e5jFDrarjI9KSTA+xLMya/LwaRW0oTyLwzZ4RXaj7WOaI4IeyftkRlHsL3sS2rGabxiDCpe5jvVy+28o6ArAk6YqYVbDB/yoKGZ/gl1Qb+O1roPMLYIBDIAlyTxJxPIcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aH874qsrmt7M1vlnwf5RB8p+Guk2Cqwl8ek/oJRvfdI=;
 b=OTPo62y7zhaqyc5UGiBJvdko/ZbNBM7RZSjh15Gvnr1NFXFwl11bL4Pq98VML0kOkukAfOujQkPososBGsbexdPrSs62lEAv+/CgiU21CQ5Qz5jVjEGeUYyGnDTqqbu/FIOrTolOrwVtUIAfzBfTD8V89f/dhbFwa9guK4tN/BeGu7/3TZkDbMsP62YVIGWN255FxG4LeEb/DjF8D+PSmMYwC2P+0SWUTgWqKWw8xhp331YSbTRWFavH1IZQij30iTgZJl7lioI1T9MJ7pwXXXt1GbxnYCYtPIUo7MycugXNGGkFzqKFoKs/E0m1x7FjwJUw2rLzZg0I3f2nrr69kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MW3PR11MB4523.namprd11.prod.outlook.com (2603:10b6:303:5b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Wed, 16 Nov
 2022 10:43:09 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::accb:b6d:487e:717d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::accb:b6d:487e:717d%4]) with mapi id 15.20.5813.019; Wed, 16 Nov 2022
 10:43:09 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-xfce][PATCH] xfce4-verve-plugin: fix do_configure faiure about missing libpcre
Date: Wed, 16 Nov 2022 02:42:52 -0800
Message-Id: <20221116104252.27017-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::26) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MW3PR11MB4523:EE_
X-MS-Office365-Filtering-Correlation-Id: 21109a60-6248-4bcf-21ce-08dac7bf59e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	I7+V5N3WJoz85cPULEoaMmRGIejKFb0v5mxacbESkOAz7LH/vfkXve4bWUFfBT1gZenZSErtZkA0MrtcD69+38raNuVuX+AZRylTfRP888iq602cMo6qNKOoI7JhFYlwmRxXiH0JTC7o6dQETeIol9oqPrEvAwO1VOb7tpzoOYw0oQ6jc/eyihuaHekqhCcESjzs7PRFOXvJhxkbpLhxIGxz5U90/bnIaQmjcId/a+uDZ2XZY8IxwP6ijeUuHX7I+E5RUh05yL12RuhDroqqE1g4CPbV0Ajth3dndOoqn4LixPUfrTGVUmkXGgVoewwvWAMyJ8j1v4VKUXxMoSdx5tcru4prjTbFLgVO28D5SK0mAxG/AdgHSYHCSyDTj2GlBtDPg+wB3OAbYqji/OBDyHdDgQcZ9eMvQGAGM59YBhgUq33o1oXL9Q9D1yBoJkZfgz616m5xshqmlwpZJKZclj3AYsPIJNiKj224S0TBW0kRju7melm0to2WOUHOogt9iltx83hW2Q3VxlKO3xm5lKEHWWqZ6M5HM8yuLQXAZTHyGn9rvfVFZWMeOxPlwnpyKY1DQ5mErHcXIJY86kOaE2ca0FkNZ5VdEngIcqk+ff6j8XdtoKz/IjD8ZBQwu4DFTrlOi9BPO6XfRecx0P3k224ZS9/rX62aGbpKKiW2fCZRh0HaRA8kmVNh8XqsNProN0SbCeBGhkR27DpmK/nDpc2VaIxaZzef8szKqsf/by0N6OjbZTU65p1cV6lPc0uIxzyADSX7DakkR7nAUxRd1w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39850400004)(366004)(376002)(136003)(396003)(451199015)(83380400001)(86362001)(8676002)(66946007)(66476007)(66556008)(5660300002)(4744005)(8936002)(41300700001)(38350700002)(6512007)(26005)(38100700002)(186003)(2616005)(36756003)(6486002)(1076003)(478600001)(52116002)(6506007)(6666004)(316002)(6916009)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?d4Y7TUFDX7xPMjYZPSS7LmAVFvfiY4/eVqDq+YHOO3YZ3WRWIsXq7BzvXr6/?=
 =?us-ascii?Q?H+jpLnuU5PYGXMrVcyRldP04DUMwhQrP+2QfIL9kpQrKVadIKJpvv6S3C1Lk?=
 =?us-ascii?Q?fMMiLt4gOAajQRa/PflTRj3j/mGX9f7FWQWdAwVGpBAEV8hXKRUBE6d1mski?=
 =?us-ascii?Q?2spSqyz0CA9uTNk5EBl/IYbxvV546S+imA1WMsknjSXlj6x7w9tq3bODbKCd?=
 =?us-ascii?Q?i0kymZaje06ILBSVMGzVujWXTVOPJgWU5ZGSDv+sVl1C918YVgL1OlnF0p72?=
 =?us-ascii?Q?+rUtPmrBjDc8LcLFKDsjzEAdV7wyPJ5GrGpUcStD9WpSDBkzi39KMLoU98KK?=
 =?us-ascii?Q?Ubgxw/C51IxFQK5RL3LJP+6ZxMhQRR8l0LoB1cVKL+LW9zSu+LiNZTgmIBn2?=
 =?us-ascii?Q?5VF4UVWlIHgn6ZTusyIzjE9IoUB7Jy0Vx8X5HqxOV8tB84ruWmUw4mhx8UqT?=
 =?us-ascii?Q?/I9yy53k7TRcyZmIH4tMAFbRGpcl0PgW1IsvjQmgwyrLyHctqE5oLz1olOkE?=
 =?us-ascii?Q?NB1E5gqp8CY1D2PhJbwpvbYrJlv5y2GXtNM8a42ybaEAwfwJE9n0q4sz3ln8?=
 =?us-ascii?Q?QP/r3j/sFEJdarxdMtxwmj3ohCmM2HQ1BM+6OyzAfYBNWWUtly0PXWNiYhOF?=
 =?us-ascii?Q?2d/dmN+JsGlQmDI3VyputxPSOiDgY5Qt+89bESXNrWaxN28Oez66SsqL1bSA?=
 =?us-ascii?Q?J39t88Rn5HGgf2QzjN+N1IkPebJu22asXzJ+Woy7HgozRyZHK+z3k5eYLV3j?=
 =?us-ascii?Q?bF6N0Bw4sztBkrTxTebgNuFKjuxO8iHDvzauU8xTICmeJStlIGn/HFyz26oy?=
 =?us-ascii?Q?WL2CbI+dd01wregcRHhTOcQ7kE7DZu3HLgfSLj7NRarriHZUk5z9qmRD/qE3?=
 =?us-ascii?Q?LaE+yDGrWamLFK5jAAkezDeF9W+Txul/bgy8FJW8Zf9EYBSYVHmnxHuGYDLC?=
 =?us-ascii?Q?5KWksMDE4kZcyqk7pa0Y7UTFntWFHmiaeJE8C7tfonVT+nnSc/DykoeV3cr/?=
 =?us-ascii?Q?zehebevMPmlE+3nxCTI2HlzWfdpslQCIx2Gr67UcYNZFwTfwghtMTS+lHkO9?=
 =?us-ascii?Q?A1E+UkXE7G88Z6HzIel1Ew3D4y6p8CKlqGkoImBLbgYv0c04V1sBHqnFabTh?=
 =?us-ascii?Q?7/M35RZpCtKLTcfNa4CMFT5PbV5XkT7g1E4ROJHjs/MCvRzrT4CwS7CEkEI8?=
 =?us-ascii?Q?/xbusgCLZ6zrHir3VlzgsMSPV0LWaOyPTcZs66efNOvHbHRTDEBk9m8RS3XU?=
 =?us-ascii?Q?t9YekXYOr6yOoP3hlCgorkNWD5zLxZMNmteTuZdpMD7rEVMzdjfK3WXqXZtu?=
 =?us-ascii?Q?vEeiqA2SKmGKouSwzruzLwr9OOB35tunKHCqejJASSm6eJnDkTPFuSGVR3tm?=
 =?us-ascii?Q?kKJ+5GNM8zw0/dME1C7CIxvYL2GBMiQJvjiX70u/MenpGV3rsW0hz0L3l9bq?=
 =?us-ascii?Q?OrgcGxLITDxCr79GjCKrnghaEkUF96PQX9RgIXKUgV6TBZhGrBgq6TQ5ze7G?=
 =?us-ascii?Q?71YtkfD80kT29Aco8/MGsyidwfJ7Dimzjp2+683gKaB6yl9TU6l0TLEzIXVH?=
 =?us-ascii?Q?pE1d5tp+WqZOIWHzkFgNCDCvtVm9wGJ1yBRAiVjC?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21109a60-6248-4bcf-21ce-08dac7bf59e6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 10:43:08.8844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ayyx53sKRce1UqaH6CR0l7bjVa+rBJ1RGmqcCeoVWpa3uqqYCn9KXr2QrCGlWCnyD+lVyHD+myFR1Ifw/4wFUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4523
X-Proofpoint-ORIG-GUID: 4jwHw-o0f0M8gMTq7T8znGLzONRUQBOc
X-Proofpoint-GUID: 4jwHw-o0f0M8gMTq7T8znGLzONRUQBOc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-16_01,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=634 mlxscore=0 bulkscore=0
 spamscore=0 clxscore=1011 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211160075
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Nov 2022 10:43:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99595

libpcre is needed. Previously, it's available because glib-2.0 depends
on it. Now glib-2.0 has been upgraded and it now depends on libpcre2.
So add this explicit dependency to fix the do_configure failure.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb b/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb
index 21bbda331..eefe3322b 100644
--- a/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb
+++ b/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb
@@ -6,3 +6,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 inherit xfce-panel-plugin
 
 SRC_URI[sha256sum] = "ebda5e5eb62d6e42afdc6f121d2f1cbd4d9d3c2b16a5e3ed8192b1b224b8f825"
+DEPENDS += "libpcre"
-- 
2.37.1


