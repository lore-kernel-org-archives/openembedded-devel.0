Return-Path: <Zheng.Qiu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF299C6FA92
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 19:57:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.489.1663876651296894695
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 12:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ZZubPZKG;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6264676107=zheng.qiu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28MJgPrU027327
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 19:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=H8twGsuF9Xbf5lWT0dRYOOwB4unEerfWC6Vy4x71xYA=;
 b=ZZubPZKGr+0wkiMfI4hSla7WtNKTf/kNMnLqEz90A3OjRGlhZ/J05x7VlzyleytJx5sS
 D50Uji3FfgBgfbtKpUxnVcjo7aEmiSpYtz0MyRf+XdWHd3BmR2b1xkY/0uZLo8k7Fcxi
 59XeosKffRs5ZL5GTOaCFVXvJc/Ila2T5kzoF6mJ0cPRydBm0JzB2/K+ZHOkRIpZwvs9
 8ho0Rm309xD37pp02XqjgHv9eNd0a0/ZN02zX2OD3hFqPHbxkzlcCIHaYo6YLSGujFkp
 NB1ccqHzke8U/3Zj8kGWZ+S0TiHF/OUDpNrDvXUp8GHxRlTsivSSbCkxv9Nm3ZVhdOVn YQ==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jn57a4qva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 19:57:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fGfATO50wBidcEsqRDYsuDXzvMpDSbhtqqXEd7Bf7dUZdcyzWf62jduKuyG4j6+jISU+253kLoPyai45IzCf1eWgyBLx3aywhdnma3F/xTcSBLmOULKNKsdrDgYmRMRD835k33dWbNRlZ2OCfCJvO1V2NiLkOoLALAuuu0TJIbDEezsQNX9G6zjhyxvM9Vfqnv8M8mA5I17b9BjngWOFq5Ny6saDhrXI8+hcAnXnumRHQ8HYy5lRG1s9ssgK+LkA7/6iA0Pneur6XvaSWRU1ndeFXTe2lKhvccLKYvlOfLZXphSD8SND75NllcffIR283giYVH4XyOXPEfp1mgi5cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8twGsuF9Xbf5lWT0dRYOOwB4unEerfWC6Vy4x71xYA=;
 b=I9Xv/6TI5dIB5JfLYFsexKF/WcT1GN07m1VxZqNvTzDDbOztURkEnFkCb5B1ErPIU8NUDRIn6MjRa6NAQnm2v/SNgLMSYIUsT5ys1mirdFO+Kbq8rtI0aLvzrvjA3SI1AUVH0MN8xzhUNfttKSTAnEdtcgpRhrhQSRR8lN1hq2zhMSwgJ4gJC/WrUwjdPmauiyad3KTBL7FY2BtpcRI5P5R4cYGlWKHFN0XSIr8aqTnsNPiuLA6UQ4lEPLdGE2X4+oH8H4VV76u9ysphYixSPpPxQ28Uew1LLec/JmCrarfq95nQM+w38FJ2kV2YWdFRXP7dhy1vhXog46QImNzpbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by PH7PR11MB6553.namprd11.prod.outlook.com (2603:10b6:510:1a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18; Thu, 22 Sep
 2022 19:57:27 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::ac28:d65e:ef3e:3635]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::ac28:d65e:ef3e:3635%6]) with mapi id 15.20.5654.019; Thu, 22 Sep 2022
 19:57:27 +0000
From: Zheng Qiu <zheng.qiu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: randy.macleod@windriver.com, saul.wold@windriver.com,
        zheng.qiu@windriver.com
Subject: [PATCH] rsyslog: update 8.2206->8.2208
Date: Thu, 22 Sep 2022 15:57:12 -0400
Message-Id: <20220922195712.32618-1-zheng.qiu@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT3PR01CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::12) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|PH7PR11MB6553:EE_
X-MS-Office365-Filtering-Correlation-Id: e47e7493-aec3-4770-63a5-08da9cd4accc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	B+jZQUvfNNUtEyjUeVZjzdzxoGbVtAUudFHkpdmb3W2mzYhRSMrjAJgBCwdzMMj+xNF5qL3y45Hd+OqM9JEzmXmyR0+MwDGzc6liiwFdUVbAr33k/HE8PEzWkS3C7Km48SMFZ7yhW1YRjvoSq4l9NCThftf/ZnhEpEv239pl7/QI7RhsWLJDetMmU8RBd3idNmdqLftkNv/y5WbOT3eABPPyGjwh+y+8xqFxODFCam4/Uvv4E0UaVA755b+WgCw3Ibud78g+COKmSQL+RgokoKXquwLOEd/rRyXG+j7YS8Z1HEsNztH9wKburUtgrVgBEtppzbGHvIfIknCRqhzK9F4rmaAw/y1nbZJiuCuuPgwZLFppJRa6CJrvenYEJEVa7OPsxuP+IWkE7QveU6FfZZ6uyQrQe4SzucVvPqqzZYU4Guiy6hVubkYcmF6GeikacsmnKMd/C/LEpXxclxAVaARgMBya6jfSYIHFjitVOPf9xCBL5RXbvV5/ATX9GGZkFkb9RuIFUBqVImAtApCb2DXPqejdrOZgiZ8FWE4bAP9nZ35gWvd0QbCpeONgGyizJdxKb5hN+BHa3RRFgchVYFbPX+oubRFtEmdWlNXzwg1fFMYOMBlLxBoyjlLDCYs06HcI1VsJOTuhtAb3TOo8yhiLo41d5GXKICYjCmEfTNbjk0GrkqpWHE94GcjjSUiHujij7yqTf2Ph9xfkeFQR17gFnda8FE6a5sNV2S4dnx6QjsXsz4yp/aMWomo9VXq8MPSECvwTs66h2HZ8qwwRaq+i5+FEN9m1JORZmeWsvJ/DuzMi1l/Zu3wzcxsSePUyW7sFOhNL0REZktDBSBo8Xg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(39850400004)(376002)(396003)(136003)(451199015)(83380400001)(8676002)(66476007)(66556008)(66946007)(4326008)(6916009)(316002)(5660300002)(8936002)(2906002)(6666004)(15650500001)(26005)(52116002)(107886003)(6512007)(44832011)(186003)(2616005)(6506007)(478600001)(1076003)(966005)(6486002)(41300700001)(86362001)(36756003)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WfO5vJc2IPJXCrxozHB4AieGgO792dJ1eo8xYQ5iCca99znf8bAdYvJSbYRK?=
 =?us-ascii?Q?sa+elBl2hjoXVSAM9SmY4QfOAx7iGBRrQG7HR1hw635kQKwhVQID5TXQlI9e?=
 =?us-ascii?Q?tQBTe2bRE7qbGShnGV+0BAHKaUrlqIZh29mSV5nIsLR6LuEVAJ4jmo8dJlYD?=
 =?us-ascii?Q?BguI9OByVG7D3/SoGdfaK7chdrgqHSeSpEnN4cvLhrtJhj+4GPjvMbn6HErC?=
 =?us-ascii?Q?Iehor1e2U3eq/SMx3w6VCCgWbba80B/sMwl8QDP+V87xCu8cTxDGPGWIzk5f?=
 =?us-ascii?Q?JormMxlX2zoWikxyKLR8hWa1Jy+n/LcCKvErnKrJRrNGytARBPoBqXSZqFRs?=
 =?us-ascii?Q?6trBU170aHiX16BEE9ImAuNLoWHuM1vP79mfg77lI74aBiHwqeisPwJ9QebD?=
 =?us-ascii?Q?wwLGAtrqNqfoWrUk0qyUTbu7zdgINva0bovv1pz2L+CFJ9wGowhPdQWI9upY?=
 =?us-ascii?Q?WIGcUbm68LwgdH8oGB93ypPnW6MsCnzK0gXT6PdQTqsbUkwoGT2mXP29fBJY?=
 =?us-ascii?Q?8MShsXEamOqWnLOHWCrm37ir98OWqKesQYtdCs6DpT2N+9iE1k4Lx7FZsxpr?=
 =?us-ascii?Q?fN/HUnlt0UMTjJsrKVBK8qAFxSQE7gB19tkpi02Ax8F0EQ+N0iYRAJkWrQ2D?=
 =?us-ascii?Q?/rIJR2SHQ/fmGCMNNdYDDDDVzIdOmMQxE7i9nhNJnky3GlXbvKbkFLZTUFf0?=
 =?us-ascii?Q?CIqpYj/gTYVCjuoB+lM2aYKLIsn6qpR/8qS0Vy2KV9lAiUSFUt0KEcLKoISs?=
 =?us-ascii?Q?avtc7Wz12hyJL90v12a5UB0d7/RxG/QlXTW+tn6xwlm4ilgb8HHzqNG78bRO?=
 =?us-ascii?Q?opnD/S/+MR4WEsTIs3wSOFjfQi3QzOaDzZp0AvRHWYpIgchrwjqCwBPjI8NU?=
 =?us-ascii?Q?SMH82+OT/3qL6AHs+KY9i2DnvTPvneGUi3Mhim1pPW4dLZGQWUfY8BviiOtG?=
 =?us-ascii?Q?qsIJFi74Bo0QQxzJYvBRTAEduKKmK0L1UBdvg6oXG6+EuFrRVGUAvVle6ka6?=
 =?us-ascii?Q?WOtT4v5yy4O/eiTP9+e1ndPcIOWfmCbboWYukX1lj91sjejIWQAJM1uVP8v2?=
 =?us-ascii?Q?eaRzcjnvE06Wu/CnX1J9ScE57O5z+QZrB3RnFwveK5T8K3aRWPzC/I6zw9EZ?=
 =?us-ascii?Q?Pqmc5RC//J6pOjwyaudP2xyGFB0Dn++GFfuHR3tyOYYqUukrv0SBBrjaH+C7?=
 =?us-ascii?Q?MiI34G03LcwGK01QG3y7GW4UEeQY8x1IjLLQaB/93vylB8mMQPYwvDZ+UKFJ?=
 =?us-ascii?Q?afYoMh+a0AxDeFFdO+I7XBdLBpi3lcEQVGLInObJLFihMp100uvOFXviaevX?=
 =?us-ascii?Q?USaK3jBMNZNPoR1sUE+s1cRVJO6vU2S6Ma3i0sWnC5ow4HqJA9cEr9+aYNka?=
 =?us-ascii?Q?r+x45UARM0AknN+oOqIyIrEEDDVa9p+wfCGFAXeQRG0Z+uiNYlAqfOxOzmJb?=
 =?us-ascii?Q?IXekQP8m/gl1+v4IfXl7YrUshTC82ZpAQC8IzobhZ37qvSieWA0zcKKooaxQ?=
 =?us-ascii?Q?Ev817uNv660VzOsffLWepGqBv7E0HIyTSUFd3LAXgFde1+OXAeAvhG6snwUL?=
 =?us-ascii?Q?8iJ1O8l+MXmqnYTdVHzZA7BKSc3t85BYvr1qZh05mhLeJQ5I2R5swQCzZVVq?=
 =?us-ascii?Q?NA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e47e7493-aec3-4770-63a5-08da9cd4accc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 19:57:27.3203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 bjOPPwzxN1QgCACuVWgHm2oeV/Bka8nhgAehfKYbgAOloRitnLpNvZdmGjuy4bR6SBntF3/osci4Qf3efshmdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6553
X-Proofpoint-ORIG-GUID: 3VCBLC3deLXOh2c4tbPeCkitDOz71reF
X-Proofpoint-GUID: 3VCBLC3deLXOh2c4tbPeCkitDOz71reF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-22_14,2022-09-22_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 spamscore=0 mlxscore=0 mlxlogscore=885 priorityscore=1501 phishscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209220129
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Sep 2022 19:57:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98929

Package changes mainly include performance improvements to
template processing/json, imptcp, additional functions to openssl, bug fixes and additional/updated tests:
https://github.com/rsyslog/rsyslog/blob/master/ChangeLog

ptest results for qemux86-64 with kvm and increasing filesystem
space to 5GB using IMAGE_ROOTFS_EXTRA_SPACE :

    Version | Passed | Failed | Skipped
    8.2206 | 465 | 0 | 5
    8.2208 | 465 | 1 | 5

The test imfile-statefile-delete.sh is failed because state file
still exists while it should be deleted. Already reported to
rsyslog developers.

    Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
---
 .../rsyslog/{rsyslog_8.2206.0.bb => rsyslog_8.2208.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.2206.0.bb => rsyslog_8.2208.0.bb} (98%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2206.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2208.0.bb
similarity index 98%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.2206.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.2208.0.bb
index a39de3acb..5b30ecabb 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2206.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2208.0.bb
@@ -31,7 +31,7 @@ SRC_URI:append:libc-musl = " \
     file://0001-Include-sys-time-h.patch \
 "
 
-SRC_URI[sha256sum] = "a1377218b26c0767a7a3f67d166d5338af7c24b455d35ec99974e18e6845ba27"
+SRC_URI[sha256sum] = "14de68e7b8e5ab0c5d734f82e2dc9fff22cd7f4710ad690727eb10a7b9b3df5e"
 
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.33.0


