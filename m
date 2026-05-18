Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 039CCCD4F3C
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 17:40:59 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.106])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2979.1779126051272814039
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2026 10:40:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=KbdAeKIu;
 spf=pass (domain: navimatix.de, ip: 40.107.162.106, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X6BgMhAPSz0ZTw1gsoiCxIc9KdUf2W7GkoesOLpXbmnueXoAGpmqsGtAceUNktW/a5YkS2tr9Zor4oFdG9yYGqtsMBidEw8H9KmsCr3oks0ETjz0QKhXnyWrX/VyGRQwFI17YbgQ6F7xA28WWlchEFbTzTOTs8n/P90cyCFQm8KtMRadiFlAdqZh4hngTBLl/iwBux4rCWL8FUFzxPU85nP2Ks6vJTWump7jt4rctmQEyupxnmzDxAKouCy/U8iuXMgZp0ISnfuCA3CdIOISlX5UWOlJB7u2QO6CNWgU2U9CIHpC6gBwNSsNldlm75lL6mrfvs1PY0XvIwlyS4MPBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKDcg90r2U4dl5M8H+fd4wFA/k7seJfOHr5naEDIxj0=;
 b=BtZww0A4amIbXHa8aAAPLMv2byUIt5HbVkh1J1EYeFnApZW+sIwIdoR5+pBvjD9OeG+h+3lAvdaEfJVlErzOgav+aZrfktzFE2zNQs3YlqYmu7D2x1n/qcyOvBBJHH4w1MQNEaqiiIX0jCrBPmNFw2P2+Z0D22Xur1S56wv5vlPjjEYRhydd1lrAeKZ/nZa4HO+3jcMYKM/R6iXbdI+V00DmnZuojLgZY2newEewH5pF/i/82EsVwoIFqU5n+zosfQZK8UY1P/ojU7b0E/ObfLy6tB4agetpNc4RkcP9AErlEVLosFnAFp+ezl0vre250TfAG8LySdQ1rPWMzqwY5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKDcg90r2U4dl5M8H+fd4wFA/k7seJfOHr5naEDIxj0=;
 b=KbdAeKIusi14RqRwNH2QV993BLElVOHjnIPskTLaB6O8XUJSjTcmueAxp1qYKBY43uhQhMQOvujMYN4vxXcFmqRL75FJBHeZNP8ulPMlf7D4VsiuA8iZ1NBuISMszmfa8lMDMz5MgdjrHBWl1mffJOY2vPLOqOtJeSi8ofLtF/I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AS8PR01MB7623.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:2a8::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 17:40:45 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0025.016; Mon, 18 May 2026 17:40:45 +0000
Date: Mon, 18 May 2026 19:40:43 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: adam.duskett@amarulasolutions.com
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH 1/1] chrony: add group argument to useradd command
Message-ID: <agtOrklE5nDU15te@navimatix.de>
References: <20260518101712.2714997-1-adam.duskett@amarulasolutions.com>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="wxb55cvcxkvqz25c"
Content-Disposition: inline
In-Reply-To: <20260518101712.2714997-1-adam.duskett@amarulasolutions.com>
X-ClientProxiedBy: BE1P281CA0227.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8c::16) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AS8PR01MB7623:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ca75ac9-ad91-4247-8ea5-08deb5049700
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	YWTM4pxQ/cQt6bEnaAah7SDb2SMP+fubICBS495Oc+pLyooDk8/WI/Yj7I26OHhovRA0uc0rSg00oGmF40z/zajEPHUkqxNwsgX2ySgOT93mRZcwND1SYNRTLhcjw4bbv747FUgIMS9NpSOvypcxWX3uPyS1zXoNJqCjDrIRqmFvBqyGlSETXo4GtP6DaWFmPzn/NVLE5kDtxW6vSfJbHnRi8FHBO/V7Z8mCZfyk1C2gwAaccjpsxH2IF7kDvVyn877jIcJFmOIk8dHWtF85G9pSzoIhI19OFkVV4AyKS39DwOm7toAf1YNGEToh2Wf8IT5f4ox18UlDhUMUVT45bRanLFndHgAKDxfkif9a//ASIwVGmu76c4fi0iNHTTA1Apa3fBxAVO1RQrdB4lYyEY0Q25ZZTc2Ly7wNW7lTOtniW139136duLiyl2TpXyGNATi1OjOhJi4Nbqg6/OY3TeD+LIP11MRFeOdNoedfmJutiMrhCAc+GMU93xx63hXPjmsYVXTn+y1H5Bb4Nf554tzb8bCDJ/mTKizQTkL2aMdynn/ITXyc8a1dwaDPfltcjUAkLXogDmfxI9Pznqj2SZx/nFVRBmW4BkVAcBIIFH1qpdK9zA/uI3A4X1BmICae6dSp9d3BvaHd2FftnOPY9w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?1qaVjnW5LQFAUA9G2npn4JoJ/3b3KWD0oUd+QFcvLDKbFTQY88IH0D0omS?=
 =?iso-8859-1?Q?w/AT9GbSn3lGnMQr525JLSj6494hZ6Y3G1fQZ7zQLVwcpHwQMK+5QNHWet?=
 =?iso-8859-1?Q?jhmgld089D+bhgIgtjXnIOAi1Vbh1yDKE5y/owYLxr56qXHhlfVIaC4DCJ?=
 =?iso-8859-1?Q?VcDKbxmsWLJ4awSQH5ULtOZ1JNWhp6Om6Xpr/42f5d5pRXGdoAiIp034bS?=
 =?iso-8859-1?Q?H2m+hcq0d/KFC9f8wLhtEc/sGXlgLpF+XbJFXljCm0pW0VXnMQ4vLNbR/6?=
 =?iso-8859-1?Q?+ZFSgxNnF4BxR0X3NE72NCO5lomZX4LJS0Wwqit0hOLYpo1Sw38PnT14HT?=
 =?iso-8859-1?Q?Uj3WHg2mPz7dTI4G+GoSFzY335u43Ci/3TWlpocxsIh2uPO/7nfvkz3NAD?=
 =?iso-8859-1?Q?M89BCOnL6ru62bJt8NKtyl1OD6BEoOxfBc0vMC1jEqqbZFh9CHYoh8RBKL?=
 =?iso-8859-1?Q?36Q9wff97eJ27x8Hl3/xQRD9RiPq/9GyIh8MLHgQxlexzqQr4jCgwFXMJw?=
 =?iso-8859-1?Q?//A80g84lgajcH3lV5mKYlhr7Cs8IMaehqtFIwPNqRkppX5M/jam6M0rI2?=
 =?iso-8859-1?Q?MVHFIPQmY92f7um8RRbW7mOaX8U8pDmIIochtw1BR4dLnLXGXtABI2Xh6w?=
 =?iso-8859-1?Q?YLBMn3eSup2XBAHOUGPyXpubfPmNu9/OfoEbEv7QzHhx4vvA/lEI9bHmyi?=
 =?iso-8859-1?Q?0375IjRN+x2JYiDBIp8rqwb1GksRMK/HS8z7WFkToIg8lTc9iZJu9vMKUa?=
 =?iso-8859-1?Q?/GtoRek4fXl2SGI4hKVzn7D1gQGqh2uzMsCrchqS8Mn5Sx7v6Pu1zP2BOP?=
 =?iso-8859-1?Q?VCSsK/eRpLdbBZi7NmVhS5ICGdcoXQK8CzRTLGSsOMs7kQHB/SEXV37+sw?=
 =?iso-8859-1?Q?msatpwRZ4SSTZwy2c6Yrn0VixpQQOLDiJls98jy+62g2PwDxBRnTtP/jp0?=
 =?iso-8859-1?Q?XmQ6olAJzilGWjBzMKQUPL9Zn/W2mVQwDa3sTzDaauTldBuBzCUGPiyZig?=
 =?iso-8859-1?Q?TFsKMcqAygR94Hu2YhInG9mXUlLhm+qG9xj3DZ6aypf4UPtHXcAckD2bGx?=
 =?iso-8859-1?Q?wisO/8ZX2KzsR2TxgAdMnlLmiabBX7h+2w7rItIwrq8FQwhqqdywQHs1PI?=
 =?iso-8859-1?Q?hDIJZXayFxWHQJfci6sk5MHLQasaTPIxPXuM9fpYsDFXJB8r2Ex0dQSYRm?=
 =?iso-8859-1?Q?SDTzY8yvt9i/XLtojfxOXkksOImq93FzV4XDinhLQQP2RQjkfni1wBbtKv?=
 =?iso-8859-1?Q?axXWr5f8QqGBbuApEydXDVnGJL7fBFICea8RZUvDKGzG43srx4B/R0dtlS?=
 =?iso-8859-1?Q?m4DaPG3hMB92S+ums9GePQhRZMZh0+YGR2UfKmso2S4i/DlZ6W69FVwNWi?=
 =?iso-8859-1?Q?phrID8J9saSP1vSzsvXXk4t3EC5G212q6FhX3BkGZOHc5zoAdfsacfA4Du?=
 =?iso-8859-1?Q?0NnrQ02jQGzsyk1KXG+94Pp0+j/iqyGGRNe2SY7NzM189+Xnrz0My+/Phk?=
 =?iso-8859-1?Q?+HhfUSNx/wfJszxloLj9eJqwl5B+pCVXwFEM4PYOB7XoZRhIK+qzNaQKSI?=
 =?iso-8859-1?Q?emYOpIxfhCGeY0/Goe5bWFEGSaVF+bEHYPZ0HPDqckMNrGtwJ239vHa80j?=
 =?iso-8859-1?Q?T9/av//P7Gk1H4j/7+jo/ULtSNjCprZUqjZ4mWE/aQ1d+gJZIg67Y8M31O?=
 =?iso-8859-1?Q?ZXHbQmeGAOXydgEcpU//VCEtJw6wjHYYsJSqAH4uDSPGqM9sCjA+zDE1sm?=
 =?iso-8859-1?Q?ciIPA6uRi140P7P51WZ/RTUBzrezXLHbdked4PWV07OKYDOBrAkEso3efS?=
 =?iso-8859-1?Q?vfSAU1deDQhSEejU7fX2YRmPvfuwglM=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca75ac9-ad91-4247-8ea5-08deb5049700
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 17:40:45.2980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EQMxZpn1jo44n3WYTAIuyx/qQEvEt9tCNAHYAhUstWmBAraOof5L4zC2fawOzsOMhaFjpOs3DcgEzYs/QBVcQXvQhyFlGbbaG0JmDaukg7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB7623
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2026 17:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127058

--wxb55cvcxkvqz25c
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [oe] [PATCH 1/1] chrony: add group argument to useradd command
MIME-Version: 1.0

Adam Duskett via lists.openembedded.org schrieb am Mo 18. Mai, 12:17 (+0200=
):
> diff --git a/meta-networking/recipes-support/chrony/chrony_4.8.bb b/meta-=
networking/recipes-support/chrony/chrony_4.8.bb
> index a7fc73e081..837f2e073f 100644
> --- a/meta-networking/recipes-support/chrony/chrony_4.8.bb
> +++ b/meta-networking/recipes-support/chrony/chrony_4.8.bb
> @@ -47,7 +47,7 @@ inherit update-rc.d systemd pkgconfig
>  # Add chronyd user if privdrop packageconfig is selected
>  inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'privdrop', 'useradd=
', '', d)}
>  USERADD_PACKAGES =3D "${@bb.utils.contains('PACKAGECONFIG', 'privdrop', =
'${PN}', '', d)}"
> -USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'privdro=
p', '--system -d / -M --shell /sbin/nologin chronyd;', '', d)}"
> +USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'privdro=
p', '--system -d / -M -g chronyd --shell /sbin/nologin chronyd;', '', d)}"

Is it possible to use ${sbindir} here?

--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--wxb55cvcxkvqz25c
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIIThAYJKoZIhvcNAQcCoIITdTCCE3ECAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgghDNMIIFgTCCBGmgAwIBAgIQOXJEOvkit1HX02wQ3TE1lTANBgkqhkiG9w0BAQwFADB7
MQswCQYDVQQGEwJHQjEbMBkGA1UECAwSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHDAdT
YWxmb3JkMRowGAYDVQQKDBFDb21vZG8gQ0EgTGltaXRlZDEhMB8GA1UEAwwYQUFBIENlcnRp
ZmljYXRlIFNlcnZpY2VzMB4XDTE5MDMxMjAwMDAwMFoXDTI4MTIzMTIzNTk1OVowgYgxCzAJ
BgNVBAYTAlVTMRMwEQYDVQQIEwpOZXcgSmVyc2V5MRQwEgYDVQQHEwtKZXJzZXkgQ2l0eTEe
MBwGA1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMS4wLAYDVQQDEyVVU0VSVHJ1c3QgUlNB
IENlcnRpZmljYXRpb24gQXV0aG9yaXR5MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKC
AgEAgBJlFzYOw9sIs9CsVw127c0n00ytUINh4qogTQktZAnczomfzD2p7PbPwdzx07HWezco
EStH2jnGvDoZtF+mvX2do2NCtnbyqTsrkfjib9DsFiCQCT7i6HTJGLSR1GJk23+jBvGIGGqQ
Ijy8/hPwhxR79uQfjtTkUcYRZ0YIUcuGFFQ/vDP+fmyc/xadGL1RjjWmp2bIcmfbIWax1Jt4
A8BQOujM8Ny8nkz+rwWWNR9XWrf/zvk9tyy29lTdyOcSOk2uTIq3XJq0tyA9yn8iNK5+O2hm
AUTnAU5GU5szYPeUvlM3kHND8zLDU+/bqv50TmnHa4xgk97Exwzf4TKuzJM7UXiVZ4vuPVb+
DNBpDxsP8yUmazNt925H+nND5X4OpWaxKXwyhGNVicQNwZNUMBkTrNN9N6frXTpsNVzbQdcS
2qlJC9/YgIoJk2KOtWbPJYjNhLixP6Q5D9kCnusSTJV882sFqV4Wg8y4Z+LoE53MW4LTTLPt
W//e5XOsIzstAL81VXQJSdhJWBp/kjbmUZIO8yZ9HE0XvMnsQybQv0FfQKlERPSZ51eHnlAf
V1SoPv10Yy+xUGUJ5lhCLkMaTLTwJUdZ+gQek9QmRkpQgbLevni3/GcV4clXhB4PY9bpYrrW
X1Uu6lzGKAgEJTm4Diup8kyXHAc/DVL17e8vgg8CAwEAAaOB8jCB7zAfBgNVHSMEGDAWgBSg
EQojPpbxB+zirynvgqV/0DCktDAdBgNVHQ4EFgQUU3m/WqorSs9UgOHYm8Cd8rIDZsswDgYD
VR0PAQH/BAQDAgGGMA8GA1UdEwEB/wQFMAMBAf8wEQYDVR0gBAowCDAGBgRVHSAAMEMGA1Ud
HwQ8MDowOKA2oDSGMmh0dHA6Ly9jcmwuY29tb2RvY2EuY29tL0FBQUNlcnRpZmljYXRlU2Vy
dmljZXMuY3JsMDQGCCsGAQUFBwEBBCgwJjAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuY29t
b2RvY2EuY29tMA0GCSqGSIb3DQEBDAUAA4IBAQAYh1HcdCE9nIrgJ7cz0C7M7PDmy14R3iJv
m3WOnnL+5Nb+qh+cli3vA0p+rvSNb3I8QzvAP+u431yqqcau8vzY7qN7Q/aGNnwU4M309z/+
3ri0ivCRlv79Q2R+/czSAaF9ffgZGclCKxO/WIu6pKJmBHaIkU4MiRTOok3JMrO66BQavHHx
W/BBC5gACiIDEOUMsfnNkjcZ7Tvx5Dq2+UUTJnWvu6rvP3t3O9LEApE9GQDTF1w52z97GA1F
zZOFli9d31kWTz9RvdVFGD/tSo7oBmF0Ixa1DVBzJ0RHfxBdiSprhTEUxOipakyAvGp4z7h/
jnZymQyd/teRCBaho1+VMIIGEDCCA/igAwIBAgIQTZQsENQ74JQJxYEtOisGTzANBgkqhkiG
9w0BAQwFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkxFDASBgNVBAcT
C0plcnNleSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsxLjAsBgNVBAMT
JVVTRVJUcnVzdCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwHhcNMTgxMTAyMDAwMDAw
WhcNMzAxMjMxMjM1OTU5WjCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFu
Y2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4w
PAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBF
bWFpbCBDQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMo87ZQKQf/e+Ua56NY7
5tqSvysQTqoavIK9viYcKSoq0s2cUIE/bZQu85eoZ9X140qOTKl1HyLTJbazGl6nBEibivHb
SuejQkq6uIgymiqvTcTlxZql19szfBxxo0Nm9l79L9S+TZNTEDygNfcXlkHKRhBhVFHdJDfq
B6Mfi/Wlda43zYgo92yZOpCWjj2mz4tudN55/yE1+XvFnz5xsOFbme/SoY9WAa39uJORHtbC
0x7C7aYivToxuIkEQXaumf05Vcf4RgHs+Yd+mwSTManRy6XcCFJE6k/LHt3ndD3sA3If/JBz
6OX2ZebtQdHnKav7Azf+bAhudg7PkFOTuRMCAwEAAaOCAWQwggFgMB8GA1UdIwQYMBaAFFN5
v1qqK0rPVIDh2JvAnfKyA2bLMB0GA1UdDgQWBBQJwPL8C9qU21/+K9+omULPyeCtADAOBgNV
HQ8BAf8EBAMCAYYwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHSUEFjAUBggrBgEFBQcDAgYI
KwYBBQUHAwQwEQYDVR0gBAowCDAGBgRVHSAAMFAGA1UdHwRJMEcwRaBDoEGGP2h0dHA6Ly9j
cmwudXNlcnRydXN0LmNvbS9VU0VSVHJ1c3RSU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5LmNy
bDB2BggrBgEFBQcBAQRqMGgwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jcnQudXNlcnRydXN0LmNv
bS9VU0VSVHJ1c3RSU0FBZGRUcnVzdENBLmNydDAlBggrBgEFBQcwAYYZaHR0cDovL29jc3Au
dXNlcnRydXN0LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEAQUR1AKs5whX13o6VbTJxaIwA3RfX
ehwQOJDI47G9FzGR87bjgrShfsbMIYdhqpFuSUKzPM1ZVPgNlT+9istp5UQNRsJiD4KLu+E2
f102qxxvM3TEoGg65FWM89YN5yFTvSB5PelcLGnCLwRfCX6iLPvGlh9j30lKzcT+mLO1NLGW
MeK1w+vnKhav2VuQVHwpTf64ZNnXUF8p+5JJpGtkUG/XfdJ5jR3YCq8H0OPZkNoVkDQ5CSSF
8Co2AOlVEf32VBXglIrHQ3v9AAS0yPo4Xl1FdXqGFe5TcDQSqXh3TbjugGnG+d9yZX3lB8bw
c/Tn2FlIl7tPbDAL4jNdUNA7jGee+tAnTtlZ6bFz+CsWmCIb6j6lDFqkXVsp+3KyLTZGXq6F
2nnBtN4t5jO3ZIj2gpIKHAYNBAWLG2Q2fG7Bt2tPC8BLC9WIM90gbMhAmtMGquITn/2fORds
NmaV3z/sPKuIn8DvdEhmWVfh0fyYeqxGlTw0RfwhBlakdYYrkDmdWC+XszE19GUi8K8plBNK
cIvyg2omAdebrMIHiAHAOiczxX/aS5ABRVrNUDcjfvp4hYbDOO6qHcfzy/uY0fO5ssebmHQR
EJJA3PpSgdVnLernF6pthJrGkNDPeUI05svqw1o5A2HcNzLOpklhNwZ+4uWYLcAi14ACHuVv
JsmzNicwggUwMIIEGKADAgECAhEA/OH3TxzsxiYnBai43hD2fjANBgkqhkiG9w0BAQsFADCB
ljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMH
U2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJT
QSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTAeFw0yNDA2MDQw
MDAwMDBaFw0yNjA3MDMyMzU5NTlaMCoxKDAmBgkqhkiG9w0BCQEWGWpvZXJnLnNvbW1lckBu
YXZpbWF0aXguZGUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDNxFyhl/UuZdUp
uQiuqZBMSU/pN5SMIj4lkvTlrtp2jl4Q77wbv4vXdXIFWqKd3qtut55G0ptK4nXs1ARrh3AH
QAYwB0vW+PHVNPLs9yombnTeMgnEv/RQDFkH+DxoKdY5+DRUmcVO/tYl6ExMEBj6oh6b/63w
hIkC61WRETH3FpRCRbyNBD73OWt0KzxoKzW9xmdqfhNtylLcIFMzuv9C1WAqJ3mLbFHYaW4N
EMMckPZJWWYzvA2nwCCryerE3J9z4ZbSK0OK6DDRN9gW/H7+/4pHSIhdooGfQEdgLj+Z4ZPh
vLMF5DncBD8k5DOK8mlDxCKp4GsrLLuBfLQdxilvAgMBAAGjggHiMIIB3jAfBgNVHSMEGDAW
gBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQU3lTOaS6cJRsIzzEjdtC4j6GPtWIw
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
+9s6RvytgsBtk1dB4lJEMe32RnTa4ABWg2VpdqmG7wjr2BlUCzLzuxUxggJ7MIICdwIBATCB
rDCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UE
BxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdv
IFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAPzh908c
7MYmJwWouN4Q9n4wDQYJYIZIAWUDBAIBBQCggaAwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYwNTE4MTc0MDQyWjAvBgkqhkiG9w0BCQQxIgQgKbE2UyWZ
5bdPE4OzERFt9r+5bqtXsLVib9sxC4veTqcwNQYJKoZIhvcNAQkPMSgwJjALBglghkgBZQME
ASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA0GCSqGSIb3DQEBAQUABIIBAMBJspsXc6JU
KW7UYPLc1woObzf28N+iWFxcPLHX6+y6P76t/t5/numyeTEaToG6ngZP1i8uI/ueYhaeLm/Z
MrYPpANX5x6H1tF8yaK+43IZbpF0iKADzgqXu3IOVHuA6Zd0rEn4+W7wculbI+YtimpdvqA6
3xQ+EUuBscMCIpr5zwNfhipVTjihdlKW3cZVNLcGp5HJQtJ9/qwQ4SCzhc1g42L/N8Z9eemm
xTo4ynfoS6WxghwOJBUk/6xm5sAmG+N6bSN2IRMQMIMVVyI7mU2B0W77zvjQQV5DCnRxUA2V
No8Tx7BS0Vmd8/xYSJSCXtHMJ7VuKG8EfLIBkXNJQ+M=

--wxb55cvcxkvqz25c--

