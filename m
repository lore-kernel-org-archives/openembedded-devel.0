Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99127C54E67
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 13:22:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.16053.1711632173599568867
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Mar 2024 06:22:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=RTJqO6h4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=481736fa43=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 42SChqEs016017
	for <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 13:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=vHcuGPGj6mkxS4TpCX
	WJSSuEgN0sUBHdM9bAc7/yrg0=; b=RTJqO6h4vjDqOyYLsZ9OzJSxNqQTNQmq+N
	kg9AQGBrGr7VVIJrN3qU9Y6ZHbfRiFvycUBvpPzSdhur3NXiRxSe7gvvyIXmsoc5
	Zoq+hUlBYOo9KITPIlY5N69gHabtBd1NY58KNKGNbgQXFtje/syB+DqcupxFpzzw
	MF/9OaGGMiE9jzsqUNfIakQZl2RPwKLcfuN9lVGtERhUGkRUCjTR+vwLg5LwR1pw
	qp/FGh0xP5CNJQ/fixoquChW3UdM5oHcmJP2SKb8IfwuM7XvSvBkFoTvOm9xDn2+
	AkZgm4cfCFGdiObw/dSqVrI+jIJUhz59PJt43Au+8GnB6adth/lA==
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x1p26pve5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 13:22:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZdBbIK1a2gQdDMhJED+KNBfTrDNiVjRS78AslMSJKGmfPsaqyhwSPHJLYuiyr9jiUvfL8hJTYKEaxmuiIWLNkHqyahectTobMHC3fTFVxZa6Bkn/zah0NLSw3veMm6aFaNexuee8LuYnP//2ul3AoXTpo5pJ3Xu+/C5w7u0VmQMm/CH8hv7w1Uh0G71bkzHjUZRRm6rj5wTLCRg8F4qtrlUX/FZlkIuFNrDZFiPDohFm7sIRooa1UR4cUTZQscT7LiDla5W8bXPx/rHCJqKmf9jr0OUJaNyAuJ71eLWP7U+6MuFXrbjjasDZvyUfqpeQd5OntxEfwJL8uyBAM6GUgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHcuGPGj6mkxS4TpCXWJSSuEgN0sUBHdM9bAc7/yrg0=;
 b=NAbf2TJEv8YhHntwgnO7anCEsE8bdjrcdkdvPqQReBuRmtk3ZtpTEGVcANhgxstvitnmqudh90RZQkfsd0F1doUivMa8ec9GyP3EPB1hQjtVAItNww6Y8XTcOltMEr9BqcRLejVqpCHEf+iGHquOmLIfq/SmW61Ix47ZNJPik8j1tQKouUTULFCG3QeExa2B3miP3Nfqw44H+9eR+X2u4p991Xhmy5UMMczH5b6YKhVXm6roUgXo474awLLfF0Bc04QmxSbLD9yO9CwgQHBYMqM/qSAeQxrUHMu6WOd+Hj8u0hotPXc6u9Fe0qaI4UH7UFvGdVUA1F3m7BkvRUHNCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by DM6PR11MB4594.namprd11.prod.outlook.com (2603:10b6:5:2a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.39; Thu, 28 Mar
 2024 13:22:49 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::ac1c:eab6:e008:9b74]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::ac1c:eab6:e008:9b74%5]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 13:22:49 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>
Subject: Re: [oe][meta-oe][kirkstone][PATCH V2 1/1] nodejs: fix CVE-2024-22019
Thread-Topic: [oe][meta-oe][kirkstone][PATCH V2 1/1] nodejs: fix
 CVE-2024-22019
Thread-Index: AQHaaSNAX5BQ4TKrD0qkZR5YaWQAJrFNU6jF
Date: Thu, 28 Mar 2024 13:22:49 +0000
Message-ID: 
 <MW4PR11MB58220DFA642C684908FF9DAB843B2@MW4PR11MB5822.namprd11.prod.outlook.com>
References: <17B796B477775AF6.14830@lists.openembedded.org>
In-Reply-To: <17B796B477775AF6.14830@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|DM6PR11MB4594:EE_
x-ms-office365-filtering-correlation-id: 7b29d1f8-9c4c-44bd-c677-08dc4f2a2a34
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 937xJkxYp9PsSFriiqBALTpmtyrPoq/AXM/b/tk5L06FdRIfi2lecOKNO+I0QYdM9tWxpqLqvSu/9T8RX70WxK5tV7zepgaAW4iDPwANaY7ZXoSeXSrMlf5B1gBGNurCAR32asFx58S+K0TFLrx1NxTBkTGn+az02VK2wJkXF27547uP2ACC2T5/X2E0szygsq/pAwA7IXsLUJaVb8xYmUNpTUzj7fQvhO0k4DvA3+ynCA2HgYbKU5BO94OInN+OqBbI3+Rt4kcd7s7b/sTgNwIQNrVOcH4JXsPjMmKAWjjkTIlgJkQld38DJ+6VIfuZYn3HH9vjzpir5mKxovaJu6yEssdOvJVMveZSZUyws8kbuWFRdvf5rFivNQtzssLPqFX+3vFSHAuJ0+pZDLo/n+F9blfIrGQCL9fXksWLE12R6El/5tuNqQHRRWLxBSqDF5Zm5Q1LGyN+tgxJWpEKGUeNN+WgY9dt6xTctm2t/9RufQ34GMOQhZLkQksqZObKeLyT/JdQQ4QHn2nQ4vh/CQ4xam9BwsItHr6KtiFr8f1dbaxr41l77/ujqERpXqFAi3I+q41eAmuc8pKmfJQYEG6AUtDWmCk21aUdcvLbHpSZXnQp44G8gjxJQ8S5JRvCqvFufH+62j9a7dpm0HPGuyaDaIA8Jk5aVvzPDZfitao=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?6RWWiOBJjKpQ1GNLDVd+Fp/B7jtBcp14gUfsY71i0IoRAN3NrnpqN7A7XOTR?=
 =?us-ascii?Q?sdiCJ5gyThTSkYOxJaqenNPOcTJZD6XvoPMVbHKwzsMXq0fuU0ktb3FgxVAf?=
 =?us-ascii?Q?o11MOmnJP2yH3WyqjhjVGNt2FvAzXEMRir5jkanbH6QOTF+24o1sfxKIBA/S?=
 =?us-ascii?Q?UIMW01XsK+Lffxh/DYxhmCONJejAxCPmbHqif8GOKjojasaMtwOQGFL0Lzz3?=
 =?us-ascii?Q?kyJwMy+VlLSbcMhPad7GjLYzVMGLKgTVLdh/lw1gY7ReDQa30l8HQ5vhMxgm?=
 =?us-ascii?Q?SJq+OF2p1dWz+yXef3LkKYlg1TpBhByH7ozPTa+yPli4SStAo0iix3EdWwOR?=
 =?us-ascii?Q?UyLv5BgmVKSfbyNeHj/Q85ADxkSrOvd2aJ1sQK27LAc8gMLZRY+SOYoG7f0c?=
 =?us-ascii?Q?DhI4CVOybZGpbKyZJSo2DKPdxU0SshIFvqbvV2zhwIzpaRMV2a2dVmhXIL5+?=
 =?us-ascii?Q?bK6VFe2mI5FlXVIb4LCCRXtZ6NZrsCm16JATHo2Q3UH5560O8zSPQwNCQs8a?=
 =?us-ascii?Q?pYEk6ggNE1iOXB6ALVOhR1c2NiK837oKMYISKc7SYGKl4LpCtAd8+pb7DkpZ?=
 =?us-ascii?Q?BaVuOhCpB4fHpxUOTnY2RwGi461pxQfT9a1fXljJBcqqeMgwa82whghZyUc8?=
 =?us-ascii?Q?XeC7f3mcShsoGemg/mIzgT1u9KOqgDL7gG1657gRl3Dm8viEzcBBQrE+JKf/?=
 =?us-ascii?Q?odQbJEMFswSxL/3s1/VfISt2UdA3Wwbr//KPAUSuKsdlfOFoslHzPIFYMl03?=
 =?us-ascii?Q?G3G9aBK8LREhhDVn3tBbx7wWjlgb/bjjNm9VjuZcFp5RLWJRutbH99GQqITT?=
 =?us-ascii?Q?v3Tc8ApI5+Tu3PVAqX8kEJ2gvud1jgcb6VRLGCv7AEMTS1Yijh5oaSoQYbnO?=
 =?us-ascii?Q?Jp94yB8MgAxnIBMTlAQ8BBUaOZbnMW3pXZPCfsbOQ5V1eNv6VKBjD7IcL26m?=
 =?us-ascii?Q?Kaj7SIsIZ0QwUjMbtvp++8HGDNWeBXcOuKIjZ2ri3T4/zsnIF+lf9bDgkIAu?=
 =?us-ascii?Q?q1yMSdRqt89DcamexvEWVBDUIOf0TuFmFqf6A+spHE5vb1fBDGoQhoSX93C5?=
 =?us-ascii?Q?VBTcudsUq+KOtfmt2JqV0Ce6V8wlxCSv3niw59QLK7uN46l/gYkyBbUVph2b?=
 =?us-ascii?Q?Xknd2zpToW3vQMteApGGwLfWNzny2DjbRNYRLQyiyxUiFafHAVTEt8/szIVe?=
 =?us-ascii?Q?YLJyKitav+7nHjmFhSbJYBaiQsBu9M1w2s1Jm8dPjtsT2+m3Q733ZJUL4rvs?=
 =?us-ascii?Q?XebK91ClpCHZmU5/SGAf7gd64IqWB4BRveQtj1oaZL7zP8rFqHKw5JOmpD5K?=
 =?us-ascii?Q?NRpKROvTU7emh3dUz1ZuKYgzshrqlpTaW/YCkCB5qHWVpmtfQhj7U3uqiatM?=
 =?us-ascii?Q?F9PaDgFayuhPOPaaXINQ+jOAVidCEg3jZsdnGIwxzZcPydgSxO6bEyASJO82?=
 =?us-ascii?Q?3VyHet+Au09XsSNfXBdFcm1nHwwhveigrKi7GxR58gWwNjDzkm8azPuofR1F?=
 =?us-ascii?Q?NbaA0lfZmMldsk3eOZHJ8ikPd6iOYZtQMzpUXk3XVW6NzDL5K0fCJzM+VzdP?=
 =?us-ascii?Q?AgE7pcCKkXIC/vYc3aKeerI1yh0apDcAsuwU6kKAzxjCxSJInbLDDsZjJdxX?=
 =?us-ascii?Q?wg=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB58220DFA642C684908FF9DAB843B2MW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b29d1f8-9c4c-44bd-c677-08dc4f2a2a34
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2024 13:22:49.4801
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hEVyRGbqExtcbdwvlS8/GDs/7gXDn3j/7k+evf9yp0wNMXoBl8TFvrmYCleDYLAHDsj+5S5VtTx3QIau2ABoJbIRyZbjRp4ewOUivi4h4m21ndMuye0nbAJ0OOwXbHpI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4594
X-Proofpoint-ORIG-GUID: TqJ8ViZrFYnVAGo_nHO1H6MQnLV9KwHd
X-Proofpoint-GUID: TqJ8ViZrFYnVAGo_nHO1H6MQnLV9KwHd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-28_13,2024-03-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 adultscore=0 mlxscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403280091
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 13:22:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109669

--_000_MW4PR11MB58220DFA642C684908FF9DAB843B2MW4PR11MB5822namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reminder!
________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Polampalli, Archana via lists.openembedded.or=
g <archana.polampalli=3Dwindriver.com@lists.openembedded.org>
Sent: Tuesday, February 27, 2024 07:47
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH V2 1/1] nodejs: fix CVE-2024-22019

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../nodejs/nodejs/CVE-2024-22019.patch        | 556 ++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_16.20.2.bb |   1 +
 2 files changed, 557 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-22019.p=
atch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-22019.patch b/=
meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-22019.patch
new file mode 100644
index 000000000..ca1c7981c
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-22019.patch
@@ -0,0 +1,556 @@
+From 911cb33cdadab57a75f97186290ea8f3903a6171 Mon Sep 17 00:00:00 2001
+From: Paolo Insogna <paolo@cowtech.it>
+Date: Tue, 9 Jan 2024 18:10:04 +0100
+Subject: [PATCH] http: add maximum chunk extension size
+
+PR-URL: https://github.com/nodejs-private/node-private/pull/520
+Refs: https://github.com/nodejs-private/node-private/pull/518
+
+CVE-ID: CVE-2024-22019
+
+Upstream-Status: Backport [https://github.com/nodejs/node/commit/911cb33cd=
adab57a]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ deps/llhttp/CMakeLists.txt                    |   2 +-
+ deps/llhttp/include/llhttp.h                  |   7 +-
+ deps/llhttp/src/api.c                         |   7 +
+ deps/llhttp/src/llhttp.c                      | 122 ++++++++++++++--
+ doc/api/errors.md                             |  12 ++
+ lib/_http_server.js                           |   8 ++
+ src/node_http_parser.cc                       |  20 ++-
+ .../test-http-chunk-extensions-limit.js       | 131 ++++++++++++++++++
+ tools/update-llhttp.sh                        |   2 +-
+ 9 files changed, 292 insertions(+), 19 deletions(-)
+ create mode 100644 test/parallel/test-http-chunk-extensions-limit.js
+
+diff --git a/deps/llhttp/CMakeLists.txt b/deps/llhttp/CMakeLists.txt
+index d038203..747564a 100644
+--- a/deps/llhttp/CMakeLists.txt
++++ b/deps/llhttp/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ cmake_minimum_required(VERSION 3.5.1)
+ cmake_policy(SET CMP0069 NEW)
+
+-project(llhttp VERSION 6.0.11)
++project(llhttp VERSION 6.1.0)
+ include(GNUInstallDirs)
+
+ set(CMAKE_C_STANDARD 99)
+diff --git a/deps/llhttp/include/llhttp.h b/deps/llhttp/include/llhttp.h
+index 2da66f1..78f27ab 100644
+--- a/deps/llhttp/include/llhttp.h
++++ b/deps/llhttp/include/llhttp.h
+@@ -2,8 +2,8 @@
+ #define INCLUDE_LLHTTP_H_
+
+ #define LLHTTP_VERSION_MAJOR 6
+-#define LLHTTP_VERSION_MINOR 0
+-#define LLHTTP_VERSION_PATCH 11
++#define LLHTTP_VERSION_MINOR 1
++#define LLHTTP_VERSION_PATCH 0
+
+ #ifndef LLHTTP_STRICT_MODE
+ # define LLHTTP_STRICT_MODE 0
+@@ -348,6 +348,9 @@ struct llhttp_settings_s {
+    */
+   llhttp_cb      on_headers_complete;
+
++  /* Possible return values 0, -1, HPE_USER */
++  llhttp_data_cb on_chunk_parameters;
++
+   /* Possible return values 0, -1, HPE_USER */
+   llhttp_data_cb on_body;
+
+diff --git a/deps/llhttp/src/api.c b/deps/llhttp/src/api.c
+index c4ce197..d3065b3 100644
+--- a/deps/llhttp/src/api.c
++++ b/deps/llhttp/src/api.c
+@@ -355,6 +355,13 @@ int llhttp__on_chunk_header(llhttp_t* s, const char* =
p, const char* endp) {
+ }
+
+
++int llhttp__on_chunk_parameters(llhttp_t* s, const char* p, const char* e=
ndp) {
++  int err;
++  SPAN_CALLBACK_MAYBE(s, on_chunk_parameters, p, endp - p);
++  return err;
++}
++
++
+ int llhttp__on_chunk_complete(llhttp_t* s, const char* p, const char* end=
p) {
+   int err;
+   CALLBACK_MAYBE(s, on_chunk_complete);
+diff --git a/deps/llhttp/src/llhttp.c b/deps/llhttp/src/llhttp.c
+index 5e7c5d1..5eb19f6 100644
+--- a/deps/llhttp/src/llhttp.c
++++ b/deps/llhttp/src/llhttp.c
+@@ -340,6 +340,8 @@ enum llparse_state_e {
+   s_n_llhttp__internal__n_invoke_is_equal_content_length,
+   s_n_llhttp__internal__n_chunk_size_almost_done,
+   s_n_llhttp__internal__n_chunk_parameters,
++  s_n_llhttp__internal__n_span_start_llhttp__on_chunk_parameters,
++  s_n_llhttp__internal__n_chunk_parameters_ows,
+   s_n_llhttp__internal__n_chunk_size_otherwise,
+   s_n_llhttp__internal__n_chunk_size,
+   s_n_llhttp__internal__n_chunk_size_digit,
+@@ -539,6 +541,10 @@ int llhttp__on_body(
+     llhttp__internal_t* s, const unsigned char* p,
+     const unsigned char* endp);
+
++int llhttp__on_chunk_parameters(
++    llhttp__internal_t* s, const unsigned char* p,
++    const unsigned char* endp);
++
+ int llhttp__on_status(
+     llhttp__internal_t* s, const unsigned char* p,
+     const unsigned char* endp);
+@@ -1226,8 +1232,7 @@ static llparse_state_t llhttp__internal__run(
+           goto s_n_llhttp__internal__n_chunk_parameters;
+         }
+         case 2: {
+-          p++;
+-          goto s_n_llhttp__internal__n_chunk_size_almost_done;
++        goto s_n_llhttp__internal__n_span_end_llhttp__on_chunk_parameters=
;
+         }
+         default: {
+           goto s_n_llhttp__internal__n_error_10;
+@@ -1236,6 +1241,34 @@ static llparse_state_t llhttp__internal__run(
+       /* UNREACHABLE */;
+       abort();
+     }
++    case s_n_llhttp__internal__n_span_start_llhttp__on_chunk_parameters:
++    s_n_llhttp__internal__n_span_start_llhttp__on_chunk_parameters: {
++      if (p =3D=3D endp) {
++        return s_n_llhttp__internal__n_span_start_llhttp__on_chunk_parame=
ters;
++      }
++      state->_span_pos0 =3D (void*) p;
++      state->_span_cb0 =3D llhttp__on_chunk_parameters;
++      goto s_n_llhttp__internal__n_chunk_parameters;
++      /* UNREACHABLE */;
++      abort();
++    }
++    case s_n_llhttp__internal__n_chunk_parameters_ows:
++    s_n_llhttp__internal__n_chunk_parameters_ows: {
++      if (p =3D=3D endp) {
++        return s_n_llhttp__internal__n_chunk_parameters_ows;
++      }
++      switch (*p) {
++        case ' ': {
++          p++;
++          goto s_n_llhttp__internal__n_chunk_parameters_ows;
++        }
++        default: {
++          goto s_n_llhttp__internal__n_span_start_llhttp__on_chunk_parame=
ters;
++        }
++      }
++      /* UNREACHABLE */;
++      abort();
++    }
+     case s_n_llhttp__internal__n_chunk_size_otherwise:
+     s_n_llhttp__internal__n_chunk_size_otherwise: {
+       if (p =3D=3D endp) {
+@@ -1246,13 +1279,9 @@ static llparse_state_t llhttp__internal__run(
+           p++;
+           goto s_n_llhttp__internal__n_chunk_size_almost_done;
+         }
+-        case ' ': {
+-          p++;
+-          goto s_n_llhttp__internal__n_chunk_parameters;
+-        }
+         case ';': {
+           p++;
+-          goto s_n_llhttp__internal__n_chunk_parameters;
++          goto s_n_llhttp__internal__n_chunk_parameters_ows;
+         }
+         default: {
+           goto s_n_llhttp__internal__n_error_11;
+@@ -6074,6 +6103,24 @@ static llparse_state_t llhttp__internal__run(
+     /* UNREACHABLE */;
+     abort();
+   }
++  s_n_llhttp__internal__n_span_end_llhttp__on_chunk_parameters: {
++    const unsigned char* start;
++    int err;
++
++    start =3D state->_span_pos0;
++    state->_span_pos0 =3D NULL;
++    err =3D llhttp__on_chunk_parameters(state, start, p);
++    if (err !=3D 0) {
++      state->error =3D err;
++      state->error_pos =3D (const char*) (p + 1);
++      state->_current =3D (void*) (intptr_t) s_n_llhttp__internal__n_chun=
k_size_almost_done;
++      return s_error;
++    }
++    p++;
++    goto s_n_llhttp__internal__n_chunk_size_almost_done;
++    /* UNREACHABLE */;
++    abort();
++  }
+   s_n_llhttp__internal__n_error_10: {
+     state->error =3D 0x2;
+     state->reason =3D "Invalid character in chunk parameters";
+@@ -8441,6 +8488,8 @@ enum llparse_state_e {
+   s_n_llhttp__internal__n_invoke_is_equal_content_length,
+   s_n_llhttp__internal__n_chunk_size_almost_done,
+   s_n_llhttp__internal__n_chunk_parameters,
++  s_n_llhttp__internal__n_span_start_llhttp__on_chunk_parameters,
++  s_n_llhttp__internal__n_chunk_parameters_ows,
+   s_n_llhttp__internal__n_chunk_size_otherwise,
+   s_n_llhttp__internal__n_chunk_size,
+   s_n_llhttp__internal__n_chunk_size_digit,
+@@ -8635,6 +8684,10 @@ int llhttp__on_body(
+     llhttp__internal_t* s, const unsigned char* p,
+     const unsigned char* endp);
+
++int llhttp__on_chunk_parameters(
++    llhttp__internal_t* s, const unsigned char* p,
++    const unsigned char* endp);
++
+ int llhttp__on_status(
+     llhttp__internal_t* s, const unsigned char* p,
+     const unsigned char* endp);
+@@ -9299,8 +9352,7 @@ static llparse_state_t llhttp__internal__run(
+           goto s_n_llhttp__internal__n_chunk_parameters;
+         }
+         case 2: {
+-          p++;
+-          goto s_n_llhttp__internal__n_chunk_size_almost_done;
++        goto s_n_llhttp__internal__n_span_end_llhttp__on_chunk_parameters=
;
+         }
+         default: {
+           goto s_n_llhttp__internal__n_error_6;
+@@ -9309,6 +9361,34 @@ static llparse_state_t llhttp__internal__run(
+       /* UNREACHABLE */;
+       abort();
+     }
++    case s_n_llhttp__internal__n_span_start_llhttp__on_chunk_parameters:
++    s_n_llhttp__internal__n_span_start_llhttp__on_chunk_parameters: {
++      if (p =3D=3D endp) {
++        return s_n_llhttp__internal__n_span_start_llhttp__on_chunk_parame=
ters;
++      }
++      state->_span_pos0 =3D (void*) p;
++      state->_span_cb0 =3D llhttp__on_chunk_parameters;
++      goto s_n_llhttp__internal__n_chunk_parameters;
++      /* UNREACHABLE */;
++      abort();
++    }
++    case s_n_llhttp__internal__n_chunk_parameters_ows:
++    s_n_llhttp__internal__n_chunk_parameters_ows: {
++      if (p =3D=3D endp) {
++        return s_n_llhttp__internal__n_chunk_parameters_ows;
++      }
++      switch (*p) {
++        case ' ': {
++          p++;
++          goto s_n_llhttp__internal__n_chunk_parameters_ows;
++        }
++        default: {
++          goto s_n_llhttp__internal__n_span_start_llhttp__on_chunk_parame=
ters;
++        }
++      }
++      /* UNREACHABLE */;
++      abort();
++    }
+     case s_n_llhttp__internal__n_chunk_size_otherwise:
+     s_n_llhttp__internal__n_chunk_size_otherwise: {
+       if (p =3D=3D endp) {
+@@ -9319,13 +9399,9 @@ static llparse_state_t llhttp__internal__run(
+           p++;
+           goto s_n_llhttp__internal__n_chunk_size_almost_done;
+         }
+-        case ' ': {
+-          p++;
+-          goto s_n_llhttp__internal__n_chunk_parameters;
+-        }
+         case ';': {
+           p++;
+-          goto s_n_llhttp__internal__n_chunk_parameters;
++          goto s_n_llhttp__internal__n_chunk_parameters_ows;
+         }
+         default: {
+           goto s_n_llhttp__internal__n_error_7;
+@@ -13951,6 +14027,24 @@ static llparse_state_t llhttp__internal__run(
+     /* UNREACHABLE */;
+     abort();
+   }
++  s_n_llhttp__internal__n_span_end_llhttp__on_chunk_parameters: {
++    const unsigned char* start;
++    int err;
++
++    start =3D state->_span_pos0;
++    state->_span_pos0 =3D NULL;
++    err =3D llhttp__on_chunk_parameters(state, start, p);
++    if (err !=3D 0) {
++      state->error =3D err;
++      state->error_pos =3D (const char*) (p + 1);
++      state->_current =3D (void*) (intptr_t) s_n_llhttp__internal__n_chun=
k_size_almost_done;
++      return s_error;
++    }
++    p++;
++    goto s_n_llhttp__internal__n_chunk_size_almost_done;
++    /* UNREACHABLE */;
++    abort();
++  }
+   s_n_llhttp__internal__n_error_6: {
+     state->error =3D 0x2;
+     state->reason =3D "Invalid character in chunk parameters";
+diff --git a/doc/api/errors.md b/doc/api/errors.md
+index dcf8744..a76bfe5 100644
+--- a/doc/api/errors.md
++++ b/doc/api/errors.md
+@@ -3043,6 +3043,18 @@ malconfigured clients, if more than 8 KiB of HTTP h=
eader data is received then
+ HTTP parsing will abort without a request or response object being create=
d, and
+ an `Error` with this code will be emitted.
+
++<a id=3D"HPE_CHUNK_EXTENSIONS_OVERFLOW"></a>
++
++### `HPE_CHUNK_EXTENSIONS_OVERFLOW`
++
++<!-- YAML
++added: REPLACEME
++-->
++
++Too much data was received for a chunk extensions. In order to protect ag=
ainst
++malicious or malconfigured clients, if more than 16 KiB of data is receiv=
ed
++then an `Error` with this code will be emitted.
++
+ <a id=3D"HPE_UNEXPECTED_CONTENT_LENGTH"></a>
+
+ ### `HPE_UNEXPECTED_CONTENT_LENGTH`
+diff --git a/lib/_http_server.js b/lib/_http_server.js
+index 4e23266..263bb52 100644
+--- a/lib/_http_server.js
++++ b/lib/_http_server.js
+@@ -706,6 +706,11 @@ const requestHeaderFieldsTooLargeResponse =3D Buffer.=
from(
+   `HTTP/1.1 431 ${STATUS_CODES[431]}\r\n` +
+   'Connection: close\r\n\r\n', 'ascii'
+ );
++const requestChunkExtensionsTooLargeResponse =3D Buffer.from(
++  `HTTP/1.1 413 ${STATUS_CODES[413]}\r\n` +
++  'Connection: close\r\n\r\n', 'ascii',
++);
++
+ function socketOnError(e) {
+   // Ignore further errors
+   this.removeListener('error', socketOnError);
+@@ -719,6 +724,9 @@ function socketOnError(e) {
+         case 'HPE_HEADER_OVERFLOW':
+           response =3D requestHeaderFieldsTooLargeResponse;
+           break;
++      case 'HPE_CHUNK_EXTENSIONS_OVERFLOW':
++          response =3D requestChunkExtensionsTooLargeResponse;
++          break;
+         case 'ERR_HTTP_REQUEST_TIMEOUT':
+           response =3D requestTimeoutResponse;
+           break;
+diff --git a/src/node_http_parser.cc b/src/node_http_parser.cc
+index 74f3248..b92e848 100644
+--- a/src/node_http_parser.cc
++++ b/src/node_http_parser.cc
+@@ -79,6 +79,8 @@ const uint32_t kOnExecute =3D 5;
+ const uint32_t kOnTimeout =3D 6;
+ // Any more fields than this will be flushed into JS
+ const size_t kMaxHeaderFieldsCount =3D 32;
++// Maximum size of chunk extensions
++const size_t kMaxChunkExtensionsSize =3D 16384;
+
+ const uint32_t kLenientNone =3D 0;
+ const uint32_t kLenientHeaders =3D 1 << 0;
+@@ -206,6 +208,7 @@ class Parser : public AsyncWrap, public StreamListener=
 {
+
+   int on_message_begin() {
+     num_fields_ =3D num_values_ =3D 0;
++    chunk_extensions_nread_ =3D 0;
+     url_.Reset();
+     status_message_.Reset();
+     header_parsing_start_time_ =3D uv_hrtime();
+@@ -443,9 +446,22 @@ class Parser : public AsyncWrap, public StreamListene=
r {
+     return 0;
+   }
+
+-  // Reset nread for the next chunk
++  int on_chunk_extension(const char* at, size_t length) {
++    chunk_extensions_nread_ +=3D length;
++
++    if (chunk_extensions_nread_ > kMaxChunkExtensionsSize) {
++      llhttp_set_error_reason(&parser_,
++        "HPE_CHUNK_EXTENSIONS_OVERFLOW:Chunk extensions overflow");
++      return HPE_USER;
++    }
++
++    return 0;
++  }
++
++  // Reset nread for the next chunk and also reset the extensions counter
+   int on_chunk_header() {
+     header_nread_ =3D 0;
++    chunk_extensions_nread_ =3D 0;
+     return 0;
+   }
+
+@@ -887,6 +903,7 @@ class Parser : public AsyncWrap, public StreamListener=
 {
+   const char* current_buffer_data_;
+   bool pending_pause_ =3D false;
+   uint64_t header_nread_ =3D 0;
++  uint64_t chunk_extensions_nread_ =3D 0;
+   uint64_t max_http_header_size_;
+   uint64_t headers_timeout_;
+   uint64_t header_parsing_start_time_ =3D 0;
+@@ -921,6 +938,7 @@ const llhttp_settings_t Parser::settings =3D {
+   Proxy<DataCall, &Parser::on_header_field>::Raw,
+   Proxy<DataCall, &Parser::on_header_value>::Raw,
+   Proxy<Call, &Parser::on_headers_complete>::Raw,
++  Proxy<DataCall, &Parser::on_chunk_extension>::Raw,
+   Proxy<DataCall, &Parser::on_body>::Raw,
+   Proxy<Call, &Parser::on_message_complete>::Raw,
+   Proxy<Call, &Parser::on_chunk_header>::Raw,
+diff --git a/test/parallel/test-http-chunk-extensions-limit.js b/test/para=
llel/test-http-chunk-extensions-limit.js
+new file mode 100644
+index 0000000..6868b3d
+--- /dev/null
++++ b/test/parallel/test-http-chunk-extensions-limit.js
+@@ -0,0 +1,131 @@
++'use strict';
++
++const common =3D require('../common');
++const http =3D require('http');
++const net =3D require('net');
++const assert =3D require('assert');
++
++// Verify that chunk extensions are limited in size when sent all togethe=
r.
++{
++  const server =3D http.createServer((req, res) =3D> {
++    req.on('end', () =3D> {
++      res.writeHead(200, { 'Content-Type': 'text/plain' });
++      res.end('bye');
++    });
++
++    req.resume();
++  });
++
++  server.listen(0, () =3D> {
++    const sock =3D net.connect(server.address().port);
++    let data =3D '';
++
++    sock.on('data', (chunk) =3D> data +=3D chunk.toString('utf-8'));
++
++    sock.on('end', common.mustCall(function() {
++      assert.strictEqual(data, 'HTTP/1.1 413 Payload Too Large\r\nConnect=
ion: close\r\n\r\n');
++      server.close();
++    }));
++
++    sock.end('' +
++      'GET / HTTP/1.1\r\n' +
++      'Host: localhost:8080\r\n' +
++      'Transfer-Encoding: chunked\r\n\r\n' +
++      '2;' + 'A'.repeat(20000) + '=3Dbar\r\nAA\r\n' +
++      '0\r\n\r\n'
++    );
++  });
++}
++
++// Verify that chunk extensions are limited in size when sent in interval=
s.
++{
++  const server =3D http.createServer((req, res) =3D> {
++    req.on('end', () =3D> {
++      res.writeHead(200, { 'Content-Type': 'text/plain' });
++      res.end('bye');
++    });
++
++    req.resume();
++  });
++
++  server.listen(0, () =3D> {
++    const sock =3D net.connect(server.address().port);
++    let remaining =3D 20000;
++    let data =3D '';
++
++    const interval =3D setInterval(
++      () =3D> {
++        if (remaining > 0) {
++          sock.write('A'.repeat(1000));
++        } else {
++          sock.write('=3Dbar\r\nAA\r\n0\r\n\r\n');
++          clearInterval(interval);
++        }
++
++        remaining -=3D 1000;
++      },
++      common.platformTimeout(20),
++    ).unref();
++
++    sock.on('data', (chunk) =3D> data +=3D chunk.toString('utf-8'));
++
++    sock.on('end', common.mustCall(function() {
++      assert.strictEqual(data, 'HTTP/1.1 413 Payload Too Large\r\nConnect=
ion: close\r\n\r\n');
++      server.close();
++    }));
++
++    sock.write('' +
++    'GET / HTTP/1.1\r\n' +
++    'Host: localhost:8080\r\n' +
++    'Transfer-Encoding: chunked\r\n\r\n' +
++    '2;'
++    );
++  });
++}
++
++// Verify the chunk extensions is correctly reset after a chunk
++{
++  const server =3D http.createServer((req, res) =3D> {
++    req.on('end', () =3D> {
++      res.writeHead(200, { 'content-type': 'text/plain', 'connection': 'c=
lose', 'date': 'now' });
++      res.end('bye');
++    });
++
++    req.resume();
++  });
++
++  server.listen(0, () =3D> {
++    const sock =3D net.connect(server.address().port);
++    let data =3D '';
++
++    sock.on('data', (chunk) =3D> data +=3D chunk.toString('utf-8'));
++
++    sock.on('end', common.mustCall(function() {
++      assert.strictEqual(
++        data,
++        'HTTP/1.1 200 OK\r\n' +
++        'content-type: text/plain\r\n' +
++        'connection: close\r\n' +
++        'date: now\r\n' +
++        'Transfer-Encoding: chunked\r\n' +
++        '\r\n' +
++        '3\r\n' +
++        'bye\r\n' +
++        '0\r\n' +
++        '\r\n',
++      );
++
++      server.close();
++    }));
++
++    sock.end('' +
++      'GET / HTTP/1.1\r\n' +
++      'Host: localhost:8080\r\n' +
++      'Transfer-Encoding: chunked\r\n\r\n' +
++      '2;' + 'A'.repeat(10000) + '=3Dbar\r\nAA\r\n' +
++      '2;' + 'A'.repeat(10000) + '=3Dbar\r\nAA\r\n' +
++      '2;' + 'A'.repeat(10000) + '=3Dbar\r\nAA\r\n' +
++      '0\r\n\r\n'
++    );
++  });
++}
+diff --git a/tools/update-llhttp.sh b/tools/update-llhttp.sh
+index 12e2f46..a95eef1 100755
+--- a/tools/update-llhttp.sh
++++ b/tools/update-llhttp.sh
+@@ -59,5 +59,5 @@ echo ""
+ echo "Please git add llhttp, commit the new version:"
+ echo ""
+ echo "$ git add -A deps/llhttp"
+-echo "$ git commit -m \"deps: update nghttp2 to $LLHTTP_VERSION\""
++echo "$ git commit -m \"deps: update llhttp to $LLHTTP_VERSION\""
+ echo ""
+--
+2.40.0
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb b/meta-oe/re=
cipes-devtools/nodejs/nodejs_16.20.2.bb
index 16593a0fe..b786c0273 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
@@ -27,6 +27,7 @@ SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.ta=
r.xz \
            file://0001-mips-Use-32bit-cast-for-operand-on-mips32.patch \
            file://0001-Nodejs-Fixed-pipes-DeprecationWarning.patch \
            file://CVE-2022-25883.patch \
+           file://CVE-2024-22019.patch \
            "
 SRC_URI:append:class-target =3D " \
            file://0001-Using-native-binaries.patch \
--
2.40.0


--_000_MW4PR11MB58220DFA642C684908FF9DAB843B2MW4PR11MB5822namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Reminder!</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-devel@li=
sts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; on b=
ehalf of Polampalli, Archana via lists.openembedded.org
 &lt;archana.polampalli=3Dwindriver.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Tuesday, February 27, 2024 07:47<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Subject:</b> [oe][meta-oe][kirkstone][PATCH V2 1/1] nodejs: fix CVE-2024=
-22019</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Archana Polampalli &lt;archana.polampalli@wi=
ndriver.com&gt;<br>
<br>
Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;<=
br>
---<br>
&nbsp;.../nodejs/nodejs/CVE-2024-22019.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; | 556 ++++++++++++++++++<br>
&nbsp;.../recipes-devtools/nodejs/nodejs_16.20.2.bb |&nbsp;&nbsp; 1 +<br>
&nbsp;2 files changed, 557 insertions(+)<br>
&nbsp;create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-22=
019.patch<br>
<br>
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-22019.patch b/=
meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-22019.patch<br>
new file mode 100644<br>
index 000000000..ca1c7981c<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-22019.patch<br>
@@ -0,0 +1,556 @@<br>
+From 911cb33cdadab57a75f97186290ea8f3903a6171 Mon Sep 17 00:00:00 2001<br>
+From: Paolo Insogna &lt;paolo@cowtech.it&gt;<br>
+Date: Tue, 9 Jan 2024 18:10:04 +0100<br>
+Subject: [PATCH] http: add maximum chunk extension size<br>
+<br>
+PR-URL: <a href=3D"https://github.com/nodejs-private/node-private/pull/520=
">https://github.com/nodejs-private/node-private/pull/520</a><br>
+Refs: <a href=3D"https://github.com/nodejs-private/node-private/pull/518">=
https://github.com/nodejs-private/node-private/pull/518</a><br>
+<br>
+CVE-ID: CVE-2024-22019<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/nodejs/node/commi=
t/911cb33cdadab57a">https://github.com/nodejs/node/commit/911cb33cdadab57a<=
/a>]<br>
+<br>
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
<br>
+---<br>
+ deps/llhttp/CMakeLists.txt&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;=
&nbsp; 2 +-<br>
+ deps/llhttp/include/llhttp.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 7 +=
-<br>
+ deps/llhttp/src/api.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 7 +<br>
+ deps/llhttp/src/llhttp.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; | 122 ++++++++++++++--<br>
+ doc/api/errors.md&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 12 ++<br>
+ lib/_http_server.js&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 8 ++<br>
+ src/node_http_parser.cc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; |&nbsp; 20 ++-<br>
+ .../test-http-chunk-extensions-limit.js&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; | 131 ++++++++++++++++++<br>
+ tools/update-llhttp.sh&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; |&nbsp;&nbsp; 2 +-<br>
+ 9 files changed, 292 insertions(+), 19 deletions(-)<br>
+ create mode 100644 test/parallel/test-http-chunk-extensions-limit.js<br>
+<br>
+diff --git a/deps/llhttp/CMakeLists.txt b/deps/llhttp/CMakeLists.txt<br>
+index d038203..747564a 100644<br>
+--- a/deps/llhttp/CMakeLists.txt<br>
++++ b/deps/llhttp/CMakeLists.txt<br>
+@@ -1,7 +1,7 @@<br>
+ cmake_minimum_required(VERSION 3.5.1)<br>
+ cmake_policy(SET CMP0069 NEW)<br>
+<br>
+-project(llhttp VERSION 6.0.11)<br>
++project(llhttp VERSION 6.1.0)<br>
+ include(GNUInstallDirs)<br>
+<br>
+ set(CMAKE_C_STANDARD 99)<br>
+diff --git a/deps/llhttp/include/llhttp.h b/deps/llhttp/include/llhttp.h<b=
r>
+index 2da66f1..78f27ab 100644<br>
+--- a/deps/llhttp/include/llhttp.h<br>
++++ b/deps/llhttp/include/llhttp.h<br>
+@@ -2,8 +2,8 @@<br>
+ #define INCLUDE_LLHTTP_H_<br>
+<br>
+ #define LLHTTP_VERSION_MAJOR 6<br>
+-#define LLHTTP_VERSION_MINOR 0<br>
+-#define LLHTTP_VERSION_PATCH 11<br>
++#define LLHTTP_VERSION_MINOR 1<br>
++#define LLHTTP_VERSION_PATCH 0<br>
+<br>
+ #ifndef LLHTTP_STRICT_MODE<br>
+ # define LLHTTP_STRICT_MODE 0<br>
+@@ -348,6 +348,9 @@ struct llhttp_settings_s {<br>
+&nbsp;&nbsp;&nbsp; */<br>
+&nbsp;&nbsp; llhttp_cb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; on_headers_complete;<=
br>
+<br>
++&nbsp; /* Possible return values 0, -1, HPE_USER */<br>
++&nbsp; llhttp_data_cb on_chunk_parameters;<br>
++<br>
+&nbsp;&nbsp; /* Possible return values 0, -1, HPE_USER */<br>
+&nbsp;&nbsp; llhttp_data_cb on_body;<br>
+<br>
+diff --git a/deps/llhttp/src/api.c b/deps/llhttp/src/api.c<br>
+index c4ce197..d3065b3 100644<br>
+--- a/deps/llhttp/src/api.c<br>
++++ b/deps/llhttp/src/api.c<br>
+@@ -355,6 +355,13 @@ int llhttp__on_chunk_header(llhttp_t* s, const char* =
p, const char* endp) {<br>
+ }<br>
+<br>
+<br>
++int llhttp__on_chunk_parameters(llhttp_t* s, const char* p, const char* e=
ndp) {<br>
++&nbsp; int err;<br>
++&nbsp; SPAN_CALLBACK_MAYBE(s, on_chunk_parameters, p, endp - p);<br>
++&nbsp; return err;<br>
++}<br>
++<br>
++<br>
+ int llhttp__on_chunk_complete(llhttp_t* s, const char* p, const char* end=
p) {<br>
+&nbsp;&nbsp; int err;<br>
+&nbsp;&nbsp; CALLBACK_MAYBE(s, on_chunk_complete);<br>
+diff --git a/deps/llhttp/src/llhttp.c b/deps/llhttp/src/llhttp.c<br>
+index 5e7c5d1..5eb19f6 100644<br>
+--- a/deps/llhttp/src/llhttp.c<br>
++++ b/deps/llhttp/src/llhttp.c<br>
+@@ -340,6 +340,8 @@ enum llparse_state_e {<br>
+&nbsp;&nbsp; s_n_llhttp__internal__n_invoke_is_equal_content_length,<br>
+&nbsp;&nbsp; s_n_llhttp__internal__n_chunk_size_almost_done,<br>
+&nbsp;&nbsp; s_n_llhttp__internal__n_chunk_parameters,<br>
++&nbsp; s_n_llhttp__internal__n_span_start_llhttp__on_chunk_parameters,<br=
>
++&nbsp; s_n_llhttp__internal__n_chunk_parameters_ows,<br>
+&nbsp;&nbsp; s_n_llhttp__internal__n_chunk_size_otherwise,<br>
+&nbsp;&nbsp; s_n_llhttp__internal__n_chunk_size,<br>
+&nbsp;&nbsp; s_n_llhttp__internal__n_chunk_size_digit,<br>
+@@ -539,6 +541,10 @@ int llhttp__on_body(<br>
+&nbsp;&nbsp;&nbsp;&nbsp; llhttp__internal_t* s, const unsigned char* p,<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp; const unsigned char* endp);<br>
+<br>
++int llhttp__on_chunk_parameters(<br>
++&nbsp;&nbsp;&nbsp; llhttp__internal_t* s, const unsigned char* p,<br>
++&nbsp;&nbsp;&nbsp; const unsigned char* endp);<br>
++<br>
+ int llhttp__on_status(<br>
+&nbsp;&nbsp;&nbsp;&nbsp; llhttp__internal_t* s, const unsigned char* p,<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp; const unsigned char* endp);<br>
+@@ -1226,8 +1232,7 @@ static llparse_state_t llhttp__internal__run(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto s_n_llht=
tp__internal__n_chunk_parameters;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case 2: {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p++;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto s_n_llhttp__i=
nternal__n_chunk_size_almost_done;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto s_n_llhttp__internal__n_s=
pan_end_llhttp__on_chunk_parameters;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default: {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto s_n_llht=
tp__internal__n_error_10;<br>
+@@ -1236,6 +1241,34 @@ static llparse_state_t llhttp__internal__run(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* UNREACHABLE */;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; abort();<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp; case s_n_llhttp__internal__n_span_start_llhttp__on_chu=
nk_parameters:<br>
++&nbsp;&nbsp;&nbsp; s_n_llhttp__internal__n_span_start_llhttp__on_chunk_pa=
rameters: {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (p =3D=3D endp) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return s_n_llhttp__internal__n=
_span_start_llhttp__on_chunk_parameters;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state-&gt;_span_pos0 =3D (void*) p;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state-&gt;_span_cb0 =3D llhttp__on_chunk_p=
arameters;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto s_n_llhttp__internal__n_chunk_paramet=
ers;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* UNREACHABLE */;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; abort();<br>
++&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp; case s_n_llhttp__internal__n_chunk_parameters_ows:<br>
++&nbsp;&nbsp;&nbsp; s_n_llhttp__internal__n_chunk_parameters_ows: {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (p =3D=3D endp) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return s_n_llhttp__internal__n=
_chunk_parameters_ows;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (*p) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ' ': {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p++;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto s_n_llhttp__i=
nternal__n_chunk_parameters_ows;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default: {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto s_n_llhttp__i=
nternal__n_span_start_llhttp__on_chunk_parameters;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* UNREACHABLE */;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; abort();<br>
++&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case s_n_llhttp__internal__n_chunk_size_otherwise=
:<br>
+&nbsp;&nbsp;&nbsp;&nbsp; s_n_llhttp__internal__n_chunk_size_otherwise: {<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (p =3D=3D endp) {<br>
+@@ -1246,13 +1279,9 @@ static llparse_state_t llhttp__internal__run(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p++;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto s_n_llht=
tp__internal__n_chunk_size_almost_done;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ' ': {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p++;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto s_n_llhttp__i=
nternal__n_chunk_parameters;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ';': {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p++;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto s_n_llhttp__i=
nternal__n_chunk_parameters;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto s_n_llhttp__i=
nternal__n_chunk_parameters_ows;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default: {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto s_n_llht=
tp__internal__n_error_11;<br>
+@@ -6074,6 +6103,24 @@ static llparse_state_t llhttp__internal__run(<br>
+&nbsp;&nbsp;&nbsp;&nbsp; /* UNREACHABLE */;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; abort();<br>
+&nbsp;&nbsp; }<br>
++&nbsp; s_n_llhttp__internal__n_span_end_llhttp__on_chunk_parameters: {<br=
>
++&nbsp;&nbsp;&nbsp; const unsigned char* start;<br>
++&nbsp;&nbsp;&nbsp; int err;<br>
++<br>
++&nbsp;&nbsp;&nbsp; start =3D state-&gt;_span_pos0;<br>
++&nbsp;&nbsp;&nbsp; state-&gt;_span_pos0 =3D NULL;<br>
++&nbsp;&nbsp;&nbsp; err =3D llhttp__on_chunk_parameters(state, start, p);<=
br>
++&nbsp;&nbsp;&nbsp; if (err !=3D 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state-&gt;error =3D err;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state-&gt;error_pos =3D (const char*) (p +=
 1);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state-&gt;_current =3D (void*) (intptr_t) =
s_n_llhttp__internal__n_chunk_size_almost_done;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return s_error;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp; p++;<br>
++&nbsp;&nbsp;&nbsp; goto s_n_llhttp__internal__n_chunk_size_almost_done;<b=
r>
++&nbsp;&nbsp;&nbsp; /* UNREACHABLE */;<br>
++&nbsp;&nbsp;&nbsp; abort();<br>
++&nbsp; }<br>
+&nbsp;&nbsp; s_n_llhttp__internal__n_error_10: {<br>
+&nbsp;&nbsp;&nbsp;&nbsp; state-&gt;error =3D 0x2;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; state-&gt;reason =3D &quot;Invalid character in c=
hunk parameters&quot;;<br>
+@@ -8441,6 +8488,8 @@ enum llparse_state_e {<br>
+&nbsp;&nbsp; s_n_llhttp__internal__n_invoke_is_equal_content_length,<br>
+&nbsp;&nbsp; s_n_llhttp__internal__n_chunk_size_almost_done,<br>
+&nbsp;&nbsp; s_n_llhttp__internal__n_chunk_parameters,<br>
++&nbsp; s_n_llhttp__internal__n_span_start_llhttp__on_chunk_parameters,<br=
>
++&nbsp; s_n_llhttp__internal__n_chunk_parameters_ows,<br>
+&nbsp;&nbsp; s_n_llhttp__internal__n_chunk_size_otherwise,<br>
+&nbsp;&nbsp; s_n_llhttp__internal__n_chunk_size,<br>
+&nbsp;&nbsp; s_n_llhttp__internal__n_chunk_size_digit,<br>
+@@ -8635,6 +8684,10 @@ int llhttp__on_body(<br>
+&nbsp;&nbsp;&nbsp;&nbsp; llhttp__internal_t* s, const unsigned char* p,<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp; const unsigned char* endp);<br>
+<br>
++int llhttp__on_chunk_parameters(<br>
++&nbsp;&nbsp;&nbsp; llhttp__internal_t* s, const unsigned char* p,<br>
++&nbsp;&nbsp;&nbsp; const unsigned char* endp);<br>
++<br>
+ int llhttp__on_status(<br>
+&nbsp;&nbsp;&nbsp;&nbsp; llhttp__internal_t* s, const unsigned char* p,<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp; const unsigned char* endp);<br>
+@@ -9299,8 +9352,7 @@ static llparse_state_t llhttp__internal__run(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto s_n_llht=
tp__internal__n_chunk_parameters;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case 2: {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p++;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto s_n_llhttp__i=
nternal__n_chunk_size_almost_done;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto s_n_llhttp__internal__n_s=
pan_end_llhttp__on_chunk_parameters;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default: {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto s_n_llht=
tp__internal__n_error_6;<br>
+@@ -9309,6 +9361,34 @@ static llparse_state_t llhttp__internal__run(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* UNREACHABLE */;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; abort();<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp; case s_n_llhttp__internal__n_span_start_llhttp__on_chu=
nk_parameters:<br>
++&nbsp;&nbsp;&nbsp; s_n_llhttp__internal__n_span_start_llhttp__on_chunk_pa=
rameters: {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (p =3D=3D endp) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return s_n_llhttp__internal__n=
_span_start_llhttp__on_chunk_parameters;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state-&gt;_span_pos0 =3D (void*) p;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state-&gt;_span_cb0 =3D llhttp__on_chunk_p=
arameters;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto s_n_llhttp__internal__n_chunk_paramet=
ers;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* UNREACHABLE */;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; abort();<br>
++&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp; case s_n_llhttp__internal__n_chunk_parameters_ows:<br>
++&nbsp;&nbsp;&nbsp; s_n_llhttp__internal__n_chunk_parameters_ows: {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (p =3D=3D endp) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return s_n_llhttp__internal__n=
_chunk_parameters_ows;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (*p) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ' ': {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p++;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto s_n_llhttp__i=
nternal__n_chunk_parameters_ows;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default: {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto s_n_llhttp__i=
nternal__n_span_start_llhttp__on_chunk_parameters;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* UNREACHABLE */;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; abort();<br>
++&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case s_n_llhttp__internal__n_chunk_size_otherwise=
:<br>
+&nbsp;&nbsp;&nbsp;&nbsp; s_n_llhttp__internal__n_chunk_size_otherwise: {<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (p =3D=3D endp) {<br>
+@@ -9319,13 +9399,9 @@ static llparse_state_t llhttp__internal__run(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p++;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto s_n_llht=
tp__internal__n_chunk_size_almost_done;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ' ': {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p++;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto s_n_llhttp__i=
nternal__n_chunk_parameters;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ';': {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p++;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto s_n_llhttp__i=
nternal__n_chunk_parameters;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto s_n_llhttp__i=
nternal__n_chunk_parameters_ows;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default: {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto s_n_llht=
tp__internal__n_error_7;<br>
+@@ -13951,6 +14027,24 @@ static llparse_state_t llhttp__internal__run(<br>
+&nbsp;&nbsp;&nbsp;&nbsp; /* UNREACHABLE */;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; abort();<br>
+&nbsp;&nbsp; }<br>
++&nbsp; s_n_llhttp__internal__n_span_end_llhttp__on_chunk_parameters: {<br=
>
++&nbsp;&nbsp;&nbsp; const unsigned char* start;<br>
++&nbsp;&nbsp;&nbsp; int err;<br>
++<br>
++&nbsp;&nbsp;&nbsp; start =3D state-&gt;_span_pos0;<br>
++&nbsp;&nbsp;&nbsp; state-&gt;_span_pos0 =3D NULL;<br>
++&nbsp;&nbsp;&nbsp; err =3D llhttp__on_chunk_parameters(state, start, p);<=
br>
++&nbsp;&nbsp;&nbsp; if (err !=3D 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state-&gt;error =3D err;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state-&gt;error_pos =3D (const char*) (p +=
 1);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state-&gt;_current =3D (void*) (intptr_t) =
s_n_llhttp__internal__n_chunk_size_almost_done;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return s_error;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp; p++;<br>
++&nbsp;&nbsp;&nbsp; goto s_n_llhttp__internal__n_chunk_size_almost_done;<b=
r>
++&nbsp;&nbsp;&nbsp; /* UNREACHABLE */;<br>
++&nbsp;&nbsp;&nbsp; abort();<br>
++&nbsp; }<br>
+&nbsp;&nbsp; s_n_llhttp__internal__n_error_6: {<br>
+&nbsp;&nbsp;&nbsp;&nbsp; state-&gt;error =3D 0x2;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; state-&gt;reason =3D &quot;Invalid character in c=
hunk parameters&quot;;<br>
+diff --git a/doc/api/errors.md b/doc/api/errors.md<br>
+index dcf8744..a76bfe5 100644<br>
+--- a/doc/api/errors.md<br>
++++ b/doc/api/errors.md<br>
+@@ -3043,6 +3043,18 @@ malconfigured clients, if more than 8 KiB of HTTP h=
eader data is received then<br>
+ HTTP parsing will abort without a request or response object being create=
d, and<br>
+ an `Error` with this code will be emitted.<br>
+<br>
++&lt;a id=3D&quot;HPE_CHUNK_EXTENSIONS_OVERFLOW&quot;&gt;&lt;/a&gt;<br>
++<br>
++### `HPE_CHUNK_EXTENSIONS_OVERFLOW`<br>
++<br>
++&lt;!-- YAML<br>
++added: REPLACEME<br>
++--&gt;<br>
++<br>
++Too much data was received for a chunk extensions. In order to protect ag=
ainst<br>
++malicious or malconfigured clients, if more than 16 KiB of data is receiv=
ed<br>
++then an `Error` with this code will be emitted.<br>
++<br>
+ &lt;a id=3D&quot;HPE_UNEXPECTED_CONTENT_LENGTH&quot;&gt;&lt;/a&gt;<br>
+<br>
+ ### `HPE_UNEXPECTED_CONTENT_LENGTH`<br>
+diff --git a/lib/_http_server.js b/lib/_http_server.js<br>
+index 4e23266..263bb52 100644<br>
+--- a/lib/_http_server.js<br>
++++ b/lib/_http_server.js<br>
+@@ -706,6 +706,11 @@ const requestHeaderFieldsTooLargeResponse =3D Buffer.=
from(<br>
+&nbsp;&nbsp; `HTTP/1.1 431 ${STATUS_CODES[431]}\r\n` +<br>
+&nbsp;&nbsp; 'Connection: close\r\n\r\n', 'ascii'<br>
+ );<br>
++const requestChunkExtensionsTooLargeResponse =3D Buffer.from(<br>
++&nbsp; `HTTP/1.1 413 ${STATUS_CODES[413]}\r\n` +<br>
++&nbsp; 'Connection: close\r\n\r\n', 'ascii',<br>
++);<br>
++<br>
+ function socketOnError(e) {<br>
+&nbsp;&nbsp; // Ignore further errors<br>
+&nbsp;&nbsp; this.removeListener('error', socketOnError);<br>
+@@ -719,6 +724,9 @@ function socketOnError(e) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case 'HPE_HEADER_OVERFLOW=
':<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; response =3D =
requestHeaderFieldsTooLargeResponse;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case 'HPE_CHUNK_EXTENSIONS_OVERFLOW':<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; response =3D reque=
stChunkExtensionsTooLargeResponse;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case 'ERR_HTTP_REQUEST_TI=
MEOUT':<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; response =3D =
requestTimeoutResponse;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+diff --git a/src/node_http_parser.cc b/src/node_http_parser.cc<br>
+index 74f3248..b92e848 100644<br>
+--- a/src/node_http_parser.cc<br>
++++ b/src/node_http_parser.cc<br>
+@@ -79,6 +79,8 @@ const uint32_t kOnExecute =3D 5;<br>
+ const uint32_t kOnTimeout =3D 6;<br>
+ // Any more fields than this will be flushed into JS<br>
+ const size_t kMaxHeaderFieldsCount =3D 32;<br>
++// Maximum size of chunk extensions<br>
++const size_t kMaxChunkExtensionsSize =3D 16384;<br>
+<br>
+ const uint32_t kLenientNone =3D 0;<br>
+ const uint32_t kLenientHeaders =3D 1 &lt;&lt; 0;<br>
+@@ -206,6 +208,7 @@ class Parser : public AsyncWrap, public StreamListener=
 {<br>
+<br>
+&nbsp;&nbsp; int on_message_begin() {<br>
+&nbsp;&nbsp;&nbsp;&nbsp; num_fields_ =3D num_values_ =3D 0;<br>
++&nbsp;&nbsp;&nbsp; chunk_extensions_nread_ =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; url_.Reset();<br>
+&nbsp;&nbsp;&nbsp;&nbsp; status_message_.Reset();<br>
+&nbsp;&nbsp;&nbsp;&nbsp; header_parsing_start_time_ =3D uv_hrtime();<br>
+@@ -443,9 +446,22 @@ class Parser : public AsyncWrap, public StreamListene=
r {<br>
+&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
+&nbsp;&nbsp; }<br>
+<br>
+-&nbsp; // Reset nread for the next chunk<br>
++&nbsp; int on_chunk_extension(const char* at, size_t length) {<br>
++&nbsp;&nbsp;&nbsp; chunk_extensions_nread_ +=3D length;<br>
++<br>
++&nbsp;&nbsp;&nbsp; if (chunk_extensions_nread_ &gt; kMaxChunkExtensionsSi=
ze) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; llhttp_set_error_reason(&amp;parser_,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;HPE_CHUNK_EXTENSIONS_OVE=
RFLOW:Chunk extensions overflow&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return HPE_USER;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp; return 0;<br>
++&nbsp; }<br>
++<br>
++&nbsp; // Reset nread for the next chunk and also reset the extensions co=
unter<br>
+&nbsp;&nbsp; int on_chunk_header() {<br>
+&nbsp;&nbsp;&nbsp;&nbsp; header_nread_ =3D 0;<br>
++&nbsp;&nbsp;&nbsp; chunk_extensions_nread_ =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
+&nbsp;&nbsp; }<br>
+<br>
+@@ -887,6 +903,7 @@ class Parser : public AsyncWrap, public StreamListener=
 {<br>
+&nbsp;&nbsp; const char* current_buffer_data_;<br>
+&nbsp;&nbsp; bool pending_pause_ =3D false;<br>
+&nbsp;&nbsp; uint64_t header_nread_ =3D 0;<br>
++&nbsp; uint64_t chunk_extensions_nread_ =3D 0;<br>
+&nbsp;&nbsp; uint64_t max_http_header_size_;<br>
+&nbsp;&nbsp; uint64_t headers_timeout_;<br>
+&nbsp;&nbsp; uint64_t header_parsing_start_time_ =3D 0;<br>
+@@ -921,6 +938,7 @@ const llhttp_settings_t Parser::settings =3D {<br>
+&nbsp;&nbsp; Proxy&lt;DataCall, &amp;Parser::on_header_field&gt;::Raw,<br>
+&nbsp;&nbsp; Proxy&lt;DataCall, &amp;Parser::on_header_value&gt;::Raw,<br>
+&nbsp;&nbsp; Proxy&lt;Call, &amp;Parser::on_headers_complete&gt;::Raw,<br>
++&nbsp; Proxy&lt;DataCall, &amp;Parser::on_chunk_extension&gt;::Raw,<br>
+&nbsp;&nbsp; Proxy&lt;DataCall, &amp;Parser::on_body&gt;::Raw,<br>
+&nbsp;&nbsp; Proxy&lt;Call, &amp;Parser::on_message_complete&gt;::Raw,<br>
+&nbsp;&nbsp; Proxy&lt;Call, &amp;Parser::on_chunk_header&gt;::Raw,<br>
+diff --git a/test/parallel/test-http-chunk-extensions-limit.js b/test/para=
llel/test-http-chunk-extensions-limit.js<br>
+new file mode 100644<br>
+index 0000000..6868b3d<br>
+--- /dev/null<br>
++++ b/test/parallel/test-http-chunk-extensions-limit.js<br>
+@@ -0,0 +1,131 @@<br>
++'use strict';<br>
++<br>
++const common =3D require('../common');<br>
++const http =3D require('http');<br>
++const net =3D require('net');<br>
++const assert =3D require('assert');<br>
++<br>
++// Verify that chunk extensions are limited in size when sent all togethe=
r.<br>
++{<br>
++&nbsp; const server =3D http.createServer((req, res) =3D&gt; {<br>
++&nbsp;&nbsp;&nbsp; req.on('end', () =3D&gt; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; res.writeHead(200, { 'Content-Type': 'text=
/plain' });<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; res.end('bye');<br>
++&nbsp;&nbsp;&nbsp; });<br>
++<br>
++&nbsp;&nbsp;&nbsp; req.resume();<br>
++&nbsp; });<br>
++<br>
++&nbsp; server.listen(0, () =3D&gt; {<br>
++&nbsp;&nbsp;&nbsp; const sock =3D net.connect(server.address().port);<br>
++&nbsp;&nbsp;&nbsp; let data =3D '';<br>
++<br>
++&nbsp;&nbsp;&nbsp; sock.on('data', (chunk) =3D&gt; data +=3D chunk.toStri=
ng('utf-8'));<br>
++<br>
++&nbsp;&nbsp;&nbsp; sock.on('end', common.mustCall(function() {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert.strictEqual(data, 'HTTP/1.1 413 Pay=
load Too Large\r\nConnection: close\r\n\r\n');<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; server.close();<br>
++&nbsp;&nbsp;&nbsp; }));<br>
++<br>
++&nbsp;&nbsp;&nbsp; sock.end('' +<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'GET / HTTP/1.1\r\n' +<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'Host: localhost:8080\r\n' +<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'Transfer-Encoding: chunked\r\n\r\n' +<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '2;' + 'A'.repeat(20000) + '=3Dbar\r\nAA\r=
\n' +<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '0\r\n\r\n'<br>
++&nbsp;&nbsp;&nbsp; );<br>
++&nbsp; });<br>
++}<br>
++<br>
++// Verify that chunk extensions are limited in size when sent in interval=
s.<br>
++{<br>
++&nbsp; const server =3D http.createServer((req, res) =3D&gt; {<br>
++&nbsp;&nbsp;&nbsp; req.on('end', () =3D&gt; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; res.writeHead(200, { 'Content-Type': 'text=
/plain' });<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; res.end('bye');<br>
++&nbsp;&nbsp;&nbsp; });<br>
++<br>
++&nbsp;&nbsp;&nbsp; req.resume();<br>
++&nbsp; });<br>
++<br>
++&nbsp; server.listen(0, () =3D&gt; {<br>
++&nbsp;&nbsp;&nbsp; const sock =3D net.connect(server.address().port);<br>
++&nbsp;&nbsp;&nbsp; let remaining =3D 20000;<br>
++&nbsp;&nbsp;&nbsp; let data =3D '';<br>
++<br>
++&nbsp;&nbsp;&nbsp; const interval =3D setInterval(<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; () =3D&gt; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (remaining &gt; 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sock.write('A'.rep=
eat(1000));<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sock.write('=3Dbar=
\r\nAA\r\n0\r\n\r\n');<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clearInterval(inte=
rval);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; remaining -=3D 1000;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; common.platformTimeout(20),<br>
++&nbsp;&nbsp;&nbsp; ).unref();<br>
++<br>
++&nbsp;&nbsp;&nbsp; sock.on('data', (chunk) =3D&gt; data +=3D chunk.toStri=
ng('utf-8'));<br>
++<br>
++&nbsp;&nbsp;&nbsp; sock.on('end', common.mustCall(function() {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert.strictEqual(data, 'HTTP/1.1 413 Pay=
load Too Large\r\nConnection: close\r\n\r\n');<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; server.close();<br>
++&nbsp;&nbsp;&nbsp; }));<br>
++<br>
++&nbsp;&nbsp;&nbsp; sock.write('' +<br>
++&nbsp;&nbsp;&nbsp; 'GET / HTTP/1.1\r\n' +<br>
++&nbsp;&nbsp;&nbsp; 'Host: localhost:8080\r\n' +<br>
++&nbsp;&nbsp;&nbsp; 'Transfer-Encoding: chunked\r\n\r\n' +<br>
++&nbsp;&nbsp;&nbsp; '2;'<br>
++&nbsp;&nbsp;&nbsp; );<br>
++&nbsp; });<br>
++}<br>
++<br>
++// Verify the chunk extensions is correctly reset after a chunk<br>
++{<br>
++&nbsp; const server =3D http.createServer((req, res) =3D&gt; {<br>
++&nbsp;&nbsp;&nbsp; req.on('end', () =3D&gt; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; res.writeHead(200, { 'content-type': 'text=
/plain', 'connection': 'close', 'date': 'now' });<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; res.end('bye');<br>
++&nbsp;&nbsp;&nbsp; });<br>
++<br>
++&nbsp;&nbsp;&nbsp; req.resume();<br>
++&nbsp; });<br>
++<br>
++&nbsp; server.listen(0, () =3D&gt; {<br>
++&nbsp;&nbsp;&nbsp; const sock =3D net.connect(server.address().port);<br>
++&nbsp;&nbsp;&nbsp; let data =3D '';<br>
++<br>
++&nbsp;&nbsp;&nbsp; sock.on('data', (chunk) =3D&gt; data +=3D chunk.toStri=
ng('utf-8'));<br>
++<br>
++&nbsp;&nbsp;&nbsp; sock.on('end', common.mustCall(function() {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert.strictEqual(<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'HTTP/1.1 200 OK\r\n' +<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'content-type: text/plain\r\n'=
 +<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'connection: close\r\n' +<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'date: now\r\n' +<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'Transfer-Encoding: chunked\r\=
n' +<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '\r\n' +<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '3\r\n' +<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'bye\r\n' +<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '0\r\n' +<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '\r\n',<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; );<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; server.close();<br>
++&nbsp;&nbsp;&nbsp; }));<br>
++<br>
++&nbsp;&nbsp;&nbsp; sock.end('' +<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'GET / HTTP/1.1\r\n' +<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'Host: localhost:8080\r\n' +<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'Transfer-Encoding: chunked\r\n\r\n' +<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '2;' + 'A'.repeat(10000) + '=3Dbar\r\nAA\r=
\n' +<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '2;' + 'A'.repeat(10000) + '=3Dbar\r\nAA\r=
\n' +<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '2;' + 'A'.repeat(10000) + '=3Dbar\r\nAA\r=
\n' +<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '0\r\n\r\n'<br>
++&nbsp;&nbsp;&nbsp; );<br>
++&nbsp; });<br>
++}<br>
+diff --git a/tools/update-llhttp.sh b/tools/update-llhttp.sh<br>
+index 12e2f46..a95eef1 100755<br>
+--- a/tools/update-llhttp.sh<br>
++++ b/tools/update-llhttp.sh<br>
+@@ -59,5 +59,5 @@ echo &quot;&quot;<br>
+ echo &quot;Please git add llhttp, commit the new version:&quot;<br>
+ echo &quot;&quot;<br>
+ echo &quot;$ git add -A deps/llhttp&quot;<br>
+-echo &quot;$ git commit -m \&quot;deps: update nghttp2 to $LLHTTP_VERSION=
\&quot;&quot;<br>
++echo &quot;$ git commit -m \&quot;deps: update llhttp to $LLHTTP_VERSION\=
&quot;&quot;<br>
+ echo &quot;&quot;<br>
+--<br>
+2.40.0<br>
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb b/meta-oe/re=
cipes-devtools/nodejs/nodejs_16.20.2.bb<br>
index 16593a0fe..b786c0273 100644<br>
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb<br>
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb<br>
@@ -27,6 +27,7 @@ SRC_URI =3D &quot;<a href=3D""></a>http://nodejs.org/dist=
/v${PV}/node-v${PV}.tar.xz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-mips-Use-32bit-cast-for-operand-on-mips32.patch">
file://0001-mips-Use-32bit-cast-for-operand-on-mips32.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-Nodejs-Fixed-pipes-DeprecationWarning.patch">file://0001-No=
dejs-Fixed-pipes-DeprecationWarning.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-25883.patch">file://CVE-2022-25883.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2024-22019.patch">file://CVE-2024-22019.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;SRC_URI:append:class-target =3D &quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-Using-native-binaries.patch">file://0001-Using-native-binar=
ies.patch</a> \<br>
-- <br>
2.40.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW4PR11MB58220DFA642C684908FF9DAB843B2MW4PR11MB5822namp_--

