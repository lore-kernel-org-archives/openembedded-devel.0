Return-Path: <throos@amazon.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48DDFC19F2A
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 11:42:09 +0000 (UTC)
Received: from smtp-fw-33001.amazon.com (smtp-fw-33001.amazon.com
 [207.171.190.10])
 by mx.groups.io with SMTP id smtpd.web09.5338.1660218127846402042
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Aug 2022 04:42:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=VOSjqrAh;
 spf=pass (domain: amazon.de, ip: 207.171.190.10,
 mailfrom: prvs=215e12356=throos@amazon.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1660218128; x=1691754128;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=dnqVv8mPkhgYn6iZWAi2nH5+48FdnL+FW/ERt4Q79Yw=;
  b=VOSjqrAh6Uy7t6ik8OB9hM/kG4cnjhcfLhommaiE70giEVH7bmy6ZBOO
   mRxTGdzMz/jGnyFN+6bvJfu9Uwb1y006wOWWoVlGC1mOdLoTrYu1tE3dI
   F+bDqIG7V+6blb0wsp2Vd/ldi1xX8oO29l8ghTfh3lwjQhhDV00OTmLeB
   s=;
X-IronPort-AV: E=Sophos;i="5.93,228,1654560000";
   d="scan'208,217";a="217120833"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2a-2dbf0206.us-west-2.amazon.com) ([10.43.8.6])
  by smtp-border-fw-33001.sea14.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2022 11:41:51 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
	by email-inbound-relay-pdx-2a-2dbf0206.us-west-2.amazon.com (Postfix) with
 ESMTPS id 9F15AA28F8
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Aug 2022 11:41:49 +0000 (UTC)
Received: from EX13D30UWB001.ant.amazon.com (10.43.161.80) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1497.36; Thu, 11 Aug 2022 11:41:49 +0000
Received: from EX13D16EUA003.ant.amazon.com (10.43.165.51) by
 EX13D30UWB001.ant.amazon.com (10.43.161.80) with Microsoft SMTP Server (TLS)
 id 15.0.1497.36; Thu, 11 Aug 2022 11:41:48 +0000
Received: from EX13D16EUA003.ant.amazon.com ([10.43.165.51]) by
 EX13D16EUA003.ant.amazon.com ([10.43.165.51]) with mapi id 15.00.1497.036;
 Thu, 11 Aug 2022 11:41:47 +0000
From: "Roos, Thomas" <throos@amazon.de>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "Glimsdale, Nathan" <glimsdal@amazon.com>
Subject: yocto-check-layer errors in meta-python (gatesgarth and hardknott
 release)
Thread-Topic: yocto-check-layer errors in meta-python (gatesgarth and
 hardknott release)
Thread-Index: AQHYrXdWPXiWDhGLQkuBn73h96zgOw==
Date: Thu, 11 Aug 2022 11:41:47 +0000
Message-ID: <1660218106833.79133@amazon.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.161.199]
Content-Type: multipart/alternative;
	boundary="_000_166021810683379133amazonde_"
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Aug 2022 11:42:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98196

--_000_166021810683379133amazonde_
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

we (meta-aws) like to get "Yocto Project Compatible" status for gatesgarth =
and hardknott, but yocto-check-layer errors on dependend layers (meta-pytho=
n) do not allow us to get the status.

- is there any chance that they will be fixed in gatesgarth and hardknott?

- do we have other possibilities?

Error logs: https://bpa.st/BTNA

Cheers,

Thomas



Amazon Web Services EMEA SARL
38 avenue John F. Kennedy, L-1855 Luxembourg
Sitz der Gesellschaft: L-1855 Luxemburg
eingetragen im Luxemburgischen Handelsregister unter R.C.S. B186284

Amazon Web Services EMEA SARL, Niederlassung Deutschland
Marcel-Breuer-Str. 12, D-80807 Muenchen
Sitz der Zweigniederlassung: Muenchen
eingetragen im Handelsregister des Amtsgerichts Muenchen unter HRB 242240, =
USt-ID DE317013094




--_000_166021810683379133amazonde_
Content-Type: text/html; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none"><!--P{margin-top:0;margin-b=
ottom:0;} --></style>
</head>
<body dir=3D"ltr" style=3D"font-size:12pt;color:#000000;background-color:#F=
FFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<p>Hi,</p>
<p>we (meta-aws) like to get &quot;Yocto Project Compatible&quot; status fo=
r gatesgarth and&nbsp;hardknott, but yocto-check-layer errors on dependend =
layers (meta-python) do not allow us to&nbsp;get the status.</p>
<p>- is there any chance that they will be fixed in gatesgarth and hardknot=
t?</p>
<p>- do we have other possibilities?<br>
<br>
Error logs: <a href=3D"https://bpa.st/BTNA">https://bpa.st/BTNA</a><br>
<br>
Cheers,</p>
<p>Thomas<br>
</p>
<br><br><br>Amazon Web Services EMEA SARL
<br>38 avenue John F. Kennedy, L-1855 Luxembourg
<br>Sitz der Gesellschaft: L-1855 Luxemburg
<br>eingetragen im Luxemburgischen Handelsregister unter R.C.S. B186284
<br>
<br>Amazon Web Services EMEA SARL, Niederlassung Deutschland
<br>Marcel-Breuer-Str. 12, D-80807 Muenchen
<br>Sitz der Zweigniederlassung: Muenchen
<br>eingetragen im Handelsregister des Amtsgerichts Muenchen unter HRB 2422=
40, USt-ID DE317013094
<br><br><br>
</body>
</html>

--_000_166021810683379133amazonde_--


