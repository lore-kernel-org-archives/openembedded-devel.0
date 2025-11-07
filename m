Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CDA4CCFA05
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 16:43:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3693.1762533810390949323
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Nov 2025 08:43:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=P4rCaCin;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34068aa157=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A77urOU3483764
	for <openembedded-devel@lists.openembedded.org>; Fri, 7 Nov 2025 16:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=j7zFXfK4cl0LP5bphn69
	qEOSCS5Mny6D/zdTpkcToaI=; b=P4rCaCin46aGy5Oz2jLGEAUjjbjOasCUl3yU
	Q4p73XQBUf6/Lo48mzuK5gFiMWktZtcxxmK0MJ4LgxXnoBtFAjo4pheskwEsDMga
	hIL+0kIInj2Q3xcXkbfAtzrgWIsJEQLmWTdjrxI+b5TUhuWTm41NPcMWRYZGU6Dw
	X2He6+TP9DcClRLjYw29+jmZIUkiHsSWlqySgcCMsadpGrJOGClKREtzyAvEgV/8
	X3CD+Z2j3VnFcWo+Xb8CxhqptCwxd97oWnZHK3oQRiQzmzP/tZ/EUnA3An+C5h82
	mtTJ2gz1s8V10HiOxE22MqkWnB5Z6X8b9WedXmutOA4thNmygQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013067.outbound.protection.outlook.com [40.93.196.67])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a96wb8t33-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 07 Nov 2025 16:43:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ARyw5XyyrW2dG6goVJBeJBzq9BWMwD4fR4YpuEa2uBeeRIxti336s5wOTVZhZHgxPMO1iYRxLhajTj9rm4b0frSeCBetfvqrnV4O9OxnZv0eh0lDYtYdKBNjaPyYGdNIuByfsBS2Xd9CJoVPM97I7I1V++FDUg5AjtgXTKjRDuXQkt2nr06OegLhznDCWU/tkAf0ACXyM1jwXcWj+J1D94hgosW57TfUsmnN612eOwGNhfC0zLqQARxc50dczEcIgz9ebzhPzRrp0U3bFvrU+q0cS2i0bn1nu8nl4jbTxyGfy7zJsgG5bq+p/LgwC+VFU3oPvaZmXcjqP5lsdg81MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j7zFXfK4cl0LP5bphn69qEOSCS5Mny6D/zdTpkcToaI=;
 b=Nxt8ZTIRVmdaRAs5Co6rJkzPaT/jiSFpd/YmbfflYLlHoqTh7MBaE8B7Js8MrhModv6xf79rp8nnp1nlp9jADGljZGbdMlZ1rg0RP/DrV3rfFPLk4afkp0d/vJ9dyNCQg+HSopOo82zP/GhV+yo9ajZ2XMpwlijmnXaKYHY3nft5xm7lLIKvgV6BFVG9M2smpEc79sq67UoQKxen8rCj1fGiBIhJbjUU1b1qaL0YOmyVs6dFiLm7RRHkiHx8t1zgTB2ttPwtwE8zbpG4U6zH5yNkHVUlBHCxGpe47oTMXdw+tH18HPKYzqyusXzpAB92jxhCB+6Nz2gPPxPdsxwxKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 LV4PR11MB9491.namprd11.prod.outlook.com (2603:10b6:408:2de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Fri, 7 Nov
 2025 16:43:27 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9298.012; Fri, 7 Nov 2025
 16:43:27 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][PATCH] xdebug: update UPSTREAM_CHECK_URI
Date: Sat,  8 Nov 2025 00:43:12 +0800
Message-Id: <20251107164312.3934232-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::7) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|LV4PR11MB9491:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ec87458-fe45-43a0-134b-08de1e1cc627
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UNthmT7AHbih5/XgYOrJwUSm6i6x5ximnBCtJT+RFCeFKj/z0Os5JBlcfzgG?=
 =?us-ascii?Q?/gsXaascjJXRIEmCX8FK2P9iVYLmytnHp8AWizilHGAqpv6uP3UmEFHt8x4B?=
 =?us-ascii?Q?gd2cymp4L1e8UXRoi24s2DeLS5xe8enz2YtjfhiyrcJijnMZgJ5SWnVJxINL?=
 =?us-ascii?Q?fhrYtUnXz6IJlJ3aSdS//6zkL1eQCuOZHEY44bulYdquXtMN1jI8n4qqcrBF?=
 =?us-ascii?Q?bpUjHwmphDiCizp/vS2nbhs4E187zbU4nMHRLsKZ+QG52AsxdocVSiRSMgVm?=
 =?us-ascii?Q?9LtSFJMYNTCaCBoCUKS/0FwfocAqu1jAiNH1GS7a34YxNF/Z/D3Zig3c9b1z?=
 =?us-ascii?Q?Kf19zh9hJ0i8yN3ionfqo6n5yC8HA4zZP5dIG6Sfp4V3GUUKatq8zSjxCywH?=
 =?us-ascii?Q?u5uI2U0TnZvTiH5BiMBK4YghgMpCxxU0VS/KVpZnhRWeNxJtJEXEvMXcYLeW?=
 =?us-ascii?Q?MnsW7adQZQR3hdpJrbtndFSECpxT/Dcoc3CAPGiSeMmi/KzmfOWjvrk2LSED?=
 =?us-ascii?Q?iXaZUX49Tfgy6PBroMIEJKeY+UqElyaxLwLbKRdHTbvKwaH+DPMrUI6iBaPL?=
 =?us-ascii?Q?wtN565snBARdlBMFBbAj4fjgX6hZ6HIWr8Cqei/1domN+3JG+lnzCH9IcsRr?=
 =?us-ascii?Q?WjklMDcLOGXOEy1fHHHeRJm2+Epb9cO+0LiTWxRVFSlhQ9YsGz3RpY0xjTC+?=
 =?us-ascii?Q?PArsXyyPsHV5ocetCZ0Jv2f35D0o4Iv3jHO2mjDQAQnzqIFdMQtWDmWRnw9i?=
 =?us-ascii?Q?A8DwcdTEopH8Mz2cqPOuprupBM7MwwI+0+xr4Q1M5Hup9ETNwtrF2Ax2UiTK?=
 =?us-ascii?Q?8pTo+0VN+6R0ajC7+fo9JGHcraDXG69bnzdSyY8LGa3+MGaMBV+TzzUU9wtQ?=
 =?us-ascii?Q?5D4brDSjIPgs3+I9EyeRroefNldvUQUJ7O5etM8FezcagDE0ldISslX1iReN?=
 =?us-ascii?Q?9gRww+o+eRkpeuSQ37Zye4swnObrWDOxRKyXsqxUFajx+ACgbReNsEy+y403?=
 =?us-ascii?Q?vKDXJFL/lZQYvDCFIiCG9/8FyGRs+6gh5xeWwGVh1+esj8oSUYiWaww88BFz?=
 =?us-ascii?Q?0wbrYtQsr1Iuwo46zetAPxjF+BQVSpAcQk+YszuVlEGwKnA4QCY7uU2lvI+j?=
 =?us-ascii?Q?LPPsvKPcY+UX7fvO71/tVI0rbfPeYky4TljX4owdc3gc4IRtyfImu86stuV7?=
 =?us-ascii?Q?LduWvmOsTlFKLr++jBJOKmtVq5fv1rc2JDB4p6T7C2L1wtHFAqwh2sADKk1z?=
 =?us-ascii?Q?ihn5VIPBMff60zp7RvjRfEo9rh6sjaXEiEToqjBU0dFpagSvQ5obxDsRpNnb?=
 =?us-ascii?Q?2kLvgcyHhvCo+qmeIbQQNp/cBheP/F/cwP2R6YHY8+iz5UrMUu1kI8Vc/sjN?=
 =?us-ascii?Q?yAUUEg7q0+nFkDD2kvAMHKsxHP4yCz1qifQehleLFrfv0Gu9Kth+O8f7ipJ+?=
 =?us-ascii?Q?mzBvEBMOlrnvNXH7NzNRI0SrHThmzH2g7vcpzfT03lfSzfvKHLz6H4lRIGRC?=
 =?us-ascii?Q?t22TDT1vgKVudSQv1eSAc0g1izfcsJe8kun8?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YegJyXmbF/ABbC0vkYL7gOo6i+gSB82meMfCB6tFCGvKBOCkHz9uTjnKUlCX?=
 =?us-ascii?Q?ACcVbhgZvmSkiAPJ7UU7/sU9vOM9Sucm+O5EzDEd3ab3kD4FlYqHwKULsMbg?=
 =?us-ascii?Q?+gTTrZlUHOd0xB1hr9xloEN8+/S3NynWLgMxLD/FzFTL9QJuoxVDq5Q789tI?=
 =?us-ascii?Q?LaGe5yjCxBWs2K5h0EFlXu55Bol4zsfNwZIjRSg6WDgjdOv1wVnMVsIJ/gk3?=
 =?us-ascii?Q?C5psdrMqoJAC0lyCP+8O2UN0WTwRCEEd+JwOPralu5clbks+7v1iF4QrrHms?=
 =?us-ascii?Q?AfA5nX+PEg4RTOGNHInL4j4+AFbc655T7EHdBByen6wa0EZrVReOJ7I8ENRL?=
 =?us-ascii?Q?pOypCHScSrdwMd44nuRED85O26e66svbtBWpkrHIbnsDVlppAca8YZ8RgEVw?=
 =?us-ascii?Q?lOzqwSaGxwhvkJFFLjh6H7SLOtn2L7yVQ91MztVQum/PkIKJ+CcNxaI9e5oj?=
 =?us-ascii?Q?SZlXC7jvLgIGeLlWwcsY96WeVjbjiiM5rIqbQlk+7j7Qv/cCBeAEXhdGKdor?=
 =?us-ascii?Q?LvDYRgxPsdm6zW9fTYw0wVNnfZEEPwEjwDF3UYh69D1ON8OB4EXn7sifUF66?=
 =?us-ascii?Q?rJT/YvvFjG9QAQntonyEGe3Q/Zba8L9Uq7SkUr1qJE29wEhgnI9GUrj33SUr?=
 =?us-ascii?Q?oL1YgF8QcD/BWCbP0udVg3C0NelYncZ4G3Eo/90visPXFn8cAPd6de9kRtRJ?=
 =?us-ascii?Q?KiDQVRKbqAuQ3QCi0Jd49O/M1UOeq9kxuE3Qplg17PFEC0cNVwWQSNL23aWM?=
 =?us-ascii?Q?8UoNEiNkBGYiloSivtBkdP95ACFK6EsBBPP2GxyQ8k5X9a1lQgi3c8GOASn/?=
 =?us-ascii?Q?DvEnQ6N3FPctbCEvR810nFfoqkumYqzIuU2J5KgTQ9MD5wakNrCKxE/3JYch?=
 =?us-ascii?Q?OPJVhOVLzHxjYtvCZSIb8lB6JR6u1meIzcZjSSsbyfqGHeyvBhJoguMfJjeK?=
 =?us-ascii?Q?h7aEaZn2B4JJz6yjRx+U2f2ijdNEadW1STizIfU50xNEm9K2DBLYzzc9qr+2?=
 =?us-ascii?Q?9IMsV29nqsRHGkMlSh56dbNAwBa8bWzkE2RbotkPEEPCnL5HhIuvW2jwdWUZ?=
 =?us-ascii?Q?Cof5Oa4TirY9QpWoz8Hn89ZIlLq+ewBk0/wHVBRelq/F6uMsak9N1Uc1dYCu?=
 =?us-ascii?Q?l5/NbmnK68ODYc9GUKnMH4ydz8fzjfyhAXe1kwCWMCTvpmayGLTnqy/H1cfW?=
 =?us-ascii?Q?9cgTaI++6WDDK6a08F7HidXony89s42JD+uP2tpQhsEUfwZ0wOzni1uQ78Gl?=
 =?us-ascii?Q?iqDm8uJiGgKbQQSCVIZ4DqIFphlYyllVcgnllgR3LzDAig5Ez6DhbXBnL4sK?=
 =?us-ascii?Q?AKEQuAaLKnCgefmd2kwrWbZkvV89lRZvcLa7GCALHXpXVicsLt+62EwJtDb+?=
 =?us-ascii?Q?cMlBYNQPVs7dYTGn/AwQYmyVUY8WYQVohCaWEBCjELhWDeh5e5ucIhhMBdPb?=
 =?us-ascii?Q?/mNGWeoRkcmnjhoUF7+nNYXKNO4r8fyIIFAbGO7AAOUAOzosiJxf0meRPOHC?=
 =?us-ascii?Q?u4pdSLqTWLYGY0o5Byj/5QuemEXiCZlICwDc2lipys2MDuIF6y/JHMO/1zbZ?=
 =?us-ascii?Q?sGWV6XGkQxp7j47fcvJae4oHkfmZSn764cDBkbM+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ec87458-fe45-43a0-134b-08de1e1cc627
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 16:43:27.0149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tyXIgMqOhBlWMEpyrtfqX+ES+SrVpItCoCsPS10OoVvlXbRgtoAfpA2rvtqwxfOCABCClANJjVTv6U8Zk/Ym+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9491
X-Proofpoint-GUID: m2fYOsmdIQDWneTs0r8iLIM_NWUSf5Iu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDEzOSBTYWx0ZWRfX22D4QCd8xoIr
 1HQTXYergnyJD3eWe/zjn1omMMpKHKfIffbvhTH+lCK+1qmVhAHYCUpR/zx4SYo9clMAvE3ckwJ
 XIy4mhNCmOv5L04DzZUnMQRFLIdXJV17VahxHnSSVrZ+NXQoKPcXkkwtsmw+YqFfbOOPSzIrnQA
 /rQNJ3V0rz1xCLGV6l0KYnXXjLe7yrMihXEliaIbH4DgKyEdw3eaq3Z1CHazcXtc/uC9re6/5to
 atoJB4lixAVLuvM7VQnfYgomNJfU4ygJsHvwbSiomS7kXi1AMQkr8wXOpdFIo8jKGQWQagDMwCI
 Tj6no3hSlftkQFEb4Puqc5/WobsujVa1fI5RLr31zw6Nc9JWc7Bz262k2j1UI5sP2lwmuU5DSHo
 evcNnaBIEaAOMNv+72PVF6kYkaExHw==
X-Proofpoint-ORIG-GUID: m2fYOsmdIQDWneTs0r8iLIM_NWUSf5Iu
X-Authority-Analysis: v=2.4 cv=bLAb4f+Z c=1 sm=1 tr=0 ts=690e21b1 cx=c_pps
 a=2HONG/MLgVK7ceQJVUCxIA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=dv67sbeyAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=Jl_jOLasJoZwQEY6TioA:9
 a=l0HWC-NE-IlxOwCL1BNn:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511070139
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Nov 2025 16:43:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121375

Update UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX to check the correct
latest stable verison.

Before the patch:
$ devtool latest-version xdebug
INFO: Current version: 3.4.6
INFO: Latest version:

After the patch:
$ devtool latest-version xdebug
INFO: Current version: 3.4.6
INFO: Latest version: 3.4.7

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-webserver/recipes-php/xdebug/xdebug_3.4.6.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-php/xdebug/xdebug_3.4.6.bb b/meta-webserver/recipes-php/xdebug/xdebug_3.4.6.bb
index 5314074fbf..6f8540c0cf 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_3.4.6.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_3.4.6.bb
@@ -8,7 +8,8 @@ SRC_URI = "https://xdebug.org/files/xdebug-${PV}.tgz"
 
 SRC_URI[sha256sum] = "4cd6a2523d9c1576c818eb4d15fe0c1650a25dde4d31d1d20a616e9d9435cc20"
 
-UPSTREAM_CHECK_REGEX = "xdebug-(?P<pver>\d+(\.\d+)+)\.tgz"
+UPSTREAM_CHECK_URI = "https://github.com/xdebug/xdebug/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)$"
 
 inherit autotools
 
-- 
2.34.1


