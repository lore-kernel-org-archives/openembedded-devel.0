Return-Path: <throos@amazon.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34457C46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 15:01:21 +0000 (UTC)
Received: from smtp-fw-80008.amazon.com (smtp-fw-80008.amazon.com [99.78.197.219])
 by mx.groups.io with SMTP id smtpd.web10.18791.1704812476936721035
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jan 2024 07:01:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=E/sCLP0t;
 spf=pass (domain: amazon.de, ip: 99.78.197.219, mailfrom: prvs=73170cd5c=throos@amazon.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1704812477; x=1736348477;
  h=from:to:date:message-id:references:in-reply-to:
   mime-version:subject;
  bh=5k34ulCcxgkmk+6wg+gYxV5ncvMehBQFTCUJx627f2A=;
  b=E/sCLP0tAimyHqP0TyY3dURyxAF3frN03R8CBHSDpTKJ7BI/mRHZZB0L
   HursT0cI2WuvhPwsASbdN5eQbBMgz/Vk2sHOHPL88VTGGdhLFCOfXq7Hc
   G5xLIMUe8H48gOFIsYLR57HEVlHS9uhOnRwy/TOil5fYDsyAdcbGff/Oe
   Y=;
X-IronPort-AV: E=Sophos;i="6.04,183,1695686400"; 
   d="scan'208,217";a="56999870"
Subject: AW: [oe] [PATCH] abseil-cpp: readd use of -std=c++14
Thread-Topic: [oe] [PATCH] abseil-cpp: readd use of -std=c++14
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO email-inbound-relay-iad-1e-m6i4x-529f0975.us-east-1.amazon.com) ([10.25.36.214])
  by smtp-border-fw-80008.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 15:01:13 +0000
Received: from smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev (iad7-ws-svc-p70-lb3-vlan3.iad.amazon.com [10.32.235.38])
	by email-inbound-relay-iad-1e-m6i4x-529f0975.us-east-1.amazon.com (Postfix) with ESMTPS id E314E4A1BD;
	Tue,  9 Jan 2024 15:01:12 +0000 (UTC)
Received: from EX19MTAEUC002.ant.amazon.com [10.0.43.254:47181]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.36.99:2525] with esmtp (Farcaster)
 id 7a30f97c-adac-4e71-85db-5e88fb5a39e8; Tue, 9 Jan 2024 15:01:11 +0000 (UTC)
X-Farcaster-Flow-ID: 7a30f97c-adac-4e71-85db-5e88fb5a39e8
Received: from EX19D016EUC003.ant.amazon.com (10.252.51.244) by
 EX19MTAEUC002.ant.amazon.com (10.252.51.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 9 Jan 2024 15:01:11 +0000
Received: from EX19D016EUC001.ant.amazon.com (10.252.51.169) by
 EX19D016EUC003.ant.amazon.com (10.252.51.244) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 9 Jan 2024 15:01:11 +0000
Received: from EX19D016EUC001.ant.amazon.com ([fe80::ffab:9491:d0b8:dbb6]) by
 EX19D016EUC001.ant.amazon.com ([fe80::ffab:9491:d0b8:dbb6%3]) with mapi id
 15.02.1118.040; Tue, 9 Jan 2024 15:01:11 +0000
From: "Roos, Thomas" <throos@amazon.de>
To: Petr Chernikov <p.chernikov@yadro.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Index: AQHaQvmGw+QJuQV4YEePASERyFIjsrDRdXFwgAACp/CAAAC5MIAAFNBb
Date: Tue, 9 Jan 2024 15:01:10 +0000
Message-ID: <f7360598b61448599bddcc3d0e7dc08e@amazon.de>
References: <20240109124350.206419-1-throos@amazon.de>
 <17A8B01D06ADC5D0.21327@lists.openembedded.org>
 <17A8B0A1D52DEE2E.21327@lists.openembedded.org>,<568fbf3b6dae4961bd2a23b435248ec1@yadro.com>
In-Reply-To: <568fbf3b6dae4961bd2a23b435248ec1@yadro.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.252.50.216]
Content-Type: multipart/alternative;
	boundary="_000_f7360598b61448599bddcc3d0e7dc08eamazonde_"
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 15:01:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108197

--_000_f7360598b61448599bddcc3d0e7dc08eamazonde_
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Hi,
good news - I could solve this problem by patching out the hardcoded -std=
=3Dc++14 in our software (meta-aws).
Sorry for the noise.
Please ignore this patch.

Cheers,
Thomas


________________________________
Von: Petr Chernikov <p.chernikov@yadro.com>
Gesendet: Dienstag, 9. Januar 2024 14:26:20
An: Petr Chernikov; Roos, Thomas; openembedded-devel@lists.openembedded.org
Betreff: RE: [EXTERNAL] [oe] [PATCH] abseil-cpp: readd use of -std=3Dc++14

CAUTION: This email originated from outside of the organization. Do not cli=
ck links or open attachments unless you can confirm the sender and know the=
 content is safe.



Sorry, typo, on the master branch

Regards
Pete

-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Petr Chernikov
Sent: Tuesday, January 9, 2024 4:24 PM
To: Petr Chernikov <p.chernikov@yadro.com>; throos@amazon.de; openembedded-=
devel@lists.openembedded.org
Subject: Re: [oe] [PATCH] abseil-cpp: readd use of -std=3Dc++14

Also I'm able to compile protobuf and protobuf-native without any changes o=
n nanbield branch

Regards
Pete

-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Petr Chernikov
Sent: Tuesday, January 9, 2024 4:15 PM
To: throos@amazon.de; openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH] abseil-cpp: readd use of -std=3Dc++14

Perhaps, better solution is to use c++17 for both packages:
https://github.com/protocolbuffers/protobuf/issues/10768#issuecomment-17731=
75439

Regards
Pete

-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Thomas Roos via lists.openembedded.org
Sent: Tuesday, January 9, 2024 3:44 PM
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Roos <throos@amazon.de>
Subject: [oe] [PATCH] abseil-cpp: readd use of -std=3Dc++14

From: Thomas Roos <throos@amazon.de>

Protobuf is compiled with -std=3Dc++14, so abseil-cpp must be as well.
Details can be found here: https://github.com/protocolbuffers/protobuf/issu=
es/10768

Signed-off-by: Thomas Roos <throos@amazon.de>
---
 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-o=
e/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
index ee62d4b59..1a713e1c5 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
@@ -26,6 +26,7 @@ ASNEEDED:class-nativesdk =3D ""
 inherit cmake

 EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON \
+                 -DCMAKE_CXX_STANDARD=3D14 \
                  -DBUILD_TESTING=3DOFF    \
                  -DABSL_ENABLE_INSTALL=3DON \
                 "
--
2.34.1




Amazon Web Services EMEA SARL
38 avenue John F. Kennedy, L-1855 Luxembourg Sitz der Gesellschaft: L-1855 =
Luxemburg eingetragen im Luxemburgischen Handelsregister unter R.C.S. B1862=
84

Amazon Web Services EMEA SARL, Niederlassung Deutschland Marcel-Breuer-Str.=
 12, D-80807 Muenchen Sitz der Zweigniederlassung: Muenchen eingetragen im =
Handelsregister des Amtsgerichts Muenchen unter HRB 242240, USt-ID DE317013=
094







Amazon Web Services EMEA SARL
38 avenue John F. Kennedy, L-1855 Luxembourg
Sitz der Gesellschaft: L-1855 Luxemburg
eingetragen im Luxemburgischen Handelsregister unter R.C.S. B186284

Amazon Web Services EMEA SARL, Niederlassung Deutschland
Marcel-Breuer-Str. 12, D-80807 Muenchen
Sitz der Zweigniederlassung: Muenchen
eingetragen im Handelsregister des Amtsgerichts Muenchen unter HRB 242240, =
USt-ID DE317013094




--_000_f7360598b61448599bddcc3d0e7dc08eamazonde_
Content-Type: text/html; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p><br>
</p>
<meta content=3D"text/html; charset=3DUTF-8">
<div dir=3D"ltr">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size: 12pt; co=
lor: rgb(0, 0, 0); font-family: Calibri, Helvetica, sans-serif, &quot;Emoji=
Font&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, Noto=
ColorEmoji, &quot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSy=
mbols;">
<p>Hi,<br>
good news - I could solve this problem by patching out the hardcoded <font =
face=3D"Calibri, sans-serif" color=3D"#000000" style=3D"font-size:11pt">
-std=3Dc&#43;&#43;14</font> in our software (meta-aws).<br>
Sorry for the noise.<br>
Please ignore this patch.<br>
<br>
Cheers,<br>
Thomas<br>
<br>
</p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>Von:</b> Petr Chernikov &lt;p=
.chernikov@yadro.com&gt;<br>
<b>Gesendet:</b> Dienstag, 9. Januar 2024 14:26:20<br>
<b>An:</b> Petr Chernikov; Roos, Thomas; openembedded-devel@lists.openembed=
ded.org<br>
<b>Betreff:</b> RE: [EXTERNAL] [oe] [PATCH] abseil-cpp: readd use of -std=
=3Dc&#43;&#43;14</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt">
<div class=3D"PlainText">CAUTION: This email originated from outside of the=
 organization. Do not click links or open attachments unless you can confir=
m the sender and know the content is safe.<br>
<br>
<br>
<br>
Sorry, typo, on the master branch<br>
<br>
Regards<br>
Pete<br>
<br>
-----Original Message-----<br>
From: openembedded-devel@lists.openembedded.org &lt;openembedded-devel@list=
s.openembedded.org&gt; On Behalf Of Petr Chernikov<br>
Sent: Tuesday, January 9, 2024 4:24 PM<br>
To: Petr Chernikov &lt;p.chernikov@yadro.com&gt;; throos@amazon.de; openemb=
edded-devel@lists.openembedded.org<br>
Subject: Re: [oe] [PATCH] abseil-cpp: readd use of -std=3Dc&#43;&#43;14<br>
<br>
Also I'm able to compile protobuf and protobuf-native without any changes o=
n nanbield branch<br>
<br>
Regards<br>
Pete<br>
<br>
-----Original Message-----<br>
From: openembedded-devel@lists.openembedded.org &lt;openembedded-devel@list=
s.openembedded.org&gt; On Behalf Of Petr Chernikov<br>
Sent: Tuesday, January 9, 2024 4:15 PM<br>
To: throos@amazon.de; openembedded-devel@lists.openembedded.org<br>
Subject: Re: [oe] [PATCH] abseil-cpp: readd use of -std=3Dc&#43;&#43;14<br>
<br>
Perhaps, better solution is to use c&#43;&#43;17 for both packages:<br>
<a href=3D"https://github.com/protocolbuffers/protobuf/issues/10768#issueco=
mment-1773175439" id=3D"LPlnk717461" previewremoved=3D"true">https://github=
.com/protocolbuffers/protobuf/issues/10768#issuecomment-1773175439</a><br>
<br>
Regards<br>
Pete<br>
<br>
-----Original Message-----<br>
From: openembedded-devel@lists.openembedded.org &lt;openembedded-devel@list=
s.openembedded.org&gt; On Behalf Of Thomas Roos via lists.openembedded.org<=
br>
Sent: Tuesday, January 9, 2024 3:44 PM<br>
To: openembedded-devel@lists.openembedded.org<br>
Cc: Thomas Roos &lt;throos@amazon.de&gt;<br>
Subject: [oe] [PATCH] abseil-cpp: readd use of -std=3Dc&#43;&#43;14<br>
<br>
From: Thomas Roos &lt;throos@amazon.de&gt;<br>
<br>
Protobuf is compiled with -std=3Dc&#43;&#43;14, so abseil-cpp must be as we=
ll.<br>
Details can be found here: <a href=3D"https://github.com/protocolbuffers/pr=
otobuf/issues/10768" id=3D"LPlnk976354" previewremoved=3D"true">
https://github.com/protocolbuffers/protobuf/issues/10768</a><br>
<br>
Signed-off-by: Thomas Roos &lt;throos@amazon.de&gt;<br>
---<br>
&nbsp;meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb | 1 &#43;<br>
&nbsp;1 file changed, 1 insertion(&#43;)<br>
<br>
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-o=
e/recipes-devtools/abseil-cpp/abseil-cpp_git.bb<br>
index ee62d4b59..1a713e1c5 100644<br>
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb<br>
&#43;&#43;&#43; b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb<br>
@@ -26,6 &#43;26,7 @@ ASNEEDED:class-nativesdk =3D &quot;&quot;<br>
&nbsp;inherit cmake<br>
<br>
&nbsp;EXTRA_OECMAKE =3D &quot;-DBUILD_SHARED_LIBS=3DON \<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; -DCMAKE_CXX_STANDARD=3D14 \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; -DBUILD_TESTING=3DOFF&nbsp;&nbsp;&nbsp; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; -DABSL_ENABLE_INSTALL=3DON \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;<br>
--<br>
2.34.1<br>
<br>
<br>
<br>
<br>
Amazon Web Services EMEA SARL<br>
38 avenue John F. Kennedy, L-1855 Luxembourg Sitz der Gesellschaft: L-1855 =
Luxemburg eingetragen im Luxemburgischen Handelsregister unter R.C.S. B1862=
84<br>
<br>
Amazon Web Services EMEA SARL, Niederlassung Deutschland Marcel-Breuer-Str.=
 12, D-80807 Muenchen Sitz der Zweigniederlassung: Muenchen eingetragen im =
Handelsregister des Amtsgerichts Muenchen unter HRB 242240, USt-ID DE317013=
094<br>
<br>
<br>
<br>
<br>
</div>
</span></font></div>
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

--_000_f7360598b61448599bddcc3d0e7dc08eamazonde_--


