Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E4F0C636D6
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 14:57:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12429.1677164216953740369
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Feb 2023 06:56:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=XpXHiPUy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=141849fe7d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31NDfLkF023783
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 14:56:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=AEWGE5t6xC2Hsej/qHBlpMWLoDWBkVACgYLtxCcWDTM=;
 b=XpXHiPUyF/duCVoqBwKBF4GEoSMkuXTSZxuFEv8U5rgLDK4Wg4iYoVpN6gUF6a+oundn
 YUsjrV+qRMK9sS3wO1TMcfi8mxOk5TfIHY0kBofz5nbxfdrcd0v87cjwF3ccrnBVKM/H
 u+W/s9Iq7KqlmD05pc+fvWO3ME8WhtgmuSxrCFV9GgK+JfL1AMIIotaMasLXi5Igcwub
 1aIx79Ffzy6QW4F/dw6HEQu3R/k9E35q0wta5NKgM8vn+q/e8/3ES4GfjNmXYv/bkkyc
 8M2Zt1oLCLzwtkpTAw9cyQxAxzyUJlXuYO7RoyD6M8zZCRqoz2qKJU6EMjF6wAmOo0Wi gQ== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ntpd3vuq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 14:56:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cvTtItJrouxUp+CKXmpFj7DHnGPq3sCEKXnkBQ/bSjEzWjzsAE0erHKGZC0pgqU5ObqzjPOutaPmkhz4v+CdTmDCsb0bz2IOObaaGEE34+98/9mpBag6t86TcFtTw+LtEN8cqcM7IeveTD4868qUjLf+ZR/TdvmgjxGT0WSupqB4kJuovvrRChpe3RNx5dO7VFxc8WMaffu7DDHmEdnKEZVg7ij8ti2umxZsPdDXSH756h9izxPwcYoTrXN8F5cN5rqUOmwk1If6njVANNdb6gIXtnlOLZJD4Rkoq5VPKicGrCfJ50LKMCNdifF0Q+UowHb3RPP376P8KK4u41+2dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AEWGE5t6xC2Hsej/qHBlpMWLoDWBkVACgYLtxCcWDTM=;
 b=nyHPpo2DPdHMfl6ivM+GMXKTE30/juERUKa9C6ryUIDU9KAmTn3PXs380VmwkdOEBC7xrCTgprHbaIGTG7mYBxNSw6EAPmZo2OCRdJK/i4qFsio41y7JcC4LrSH4xpuk1M95fldSdK6gQ2NmhBfH3frZgnWDzZLImfmjpkOAAt0f87brv7qc3/Ci53UM7CIeuEuyagze0wmRB1aAT8JPLouAikUDK8hdsz1zga0JrF9ipAUvPDNZ5vlavt6usVZaLUmCxuUP2AKIPjNiWHBU+vEnQKczOx2nQBqtUjeTgf/f9wSEmF6SLSYQc2ZKQs4So21O2xTlbWfWyzzZQU8XtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by DS7PR11MB7888.namprd11.prod.outlook.com (2603:10b6:8:e2::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.21; Thu, 23 Feb 2023 14:56:52 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e%2]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 14:56:52 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][PATCH] apache2: use /run instead of /var/run for systemd volatile config
Date: Thu, 23 Feb 2023 22:56:42 +0800
Message-Id: <20230223145642.2426793-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:a03:254::15) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|DS7PR11MB7888:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d322bbe-fa8e-4747-7444-08db15ae329b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	A8O4UKy7ptB3t7ngvs6RlsKpGwDYEf/V8TkCKgkbTmDf/ojmrVH/Wlvqtr4uziM5ZKjGVVzhtYsb0F7/hkbikuodved1hXGnizIgL2VWkd5ubqVUxuBfLBm10g3AnM660B9pPXCD+Fxftk+wWievkWyfUzoLOblTJwfGsPLDClrzi3il/tDkpYJbiSfpWx0xfxsRlc5U2FWv7kFx8/smePKhsc/BWIaKGbrT9MaeSRCowSoA0EOCqvzal2J64Lf39Ex5djVFbPnpXfJCkRlNESKT9QXMP8aQRJdesrz90zm5PQh4kZnN1ePkOyuKyZ2fdu6K6Cd8mTNVj60ZYtL64FjU1ZN8ICFmz/w7ZVRuZCfLeMs303A6KUcmW8jnvTS3yQp4RQGlCR3clCOAe/x/48dD9xiMCGrd9esVXvpB4rdqbNyiX9rExCeQPLSiREeUeLdyKI/xH91XNHfISuCq/DtwR9/31oQ2BISkC7XnLYxZq0ru6cmSTe1BpKLhVtPN5SGfTYBHTLe5uYK6/+FT+4i10XSc75ABkYFqaUI/VzcjN5hFYXK8cd0KCjFbp9vn3b32n1QwkUS3+aMIxmSry62n3fbZoprTfb1J8bQURKkkTxT08umwj0gSVsaVOCsXbE+AIMfOALupmZ2TzJx1ZAhnGtKkMK8u2GAAO+HStQKf+mGjIDEVCTHQcL8vU+OhJoB6NhGnieABBalbIMYZMw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(39850400004)(396003)(376002)(366004)(451199018)(66946007)(66476007)(66556008)(83380400001)(8676002)(316002)(8936002)(5660300002)(6916009)(41300700001)(1076003)(6506007)(6512007)(2616005)(6666004)(26005)(186003)(478600001)(6486002)(52116002)(36756003)(86362001)(2906002)(38350700002)(4744005)(44832011)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Y7egS3tmi545orkL4Gk1Kl3aoWn+Y+lqZGRhLCR+LJFrt96ppnHRDBO409vo?=
 =?us-ascii?Q?lI1tiqbEhtg40tT99OutTuSfphu+WT8YgpukIyy22Ude4p8gjmJUxzL9Ymi5?=
 =?us-ascii?Q?fDALmftMgrGRoNCgMaEsJhf5nzsCdH1oCUmPHn5Y3q8tM3a27tvbryu6MIXR?=
 =?us-ascii?Q?ctBoVZ3y25tdQi+H7zLxfwSs+lnqh9rkYCHI2GgV3lfjbVuQWn8RjyTq9uxh?=
 =?us-ascii?Q?T2GtFEgAvpA2qzs9HZGLyRNtRn7izJZxG6elXxP0oCSaSalJcEUZYf4jpDmd?=
 =?us-ascii?Q?zSlpX3O47tKNFV2n1//g8pJTdR/V5YJ3l3+wpEcdn5ZB4Bkk3emFgUdA2lby?=
 =?us-ascii?Q?Dwdamzw5fm39a9Hq5ELT/eJRTNDmXmGagjSjcRt3oNfJGWGsYggizB0XWctN?=
 =?us-ascii?Q?ZSp5IFcpcyK2crXRzBoOuDFDp7TrXTVL6UhWpMQ00EPtm6qWw+h3nOC03gPS?=
 =?us-ascii?Q?vdr0/zUt6hPYacZHxX++RByh7SXBL+bzSg6Gq5DGqCbYrdJZtfa9hadSMFWO?=
 =?us-ascii?Q?oYkJ14318syJUkU2Gi3TQkg50a7sDRhVsNXG9JMynrlkGgjTPoISLJsOTq5F?=
 =?us-ascii?Q?R/ylTz9kP+Pn7Vn6X6DXxIEgD1aOBr3apxb0cfgGepHAscXFtDePUfIud+72?=
 =?us-ascii?Q?ip5gLgPQmIkcUkn6FhWNjxtmkfu0rJii7cu3UQj3lwBditEanRi4e2tfplgl?=
 =?us-ascii?Q?CwzGDrWL3amUUY9PDCZK8zKmceMEBYWaet4JjhkXqoPGkWtFLhn3Xgv574w9?=
 =?us-ascii?Q?7hlIyvYHw49ZkUMZIgM3uhZT/jC0t5i9G0gOmBQjCNQ+I7iZUhrnIxsWhiPQ?=
 =?us-ascii?Q?XFOtCN3Z3euyaXjbrkn+0FQ8SGkWGwcXqIWmzNUUuTYj4YtjLmu1KgJgDgnb?=
 =?us-ascii?Q?dnmNuXtM9DBoKBNl27Dq7GRfO4Iw5yGSQvIa8miMEGRB94HRv31F6y8S8nJZ?=
 =?us-ascii?Q?6lTrEivZJcVyYu32GEk9GYYJ28v4q5OXiotQBA1ZLm6/O9khbz9t6sokOcXM?=
 =?us-ascii?Q?2YZMwv1aKaKuVneZWFMrjsKbY+woXPavxwQkJO7byC8+fdw6VPm7zLk4LSiJ?=
 =?us-ascii?Q?3V/OeIwug5s/D4tAXKmewt/Nm+acm6J7wCK96HYxhyGb2Px7JPRvsLs76f9T?=
 =?us-ascii?Q?6uOneLTlpH939Ni6D4jUhdurra4tINkNYN1jTjO2lxLichDUmGr+Ii4UWLrs?=
 =?us-ascii?Q?tdVy17SgIp1RgQxFBOs8V4b4NHyGAWt/gFBRqxhpgnuQemzhywwZ+j3bf/wR?=
 =?us-ascii?Q?3c0ylzqUcOLii61qC3+Jk7fnnxWR+bTkxeryvqKbGcC1xe0JxQlo5pzk3kyV?=
 =?us-ascii?Q?WLgZW98tG2kiUXZ9nnxQFrWyW/OA6TVRiHnnigTI7eCPY4nwggu/qZUUJq9G?=
 =?us-ascii?Q?s6WER60oohQq7wiWqMRpm01iD02TBI9k9GHQGuqFvKKz/vZqnrMuuQhz96rV?=
 =?us-ascii?Q?REQZmhnpGCWKKm5++ZKa6E0wd4UCWMgvceKvA86s+EVa+xsEZRq231YqVSlX?=
 =?us-ascii?Q?I1dzSAYcvjVGkXJPZxjLfE0nn8rAJ9AImnRZydsLJ+wzoZv0N8wvVfarQ37r?=
 =?us-ascii?Q?UukTMU3609JKFj6/IUdj/FUjDXs7qNilt1Ixxlw91muWzazwIxlqqFx8OCYT?=
 =?us-ascii?Q?wA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d322bbe-fa8e-4747-7444-08db15ae329b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 14:56:52.3857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yr6rE46LJ0weWr2+RYZEH/hxBdv3mz9StqslzzsMgDYkmd2/ft5oZOHGYQf9tTiVEEBXglFL92qFVjo0lf1GsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7888
X-Proofpoint-GUID: _ZvR4Px9g4ATqZSRP1DucV5p02cVQTaY
X-Proofpoint-ORIG-GUID: _ZvR4Px9g4ATqZSRP1DucV5p02cVQTaY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_08,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0
 mlxlogscore=958 clxscore=1015 lowpriorityscore=0 phishscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302230122
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 14:57:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101234

Fixes:
systemd-tmpfiles[181]: /etc/tmpfiles.d/apache2-volatile.conf:1:
Line references path below legacy directory /var/run/, updating /var/run/apache2 -> /run/apache2;
please update the tmpfiles.d/ drop-in file accordingly.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-httpd/apache2/files/apache2-volatile.conf           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/apache2/files/apache2-volatile.conf b/meta-webserver/recipes-httpd/apache2/files/apache2-volatile.conf
index ff2c58704..0852a8859 100644
--- a/meta-webserver/recipes-httpd/apache2/files/apache2-volatile.conf
+++ b/meta-webserver/recipes-httpd/apache2/files/apache2-volatile.conf
@@ -1,2 +1,2 @@
-d  /var/run/apache2 0755 root root -
+d  /run/apache2 0755 root root -
 d  /var/log/apache2 0755 root root -
-- 
2.25.1


