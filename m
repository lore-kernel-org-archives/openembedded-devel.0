Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.70])
 by mx.groups.io with SMTP id smtpd.web12.3879.1604168898255933917
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Oct 2020 11:28:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=hNqfX+zH;
 spf=pass (domain: kpit.com, ip: 40.107.139.70, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G2KbJc+GEegkwCS8diYCovzDF37/yVRh5Co1QBQe+MNl+/y9eKskrIrpkM4RgHdlfO1mdaeG+8y864A3jMox5qQLPn00rxQ6vYCAgbvFQhWv54old9aSeZICKvV2EZNfPkgVehE6TZLkNsCqkBM/tGZ2UAjzTOONvEf4IqI4EMqzA/yMRH2JuBN8qDQVep/Ts/yo8OJZkdo9TfX+Ov+F/vKbbxQAimwLHu9OnxHd/C8DJ1z2XqZym/D/crF3Gu6tPuBf6e+bTGK6nHpei/IfL+CwegfETUtvL/jMdJoofCFB3tTloVN/vkfWVhxLDz1FtSrndSoSMbyjen5U4PJY+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9usugS0cz2Db6ryVKTJcJPRn45zLXatPcnmyEHMeJyQ=;
 b=kXkEUw2V+TcYn+c1b8eeh8Q72egcVy3bhKBzfY3tVc3WXaxI6HbINXHdHuLIpPsHASXc2kXYl8EPl051uDSs3oF3Ma998xZpgroyQtlGn45GL8RplJMVKlgELTnVIplECAY4qUPjLg4do22zsgJMgd4S9waxMz4xaXAjQa5s7qWIFiSVLl3TreT3Sb+9PIufkf+YF+8ODvJTK258X5APnocjoVCoWFZNp+kYXXP/JsPdUsWIm+11I65Vg3v6PKjlhhC6Rv2Dub3rQJpXat8g6Nf1sas9WAACq+XucVySQPCkKvo2BkH1guNm5ly5zkz5sUo2itLowquhACsSQVLe8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9usugS0cz2Db6ryVKTJcJPRn45zLXatPcnmyEHMeJyQ=;
 b=hNqfX+zHvkoKScCMa/WuAZzvm8aoYcRnE/EcODDS83OvTLmTLGMjgTF1z8KjVbQ0P3fjh23RzyTjFx70CPx7KanLnXGAxNbkGzm8KsJqe3fKre7CDiu7u0QCUKIK5qcLI8AXjsRZ7lTj0lU/kQFK1H69ZoUsMCaYUk2yUVFivAg=
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:74::20)
 by BM1PR01MB2867.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:4f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Sat, 31 Oct
 2020 18:28:07 +0000
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::200c:7e58:5a42:f5f3]) by BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::200c:7e58:5a42:f5f3%7]) with mapi id 15.20.3499.029; Sat, 31 Oct 2020
 18:28:07 +0000
From: "saloni" <saloni.jain@kpit.com>
To: Steve Sakoman <sakoman@gmail.com>
CC: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	"Nisha.parakkat@kpit.com" <Nisha.parakkat@kpit.com>, Anuj Chougule
	<Anuj.Chougule@kpit.com>, Akash Hadke <Akash.Hadke@kpit.com>, Aditya Tayade
	<Aditya.Tayade@kpit.com>, Nilesh Pawar <Nilesh.Pawar@kpit.com>
Subject: Re: [oe] CPE update for polkit
Thread-Topic: [oe] CPE update for polkit
Thread-Index: AQHWrvSC00CkyacswUuc1RnipuTzD6mx/2cAgAAJHTQ=
Date: Sat, 31 Oct 2020 18:28:07 +0000
Message-ID: 
 <BM1PR01MB40194C9655979CC836DBDC7387120@BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM>
References: 
 <BM1PR01MB401942C1F999143BBD303E4E87150@BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM>,<CAGDS+nmwC5mS4qLdLe2Kc3oiEBrSRd6MCnjMHfiv5oAQzJ21=Q@mail.gmail.com>
In-Reply-To: 
 <CAGDS+nmwC5mS4qLdLe2Kc3oiEBrSRd6MCnjMHfiv5oAQzJ21=Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=kpit.com;
x-originating-ip: [157.42.99.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a51e36d2-2a38-4780-0b89-08d87dcab6ae
x-ms-traffictypediagnostic: BM1PR01MB2867:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <BM1PR01MB2867AEEF8AB0D772BC42C3D587120@BM1PR01MB2867.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 yy9rdPmLDMVG5zek0LGha21yIOMSv5mcDZ6U36iTt9OQ7XaOdIMs7omvZQhU7syuAsl9IZhuYJm4JNnxrA415vFav3PicZhX7cJbNySaR+5mjHLeOgP8oXqa3RShgv2kf2Ry6cssVz1TD9HYaipxLNGw8kkNqqFJZc7dD0pRqEGb/sFHSKebPXDgYJtl3+e7L4L4YyUzK5NLMEWmL6EPNipUXGODIerwNa63J2PZxJ9RMbGUseZ5bAkfhUrdCemDQgDCwY1U0BhBF6UdHai7A9F3LJ1oljj9Ur7sirzx1h0eKB0IFaGo+6JYHKIegy0aPb2RuUdepX9GTthSL0ZhmS1KHB2PNxCCLiYdeLhc0lIS9MLjgBtrcMmcprJ40i5y6n2HXH1Q5VPvLejrUiKbVDfsl4wALvKqnYLqjejZ/nine69IlMc2b45HeR8ifxsnZIu8PT1HZcCxbfI/lG0VJQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(366004)(39850400004)(396003)(66476007)(64756008)(66946007)(8936002)(16799955002)(55016002)(5660300002)(26005)(83080400002)(9686003)(66446008)(76116006)(66556008)(53546011)(8676002)(4326008)(6506007)(316002)(966005)(71200400001)(45080400002)(166002)(186003)(52536014)(66574015)(15650500001)(7696005)(107886003)(83380400001)(86362001)(2906002)(6916009)(478600001)(54906003)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 w4cZVuRwXN1CAGaYF1MI19RN3nKWu5f1DU8evs67wWQCREC2ZlqOof/uhtWAXClxP2NRiF2KMzyHUUm1mphP4HDss4Z+dnFT7c1hYsfNiCxhukRmIFhLd3avWKwJMT9j1GjwY8zT3Q3hk9L2sHffOgDVXO+fT+8Bxn/5Cm8vSfWV8yuJll2xhqou7859Y9l15Hk4pA3AOkbjw9BPjyYQgXDaDZfFLP1YjTSRdXFXsETBhOQflvOlCtGjsYAYnlCuVGbPcmF5qFxDsJaPAZBdkXcjxjTcxLQyBYZeJHKjzG3sQKX+oMEhpirzDZeG1O3UxkGFy506MPo8vv/6rwb/zYUgxq/GR61K1MIfA4PjxNNKh2+5Hm19RhYydDYn5l36QAnMAb5vMAkzqS6WuoRoIZXGmjnYFPJzmZCs84WdL6TcDl9ENAa3e27Z3z/4Qv04/apx2XwcpFiNRDo51r85j9kD6YXWeog4JrLzgxNpA1aivQyDPIcY2SLb+ehCcNz2Mp/rh5MyAMUU5Vbc0+vCIouAS9av78LCf1MIA2dI7rUKuXe9G32oRo6tVPDSeVOW+hlxPg508xpRHo8NPgMlpU1wIJF7CqHMP5Qzcjbs2NNq8taSuL0+iPM6O4lo8w5JCYiU6UR9RocvLLRalukTEg==
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a51e36d2-2a38-4780-0b89-08d87dcab6ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2020 18:28:07.1882
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cea5VrUFI7JSOm5g93lAePITXKakgZ2xheypiGXIjNpRqdiEnbAbKDoWP7Tev64MkzMyFIbVBYGBiP9utPQVHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB2867
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BM1PR01MB40194C9655979CC836DBDC7387120BM1PR01MB4019INDP_"

--_000_BM1PR01MB40194C9655979CC836DBDC7387120BM1PR01MB4019INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Steve,

Thankyou for the information!

Will send request to the CPE database mailing list.

Regards,
Saloni Jain
________________________________
From: Steve Sakoman <sakoman@gmail.com>
Sent: Saturday, October 31, 2020 11:22:54 PM
To: Saloni Jain <Saloni.Jain@kpit.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>; N=
isha.parakkat@kpit.com <Nisha.parakkat@kpit.com>; Anuj Chougule <Anuj.Choug=
ule@kpit.com>; Akash Hadke <Akash.Hadke@kpit.com>; Aditya Tayade <Aditya.Ta=
yade@kpit.com>; Nilesh Pawar <Nilesh.Pawar@kpit.com>
Subject: Re: [oe] CPE update for polkit

Requests for CPE database updates should be sent to: cpe_dictionary@nist.g=
ov

Sending them to the OE list won't result in any changes to the database ;-=
)

Steve

On Fri, Oct 30, 2020 at 9:46 AM saloni <saloni.jain@kpit.com> wrote:
>
> Hello,
>
> I would like to make some restrictions to polkit CVE-2013-4288
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fnvd.=
nist.gov%2Fvuln%2Fdetail%2FCVE-2013-4288&amp;data=3D04%7C01%7Csaloni.jain%4=
0kpit.com%7C25f5a4c6b3fc489bed4f08d87dc5d31b%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C637397636705025622%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;sdata=3DSVoZKc=
jcS5c%2BMGqEjM0IW4rIVOrR4MsqXSbcJcddHN0%3D&amp;reserved=3D0
>
> The changes for the said CVE were fixed in Source-Version: 0.112-1 and a=
re now merged in the reported distributions on stable releases.
> Please find the reference to the links and tar file attesting the same:
>
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fsnaps=
hot.debian.org%2Farchive%2Fdebian-security%2F20181206T212649Z%2Fpool%2Fupda=
tes%2Fmain%2Fp%2Fpolicykit-1%2Fpolicykit-1_0.105-18%252Bdeb9u1.debian.tar.x=
z&amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C25f5a4c6b3fc489bed4f08d87dc=
5d31b%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637397636705035614%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C2000&amp;sdata=3DWSiQcP9ydrr%2BzJeLKWexQelubvwjgaNqAK6wNtU2dAo=
%3D&amp;reserved=3D0
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugz=
illa.redhat.com%2Fshow_bug.cgi%3Fid%3D1002375&amp;data=3D04%7C01%7Csaloni.j=
ain%40kpit.com%7C25f5a4c6b3fc489bed4f08d87dc5d31b%7C3539451eb46e4a26a242ff6=
1502855c7%7C0%7C0%7C637397636705035614%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;sdata=3Df=
MUdSU3YPOnF3kyWXBENHZwHuTno6sD5IYYGyOIfPIE%3D&amp;reserved=3D0
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugs=
.debian.org%2Fcgi-bin%2Fbugreport.cgi%3Fbug%3D723717&amp;data=3D04%7C01%7Cs=
aloni.jain%40kpit.com%7C25f5a4c6b3fc489bed4f08d87dc5d31b%7C3539451eb46e4a26=
a242ff61502855c7%7C0%7C0%7C637397636705035614%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;sd=
ata=3DouEoawaryiv19hn3dqZTVIzb%2BMUfwh8x0ScwU%2FkRh3k%3D&amp;reserved=3D0
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fubun=
tu.com%2Fsecurity%2Fnotices%2FUSN-1953-1&amp;data=3D04%7C01%7Csaloni.jain%4=
0kpit.com%7C25f5a4c6b3fc489bed4f08d87dc5d31b%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C637397636705035614%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;sdata=3DtgcgxB=
MJGNwLIw3TJT%2BrorfdXWtpSwVsh3Xy0r%2BHpF4%3D&amp;reserved=3D0
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.=
security-database.com%2Fdetail.php%3Falert%3DCVE-2013-4288&amp;data=3D04%7C=
01%7Csaloni.jain%40kpit.com%7C25f5a4c6b3fc489bed4f08d87dc5d31b%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637397636705035614%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&=
amp;sdata=3DP77GHoAW4eB3u2VyW4k%2FMPYBTfvjVzsWPtpZUj1Ejfc%3D&amp;reserved=
=3D0
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fvuld=
b.com%2F%3Fid.65188&amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C25f5a4c6b=
3fc489bed4f08d87dc5d31b%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637397=
636705035614%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC=
JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;sdata=3DnSk%2BwIN2icHGMAGGgkgHRq5af=
xdHmirx8hvB3KkqOG0%3D&amp;reserved=3D0
>
> The references on above links claims that upgrading to stable releases e=
liminates this vulnerability.
>
> Regards,
> Saloni Jain
>
> This message contains information that may be privileged or confidential=
 and is the property of the KPIT Technologies Ltd. It is intended only for =
the person to whom it is addressed. If you are not the intended recipient, =
you are not authorized to read, print, retain copy, disseminate, distribute=
, or use this message or any part thereof. If you receive this message in e=
rror, please notify the sender immediately and delete all copies of this me=
ssage. KPIT Technologies Ltd. does not accept any liability for virus infec=
ted mails.
>
>=20
>
This message contains information that may be privileged or confidential a=
nd is the property of the KPIT Technologies Ltd. It is intended only for th=
e person to whom it is addressed. If you are not the intended recipient, yo=
u are not authorized to read, print, retain copy, disseminate, distribute, =
or use this message or any part thereof. If you receive this message in err=
or, please notify the sender immediately and delete all copies of this mess=
age. KPIT Technologies Ltd. does not accept any liability for virus infecte=
d mails.

--_000_BM1PR01MB40194C9655979CC836DBDC7387120BM1PR01MB4019INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii=
">
</head>
<body>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255)=
; text-align: left;" dir=3D"auto">
Hello Steve,</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255)=
; text-align: left;" dir=3D"auto">
<br>
</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255)=
; text-align: left;" dir=3D"auto">
Thankyou for the information!</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255)=
; text-align: left;" dir=3D"auto">
<br>
</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255)=
; text-align: left;" dir=3D"auto">
Will send request to the CPE database mailing list.</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255)=
; text-align: left;" dir=3D"auto">
<br>
</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255)=
; text-align: left;" dir=3D"auto">
Regards,</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255)=
; text-align: left;" dir=3D"auto">
Saloni Jain</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" s=
tyle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Steve Sakoman &lt;sa=
koman@gmail.com&gt;<br>
<b>Sent:</b> Saturday, October 31, 2020 11:22:54 PM<br>
<b>To:</b> Saloni Jain &lt;Saloni.Jain@kpit.com&gt;<br>
<b>Cc:</b> OpenEmbedded Devel List &lt;openembedded-devel@lists.openembedd=
ed.org&gt;; Nisha.parakkat@kpit.com &lt;Nisha.parakkat@kpit.com&gt;; Anuj C=
hougule &lt;Anuj.Chougule@kpit.com&gt;; Akash Hadke &lt;Akash.Hadke@kpit.co=
m&gt;; Aditya Tayade &lt;Aditya.Tayade@kpit.com&gt;; Nilesh Pawar
 &lt;Nilesh.Pawar@kpit.com&gt;<br>
<b>Subject:</b> Re: [oe] CPE update for polkit</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt=
;">
<div class=3D"PlainText">Requests for CPE database updates should be sent =
to: cpe_dictionary@nist.gov<br>
<br>
Sending them to the OE list won't result in any changes to the database ;-=
)<br>
<br>
Steve<br>
<br>
On Fri, Oct 30, 2020 at 9:46 AM saloni &lt;saloni.jain@kpit.com&gt; wrote:=
<br>
&gt;<br>
&gt; Hello,<br>
&gt;<br>
&gt; I would like to make some restrictions to polkit CVE-2013-4288<br>
&gt; <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Fnvd.nist.gov%2Fvuln%2Fdetail%2FCVE-2013-4288&amp;amp;data=3D04%7C=
01%7Csaloni.jain%40kpit.com%7C25f5a4c6b3fc489bed4f08d87dc5d31b%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637397636705025622%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&=
amp;amp;sdata=3DSVoZKcjcS5c%2BMGqEjM0IW4rIVOrR4MsqXSbcJcddHN0%3D&amp;amp;re=
served=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fnvd.ni=
st.gov%2Fvuln%2Fdetail%2FCVE-2013-4288&amp;amp;data=3D04%7C01%7Csaloni.jain=
%40kpit.com%7C25f5a4c6b3fc489bed4f08d87dc5d31b%7C3539451eb46e4a26a242ff6150=
2855c7%7C0%7C0%7C637397636705025622%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA=
wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;amp;sdata=3D=
SVoZKcjcS5c%2BMGqEjM0IW4rIVOrR4MsqXSbcJcddHN0%3D&amp;amp;reserved=3D0</a><b=
r>
&gt;<br>
&gt; The changes for the said CVE were fixed in Source-Version: 0.112-1 an=
d are now merged in the reported distributions on stable releases.<br>
&gt; Please find the reference to the links and tar file attesting the sam=
e:<br>
&gt;<br>
&gt; <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttp=
%3A%2F%2Fsnapshot.debian.org%2Farchive%2Fdebian-security%2F20181206T212649Z=
%2Fpool%2Fupdates%2Fmain%2Fp%2Fpolicykit-1%2Fpolicykit-1_0.105-18%252Bdeb9u=
1.debian.tar.xz&amp;amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C25f5a4c6b=
3fc489bed4f08d87dc5d31b%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637397=
636705035614%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC=
JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;amp;sdata=3DWSiQcP9ydrr%2BzJeLKWexQ=
elubvwjgaNqAK6wNtU2dAo%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fsnapsho=
t.debian.org%2Farchive%2Fdebian-security%2F20181206T212649Z%2Fpool%2Fupdate=
s%2Fmain%2Fp%2Fpolicykit-1%2Fpolicykit-1_0.105-18%252Bdeb9u1.debian.tar.xz&=
amp;amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C25f5a4c6b3fc489bed4f08d87=
dc5d31b%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637397636705035614%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C2000&amp;amp;sdata=3DWSiQcP9ydrr%2BzJeLKWexQelubvwjgaNqAK6wN=
tU2dAo%3D&amp;amp;reserved=3D0</a><br>
&gt; <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Fbugzilla.redhat.com%2Fshow_bug.cgi%3Fid%3D1002375&amp;amp;data=3D=
04%7C01%7Csaloni.jain%40kpit.com%7C25f5a4c6b3fc489bed4f08d87dc5d31b%7C35394=
51eb46e4a26a242ff61502855c7%7C0%7C0%7C637397636705035614%7CUnknown%7CTWFpbG=
Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C=
2000&amp;amp;sdata=3DfMUdSU3YPOnF3kyWXBENHZwHuTno6sD5IYYGyOIfPIE%3D&amp;amp=
;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugzil=
la.redhat.com%2Fshow_bug.cgi%3Fid%3D1002375&amp;amp;data=3D04%7C01%7Csaloni=
.jain%40kpit.com%7C25f5a4c6b3fc489bed4f08d87dc5d31b%7C3539451eb46e4a26a242f=
f61502855c7%7C0%7C0%7C637397636705035614%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;amp;sda=
ta=3DfMUdSU3YPOnF3kyWXBENHZwHuTno6sD5IYYGyOIfPIE%3D&amp;amp;reserved=3D0</a=
><br>
&gt; <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Fbugs.debian.org%2Fcgi-bin%2Fbugreport.cgi%3Fbug%3D723717&amp;amp;=
data=3D04%7C01%7Csaloni.jain%40kpit.com%7C25f5a4c6b3fc489bed4f08d87dc5d31b%=
7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637397636705035614%7CUnknown%7=
CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0%3D%7C2000&amp;amp;sdata=3DouEoawaryiv19hn3dqZTVIzb%2BMUfwh8x0ScwU%2FkRh3k=
%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugs.d=
ebian.org%2Fcgi-bin%2Fbugreport.cgi%3Fbug%3D723717&amp;amp;data=3D04%7C01%7=
Csaloni.jain%40kpit.com%7C25f5a4c6b3fc489bed4f08d87dc5d31b%7C3539451eb46e4a=
26a242ff61502855c7%7C0%7C0%7C637397636705035614%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;=
amp;sdata=3DouEoawaryiv19hn3dqZTVIzb%2BMUfwh8x0ScwU%2FkRh3k%3D&amp;amp;rese=
rved=3D0</a><br>
&gt; <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Fubuntu.com%2Fsecurity%2Fnotices%2FUSN-1953-1&amp;amp;data=3D04%7C=
01%7Csaloni.jain%40kpit.com%7C25f5a4c6b3fc489bed4f08d87dc5d31b%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637397636705035614%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&=
amp;amp;sdata=3DtgcgxBMJGNwLIw3TJT%2BrorfdXWtpSwVsh3Xy0r%2BHpF4%3D&amp;amp;=
reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fubuntu=
.com%2Fsecurity%2Fnotices%2FUSN-1953-1&amp;amp;data=3D04%7C01%7Csaloni.jain=
%40kpit.com%7C25f5a4c6b3fc489bed4f08d87dc5d31b%7C3539451eb46e4a26a242ff6150=
2855c7%7C0%7C0%7C637397636705035614%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA=
wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;amp;sdata=3D=
tgcgxBMJGNwLIw3TJT%2BrorfdXWtpSwVsh3Xy0r%2BHpF4%3D&amp;amp;reserved=3D0</a>=
<br>
&gt; <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Fwww.security-database.com%2Fdetail.php%3Falert%3DCVE-2013-4288&am=
p;amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C25f5a4c6b3fc489bed4f08d87dc=
5d31b%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637397636705035614%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C2000&amp;amp;sdata=3DP77GHoAW4eB3u2VyW4k%2FMPYBTfvjVzsWPtpZUj1=
Ejfc%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.se=
curity-database.com%2Fdetail.php%3Falert%3DCVE-2013-4288&amp;amp;data=3D04%=
7C01%7Csaloni.jain%40kpit.com%7C25f5a4c6b3fc489bed4f08d87dc5d31b%7C3539451e=
b46e4a26a242ff61502855c7%7C0%7C0%7C637397636705035614%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C200=
0&amp;amp;sdata=3DP77GHoAW4eB3u2VyW4k%2FMPYBTfvjVzsWPtpZUj1Ejfc%3D&amp;amp;=
reserved=3D0</a><br>
&gt; <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Fvuldb.com%2F%3Fid.65188&amp;amp;data=3D04%7C01%7Csaloni.jain%40kp=
it.com%7C25f5a4c6b3fc489bed4f08d87dc5d31b%7C3539451eb46e4a26a242ff61502855c=
7%7C0%7C0%7C637397636705035614%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAi=
LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;amp;sdata=3DnSk%2=
BwIN2icHGMAGGgkgHRq5afxdHmirx8hvB3KkqOG0%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fvuldb.=
com%2F%3Fid.65188&amp;amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C25f5a4c=
6b3fc489bed4f08d87dc5d31b%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6373=
97636705035614%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi=
LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;amp;sdata=3DnSk%2BwIN2icHGMAGGgkg=
HRq5afxdHmirx8hvB3KkqOG0%3D&amp;amp;reserved=3D0</a><br>
&gt;<br>
&gt; The references on above links claims that upgrading to stable release=
s eliminates this vulnerability.<br>
&gt;<br>
&gt; Regards,<br>
&gt; Saloni Jain<br>
&gt;<br>
&gt; This message contains information that may be privileged or confident=
ial and is the property of the KPIT Technologies Ltd. It is intended only f=
or the person to whom it is addressed. If you are not the intended recipien=
t, you are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part the=
reof. If you receive this message in error, please notify the sender immedi=
ately and delete all copies of this message. KPIT Technologies Ltd. does no=
t accept any liability for virus
 infected mails.<br>
&gt;<br>
&gt; <br>
&gt;<br>
</div>
</span></font></div>
This message contains information that may be privileged or confidential a=
nd is the property of the KPIT Technologies Ltd. It is intended only for th=
e person to whom it is addressed. If you are not the intended recipient, yo=
u are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part the=
reof. If you receive this message in error, please notify the sender immedi=
ately and delete all copies of this message. KPIT Technologies Ltd. does no=
t accept any liability for virus
 infected mails.
</body>
</html>

--_000_BM1PR01MB40194C9655979CC836DBDC7387120BM1PR01MB4019INDP_--
