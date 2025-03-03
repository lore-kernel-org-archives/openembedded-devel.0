Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 694EEC282C6
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 20:28:39 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.5534.1741033710952769313
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Mar 2025 12:28:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout09.t-online.de (Postfix) with SMTP id A052F81E;
	Mon,  3 Mar 2025 21:28:28 +0100 (CET)
Received: from [192.168.0.192] ([24.134.105.89]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tpCOq-0iLp4a0; Mon, 3 Mar 2025 21:28:28 +0100
Date: Mon, 03 Mar 2025 21:18:40 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH] mypaint: add m4 dir to autoconf macro
 search paths
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <4RDKSS.OZX8YNTPGZ15@t-online.de>
In-Reply-To: <CAMKF1sqZx1C2=kUT_VYb3CpScnP2eAwDdx3OLexGWEHv-oUwwQ@mail.gmail.com>
References: <20250303104252.3045713-1-f_l_k@t-online.de>
	<CAMKF1sqZx1C2=kUT_VYb3CpScnP2eAwDdx3OLexGWEHv-oUwwQ@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-NY0LHh21Y5SquZGNSXor"
X-TOI-EXPURGATEID: 150726::1741033708-EB7FD9F1-AC344644/0/0 CLEAN NORMAL
X-TOI-MSGID: 680ea807-2055-4233-9f0d-70983b9ef5e3
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Mar 2025 20:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115733

--=-NY0LHh21Y5SquZGNSXor
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Sorry. I missed that

On Mon, Mar 3 2025 at 10:29:08 AM -08:00:00, Khem Raj=20
<raj.khem@gmail.com> wrote:
> I have already sent a fix for this couple of days back
>=20
> On Mon, Mar 3, 2025 at 2:42=E2=80=AFAM Markus Volk via=20
> lists.openembedded.org <http://lists.openembedded.org/>=20
> <f_l_k=3Dt-online.de@lists.openembedded.org=20
> <mailto:t-online.de@lists.openembedded.org>> wrote:
>> Signed-off-by: Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb=20
>> <http://libmypaint_git.bb/> | 3 +++
>>   1 file changed, 3 insertions(+)
>>=20
>>  diff --git a/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb=20
>> <http://libmypaint_git.bb/>=20
>> b/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb=20
>> <http://libmypaint_git.bb/>
>>  index d509aa3dd0..ca6a115dd3 100644
>>  --- a/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb=20
>> <http://libmypaint_git.bb/>
>>  +++ b/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb=20
>> <http://libmypaint_git.bb/>
>>  @@ -19,6 +19,9 @@ SRCREV =3D=20
>> "2768251dacce3939136c839aeca413f4aa4241d0"
>>   PV =3D "1.6.1"
>>   S =3D "${WORKDIR}/git"
>>=20
>>  +# Needed for introspection.m4
>>  +EXTRA_AUTORECONF +=3D "-I m4"
>>  +
>>   do_configure:append() {
>>       # autogen uses python2 so generate headers ourselves
>>       cd ${S}
>>  --
>>  2.48.1
>>=20
>>=20
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>  Links: You receive all messages sent to this group.
>>  View/Reply Online (#115724):=20
>> <https://lists.openembedded.org/g/openembedded-devel/message/115724>
>>  Mute This Topic:=20
>> <https://lists.openembedded.org/mt/111485620/1997914>
>>  Group Owner: openembedded-devel+owner@lists.openembedded.org=20
>> <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>>  Unsubscribe:=20
>> <https://lists.openembedded.org/g/openembedded-devel/unsub>=20
>> [raj.khem@gmail.com <mailto:raj.khem@gmail.com>]
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>=20


--=-NY0LHh21Y5SquZGNSXor
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>Sorry. I missed that</div></div><d=
iv id=3D"geary-quote" dir=3D"auto"><br>On Mon, Mar 3 2025 at 10:29:08 AM -0=
8:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type=3D"=
cite"><div dir=3D"auto">I have already sent a fix for this couple of days b=
ack&nbsp;</div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 3, 2025 at 2:42=E2=80=AFAM =
Markus Volk via <a href=3D"http://lists.openembedded.org">lists.openembedde=
d.org</a> &lt;f_l_k=3D<a href=3D"mailto:t-online.de@lists.openembedded.org"=
>t-online.de@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-on=
line.de" target=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
&nbsp;meta-gnome/recipes-gimp/mypaint/<a href=3D"http://libmypaint_git.bb" =
rel=3D"noreferrer" target=3D"_blank">libmypaint_git.bb</a> | 3 +++<br>
&nbsp;1 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta-gnome/recipes-gimp/mypaint/<a href=3D"http://libmypaint_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">libmypaint_git.bb</a> b/meta-gn=
ome/recipes-gimp/mypaint/<a href=3D"http://libmypaint_git.bb" rel=3D"norefe=
rrer" target=3D"_blank">libmypaint_git.bb</a><br>
index d509aa3dd0..ca6a115dd3 100644<br>
--- a/meta-gnome/recipes-gimp/mypaint/<a href=3D"http://libmypaint_git.bb" =
rel=3D"noreferrer" target=3D"_blank">libmypaint_git.bb</a><br>
+++ b/meta-gnome/recipes-gimp/mypaint/<a href=3D"http://libmypaint_git.bb" =
rel=3D"noreferrer" target=3D"_blank">libmypaint_git.bb</a><br>
@@ -19,6 +19,9 @@ SRCREV =3D "2768251dacce3939136c839aeca413f4aa4241d0"<br>
&nbsp;PV =3D "1.6.1"<br>
&nbsp;S =3D "${WORKDIR}/git"<br>
<br>
+# Needed for introspection.m4<br>
+EXTRA_AUTORECONF +=3D "-I m4"<br>
+<br>
&nbsp;do_configure:append() {<br>
&nbsp; &nbsp; &nbsp;# autogen uses python2 so generate headers ourselves<br=
>
&nbsp; &nbsp; &nbsp;cd ${S}<br>
-- <br>
2.48.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#115724): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/115724" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/115724</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111485620/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111485620/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>
</blockquote></div>
--=-NY0LHh21Y5SquZGNSXor--


