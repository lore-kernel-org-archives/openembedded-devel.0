Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFEC4C27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 17:22:52 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.94])
 by mx.groups.io with SMTP id smtpd.web10.33253.1719422565430604582
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jun 2024 10:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=zsjXjY26;
 spf=pass (domain: navimatix.de, ip: 40.107.247.94, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bH+C7v1BNVHgUbvhFOewzSp/jMprcMcLDHQcN04vo6thR02gNy1KQR4dG+n7KStwj74EMy7GXimxivmrtccL+4pmvqGdyLE/KIz68UTXqOBP5oGDrhAsRZ8X6tM6RGMeHLgpLVKW4QCUaLUXU++31dLtcH1EJD1UJbSQeK+vH9IzgDx9GyqSzdLFljOOkO8alwiui0LjZLzYLrOnz1MkBSge8KrTridVeJaS9CV9IPuoF1dRtaer1j2bvOJPYrdeZYIt0pmpdUTLnVL2XsFGyibzBJ08HHGYK3XUIikjeih9Xg1fcRq84VZpRUQ6StPrJzLJBjwfsb5TbXfSnKll4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QV2WtdVspVVosBGQWzXE8aQfILdzvbvSBW4CqwGYdD4=;
 b=HPASQbNjm5FHG7POclmJtzCwdZtitPZ5b6IJKbBhcY9AlQSyQwi6AYspaG8ol3JJDzovU/or1GeispvpVmZDbWgoS/v9ocCFu9GMhqC1pS1LigQZluomDlI18k6bw/w7OeJ3msLkK6lbK16A/8ZXHNGwDVnFepCFnxtq6WwCMs93DO5E8LZvayceTSgxAEoC2UZb1JUcLGHByt5YycGsu23q8UOzYd2grF73/ml+2YzU1CwP2cC25kl8uWREeeHT2XCXLiYsd8ZCqh0sHd3UuVC6YBEFMrPf8+xP+5J6eM2xI28SOunDuowyMNLXk1nDQCbgz1mfm5ja1wORuILtjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QV2WtdVspVVosBGQWzXE8aQfILdzvbvSBW4CqwGYdD4=;
 b=zsjXjY26L7HQeDQ1P9EaF6v0aBPMr/Ot56/rOmCbqPSSWBCgz5pfeeljeE42+aS9+0TCeqjGADQzC/1Eqm840YrD8Oi8L4k9Dm9AYG89A++UzBQdbyguCbG49x4CHgEOaD49Udof+JRlg/dfnNeb0RynGqEXXvhbuxaDOe0TjWA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by DU0PR01MB9358.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:35e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 17:22:41 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 17:22:41 +0000
Date: Wed, 26 Jun 2024 19:22:38 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org
Subject: Should DISTRO_FEATURE ptest include ptest-runner
Message-ID: <x6gyiofwakvibrczp5awde7lihbxomhqslfn2izreb5wyxvbqi@hy5fd7bywmm5>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="qg2eyh33ruahp2tt"
Content-Disposition: inline
X-ClientProxiedBy: BE1P281CA0441.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:81::8) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|DU0PR01MB9358:EE_
X-MS-Office365-Filtering-Correlation-Id: 41142eb3-d263-48ef-e4df-08dc9604959f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|376012|366014|1800799022;
X-Microsoft-Antispam-Message-Info: 
	=?iso-8859-1?Q?zQqRlKUq7HR5/IR+h0xttf2JjKtAGrWkvX/5KwbIv24+UP3pKMM28YaP+k?=
 =?iso-8859-1?Q?gliU6+7eabbSMLBXotRS4JDigw/0znP7tx3bZrD1l7Xa1g8XN7rjQBnoq/?=
 =?iso-8859-1?Q?kJLyGyGo3mDPlPrNIVUpfZLGsJfQkqJywLOFfb1OJFGatukyvT5b4qcyow?=
 =?iso-8859-1?Q?o0KFgoNl03siadF1f2j+SsZ7IC0sr1YJbbnc1sEQXGeqWQZ2rhN0wmFzO4?=
 =?iso-8859-1?Q?lSZyRtJzUiru6ZfRBIfP42OamuXczDFzEfw4Dzibif/Jymq7hKYMfpszaN?=
 =?iso-8859-1?Q?z5Idnd+ghihaNh7c8e8DihUeHx0hE4b6f42OjRTax5vJqBiK0P/pw8ngJx?=
 =?iso-8859-1?Q?48dzZya7ebUvcOS9rBTmfKXlZ3feUW4A19rShIjKeySxK1WlRI32IB+9tl?=
 =?iso-8859-1?Q?W6HnwjQwmI2EZ95v/JmHnJNusbOFINdGxflcoaoU/Ctags9+9H2t4S1VHl?=
 =?iso-8859-1?Q?af0Az+FSrE2n5ai5Wak5KsyXXVnOdGR6CKtelk8jrCQMg+oFIyQViOaXAt?=
 =?iso-8859-1?Q?hTvcwmsMl7BgLeormOp0Ts0nAWpU9n3lj99VqAr/E9oir24pmf8BZT9SG6?=
 =?iso-8859-1?Q?IzlVRAwW4EGAH6xTBsMsre2L9M9q/RiEcFplFW8KpenzjRMXg102iT5Ow5?=
 =?iso-8859-1?Q?/6b1KgcHwcv5qW8pZdRMdZYGwLL5WeNvyPan8Kt0bqOOaace094nse6ImZ?=
 =?iso-8859-1?Q?hLMqE8uTe3IE3/gduR97jodSsvligQemYiY11z8mGuHBx7vfNt9kjZ13sK?=
 =?iso-8859-1?Q?GLVjIyGlCWoyPIQL2JRdbf+XNf5X9ghUiNX6FibbqWfTG6OHP2+VPiS6yt?=
 =?iso-8859-1?Q?FNPxrp4pY82nw4+BdORygL06Zhg3KifoFtkylh0T2BfvNVrQ7IrJoVQgbn?=
 =?iso-8859-1?Q?bBfpJJ6pN7cflHED+l4bsDmTAHowouPTEwUxIoBS4o46roUUAQr8Jk7k5F?=
 =?iso-8859-1?Q?y6Ql0MIPWS+gavP9C9Zlp4noQMPKqoWhX4HG4WIAFbdbS0xv3EPe23R7kT?=
 =?iso-8859-1?Q?8iEk3pp+cLJiEgv2yi+PbW5vG1CZLSpFoTlsdJd/6B1ucbGyYtiOdMo/l2?=
 =?iso-8859-1?Q?px8zQnjuS2jUZ5JO2LaBb8nIYbzwTzIi3YvTkpeCOoYP0FxB0VK7Z3DetI?=
 =?iso-8859-1?Q?j62PXe7MxTCrG1S6TWIjAA4B+vhwHZ/4Qz2dgjnLwHDMrgOD+3SymqeiyK?=
 =?iso-8859-1?Q?KVFDyx0l16Ovnd43X1aqeGdy36corocDyb3jWa4rpX8A4I0XrPLepLr38l?=
 =?iso-8859-1?Q?ewW246FGcxLsZl4lMwpjpqFY6xsgiuF5KN9757TrdebrJOg5aF5tVvIfbz?=
 =?iso-8859-1?Q?D6sRqFgVd843OQqZMkZvYv2Wsw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230038)(376012)(366014)(1800799022);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?Y3a+MqAyCjHpW9HjBBpxAaBSW+4i6w2vtWmqHeG28QE0eAGbhBKdI4F5lB?=
 =?iso-8859-1?Q?UZg4WS6rYoztk8yL/jq4tNN9E6q18GIChYKluipQY/dGyE6/eN2BVTc92m?=
 =?iso-8859-1?Q?mKeVP921cx6Vn4N/CCh/m5pfQr+ANUxfKRpYp2sm3Wzc5jsquHT4+Ho8Hx?=
 =?iso-8859-1?Q?Vi/Jqb5MxgjYKNL7bORPDXTnP4wco64fEExUUusfTB6nhoDDIyLG2sSOY6?=
 =?iso-8859-1?Q?JA5RfbstRNklAK+fSc43qmhJJHhKXv2Ur0uQB8dtqti5Qoz2GvrnE3bnV6?=
 =?iso-8859-1?Q?HknXXjvV49h1vn+ofH0iucCIeCQI25Cfdt5k60aDJH3MRqMkxP0tfuK+Ze?=
 =?iso-8859-1?Q?O8fuAFnhH2nOhMUEEe+MWrGlx62r6QM1IpoWrf4HVPdcQJAT6kl5b7sdUY?=
 =?iso-8859-1?Q?vAwK++518Mdem+EYyzODfAvrNqr8nvzGU/19vJOfPRcPnX09HrxIROexRH?=
 =?iso-8859-1?Q?2vHSVJl2T/u/nDfyZr4+yRw3odSwHQSGHuVAaIN4gkr1quf/scQ5Xtwb3J?=
 =?iso-8859-1?Q?L0mu4A8mWxDPuUZTUX4XOue9pu11WLJPpVECezBE1DXMTKIdNr3uzQEWTs?=
 =?iso-8859-1?Q?j64v6Bux1uUMz+NuiOenv/7jDFC9g2+rnZ06QazJnuhzZBfhgmSJcwR9Ee?=
 =?iso-8859-1?Q?fvzBs2qI6KM7Q6wpkSaQBEQGPl5dEAdU8w6pdYdHBhp/2cCPJ9T1+9JI3G?=
 =?iso-8859-1?Q?FysYBoh9zVCgw7MyfggxVNQN3JDzP2aYmY8t4Iat00CkmtLJ+bW/CRNl1T?=
 =?iso-8859-1?Q?3TqkPUgIoaZIu6UWRbDrpec5e8lVv6fjVlEDaDtfWL0naoSuhsZd+sPGKA?=
 =?iso-8859-1?Q?KO6ipvJ2D0IZDiJg8DZRg0KrrMv48C0N3NrHq4jD+5bTlNEcqiBNcwgMCo?=
 =?iso-8859-1?Q?GJno7LrUYBCTgTq8p24zf/Nx1oE2rh541ho1KJpF3EMeA3xXPns8GuWaat?=
 =?iso-8859-1?Q?WajTIEI5/f/Se+AVzEmyleRyhyJTQFNJE6vsaHcd8H18wDQtMMRRyBSya/?=
 =?iso-8859-1?Q?FQO0rBj0hOx4G7O+/KNfZzkbaFHGVtppStIWYt0h5DInugUEl1iJLJwpAZ?=
 =?iso-8859-1?Q?KDqbx33umovRDUFQLnZaVWItqBppcAJVLmXLFoY28fRmHmZtUmfC9ysQde?=
 =?iso-8859-1?Q?SZdnDRNVf0ygc93vyYdSQB4f3rJiWuceol2UVuuEfXjeLYcBqd/RmNZiXF?=
 =?iso-8859-1?Q?geezq85WvWX0e5vUq0q8kk0XRp5+p3kMjRy+a+1Mm2A4tDhjpz05NhnBet?=
 =?iso-8859-1?Q?CK40jO8igqYUSlkmCnA+vNxgN4y2yvWQx9U+XHYqw77lEzE83ugMjsVGZm?=
 =?iso-8859-1?Q?coYsrqssWJDE9v5ROJo9ukoyLH2VM+EuuayOatbjaiz3Ywuuel5Ot1ptRn?=
 =?iso-8859-1?Q?/giCtJccwSJBBkvoPf8kuodRG5TaoDswFeHXHWqCAQYU7WSwmSyo5N9t35?=
 =?iso-8859-1?Q?AO7ttkmh9OplCGkpmKkx0Fk9uSR9zRmx3cgdXnAjpSml+Qb8WKMKOfotfI?=
 =?iso-8859-1?Q?c3vCFJgDODQiJgUCLMtAgLCkme8c+ANnVIKrKN+L8UrsY8KiwLHZ4GVJ8Y?=
 =?iso-8859-1?Q?IBd1ojtSo7pZf+xWFjyWsVHfvRdZxbE+twoeiYcSR+MFyJxvVRNhdLSxzk?=
 =?iso-8859-1?Q?UcNw9vGhNea0w97NvNu6WquCj+uXLACwIWw3iyes/xmXD3Qyb7rvVobA?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 41142eb3-d263-48ef-e4df-08dc9604959f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 17:22:41.5040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fDVcD748xOsicGO8KguY5r7q3qzkMyjokm4zodED3RTqNRUmJHqAHUj9yRlb2ojL+qB3s6gE33sl88WMHW2jA8N+0rqxLdlleOsEpSPfbJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR01MB9358
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 17:22:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111112

--qg2eyh33ruahp2tt
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Should DISTRO_FEATURE ptest include ptest-runner
MIME-Version: 1.0

Hello,

I've asked myself, if it wouldn't be helpful and convenient, if the ptest
DISTRO_FEATURE would lead to the inclusion of the ptest-runner and ptest
packages in the image?

Should poky.conf include something like:

EXTRA_IMAGE_FEATURES +=3D "${@bb.utils.contains("DISTRO_FEATURES", "ptest",=
 " ptest-pkgs", "", d)}"
IMAGE_INSTALL +=3D "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " ptes=
t-runner", "", d)}


Regards, J=F6rg


--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--qg2eyh33ruahp2tt
Content-Type: application/pkcs7-signature
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIITyAYJKoZIhvcNAQcCoIITuTCCE7UCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgghDNMIIGEDCCA/igAwIBAgIQTZQsENQ74JQJxYEtOisGTzANBgkqhkiG9w0BAQwFADCB
iDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkxFDASBgNVBAcTC0plcnNleSBD
aXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsxLjAsBgNVBAMTJVVTRVJUcnVz
dCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwHhcNMTgxMTAyMDAwMDAwWhcNMzAxMjMx
MjM1OTU5WjCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQ
MA4GA1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVT
ZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTCC
ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMo87ZQKQf/e+Ua56NY75tqSvysQTqoa
vIK9viYcKSoq0s2cUIE/bZQu85eoZ9X140qOTKl1HyLTJbazGl6nBEibivHbSuejQkq6uIgy
miqvTcTlxZql19szfBxxo0Nm9l79L9S+TZNTEDygNfcXlkHKRhBhVFHdJDfqB6Mfi/Wlda43
zYgo92yZOpCWjj2mz4tudN55/yE1+XvFnz5xsOFbme/SoY9WAa39uJORHtbC0x7C7aYivTox
uIkEQXaumf05Vcf4RgHs+Yd+mwSTManRy6XcCFJE6k/LHt3ndD3sA3If/JBz6OX2ZebtQdHn
Kav7Azf+bAhudg7PkFOTuRMCAwEAAaOCAWQwggFgMB8GA1UdIwQYMBaAFFN5v1qqK0rPVIDh
2JvAnfKyA2bLMB0GA1UdDgQWBBQJwPL8C9qU21/+K9+omULPyeCtADAOBgNVHQ8BAf8EBAMC
AYYwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQw
EQYDVR0gBAowCDAGBgRVHSAAMFAGA1UdHwRJMEcwRaBDoEGGP2h0dHA6Ly9jcmwudXNlcnRy
dXN0LmNvbS9VU0VSVHJ1c3RSU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5LmNybDB2BggrBgEF
BQcBAQRqMGgwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jcnQudXNlcnRydXN0LmNvbS9VU0VSVHJ1
c3RSU0FBZGRUcnVzdENBLmNydDAlBggrBgEFBQcwAYYZaHR0cDovL29jc3AudXNlcnRydXN0
LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEAQUR1AKs5whX13o6VbTJxaIwA3RfXehwQOJDI47G9
FzGR87bjgrShfsbMIYdhqpFuSUKzPM1ZVPgNlT+9istp5UQNRsJiD4KLu+E2f102qxxvM3TE
oGg65FWM89YN5yFTvSB5PelcLGnCLwRfCX6iLPvGlh9j30lKzcT+mLO1NLGWMeK1w+vnKhav
2VuQVHwpTf64ZNnXUF8p+5JJpGtkUG/XfdJ5jR3YCq8H0OPZkNoVkDQ5CSSF8Co2AOlVEf32
VBXglIrHQ3v9AAS0yPo4Xl1FdXqGFe5TcDQSqXh3TbjugGnG+d9yZX3lB8bwc/Tn2FlIl7tP
bDAL4jNdUNA7jGee+tAnTtlZ6bFz+CsWmCIb6j6lDFqkXVsp+3KyLTZGXq6F2nnBtN4t5jO3
ZIj2gpIKHAYNBAWLG2Q2fG7Bt2tPC8BLC9WIM90gbMhAmtMGquITn/2fORdsNmaV3z/sPKuI
n8DvdEhmWVfh0fyYeqxGlTw0RfwhBlakdYYrkDmdWC+XszE19GUi8K8plBNKcIvyg2omAdeb
rMIHiAHAOiczxX/aS5ABRVrNUDcjfvp4hYbDOO6qHcfzy/uY0fO5ssebmHQREJJA3PpSgdVn
LernF6pthJrGkNDPeUI05svqw1o5A2HcNzLOpklhNwZ+4uWYLcAi14ACHuVvJsmzNicwggWB
MIIEaaADAgECAhA5ckQ6+SK3UdfTbBDdMTWVMA0GCSqGSIb3DQEBDAUAMHsxCzAJBgNVBAYT
AkdCMRswGQYDVQQIDBJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcMB1NhbGZvcmQxGjAY
BgNVBAoMEUNvbW9kbyBDQSBMaW1pdGVkMSEwHwYDVQQDDBhBQUEgQ2VydGlmaWNhdGUgU2Vy
dmljZXMwHhcNMTkwMzEyMDAwMDAwWhcNMjgxMjMxMjM1OTU5WjCBiDELMAkGA1UEBhMCVVMx
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
DgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsG
AQUFBwMCMFAGA1UdIARJMEcwOgYMKwYBBAGyMQECAQoBMCowKAYIKwYBBQUHAgEWHGh0dHBz
Oi8vc2VjdGlnby5jb20vU01JTUVDUFMwCQYHZ4EMAQUBAjBaBgNVHR8EUzBRME+gTaBLhklo
dHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3RpZ29SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFu
ZFNlY3VyZUVtYWlsQ0EuY3JsMIGKBggrBgEFBQcBAQR+MHwwVQYIKwYBBQUHMAKGSWh0dHA6
Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2Vj
dXJlRW1haWxDQS5jcnQwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLnNlY3RpZ28uY29tMCQG
A1UdEQQdMBuBGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwDQYJKoZIhvcNAQELBQADggEB
AANadCCx1OE0/PYv8CMHn1qrbn3u9yIQuut1yAVv1daof2ULxyGOm/M+XnSW1h+xcUukaNTB
qwJx6KTauuWjVL1LRXz9+sNvQfS1KdJF9yfgcCTiIMNjfKap+t/dD275tpVeLbRSWyJaQRhb
GVjarr8yry1mnaaiJqv1TERaHqjDNpEwU/Ex8XetmkdJK01qCP+ZOEHwRr/pEB/oEKYB08+P
CfWWWT0YVlwW3FdYpMi70zyynhyE0ZkxBuwh20CulXlafk9nzu1ly9HDU2MG6fnKLirJLOj1
+9s6RvytgsBtk1dB4lJEMe32RnTa4ABWg2VpdqmG7wjr2BlUCzLzuxUxggK/MIICuwIBATCB
rDCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UE
BxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdv
IFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAPzh908c
7MYmJwWouN4Q9n4wDQYJYIZIAWUDBAIBBQCggeQwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjQwNjI2MTcyMjM4WjAvBgkqhkiG9w0BCQQxIgQgsbhMofpF
hR4F9pAfmz7QGUnSBT/Cy4e+Zu5hlRMYlygweQYJKoZIhvcNAQkPMWwwajALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgIC
AIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwDQYJKoZIhvcNAQEB
BQAEggEAeaMXRs//0faCoCgSdIwfVd0eubqZCbMFzMjhaKoq6WSWYvAFkAptYNjZkpxFy7Hs
VFmHPf97v/NZwCcXvDHRMwb0V6yXJW8SO8YyeFdfSC79j93gb93i8afzYAqD/RWTWX8lz/kJ
k3XPD+B7a+INLWBDMSA0wUrzEp9Rs7l5QFz3KUGqDZNDW6GeJ/X6tESIeK0iFWT4r8QVYYCf
sSxqa0R7dmcDxHt7G7ZleQxCBySFHZMW6ZuT1KM40lA8CU97M43L0hcQHv8TxVs0/W1NwUbn
VtEf58NRnDfadeieiQn92H0Z9RS/cVcdxTCYmXsy4QwV0z7xmAu6WKGHVRftZA==

--qg2eyh33ruahp2tt--

