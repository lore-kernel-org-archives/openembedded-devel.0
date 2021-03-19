Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.45])
 by mx.groups.io with SMTP id smtpd.web11.6235.1616160708593305010
 for <Openembedded-devel@lists.openembedded.org>;
 Fri, 19 Mar 2021 06:31:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=GVB6aEKp;
 spf=pass (domain: kpit.com, ip: 40.107.138.45, mailfrom: sana.kazi@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eDD4b/WGKOnah65xA1T99e/5hK/2fcqZ0tid3DKLugBK6r35dqsK4u8/InMGqqidJpCkrgQTGb5G5SKmSMy09dH6Qr6IpYWZHlu8euQQq/HugiOViVlLx7C2R6U0QswUXKWT5f7yns6y93SHwTbExTKOrG/Wu+REN5L1YG82U0//v0WdB3vFLp/wxA2oyA6BnKfKI5hl9RIVvNKUUZeav5mpGybsKQUCsZ3qMzdCN8FzJ/6txnQ4ytllb/4ySBp3Ql2w+W5TiV385v/UZhvyHMOqEfSl+9+vCbpM9xPpmZcbpYjeYBRCAsc+svUZzqSWe64quwAHveyeWxfG8qIazA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcVwcQbiU9rGbUeUc1pkTIG/4svy1W2tAFrUE15QkIQ=;
 b=G/TUcc/09uf/21GvaXDYyyF9FsYlAYHNw384tf/Iv2Zdh2h0VwlvprZ0htzX5SMmTDUGqt47H2DfdXhcb9S8ITBuKQFUGdZtvR+wxZOUZ9BlDwYu1Z3LNj4QizvFmRi/wmpnkeaU8mxiG+hdOiQGwlT4P9rg2VAESi6xtfqVOV0S5HInPmiuumQSyJrkrWBO6dN+CcqHZt0u9jq7eoHqOJmdd71tNu9MEkIjBtjFQS56A3SNddBTr80G0ge0dpuD1qecHSUGsfynTl1L4J5IfB+YMFbzrc1I+lVvsJOnsavPo2U8SmEZUiXaqEAobEzszVBFMGgX9o2WuwC4GAj0ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcVwcQbiU9rGbUeUc1pkTIG/4svy1W2tAFrUE15QkIQ=;
 b=GVB6aEKpGl0R2z9BB9DDFs82lHV5TEB1WUU+r7VrYjvBiRWyO4AZFdGHCVoASoVk+dxutBHAYlYh0IbdrBOzt1S2SEF3MRuDvMZOacYNcyacp856fclVrOXeN/uE5bOG0Jj8dXlt0p4nGQsoyLUjIIHZTbycOzNH/mDHWMOAK6s=
Received: from BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:58::17)
 by BMXPR01MB0631.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 13:31:37 +0000
Received: from BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6922:7ba0:39e9:85da]) by BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6922:7ba0:39e9:85da%7]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 13:31:36 +0000
From: "Sana Kazi" <Sana.Kazi@kpit.com>
To: "Openembedded-devel@lists.openembedded.org"
	<Openembedded-devel@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Subject: Re: [meta-networking][meta-oe][master][dunfell][PATCH] mdns: Whitelisted CVE-2007-0613 for mdns
Thread-Topic: [meta-networking][meta-oe][master][dunfell][PATCH] mdns:
 Whitelisted CVE-2007-0613 for mdns
Thread-Index: AQHXFK59VajwF5lYP0Crt62Z8CX2OKqLXsDs
Date: Fri, 19 Mar 2021 13:31:36 +0000
Message-ID: 
 <BMXPR01MB3221CE7ACA0211ED19B9164399689@BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM>
References: <20210309063513.10410-1-Sana.Kazi@kpit.com>
In-Reply-To: <20210309063513.10410-1-Sana.Kazi@kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
x-originating-ip: [2402:8100:3009:ae72:adea:9e12:68eb:4256]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2bde08e4-09c6-4638-85f9-08d8eadb51ee
x-ms-traffictypediagnostic: BMXPR01MB0631:
x-microsoft-antispam-prvs: 
 <BMXPR01MB063121F062D194C90A27FC4399689@BMXPR01MB0631.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +z3Kgh3tXtKciQjc1ddsCnYyJS8n+eMg9AebjsheJtSR6Ck/vKU++IDTQs36ZqVAlyfMwQ+HmG5kpsO84WG+v0kRDnq9Q0af6Ctofro4hyxdWIAvUEAkmGOX6d3NMQ753umE/MlawjxvHnPhcBSnT8ZXEd2aLkAFoa2THsynz5Ny/JXGSJ7lHi+KwJZ+UMQizGi9mTsAx2zIYRdv7FdgblCs4xN+mWW/cLDPGekHXQtZJbZBf151l7pZk4f2TiBT+GnBtIlXS+DPFURi5W5JVkZ2RWrfv52sbSr5RA+TYmMLmSvqgySZDRfYw20BHZ5DWCeJE9FBtX1SCI313VHf7dLKxN1AR6l8D87TkOC0Q6Kxgb4ouENVajlUHy0gtlLpCWUJyZS5qYeCz7Sd7Z6jBjIRxVYIFHcgZJudovUcXug3KSyDkFfv3KDY7WQz2nLDDy0L2BzvyP13mhX5ZkLZd8E2vFj6WS4JXJgO5ZdFCd6yG3+TGBhSdQyYwsYmk2CcqDt16fTRLPZkIj4VbfIPo5KmcDW1FCOrEopRygugQlZPMO4GVb7EPhDL+p34+tP3tOBmeohrDf2iI99HkHXXqLmxfXU65Bw3HiyABp29V6V08ke+NJYvKsB9W40ydCKpHeeRfnPlst4NK4qU9TaWwYHMH/waDoNRYmqxZCd31UAbOUOhHvvbqzf4s7RjexrCzqQg47eORln3hHfabZqzg2GXHP92BcEwkuWoi2zOa3Q=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(38100700001)(86362001)(83380400001)(166002)(186003)(33656002)(6506007)(316002)(110136005)(5660300002)(19627405001)(8936002)(2906002)(66574015)(8676002)(71200400001)(76116006)(7696005)(66476007)(55016002)(64756008)(53546011)(66446008)(66556008)(9686003)(478600001)(66946007)(966005)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?X2UvBuRLnh7KAFIgBeJZPEA6kT+H+EyPQQ8hragE5XeN2Wknl2ojvxSA4E?=
 =?iso-8859-1?Q?c3bUfNxxrVyOLpaZz0Z6wXb2oPAcaTxMR/Wo0eYDkaUhT+WJUC9ECgzkBN?=
 =?iso-8859-1?Q?w3TqTqe6Fntjhh/vHYWXf9aiwwKsXpNB5mfIPl+msJ/rZnZOI7EKlbI0u2?=
 =?iso-8859-1?Q?1eRuwtC3hPgz0U/AnIQL3Zdn1cbRctBGBcm3VrC3bL9jcVjVUPOo6/DXFi?=
 =?iso-8859-1?Q?tNBa5b0AdRJhhY4K0Hq0Qdx+M1JApVwxecwHOTXLQoZhoYUggY/hD3+Bzo?=
 =?iso-8859-1?Q?OPaBv1zOg/M1ST4MP1Zdo9x5ypplGRDSoKGtzqi3QEnE3364XAkfY/aZBo?=
 =?iso-8859-1?Q?QKxD8rVE3r5hAAhhzqqJck5e12fi9BeB/D6CaDqfskIxWyOkBEMpRp4g7M?=
 =?iso-8859-1?Q?Rc2oJQzRZDL0yrsDYb65bU4Aj89ePAeSS3iXgKKsgzdhxW/25u5FkFlmB2?=
 =?iso-8859-1?Q?Kh4pHTe8PzDKzMFe0048CQuDbRDQ3euxjezRnZkLjmKXoztKqNUgbDPbZw?=
 =?iso-8859-1?Q?167miv25/a82v//QpQMHB4nAz4KheOXa8BQx/wJ+Ga6nZVOs7F5aBHk0dI?=
 =?iso-8859-1?Q?qCcuAVxhUuDta7ly/FxuLLbeEo2gOXfwuhAY6uoGQS+azYFLXJbPi0IDmx?=
 =?iso-8859-1?Q?cGbupClqCOjhv1+AX3XQEck8YCF6R/smTxz9Tad/Exsn3s6v5tJcW24OOB?=
 =?iso-8859-1?Q?x8QHhGu8+yb3D6u6mFPkD62AWRH+rB9xLRkQzNHGKlZ4FLZU8+fM/FWoIg?=
 =?iso-8859-1?Q?TNRSJuc80cOcGkRhFNnwgjG9TwJcTF4MdSXSX2+S/l9FgQysJvnCae9Vrg?=
 =?iso-8859-1?Q?xhJUah4lmIl+JSeaDurXB+MbV1TEJII5ZpfBdCaW00tmfbq29edsbV/H3t?=
 =?iso-8859-1?Q?i6hvyg8hjKG7DSZklLRUxlOTTbWQyZ6JURwecpguL9IsOLaVw3Lk6mDlOB?=
 =?iso-8859-1?Q?i4U1INfRkuQ+mkS3iclnr8xzh705NFtADSBXYxumgElwqst85Xlwlf8RG2?=
 =?iso-8859-1?Q?4R5II3Hcg56l6InqNrf7pnb0QCRSu8kDIEECoVrOTknWS3Vu6/RtThWTYV?=
 =?iso-8859-1?Q?X2FL6fkmW29nHzQvsUCibxUuYiMe8bTYxDpaVpvaUh4OMWS3Wtp9HrRc/s?=
 =?iso-8859-1?Q?gT8Tmz88h8KOPF3Dnm40L50pKUjf76G326ojjOZdTZGvGmuSrlB2v+WDq1?=
 =?iso-8859-1?Q?U05Bu2YiqcJFHsEkANZnWYLgLRabz5zhnDh9qXlGh91WllOGaqHPWXz+BZ?=
 =?iso-8859-1?Q?bsbzgYYcn+gPCDnEablUN9XT23BpdUKf0DQKEmemEd1pQHevupMcq8wY23?=
 =?iso-8859-1?Q?V3fRG+cbsolwDpjpy3D34M83dCsAZAm15/4VFaihijCDx5Ce76AxPr7meM?=
 =?iso-8859-1?Q?ZKkFFm5q5/CKPBpoZ6S3PYHCCgsBj3MQWaIpNEDrnFl5r1+nHmwMOmcSEa?=
 =?iso-8859-1?Q?i64h1HakXw7VMo+J?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bde08e4-09c6-4638-85f9-08d8eadb51ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2021 13:31:36.0932
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3CpEgdSH1V3yC++I19U4hfKyqA2ctnUY6MBb+U4ZHdaAJ7LTm//7Fh+ChROiiUKp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB0631
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB3221CE7ACA0211ED19B9164399689BMXPR01MB3221INDP_"

--_000_BMXPR01MB3221CE7ACA0211ED19B9164399689BMXPR01MB3221INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Team,

Could you please review below patch to be upstreamed for mdns


 Thanks & Regards,

 Sana Kazi
 KPIT Technologies Limited


________________________________
From: Sana Kazi <Sana.Kazi@kpit.com>
Sent: Tuesday, March 9, 2021 12:06 PM
To: Openembedded-devel@lists.openembedded.org <Openembedded-devel@lists.ope=
nembedded.org>; raj.khem@gmail.com <raj.khem@gmail.com>
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>; Aditya Tayade <Aditya.Tayade@=
kpit.com>; Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
Subject: [meta-networking][meta-oe][master][dunfell][PATCH] mdns: Whitelist=
ed CVE-2007-0613 for mdns

CVE-2007-0613 is not applicable as it only affects Apple products
i.e. ichat,mdnsresponder, instant message framework and MacOS.
Also, https://www.exploit-db.com/exploits/3230 shows the part of code
affected by CVE-2007-0613 which is not preset in upstream source code.
Hence, CVE-2007-0613 does not affect other Yocto implementations and
is not reported for other distros can be marked whitelisted.
Links:
https://vulmon.com/vulnerabilitydetails?qid=3DCVE-2007-0613
https://www.incibe-cert.es/en/early-warning/vulnerabilities/cve-2007-0613
https://security-tracker.debian.org/tracker/CVE-2007-0613
https://ubuntu.com/security/CVE-2007-0613
https://vulmon.com/vulnerabilitydetails?qid=3DCVE-2007-0613
---
 .../recipes-protocols/mdns/mdns_1310.40.42.bb       | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb b/me=
ta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb
index 445ed87e4..60bc26bf1 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb
@@ -27,6 +27,19 @@ SRC_URI[sha256sum] =3D "bea29e1616cd56ccb8f88c0fad2bcdc4=
031f4deb2d899c793e2f27a838

 CVE_PRODUCT =3D "apple:mdnsresponder"

+# CVE-2007-0613 is not applicable as it only affects Apple products
+# i.e. ichat,mdnsresponder, instant message framework and MacOS.
+# Also, https://www.exploit-db.com/exploits/3230 shows the part of code
+# affected by CVE-2007-0613 which is not preset in upstream source code.
+# Hence, CVE-2007-0613 does not affect other Yocto implementations and
+# is not reported for other distros can be marked whitelisted.
+# Links:
+# https://vulmon.com/vulnerabilitydetails?qid=3DCVE-2007-0613
+# https://www.incibe-cert.es/en/early-warning/vulnerabilities/cve-2007-061=
3
+# https://security-tracker.debian.org/tracker/CVE-2007-0613
+# https://vulmon.com/vulnerabilitydetails?qid=3DCVE-2007-0613
+CVE_CHECK_WHITELIST +=3D "CVE-2007-0613"
+
 PARALLEL_MAKE =3D ""

 S =3D "${WORKDIR}/mDNSResponder-${PV}/mDNSPosix"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_BMXPR01MB3221CE7ACA0211ED19B9164399689BMXPR01MB3221INDP_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Team,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Could you please review below patch to be upstreamed for mdns</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div></div>
<div name=3D"divtagdefaultwrapper" style=3D"font-family:Calibri,Arial,Helve=
tica,sans-serif; font-size:; margin:0">
<div><br>
<span style=3D"color:rgb(81,167,249)"></span></div>
<div></div>
<div style=3D"text-align:start; background-color:rgb(255,255,255); font-siz=
e:11pt; font-family:Calibri,sans-serif; margin:0px">
<span lang=3D"en-IN" style=3D"margin:0px; font-size:9pt; font-family:Arial,=
sans-serif; color:rgb(81,167,249); background-color:white"></span><span sty=
le=3D"margin:0px; font-size:10pt; font-family:Arial,sans-serif; background-=
color:white"><span style=3D"color:black; margin:0px; font-size:10pt; backgr=
ound-color:white">&nbsp;</span><span style=3D"margin:0px; font-size:10pt; b=
ackground-color:white"><font color=3D"#003366">Thanks
 &amp; Regards,</font></span></span><span style=3D"margin:0px; font-size:12=
pt; font-family:Arial,sans-serif; color:black; background-color:white"></sp=
an></div>
<div style=3D"margin:0px; font-size:15px; text-align:start; background-colo=
r:rgb(255,255,255)">
<p style=3D"font-size:11pt; font-family:Calibri,sans-serif; margin:0px"><sp=
an style=3D"margin:0px; font-size:10pt; font-family:Arial,sans-serif; color=
:black; background-color:white">&nbsp;</span><span style=3D"margin:0px; fon=
t-size:10pt; font-family:Arial,sans-serif; color:rgb(0,51,102); background-=
color:white">Sana
 Kazi<br>
<span style=3D"color:rgb(0,51,102); font-family:Arial,sans-serif; font-size=
:10pt">&nbsp;KPIT Technologies Limited</span><br>
</span></p>
</div>
<div><br>
</div>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Sana Kazi &lt;Sana.Ka=
zi@kpit.com&gt;<br>
<b>Sent:</b> Tuesday, March 9, 2021 12:06 PM<br>
<b>To:</b> Openembedded-devel@lists.openembedded.org &lt;Openembedded-devel=
@lists.openembedded.org&gt;; raj.khem@gmail.com &lt;raj.khem@gmail.com&gt;<=
br>
<b>Cc:</b> Nisha Parrakat &lt;Nisha.Parrakat@kpit.com&gt;; Aditya Tayade &l=
t;Aditya.Tayade@kpit.com&gt;; Harpritkaur Bhandari &lt;Harpritkaur.Bhandari=
@kpit.com&gt;<br>
<b>Subject:</b> [meta-networking][meta-oe][master][dunfell][PATCH] mdns: Wh=
itelisted CVE-2007-0613 for mdns</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">CVE-2007-0613 is not applicable as it only affects=
 Apple products<br>
i.e. ichat,mdnsresponder, instant message framework and MacOS.<br>
Also, <a href=3D"https://www.exploit-db.com/exploits/3230">https://www.expl=
oit-db.com/exploits/3230</a> shows the part of code<br>
affected by CVE-2007-0613 which is not preset in upstream source code.<br>
Hence, CVE-2007-0613 does not affect other Yocto implementations and<br>
is not reported for other distros can be marked whitelisted.<br>
Links:<br>
<a href=3D"https://vulmon.com/vulnerabilitydetails?qid=3DCVE-2007-0613">htt=
ps://vulmon.com/vulnerabilitydetails?qid=3DCVE-2007-0613</a><br>
<a href=3D"https://www.incibe-cert.es/en/early-warning/vulnerabilities/cve-=
2007-0613">https://www.incibe-cert.es/en/early-warning/vulnerabilities/cve-=
2007-0613</a><br>
<a href=3D"https://security-tracker.debian.org/tracker/CVE-2007-0613">https=
://security-tracker.debian.org/tracker/CVE-2007-0613</a><br>
<a href=3D"https://ubuntu.com/security/CVE-2007-0613">https://ubuntu.com/se=
curity/CVE-2007-0613</a><br>
<a href=3D"https://vulmon.com/vulnerabilitydetails?qid=3DCVE-2007-0613">htt=
ps://vulmon.com/vulnerabilitydetails?qid=3DCVE-2007-0613</a><br>
---<br>
&nbsp;.../recipes-protocols/mdns/mdns_1310.40.42.bb&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | 13 +++++++++++++<br>
&nbsp;1 file changed, 13 insertions(+)<br>
<br>
diff --git a/meta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb b/me=
ta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb<br>
index 445ed87e4..60bc26bf1 100644<br>
--- a/meta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb<br>
+++ b/meta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb<br>
@@ -27,6 +27,19 @@ SRC_URI[sha256sum] =3D &quot;bea29e1616cd56ccb8f88c0fad2=
bcdc4031f4deb2d899c793e2f27a838<br>
&nbsp;<br>
&nbsp;CVE_PRODUCT =3D &quot;apple:mdnsresponder&quot;<br>
&nbsp;<br>
+# CVE-2007-0613 is not applicable as it only affects Apple products<br>
+# i.e. ichat,mdnsresponder, instant message framework and MacOS.<br>
+# Also, <a href=3D"https://www.exploit-db.com/exploits/3230">https://www.e=
xploit-db.com/exploits/3230</a> shows the part of code<br>
+# affected by CVE-2007-0613 which is not preset in upstream source code.<b=
r>
+# Hence, CVE-2007-0613 does not affect other Yocto implementations and<br>
+# is not reported for other distros can be marked whitelisted.<br>
+# Links:<br>
+# <a href=3D"https://vulmon.com/vulnerabilitydetails?qid=3DCVE-2007-0613">=
https://vulmon.com/vulnerabilitydetails?qid=3DCVE-2007-0613</a><br>
+# <a href=3D"https://www.incibe-cert.es/en/early-warning/vulnerabilities/c=
ve-2007-0613">
https://www.incibe-cert.es/en/early-warning/vulnerabilities/cve-2007-0613</=
a><br>
+# <a href=3D"https://security-tracker.debian.org/tracker/CVE-2007-0613">ht=
tps://security-tracker.debian.org/tracker/CVE-2007-0613</a><br>
+# <a href=3D"https://vulmon.com/vulnerabilitydetails?qid=3DCVE-2007-0613">=
https://vulmon.com/vulnerabilitydetails?qid=3DCVE-2007-0613</a><br>
+CVE_CHECK_WHITELIST +=3D &quot;CVE-2007-0613&quot;<br>
+<br>
&nbsp;PARALLEL_MAKE =3D &quot;&quot;<br>
&nbsp;<br>
&nbsp;S =3D &quot;${WORKDIR}/mDNSResponder-${PV}/mDNSPosix&quot;<br>
-- <br>
2.17.1<br>
<br>
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

--_000_BMXPR01MB3221CE7ACA0211ED19B9164399689BMXPR01MB3221INDP_--
