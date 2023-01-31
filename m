Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 133D7C636D3
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 09:42:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8555.1675158155810610959
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Jan 2023 01:42:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=NWt208Si;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1395aa4004=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30V7RIqv031637
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 01:42:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=zvJYPr3HWbFPpYbGEcT+lLXdFm9OvzYJbLWxL1Q3d2M=;
 b=NWt208Si6iLk1u45MGrNNt5mg+Leks6NFQvI0jYz70ALburMPYDxDulOZ0UVmyeQk+Wc
 TisovJNFG+dd8RHVPJOUH6of2GPc3Zww0oGUkAGfXzUffpmXnPJgKane9FYDSsHyfXRZ
 fqDMznnDWvIqxrblYiANBir2ZwCcLrEZmPgx1qeIe3j/2jv+CnRA8DqnsVg2iRhApyzM
 kntPVMqwOvgslYvqsaC6maYQyCpCI7HnK3lr9ysss1uw32zuhoQ4jamJywKaNDMZQQS2
 8etqL0kE1Mw+3o5tKiZC4TL23iEBNO4UsQuT3GhgKuBKIg8UwEHoD9yOou5qR/vxj24T Gw== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nd43rjp7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 01:42:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=loRpuKL8DDd7BRJ1KTAiiZWpeMTlDhhq0qtlLZy+4dYgmM6AdwEt1F4dJ3ZYJk17rpZ4qTZ4ymzqJEwwuUBNRto6vB1gZQxELi74jYmEgRAdCdJ0F+nQLzoJ77VJvtGnrzCDHXdvitkVlETSdBsSlwJAz9XSfbcjLvUyb9v96qQoLsbSBGMpCqRu7jJdoe2rg/J+AHVeMwF3b1LGMWTp5xtF3knOLnlHAQYGlBar16RVT5kDekHfoNTd5ZITom4S7/KWWaTt0rehw6GEAZx48zGHcuUB5b9T3j+5GJlWDmp2Vh7itSjXUBNpfnQPlVNEJNsKSWw9mC+hnlTa1SjGxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvJYPr3HWbFPpYbGEcT+lLXdFm9OvzYJbLWxL1Q3d2M=;
 b=AFsTi5Pud7GQRCWn9kEjF1GCh6ubeqH0vMNV7SlI5vXXBUi8P/9WcMNiQpg0tdZejqOHbuGeDvKtcLEUqer3guz6z9jz9TcHO4fsflEOdtJXmqECD7mmyhX79th14NcA82z9cxG4mCeOfBaJCGosZDLKnDoWX7SiEhiYOKaaIVgaaeiiSQ9o3GLt7Z9UbNYuYkqahT1bn84FrYRob856tzqYZE4P5KV6BVm1T3UNcf1U2FcV2aiU79bOXUoG4L/r8dmXmUEBh/WQGosqMo2fFlLPUX3+fYnYpzNcj0BHp/fx0daXQpLeHzg7JCOF7ERODeR8Axl2ZyqgehTDIL2Ewg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB8071.namprd11.prod.outlook.com (2603:10b6:8:12e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 09:42:33 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7%3]) with mapi id 15.20.6043.023; Tue, 31 Jan 2023
 09:42:33 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: "Chen, Qi" <Qi.Chen@windriver.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe][meta-oe][PATCH] syslog-ng: workaround segfault for ppc64le
Thread-Topic: [oe][meta-oe][PATCH] syslog-ng: workaround segfault for ppc64le
Thread-Index: AQHZNVgqejKCaAZiOEGo3RpJajT5VK64Rdsg
Date: Tue, 31 Jan 2023 09:42:33 +0000
Message-ID: 
 <CO6PR11MB5602158B8F2B013BFC39A3A8EDD09@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20230131094102.19912-1-Qi.Chen@windriver.com>
In-Reply-To: <20230131094102.19912-1-Qi.Chen@windriver.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|DS0PR11MB8071:EE_
x-ms-office365-filtering-correlation-id: 4e683e76-195d-4ee9-a938-08db036f7a60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 iNwkII4nCNWZPIATiX9APRMzEBdUkBf0+FUZBTm1jsSO2nvXNsLqMVKgbBuiwkUTB4585rFk9BPXHfezcP0Hn8D7aDqtUDckUc2kcDwSAYp9GRg9YXrWIIErB4R2H5/BZ8t0H2WT8IHp+XORSrU6t3qjo0OO7/1WLQ7amt7BdtLezTXu03UGB4ZriXBcqg+JrJX90ViO1kWxjJMd3cw8T6spLexgcsU93viG7BT/zLGrGwbmBTMdUbYfFYBiiRJEjB85s4jP4dWG379Kt1XNJ+eqXVbODZyaLDmAtvZ94KWOSCyAmkRf+6DVo0XaLjjbRPtLacajIl8x+ulofZ81XRgw3yTDV/Y9bFiJJz6jmbH16GWsL0pdQs49IOhbCJYCAzZ2fnAjAvZSeS9jzJm90M+v7FOWp4WhBLinrf5ZVO+YPSiSTNckM+WjT6coFjvrUYbAF/1yHKeAIxEC1ZGUk196XP9GOuVFF/gX9GgECWivtl54zuvZOHmMM//u2i7Cdz1vJjU6KqEMKKFHUNKaV2sS792XZO/OyoN5PFGtG0xpzh2GR0zQb6Orv0lkeRrgR57hM2I41UX4cpuLMDZ4N8Pv40DhCCCkCvulpSUFJOQ9cV5LAjJgjKZw8JPEv0H6FKkmLAkLncnLhb2p5A1oe9ioumHNUI+lj2SGHA6pURUxFaqQu/rttk57kLpp+oe1MOpggCp/hcpmgIySa6OfcM84juhs9zDTqBP3/nsiuSjoL2YCaFQ33rHCjoRBEdIZ5zxRDZ8BGy52BPzSpPeIyg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(39850400004)(346002)(376002)(136003)(451199018)(86362001)(33656002)(66556008)(38070700005)(38100700002)(122000001)(110136005)(52536014)(5660300002)(316002)(8676002)(66476007)(8936002)(66946007)(76116006)(66446008)(64756008)(55016003)(2906002)(41300700001)(83380400001)(478600001)(7696005)(6506007)(26005)(71200400001)(9686003)(186003)(966005)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?gnh5k2y9kCyNcHOhPndpUpaIa/P1E/eoFI4n56tKsC+CNorxiNQgbktPi60R?=
 =?us-ascii?Q?tmipzau7IhPsS11dnGnlYcSSMeUpSeUXe/z+P12/tBu3+C7tmKRMSGZkkRHq?=
 =?us-ascii?Q?B3QCl/5T9Oh+4XeOW3tgOYvmr5LvwDblxacE2nOUUMa0kEzrNYSonDYuin2q?=
 =?us-ascii?Q?7GXPmIXfAvurikupnvJFo5eYpp9NRlY0IhrxZcniXcT/ukLugGVCrZ990BGu?=
 =?us-ascii?Q?Gux6BPrtKrLH86HMGr0rOc4mlhDipKQFlao/pqllirB2wr9DXLUXaGd+vtVW?=
 =?us-ascii?Q?b1r+b7E2mXI/tQayQz+kywiBzQWUsFl29b10acKNjfzHxw62ybIc4LOouxPU?=
 =?us-ascii?Q?4XTSwY0nUHy6+UCWeKnf/ckyQpaXLG5tLdiolJ4QA8BfxYrJDtDfCT5IWFnd?=
 =?us-ascii?Q?hDOeb+/+gZvRbNtNNSt6YqKwBTUT86jv58E8Viu9XigaDn7XQ/IvsHSiEy6V?=
 =?us-ascii?Q?aL3BHz9WLf74nO1P8gyGXrcweMBlHvBdZ30LcQRD6ijY3TB+RcoG8FI6sF74?=
 =?us-ascii?Q?DNo7dgM6MI6X5zbAeEuDq5LY3nPlyhGczDon+lmRBdFbhi+8WQ2xsMtj6BoL?=
 =?us-ascii?Q?gZPePt+kQNc79W/nU+4pb12P9Cd1BcUV3Hi8gdX6N/Xg3+dDFqmKy63D/AcC?=
 =?us-ascii?Q?Pg5zEc+z7H8k4AVwlxcsQqOJXumCU4IqUFt6Ax7gQKwCCoPQf6UNFhtKt01r?=
 =?us-ascii?Q?+RbhvTcEhWQ6Zg9/fr4a+aXdJE6/XsGVQiDZlTHNhdhiCtJQPHJ/nX1gwzwG?=
 =?us-ascii?Q?iZP2M8qt4FdL1NvgN55fXTljWTTNzhLp/U2dCSFSCElYigixJWNyPTUL2ZJK?=
 =?us-ascii?Q?HM0/m7e1abgQzLsLOk+xbRSBUylX3uCpKlRf1XbX+qGQ70cRIjkTqs6zbjS+?=
 =?us-ascii?Q?/Okrp0Awi7zzvvhiHL4eovuXPJL9pWAAbnMz/u2UvF4WwhsJQ3fPtSb6H2Wa?=
 =?us-ascii?Q?HqXmy7W2Qmj8WoQ6XjDOmv6OOwAF5otvcMRzE9gZSZcZ+jvJGMErKw6kIOuY?=
 =?us-ascii?Q?gwS9y/BOBb9AEoT/oiG8bKEBBJ+OmvKcW1KjGnCzMRL0sPJxNSR3nIVCQnZy?=
 =?us-ascii?Q?UhcvjQ3uD6+Ijht2JZUumegYafu3oJPYFiUj5AN+juOVzSHxPjJEn5ysl32A?=
 =?us-ascii?Q?hoK3+F4k//iD12/jdetZ7+QgdWisKhn36puQCNdRuudgs1XcyzbqZkq2Nrvw?=
 =?us-ascii?Q?eCdsT7S8x0ppz7NEOr3DTqHa5yycQJTjLPOkkOe4dDPpy9t4+vV6sr6B99Vb?=
 =?us-ascii?Q?5Tgc3GuFWn30BqIrJt76s9zN/fiNiPmY2NSI+lfOngXGAT1GwW35nH6rFkf5?=
 =?us-ascii?Q?FiIA98AR9NVx5RdgNsapRfFqQuQ+N6aV+xybhtV2BoLpjYPD/+Y1As6tr4g2?=
 =?us-ascii?Q?opaew9h1NZcRngHFiLkq5AKMrNT1T5S1ctY+GQgIxGAGdlJh/mHSWJEv0L6a?=
 =?us-ascii?Q?MiabQFTafqkVQKyuJV9sE1Lnt55brl+P/ZbroooDroX7QSJTEoAKtFNtc160?=
 =?us-ascii?Q?hQ14u2247TzqFSfroiIiyIeWjT4zLCSkZ3PcKOmleg/M++1dJXiASSwqJNMY?=
 =?us-ascii?Q?E+MZboU9KDLk+BgPOkpiMZMgxhy2LGGQaRmQKGiA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e683e76-195d-4ee9-a938-08db036f7a60
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2023 09:42:33.1996
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xjU0/ROTE2cH4ay6VoSppo6hbD6QF2JRr2+QlSbxToxzfbnDSIe45xgeYGbEsaYAaBKLqPgVs9Fjyz9R3fm1IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8071
X-Proofpoint-ORIG-GUID: U8RIM2yzmFy2vvix1gPRNSB4oqZvP0DE
X-Proofpoint-GUID: U8RIM2yzmFy2vvix1gPRNSB4oqZvP0DE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_04,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301310085
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 09:42:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100873

Please ignore this one. V2 will be sent with an extra issue link.

Regards,
Qi


-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Chen Qi
Sent: Tuesday, January 31, 2023 5:41 PM
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] syslog-ng: workaround segfault for ppc64le

For now syslog-ng segfaults on ppc64le. The problem could be reproduced by =
simply adding syslog-ng to IMAGE_INSTALL and then building and starting an =
image for qemuppc64.

The underlying root cause is hard to find. This workaround helps improve th=
e situation a little bit so that users can at least use syslog-ng on ppc64l=
e targets.

Note that this workaround should be dropped once the upstream issue gets a =
real fix: https://github.com/syslog-ng/syslog-ng/issues/4285

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...rkaround-powerpc64le-segfaults-error.patch | 45 +++++++++++++++++++
 .../syslog-ng/syslog-ng_3.38.1.bb             |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/0001-plugin.c-w=
orkaround-powerpc64le-segfaults-error.patch

diff --git a/meta-oe/recipes-support/syslog-ng/files/0001-plugin.c-workarou=
nd-powerpc64le-segfaults-error.patch b/meta-oe/recipes-support/syslog-ng/fi=
les/0001-plugin.c-workaround-powerpc64le-segfaults-error.patch
new file mode 100644
index 000000000..ca73f69b9
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/0001-plugin.c-workaround-p
+++ owerpc64le-segfaults-error.patch
@@ -0,0 +1,45 @@
+From 616446afab61ab98b28c81605e2efd4a689f37d1 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Fri, 20 Jan 2023 14:59:14 +0800
+Subject: [PATCH] plugin.c: workaround powerpc64le segfaults error
+
+syslog-ng segfaults on powerpc64le, workaround this error.
+See https://github.com/syslog-ng/syslog-ng/issues/4285 for more details.
+This patch should be dropped once the above issue gets a real fix.
+
+Upstream-Status: Inappropriate [OE Specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ lib/plugin.c | 8 ++------
+ 1 file changed, 2 insertions(+), 6 deletions(-)
+
+diff --git a/lib/plugin.c b/lib/plugin.c index fbbfb92..3a03617 100644
+--- a/lib/plugin.c
++++ b/lib/plugin.c
+@@ -528,10 +528,7 @@ plugin_discover_candidate_modules(PluginContext *cont=
ext)
+                     }
+                 }
+               g_free(module_name);
+-              if (mod)
+-                g_module_close(mod);
+-              else
+-                mod =3D NULL;
++              mod =3D NULL;
+             }
+         }
+       g_dir_close(dir);
+@@ -663,8 +660,7 @@ plugin_list_modules(FILE *out, gboolean verbose)
+                   first =3D FALSE;
+                 }
+               g_free(module_name);
+-              if (mod)
+-                g_module_close(mod);
++              mod =3D NULL;
+             }
+         }
+       g_dir_close(dir);
+--
+2.17.1
+
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.38.1.bb b/meta-o=
e/recipes-support/syslog-ng/syslog-ng_3.38.1.bb
index 76945095a..182a253d3 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.38.1.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.38.1.bb
@@ -23,6 +23,7 @@ SRC_URI =3D "https://github.com/balabit/syslog-ng/release=
s/download/${BP}/${BP}.ta
            file://syslog-ng-tmp.conf \
            file://syslog-ng.service-the-syslog-ng-service.patch \  "
+SRC_URI:append:powerpc64le =3D " file://0001-plugin.c-workaround-powerpc64=
le-segfaults-error.patch"
=20
 SRC_URI[sha256sum] =3D "5491f686d0b829b69b2e0fc0d66a62f51991aafaee005475bf=
a38fab399441f7"
=20
--
2.17.1


