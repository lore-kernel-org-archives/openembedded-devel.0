Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C33D4C25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 17:58:19 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.20855.1715882296137235872
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 May 2024 10:58:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout03.t-online.de (Postfix) with SMTP id 500EDE0C3;
	Thu, 16 May 2024 19:58:12 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.36.253]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s7fMl-1EDqWO0; Thu, 16 May 2024 19:58:07 +0200
Date: Thu, 16 May 2024 19:58:39 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: RE: [oe] [meta-oe][PATCH 1/2] malcontent-ui: add malcontent to
 RDEPENDS
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Markus Volk <f_l_k@t-online.de>, Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel@lists.openembedded.org
Message-Id: <R9BLDS.3YNP2DVH6SUR@t-online.de>
In-Reply-To: <DB5PR02MB1021325F091D3D54A8F2FF356EFEC2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240513200825.39767-1-f_l_k@t-online.de>
	<CA+chaQfXGRSwepv6+DS2fYx6ashYnHN0mXx7qc9-XjGcEL-nLw@mail.gmail.com>
	<BUZFDS.4175JRWDQOCF@t-online.de>
	<DB5PR02MB1021325F091D3D54A8F2FF356EFEC2@DB5PR02MB10213.eurprd02.prod.outlook.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-zzI5/9iWWH4oO9rwuvrH"
X-TOI-EXPURGATEID: 150726::1715882287-61FF93C7-1D33CB12/0/0 CLEAN NORMAL
X-TOI-MSGID: ddb38977-cb64-475d-8c13-838222516078
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 May 2024 17:58:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110417

--=-zzI5/9iWWH4oO9rwuvrH
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: quoted-printable



On Wed, May 15 2024 at 03:44:46 PM +00:00:00, Peter Kjellerstedt=20
<peter.kjellerstedt@axis.com> wrote:
> Iflibmalcontent-uilinks withlibmalcontent, then=20
> themalcontent-uirecipe should have aDEPENDSonmalcontent, and you=20
> should not need to add an explicitRDEPENDS:${PN}for it (just as=20
> Martin wrote).
>=20
>=20
>=20
> The reason I guess that you get that error is because I believe=20
> themalcontent-uirecipe has actually builtlibmalcontentitself (given=20
> that both recipes use the same source code) rather than using the one=20
> produced by themalcontentrecipe (whichmalcontent-uidoesn=92t depend=20
> on=85) Would it be an option to just have one recipe that builds both=20
> libraries and then packages them in different packages?
>=20
>=20
>=20

I also suspect that this is the reason.

There have been problems with a circular dependency if built with=20
-Dui=3Denabled.
This will therefore probably not work.

There are different approaches in malcontent to work around this=20
problem.

You can use system malcontent:
https://gitlab.freedesktop.org/pwithnall/malcontent/-/blob/main/meson_optio=
ns.txt?ref_type=3Dheads#L18

But this is not suitable, and building malcontent-native does not seem=20
to be a good way either, as it has quite heavy dependencies. malcontent=20
still offers this way:
https://gitlab.freedesktop.org/pwithnall/malcontent/-/commit/fda2fbd33084a3=
88effc844ab73fd4f2c297efb1

> Also (since I now looked at the recipes), I would strongly recommend=20
> not to do:
>=20
>=20
>=20
> FILES:${PN} =3D "${bindir} ${libdir} ${datadir}"
>=20
>=20
>=20
> as you do in themalcontent-uirecipe, or:
>=20
>=20
>=20
> FILES:${PN} +=3D "${libdir} ${datadir}"
>=20
>=20
>=20
> as you do in themalcontentrecipe. Resetting FILES:${PN} (as in the=20
> first case) is always a source of problems and can easily lead to=20
> incorrect packaging of files. And for${libdir}and${datadir}, be more=20
> specific with what paths you are actually adding.
>=20

I agree that in principle you have better control over which files are=20
shipped if being more specific in FILES:${PN}. But in this particular=20
case, we already explicitly specify each file to be installed in=20
do_install to avoid multiple providers. So we already have control over=20
what is installed/shipped. Duplicating this to FILES:${PN} would mean=20
that we would have to make all changes twice during a recipe update if=20
we additionally specified each file in FILES:${PN}?

>=20
>=20
> //Peter
>=20
>=20
>=20
> *From:*openembedded-devel@lists.openembedded.org=20
> <openembedded-devel@lists.openembedded.org> *On Behalf Of*Markus Volk
> *Sent:* den 13 maj 2024 23:04
> *To:* Martin Jansa <martin.jansa@gmail.com>
> *Cc:* f_l_k@t-online.de; openembedded-devel@lists.openembedded.org
> *Subject:* Re: [oe] [meta-oe][PATCH 1/2] malcontent-ui: add=20
> malcontent to RDEPENDS
>=20
>=20
>=20
> On Mon, May 13 2024 at 10:30:31 PM +02:00:00, Martin Jansa=20
> <martin.jansa@gmail.com <mailto:martin.jansa@gmail.com>> wrote:
>=20
>> If libmalcontent-ui-1.so.1 links with libmalcontent-0.so.0 then this=20
>> should be build-time DEPENDS (and then shlibs code in do_package=20
>> will automatically add malcontent to RDEPENDS.
>>=20
>=20
>=20
> This error is caused by adding malcontent to the DEPENDS field in=20
> PACKAGECONFIG like I did in gnome-control-center. After enabling this=20
>  in my build the error occurred.
>=20
> But in the end this RDPEND is not wrong I guess? I've split the=20
> package in two and without this RDEPEND it would be possible to=20
> install libmalcontent-ui without libmalcontent which would then be=20
> broken
>=20


--=-zzI5/9iWWH4oO9rwuvrH
Content-Type: text/html; charset=windows-1251
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div><br></div></div><div id=3D"geary-q=
uote" dir=3D"auto"><br>On Wed, May 15 2024 at 03:44:46 PM +00:00:00, Peter =
Kjellerstedt &lt;peter.kjellerstedt@axis.com&gt; wrote:<br><blockquote type=
=3D"cite">

<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#943634;
	font-weight:normal;
	font-style:normal;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-ligatures:none;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->


<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US">If
</span><span lang=3D"EN-US" style=3D"font-family:Consolas;color:#943634;mso=
-fareast-language:EN-US">libmalcontent-ui</span><span lang=3D"EN-US" style=
=3D"color:#943634;mso-fareast-language:EN-US"> links with
</span><span lang=3D"EN-US" style=3D"font-family:Consolas;color:#943634;mso=
-fareast-language:EN-US">libmalcontent</span><span lang=3D"EN-US" style=3D"=
color:#943634;mso-fareast-language:EN-US">, then the
</span><span lang=3D"EN-US" style=3D"font-family:Consolas;color:#943634;mso=
-fareast-language:EN-US">malcontent-ui</span><span lang=3D"EN-US" style=3D"=
color:#943634;mso-fareast-language:EN-US"> recipe should have a
</span><span lang=3D"EN-US" style=3D"font-family:Consolas;color:#943634;mso=
-fareast-language:EN-US">DEPENDS</span><span lang=3D"EN-US" style=3D"color:=
#943634;mso-fareast-language:EN-US"> on
</span><span lang=3D"EN-US" style=3D"font-family:Consolas;color:#943634;mso=
-fareast-language:EN-US">malcontent</span><span lang=3D"EN-US" style=3D"col=
or:#943634;mso-fareast-language:EN-US">, and you should not need to add an =
explicit
</span><span lang=3D"EN-US" style=3D"font-family:Consolas;color:#943634;mso=
-fareast-language:EN-US">RDEPENDS:${PN}</span><span lang=3D"EN-US" style=3D=
"color:#943634;mso-fareast-language:EN-US"> for it (just as Martin wrote).
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US"><o:p>&nbsp;</o:p></span></p></div></blockquote><blockqu=
ote type=3D"cite"><div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US">The reason I guess that you get that error is because I=
 believe the
</span><span lang=3D"EN-US" style=3D"font-family:Consolas;color:#943634;mso=
-fareast-language:EN-US">malcontent-ui</span><span lang=3D"EN-US" style=3D"=
color:#943634;mso-fareast-language:EN-US"> recipe has actually built
</span><span lang=3D"EN-US" style=3D"font-family:Consolas;color:#943634;mso=
-fareast-language:EN-US">libmalcontent</span><span lang=3D"EN-US" style=3D"=
color:#943634;mso-fareast-language:EN-US"> itself (given that both recipes =
use the same source code) rather than using
 the one produced by the </span><span lang=3D"EN-US" style=3D"font-family:C=
onsolas;color:#943634;mso-fareast-language:EN-US">malcontent</span><span la=
ng=3D"EN-US" style=3D"color:#943634;mso-fareast-language:EN-US"> recipe (wh=
ich
</span><span lang=3D"EN-US" style=3D"font-family:Consolas;color:#943634;mso=
-fareast-language:EN-US">malcontent-ui</span><span lang=3D"EN-US" style=3D"=
color:#943634;mso-fareast-language:EN-US"> doesn=92t depend on=85) Would it=
 be an option to just have one recipe that builds
 both libraries and then packages them in different packages?<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US"><o:p>&nbsp;</o:p></span></p></div></blockquote><font co=
lor=3D"#943634" face=3D"Calibri, sans-serif" size=3D"3"><div style=3D"caret=
-color: rgb(148, 54, 52);"><font color=3D"#943634" face=3D"Calibri, sans-se=
rif" size=3D"3"><span style=3D"caret-color: rgb(148, 54, 52);"><br></span><=
/font></div><div><font color=3D"#943634" face=3D"Calibri, sans-serif" size=
=3D"3"><div>I also suspect that this is the reason.&nbsp;</div><div><br></d=
iv><div>There have been problems with a circular dependency if built with -=
Dui=3Denabled.&nbsp;</div><div>This will therefore probably not work.</div>=
<div><br></div><div><div>There are different approaches in malcontent to wo=
rk around this problem.&nbsp;</div><div><br></div><div>You can use system m=
alcontent:</div><div>https://gitlab.freedesktop.org/pwithnall/malcontent/-/=
blob/main/meson_options.txt?ref_type=3Dheads#L18</div><div><br></div><div>B=
ut this is not suitable, and building malcontent-native does not seem to be=
 a good way either, as it has quite heavy dependencies. malcontent still of=
fers this way:</div><div>https://gitlab.freedesktop.org/pwithnall/malconten=
t/-/commit/fda2fbd33084a388effc844ab73fd4f2c297efb1</div></div></font></div=
><br></font><blockquote type=3D"cite"><div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US">Also (since I now looked at the recipes), I would stron=
gly recommend not to do:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas;c=
olor:#943634;mso-fareast-language:EN-US">FILES:${PN} =3D "${bindir} ${libdi=
r} ${datadir}"<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US">as you do in the
</span><span lang=3D"EN-US" style=3D"font-family:Consolas;color:#943634;mso=
-fareast-language:EN-US">malcontent-ui</span><span lang=3D"EN-US" style=3D"=
color:#943634;mso-fareast-language:EN-US"> recipe, or:<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas;c=
olor:#943634;mso-fareast-language:EN-US">FILES:${PN} +=3D "${libdir} ${data=
dir}"<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US">as you do in the
</span><span lang=3D"EN-US" style=3D"font-family:Consolas;color:#943634;mso=
-fareast-language:EN-US">malcontent</span><span lang=3D"EN-US" style=3D"col=
or:#943634;mso-fareast-language:EN-US"> recipe. Resetting FILES:${PN} (as i=
n the first case) is always a source of
 problems and can easily lead to incorrect packaging of files. And for </sp=
an><span lang=3D"EN-US" style=3D"font-family:Consolas;color:#943634;mso-far=
east-language:EN-US">${libdir}</span><span lang=3D"EN-US" style=3D"color:#9=
43634;mso-fareast-language:EN-US"> and
</span><span lang=3D"EN-US" style=3D"font-family:Consolas;color:#943634;mso=
-fareast-language:EN-US">${datadir}</span><span lang=3D"EN-US" style=3D"col=
or:#943634;mso-fareast-language:EN-US">, be more specific with what paths y=
ou are actually adding.<o:p></o:p></span></p></div></blockquote><font color=
=3D"#943634" face=3D"Calibri, sans-serif" size=3D"3"><div style=3D"caret-co=
lor: rgb(148, 54, 52);"><font color=3D"#943634" face=3D"Calibri, sans-serif=
" size=3D"3"><span style=3D"caret-color: rgb(148, 54, 52);"><br></span></fo=
nt></div><div><font color=3D"#943634" face=3D"Calibri, sans-serif" size=3D"=
3">I agree that in principle you have better control over which files are s=
hipped if being more specific in FILES:${PN}. But in this particular case, =
we already explicitly specify each file to be installed in do_install to av=
oid multiple providers. So we already have control over what is installed/s=
hipped. Duplicating this to FILES:${PN} would mean that we would have to ma=
ke all changes twice during a recipe update if we additionally specified ea=
ch file in FILES:${PN}?</font></div><br></font><blockquote type=3D"cite"><d=
iv class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US">//Peter<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> openembedded-devel@lists.openembedded.org &lt;openembedded-deve=
l@lists.openembedded.org&gt;
<b>On Behalf Of </b>Markus Volk<br>
<b>Sent:</b> den 13 maj 2024 23:04<br>
<b>To:</b> Martin Jansa &lt;martin.jansa@gmail.com&gt;<br>
<b>Cc:</b> f_l_k@t-online.de; openembedded-devel@lists.openembedded.org<br>
<b>Subject:</b> Re: [oe] [meta-oe][PATCH 1/2] malcontent-ui: add malcontent=
 to RDEPENDS<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div id=3D"geary-body">
<p class=3D"MsoNormal">On Mon, May 13 2024 at 10:30:31 PM +02:00:00, Martin=
 Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com=
</a>&gt; wrote:<br>
<br>
<o:p></o:p></p>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<div>
<p class=3D"MsoNormal">If libmalcontent-ui-1.so.1 links with libmalcontent-=
0.so.0 then this should be build-time DEPENDS (and then shlibs code in do_p=
ackage will automatically add malcontent to RDEPENDS.<o:p></o:p></p>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">This error is caused by adding malcontent to the DEP=
ENDS field in PACKAGECONFIG like I did in gnome-control-center. After enabl=
ing this &nbsp;in my build the error occurred.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">But in the end this RDPEND is not wrong I guess? I'v=
e split the package in two and without this RDEPEND it would be possible to=
 install libmalcontent-ui without libmalcontent which would then be broken =
&nbsp;<o:p></o:p></p>
</div>
</div>
</div>
</div>


</blockquote></div>
--=-zzI5/9iWWH4oO9rwuvrH--


