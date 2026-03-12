Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB716103E2F9
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 00:49:43 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11647.1773276583151115948
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Mar 2026 17:49:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout07.t-online.de (Postfix) with SMTP id 1ACEC1086D;
	Thu, 12 Mar 2026 01:49:41 +0100 (CET)
Received: from [192.168.178.36] ([79.219.229.163]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1w0UF9-0DTfd20; Thu, 12 Mar 2026 01:49:39 +0100
Date: Thu, 12 Mar 2026 01:49:33 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH] mypaint-brushes: add recipe for v2
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <LYGRBT.SILSIFTWAFN93@t-online.de>
In-Reply-To: <CADySD0GwwqV7u=Owk3HTuLAGMPU=VrwWAFs0GV9T_nNkWqmq5g@mail.gmail.com>
References: <20260311082649.97159-1-f_l_k@t-online.de>
	<CADySD0GwwqV7u=Owk3HTuLAGMPU=VrwWAFs0GV9T_nNkWqmq5g@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-+0494F8UCfR2lgGNbCbU"
X-TOI-EXPURGATEID: 150726::1773276579-65FF89A3-A947643E/0/0 CLEAN NORMAL
X-TOI-MSGID: b351633c-66cf-489e-8462-b8135b67a12e
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 00:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125094

--=-+0494F8UCfR2lgGNbCbU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Thanks

On Thu, Mar 12 2026 at 13:19:22 +13:00:00, Ankur Tyagi=20
<ankur.tyagi85@gmail.com> wrote:
> On Wed, Mar 11, 2026 at 9:27=E2=80=AFPM Markus Volk via=20
> lists.openembedded.org
> <f_l_k=3Dt-online.de@lists.openembedded.org=20
> <mailto:f_l_k=3Dt-online.de@lists.openembedded.org>> wrote:
>>=20
>>  This recipe is required to build the upcoming gimp-3.2.0 update
>>=20
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   .../recipes-gimp/mypaint/mypaint-brushes_2.0.2.bb     | 11=20
>> +++++++++++
>>   1 file changed, 11 insertions(+)
>>   create mode 100644=20
>> meta-gnome/recipes-gimp/mypaint/mypaint-brushes_2.0.2.bb
>>=20
>>  diff --git=20
>> a/meta-gnome/recipes-gimp/mypaint/mypaint-brushes_2.0.2.bb=20
>> b/meta-gnome/recipes-gimp/mypaint/mypaint-brushes_2.0.2.bb
>>  new file mode 100644
>>  index 0000000000..b3ad94b4d7
>>  --- /dev/null
>>  +++ b/meta-gnome/recipes-gimp/mypaint/mypaint-brushes_2.0.2.bb
>>  @@ -0,0 +1,11 @@
>>  +SUMMARY =3D "MyPaint brushes"
>>  +LICENSE =3D "CC0-1.0"
>>  +LIC_FILES_CHKSUM =3D=20
>> "file://COPYING;md5=3D65d3616852dbf7b1a6d4b53b00626032"=20
>> <file://copying;md5=3D65d3616852dbf7b1a6d4b53b00626032/>
>>  +
>>  +inherit autotools allarch
>>  +
>>  +SRC_URI =3D=20
>> "git://github.com/mypaint/mypaint-brushes.git;protocol=3Dhttps;branch=3D=
master"
>=20
> can please include tag=3Dv${PV} in the SRC_URI as well
>=20
>>  +SRCREV =3D "0df6d130152a94c3bd67709941978074a1303cc5"
>>  +PV =3D "2.0.2"
>=20
> setting PV is not needed here
>=20
>>  +
>>  +FILES:${PN} +=3D "${datadir}/mypaint-data"
>>  --
>>  2.53.0
>>=20
>>=20
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>  Links: You receive all messages sent to this group.
>>  View/Reply Online (#125068):=20
>> <https://lists.openembedded.org/g/openembedded-devel/message/125068>
>>  Mute This Topic:=20
>> <https://lists.openembedded.org/mt/118256689/3619737>
>>  Group Owner: openembedded-devel+owner@lists.openembedded.org=20
>> <mailto:openembedded-devel+owner@lists.openembedded.org>
>>  Unsubscribe:=20
>> <https://lists.openembedded.org/g/openembedded-devel/unsub>=20
>> [ankur.tyagi85@gmail.com <mailto:ankur.tyagi85@gmail.com>]
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>=20


--=-+0494F8UCfR2lgGNbCbU
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>Thanks</div></div><div id=3D"geary=
-quote" dir=3D"auto"><br>On Thu, Mar 12 2026 at 13:19:22 +13:00:00, Ankur T=
yagi &lt;ankur.tyagi85@gmail.com&gt; wrote:<br><blockquote type=3D"cite"><d=
iv class=3D"plaintext" style=3D"white-space: break-spaces;">On Wed, Mar 11,=
 2026 at 9:27=E2=80=AFPM Markus Volk via lists.openembedded.org
&lt;<a href=3D"mailto:f_l_k=3Dt-online.de@lists.openembedded.org">f_l_k=3Dt=
-online.de@lists.openembedded.org</a>&gt; wrote:
<blockquote>
 This recipe is required to build the upcoming gimp-3.2.0 update

 Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@=
t-online.de</a>&gt;
 ---
  .../recipes-gimp/mypaint/mypaint-brushes_2.0.2.bb     | 11 +++++++++++
  1 file changed, 11 insertions(+)
  create mode 100644 meta-gnome/recipes-gimp/mypaint/mypaint-brushes_2.0.2.=
bb

 diff --git a/meta-gnome/recipes-gimp/mypaint/mypaint-brushes_2.0.2.bb b/me=
ta-gnome/recipes-gimp/mypaint/mypaint-brushes_2.0.2.bb
 new file mode 100644
 index 0000000000..b3ad94b4d7
 --- /dev/null
 +++ b/meta-gnome/recipes-gimp/mypaint/mypaint-brushes_2.0.2.bb
 @@ -0,0 +1,11 @@
 +SUMMARY =3D "MyPaint brushes"
 +LICENSE =3D "CC0-1.0"
 +LIC_FILES_CHKSUM =3D "<a href=3D"file://COPYING;md5=3D65d3616852dbf7b1a6d=
4b53b00626032" "=3D"">file://COPYING;md5=3D65d3616852dbf7b1a6d4b53b00626032=
"</a>
 +
 +inherit autotools allarch
 +
 +SRC_URI =3D "git://github.com/mypaint/mypaint-brushes.git;protocol=3Dhttp=
s;branch=3Dmaster"
</blockquote>
can please include tag=3Dv${PV} in the SRC_URI as well

<blockquote> +SRCREV =3D "0df6d130152a94c3bd67709941978074a1303cc5"
 +PV =3D "2.0.2"
</blockquote>
setting PV is not needed here

<blockquote> +
 +FILES:${PN} +=3D "${datadir}/mypaint-data"
 --
 2.53.0


 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
 Links: You receive all messages sent to this group.
 View/Reply Online (#125068): <a href=3D"https://lists.openembedded.org/g/o=
penembedded-devel/message/125068">https://lists.openembedded.org/g/openembe=
dded-devel/message/125068</a>
 Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118256689/36=
19737">https://lists.openembedded.org/mt/118256689/3619737</a>
 Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded=
.org">openembedded-devel+owner@lists.openembedded.org</a>
 Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-deve=
l/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a =
href=3D"mailto:ankur.tyagi85@gmail.com">ankur.tyagi85@gmail.com</a>]
 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</blockquote></div></blockquote></div>
--=-+0494F8UCfR2lgGNbCbU--


