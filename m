Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF347C4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 08:06:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.14155.1671609951355994519
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Dec 2022 00:05:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=cOlmJdD4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9354e08228=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BL85oBp017236
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Dec 2022 00:05:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=DgPiu8SHQ6E5Ppz/IawRe6JlzfwScyyEav5M4uHXt8g=;
 b=cOlmJdD4wdivmvxAhXPPwvqL4vSnhMLwywNi3ImcudSWXaI716/ziIBUxMJjY37gUHxd
 L56Cmj9Pnyz7XjBG2NfijP9/DK1pRpy3mJLpfcMot/VDjjbx0PSsUVgt4aH9Agnh9COq
 dvm/6WOg4qLqUDX3ggN2/Q3T+9b/ZpnGs7CykCaTpUC7s2e909ZbYVJ/mz8HSCmqopwl
 CfSEYyqZnyuIBqEM3jqWxaTelTAsJkjHY1AEYD0ETccEy0e2GjRTKrhe10bFhrHLxMmd
 F8REz8xu5SsC2T93L9feZbdhUMKAYfL+PaQtQ3TdJYznyAbMT2gn4COEqvDw09uk/itt Pw== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mhe5qarrq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Dec 2022 00:05:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ITZ+FFneuMJ9KaEEhGDNvqX2gkwj7N1qGphusKcPyTMO5kyLqTTX3NRAhqmv5Z+v3meho1hDGAvEzH+H/hswiZDQD705II3izWZTbyCSz/NYJ/otyO6/83Xl91bKG6K5SUWUmkUT2wgDxMIekP7XSJUjiGXfj8lKJirVTlofrMy6LLUqP9hxqpnt8clSvURWR4yblkXnn+Q3eAcG4rJ6zsbbaZ3FX0hPzkNpAHKU28Hsf9Z+EnggxVbJGcNEy7jKH6ehDMfWrRa70b+tR9x0QRxSYqQm7Tyn6SouZE/QQMVvNyl0/d9belZgckHrZv2fIbdfvSBKzVRvIVcwxN1Haw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DgPiu8SHQ6E5Ppz/IawRe6JlzfwScyyEav5M4uHXt8g=;
 b=Vulhr3kq0UpE5iBgJAVSIUDPxg0HCbsw9DCAwTj+DmXltGLY6SyafK99V0tf4qR8UT68yE1b9o/0v78d3I/oehNpUVOPPP/hnOoUF5vDSV/VF4/AAFN+5+MMubgWZj3xQeIrSKxAXVL29wA/mA2dOBZ1yNDDX8tbOvNS+G14zWAKwNJ+/tF+lwKXRGe7/Ea1FdQM58TGtwOaXvGZFAbeYbRsS+EW6qzMBd8HiHWkwk8zf30vcjVXWam9LDhFslAwtZWrhmKjr0YqWISsoQ94FHwYQHwKbHYFeWisA+bgIe5erdg367HTSKIMvkcIbzu7OiG5s4DmeXZMHYFExChc6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by MN0PR11MB6136.namprd11.prod.outlook.com (2603:10b6:208:3c8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 08:05:47 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::efde:3b28:b807:1f8c]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::efde:3b28:b807:1f8c%4]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 08:05:46 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "Urade, Yogita"
	<Yogita.Urade@windriver.com>
CC: "G Pillai, Hari" <Hari.GPillai@windriver.com>
Subject: Re: [oe][meta-oe][PATCH 1/1] multipath-tools: fix CVE-2022-41973
Thread-Topic: [oe][meta-oe][PATCH 1/1] multipath-tools: fix CVE-2022-41973
Thread-Index: AQHZFQp+hKXkSsBQ6ECTXRvnTSiNjK53+3Zv
Date: Wed, 21 Dec 2022 08:05:46 +0000
Message-ID: 
 <MW4PR11MB5822338B5148FFBACF96864284EB9@MW4PR11MB5822.namprd11.prod.outlook.com>
References: <20221221070408.1871070-1-yogita.urade@windriver.com>
In-Reply-To: <20221221070408.1871070-1-yogita.urade@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|MN0PR11MB6136:EE_
x-ms-office365-filtering-correlation-id: 7676a486-7df9-44fb-9b5a-08dae32a2a9d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KvCKJhKeoDXY50Bs5fP5MN1iMgt1l2gIJWZ/W/jdm1aizu00R4M7lsfJdfG8T4fQCPfGkmJkgOe0RJeKIPSU4E6yxYTpuqavaoQph8YF3OP3EWYog45S0HY+K3N3dbnJxQQYs6f8tZG4y/wD4wOYjiiKqxa0G4MLvqpDdZHeuKSsSV9IvSbVbYKdYx8hilPddKt8NJgm9bj8m7zCLj809ddvn4Hl/zFjxM8zSydKqyeRzeeRlQ/8oGVZ2UG//JrNzWIB8q0zfPerUhq611KVC36KTOTr5TOzsvvHMEtVqsJE5opmlK6ZB9oOqrAVrq99u6tE/7uVBCShdji81uDSx4o0SgD3QRW2hAUKBOD3m09kDJeH+e0DZxpOVOv62z3i0t01jnNNEHURAdRIjetAQZJEh3C1VtQLvB/Ls+5iTTaqcb9mknqQnZFgQy2y+23/fkOrru/hYIpgE0HFrlJ0IWlcY/xNAqqXmfi1CJeSu5ZNaNgNmYtQ4zgPWNWJbF/cX09g3uCMr542ZqzqOe9z0b7yXEBerF1k7uw6HC5sntlKVgS9gySEeEoCx21f8xtQOklElKOMSik1zSSJeaNiLelb4TuwkMM4x/cIu8nPom0PkOJefivTcS3oCd9kRbjh0GfkaZo0IDP8GYDTNVuHP5QW6Vaq0YlBHpOTJ2GcrStNyZmll/TybReVmnYGCeWf9SALYktD7V35E1rw9Uogdx6qvuEbJ1A1+brU3MytXtPRPG5LLx+JlxTb0aR2+Wh8BSi2W8Nw8ybxNKBY6XghGA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(136003)(366004)(346002)(376002)(396003)(451199015)(55016003)(86362001)(966005)(478600001)(26005)(186003)(33656002)(71200400001)(9686003)(38100700002)(7696005)(66446008)(76116006)(64756008)(91956017)(66476007)(66556008)(5660300002)(41300700001)(2906002)(4326008)(6636002)(316002)(52536014)(8676002)(107886003)(66946007)(6506007)(8936002)(110136005)(166002)(122000001)(38070700005)(83380400001)(19627405001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?+yPmsK+x2o8EZFB3X/WL+88+FVlawfPfIXvm3Nq9neyhRkMI2fMY4RPU+Nmo?=
 =?us-ascii?Q?QmFytSoGxDSpqKoB5bSaaJ9kz9//EyYb6sbpHaWQFldxCc53ddnejAM9MyNc?=
 =?us-ascii?Q?fXsQwfxq6yV3sjL/LGHNtmRaYXe0RQUoKzLaDFjPpLHT1vjejQk2AADWcRLB?=
 =?us-ascii?Q?aCW8adyqyu//KGcCfCYAKIPA8rtrajO46ewR4WEvglKpZhLUvwDfM1erdOvu?=
 =?us-ascii?Q?YxzTHnoIYPcyXgPLHpxdukUhMUFhNdMkUc2Pj2ix1EMN0K0WeooS76JqN20H?=
 =?us-ascii?Q?ICFCnYa+4a1RGOtxl0QSjxcVKx87odY/kIhQb8Puwcw5C7rHcJR9B1t5suFx?=
 =?us-ascii?Q?sRL1TlYDu7/HidXrZLJGTiIjikkyoE4+J/+bpgi6rVVqni8pAjt9SDhHFuRS?=
 =?us-ascii?Q?NvvNq8mR3ljAl1kmDg6FbCiZ2x2YKIKuvikJnZTC2swEm6zqnZQaQzThhOmq?=
 =?us-ascii?Q?KrSUGs7af61OaBbRby65IXGvD4YgUcWEmAGwF821NZW3GacZuiqUzt/p5MD3?=
 =?us-ascii?Q?65rh3TSzMoHOWf9CS2kAAQEydYitnznNU5E3KwTovEqBJP+iLcdGc+TxjYUb?=
 =?us-ascii?Q?jlHiLtuDf6D8EFZp6C0qg00gkTtjmVItTttMwAZ/MfRWeredK1DKZiume1M4?=
 =?us-ascii?Q?Z2VLFuatSxwxRQMRFRguf5g3wv4M0iSal3TaIdSLhchSvwFP3YqjninWZpvW?=
 =?us-ascii?Q?F3q83vWVezOZu0KmYCe0nx/yoUCQ6T3S+a3L6u22ka03TMLvs8pTHj4EldGj?=
 =?us-ascii?Q?hQOEUwhjZGTPB+sOt06l5xbX9BF04/qLgaKo3NskF2fjvVcKIFgefZ9JtKcI?=
 =?us-ascii?Q?6vqSRQ97VpWviB3uGEjI80oWPNo8MH2P9TlFHdd0ZYLu7h/MyWO6QGfKZNwh?=
 =?us-ascii?Q?tBVfD/G0Y/04XZziYijwvzQT9042POAP8IRgttmlo7S2INS6yrvDY3YDfVbN?=
 =?us-ascii?Q?Vtik5qN6EPqYGKse/NN8tS9RbVzjlOuBUwaLl02I2jb1cCGJ83nF9+BkIj7h?=
 =?us-ascii?Q?ZRejxdxn3dc2SAk6jFmVW42/+kHpe2JBLYUaHMS1fxsVr+p1bodBBKJc20Ps?=
 =?us-ascii?Q?jYncMpVlwSHFqFB6js7yxdOGVR2vRMfSQgWrUs9Mn6/Z4wV+VOnUnao4brQh?=
 =?us-ascii?Q?RWdBN+sPhBIumyaWhkvWwmkj+0zU0P+u1xsjZV66Ue874vUuPSsoIkHNJABp?=
 =?us-ascii?Q?KCXOxfRU+pOMkBaObr8qfJQQXxWFzz3LuWTxEUucpnoF25a3ciK+d7NAqe0E?=
 =?us-ascii?Q?jDVauxEALc4IbCVcZ8imHAoUesG6aSFvbTfvDLu+NVEe72BgBLn3vCGAOg06?=
 =?us-ascii?Q?ilk0GW6wF7VKP+cVuO7PN1f1Mk4+XM3jZW5ko0CQ38FphxR3BC5DtUq6e6MW?=
 =?us-ascii?Q?yw9R6E58IV7X3h3NzzY6h2qPyMpmjeFjUSjavdtzPmyT0cQSBqzY/Bg+Tgjd?=
 =?us-ascii?Q?m58312R/HzGlZPG0oNrvQt3ZuFfQSPGp5KoneXmpa0u3hWgu1SQIMTufzzaf?=
 =?us-ascii?Q?5ZVPLAS0U8WMXwlLRuqVacSebK+el3DEB+8LKBZJ25ac06msK3eXPno2rhTF?=
 =?us-ascii?Q?Zl6RdEwNocLAFK++lhbLUufmB89ZlGsKfsQhyXT4+CtaA7JM6i4j2E1i0ebS?=
 =?us-ascii?Q?zA=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB5822338B5148FFBACF96864284EB9MW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7676a486-7df9-44fb-9b5a-08dae32a2a9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2022 08:05:46.9293
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qDHwWBl5ZqdqTl8//KGT/UB1N2cP7cLdCGrZ1iMvX45ctYzpkeqqBRoSDONNId9nS9dz8MzimC9Geev69psnewLyQFF2rnlWVlWZ6ZvQx+tLHvDzsPS7Y2DwDl4hXa7d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6136
X-Proofpoint-ORIG-GUID: ViL7BtpycutPNAd30OCLxR_tbjD_mt5t
X-Proofpoint-GUID: ViL7BtpycutPNAd30OCLxR_tbjD_mt5t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_03,2022-12-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212210063
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Dec 2022 08:06:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100175

--_000_MW4PR11MB5822338B5148FFBACF96864284EB9MW4PR11MB5822namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Yogita,

Please add CVE ID and Upstream-Status in main patch as well

Regards,
Archana
________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Urade, Yogita via lists.openembedded.org <Yog=
ita.Urade=3Dwindriver.com@lists.openembedded.org>
Sent: Wednesday, December 21, 2022 12:34 PM
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Cc: G Pillai, Hari <Hari.GPillai@windriver.com>; Urade, Yogita <Yogita.Urad=
e@windriver.com>
Subject: [oe][meta-oe][PATCH 1/1] multipath-tools: fix CVE-2022-41973

multipath-tools 0.7.7 through 0.9.x before 0.9.2 allows local users to obta=
in root access, as exploited in conjunction with CVE-2022-41974. Local user=
s able to access /dev/shm can change symlinks in multipathd due to incorrec=
t symlink handling, which could lead to controlled file writes outside of t=
he /dev/shm directory. This could be used indirectly for local privilege es=
calation to root.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-41973

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 ...ath-tools-use-run-instead-of-dev-shm.patch | 159 ++++++++++++++++++
 .../multipath-tools/multipath-tools_0.8.4.bb  |   4 +
 2 files changed, 163 insertions(+)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0001-mult=
ipath-tools-use-run-instead-of-dev-shm.patch

diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-multipath-t=
ools-use-run-instead-of-dev-shm.patch b/meta-oe/recipes-support/multipath-t=
ools/files/0001-multipath-tools-use-run-instead-of-dev-shm.patch
new file mode 100644
index 000000000..dd6af413e
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0001-multipath-tools-us=
e-run-instead-of-dev-shm.patch
@@ -0,0 +1,159 @@
+From 23e13a52a6213b11eda9a3b09df455f495f74e8d Mon Sep 17 00:00:00 2001
+From: Yogita Urade <yogita.urade@windriver.com>
+Date: Tue, 13 Dec 2022 09:18:33 +0000
+Subject: [PATCH] multipath-tools: use /run instead of /dev/shm
+
+/dev/shm may have unsafe permissions. Use /run instead.
+Use systemd's tmpfiles.d mechanism to create /run/multipath
+early during boot.
+
+For backward compatibilty, make the runtime directory configurable
+via the "runtimedir" make variable.
+
+Signed-off-by: Martin Wilck <mwilck@suse.com>
+Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
+
+CVE: CVE-2022-41973
+
+References:
+https://nvd.nist.gov/vuln/detail/CVE-2022-41973
+
+Upstream-Status: Backport [https://github.com/opensvc/multipath-tools/comm=
it/cb57b930fa690ab79b3904846634681685e3470f]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ .gitignore                                        |  2 ++
+ Makefile.inc                                      |  7 ++++++-
+ libmultipath/defaults.h                           |  3 +--
+ multipath/Makefile                                | 11 ++++++++---
+ multipath/{multipath.rules =3D> multipath.rules.in} |  4 ++--
+ multipath/tmpfiles.conf.in                        |  1 +
+ 6 files changed, 20 insertions(+), 8 deletions(-)
+ rename multipath/{multipath.rules =3D> multipath.rules.in} (95%)
+ create mode 100644 multipath/tmpfiles.conf.in
+
+diff --git a/.gitignore b/.gitignore
+index 9926756b..f90b0350 100644
+--- a/.gitignore
++++ b/.gitignore
+@@ -8,6 +8,8 @@
+ *.d
+ kpartx/kpartx
+ multipath/multipath
++multipath/multipath.rules
++multipath/tmpfiles.conf
+ multipathd/multipathd
+ mpathpersist/mpathpersist
+ .nfs*
+diff --git a/Makefile.inc b/Makefile.inc
+index 4eb08eed..648f91b4 100644
+--- a/Makefile.inc
++++ b/Makefile.inc
+@@ -44,6 +44,7 @@ exec_prefix  =3D $(prefix)
+ usr_prefix    =3D $(prefix)
+ bindir                =3D $(exec_prefix)/usr/sbin
+ libudevdir    =3D $(prefix)/$(SYSTEMDPATH)/udev
++tmpfilesdir   =3D $(prefix)/$(SYSTEMDPATH)/tmpfiles.d
+ udevrulesdir  =3D $(libudevdir)/rules.d
+ multipathdir  =3D $(TOPDIR)/libmultipath
+ man8dir               =3D $(prefix)/usr/share/man/man8
+@@ -60,6 +61,7 @@ libdmmpdir   =3D $(TOPDIR)/libdmmp
+ nvmedir               =3D $(TOPDIR)/libmultipath/nvme
+ includedir    =3D $(prefix)/usr/include
+ pkgconfdir    =3D $(usrlibdir)/pkgconfig
++runtimedir      :=3D /$(RUN)
+
+ GZIP          =3D gzip -9 -c
+ RM            =3D rm -f
+@@ -95,7 +97,10 @@ OPTFLAGS       +=3D -Wextra -Wstrict-prototypes -Wforma=
t=3D2 -Werror=3Dimplicit-int \
+                   -Wno-unused-parameter -Werror=3Dcast-qual \
+                   -Werror=3Ddiscarded-qualifiers
+
+-CPPFLAGS      :=3D -Wp,-D_FORTIFY_SOURCE=3D2
++CPPFLAGS      :=3D $(FORTIFY_OPT) \
++                 -DBIN_DIR=3D\"$(bindir)\" -DMULTIPATH_DIR=3D\"$(plugindi=
r)\" -DRUN_DIR=3D\"${RUN}\" \
++                 -DRUNTIME_DIR=3D\"$(runtimedir)\" \
++                 -DCONFIG_DIR=3D\"$(configdir)\" -DEXTRAVERSION=3D\"$(EXT=
RAVERSION)\" -MMD -MP
+ CFLAGS                :=3D $(OPTFLAGS) -DBIN_DIR=3D\"$(bindir)\" -DLIB_ST=
RING=3D\"${LIB}\" -DRUN_DIR=3D\"${RUN}\" \
+                   -MMD -MP $(CFLAGS)
+ BIN_CFLAGS    =3D -fPIE -DPIE
+diff --git a/libmultipath/defaults.h b/libmultipath/defaults.h
+index c2164c16..908e0ca3 100644
+--- a/libmultipath/defaults.h
++++ b/libmultipath/defaults.h
+@@ -64,8 +64,7 @@
+ #define DEFAULT_WWIDS_FILE    "/etc/multipath/wwids"
+ #define DEFAULT_PRKEYS_FILE    "/etc/multipath/prkeys"
+ #define DEFAULT_CONFIG_DIR    "/etc/multipath/conf.d"
+-#define MULTIPATH_SHM_BASE    "/dev/shm/multipath/"
+-
++#define MULTIPATH_SHM_BASE    RUNTIME_DIR "/multipath/"
+
+ static inline char *set_default(char *str)
+ {
+diff --git a/multipath/Makefile b/multipath/Makefile
+index e720c7f6..28976546 100644
+--- a/multipath/Makefile
++++ b/multipath/Makefile
+@@ -12,7 +12,7 @@ EXEC =3D multipath
+
+ OBJS =3D main.o
+
+-all: $(EXEC)
++all: $(EXEC) multipath.rules tmpfiles.conf
+
+ $(EXEC): $(OBJS) $(multipathdir)/libmultipath.so $(mpathcmddir)/libmpathc=
md.so
+        $(CC) $(CFLAGS) $(OBJS) -o $(EXEC) $(LDFLAGS) $(LIBDEPS)
+@@ -26,7 +26,9 @@ install:
+        $(INSTALL_PROGRAM) -m 755 mpathconf $(DESTDIR)$(bindir)/
+        $(INSTALL_PROGRAM) -d $(DESTDIR)$(udevrulesdir)
+        $(INSTALL_PROGRAM) -m 644 11-dm-mpath.rules $(DESTDIR)$(udevrulesd=
ir)
+-      $(INSTALL_PROGRAM) -m 644 $(EXEC).rules $(DESTDIR)$(libudevdir)/rul=
es.d/62-multipath.rules
++      $(INSTALL_PROGRAM) -m 644 multipath.rules $(DESTDIR)$(udevrulesdir)=
/56-multipath.rules
++      $(INSTALL_PROGRAM) -d $(DESTDIR)$(tmpfilesdir)
++      $(INSTALL_PROGRAM) -m 644 tmpfiles.conf $(DESTDIR)$(tmpfilesdir)/mu=
ltipath.conf
+        $(INSTALL_PROGRAM) -d $(DESTDIR)$(man8dir)
+        $(INSTALL_PROGRAM) -m 644 $(EXEC).8.gz $(DESTDIR)$(man8dir)
+        $(INSTALL_PROGRAM) -d $(DESTDIR)$(man5dir)
+@@ -43,9 +45,12 @@ uninstall:
+        $(RM) $(DESTDIR)$(man8dir)/mpathconf.8.gz
+
+ clean: dep_clean
+-      $(RM) core *.o $(EXEC) *.gz
++      $(RM) core *.o $(EXEC) multipath.rules tmpfiles.conf
+
+ include $(wildcard $(OBJS:.o=3D.d))
+
+ dep_clean:
+        $(RM) $(OBJS:.o=3D.d)
++
++%:    %.in
++      sed 's,@RUNTIME_DIR@,$(runtimedir),' $< >$@
+diff --git a/multipath/multipath.rules b/multipath/multipath.rules.in
+similarity index 95%
+rename from multipath/multipath.rules
+rename to multipath/multipath.rules.in
+index 0486bf70..5fb499e6 100644
+--- a/multipath/multipath.rules
++++ b/multipath/multipath.rules.in
+@@ -1,8 +1,8 @@
+ # Set DM_MULTIPATH_DEVICE_PATH if the device should be handled by multipa=
th
+ SUBSYSTEM!=3D"block", GOTO=3D"end_mpath"
+ KERNEL!=3D"sd*|dasd*|nvme*", GOTO=3D"end_mpath"
+-ACTION=3D=3D"remove", TEST=3D=3D"/dev/shm/multipath/find_multipaths/$majo=
r:$minor", \
+-      RUN+=3D"/usr/bin/rm -f /dev/shm/multipath/find_multipaths/$major:$m=
inor"
++ACTION=3D=3D"remove", TEST=3D=3D"@RUNTIME_DIR@/multipath/find_multipaths/=
$major:$minor", \
++      RUN+=3D"/usr/bin/rm -f @RUNTIME_DIR@/multipath/find_multipaths/$maj=
or:$minor"
+ ACTION!=3D"add|change", GOTO=3D"end_mpath"
+
+ IMPORT{cmdline}=3D"nompath"
+diff --git a/multipath/tmpfiles.conf.in b/multipath/tmpfiles.conf.in
+new file mode 100644
+index 00000000..21be438a
+--- /dev/null
++++ b/multipath/tmpfiles.conf.in
+@@ -0,0 +1 @@
++d @RUNTIME_DIR@/multipath 0700 root root -
+--
+2.32.0
+
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.=
bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
index 5a8db0877..8f15c2c21 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
@@ -48,6 +48,7 @@ SRC_URI =3D "git://github.com/opensvc/multipath-tools.git=
;protocol=3Dhttp;branch=3Dmas
            file://0001-add-explicit-dependency-on-libraries.patch \
            file://0001-fix-boolean-value-with-json-c-0.14.patch \
            file://0001-libmultipath-uevent.c-fix-error-handling-for-udev_m=
o.patch \
+           file://0001-multipath-tools-use-run-instead-of-dev-shm.patch \
            "

 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec522ec=
2"
@@ -120,3 +121,6 @@ FILES:kpartx =3D "${base_sbindir}/kpartx \

 RDEPENDS:${PN} +=3D "kpartx"
 PARALLEL_MAKE =3D ""
+
+FILES:${PN}-libs +=3D "usr/lib"
+FILES:${PN}-libs +=3D "usr/lib/tmpfiles.d"
--
2.32.0


--_000_MW4PR11MB5822338B5148FFBACF96864284EB9MW4PR11MB5822namp_
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
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb=
(255, 255, 255);">
Hi Yogita,</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb=
(255, 255, 255);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb=
(255, 255, 255);">
Please add CVE ID and Upstream-Status in main patch as well</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb=
(255, 255, 255);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb=
(255, 255, 255);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb=
(255, 255, 255);">
Archana</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-devel@li=
sts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; on b=
ehalf of Urade, Yogita via lists.openembedded.org
 &lt;Yogita.Urade=3Dwindriver.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Wednesday, December 21, 2022 12:34 PM<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Cc:</b> G Pillai, Hari &lt;Hari.GPillai@windriver.com&gt;; Urade, Yogita=
 &lt;Yogita.Urade@windriver.com&gt;<br>
<b>Subject:</b> [oe][meta-oe][PATCH 1/1] multipath-tools: fix CVE-2022-4197=
3</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">multipath-tools 0.7.7 through 0.9.x before 0.9.2 a=
llows local users to obtain root access, as exploited in conjunction with C=
VE-2022-41974. Local users able to access /dev/shm can change symlinks in m=
ultipathd due to incorrect symlink
 handling, which could lead to controlled file writes outside of the /dev/s=
hm directory. This could be used indirectly for local privilege escalation =
to root.<br>
<br>
References:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2022-41973">https://nvd.nis=
t.gov/vuln/detail/CVE-2022-41973</a><br>
<br>
Signed-off-by: Yogita Urade &lt;yogita.urade@windriver.com&gt;<br>
---<br>
&nbsp;...ath-tools-use-run-instead-of-dev-shm.patch | 159 +++++++++++++++++=
+<br>
&nbsp;.../multipath-tools/multipath-tools_0.8.4.bb&nbsp; |&nbsp;&nbsp; 4 +<=
br>
&nbsp;2 files changed, 163 insertions(+)<br>
&nbsp;create mode 100644 meta-oe/recipes-support/multipath-tools/files/0001=
-multipath-tools-use-run-instead-of-dev-shm.patch<br>
<br>
diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-multipath-t=
ools-use-run-instead-of-dev-shm.patch b/meta-oe/recipes-support/multipath-t=
ools/files/0001-multipath-tools-use-run-instead-of-dev-shm.patch<br>
new file mode 100644<br>
index 000000000..dd6af413e<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/multipath-tools/files/0001-multipath-tools-us=
e-run-instead-of-dev-shm.patch<br>
@@ -0,0 +1,159 @@<br>
+From 23e13a52a6213b11eda9a3b09df455f495f74e8d Mon Sep 17 00:00:00 2001<br>
+From: Yogita Urade &lt;yogita.urade@windriver.com&gt;<br>
+Date: Tue, 13 Dec 2022 09:18:33 +0000<br>
+Subject: [PATCH] multipath-tools: use /run instead of /dev/shm<br>
+<br>
+/dev/shm may have unsafe permissions. Use /run instead.<br>
+Use systemd's tmpfiles.d mechanism to create /run/multipath<br>
+early during boot.<br>
+<br>
+For backward compatibilty, make the runtime directory configurable<br>
+via the &quot;runtimedir&quot; make variable.<br>
+<br>
+Signed-off-by: Martin Wilck &lt;mwilck@suse.com&gt;<br>
+Reviewed-by: Benjamin Marzinski &lt;bmarzins@redhat.com&gt;<br>
+<br>
+CVE: CVE-2022-41973<br>
+<br>
+References:<br>
+https://nvd.nist.gov/vuln/detail/CVE-2022-41973<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/opensvc/multipath=
-tools/commit/cb57b930fa690ab79b3904846634681685e3470f">https://github.com/=
opensvc/multipath-tools/commit/cb57b930fa690ab79b3904846634681685e3470f</a>=
]<br>
+<br>
+Signed-off-by: Yogita Urade &lt;yogita.urade@windriver.com&gt;<br>
+---<br>
+ .gitignore&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 ++<br>
+ Makefile.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp; 7 ++++++-<br>
+ libmultipath/defaults.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 +--<br>
+ multipath/Makefile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 11 ++++++++---<b=
r>
+ multipath/{multipath.rules =3D&gt; multipath.rules.in} |&nbsp; 4 ++--<br>
+ multipath/tmpfiles.conf.in&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
+ 6 files changed, 20 insertions(+), 8 deletions(-)<br>
+ rename multipath/{multipath.rules =3D&gt; multipath.rules.in} (95%)<br>
+ create mode 100644 multipath/tmpfiles.conf.in<br>
+<br>
+diff --git a/.gitignore b/.gitignore<br>
+index 9926756b..f90b0350 100644<br>
+--- a/.gitignore<br>
++++ b/.gitignore<br>
+@@ -8,6 +8,8 @@<br>
+ *.d<br>
+ kpartx/kpartx<br>
+ multipath/multipath<br>
++multipath/multipath.rules<br>
++multipath/tmpfiles.conf<br>
+ multipathd/multipathd<br>
+ mpathpersist/mpathpersist<br>
+ .nfs*<br>
+diff --git a/Makefile.inc b/Makefile.inc<br>
+index 4eb08eed..648f91b4 100644<br>
+--- a/Makefile.inc<br>
++++ b/Makefile.inc<br>
+@@ -44,6 +44,7 @@ exec_prefix&nbsp; =3D $(prefix)<br>
+ usr_prefix&nbsp;&nbsp;&nbsp; =3D $(prefix)<br>
+ bindir&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; =3D $(exec_prefix)/usr/sbin<br>
+ libudevdir&nbsp;&nbsp;&nbsp; =3D $(prefix)/$(SYSTEMDPATH)/udev<br>
++tmpfilesdir&nbsp;&nbsp; =3D $(prefix)/$(SYSTEMDPATH)/tmpfiles.d<br>
+ udevrulesdir&nbsp; =3D $(libudevdir)/rules.d<br>
+ multipathdir&nbsp; =3D $(TOPDIR)/libmultipath<br>
+ man8dir&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; =3D $(prefix)/usr/share/man/man8<br>
+@@ -60,6 +61,7 @@ libdmmpdir&nbsp;&nbsp; =3D $(TOPDIR)/libdmmp<br>
+ nvmedir&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; =3D $(TOPDIR)/libmultipath/nvme<br>
+ includedir&nbsp;&nbsp;&nbsp; =3D $(prefix)/usr/include<br>
+ pkgconfdir&nbsp;&nbsp;&nbsp; =3D $(usrlibdir)/pkgconfig<br>
++runtimedir&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :=3D /$(RUN)<br>
+ <br>
+ GZIP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D gzip -9 -c=
<br>
+ RM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D =
rm -f<br>
+@@ -95,7 +97,10 @@ OPTFLAGS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +=3D -Wext=
ra -Wstrict-prototypes -Wformat=3D2 -Werror=3Dimplicit-int \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -Wno-unused-parameter -Werror=3Dcast-qua=
l \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -Werror=3Ddiscarded-qualifiers<br>
+ <br>
+-CPPFLAGS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :=3D -Wp,-D_FORTIFY_SOURCE=3D2 <br=
>
++CPPFLAGS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :=3D $(FORTIFY_OPT) \<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; -DBIN_DIR=3D\&quot;$(bindir)\&quot; -DMULTIPATH_DIR=
=3D\&quot;$(plugindir)\&quot; -DRUN_DIR=3D\&quot;${RUN}\&quot; \<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; -DRUNTIME_DIR=3D\&quot;$(runtimedir)\&quot; \<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; -DCONFIG_DIR=3D\&quot;$(configdir)\&quot; -DEXTRAVE=
RSION=3D\&quot;$(EXTRAVERSION)\&quot; -MMD -MP
<br>
+ CFLAGS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; :=3D $(OPTFLAGS) -DBIN_DIR=3D\&quot;$(bindir)\&quot=
; -DLIB_STRING=3D\&quot;${LIB}\&quot; -DRUN_DIR=3D\&quot;${RUN}\&quot; \<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -MMD -MP $(CFLAGS)<br>
+ BIN_CFLAGS&nbsp;&nbsp;&nbsp; =3D -fPIE -DPIE<br>
+diff --git a/libmultipath/defaults.h b/libmultipath/defaults.h<br>
+index c2164c16..908e0ca3 100644<br>
+--- a/libmultipath/defaults.h<br>
++++ b/libmultipath/defaults.h<br>
+@@ -64,8 +64,7 @@<br>
+ #define DEFAULT_WWIDS_FILE&nbsp;&nbsp;&nbsp; &quot;/etc/multipath/wwids&q=
uot;<br>
+ #define DEFAULT_PRKEYS_FILE&nbsp;&nbsp;&nbsp; &quot;/etc/multipath/prkeys=
&quot;<br>
+ #define DEFAULT_CONFIG_DIR&nbsp;&nbsp;&nbsp; &quot;/etc/multipath/conf.d&=
quot;<br>
+-#define MULTIPATH_SHM_BASE&nbsp;&nbsp;&nbsp; &quot;/dev/shm/multipath/&qu=
ot;<br>
+-<br>
++#define MULTIPATH_SHM_BASE&nbsp;&nbsp;&nbsp; RUNTIME_DIR &quot;/multipath=
/&quot;<br>
+ <br>
+ static inline char *set_default(char *str)<br>
+ {<br>
+diff --git a/multipath/Makefile b/multipath/Makefile<br>
+index e720c7f6..28976546 100644<br>
+--- a/multipath/Makefile<br>
++++ b/multipath/Makefile<br>
+@@ -12,7 +12,7 @@ EXEC =3D multipath<br>
+ <br>
+ OBJS =3D main.o<br>
+ <br>
+-all: $(EXEC)<br>
++all: $(EXEC) multipath.rules tmpfiles.conf<br>
+ <br>
+ $(EXEC): $(OBJS) $(multipathdir)/libmultipath.so $(mpathcmddir)/libmpathc=
md.so<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(CC) $(CFLAGS) $(OBJS) -o $(EX=
EC) $(LDFLAGS) $(LIBDEPS)<br>
+@@ -26,7 +26,9 @@ install:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(INSTALL_PROGRAM) -m 755 mpath=
conf $(DESTDIR)$(bindir)/<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(INSTALL_PROGRAM) -d $(DESTDIR=
)$(udevrulesdir)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(INSTALL_PROGRAM) -m 644 11-dm=
-mpath.rules $(DESTDIR)$(udevrulesdir)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(INSTALL_PROGRAM) -m 644 $(EXEC).rules $(=
DESTDIR)$(libudevdir)/rules.d/62-multipath.rules<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(INSTALL_PROGRAM) -m 644 multipath.rules =
$(DESTDIR)$(udevrulesdir)/56-multipath.rules<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(INSTALL_PROGRAM) -d $(DESTDIR)$(tmpfiles=
dir)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(INSTALL_PROGRAM) -m 644 tmpfiles.conf $(=
DESTDIR)$(tmpfilesdir)/multipath.conf<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(INSTALL_PROGRAM) -d $(DESTDIR=
)$(man8dir)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(INSTALL_PROGRAM) -m 644 $(EXE=
C).8.gz $(DESTDIR)$(man8dir)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(INSTALL_PROGRAM) -d $(DESTDIR=
)$(man5dir)<br>
+@@ -43,9 +45,12 @@ uninstall:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(RM) $(DESTDIR)$(man8dir)/mpat=
hconf.8.gz<br>
+ <br>
+ clean: dep_clean<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(RM) core *.o $(EXEC) *.gz<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(RM) core *.o $(EXEC) multipath.rules tmp=
files.conf<br>
+ <br>
+ include $(wildcard $(OBJS:.o=3D.d))<br>
+ <br>
+ dep_clean:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(RM) $(OBJS:.o=3D.d)<br>
++<br>
++%:&nbsp;&nbsp;&nbsp; %.in<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed 's,@RUNTIME_DIR@,$(runtimedir),' $&lt;=
 &gt;$@&nbsp;&nbsp;&nbsp;&nbsp; <br>
+diff --git a/multipath/multipath.rules b/multipath/multipath.rules.in<br>
+similarity index 95%<br>
+rename from multipath/multipath.rules<br>
+rename to multipath/multipath.rules.in<br>
+index 0486bf70..5fb499e6 100644<br>
+--- a/multipath/multipath.rules<br>
++++ b/multipath/multipath.rules.in<br>
+@@ -1,8 +1,8 @@<br>
+ # Set DM_MULTIPATH_DEVICE_PATH if the device should be handled by multipa=
th<br>
+ SUBSYSTEM!=3D&quot;block&quot;, GOTO=3D&quot;end_mpath&quot;<br>
+ KERNEL!=3D&quot;sd*|dasd*|nvme*&quot;, GOTO=3D&quot;end_mpath&quot;<br>
+-ACTION=3D=3D&quot;remove&quot;, TEST=3D=3D&quot;/dev/shm/multipath/find_m=
ultipaths/$major:$minor&quot;, \<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RUN+=3D&quot;/usr/bin/rm -f /dev/shm/multi=
path/find_multipaths/$major:$minor&quot;<br>
++ACTION=3D=3D&quot;remove&quot;, TEST=3D=3D&quot;@RUNTIME_DIR@/multipath/f=
ind_multipaths/$major:$minor&quot;, \<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RUN+=3D&quot;/usr/bin/rm -f @RUNTIME_DIR@/=
multipath/find_multipaths/$major:$minor&quot;<br>
+ ACTION!=3D&quot;add|change&quot;, GOTO=3D&quot;end_mpath&quot;<br>
+ <br>
+ IMPORT{cmdline}=3D&quot;nompath&quot;<br>
+diff --git a/multipath/tmpfiles.conf.in b/multipath/tmpfiles.conf.in<br>
+new file mode 100644<br>
+index 00000000..21be438a<br>
+--- /dev/null<br>
++++ b/multipath/tmpfiles.conf.in<br>
+@@ -0,0 +1 @@<br>
++d @RUNTIME_DIR@/multipath 0700 root root -<br>
+-- <br>
+2.32.0<br>
+<br>
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.=
bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb<br>
index 5a8db0877..8f15c2c21 100644<br>
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb<br>
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb<br>
@@ -48,6 +48,7 @@ SRC_URI =3D &quot;git://github.com/opensvc/multipath-tool=
s.git;protocol=3Dhttp;branch=3Dmas<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-add-explicit-dependency-on-libraries.patch">file://0001-add=
-explicit-dependency-on-libraries.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-fix-boolean-value-with-json-c-0.14.patch">file://0001-fix-b=
oolean-value-with-json-c-0.14.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-libmultipath-uevent.c-fix-error-handling-for-udev_mo.patch"=
>
file://0001-libmultipath-uevent.c-fix-error-handling-for-udev_mo.patch</a> =
\<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://0001-multipath-tools-use-run-instead-of-dev-shm.patch">
file://0001-multipath-tools-use-run-instead-of-dev-shm.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;<br>
&nbsp;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://COPYING;md5=3D5f30f0716d=
fdd0d91eb439ebec522ec2">file://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec522e=
c2</a>&quot;<br>
@@ -120,3 +121,6 @@ FILES:kpartx =3D &quot;${base_sbindir}/kpartx \<br>
&nbsp;<br>
&nbsp;RDEPENDS:${PN} +=3D &quot;kpartx&quot;<br>
&nbsp;PARALLEL_MAKE =3D &quot;&quot;<br>
+<br>
+FILES:${PN}-libs +=3D &quot;usr/lib&quot;<br>
+FILES:${PN}-libs +=3D &quot;usr/lib/tmpfiles.d&quot;<br>
-- <br>
2.32.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW4PR11MB5822338B5148FFBACF96864284EB9MW4PR11MB5822namp_--

