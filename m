Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.43])
 by mx.groups.io with SMTP id smtpd.web11.67.1604087148333919461
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2020 12:45:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=oRfyHLRy;
 spf=pass (domain: kpit.com, ip: 40.107.138.43, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QBQTzQJxIWA8l4WLUiuIyJGWqKHsBg3ys3e2S8ytfIowQIt2CA83q4qqxUDmlxID9tCtzGVU1aEu1BO6gqMbSgn3lYf5UIRw6/sfslzAljRLWm5c0Sc1IgweAVb54ZFnep0Hmbmg8PfZTx1iPg8b9vSy0mxabtwgFO+rk4QhMf5hacvlpDIiaHEKof8P+wgMfQsmOesXayIZgdaaPKhc5K9kMN/KaviD6jOPENvKF4ng9zkhYJMGilgC0ALxM46aU4ZbR+YhFSx+wTQ4ctTFl+EWbFbOPaLzxGqUt20t7qfyIckr4w8k1QzArz/n0+e9AnH8ktl7nS9tFvGSXik6AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDGfzyJ6s6F/sBUzTM3Lx5Y9ZVid70rbyTanISdbpUQ=;
 b=a9azAss9jXnpZXuuFCNQG0DPwK3LIuuZA0NOo1r7gFGu10x1rS3lqhdaTFL0PXONZIxCLWLNKCTV3HvLRPt3IJdsCZalGHxUpRfJcHLG8e2xp7z/27ndOEriIIy8xQU4PrYdeFLtlwtMzTbQKczubyQlKPrJPXffveIJbB9dFHGT2BgSTHNPgYkWk4pG0SWUowdud/L5qqKZ0Nca07eOmHkLgUcKfLlL5RXplHt2OayTLW5r3xV1FOgPRraRPSbXNXddhbH2688P44QbDA8u3HHGJydeZF9lv/6CVH9Tmw/DA72AjuFZIR2hlvreyyn3DbK0h1HSvkZ69f3Cfq3XoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDGfzyJ6s6F/sBUzTM3Lx5Y9ZVid70rbyTanISdbpUQ=;
 b=oRfyHLRyyqal4h8eKdCQSzpDnCBfb2AH5ILBDoCsaBpgaJv0XpjI0X1OQadBlgoOHAArXZ5VGhlaGuhqwf+vg0Lk8071/OgKwa9thHoJ+baS3YEFnCMYQypOU/m2Lf2gUI8d1PSGVTpSSbnxZicQfaI/tPlDFfCQrejhwUIVWv4=
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:74::20)
 by BM1PR01MB2753.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:4a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Fri, 30 Oct
 2020 19:45:41 +0000
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::200c:7e58:5a42:f5f3]) by BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::200c:7e58:5a42:f5f3%7]) with mapi id 15.20.3499.029; Fri, 30 Oct 2020
 19:45:40 +0000
From: "saloni" <saloni.jain@kpit.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
CC: "Nisha.parakkat@kpit.com" <Nisha.parakkat@kpit.com>, Anuj Chougule
	<Anuj.Chougule@kpit.com>, Akash Hadke <Akash.Hadke@kpit.com>, Aditya Tayade
	<Aditya.Tayade@kpit.com>, Nilesh Pawar <Nilesh.Pawar@kpit.com>
Subject: CPE update for polkit
Thread-Topic: CPE update for polkit
Thread-Index: AQHWrvSC00CkyacswUuc1RnipuTzDw==
Date: Fri, 30 Oct 2020 19:45:40 +0000
Message-ID: 
 <BM1PR01MB401942C1F999143BBD303E4E87150@BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
x-originating-ip: [157.42.0.90]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0b578820-1d93-40e1-30f0-08d87d0c61f8
x-ms-traffictypediagnostic: BM1PR01MB2753:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <BM1PR01MB27533F17BB07883A7C3DE00687150@BM1PR01MB2753.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Pb0/CtdojZBy1euUKBrDfutvUOfMYJvc8LE3oiGxFyjYZUQx9T0ZEURWrNIrfbbXROKI6KN6/DPMeWTKHoH6ROtNdUE4o1mjcOL7/TJZrMdEK8/CtzQBfDaukxa1Yd6e+k390mRVbC/8U2VaMf4zfZsPSrLrfmrJ3by7U+aRuntBIzdII54idE1HnZRRm2UTH5NkViIKv2MYuhATiau+n3jSAnOfBFAq1OF26hLEwWkgsEjNBghvc+Wt//7QaBRib4rFhXX7pOQN9PNnyxx91Krsj0htNorpO/F+hs/HHv29nTrqsNNeSltiOIIxBDJhGB99JzVaHbqlAN9+T/9UkhGsywrhmbqFPvMM6xhW/SSDXMARevp9KyZdXJRQBcbl6fAlFMFsYMfeJZ0TNSJUo/q4X26GqmxTnpV4Md0RXEouuLQFuYY7ciaoWL1Mus2H1crQGTuDTJ2KQQFQKWKFVw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39830400003)(136003)(376002)(346002)(83080400002)(83380400001)(15650500001)(6916009)(71200400001)(66574015)(107886003)(478600001)(76116006)(55016002)(9686003)(3480700007)(5660300002)(4326008)(2906002)(8676002)(7696005)(6506007)(16799955002)(26005)(52536014)(33656002)(66476007)(966005)(186003)(66556008)(64756008)(66446008)(316002)(66946007)(86362001)(166002)(54906003)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 UUeoDcB8qQjEvXnjnuAsOrMNqM8MhkA8QVdnKnCk9+l0dnMszMXwla/s1EsYFVznVPbgrM8BgXefZpSR98YByn6Q9erp0TafTgWRmZJk84qm8AH+mBBthjFCHficTCmAYcfvApLtfqQ2vGKQZDuKxWrn2u3x5V5UiogZQl9Xedc4eFXqjimq7ZqZ4ax4pfeD/BXJtZL0eCjDF7M2nbEjqo2zlWYy4Jf9OWgMG+xs2OZVH5DOJFYLDcepw0W8000lVGThicAVirsJ+8XvAbEH1jqknFzC4+dedxuUZruIzp5A5sVn79tx6TJMJy53YfGOmlVe3b42vOTF9+K8cCu07v+Vwhr0Q9fdQ783Lb5g1iroQeVbypMgbOGfjpC+TEmHTpRbmviWP7yPeRoGcVDpD0bIZyAg/KgF1P0BskcpwiouBCsZVjPc6CqNmc+T1bOaYiNvRy2BL+UNcBI+JBogJ1bvgtIrYh+PAujtjlcOkhY4u0finij94Cqf/U8v5sIxJdItngElNmwZBucpX9Ap6I9B0yB8sRA4fesGoJ2c1uBBy3q2FAEXYEHMAJ5vzcKTkgifaJAcLj+odAm+N1LYi07Wj2c43YWzwJjQ0e/nuiHNljZulhArgddmcX5UT0UHZGHdoi+wDAhAZS3u/nXJCQ==
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b578820-1d93-40e1-30f0-08d87d0c61f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2020 19:45:40.5252
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vARY/bQO5r1WkqyfeCY20ZyvV6kNIZgplwtOVE8kQRknju8FwzLNE0UJ8lhdhx9L8vrsv2+svhAkSILMkXT0AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB2753
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BM1PR01MB401942C1F999143BBD303E4E87150BM1PR01MB4019INDP_"

--_000_BM1PR01MB401942C1F999143BBD303E4E87150BM1PR01MB4019INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I would like to make some restrictions to polkit CVE-2013-4288
https://nvd.nist.gov/vuln/detail/CVE-2013-4288

The changes for the said CVE were fixed in Source-Version: 0.112-1 and are =
now merged in the reported distributions on stable releases.
Please find the reference to the links and tar file attesting the same:

http://snapshot.debian.org/archive/debian-security/20181206T212649Z/pool/up=
dates/main/p/policykit-1/policykit-1_0.105-18%2Bdeb9u1.debian.tar.xz
https://bugzilla.redhat.com/show_bug.cgi?id=3D1002375
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D723717
https://ubuntu.com/security/notices/USN-1953-1
https://www.security-database.com/detail.php?alert=3DCVE-2013-4288
https://vuldb.com/?id.65188

The references on above links claims that upgrading to stable releases elim=
inates this vulnerability.

Regards,
Saloni Jain

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_BM1PR01MB401942C1F999143BBD303E4E87150BM1PR01MB4019INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
"></div>
<div dir=3D"auto" style=3D"text-align: left;" data-ogsc=3D"">
<div style=3D"font-family: -apple-system, HelveticaNeue; text-align: start;=
"><span style=3D"font-size: 10pt; line-height: 20px"></span></div>
<div dir=3D"auto" style=3D"text-align: left;"><span style=3D"font-family: -=
apple-system, HelveticaNeue; font-size: 10pt;">Hello,</span><br>
</div>
<div dir=3D"auto" style=3D"text-align: left;"><span style=3D"font-family: -=
apple-system, HelveticaNeue; font-size: 10pt;"><br>
</span></div>
<div dir=3D"auto" style=3D"text-align: left;"><span style=3D"font-family: -=
apple-system, HelveticaNeue; text-align: start; font-size: 10pt; line-heigh=
t: 20px">I would like to make some restrictions to polkit CVE-2013-4288</sp=
an><span style=3D"font-family: -apple-system, HelveticaNeue; text-align: st=
art; display: inline !important"></span>
<div style=3D"font-family: -apple-system, HelveticaNeue; text-align: start"=
><span style=3D"font-size: 10pt; line-height: 20px"><a href=3D"https://nvd.=
nist.gov/vuln/detail/CVE-2013-4288" data-ogsc=3D"" style=3D"">https://nvd.n=
ist.gov/vuln/detail/CVE-2013-4288</a></span></div>
<div style=3D"font-family: -apple-system, HelveticaNeue; text-align: start"=
><br>
</div>
<div style=3D"font-family: -apple-system, HelveticaNeue; text-align: start"=
><span style=3D"font-size: 10pt; line-height: 20px">The changes for the sai=
d CVE were fixed in Source-Version: 0.112-1 and are now merged in the repor=
ted distributions on stable releases.</span></div>
<div style=3D"font-family: -apple-system, HelveticaNeue; text-align: start"=
><span style=3D"font-size: 10pt; line-height: 20px">Please find the referen=
ce to the links and tar file attesting the same:</span></div>
<div style=3D"font-family: -apple-system, HelveticaNeue; text-align: start"=
><br>
</div>
<div style=3D"font-family: -apple-system, HelveticaNeue; text-align: start"=
><a href=3D"http://snapshot.debian.org/archive/debian-security/20181206T212=
649Z/pool/updates/main/p/policykit-1/policykit-1_0.105-18%2Bdeb9u1.debian.t=
ar.xz" data-ogsc=3D"" style=3D""><span style=3D"font-size: 10pt; line-heigh=
t: 20px">http://snapshot.debian.org/archive/debian-security/20181206T212649=
Z/pool/updates/main/p/policykit-1/policykit-1_0.105-18%2Bdeb9u1.debian.tar.=
xz</span></a><br>
</div>
<div style=3D"font-family: -apple-system, HelveticaNeue; text-align: start"=
><a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1002375" data-ogs=
c=3D"" style=3D""><span style=3D"font-size: 10pt; line-height: 20px">https:=
//bugzilla.redhat.com/show_bug.cgi?id=3D1002375</span></a><br>
</div>
<div style=3D"font-family: -apple-system, HelveticaNeue; text-align: start"=
></div>
<div style=3D"font-family: -apple-system, HelveticaNeue; text-align: start"=
><a href=3D"https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D723717" dat=
a-ogsc=3D"" style=3D""><span style=3D"font-size: 10pt; line-height: 20px">h=
ttps://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D723717</span></a><br>
</div>
<div style=3D"font-family: -apple-system, HelveticaNeue; text-align: start"=
><a href=3D"https://ubuntu.com/security/notices/USN-1953-1" data-ogsc=3D"" =
style=3D""><span style=3D"font-size: 10pt; line-height: 20px">https://ubunt=
u.com/security/notices/USN-1953-1</span></a><br>
</div>
<div style=3D"font-family: -apple-system, HelveticaNeue; text-align: start"=
><a href=3D"https://www.security-database.com/detail.php?alert=3DCVE-2013-4=
288" data-ogsc=3D"" style=3D""><span style=3D"font-size: 10pt; line-height:=
 20px">https://www.security-database.com/detail.php?alert=3DCVE-2013-4288</=
span></a><br>
</div>
<div style=3D"font-family: -apple-system, HelveticaNeue; text-align: start"=
></div>
<div style=3D"font-family: -apple-system, HelveticaNeue; text-align: start"=
><a href=3D"https://vuldb.com/?id.65188" data-ogsc=3D"" style=3D""><span st=
yle=3D"font-size: 10pt; line-height: 20px">https://vuldb.com/?id.65188</spa=
n></a><br>
</div>
<div style=3D"font-family: -apple-system, HelveticaNeue; text-align: start"=
><br>
</div>
<div style=3D"font-family: -apple-system, HelveticaNeue; text-align: start"=
><span style=3D"font-size: 10pt; line-height: 20px">The references on above=
 links claims that upgrading to stable releases eliminates this vulnerabili=
ty.</span></div>
<div style=3D"font-family: -apple-system, HelveticaNeue; text-align: start"=
><span style=3D"font-size: 10pt; line-height: 20px"><br>
</span></div>
<div style=3D"font-family: -apple-system, HelveticaNeue; text-align: start"=
><span style=3D"font-size: 10pt; line-height: 20px">Regards,&nbsp;</span></=
div>
<div style=3D"font-family: -apple-system, HelveticaNeue; text-align: start"=
><span style=3D"font-size: 10pt; line-height: 20px">Saloni Jain</span></div=
>
</div>
<br>
</div>
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

--_000_BM1PR01MB401942C1F999143BBD303E4E87150BM1PR01MB4019INDP_--
