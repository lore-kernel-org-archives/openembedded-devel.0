Return-Path: <chris.paterson2@renesas.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E153AC2D0CD
	for <webhook@archiver.kernel.org>; Sat, 17 May 2025 22:32:10 +0000 (UTC)
Received: from TY3P286CU002.outbound.protection.outlook.com (TY3P286CU002.outbound.protection.outlook.com [52.101.229.41])
 by mx.groups.io with SMTP id smtpd.web11.20656.1747521123201452314
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 May 2025 15:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@renesas.com header.s=selector1 header.b=o9+yvfKj;
 spf=pass (domain: renesas.com, ip: 52.101.229.41, mailfrom: chris.paterson2@renesas.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KVO/1kE6QfLxVs/3gzNXoCSXmjTo7fh8LMjIhOhnWf/6B/ExPe095LQ5fOz02qvL8hE44eMtw8+r94TuYDqqEng9+12o0mELm0/8HFqkeAE01bbPhlUf+28YAInjOdZPnNZxdiQVpTZQqSBBVBrJFeaQ0OUH6cuIIvXdjvwauYFuZq0VNkKBw+dvAegQam7skyROsoei7QmrSoSB43dc3eKO5Hx+6dZKaG3qCZl2AfNcL6whsTFzDUcwtkSs7VkAtSHogOCH6EHVHAqoaUhpb8KwRelBwyQ67FLbWMkt/APsC9NNtpd+m6O3+2D/LQr2azCVPe+GU+gNas5iaNoxdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjgNz9QKGzgS+OxKwjQs3WbeM1PFZC4745oMxAX4VYk=;
 b=YQzX8wurlfk7zWO+nxDmFzgR2kaEWxntkXQhSs32J5JHO0j6bxziWovLNHNh0Tc8woPuGvMiXqkc+mw+NceV87cVTE6RQ5VtkUJKgo1NofqzlpSn+Libg9sZS+JG4Ih/RWZOowl+rCQgmT96ftFUJJfK/VqhS3uWE1PqH3Ly7ex77ErVBV1CS9pjvDSbzH+YsNsdCMMRuWWkCUD5nfChBdcGZMwvw0+qVgiz9Cyet3c0ZOuR6q82bsFccLtK39w8YKBWgyIhYExdxI0uI6htZULGupU8HyukZeT04boklqK6fYGkyC1BiBfuE45JX193X9aImkqqAFSpLfk+RUBZ7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjgNz9QKGzgS+OxKwjQs3WbeM1PFZC4745oMxAX4VYk=;
 b=o9+yvfKjwogz8t9IER0LtDo/6gM2eISJnfuZrMY0QRbd5A6E092xSh6adCjCe5yYz6PrLHzcEo+Ha9UphkGcCc7zcUgV41oneWA8LV2qCYNefPhUuSrk/hx7Oq07p0w5ydMAIPHH15eZkEuphATS+PYhecNSqfxS3mmK/JoeOII=
Received: from OS3PR01MB5896.jpnprd01.prod.outlook.com (2603:1096:604:c6::8)
 by TY7PR01MB14910.jpnprd01.prod.outlook.com (2603:1096:405:253::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Sat, 17 May
 2025 22:31:57 +0000
Received: from OS3PR01MB5896.jpnprd01.prod.outlook.com
 ([fe80::1b62:57c6:c2cf:641b]) by OS3PR01MB5896.jpnprd01.prod.outlook.com
 ([fe80::1b62:57c6:c2cf:641b%7]) with mapi id 15.20.8722.031; Sat, 17 May 2025
 22:31:57 +0000
From: Chris Paterson <Chris.Paterson2@renesas.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [issue][meta-oe][walnascar] yocto-layer-check not passing for BSP
 layer when meta-oe is a dependency
Thread-Topic: [issue][meta-oe][walnascar] yocto-layer-check not passing for
 BSP layer when meta-oe is a dependency
Thread-Index: AdvHdSEI4cqzGwtvRK2R3/3yqcMGlQ==
Date: Sat, 17 May 2025 22:31:56 +0000
Message-ID: 
 <OS3PR01MB5896AC2C723041187F4A5BE9B792A@OS3PR01MB5896.jpnprd01.prod.outlook.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB5896:EE_|TY7PR01MB14910:EE_
x-ms-office365-filtering-correlation-id: cff6edd7-feaf-438f-2439-08dd9592a1de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?WRsQd8tAagPhS/qjrWdw809VrTHp+CLdKDLYGFokt4T7CdVzWilG1ezNeF?=
 =?iso-8859-1?Q?FTboNIKW75NNLSLVfvKWK+CpPEjnwwDJZJ2VUtrbR/2+XpmB0ZBAwAUcjg?=
 =?iso-8859-1?Q?yl09ewz2V28bnkMoQ8klKJMyPPs1FZjGyUu5bjqPiR/C8l9OFBTAIyo5rK?=
 =?iso-8859-1?Q?+p+cGUDolWar4Ep3lsoqB60oCAvhkR8tn5TGRx+E3QL6m+BQa07nRQQ4pV?=
 =?iso-8859-1?Q?bvkMcfGrAwEWVzkWim4sdzoaBy5s/tNSzQtmzlJzDvlRVhvwR6DBWICc3Y?=
 =?iso-8859-1?Q?uqhEZz302csB+pP4YpylssXNVegL5kI637t4jWF5OXcwNpM60euJcoe33A?=
 =?iso-8859-1?Q?1EwV4P0zgvkcJlXq/bMg7mcjDagxOVApKa2jYaLWk3wa4/PFkffOiB5LgQ?=
 =?iso-8859-1?Q?grQ5H40OPWgVz6TvGt41NKbB2yCM5jwPZgq4Rk2toBNt3a9DObGoFPLKku?=
 =?iso-8859-1?Q?Nxt9oZwEMm9UmtN4DKqbHGKuRBUzlA/kg3RczVudw8Hqu0E0VGW5tI6nll?=
 =?iso-8859-1?Q?+E+S0KPPEv7m5FC90ZjJXsyHs8nPNm+tvNeLj56j5llv9LB1mwsYs6w1vk?=
 =?iso-8859-1?Q?OqlC4NluqyPQ5cLcHarIcnf8x0xxqN5GA8G1xaVzCvAl6JmoIqPeHXILJt?=
 =?iso-8859-1?Q?uKykq4uCLZMZExYQ2dvwlneIG9vTwJGroqxmlJHTgPMWj0l/PpSQB6dhof?=
 =?iso-8859-1?Q?ql2yXi7aRXwu47yUmsqJgCWcsiAO5nom2pYTHvxAxay43M5gWvdrd8dYCx?=
 =?iso-8859-1?Q?NNMNQmtTOQKefaBL4tOE4V4wz1w4hK4mK3rNMDhtm/RV6jEIAdAz10vi3D?=
 =?iso-8859-1?Q?RnQh0Q7Jl21ahL+7L3vWALfn2hOlk9dzbwkcHE/AUwGf8WrmnQqjyA6Qym?=
 =?iso-8859-1?Q?LnKUACAF//UQMTsRNc3acLjHmaqLH9jtzZLz5vFe9sCACok1IUwVJ98vTD?=
 =?iso-8859-1?Q?63N/oC8+Og7bGsPHEZ4k4E58qbOxOYhxiX2ZswiNMB4uwDlAAlC5INodYX?=
 =?iso-8859-1?Q?OGsJYXi7+if6tVPwe5YF3k1a99J7vWIC0fQR8/ndjxO3kijpS9Ls2TGjqg?=
 =?iso-8859-1?Q?GDlfR8w2p2KN3ipG206W/AlqGBOAC+oxoZvD1j5U/FCxWVJbSptVW8Qh4x?=
 =?iso-8859-1?Q?z8ZpmE+qs0B5lTT/gZV6hF5X3MYYnJw64LJWWLoVJ+NT0UJ7iZ7DeI4MZE?=
 =?iso-8859-1?Q?JNNXyFkViDWVYd1DWje0M6TdLbgwu4U51L48abxumLhY6DUuFB884cCDm3?=
 =?iso-8859-1?Q?nX1Orf8Q0Qtuh0IMLsTPcP0xyU473+2sVd+Fh87/Gw3jpTx4G+eqnsKqCA?=
 =?iso-8859-1?Q?0vvA3d3+MXmcg1XrboZtGAHmAw2kiOMVUU06WWMqNCmrSyDngni5c6+SUf?=
 =?iso-8859-1?Q?UdCpu25+bYzlsYn/YwU98L6N9SiZvZstzQO0Hw8dONDxZYQva/a6g4o1nf?=
 =?iso-8859-1?Q?+Pg3xmBzyT3WP9gCeBY5EP4bVsWhOhCHc6TdrJ1G1BRKjQ3r56wQd6Dgb+?=
 =?iso-8859-1?Q?U=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB5896.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?7G+5w5nXSkiPqK2kFOsPXNJRk0pKZxEivzqg5eekCxL5YWSYUxJevZXUMr?=
 =?iso-8859-1?Q?TxTu8MHONheGAqMW5EBEYAjbJWPFnbnRkr4qkrjFIrvn2j1rPeh589q9c1?=
 =?iso-8859-1?Q?j6XrcFJMExaPGVImtmkKaIfZDrhIepY+zYoGdSjT2T2QrE7iDNEfal3aw5?=
 =?iso-8859-1?Q?AkSJklEGOq72A9+QkmvIsuVjQDXzUM7QAHQbp5lHXTppVYa1ev6N2rh2Ro?=
 =?iso-8859-1?Q?We4sb6+2+CHZVj+eW2ZBH/OfZRaefHNU5GHrMig4f11jze75bQnX7cZ0pj?=
 =?iso-8859-1?Q?fbxH+Nmpqlkan8wojSDsWQgdE3oVAOK8xihNv/RHhgMCoxJCSn4Oahzf06?=
 =?iso-8859-1?Q?/3JSRTYxONYCty/asD8gUieb0vA0rvlQTtAsxF8SWKyvZ2a1IY1wOE+Ajl?=
 =?iso-8859-1?Q?YUosV/1gjLucsBA3BT6JiG17026kkbZqmu/wTtoa4cZ+fTBGMkny248vu0?=
 =?iso-8859-1?Q?uX0VzXSm1iMTPsHqfjAooKLY3Fx/pjp+5oCDIvU2r7Kwhq8ueS6Nv+HSk/?=
 =?iso-8859-1?Q?hPOJfqAMLfK/ZCZ8p2WBVtkSd2aYHNaH6x1XmaTp6PRSSmHiFHIi5N+Tx7?=
 =?iso-8859-1?Q?dCYFiq2Zu6DTyHzTSpPNUl2Hyo94YC6Qa0Z8kaQ/2qcD9X8sQ7hPrq5HjW?=
 =?iso-8859-1?Q?CsHvFglV2laHcieoBl07BYPdalTQeBEMGJ6VTE2zGoghRFKZRcz7hpr9h7?=
 =?iso-8859-1?Q?j7pQztokL+4fOugNrS08qVT/b06HzE4x2KLFBFbq2yI0tfkcMJHLM9gDzH?=
 =?iso-8859-1?Q?/wSQl1qeo0P8lUWCjcVmvgu6Lc79f68B19APehsNDscKPwdojTpsrKWDjr?=
 =?iso-8859-1?Q?ZOYsLmcssJIihknJJbdS2zdjqNp69tDLDAcmUMDhw6r7Q4xJ8teY0TnKI2?=
 =?iso-8859-1?Q?onG1QTnEf2q0Bl6S1Gc05I3XPPgBMr3QlPdmwFlwYx7T43SC7UxsxqWx6W?=
 =?iso-8859-1?Q?Dk7Zw3h2WV+qktFf6BDTWUaZQVhXqBwc4BMbvGmtJh5mXJ9JhS2gHMVx80?=
 =?iso-8859-1?Q?AKOAC8TxGgAQ8iq9N0VJB6fTW5dYteRzhns7cXvpmhFCKJu/tbYJNAZr+o?=
 =?iso-8859-1?Q?Fiw7EFzDf1RJQHedfLJ8U4eiMn98ZR+2AkGRjqXi9To8LoFoYbvKaX9sp2?=
 =?iso-8859-1?Q?wlPKXrkJGQufibZgf034HtDL6KIVs+9YETlkFQuVoMnASGMWDjd8c1UiuQ?=
 =?iso-8859-1?Q?WwyRBkQl5ZRm/Mh54alr0qysDM0S7g5NIPv2VKFUsbtMsy8YlJ86TjrND1?=
 =?iso-8859-1?Q?kq5vGR1ub0sS5uI+sjezWh2GmBhhnuWLqKFk0rp1eoV35/nL7KVECq2yib?=
 =?iso-8859-1?Q?myfp38apuLFK5JMmcQYHTTPc/0Kxxr/s3ekD3ZAfon0WufkUkKbKVtquao?=
 =?iso-8859-1?Q?IhKGwQNpNOj/Z/KGc12KKzwWSuWhF6Km/fYONNKQnmF3uijpB/kmI+Jn7q?=
 =?iso-8859-1?Q?+eIARXlgo9V1+yB1msVQmqbSnj911lxAwsFjYzIVol1IdHshcH9aVuCxaM?=
 =?iso-8859-1?Q?K3/8hFQYWpgXH4BLAKEULnBGCFrVHu1ncbpVtuRoztUs8Ah3CH4ViF7YOA?=
 =?iso-8859-1?Q?zl8uVCH4Ul+5kohzP0ickjjlLnbbaYTQzVfaBc8ZV8/2JqFRnrQDEshUve?=
 =?iso-8859-1?Q?aqrft7NlQ3v8F1NUM/8GGh/Ka7GcmFXENa1sBBg4qY2bz9ULrkW6K1Og?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB5896.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cff6edd7-feaf-438f-2439-08dd9592a1de
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2025 22:31:56.9418
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Se36dV2uZ5S1gQ6PHuU0mMUHUey95vT4DNWTW/AHvkrYOXHUT60NU/Kv3PKH9OtWvbXao0IdZVNY/YHYrJHSYS2lRcAWlm7LW6UvoC0pAeA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14910
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 May 2025 22:32:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117447

Hello,

This is my first time submitting an issue to meta-openembedded, apologies i=
f it's not the preferred format.

# Issue summary
I'm trying to get yocto-layer-check to pass for a BSP meta-layer that depen=
ds on meta-openembedded/meta-oe.
However. it fails for the test_machine_signatures check for the Walnascar b=
ranch.

Note that the test passes with Scarthgap.

Three different packages seem to trigger the issue (worked out because if e=
ach is deleted the test passes):
* meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-checke=
r_0.6.10.bb
* meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checke=
r_0.46.bb
* meta-oe/recipes-support/smarty/smarty_5.4.3.bb


# Steps to reproduce
I've reproduced the issue using machines from the meta-layer I'm working wi=
th [0] as well as qemuarm & qemuarm64.

Check out dependency layers (poky, meta-openembedded, meta-arm)
source poky/oe-init-build-env
yocto-check-layer-wrapper ../meta-rz-bsp --dependency ../meta-openembedded/=
meta-oe ../poky/meta ../poky/meta-poky ../meta-arm/meta-arm ../meta-arm/met=
a-arm-toolchain/ --no-auto-dependency  --machines qemuarm qemuarm64

[0] https://github.com/renesas-rz/rz-community-bsp (Walnascar branch not pu=
shed yet)


# Example log
INFO: FAIL: test_machine_signatures (bsp.BSPCheckLayer.test_machine_signatu=
res)                                                                       =
                                    =20
INFO: ---------------------------------------------------------------------=
-       =20
INFO: Traceback (most recent call last):                                   =
                                                                           =
                                    =20
  File "/home/patersonc/work/rz-community-bsp/poky/scripts/lib/checklayer/c=
ases/bsp.py", line 206, in test_machine_signatures
    self.fail('\n'.join(msg))                                              =
                                                                           =
                                    =20
AssertionError: The machines have conflicting signatures for some shared ta=
sks:      =20
   allarch smarty:do_package_qa: 416787047ca76d43b094860cf617234f957d11895e=
7b7be20cbe9203289f27e1 (hihope-rzg2h) !=3D 1e482ffc1ead26bcd1f89d4dcf92e497=
dd6223933941b3ec6e483cb0072c9f5d (hihope-rzg2n)
   allarch spectre-meltdown-checker:do_package_qa: c6a667fa0b94c98ab0a22882=
ccb135063cf91e56d95200dc09d8d3e736d39478 (hihope-rzg2h) !=3D 80aac380e472e7=
17bf59392222093e33ee7dfab1683601c88a1e3e785835b8dc (hihope-rzg2n)
                                                                           =
                 =20
4 tasks where not listed because some other task of the recipe already diff=
ered.                                                                      =
                                    =20
It is likely that differences from different recipes also have the same roo=
t cause.                                                                   =
                                    =20
                                                                           =
                 =20
To investigate, run bitbake-diffsigs -t recipename taskname -s fromsig tosi=
g.                                                                         =
                                    =20
Example: (hihope-rzg2h) !=3D (hihope-rzg2n) in the last line        =20
Command: bitbake-diffsigs -t spectre-meltdown-checker do_package_qa -s c6a6=
67fa0b94c98ab0a22882ccb135063cf91e56d95200dc09d8d3e736d39478 80aac380e472e7=
17bf59392222093e33ee7dfab1683601c88a1e3e785835b8dc
   NOTE: Reconnecting to bitbake server...
   Hash for task dependency binutils:do_packagedata changed from a8e8aa500d=
5d99c24ee6889e11d2f2d86d1eb0faa42b777bfbc40c278acc14d3 to a3f446066cfca1799=
ebc96d8f9c29b9c3c574bbd8d0a864c35ab626fe9bcdf30
       Hash for task dependency binutils:do_package changed from 62a0df60c3=
16310c111ae0290df55cbd1b003f73a8e9b4bfd6b2c14fbbb0be2a to 17c92c3ab2f3a1e17=
a5393af48c24896d8c16c61f254e51e82c2a5097135d292
           Hash for task dependency binutils:do_install changed from 2c16d2=
97331a279bd665cb713c7c5267493917c19d6166e74c397b1b7502e40d to 83caf59fabb26=
c3acf6e9a1ca5fa6f487e6258765bd8886b74f9026a989a11cd
               Hash for task dependency binutils:do_compile changed from 3c=
72377ec56a75e514f6312b729f3c865f0a3751f10363edeb32a95f17a2697d to b3b6db1b7=
3f5b52a28a3ac141e6b819bd07bdc5e658b18c76276db73f911e799
                   Hash for task dependency binutils:do_configure changed f=
rom cd53c81e1d46362c59ece6e482bfa50a91215f9240dfe1bfc9fad503b5b8dece to dba=
bddb01bcc620e96365a3fe631d5adb4e10b9e47e6460d29f971559cb53b63
                       Hash for task dependency binutils:do_deploy_source_d=
ate_epoch changed from a2bd1a2043978532caf40c589a8d703fb4d69dfe4fae5251ab0c=
13ac38f3f3a6 to 21148ea2ab02788c94aa3a19f95fffb26fbd5a8d1a40f015a3111122d77=
ef3eb
                           basehash changed from 683c7492fd7b4578defacc0ecd=
06661cdf345e467c9fa1879ed78cd13ad49a3c to da67890339ef0715eeeed4ebeca2a5fd0=
c7a597b6356e9f8a0ca2532561940ee     =20
                           Variable TUNE_CCARGS value changed:       =20
                           " [--mcpu=3Dcortex-a57.cortex-a53+crc-] {+-mcpu=
=3Dcortex-a57+crc+} -mbranch-protection=3Dstandard"


# Theories
Why do I think the issue is meta-oe and not meta-rz-bsp?
* Not a lot has changed in the bsp layer for the Walnascar upgrade and it w=
as all fine for Kirkstone/Scarthgap.
* Creating a dummy bsp meta-layer (only containing a layers.conf and a mach=
ine definition) still produces the same error.

I'm guessing that the BSP test cases from yocto-check-layer are not normall=
y run over meta-oe as it's not a BSP layer. And presumably few other BSP la=
yers have tried running the tests yet?
Both kernel-hardening-checker and spectre-meltdown-checker are new to Walna=
scar so maybe that why the issue hasn't been seen before.


Kind regards, Chris


