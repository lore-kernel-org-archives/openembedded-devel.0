Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D9AC433F5
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 03:30:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.6674.1642390199517648120
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Jan 2022 19:30:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=gh6cv/CM;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=80160cdeaa=zhe.he@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20H3MAlc029300
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jan 2022 03:29:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=PPS06212021;
 bh=xMp8Iu/Qb+ldnsiOE9RHIs7RGR7cql33jjnayfSC8Do=;
 b=gh6cv/CM9BuMrsR17HTxdHiDH6q/WCfUfo6vekbYEFbNgwBNrjCttskg96VNo2xb4l3j
 yg5OXGnxhWTu9PbsdyGLVgP6jm18IBDz1aBdjJzbLp01195fPwa0KfMqttizAAGpoVcC
 E5L13YMsKq50IpFl7R5bq4Ut3iIYe0A0P3vFnmrhagDVPttLt/k/X76n+L/+S8+srheH
 0bwitrkTvnAG0v26oa98fUlUulcmCfDLE1neTHb92tlrEtqQzl4Vp1imzxVgVTEdMFWg
 Ry14eRzfjx8+zu62UwTyoPytePyKa4wb57f5qnsFSELNhejEDlsdCinRMPlGoMB7aGEx pw==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dkq7ts1k3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jan 2022 03:29:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BsWGcuqMSr1BwrcyxjwVe1v/9/Pnr4R5Lpug8DciDsIdlWWPotW/siDbzvZXIu0FOMC2aSJs6WIf+zyaOEdlu4ps9LCnH14lIyfbRr7lwg18d1kGKXUTZSYJPia72TTa/cHvghoc6u1pf8uQtavrGib2cdzcB4Hfrs4i7hAwvyBN0og7NBCQapNDEgKKC+/W3rIR1zYYprREJCkQny+tZpkIy/vOgWvx7JcnP0ysXdf0FC7YrGk0b9vUAP6GrDN/VdNMNKtgm0c1M+DNAscsdtfy/ERi57LbEw3TzlsRbLaP7b3LB1+yjiC0oI6zAHj+T/4vwkPBERUurWNPJdY49g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xMp8Iu/Qb+ldnsiOE9RHIs7RGR7cql33jjnayfSC8Do=;
 b=oHddBA5nZrH+ybjZHpoFJ/IJ+FKZ/Vgbmj6w1tEMovpUMJIi6RxUFeGgm87SGsMRGn3bKPp0fcazbLesK9DfsBqWiibMAJcO2cD5QkIg224c/xvSzSy8aA/6m7jyzTtX7zua/G3B9scgTz+UnoskFCPUjQeaR/jfcYaQMw/WuaPe/zPxNmHyuJIU2I3C5gH/iIqmQlOpJFyXNWJgTPEJwJpHNuJFmXRDoKXCYhJ+d8cs3niyGT3Ne9T7BphQz5epv4CKamjb4yreu+fj8mgX9oJ9mOMTxk3ocTtdUoWZUlGVC5oQT+0M7/6R4BRzApXLF+p1+7XIwq+OBNu8ey1jEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.13; Mon, 17 Jan
 2022 03:29:55 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::a917:745f:993c:1e9d]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::a917:745f:993c:1e9d%6]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 03:29:55 +0000
From: He Zhe <zhe.he@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][master][PATCH] protobuf: Fix static init fiasco
Date: Mon, 17 Jan 2022 11:29:41 +0800
Message-Id: <20220117032941.10436-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: HK2PR02CA0201.apcprd02.prod.outlook.com
 (2603:1096:201:20::13) To MWHPR11MB1358.namprd11.prod.outlook.com
 (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fa568d9-f4f1-432a-a4f0-08d9d969a10d
X-MS-TrafficTypeDiagnostic: SN6PR11MB3230:EE_
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3230739A5D243905DB3FD8088F579@SN6PR11MB3230.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jorhVg3aqh0ljnI0jEISLEv2PUtibtEH0oqpJ14noW/f+Z6VocunIdVRMxrcJcd3UzASJM/jJBfq5LRPLFO72qcH7l4AhvEGuWvv97jhEZGBodP+50my0T4ZYG3Qo+cE7PZ4XW4rKstX7v0tWvFsbu0ntx11yPgPxLXSlPw4/yt+du91NO5CjTiMg8ScJRHkB8fnnRWRm/BFqCBPYRuhM7L8c2tuCcZB2qfpLeQ9cQd/aKdIld8AyaliFurPMxh35L7NIxj2JkdnfgIJVFcCV+5f48miAUWcEEAtlC2vbYQpwgaXIN7pVYjwSkA1R4SIT18YrZezniewqGIbGeyQ9nWOJ536siYZHUVgep3eUsWtjeKEhM7z3IFw2++ib+oiNkfkwZdXZn+KEL75bVyCWhc93ZqXOyyPx5e2MtJPyT7gw4xExoz/YJ1lCWGvmBWoRNNxtHgtd5Z7IF6q1jYnsS9iBpo2e29vI+BkP1NggprV5hc1IVgXdFkM4lfVI6yoQ5nyqtPDZmliY1dVO7m5FyaEMF2XyDzoSom4v9ioUQ+lGnQwc1PVabIi3jr87lqgNUpHcLcE/GlpsaVUsWPf/+voGyoG+W7v5rqhtMGR5NMeHQxI/mmP11NRaMF9MiXIleyO6mS+kpacZXIX3nkfn5Vi54vX/D49dq1WoSsIFJjzD1WNrJGY0eQxLEZUMxE00WFACq45R2zB3KVaX5o5cg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1358.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(1076003)(52116002)(8936002)(8676002)(36756003)(186003)(6506007)(38350700002)(38100700002)(6916009)(2616005)(26005)(6486002)(316002)(66556008)(83380400001)(66476007)(508600001)(86362001)(6512007)(66574015)(5660300002)(66946007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RFN6eldoY3h5RWhubGxLUXp6RmhHNitPWnFSeFdLOUtSL3FxaDRBY2l5cUh1?=
 =?utf-8?B?OFdXTDlSYzJhRktUbDY0NFFuT1NtT09taTcraVBlT0tWK0lHZmtzSDVwWm1I?=
 =?utf-8?B?ZmZlaVF0bzRoYVRKVnVtUCt1L2J5VjBRQ3VXTU1mQmpKdzYrRGZlWUIxcitP?=
 =?utf-8?B?N0JMNGdUakVhelhvTDZNbjF6czNrdTVwL1hlZDRTMnpVVjFVTGwycnBrV0hm?=
 =?utf-8?B?UUpTM0YvVDdVWGVIQWdndTBYV3FOTWhvS1BWK0ZUOXNRVWNrWXVScnVWUnow?=
 =?utf-8?B?UXJXMkx2YmJLRUZtOEFrSTFiVnVZSUZvWE90TFVsUXVwZmxPb3U3M2tqcUpE?=
 =?utf-8?B?WmVIbm1vYUNKc2oxcVgwYnZFSjRURDhsN3VFTkxycHlUZFRWWG5QSmc4SEJo?=
 =?utf-8?B?WjF2a1g1dmZMNHM2N0w0QmNpTy9VYnhpZENoYnF6YUNEeHA0RjlDL3RFRzFS?=
 =?utf-8?B?NlRweEI3RTlDQUpISlpvWnV2ZlM5QWFMZjJ4OHFLaWV0R0FPL3BrU3o4dzly?=
 =?utf-8?B?SjJaaHFUSCs5U1RPMGxNd3ROYXpTN29Cdk45TC9mNzhEUVZDNHEwd0tPeC9p?=
 =?utf-8?B?Z0hsNUZ2TUNHQnp1aDlUZk1ocU5Ya0IvZDVnemhWV1Nrd3lDZFpTNVdlRE5l?=
 =?utf-8?B?ZW9JTDlaN0gva0RYd2IrTGdjREtGZmw2VkY4Rmw4ZHE2Z2VhYXhOcUxXMTdS?=
 =?utf-8?B?dXg2ZlNTek83c2tSTzZpRjdMeXZvNTFhWkpQcEJnbWlNRnVyNUJhOEVocW0r?=
 =?utf-8?B?S1E2YmNrenZrU0lQc3FHYWtRaWNUMzJGMkhkNkx2ZnVWU0VYa3piTlErWDVE?=
 =?utf-8?B?d3BGamVKNWE3RUdjRGZJekh1eDFyZFhydkl5Uk5tMkhMR0RuRElxckpRQUo2?=
 =?utf-8?B?NGszUm9rdCs5VEhwZ1VJR2ltd3BFVkUyTW1iVVpPdk9mTU5nTzc4L3gxc1Jv?=
 =?utf-8?B?UFZ4ODZXenZTdVk3SXp4encwemVwN0VTa1VBUEdjSWZqYjlQNmpHUVZlZnNT?=
 =?utf-8?B?UzJzcWNXZ2g3RDJvS2VLVmlKMSt3UXlhNm5JZXZLT2NQN2dEL0NIQUVJS2Er?=
 =?utf-8?B?TGF5a3BqeTIrQlJaeXQ2YnpNSHo2Yk1kbkJYeWVOV3prckFHNG9PSEpQR3VV?=
 =?utf-8?B?YXpxZVloWGx0RjBEdDhEMjhyVkJ1M3FmZWJ0eFVoS0ZKdU93U0I0VHE1dGpz?=
 =?utf-8?B?dVVGVWFiUE93QTBJSWd1K2l0KzhjNFYxRWY3Slp0SmxBWTYveDhvTTh6aDln?=
 =?utf-8?B?Rk1FdVB1TFBialdGSXZ5K0Q5Z05hcm0vZXNGZ3ZLbmVDTlRvbHBVOThkb0JN?=
 =?utf-8?B?KzZsbHlmb2ZiVFYrTU0waEQ5TUFYOFlIYXlUQ0l4MVVCSFU2alJESUNBay9M?=
 =?utf-8?B?dGdlUFNLdlV1NklBU1dCL3NlUEFRLzdrN3d4eGNuNzA1U3J1WlFBc2VyZnl2?=
 =?utf-8?B?a2E3RWNBK0ttQWcrL05QT3ZqMlJRSDI3Z0pjcDBXZGVQZE1waXFmc0VJSVlT?=
 =?utf-8?B?NURjR2dLUnIzVVY2dklHNFkvTmlLbWxMTkh5L212dHM3Y0lZY3ZFVERsZVFZ?=
 =?utf-8?B?cTRUREpqYmQ2bU1ZWlRjaDdNREFTdDVWTjNBNTBVdXB4K0VBUDlCbktDdXdG?=
 =?utf-8?B?dUphQmJ5SU5vVmVUMm1OaGs2ZnVkaHZZNS9RWGNVK01raTFQUnhnbGFmS0lE?=
 =?utf-8?B?VlJVWndKWEF3clFFL0J3NWhDd05BOHVVMnFNRHhTRDE3aVFHakdkSUhYZy83?=
 =?utf-8?B?U0lIZ3RnUUQwOU1yaWJPMS9DYWxsYys1UE5SZVRqbDlkK1hnQWtQU3NJeVRh?=
 =?utf-8?B?RjltNDBjcWhhSUt0bG0xNnNCeUJDZHpFNTRRdkRXQy8zbkpJYmppYTR6ZXVu?=
 =?utf-8?B?M1lZaFc3c1g2eFVxUGM2K2ErZXJrMTMvV0gxM2pyWXJ6RDdsTm8zTXR1VDZW?=
 =?utf-8?B?R0ZQdGFhY0ZQY3hKNGJ5OGRBVFhDdFcrL1JKVEJXRDJGT3hLYStRSndEU2Z3?=
 =?utf-8?B?VkhjU21IR1FPbmxMd1ozdlQ1M09UcjdEbWF0N1gwbVYycThVbWd3SDBSMlh5?=
 =?utf-8?B?bWVwWGg0WjFzV0J0R1NQb2V0S3ZmRVlsN2ZXWjAzVllORmRiNmhLbGUrMytF?=
 =?utf-8?B?WGFzam5VbEZ3bnJDVHhqUjdyRnl6MUJOUkFUYVlsZlNQL2MrN0tJYTZaQ0Zn?=
 =?utf-8?Q?2lEsxObjrgXYc9TA9EvWLQ4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7fa568d9-f4f1-432a-a4f0-08d9d969a10d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 03:29:54.8486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 HBaVcvqkjpCpifEu4jBJU6CGRVZrJrNrXjDyoPZ2dZlHwAJJ7WBc2NsVxN0xEFzzm/baGQQftihSGeMfoT2yiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3230
X-Proofpoint-ORIG-GUID: GSm96NkoMllAP7eu7apuZXLsninRn8Lx
X-Proofpoint-GUID: GSm96NkoMllAP7eu7apuZXLsninRn8Lx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_01,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=863 clxscore=1015 adultscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201170022
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 20H3MAlc029300
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Jan 2022 03:30:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94893

The protobuf suffers from the C++ "Static Initialization Fiasco"
issue. This patches makes the extension attributes have a higher
priority than the attributes, so there's no possibility of random
initialization orders.

Signed-off-by: Jani Nurminen <jani.nurminen@windriver.com>

Upstream-Status: Pending

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...r-init-prio-for-extension-attributes.patch | 79 +++++++++++++++++++
 .../protobuf/protobuf_3.19.1.bb               |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001-Lower=
-init-prio-for-extension-attributes.patch

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Lower-init-p=
rio-for-extension-attributes.patch b/meta-oe/recipes-devtools/protobuf/pr=
otobuf/0001-Lower-init-prio-for-extension-attributes.patch
new file mode 100644
index 000000000..a1200e01c
--- /dev/null
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Lower-init-prio-for=
-extension-attributes.patch
@@ -0,0 +1,79 @@
+From 8ff34dbff1eac612326b492d0b2cb93901ad7e2b Mon Sep 17 00:00:00 2001
+From: Jani Nurminen <jani.nurminen@windriver.com>
+Date: Fri, 24 Sep 2021 09:56:11 +0200
+Subject: [PATCH] Lower init prio for extension attributes
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Added PROTOBUF_EXTENSION_ATTRIBUTE_INIT_PRIORITY in
+code generation for extension attributes.
+It has lower prio than PROTOBUF_ATTRIBUTE_INIT_PRIORITY to
+ensure that extension attributes are initialized after
+other attribute.
+This is needed in some applications to avoid segmentation fault.
+
+Reported by Karl-Herman N=C3=A4slund.
+
+Signed-off-by: Jani Nurminen <jani.nurminen@windriver.com>
+
+Rebase on master
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ src/google/protobuf/compiler/cpp/cpp_extension.cc |  2 +-
+ src/google/protobuf/port_def.inc                  | 12 ++++++++++++
+ src/google/protobuf/port_undef.inc                |  1 +
+ 3 files changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/src/google/protobuf/compiler/cpp/cpp_extension.cc b/src/goo=
gle/protobuf/compiler/cpp/cpp_extension.cc
+index 8604da5f2..984345ebe 100644
+--- a/src/google/protobuf/compiler/cpp/cpp_extension.cc
++++ b/src/google/protobuf/compiler/cpp/cpp_extension.cc
+@@ -164,7 +164,7 @@ void ExtensionGenerator::GenerateDefinition(io::Prin=
ter* printer) {
+   }
+=20
+   format(
+-      "PROTOBUF_ATTRIBUTE_INIT_PRIORITY "
++      "PROTOBUF_EXTENSION_ATTRIBUTE_INIT_PRIORITY "
+       "::$proto_ns$::internal::ExtensionIdentifier< $extendee$,\n"
+       "    ::$proto_ns$::internal::$type_traits$, $field_type$, $packed=
$ >\n"
+       "  $scoped_name$($constant_name$, $1$);\n",
+diff --git a/src/google/protobuf/port_def.inc b/src/google/protobuf/port=
_def.inc
+index 7e9119112..a5117090d 100644
+--- a/src/google/protobuf/port_def.inc
++++ b/src/google/protobuf/port_def.inc
+@@ -614,6 +614,18 @@
+ #define PROTOBUF_ATTRIBUTE_INIT_PRIORITY
+ #endif
+=20
++// Some embedded systems get a segmentation fault if extension attribut=
es are
++// initialized with higher or equal priority as other attributes. This =
gives
++// extension attributes high priority, but lower than other attributes.
++#ifdef PROTOBUF_EXTENSION_ATTRIBUTE_INIT_PRIORITY
++#error PROTOBUF_EXTENSION_ATTRIBUTE_INIT_PRIORITY was previously define=
d
++#endif
++#if PROTOBUF_GNUC_MIN(3, 0) && (!defined(__APPLE__) || defined(__clang_=
_)) && !((defined(sun) || defined(__sun)) && (defined(__SVR4) || defined(=
__svr4__)))
++#define PROTOBUF_EXTENSION_ATTRIBUTE_INIT_PRIORITY __attribute__((init_=
priority((103))))
++#else
++#define PROTOBUF_EXTENSION_ATTRIBUTE_INIT_PRIORITY
++#endif
++
+ #ifdef PROTOBUF_PRAGMA_INIT_SEG
+ #error PROTOBUF_PRAGMA_INIT_SEG was previously defined
+ #endif
+diff --git a/src/google/protobuf/port_undef.inc b/src/google/protobuf/po=
rt_undef.inc
+index ccc5daf56..2b28f3a31 100644
+--- a/src/google/protobuf/port_undef.inc
++++ b/src/google/protobuf/port_undef.inc
+@@ -83,6 +83,7 @@
+ #undef PROTOBUF_HAVE_ATTRIBUTE_WEAK
+ #undef PROTOBUF_ATTRIBUTE_NO_DESTROY
+ #undef PROTOBUF_ATTRIBUTE_INIT_PRIORITY
++#undef PROTOBUF_EXTENSION_ATTRIBUTE_INIT_PRIORITY
+ #undef PROTOBUF_PRAGMA_INIT_SEG
+ #undef PROTOBUF_ASAN
+ #undef PROTOBUF_MSAN
+--=20
+2.26.2
+
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.19.1.bb b/meta-=
oe/recipes-devtools/protobuf/protobuf_3.19.1.bb
index bff159590..8491dbdf5 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.19.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.19.1.bb
@@ -18,6 +18,7 @@ SRC_URI =3D "git://github.com/protocolbuffers/protobuf.=
git;branch=3D3.19.x;protocol=3D
            file://0001-Makefile.am-include-descriptor.cc-when-building-l=
ibp.patch \
            file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-f=
ix-.patch \
            file://0001-Fix-linking-error-with-ld-gold.patch \
+           file://0001-Lower-init-prio-for-extension-attributes.patch \
            "
 SRC_URI:append:mips:toolchain-clang =3D " file://0001-Fix-build-on-mips-=
clang.patch "
 SRC_URI:append:mipsel:toolchain-clang =3D " file://0001-Fix-build-on-mip=
s-clang.patch "
--=20
2.17.1


