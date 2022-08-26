Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADAE8ECAAA2
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 01:19:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.32009.1661476786604166021
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 18:19:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=SFcFtSYG;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=52378942be=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27Q0r63L005358
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 01:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=JIZ8iQ1ozz+o79ukru2O0+oDMMWre8sCFeT44sqC/6c=;
 b=SFcFtSYGEwsMbkQoFBkZA9EACllhD8cqE7ThxBH4RynI5r88kyQBZLK4ULV+sAt3Mj8k
 w5hc4Vov1+/nuve1R2VWyXun34SQalFKgfmcCHEze+jhbGLE8stMlTS6MNqJMqIYTdHZ
 k48gpgmkxaIjxoNkP7tJ0kfz3eUYFN5vwKaziwpW/1u6BeRhVcdkf0jXKSbyOkLZp3yx
 DNW6IUVnfc4aY3MT7Ys0awpXMcN52ZXPyzmXY9E3f60ahr8kr6dKfSzwhJakNkW+6YRJ
 eq0TtLpFlacvOVQZP9rBq4ZyNYTh3WNXJHtYqufCoY3eCSBMT8eadV6mfQ8bi2yIaW2F cw==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j53s329gt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 01:19:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XXo4qQi/8xw5a0KQAOjunVV2uWOd4BE7h8z5cbTBQj4Diwgh2iz9XYsGRE1315qYSm3FCfjtHery8q/bRQcDmKD8CSNTWIBxVlj55Pn1RYerJ7bDF4zvztoeR5RmKk7divgAsrxkMs9GlDi42Og1UBLtY0hXHwDUV0kG6kh6P4+7VOlH7cJF9Vp6aFGpGgbKNZEgpoeosURyePRdZouXA8gGtMcRfZgQRCHDHVd8dFc6hTQz9JuX4I3QBvLGbpPhPD6n0p9LpGEncM29hjElNpVOkSo7oOGHzUuL4QeUmQQfYp/12lT5ATanQrkounu4AK9glgr2iGPDro7YVvd/bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JIZ8iQ1ozz+o79ukru2O0+oDMMWre8sCFeT44sqC/6c=;
 b=KZevSynCwQwGCiijR6Lb1xN/UfuY5sYsGl1KzLkfEfHChRG7PcXpBO3lal8b5/oB31B0/tKULSkXMK59XWmYjR4TtVzb6Y4Pg8KGrLe7n3XeB2PulOo+/0oYYrCCqstJV/YLLsQeN5R+XTxoUoaZGWA7K1M0k03sFPaQkpKtL0C905EOV97hZl6muxvm0VJhv1Fg7CvYgPWVnAQekZnT8gulzX49yGh+sG5HpBahRCEV9nmplT29UoTMKnpWRJrJz4hWHLRmm+CHfe3bpXoJ3JSPmUHNZ0edaTltFj72LcqdGBGZ/NVwhptjJ2elvMfa0ya+DR7+0RSC5OhfIB8BVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by BL0PR11MB3332.namprd11.prod.outlook.com (2603:10b6:208:6b::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 01:19:43 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::a921:a88e:14b7:56ec]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::a921:a88e:14b7:56ec%6]) with mapi id 15.20.5566.016; Fri, 26 Aug 2022
 01:19:43 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/3] libldb: upgrade 2.3.3 -> 2.3.4
Date: Fri, 26 Aug 2022 09:19:28 +0800
Message-Id: <20220826011930.2818670-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR01CA0148.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::10) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a142a38d-aa7f-4bb8-4d46-08da87010e26
X-MS-TrafficTypeDiagnostic: BL0PR11MB3332:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KYiHK8IozZj1VFjN+XTTv+fVkil/7BW8WECsUZXr01wvQl+y+kdstRWcoDr7MVxx9TecD15nLVI15jCH4vbANpyH9w32/yMCGnE4kouf4o8h2zUl+ttJJjM42tHBSgfD8etYrR/lHvWg8yJooMOgJyBs2sIzKqdReGn+GWSlCH5pxo+hDP+QuNZv30jDHJnz3WDSixODLDCN49V8JQQGc/uX6Fmy62NX8VKrqM7UNA6nQ1+fUP2O5BC0ZPZXnR5e2ro19d60Gc92EvUN/Kl3oz3XriC7Hs3St5VOKvX9Yan2BGRrlB/TetnNu5J7kJCtgHZWaPvi4l8RlZDJnklmlQ5t3Ga5B9wKaKjG3XlCXl5WHG7KpuXpPssakqAj6CaIPuFL6YuUpt/zdaDs4B44SxvWM1cEBcUBDK5rKzUcuxODF7rb//R5qCO2bF3Dri6am5tBAHQMtnboo9O8NNQtFCbnP0QlWjekDcmYU3ONuvSLKGYLyVdTjkIVVNnEUOxKYNpMvkfz6/aVVDHjHvQpO/2UWONg3Zc08ZwfmX3xOFLI1/4pd4NZ+g0wzmjqlIzFHlGqVvIMfwnKOTE9hfw9GENad5Ryv7LUqgVH6qYLI9usQl2oXqqfD9wFKZnAe0vcAqFAABNTg2/wm8bBDkTOSNNdY7jw1d8cF4xtVullFQUxg3cAxGODSXmRxKzJ+d7FRQrumFzQPvT3FuSh0UNn8G11PpXY76p/tT+2Og8Y1WoSzOk3MyN50f9eFLB/xNnDjFav2/P4PRn9o9AOundChg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(136003)(396003)(346002)(376002)(366004)(6506007)(83380400001)(186003)(2616005)(26005)(52116002)(1076003)(2906002)(6512007)(86362001)(38350700002)(38100700002)(8936002)(316002)(41300700001)(44832011)(5660300002)(66476007)(66556008)(8676002)(36756003)(66946007)(6486002)(6916009)(478600001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zEaqn7ChX5CH4hpKan8BQZleRXAKEaomPruQws2FNz7C/HyZdFzsxahjyWjl?=
 =?us-ascii?Q?Pi5WVD9x2npAW0NrHXWh1sxQGV5L+8UgEzWMjvEQrO3WVOhf4iKpCjZTW45y?=
 =?us-ascii?Q?tQnquTbdtk8UmthvfFwnCGPBvpCrgVkvdSeGQ5pG3w6VzQA6/FLL98HEhHZf?=
 =?us-ascii?Q?SJLEvDuNhWtSZUV+IknXSwL7iiHPepRcBAiWUpAbir/pzxD9hkbmziw1qcjf?=
 =?us-ascii?Q?f+41juO1sziJcDrBmNgAdDCpGkNcilO7Jx7Ox9eUeqDayZA0G/X1nFolCwAB?=
 =?us-ascii?Q?+rMhXva9DO0bjKCXFvbH9fNgpZDZhClhoVOKJq4LshOfMvYvn8JyJ6pdtTn0?=
 =?us-ascii?Q?xnQjxWAFx8LDDdk/fBNJ1IqXPUHuaToVPQgIXR1FxVmWHFH4GGPA0WpQcAa+?=
 =?us-ascii?Q?GGqsAzbx/8jerBSxybmZSw43nAzVuueXGHjGZYuKsGzEiardtn1xIP1tdaaM?=
 =?us-ascii?Q?WcDntrHfQZUlzoy5V+AmUB/HgNsLhGtPCxX+oQgxLrdvyl78LULfTMDWiih0?=
 =?us-ascii?Q?43VkkHDSKCyP+BL5sOzV1Q2ihnAtL9YDFLG7O/gcORghO5nf6kd5++qhZg1O?=
 =?us-ascii?Q?9fLFf38pyygZN2NUliRLEBAFm37lYWmb5bu+OLUJ3aj/+T+oigMnrdkGqbvY?=
 =?us-ascii?Q?5qVvYq6NT3X/ezMpFJEjJKDkBi4haanyS2EUY4nE+IV3ZcnPJO4FktdC+ZDK?=
 =?us-ascii?Q?jginIewmf5/rbFsd67TCi8g4p1buoAVC5Mhi99hW3Z6gzo6b4dmhFRaZDLhk?=
 =?us-ascii?Q?48nlKbanj6CBRDFh4xHwSIG8vI+5OqIC4d6U+63aPl9pWXVDLEmJeWOnjiMS?=
 =?us-ascii?Q?5H4F5PfQ9Hrc1FN1pPPUrfQCHGqRxFMlpgJbn8ULk704BRPplLbLMtmf5YUn?=
 =?us-ascii?Q?0J61ib63BTff0rDRziN2+CQHECf+0/t2R7kGY+5kGGZGY+FlY4Vv9YlyQxxt?=
 =?us-ascii?Q?0Naro/RGcOwsnXg7lFAh+sq6oqZUCXFdT8kwszTCw9yamc/na11BoFStvmBe?=
 =?us-ascii?Q?qebsd33mTgSoh+KQhWWm1eXpDGTk6KGLBlBEWRjrHyO6YFhdSHFJkfQATyBC?=
 =?us-ascii?Q?k/coaoRzlF/IfppD9Cqqga55PkiQO61YBRxfVuTIj9F+dKPAg9+vK1FV+x0o?=
 =?us-ascii?Q?OVtOQB+FX/WXV/LdAVQ0bWx9yYQHYvFZRVNBGVXzmI939raf+SuVwPHfM/1G?=
 =?us-ascii?Q?8wanKdekMpGKa6y2RNhiypNNCflWShgcEbiWflZxbfGuXIFv4rGWyzkILniW?=
 =?us-ascii?Q?hOuQMqlZv2VXqolqqGoqflwzD3nSkOJHGm9jfIlt+zn05rT7D+JGldPh86vE?=
 =?us-ascii?Q?9blqWjrtTSAjc5DG/V8MZvVbQdSQl1pldJOnFx9bWKouIf2XbIBzjUIBHAk1?=
 =?us-ascii?Q?Bmnb33dzV5cYBv/vur2q2xczKbANKizgQfeQkB5ZHfFK9OkCXa+H2ydgzJI4?=
 =?us-ascii?Q?LFMF2vlXGvG8MajaDTtfrEwXW8KnhfGVil1WYzgmkwcfIBJCfQRQhjZqqESu?=
 =?us-ascii?Q?V8oAwwIv89yu3/hgI+/ZkAHD2Kd3rqFMoFhsABInbPO2c5lM+kcoZa4R8l5M?=
 =?us-ascii?Q?2skqAaSAltCU1zcwtsjNOuBKD8NdajhC++CIHji5?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a142a38d-aa7f-4bb8-4d46-08da87010e26
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 01:19:43.2516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ukGnUBUBbpdWVQU+9rreHnnVyniFKUdEUA2zFGO2BbG8IsV9HPpeUOS1sjoeZgTEV05g9+DSImuUoclFh3VSyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3332
X-Proofpoint-ORIG-GUID: CpL3HT57xCjbq5XtvM6thrGQqiy3K7R2
X-Proofpoint-GUID: CpL3HT57xCjbq5XtvM6thrGQqiy3K7R2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-25_11,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=788 priorityscore=1501 clxscore=1011 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208260003
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 01:19:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98437

Required by samba 4.14.14.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libldb/{libldb_2.3.3.bb => libldb_2.3.4.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libldb/{libldb_2.3.3.bb => libldb_2.3.4.bb} (95%)

diff --git a/meta-networking/recipes-support/libldb/libldb_2.3.3.bb b/meta-networking/recipes-support/libldb/libldb_2.3.4.bb
similarity index 95%
rename from meta-networking/recipes-support/libldb/libldb_2.3.3.bb
rename to meta-networking/recipes-support/libldb/libldb_2.3.4.bb
index 6dd3ec3a9..af5f0427d 100644
--- a/meta-networking/recipes-support/libldb/libldb_2.3.3.bb
+++ b/meta-networking/recipes-support/libldb/libldb_2.3.4.bb
@@ -32,8 +32,8 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
                     file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
                     file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
 
-SRC_URI[md5sum] = "6824f69ea3bb58cb8a3be4c179e7569a"
-SRC_URI[sha256sum] = "9ef39700ff05b3e8f5801d2a39fe1ba023218650f81c9d377caca22f49076807"
+SRC_URI[md5sum] = "b01d6913a06901c22c5bc6caedc548ac"
+SRC_URI[sha256sum] = "f2e88dcab7b6007d92724b62f8a16e7c6e77275885c60eb4f87097e4aa4082c1"
 
 inherit pkgconfig waf-samba
 
-- 
2.25.1


