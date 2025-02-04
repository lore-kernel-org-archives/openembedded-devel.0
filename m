Return-Path: <virendra.thakur@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE38C02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 12:12:27 +0000 (UTC)
Received: from MA0PR01CU009.outbound.protection.outlook.com (MA0PR01CU009.outbound.protection.outlook.com [52.101.227.136])
 by mx.groups.io with SMTP id smtpd.web11.114560.1738671146642299236
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Feb 2025 04:12:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=tthqXbts;
 spf=pass (domain: kpit.com, ip: 52.101.227.136, mailfrom: virendra.thakur@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e047mParm8jxyVetx8mrGmYAVurzopCZFJlyexzok41UN5fzTSiytIwbWzwFC7wHDopSHYGVphKuvshXmSFrdOniKClUhpZKeZNH3eEfwaAZvDXvN2IBncIzQ9KVk6ns2veEt9kSuUvr/vnFNNS60WdklFIn6UVjA9KLfrVw57JIeTxUDl4JDFpsJc+Auw9jwiuVVcUcH+IrLDiU+LUmuKWEZdeGZ6TeFIuEu3Ne4dfDx4N6YtKy6w8xCGC0/1lDriFIK7h62InBB/Cn+Qah+J39j6vlMlmKDYxul3cw/pKB4sboEejh558auFR+fQhWPYT60dtbP5qD3HghOIjduw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8MGwBFw9crOQVitPTEjdjUO3yeGv3UbPF/NVdGj1SrI=;
 b=sdS0UqIFJQjxpx92s5rLSul9VZuh1SsmQteOVHGW+R+ADOAVsxiBVM3kOsknuU6GB0KLCYfNmScFm4Cf6l2DFovkAqLGUHczmZjsxlFrC1P/CwucFNPvu4F+i+bE39HzxIPYfftKTl3pVdfFplCJbdCIR7MeUn23sPYa+Sm+h5tpb/xkKtiR094jYOJ8SFU7oq95zTOuR42cVlE+4FgbZzY7pjHLlyHbAGNNZYI+xzs+iUtvIPy5p65CA+8gA/zquxUksUmZHhdEoThc00Mu7PczL4fAwv3ey7IlXvrLCag042ThFDXyUFwelop6SQzEaRrj25Zz0BNtC//2AcwOJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8MGwBFw9crOQVitPTEjdjUO3yeGv3UbPF/NVdGj1SrI=;
 b=tthqXbtsUNxqCY5E/wELJQl5S/Q1SS0ZzPuT1wDnLYxq2AInnJKeE5CHWEyJnuk+F8BazWL5fiTSqGqTjCtMImNaVQv+uGRSuZ/9dmvKxkU8fxLA6Tmb752MChOj7N+cDJrCed5Km1esQV0XWKTHD99a+llgLTDM18HhRBn0Cfk=
Received: from PN3PPF8DCB5F13E.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c04:1::39)
 by MA0PR01MB6219.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:7c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Tue, 4 Feb
 2025 12:12:16 +0000
Received: from PN3PPF8DCB5F13E.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::7243:41e0:3c54:3a90]) by PN3PPF8DCB5F13E.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::7243:41e0:3c54:3a90%5]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 12:12:15 +0000
From: Virendra Kumar Thakur <Virendra.Thakur@kpit.com>
To: =?iso-8859-1?Q?J=F6rg_Sommer?= <joerg.sommer@navimatix.de>,
	"thakur.virendra1810@gmail.com" <thakur.virendra1810@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] libssh: Add ptest
Thread-Topic: [oe] [meta-oe][kirkstone][PATCH] libssh: Add ptest
Thread-Index: AQHbdhGOnU2XbDO/3UuDgItwFYDou7M1ypwAgAFEjT0=
Date: Tue, 4 Feb 2025 12:12:15 +0000
Message-ID: 
 <PN3PPF8DCB5F13E23733365B7A3217DBBC29DF42@PN3PPF8DCB5F13E.INDPRD01.PROD.OUTLOOK.COM>
References: <20250203075610.238451-1-thakur.virendra1810@gmail.com>
 <5bvglj7uv2pq7n7l642r7ddpxxodsys5rkhm4p5u7vnm65pabc@acdzrd4nliko>
In-Reply-To: <5bvglj7uv2pq7n7l642r7ddpxxodsys5rkhm4p5u7vnm65pabc@acdzrd4nliko>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: joerg.sommer@navimatix.de
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PPF8DCB5F13E:EE_|MA0PR01MB6219:EE_
x-ms-office365-filtering-correlation-id: 8fe9374a-4c0d-4fcf-b3b4-08dd451529b9
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|8096899003|7053199007|13003099007|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?BEfFGQxGWcHdzHn1yp0RdphjpWxZOEsJ9dt7dWCbcMn5T5Ki2/ii2TXCe2?=
 =?iso-8859-1?Q?gx7I9XpA1p7rNIjE2NBTGDS30QRMYiX6smiTgmjSQJjlnPeCcAwBn6+wAr?=
 =?iso-8859-1?Q?o76GFdX3jN4wwtibNmR3M7J1mZ0HJmBY2xuXs9Zvsvxk85I+1xNcsPSY5b?=
 =?iso-8859-1?Q?TVO3XIrbZIHwwJv0lqvTvf1D+/lMUscjeljlQleLDsyQ7gZi1uwVGEGQ8V?=
 =?iso-8859-1?Q?+k3ijJSuudIBUHpOxTT47MOWHgC7mTI8vWGmKhbjVNL8MidDXiz2LmGN5a?=
 =?iso-8859-1?Q?652a7ESt9vaz3jEgfD+2klGGl21zzj+mSH7olQv+wJbFIGv24/tDdrN4VV?=
 =?iso-8859-1?Q?+CjIQ2FumQbUjGzx2RjZ4zr4hEkCm1uqoP1u2f65ezF5EA5O2nxeH5bZ3y?=
 =?iso-8859-1?Q?kl22x7kAf6bz5kjBy+4hdG9sGQZvGB2D+x8LgxuMzukQKEqeh2ZcZ0NBZN?=
 =?iso-8859-1?Q?y0CsT3J4ZgssGKLmqsAUoSBqT1U+tDwD6EVTOWv+OOVoys6zS+/RU6LVSh?=
 =?iso-8859-1?Q?vpRTgyVPXWy/81zvLMQGVU0z/izdKtVOAjH6FbcyKL6uwNt+R0wanhIxxJ?=
 =?iso-8859-1?Q?S5LMt2iyxi2dyrMoRgTssLYxRyXJjFLI8L1w4KxJSABpWLGXrCoV+gP+xf?=
 =?iso-8859-1?Q?TSeVW55SAQhyYnJqhAeS8+Klfw43sdzocyThX7LHoHEBxCvnFPXQFm4GFC?=
 =?iso-8859-1?Q?nuox/a3132MUSi3OVygQhVGYkgagPcY6mUld/ctgVJgTkAGjERNG+IgwI9?=
 =?iso-8859-1?Q?laotFP0bgBtmbTGLMJqvjogUKnA/G5VsMt6rxeqdyMrHP0YRnNfObFuqks?=
 =?iso-8859-1?Q?PdcdY9/WPEcaOUfO/Ivrwox24D73IN5ROfGv8Y6R9zureR6eQx7OCgujpL?=
 =?iso-8859-1?Q?f03bM4DMyPDwBYM42LYogz02xJYPsHE24fWBATr+ZgbgnV3vwDSf4ZZGSD?=
 =?iso-8859-1?Q?y17IqDwbCTjsNNB0gbySqBrx7Fg2nsqisJyJ8ID8obmfmPFHY7FWB4Ji0F?=
 =?iso-8859-1?Q?1Qt5hZ0svWLqz49oK5ULi9Sa9aQROOn+nddXndpC40Koi3b3S/cDgk5BoJ?=
 =?iso-8859-1?Q?XAZiLqYzD/2fBXQwrvY0nL6JxcJqutOHyAbPaPfdP2KC7UGIaSl9X6qM2U?=
 =?iso-8859-1?Q?jTiyIbWIV/B9i7CrX/BCZbNUM0mZWWehI3m8EMWjv+X80BdOFdOoZ87vMZ?=
 =?iso-8859-1?Q?dF5ohVVv2BXFcLsVCIwa4pEYsQMhXNTaiWBemskrpOuX5SPh9RW9pqpR0h?=
 =?iso-8859-1?Q?bZ8RP2PPwECtD359lZ8jp0VEU7wRsXHFw/0GvM2+756B7gW9Y2uYRHv0Pb?=
 =?iso-8859-1?Q?PzvHhCqXeR81KKF+x3TZLZMYwzAEVX9Ex2WsDnR6Selk8N+izeuu3MFH73?=
 =?iso-8859-1?Q?UYhdrivH6FhR8rMzBuAiCDpXQ3BP75GGd4mTdL9dgEHxq5MZFO0QRruJJ+?=
 =?iso-8859-1?Q?Plh8vCeO+pUHFh57?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF8DCB5F13E.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(7053199007)(13003099007)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?YcLV+svMYRfrqu2IxBgp9eqRDEL139uDs+mBMbmlt4WVnZXv2F48kxsMAb?=
 =?iso-8859-1?Q?AsyWhugqAmyQKcwzsnmmAb5LOkqzqINPHWM1NoS/Y3sZpcS8wrMRKV6WN9?=
 =?iso-8859-1?Q?APaMrc1CkcWgR/qjWemQmX9giYjpIwjrf/KOBZs6tumz1tTkX1q427v2iQ?=
 =?iso-8859-1?Q?xZvj2ZH51icVJ1Bx6IHiXJ0louZeWwOAtVZfByzMB+aCWvWsfh58sZLrHo?=
 =?iso-8859-1?Q?t9TiEYJeL22VoTMdZ8eTY2Zsqm2o1JRvq2nBTcdF+lK6ZucMOGjptP0gKG?=
 =?iso-8859-1?Q?vSxttJKqdA7X63XCYrUwoLaTWR9MygMQJY9+U93YiDwS/ewOfpN71A/oW1?=
 =?iso-8859-1?Q?9ByE6gzmeDhqrVg3wbw7DAYvFA8dIIWvJCXIX1E1OqJL4Cr1785WMsQ/AA?=
 =?iso-8859-1?Q?NeUVUzQkl7amTrY4T2euyVqek5ELJZ7RR0H2C9KcG9mTEY3LYir/7RFDMe?=
 =?iso-8859-1?Q?tVUNg8LDcBWTjqX+3KmNf4Wf1PXvIQyXJklKBcazUIRMQmatRUdyU7X68b?=
 =?iso-8859-1?Q?D4FTLg/UiJb4DCDJ+/mMTWKrfhttUKQlC0f6TWB+aqB5TjjeeuNHoa8ypZ?=
 =?iso-8859-1?Q?GSSWlK2UaIi3iqlNKjP94zxf5zNj0zUXCdWL3dYkWvFxZHM88x3sCX/Oui?=
 =?iso-8859-1?Q?gGitM4jEu9cGbSCUEh/Ig+FY5W8ZMsXz5kkCc4zIxiSSwwNT4vhPC2rldo?=
 =?iso-8859-1?Q?afDqTcjwd5NA62lnZ/sK6NSvIY7B0b7AuhbMaK4+GTnB/7L5vr1a7LGrNQ?=
 =?iso-8859-1?Q?UqT+EaOGG49Jc9Ht/hdIER6IN6Uop2B7qrXNKLTOShRoNiFbTT/wYor9t8?=
 =?iso-8859-1?Q?Th+s8BDYmYeh+aSjH+jDw0q8NWjiCBu8oNHEFDn5KqZ66GcF+ThUDXuOjr?=
 =?iso-8859-1?Q?QLPXLUvRf7bmk536wMNDmJi3dkMGrmCGlG+Psqe/MC/YU2aPZucYk6I0ga?=
 =?iso-8859-1?Q?oakO1+AON67ya2a0hasHJiHIHSf3R3M5qeBwCsuPPn3c9bPLzRTIc3y4GM?=
 =?iso-8859-1?Q?wG5bUVAyjAfYXsm1GGIB5RBz9M6ZuAAqBkrBM+rVBSioLe9vB5zggZXqSH?=
 =?iso-8859-1?Q?hXVi/9H5IiG3hjQPURTi1NA+9Qi1ll1CuMu8JaH8S3KD3KaUwpCCyXahof?=
 =?iso-8859-1?Q?87WgPVd6afPk2ze6zMb2SLdfAjmPy6nBfzSV0p/nh6xS6kjWJUbbfBheqt?=
 =?iso-8859-1?Q?wiKc3AiSHI/1w9eSDrAs90gWpHX73Qd0wLyYTyx4sd4oFkY7697Lmve96o?=
 =?iso-8859-1?Q?7RosRgDaXrMMdYwqKJNUQNRUta6tmWjodaspFR55FhKR0OAQd6MQqmkG/J?=
 =?iso-8859-1?Q?RUnkFkn3wNMZWsoSoNZp3eXXQkm8M39V2TwPhtGknPG1MZjFbXsCQjsJCL?=
 =?iso-8859-1?Q?rRoMj5YSejK+yGXT5PfJ0i3mmVA/3XiVUjZgwr8xCsVhryn5rpftBExG/W?=
 =?iso-8859-1?Q?6t962XzX1AA3d9zKgrjuSzSPdTtC7wRMGYIU+g6J2qQlY0O/5pTkIT6dGR?=
 =?iso-8859-1?Q?TY7nGKosPcm38uIRH3ntckDwVj3QL+U2siqCDe/RbfoUCLcUSMXLb8b1RG?=
 =?iso-8859-1?Q?xXPEpmZAnH/KM2L6Bh0QYnQfQnu9XlAWmfwyfAe/likmHs3WxN2IrGQYfg?=
 =?iso-8859-1?Q?mx8Vd7oScEIOU=3D?=
Content-Type: multipart/related;
	boundary="_004_PN3PPF8DCB5F13E23733365B7A3217DBBC29DF42PN3PPF8DCB5F13E_";
	type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF8DCB5F13E.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fe9374a-4c0d-4fcf-b3b4-08dd451529b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 12:12:15.2824
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uEf6qmkeDB9nGQN7ZmeEtzl5eNzaOFWsb1XvoUExMI9ZtwI7CHRweBMaHCjqD8zVgE5JyHvxrmcgFM45zLC4fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB6219
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Feb 2025 12:12:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115269

--_004_PN3PPF8DCB5F13E23733365B7A3217DBBC29DF42PN3PPF8DCB5F13E_
Content-Type: multipart/alternative;
	boundary="_000_PN3PPF8DCB5F13E23733365B7A3217DBBC29DF42PN3PPF8DCB5F13E_"

--_000_PN3PPF8DCB5F13E23733365B7A3217DBBC29DF42PN3PPF8DCB5F13E_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

@J=F6rg Sommer<mailto:joerg.sommer@navimatix.de>

This change is already present in scarthgap branch, i am just backporting i=
t from the scarthgap to kirkstone.

bb.utils.contains is better option as we are expecting a return based on pr=
esence of ptest enable.

[cid:75e3c0ba-b9c0-49f2-a84c-8f7a86e2ae47]<https://outlook.office.com/bookw=
ithme/user/fcab7d9903984b91a5841c51f49bd5ec@kpit.com?anonymous&ep=3DbwmEmai=
lSignature>         Book time to meet with me<https://outlook.office.com/bo=
okwithme/user/fcab7d9903984b91a5841c51f49bd5ec@kpit.com?anonymous&ep=3DbwmE=
mailSignature>
________________________________
From: J=F6rg Sommer <joerg.sommer@navimatix.de>
Sent: Monday, February 3, 2025 10:17 PM
To: thakur.virendra1810@gmail.com <thakur.virendra1810@gmail.com>
Cc: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>; Virendra Kumar Thakur <Virendra.Thakur@kpit.com>
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] libssh: Add ptest

Caution: This email originated from outside of the KPIT. Do not click links=
 or open attachments unless you recognize the sender and know the content i=
s safe.

virendra thakur via lists.openembedded.org schrieb am Mo 03. Feb, 13:26 (+0=
530):
> diff --git a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb b/meta-oe/rec=
ipes-support/libssh/libssh_0.8.9.bb
> index 98910d3068..7d0fc2d32f 100644
> --- a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
> +++ b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
> @@ -18,17 +18,19 @@ SRC_URI =3D "git://git.libssh.org/projects/libssh.git=
;protocol=3Dhttps;branch=3Dstable
>             file://004_CVE-2023-6004.patch \
>             file://005_CVE-2023-6004.patch \
>             file://006_CVE-2023-6004.patch \
> +           file://0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-comma=
nds.patch \
> +           file://run-ptest \
>            "
>  SRCREV =3D "04685a74df9ce1db1bc116a83a0da78b4f4fa1f8"
>
>  S =3D "${WORKDIR}/git"
>
> -inherit cmake
> +inherit cmake ptest
>
> -PACKAGECONFIG ??=3D "gcrypt"
> +PACKAGECONFIG ??=3D "gcrypt ${@bb.utils.contains('PTEST_ENABLED', '1', '=
tests', '', d)}"

Would `oe.utils.vartrue()` be better?


Regards J=F6rg


--
MCSE =3D Minesweeper Consultant & Solitaire Expert

Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               https://apc01.safelinks.protection.outlook.com/?ur=
l=3Dhttp%3A%2F%2Fwww.navimatix.de%2F&data=3D05%7C02%7CVirendra.Thakur%40kpi=
t.com%7C56eadaaaddd3470f2eb908dd4472860f%7C3539451eb46e4a26a242ff61502855c7=
%7C0%7C0%7C638741980907356124%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRyd=
WUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0=
%7C%7C%7C&sdata=3D2jFgh%2BF8v67We4q4YApHdbHoydo4l2HYjy0SWcUP4ko%3D&reserved=
=3D0<http://www.navimatix.de/>

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_PN3PPF8DCB5F13E23733365B7A3217DBBC29DF42PN3PPF8DCB5F13E_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<a href=3D"mailto:joerg.sommer@navimatix.de" id=3D"OWAAM381604" class=3D"tW=
KOu mention ms-bgc-nlr ms-fcl-b">@J=F6rg Sommer</a></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
This change is already present in scarthgap branch, i am just backporting i=
t from the scarthgap to kirkstone.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
bb.utils.contains is better option as we are expecting a return based on pr=
esence of ptest enable.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<table id=3D"pbpsiglinktable">
<tbody>
<tr>
<td><a href=3D"https://outlook.office.com/bookwithme/user/fcab7d9903984b91a=
5841c51f49bd5ec@kpit.com?anonymous&amp;ep=3DbwmEmailSignature" id=3D"OWA64d=
2b984-4f73-79d8-67d8-25fd9f6a89a9" class=3D"OWAAutoLink"><img data-outlook-=
trace=3D"F:1|T:1" src=3D"cid:75e3c0ba-b9c0-49f2-a84c-8f7a86e2ae47"></a></td=
>
<td></td>
<td><span style=3D"color: rgb(0, 120, 212);"><a href=3D"https://outlook.off=
ice.com/bookwithme/user/fcab7d9903984b91a5841c51f49bd5ec@kpit.com?anonymous=
&amp;ep=3DbwmEmailSignature" id=3D"OWA847cff6b-bde3-ad4d-67ec-9d2487509484"=
 class=3D"OWAAutoLink" style=3D"color: rgb(0, 120, 212); text-decoration: n=
one;">Book
 time to meet with me</a></span></td>
<td></td>
</tr>
</tbody>
</table>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> J=F6rg Sommer &lt;joe=
rg.sommer@navimatix.de&gt;<br>
<b>Sent:</b> Monday, February 3, 2025 10:17 PM<br>
<b>To:</b> thakur.virendra1810@gmail.com &lt;thakur.virendra1810@gmail.com&=
gt;<br>
<b>Cc:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;; Virendra Kumar Thakur &lt;Virendra.Thakur@kpit=
.com&gt;<br>
<b>Subject:</b> Re: [oe] [meta-oe][kirkstone][PATCH] libssh: Add ptest</fon=
t>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Caution: This email originated from outside of the=
 KPIT. Do not click links or open attachments unless you recognize the send=
er and know the content is safe.<br>
<br>
virendra thakur via lists.openembedded.org schrieb am Mo 03. Feb, 13:26 (+0=
530):<br>
&gt; diff --git a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb b/meta-oe/=
recipes-support/libssh/libssh_0.8.9.bb<br>
&gt; index 98910d3068..7d0fc2d32f 100644<br>
&gt; --- a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb<br>
&gt; +++ b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb<br>
&gt; @@ -18,17 +18,19 @@ SRC_URI =3D &quot;git://git.libssh.org/projects/li=
bssh.git;protocol=3Dhttps;branch=3Dstable<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://004_CVE-2023-6004.patch">file://004_CVE-2023-6004.patch=
</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://005_CVE-2023-6004.patch">file://005_CVE-2023-6004.patch=
</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://006_CVE-2023-6004.patch">file://006_CVE-2023-6004.patch=
</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch"=
>
file://0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch</a> =
\<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://run-ptest">file://run-ptest</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quo=
t;<br>
&gt;&nbsp; SRCREV =3D &quot;04685a74df9ce1db1bc116a83a0da78b4f4fa1f8&quot;<=
br>
&gt;<br>
&gt;&nbsp; S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; -inherit cmake<br>
&gt; +inherit cmake ptest<br>
&gt;<br>
&gt; -PACKAGECONFIG ??=3D &quot;gcrypt&quot;<br>
&gt; +PACKAGECONFIG ??=3D &quot;gcrypt ${@bb.utils.contains('PTEST_ENABLED'=
, '1', 'tests', '', d)}&quot;<br>
<br>
Would `oe.utils.vartrue()` be better?<br>
<br>
<br>
Regards J=F6rg<br>
<br>
<br>
--<br>
MCSE =3D Minesweeper Consultant &amp; Solitaire Expert<br>
<br>
Navimatix GmbH&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
T: 03641 - 327 99 0<br>
Tatzendpromenade 2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; F: 03641 - 526 306<b=
r>
07745 Jena&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; <a href=3D"http://www.navimatix.de/">https://apc01.safe=
links.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.navimatix.de%2F&amp;da=
ta=3D05%7C02%7CVirendra.Thakur%40kpit.com%7C56eadaaaddd3470f2eb908dd4472860=
f%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638741980907356124%7CUnknown=
%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIs=
IkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3D2jFgh%2BF8v67We4q=
4YApHdbHoydo4l2HYjy0SWcUP4ko%3D&amp;reserved=3D0</a><br>
<br>
Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley<br>
Registergericht: Amtsgericht Jena, HRB 501480<br>
</div>
</span></font></div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_PN3PPF8DCB5F13E23733365B7A3217DBBC29DF42PN3PPF8DCB5F13E_--

--_004_PN3PPF8DCB5F13E23733365B7A3217DBBC29DF42PN3PPF8DCB5F13E_
Content-Type: image/png; name="Outlook-l3shgpcu.png"
Content-Description: Outlook-l3shgpcu.png
Content-Disposition: inline; filename="Outlook-l3shgpcu.png"; size=528;
	creation-date="Tue, 04 Feb 2025 12:12:14 GMT";
	modification-date="Tue, 04 Feb 2025 12:12:14 GMT"
Content-ID: <75e3c0ba-b9c0-49f2-a84c-8f7a86e2ae47>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAcpJREFUOE9j
ZAABr6aJDHqhuQwMDIxgPrHg19d3DLP91Bk+P3sD08IIN2x1hjPDy7NXiDWL4T8nM0NA33wGWRMP
hg5NJgYGhv8gvYwMFdf/MYAMu3twP9GGISssv/qLYVdzMsP5FYthBv5nmO2pyfDzzVuyDEw/eJ3h
xNyJDEenNSMMJMskJE2Hp9YxHJ2CZOBUM1GGz5/hAUuS+UVnXjOcXDCJygbOm4TqZUpcGDJjJcPz
S1eoYyAvrzDD58/vGRgY/iHSYcX1/wykupBXWpghe89reEbY0RjNcGHFMkQsk2pgwYkXDBz84iiR
16EJzmWghE26C8uv/mZgZGJBM5AZ5HXyDPRo7GMwCCuEG/jj40uGCRYS5LsQpNM6q4TBOLqE4emF
gwxrs8NRI2WynSTD19cvSErQOBQzMhSdecvw8vophqWxngQNBCWTrBMvMMIPpnF7dQQjA6+UCEP2
3tcM//7+Zvjx8QNOQydZizFk7bvNwCepgs9iWIHKyGAYEcPALaQEUQwq3mBplQmi5siUBoa0bRcZ
hBT18Bj4n7QSWlhGmiF19xOcBh6aVEyagSCTQEEUNf8Ag6CcFjyn/Pz8hmF9cQjDg8MHAaiKxp0e
iZJ4AAAAAElFTkSuQmCC

--_004_PN3PPF8DCB5F13E23733365B7A3217DBBC29DF42PN3PPF8DCB5F13E_--

