Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6EF1C54EE9
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 08:18:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.8566.1664266711877124787
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 01:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Iti5OdUv;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=626914d71d=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28R6mTkA030829
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 01:18:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=ftMiOUHwCrHWAWH8LWZ0C9gn9IGEURztNqXfs48qlEs=;
 b=Iti5OdUv2214sKdm845Dge7QaZtsIS07ILFHQk0jsIXQ/U+WW7MWIKcBh5qUQyLLX++3
 sGaaGqVD8BF4aPxb61sOPNXYKNcV6VFnJnm/EldO/4RLfx1YYZZO0qY1YpQ3O2DIPPjk
 fVMplT+WyN68EXcxiCx8+uhSQpYafZQ5LNAeZCajaqibUxz6+lewVwE0dmatIEsy+nlQ
 s1YN2hR455DrFDLEg2ViZFExZZdDzvmKNnLtR66T5vUJDZgNmRIgYl9Pm6QTHbcvAvw0
 l8gW2dP0pH8qC9lk8K8Wjsj96ZZLzBPTJZRcTqy53ZQ2c6w1h4LtAnc9W1Hqn6PW8i2u AA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jsw65j61t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 01:18:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGFyVxZglmAEIBqBXeknoRfsMTYAkE1aZqv3fk2jn4mrUeo+3/h79gqs0O/X/bOOmG/gKsPcK1VHAUL2QwdB5RLwASUI4vY/koRLB5UHX0/6icb6oGaXoXLCzvkVE0/C2l0QUvl2KssBTSj+fmj8Sm8k3KcMkAjJc35dcEZjSPAluZ7MLJ3bNLDY+Vk6/cl+bVpnr+C4j09xoLW65qpRO8eP01N8Qlhe7rNCLW8tn8Ll73BWlwL3jHSuMXMGOHstePghyt+9DAOysEE2HH7K45+1n2ZqBh2uKcieok7oRo3iyNoCWx9CXXwZ+xDEmGMSB/9XYYmG1iPTJpeLmHtdMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ftMiOUHwCrHWAWH8LWZ0C9gn9IGEURztNqXfs48qlEs=;
 b=cPhMS0ntnJ3o7EfE0lRZ5rT5qg6YJ5Z7JA7eGOq0liB7PtpaHkbhglIJXnGbTeSe9YCvQg57ZF6Ax0AGmnvey6yHh2NVMUUGZJLuXWuoizseykPB7NCQfY6Q5nLYd7YRirUW9ED4eaKmlMXliDQLfHy/7ZDk++cacHkAWXDSuWDOJQL8nZUhvE2FFQib8lbRPondaCF+V8L2r9/6DFQlRvHP6oC3q0Co+V1wXMASlnqORhndDqQOhzGUMgkGEh0yPY6s5Zvgz0D1HjJT0vb6DDjGFYZdVufyuv35S7Nq9pM+PQPXAPuMhJ7Ul3clw9B31EoPDciUOIeEQOXCUE1YqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BL1PR11MB5495.namprd11.prod.outlook.com (2603:10b6:208:317::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.15; Tue, 27 Sep
 2022 08:18:28 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c112:6e86:1bdf:66ed]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c112:6e86:1bdf:66ed%3]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 08:18:27 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][kirkstone][meta-oe][PATCH] polkit: refresh patch
Date: Tue, 27 Sep 2022 01:18:17 -0700
Message-Id: <20220927081817.1977-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0118.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::33) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|BL1PR11MB5495:EE_
X-MS-Office365-Filtering-Correlation-Id: 76946ea9-4952-42fa-2d7b-08daa060dad7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2eLPjHtQOG6XRmWZ4kYptfVl7fnDotO0BX3TocKFS+tPYogEWykzthLLM+hxvx4AuoCss6npNOyzgHnjhJo7Jo+imFtsO+wfaGU9v/3J7x2jMDsOFB8wF78yjgI/QtbXrRkUKjxp0/2Hdb2lhru8YsL8bbwH9KYiDVG0+hMVfMQXNJWjcOe5yGePuzERM60c9f7kwEVZWnD1rRyKVPcu6nHFbMgQQD0D+f7c16nLI5rY6oalUgy4lMrDupPk2ZDHtOGd2a85nBj3ztKOlVmmy04Q5q+s8K+wrt2ekuxhvxi/ExPtgc+i+CNIPZL7mDY1f5diGB+mkpe5TjzwevvzZTzmuBJXVcUVq4NhHC3mib2F+VKM3/n/VJJtsTvzJs1YopZkul5I9AORvXCA2u2Ur/IZWAmuP6bmXaGEDxKl3Y6w7dEe9XoGihkJRpt/Ccvq0renZqMjnncAMy4VLziyOsnmyGFyFSAvuvvbNz8Tnep6eQBHKoHXSz2oWGz2y8e1nZYPIDOfYuGyzAwvspeYOsKBEkjUzXsAXhuNepMNVOl43At+Jzv4mV04gk4BX677hZsyyJUYdM4GtDD2sLf/UhkVmgrvJV54wIMkY5em64UltJvimCs3fSvjeVDUBchmR3EqrbX1wvT+ZYMyuqcU15usE48gih7Lp3hPuqSOuvohbwAizcBsVHk9B0cYS+GBb1USlO/tYLTwkvXgzO4PyfirgnBsXh1tX84fb8Vujfe/W7tIVrkbE23nXNPlY1k1IpNvUIDD3AigH7abV+PzLQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39850400004)(346002)(366004)(376002)(136003)(451199015)(19627235002)(8936002)(6916009)(316002)(36756003)(2616005)(86362001)(8676002)(66946007)(66476007)(5660300002)(6666004)(6486002)(41300700001)(478600001)(2906002)(38100700002)(26005)(38350700002)(6506007)(6512007)(52116002)(53546011)(66556008)(186003)(83380400001)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BwD+20e9VqkCDh8EfH0+K6QxTLZEGRIEr3pjiBskqWBGt8vuLRfjaRPIxz8P?=
 =?us-ascii?Q?WuX8Q+jSucw6/H0ZzO4URkAg81U/Fd6IGjMC2laYtsc2Fbj4Gl7nhlZwE9WF?=
 =?us-ascii?Q?niWNWKBWQeVaOclt4yvcxRZ/tV8TAe8/NNvLiuODvESDmOoJ4oTY5YTSoZFF?=
 =?us-ascii?Q?7kzFNhmLKERCq4OEq3pD3gnJSeuVbmfCtL3GETrvqop5HP8kS2sS8TcfPp/F?=
 =?us-ascii?Q?2AhP4XUqKh9eXCnlB3F2c7rDI8QDvu8rof+Fiid9ewG20mGWC+XyJ+aecfmu?=
 =?us-ascii?Q?Kh9BgDDxdGnbp3ER7hufDKek3THgSGxjwAU5B7QnWEu8vZCJUDh0luN8mwW2?=
 =?us-ascii?Q?hEJn/5+OJif7Q1htVUq8wqcnyNB5MpeEqRubMychHi0LA+ZG1gZpZAFr+3oi?=
 =?us-ascii?Q?8eG734qCROd6z4eDHwpj1zSq3UlNgcZN/+XI/y7dAUd47+oC6W7uxPlu3oke?=
 =?us-ascii?Q?1GyNrpmn1unm81TCJS/iHewiK/nNM+wo+bYyxRX/kL5W6XiLLTEzQpTFeV3w?=
 =?us-ascii?Q?XUTx2cRMngsqAx/YpDnozxiZWGPaIZZghqWxPPhmEDkvHDAY3kUqJxXmANW4?=
 =?us-ascii?Q?2bpkjKR7Rop2V9TuHpnFmJ7BitDIgx5FZQDs4QioYAn1BYQDc589MQEejSf9?=
 =?us-ascii?Q?g35ngRSn6bhU4Hd2lJHbHjcYDOY3HO0c0/audulCQfDc1Kn96RYRa7AMWy5J?=
 =?us-ascii?Q?nO4bq3kAfbNo0IybFKISic0oGSOteeh/VMEUWKmG6CyjIA04Hj2mhPQ/IIVN?=
 =?us-ascii?Q?W2uHdpQC1hZZOzAYP6KBs6QSkkhCQknkuKJ8R+RvvCYP6yPJRQofVezY6uvb?=
 =?us-ascii?Q?yL/a0/kvApwc4qjkgxyfUA/6AKhT1tZ29b9E3qhEhQPjvCtjMYTw1s7WXvaY?=
 =?us-ascii?Q?kbTXww3izCJK3ZtK9Gp6ilULynep9OeBvMXC0wXChiLiWU5W1j+eam6Jze81?=
 =?us-ascii?Q?kZqVxyNNFPs3qZMtUZTFOnAc6hISUk3KSdzIMkUkAJq+zwbiVm+zvLFFSauH?=
 =?us-ascii?Q?jucO+/ZOJZc2AJe4ctZbJvmcS2p8dFC5Un4rJaWcDZd5xs5EyYiWg10WNk54?=
 =?us-ascii?Q?soOg8TX3SSNdU/5nQRzngh270Zbkj6CbgYfG+6gPZeYCKpTNHaUXMk5V35Dv?=
 =?us-ascii?Q?YMMTQWzOiJgIutv4iOE54B7nNUoj9n4uRxvHieD/AqLyjcta1RG4bw6yBHy0?=
 =?us-ascii?Q?S5zPtwsD5ekSYpD1gYBhJ5KGmbjFLz2kbTH/vstwctBSsreRTAEqIqA3aHg4?=
 =?us-ascii?Q?zOsFRoQUhZrWQxKOKFz+v4FyfH6qt9tls8FdYcyfqJTA2BOx4Hpe3CA2WDOC?=
 =?us-ascii?Q?TgkDDFiqOyqZW332Hfx60qc67qIPS054FbSWE5Qz2S3jau+x0IgvMpHkBc5k?=
 =?us-ascii?Q?VtK+Aj4P/6WcFoS4X2pNJeOpKVFUQXZdvNprePjRWAZDDH7B9PC7u7lCZ1dd?=
 =?us-ascii?Q?jC6GveJ80drOIDsKUjFpVJ+9wzNHyWzCHevRsguf9Uv4uvRZjXNNcijAUC9U?=
 =?us-ascii?Q?4KOMq0IosHAM4CTssRGofYssKp86MXiScGezwaaR8aem4v6/5x7ksVzkN3hS?=
 =?us-ascii?Q?MeaDWXJltZccGHzTvdH2nxdhy/8oihgLvYYTa5UMDVIfV9TelYltRZ3bfJUV?=
 =?us-ascii?Q?GA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 76946ea9-4952-42fa-2d7b-08daa060dad7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 08:18:27.6435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hw4CshQtE2Gd3UMoohQBkSvgQOPTGHQSAM7xjMmc5d+r1fqkTen92xw7R/FT66yZgnp2FQdjPo5Mk8nM2Kg/jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5495
X-Proofpoint-GUID: 7VdmxE3X-uajPIJQc_q_xsTTJ6asyePk
X-Proofpoint-ORIG-GUID: 7VdmxE3X-uajPIJQc_q_xsTTJ6asyePk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-27_02,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209270049
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 08:18:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98958

Refresh patch to avoid QA issue about patch fuzz.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../0004-Make-netgroup-support-optional.patch | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-extended/polkit/polkit/0004-Make-netgroup-support-optional.patch b/meta-oe/recipes-extended/polkit/polkit/0004-Make-netgroup-support-optional.patch
index fa273d450..218c860fb 100644
--- a/meta-oe/recipes-extended/polkit/polkit/0004-Make-netgroup-support-optional.patch
+++ b/meta-oe/recipes-extended/polkit/polkit/0004-Make-netgroup-support-optional.patch
@@ -1,4 +1,4 @@
-From 7ef2621ab7adcedc099ed39acfb73c6fa835cbc3 Mon Sep 17 00:00:00 2001
+From 5cf1a5fe6f8a24f1c95a749e3f347eeed2f591dd Mon Sep 17 00:00:00 2001
 From: "A. Wilcox" <AWilcox@Wilcox-Tech.com>
 Date: Sun, 15 May 2022 05:04:10 +0000
 Subject: [PATCH] Make netgroup support optional
@@ -37,12 +37,12 @@ Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
  9 files changed, 43 insertions(+), 8 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 59858df..5a7fc11 100644
+index 18e4223..0f87ea0 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -100,7 +100,7 @@ AC_CHECK_LIB(expat,XML_ParserCreate,[EXPAT_LIBS="-lexpat"],
- 	     [AC_MSG_ERROR([Can't find expat library. Please install expat.])])
- AC_SUBST(EXPAT_LIBS)
+@@ -117,7 +117,7 @@ CFLAGS="$CFLAGS $PTHREAD_CFLAGS"
+ CC="$PTHREAD_CC"
+ AC_CHECK_FUNCS([pthread_condattr_setclock])
  
 -AC_CHECK_FUNCS(clearenv fdatasync)
 +AC_CHECK_FUNCS(clearenv fdatasync setnetgrent)
@@ -50,7 +50,7 @@ index 59858df..5a7fc11 100644
  if test "x$GCC" = "xyes"; then
    LDFLAGS="-Wl,--as-needed $LDFLAGS"
 diff --git a/meson.build b/meson.build
-index 733bbff..d840926 100644
+index 7506231..2d9d67a 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -82,6 +82,7 @@ config_h.set('_GNU_SOURCE', true)
@@ -164,10 +164,10 @@ index 056d9a8..36c2f3d 100644
  }
  
 diff --git a/src/polkitbackend/polkitbackendjsauthority.cpp b/src/polkitbackend/polkitbackendjsauthority.cpp
-index 5027815..bcb040c 100644
+index 11e91c0..9ee0391 100644
 --- a/src/polkitbackend/polkitbackendjsauthority.cpp
 +++ b/src/polkitbackend/polkitbackendjsauthority.cpp
-@@ -1524,6 +1524,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
+@@ -1291,6 +1291,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
  
    JS::CallArgs args = JS::CallArgsFromVp (argc, vp);
  
@@ -175,7 +175,7 @@ index 5027815..bcb040c 100644
    JS::RootedString usrstr (authority->priv->cx);
    usrstr = args[0].toString();
    user = JS_EncodeStringToUTF8 (cx, usrstr);
-@@ -1538,6 +1539,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
+@@ -1305,6 +1306,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
      {
        is_in_netgroup =  true;
      }
@@ -233,7 +233,7 @@ index 3701ba1..e1d211e 100644
    return g_test_run ();
  }
 diff --git a/test/polkitbackend/test-polkitbackendjsauthority.c b/test/polkitbackend/test-polkitbackendjsauthority.c
-index f97e0e0..fc52149 100644
+index 2103b17..b187a2f 100644
 --- a/test/polkitbackend/test-polkitbackendjsauthority.c
 +++ b/test/polkitbackend/test-polkitbackendjsauthority.c
 @@ -137,12 +137,14 @@ test_get_admin_identities (void)
-- 
2.37.1


