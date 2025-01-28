Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C0F5C0218A
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 21:09:20 +0000 (UTC)
Subject: Re: [meta-networking][PATCH] net-snmp-native: dependency with libpci
To: openembedded-devel@lists.openembedded.org
From: "Christos Gavros" <gavrosc@yahoo.com>
X-Originating-Location: =?UTF-8?B?TWFsbW8sIFNrw6VuZSBDb3VudHksIFNF?= (78.82.187.133)
X-Originating-Platform: Linux Chrome 131
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 28 Jan 2025 13:09:10 -0800
References: <13446.1737839341602827082@lists.openembedded.org>
In-Reply-To: <13446.1737839341602827082@lists.openembedded.org>
Message-ID: <32327.1738098550433624407@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Tjzr6eC0PEccpBwG79Sn"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jan 2025 21:09:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115124

--Tjzr6eC0PEccpBwG79Sn
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

hi Raj,

i have made some further investigation with the support of Yoann Congal abo=
ut this issue.
It seems that 'net-snmp-native' started breaking after the following patch =
which includes changes in native.bbclass to handle recipes/packages with su=
ffix:
https://git.yoctoproject.org/poky/commit/?id=3Dd26c72b7dccaf4802914dafcc959=
11f4d166086d

Before patch -> RDEPENDS: net-snmp-native-libs =3D libpci-native net-snmp-l=
ib-netsnmp-native .....
After patch ->=C2=A0 =C2=A0 RDEPENDS: net-snmp-libs-native =3D libpci-nativ=
e=C2=A0net-snmp-lib-netsnmp-native .....

It looks that the issue was already there but after the patch it is exposed=
.

I have tested the changes you proposed locally and build successfully 'net-=
snmp' and 'net-snmp-native'.
I will prepare the v2 and send it unless you want me to test something more=
..

Br
Christos

--Tjzr6eC0PEccpBwG79Sn
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>hi Raj,</div>
<div>&nbsp;</div>
<div>i have made some further investigation with the support of Yoann Conga=
l about this issue.&nbsp;</div>
<div>It seems that 'net-snmp-native' started breaking after the following p=
atch which includes changes in native.bbclass to handle recipes/packages wi=
th suffix:</div>
<div><a href=3D"https://git.yoctoproject.org/poky/commit/?id=3Dd26c72b7dcca=
f4802914dafcc95911f4d166086d" target=3D"_blank" rel=3D"noopener">https://gi=
t.yoctoproject.org/poky/commit/?id=3Dd26c72b7dccaf4802914dafcc95911f4d16608=
6d</a></div>
<div>&nbsp;</div>
<div><span style=3D"color: #1d2228; font-family: 'Helvetica Neue', Helvetic=
a, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-lig=
atures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing=
: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: n=
one; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-sp=
ace: normal; background-color: #ffffff; text-decoration-thickness: initial;=
 text-decoration-style: initial; text-decoration-color: initial; display: i=
nline !important; float: none;">Before patch -&gt; RDEPENDS: </span><span s=
tyle=3D"outline: none !important; color: #1d2228; font-family: 'Helvetica N=
eue', Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; fo=
nt-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; tex=
t-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; white-space: normal; background-color: #ffffff; text-decoration-thick=
ness: initial; text-decoration-style: initial; text-decoration-color: initi=
al;">net-snmp-native-libs =3D&nbsp;<span style=3D"outline: none !important;=
">libpci-native&nbsp;<span style=3D"outline: none !important;">net-snmp-lib=
-netsnmp-native .....</span></span></span></div>
<div><span style=3D"outline: none !important; color: #1d2228; font-family: =
'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 16px; font-style=
: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-w=
eight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-inde=
nt: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-s=
troke-width: 0px; white-space: normal; background-color: #ffffff; text-deco=
ration-thickness: initial; text-decoration-style: initial; text-decoration-=
color: initial;"><span style=3D"outline: none !important;"><span style=3D"o=
utline: none !important;"><span style=3D"outline: none !important; font-fam=
ily: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 16px; font-=
style: normal; font-variant-ligatures: normal; font-variant-caps: normal; f=
ont-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text=
-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-t=
ext-stroke-width: 0px; white-space: normal; background-color: #ffffff; text=
-decoration-thickness: initial; text-decoration-style: initial; text-decora=
tion-color: initial; color: #000000;">After patch -&gt;&nbsp; &nbsp; RDEPEN=
DS: </span><span style=3D"outline: none !important; font-family: 'Helvetica=
 Neue', Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; =
font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400=
; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; t=
ext-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-widt=
h: 0px; white-space: normal; background-color: #ffffff; text-decoration-thi=
ckness: initial; text-decoration-style: initial; text-decoration-color: ini=
tial; color: #000000;">net-snmp-libs-native =3D<span style=3D"outline: none=
 !important;"><span style=3D"outline: none !important; color: #000000; font=
-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 16px;">=
&nbsp;</span><span style=3D"outline: none !important; color: #000000; font-=
family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 16px;">l=
ibpci-native&nbsp;net-snmp-lib-netsnmp-native .....</span></span></span></s=
pan></span></span></div>
<div>&nbsp;</div>
<div><span style=3D"outline: none !important; color: #1d2228; font-family: =
'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 16px; font-style=
: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-w=
eight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-inde=
nt: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-s=
troke-width: 0px; white-space: normal; background-color: #ffffff; text-deco=
ration-thickness: initial; text-decoration-style: initial; text-decoration-=
color: initial;"><span style=3D"outline: none !important;"><span style=3D"o=
utline: none !important;"><span style=3D"outline: none !important; font-fam=
ily: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 16px; font-=
style: normal; font-variant-ligatures: normal; font-variant-caps: normal; f=
ont-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text=
-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-t=
ext-stroke-width: 0px; white-space: normal; background-color: #ffffff; text=
-decoration-thickness: initial; text-decoration-style: initial; text-decora=
tion-color: initial; color: #000000;"><span style=3D"outline: none !importa=
nt;"><span style=3D"outline: none !important; color: #000000; font-family: =
'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 16px;">It looks =
that the issue was already there but after the patch it is exposed. </span>=
</span></span></span></span></span></div>
<div>&nbsp;</div>
<div><span style=3D"outline: none !important; color: #1d2228; font-family: =
'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 16px; font-style=
: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-w=
eight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-inde=
nt: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-s=
troke-width: 0px; white-space: normal; background-color: #ffffff; text-deco=
ration-thickness: initial; text-decoration-style: initial; text-decoration-=
color: initial;"><span style=3D"outline: none !important;"><span style=3D"o=
utline: none !important;"><span style=3D"outline: none !important; font-fam=
ily: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 16px; font-=
style: normal; font-variant-ligatures: normal; font-variant-caps: normal; f=
ont-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text=
-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-t=
ext-stroke-width: 0px; white-space: normal; background-color: #ffffff; text=
-decoration-thickness: initial; text-decoration-style: initial; text-decora=
tion-color: initial; color: #000000;"><span style=3D"outline: none !importa=
nt;"><span style=3D"outline: none !important; color: #000000; font-family: =
'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 16px;">I have te=
sted the changes you proposed locally and build successfully 'net-snmp' and=
 'net-snmp-native'.</span></span></span></span></span></span></div>
<div><span style=3D"outline: none !important; color: #1d2228; font-family: =
'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 16px; font-style=
: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-w=
eight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-inde=
nt: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-s=
troke-width: 0px; white-space: normal; background-color: #ffffff; text-deco=
ration-thickness: initial; text-decoration-style: initial; text-decoration-=
color: initial;"><span style=3D"outline: none !important;"><span style=3D"o=
utline: none !important;"><span style=3D"outline: none !important; font-fam=
ily: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 16px; font-=
style: normal; font-variant-ligatures: normal; font-variant-caps: normal; f=
ont-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text=
-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-t=
ext-stroke-width: 0px; white-space: normal; background-color: #ffffff; text=
-decoration-thickness: initial; text-decoration-style: initial; text-decora=
tion-color: initial; color: #000000;"><span style=3D"outline: none !importa=
nt;"><span style=3D"outline: none !important; color: #000000; font-family: =
'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 16px;">I will pr=
epare the v2 and send it unless you want me to test something more..</span>=
</span></span></span></span></span></div>
<div>&nbsp;</div>
<div><span style=3D"outline: none !important; color: #1d2228; font-family: =
'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 16px; font-style=
: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-w=
eight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-inde=
nt: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-s=
troke-width: 0px; white-space: normal; background-color: #ffffff; text-deco=
ration-thickness: initial; text-decoration-style: initial; text-decoration-=
color: initial;"><span style=3D"outline: none !important;"><span style=3D"o=
utline: none !important;"><span style=3D"outline: none !important; font-fam=
ily: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 16px; font-=
style: normal; font-variant-ligatures: normal; font-variant-caps: normal; f=
ont-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text=
-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-t=
ext-stroke-width: 0px; white-space: normal; background-color: #ffffff; text=
-decoration-thickness: initial; text-decoration-style: initial; text-decora=
tion-color: initial; color: #000000;"><span style=3D"outline: none !importa=
nt;"><span style=3D"outline: none !important; color: #000000; font-family: =
'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 16px;">Br</span>=
</span></span></span></span></span></div>
<div><span style=3D"outline: none !important; color: #1d2228; font-family: =
'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 16px; font-style=
: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-w=
eight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-inde=
nt: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-s=
troke-width: 0px; white-space: normal; background-color: #ffffff; text-deco=
ration-thickness: initial; text-decoration-style: initial; text-decoration-=
color: initial;"><span style=3D"outline: none !important;"><span style=3D"o=
utline: none !important;"><span style=3D"outline: none !important; font-fam=
ily: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 16px; font-=
style: normal; font-variant-ligatures: normal; font-variant-caps: normal; f=
ont-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text=
-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-t=
ext-stroke-width: 0px; white-space: normal; background-color: #ffffff; text=
-decoration-thickness: initial; text-decoration-style: initial; text-decora=
tion-color: initial; color: #000000;"><span style=3D"outline: none !importa=
nt;"><span style=3D"outline: none !important; color: #000000; font-family: =
'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 16px;">Christos<=
/span></span></span></span></span></span></div>
<div>&nbsp;</div>

--Tjzr6eC0PEccpBwG79Sn--

