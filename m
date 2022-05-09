Return-Path: <aryaman.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C86C433F5
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 21:05:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1094.1652130322102716586
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 14:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=QH6XAeYK;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=2128e521d0=aryaman.gupta@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 249KKQYG004437
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 9 May 2022 14:05:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=4TSTGQ/lsnJuIPekMS7WrjqWg5jqLUtBUe/cRElSbFM=;
 b=QH6XAeYKzAKScWEzQAXupdN/uUDC0VtnOD2EP/PbPhCaxYl5wVgH4AIwC2jNyl6KwWWa
 TKdpISq75GjpY3lg7iimwTqqGAzV2eapJwH1gUz3ixEY458rXMREd9b39bq4xkmIcY2a
 +rj4urJDCmIUv44ZOn3MVTRO9jA/JLgMGXM48KWLRMlqCFFoT0KkhqFM8t+T957VnVp5
 gVzyv8h7u0s9z5yt2P1sq2h/AOS1i8/WU7IPvPmAT/ick4H9DAkXu04n4RJE1hnjiuzp
 XXmz8kGfgBq4/WudAzZNMK4aH6bzHjinlp1IM75ajlKjXSSF5xt0hkcur19PW54is7iG gA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fxde5gxd2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 14:05:21 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 249L5K1x010572
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 9 May 2022 14:05:20 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fxde5gxd0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 May 2022 14:05:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXrfmQD/UVh6SLwwDWgvHpYgAJTz8kqERwEdvS7QRBfxB0FeU6sM2238q9+eGLeIx4o4XFmcQ5kqlesoZfT1fabG69TQRQdSzPaKcpw8lufMTyiuVMzUeHISUB5g35nVzgYA7lCA9ZgLZxDqeiasXOEYKoM423HkR7PQNY88zENNDBwk34kTY6NZeofYThq29+ERxrULuaMnsmYbDUWaoOvJIwp2r6iU7ijmpf0NgDPlAybIlSazQXMups3EeuBDYY4si28VsthBWw41LRHMr/3cklFacWcEtLSsR94Tn44NyMz8+Y5ppwsW2jhXUzyIOAk7PaEffSPO3/oD/WvmKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4TSTGQ/lsnJuIPekMS7WrjqWg5jqLUtBUe/cRElSbFM=;
 b=QlusGGD64Qx7e6gX0srQ+GHMrBivm+1zPvRwAbn6c+6BxYcS/I5SEA9FVR/Vh5sNU0ycyxpPWqxTZK5DcZolHa8iTjPbfjyYNsoCB48ayG/3hd8c+07sL3uIPt8bri9gEjbqfCvjvgvPtYkTXKU9MUPMoAnTu9Lc0wLJIx6AMBiTRIOoXoDvZVi2gK2IlMZO+q2Ecx0xezgSx39AkfnHWDx4otBmWPf9CORWyJXmqmVxqSaLd1WuLOxzYYXyXihGP6BBzzOgxNig4fjgnWD05rEPC0j7rxNTNjPvyJ7+MqAEx9rT9NYXdnMlyov2qJh8CM4Izzb4eeRDSpdEAOO6LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6030.namprd11.prod.outlook.com (2603:10b6:510:1d1::19)
 by DM5PR1101MB2364.namprd11.prod.outlook.com (2603:10b6:3:ab::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Mon, 9 May
 2022 21:05:18 +0000
Received: from PH7PR11MB6030.namprd11.prod.outlook.com
 ([fe80::b854:f057:e8f9:f3cf]) by PH7PR11MB6030.namprd11.prod.outlook.com
 ([fe80::b854:f057:e8f9:f3cf%9]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 21:05:18 +0000
From: "Gupta, Aryaman" <Aryaman.Gupta@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        "bruce.ashfield@gmail.com"
	<bruce.ashfield@gmail.com>
Subject: RE: [meta-oe][PATCH] intel-speed-select: Add libnl dependency and
 extend CFLAGS
Thread-Topic: [meta-oe][PATCH] intel-speed-select: Add libnl dependency and
 extend CFLAGS
Thread-Index: AQHYY+WT3yncbLJqB0ejrZevRY0S8K0XBlEg
Date: Mon, 9 May 2022 21:05:18 +0000
Message-ID: 
 <PH7PR11MB60305EF69D9D92571B016E91EBC69@PH7PR11MB6030.namprd11.prod.outlook.com>
References: <20220509204353.9804-1-aryaman.gupta@windriver.com>
In-Reply-To: <20220509204353.9804-1-aryaman.gupta@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ccaf9aa4-ba37-4ecf-24f1-08da31ff9f5a
x-ms-traffictypediagnostic: DM5PR1101MB2364:EE_
x-microsoft-antispam-prvs: 
 <DM5PR1101MB236420B93231CDDA75E904D4EBC69@DM5PR1101MB2364.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 rkwVfLHeWQEWOK00tn310O1MIW8TQj9ORy0M+KWHy1WniG64Zd90iMLJiKzz3epagAsyb8xLSx3Y1rnYokkSfQWCkM6u+4pJ0o/4w47CTUfmLvR3xf7OkHrGuJbbcKwhNZiPlbIeAj4RBQjOaNBtnNx8UlXAjhCMsesgaOMEoPeEzbXGm/RPgsJKCaLDQtmC5Rdy3hNoc04OFgE3xW0pd5wfIFllUdvRy16waPdso79lPtyTTmDVhClz4gDGRv3azoQoEgQKhhXIY9QntpJT6mORunanHXoczrV8Qgx1i/NwXJ1+hsVB6mwKjr411zW2rz6HuhxAtcjJ965OGFp8IgtbGT746/sZqnipYEQxWW/l3IaFIXhAN8W2g55lARbWnrZuwV89VMMW19arwYtf9cNdYRL3U1uq/Jce4Li93rSOMw35iWsY6mPM17Yw04JwIXpPl+RUbvF+jj6w2EdLXCPZwuHWVKltJdskTALBIv29RUNmEEfvw45syXPVUQhSTKoa8nz+YJXBgOxy8At3GebeSOUcWG9KmvptB/66SX8hlC6rz+rJTbRcW4vKts5hx6UaYmH9Zn8StBRZHbUH4IgMidSCWtbAI8I/f5NOSSaJhQKgERhiJbGTc6tOW2Sq5f4mbBqrmE7GlKp+gmnEsu39smeHtXTh8cqPhxCmwJ+18zYaFzJgE9BsNsTAHxQvRf0t3VrxkUf4lqU5yPeFaQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6030.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(26005)(83380400001)(7696005)(6506007)(122000001)(38100700002)(33656002)(55016003)(52536014)(5660300002)(8936002)(2906002)(9686003)(66946007)(508600001)(66476007)(76116006)(38070700005)(64756008)(66446008)(4326008)(8676002)(71200400001)(66556008)(86362001)(186003)(54906003)(6916009)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?DPURkImTzucv2+aCUmsUWZArryxT/owDRHSMTjNcUHK3R7NYQiBHqfHWGTTm?=
 =?us-ascii?Q?QbXM8XXq9WKDXn7nfVbDpoKqHT+3EhPh6oC8l2SdykiB9MGQjw1hFyXWGMaW?=
 =?us-ascii?Q?QIPTR7ekNfsfx5QxmKoYW2L/Ho778AabCvSqVvSwGgZ9uvXxVSPVNVA/rZ7G?=
 =?us-ascii?Q?9ABwJeBQT70DWG96LTQV8/ns2/WrL6J7mWSFybP/fPgWQT0KIGIWv96KAIKv?=
 =?us-ascii?Q?wvj/iZxyV2RZWxSm1/pjZ/6RnKk+ypjUchZwYWardHvz9velNGwOaYCRligi?=
 =?us-ascii?Q?OUXkAGNv66GQ5l962wJXbiyrzu5I7pZLks5HWUYD2p1eh+yeqMLlSS36rqVc?=
 =?us-ascii?Q?3aD4bOtjnW0h9uTh2ocsMOhV9SaTXPNzeywtAlpAvXLJfRdP60g770MQkWBS?=
 =?us-ascii?Q?gBZ933VyihCnHCDmaBJFVR1FpnhQcBEEpwb6vRO8PLb756KwDlRdpsTVxwJe?=
 =?us-ascii?Q?T0bjrgTynRr1TI1FsEpDqrC3cn8OXF7SX6a5qA2rbbTWcF9ohxBJuVZqx93V?=
 =?us-ascii?Q?8hAAlIc3GJqUbtlq15XYEtL/dEwNNGzc55vMBxFefj+mfjEtGYjwBFpoUgRd?=
 =?us-ascii?Q?8XzMh+t3LE6yzt1p1KLWNJHybLu3babxyyrEPqk0GS+JJcZYAEhnCGcu5yhl?=
 =?us-ascii?Q?Cqw8q6aXct0uZTSbNZUXFQl336D16cC46lC48CviqsXsyPgTMmVp4qN62Aqo?=
 =?us-ascii?Q?TAfo2cbgM1vQPryk+d1RJYTKlQKripDs9hH4qUztxiCgl1oowKItSCkXULwk?=
 =?us-ascii?Q?aT2Nd/q0RLO79EaOfhnmVhheA7mxjS7zlDJ5eTkTohmvbgRl5rx1qysIH7i8?=
 =?us-ascii?Q?5aN7nNrHcq+an6J4sYoSUhP1TJZ1cfQpmEgp+olW2RGobTr2H2zu1Ru+uU3p?=
 =?us-ascii?Q?No4RjamLeBdy1LcknFOOw0Sf55CVfWHnrkC+lU5C6pexKFSgrAxIyIgtP33C?=
 =?us-ascii?Q?wlhOpQWGhx6waFSPsYv8BPwYcbDmfF03NsUpnUpr/HHIyvVhGQtQjhVHWng8?=
 =?us-ascii?Q?icc+lZWvWMkmA4ZJVzylMfEtuK0Q0EUtBrnYghiGZRYNzQfJ5EEv7H/NByAZ?=
 =?us-ascii?Q?nGTQ4kettbWYlZ3XsZBFQd5yqRu7j70Hmf5G2wGt5Pbb5bw5FyIcwxGKI1GZ?=
 =?us-ascii?Q?rZpO6SsT/eQAo31cCVpjtKZeTOr6g5Bf9+YkcI0DEEefiNmlFKSeQfzr+muJ?=
 =?us-ascii?Q?OdWrH0l9aMcCVcolY0lQcV8BPP9S1NU6K9wxxBod055NkulZ2AKdpd6xM9jQ?=
 =?us-ascii?Q?Vc9TcgwiycaarPfEoKFJ67f6pmGBoHscjVZEt/AewtwmGsUAhUoUmJd0iEdC?=
 =?us-ascii?Q?onYGnUmJMQJycvZz/BzXuOhbFJ+Y7SEZFf5thNpVyjjJnOPfeWRkoV116lCm?=
 =?us-ascii?Q?Ll8+vcakUZWCoYatD6quRYZpvp8tO9m2oGSuZR+ECXpSkHxwKoswG2r/4PiL?=
 =?us-ascii?Q?lt16nYDQ59eTnenJ5WIPIdYPhZmzNA5kP0t/0T5elkGjWYg0xRy9fqxcUxox?=
 =?us-ascii?Q?NR0tEXA2GgNvdovchKumjT/UCmmEQDrKZVPWWcHiwLpD4MqaDcKlttc4Uryj?=
 =?us-ascii?Q?er4ncOr/frk2NEpyVncuXiadbj2FJwfeNzaLg1i09MQ0k7rNZzsGOMwmTcix?=
 =?us-ascii?Q?poCVBO+19XNLaZ5iBDqk+z8Simvy8thLwnQcd7q23Li+5GRJyURTuBpuZLdo?=
 =?us-ascii?Q?Sx/FXvwdMmjl5ixA3K9cUTwT960HZ6SK4hJItG3s9gCXJmqXHTZW5HUIHYtP?=
 =?us-ascii?Q?s2eaUY9fVk8A4KO1s9t5zaAPj4/KG5o=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6030.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ccaf9aa4-ba37-4ecf-24f1-08da31ff9f5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2022 21:05:18.6096
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 p36izsT9LlAOC0YDfkYm6HKe0QPdByUvLsZmvUIdtzvaD+hLZSSDAsXvsNC0pEdblX7IWwADkb/j1AGB+2d0KJ/5qqffjk5UdzyOiwAVXz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2364
X-Proofpoint-GUID: 1KUguG-UuwYIGk803emAOwjWmFkSIdaV
X-Proofpoint-ORIG-GUID: iHOgK7JZMesQC0xN3HfhsZFQ9WNTOhJq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-09_05,2022-05-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 mlxscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 mlxlogscore=865 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205090106
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 21:05:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97022


Hi Bruce,

I'm working with Randy as a summer intern. We figured you may be interested=
 in this commit. It's a simple change to add a dependency but strangely, it=
 used to work for linux-yocto but recently started to fail for linux-yocto-=
dev. We noticed this discrepancy within the last week when rebasing wr-linu=
x, where the genl.h file from libnl is present in the recipe-sysroot for li=
nux-yocto but not for linux-yocto-dev (unless this dependency is added).  R=
andy and I are puzzled why this change showed up at this point; any ideas?

Regards,
Aryaman and Randy
-----Original Message-----
From: Gupta, Aryaman=20
Sent: Monday, May 9, 2022 4:44 PM
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] intel-speed-select: Add libnl dependency and exte=
nd CFLAGS

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Add libnl dependency and extend CFLAGS to include the libnl3 directory.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Aryaman Gupta <aryaman.gupta@windriver.com>
---
 .../recipes-kernel/intel-speed-select/intel-speed-select.bb    | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-kernel/intel-speed-select/intel-speed-select.b=
b b/meta-oe/recipes-kernel/intel-speed-select/intel-speed-select.bb
index c895e6c1d..23ea0d8aa 100644
--- a/meta-oe/recipes-kernel/intel-speed-select/intel-speed-select.bb
+++ b/meta-oe/recipes-kernel/intel-speed-select/intel-speed-select.bb
@@ -11,10 +11,13 @@ inherit kernelsrc
 COMPATIBLE_HOST =3D '(x86_64|i.86).*-linux'
 COMPATIBLE_HOST:libc-musl =3D 'null'
=20
+DEPENDS =3D "libnl"
+
 do_populate_lic[depends] +=3D "virtual/kernel:do_patch"
=20
 B =3D "${WORKDIR}/${BPN}-${PV}"
=20
+CFLAGS +=3D "-I${STAGING_INCDIR}/libnl3"
 EXTRA_OEMAKE =3D "-C ${S}/tools/power/x86/intel-speed-select O=3D${B} CROS=
S=3D${TARGET_PREFIX} CC=3D"${CC}" LD=3D"${LD}" AR=3D${AR} ARCH=3D${ARCH}"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
--=20
2.33.0


