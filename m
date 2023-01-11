Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F22BC46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 05:43:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16937.1673415826022799405
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jan 2023 21:43:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=B/jPyh+0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=037537a996=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30B5Jbvi013565
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 21:43:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=Sf2us47sowRwhEYHxFUdtVId+uYyQ2jXPmElEQYneLg=;
 b=B/jPyh+0yYNjTisF1IOSf5FhiWhsHhi8sKHVoTDBdmMFThvUhZzAdH9dzuk0v/CqBQg6
 wkI6yeSduyRFGz3OSY1CXqJH+uC5ASPY4A5GJbokoBqgguXdQCXwuP0ZnTMKqfvEshke
 m0ZRBBanxNdgw4wfg3Z1nEmp6JPZ7iq77b3awqyByNzdpX/VWESxdr1NP3RYFF2+DqNK
 gvB3NAT0wvp4NZlIicehrhWrXXoJoMsikOljE46m/t6XIeW871NfuVzfrs9214pgW2Ze
 GztaFRgMCFz/FBS5+Y0XTSqJKHGVOkwsgvTwzA5RnRgnB4geYvaAlwbsqGcgd9eGZ5kN 5g== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2045.outbound.protection.outlook.com [104.47.56.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n1k5tg6b2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 21:43:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BToh9ukYrpimzJluBcjuCIXjxmiJ3RjERsWORCYnby0FEzYyQOpFyNWlUHU4ATX/IM316qLrhPihbmqomvYWT94iMsU0HyCIOyyITdM5wBcDDMVdTSaFBacmhOxCo3k4JTvSmAeor3wLDUsU5VR4i5sriPzjl5El3CsI/RJuWLWfuyqd0UGb6mMAgKeDOpezu/3bjP/TxLF9XN63ESIF9Rn8RIONW65tdw+Stlt64qTgVtdW7nofHX/vCJp3Qc+J/rgl1DIuZLxw4+JTKgLbZK+XYOKtXsnmKbSmwJj4kz2ZVoKEvNy/2YshALpLmKtkHBUl2Ew7P3iBgvZemtz3hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sf2us47sowRwhEYHxFUdtVId+uYyQ2jXPmElEQYneLg=;
 b=nX2Vkyyd/DOj8w/OuI4IkWjdYXLi4SW4gE8OnysRmJPEzNr7nwON5VpP2UB6Vo8FhTF82kSrVpn3CglyV+c65lHvX64GfcVzImGUp2zKeaCFxdAacqseSDXs3sXoMoUOsBmjy1WhG3mNnjIxxwt0NOSdOENkbMAhqbThHozdX9oQONWqsRuBUrmVDCIv4xDxNdJSm+2s3OLygBBxUNbE2GmN19vLYAUQQ+fg31fS8ae4mE+kp++B1SBmDpXnHbNtsC8Et89AehOiqK6N5g2HMRmoatPvGbwl/gHxUz1jH6dS6ZfVuZB7fFkyQCrTpMRgmCpeL5R12MbFFJx6EYgjBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SA3PR11MB7464.namprd11.prod.outlook.com (2603:10b6:806:31b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 05:43:43 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e%4]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 05:43:43 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell][meta-networking][PATCH] postfix: upgrade 3.4.23 -> 3.4.27
Date: Wed, 11 Jan 2023 13:43:31 +0800
Message-Id: <20230111054331.274720-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0086.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::19) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|SA3PR11MB7464:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d7befd1-58f2-4dbb-9feb-08daf396ccb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7IZ5E3sS1rqdPsKUaP8mFBEt1z2thE38uhk8GvGuABZRXpPjXMd3nizCsEKmFlEt2bAgQQOqpHWTww3AL6G5ZKphqLGo8amZKztI+7mGI3gh9rUESYJWMod/fdgAD0WR7upw65ZPjayKXt0v+LxkralHJTJZIaBtV1BT13M5nsGW/clNjlmJ5dA73ismFp8aO7AlX2LTXKUmJtf0fmkGrSo+mjUbuANIO2oK+aLE05+Of38SHLwv8PVOgZepPJuSGGUHNr4mhS7hwE7Ea2QlYHNlhTAwIDcmWHZaE00PpOxm8VvfrorqZw+2Vmr1WILr07DpZZDlDfwCE/rL7pD2AloMr+3Fa/kmBweA4rq7lKgo58rV7T2z7z4B39DtXS1JgDXmrk4vSEoz3IDLxO+uKPTg295sLfaSbpUraCmtS8wBvwLHG1YTkSAQ7Q0Cja8rqTKLiemZaIa9KsAcsAWFFbcZbh1hlr4W2SL+AQGDuUWBex7OYrm3derCuri+F06pSz7oiSZnFbJxKsvOy0EvKnIef3z7myybozBIu8keME/tiSxjLVjRdrqWnmO/L9g0i5bbhg0W2JotoUdu68uAjnIZjlcv+WckJd37dpS2dIOFWdIpQJvv3AzG42NWSkGSNmu+4AMP2qIoCQbE/J3KdxbGwq9Jh/PabMVD8saMXotJNGnVlq1rxM9WUQcBcyJvnDRcqvIDLx8T/oLzhBwTEbISy8o8JS9QEc4kcEPHlNY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39850400004)(376002)(366004)(396003)(136003)(451199015)(6506007)(26005)(478600001)(6486002)(1076003)(6916009)(6512007)(186003)(966005)(66476007)(8676002)(2616005)(41300700001)(66946007)(6666004)(316002)(52116002)(83380400001)(86362001)(38350700002)(38100700002)(44832011)(66556008)(2906002)(8936002)(5660300002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?a9ADwacPrnZW5z1+aYlQvk7cmxvPfyFnzCcYUnhmdzrmwkWGOjkfavkvFygx?=
 =?us-ascii?Q?C6M5vMstgRK0LwBWh5syVp9iBu/uuxA8aV/LKX/E3jMz1mLbMIynBWeuhn0l?=
 =?us-ascii?Q?zQsV7cQgnxnH9w965S0AFXynSltiLh2sRIZAywOumkv/EOxGPjZe28VzH1Js?=
 =?us-ascii?Q?oszDC3P1evHFruxlXvRNXpWcZ9giDXHel3e/0cqAHNYlS7Q92lksZIk3d2aQ?=
 =?us-ascii?Q?L6imqkZHh/SBpdyTKru+nw6K+4BB3rNcSQNv3lHM2c7TcSxVv/WVu9eP20Sn?=
 =?us-ascii?Q?Bexqk2wuk60HgFPUcZSljwfJBdWNt3lB6KshCjWQVb2dhrAVZkbog01Ahcqu?=
 =?us-ascii?Q?AWkIB6TDlemAQjiaHYtJgdlmx68bXvSM1oD7hO+KI4x4xeHNaoI+RQtYIivL?=
 =?us-ascii?Q?z27EWgv52VXUwcmSDf805s9JS5X0lCJsM55rXWmv7EoH18CCt7y3ryVbYAOs?=
 =?us-ascii?Q?ooCrgVf8eiSkxMw9QGRRLcEqBBgPbRFc5IsCLWMLIs/smKr3p8G5jmPqFrqS?=
 =?us-ascii?Q?hgpd6ESCk2Ch+FrLmBtRbiNr5cN7aZdu7jdRRnGIWSJjkGeXrISi7gDol+uV?=
 =?us-ascii?Q?WWuH/q7Q+VWUaSxz3SpncuZdir+DY21oQfa2ZGaJACh1C7ZNaZPRdc9qF/NA?=
 =?us-ascii?Q?d8FDtX2Kdhhmk4SLsNbHVUpTUWBVCgq8CXBGnBVvg8DxZ+w0LduFJ6dcXCfR?=
 =?us-ascii?Q?7CqmUBj14IufLu6Q0zszjW5eXfGzA5jqzL2Lzcc5iO7XGhvYHAQBb+QrTmXr?=
 =?us-ascii?Q?qB/QY2EJjJ1vf1jW+ZNKQgVLZP+NAKqgJ2OyLreCrwFqIEEHiR+ofrdA3qVw?=
 =?us-ascii?Q?jBvyNSSA639zyDTp5uV8blJvn7pfma8BLtwWRRknGimKqzXJsRh3SyMWwKEd?=
 =?us-ascii?Q?uNXPjetsoyanKy4+yXv+pq6AtZp6LiiZ2cOqnV0asY6nA+MT/w3CE9JnfhpW?=
 =?us-ascii?Q?ASD0TpOhGyhVQXFr8tPRlXRNJ/K20Kjz07cabSs5L2WBsseKndxQ0LVPQtcX?=
 =?us-ascii?Q?56yHvGrZg3VxHoYwcMV1EtOlsECtsnfVdV7Gj27MtAknvPYM6OL54CEfub5W?=
 =?us-ascii?Q?x2hq1im0rE1OwU9YRPpD4Fx1CIDxDUNhZDIiQ0uRqAYTld8W7nNVNy8pPwGJ?=
 =?us-ascii?Q?9ioMWz1/84efs8Gs14ZZOnRUnbo14ATRg6YFS1SAjtYToi8X0xNTNkwd86Tu?=
 =?us-ascii?Q?IDC2/sRUnm7pV7U/kBMADjc9GofKqhpq3e3sNfD0cEY4AkfC2CR4obE0W6DZ?=
 =?us-ascii?Q?+og5tQ1ZFNjbh2qWR31mEhFzPDf2tGfpRVcmGbBvIsDb7oteovOxvc/oVIoY?=
 =?us-ascii?Q?RJK2SaJljY0dvUxBWTOJdRNkbma94ZlJzWd32Bq+ARZNyZUFzGXgLHGGwI6m?=
 =?us-ascii?Q?Zg1TMI36A2tNcy9hMV1Zmz1vLekBGlHgISYXwc4RuEoQK2D+HLRqgsK5gq2q?=
 =?us-ascii?Q?DUjSJ5KifLOXlxZ5e3Dx9QShZwt2DNplEO1dBKsXk1fFFEhTmI9XtF5HaKCW?=
 =?us-ascii?Q?LYGQziR7RuTzdr7GTy1B/82YkmA8hLY+DtGAe3ZBrgjGWTGclgoAFfUfy3t1?=
 =?us-ascii?Q?vTsNu6vJ0UUZMXix3meRujfcJ4bnYUuTVPwlS/7e?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d7befd1-58f2-4dbb-9feb-08daf396ccb1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 05:43:43.4463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oSoO0DWfXZSsdXKeBreTV1sko+odXdS4W753CtLEcJSJCFN86cvF9kBVWB0GGmwh+Xk8AKEv/bwV31HzxQ4ygA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7464
X-Proofpoint-GUID: yALnYnhzVKFZfsD0A6TWpX8ea_xd-Oc9
X-Proofpoint-ORIG-GUID: yALnYnhzVKFZfsD0A6TWpX8ea_xd-Oc9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-11_01,2023-01-10_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxlogscore=871 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301110043
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100542

Changelog:
http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-3.4.27.HISTORY

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../postfix/{postfix_3.4.23.bb => postfix_3.4.27.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.4.23.bb => postfix_3.4.27.bb} (89%)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.4.23.bb b/meta-networking/recipes-daemons/postfix/postfix_3.4.27.bb
similarity index 89%
rename from meta-networking/recipes-daemons/postfix/postfix_3.4.23.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.4.27.bb
index bb6634580..2612e12be 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.4.23.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.4.27.bb
@@ -15,5 +15,5 @@ SRC_URI += "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0001-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
            file://0001-fix-build-with-glibc-2.34.patch \
            "
-SRC_URI[sha256sum] = "1759e953bf7baccb533899845c17753bf57a99ebac9c21717626262966a122f9"
+SRC_URI[sha256sum] = "5f71658546d9b65863249dec3a189d084ea0596e23dc4613c579ad3ae75b10d2"
 UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.4(\.\d+)+).tar.gz"
-- 
2.25.1


