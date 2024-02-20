Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33050C48BC3
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 05:35:12 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.7349.1708407304413359074
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 21:35:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout07.t-online.de (Postfix) with SMTP id 3E8FA3EAB4;
	Tue, 20 Feb 2024 06:35:02 +0100 (CET)
Received: from [192.168.178.67] ([84.163.43.200]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rcImS-0lKszI0; Tue, 20 Feb 2024 06:35:00 +0100
Date: Tue, 20 Feb 2024 06:35:11 +0100
From: f_l_k@t-online.de
Subject: Re: [oe] [meta-gnome][PATCH 2/2] gedit: update 46.1 -> 46.2
To: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
Message-Id: <NI359S.XCXVB5IIDB2A@t-online.de>
In-Reply-To: <CAMKF1sqfdZH0AQniMSVjavGbiX85mPNX2N5yq8bV+QRS_kzfhg@mail.gmail.com>
References: <20240219070140.149267-1-f_l_k@t-online.de>
	<20240219070140.149267-2-f_l_k@t-online.de>
	<CAMKF1sqfdZH0AQniMSVjavGbiX85mPNX2N5yq8bV+QRS_kzfhg@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-p1b24nQDkaBW8J4TTF+s"
X-TOI-EXPURGATEID: 150726::1708407300-337FD820-A4A42324/0/0 CLEAN NORMAL
X-TOI-MSGID: dbd7dee6-b9cd-4305-a651-f0cfc088a4ae
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 05:35:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108915

--=-p1b24nQDkaBW8J4TTF+s
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

There is already an issue for this:
<https://gitlab.gnome.org/GNOME/gedit/-/issues/588>

Unlike gtksourceview, libgedit-gtksourceview seems to be missing=20
gtk_source_style_copy().
I was able to fix the build by doing so, but perhaps it would be best=20
to wait and see what the developers of gedit plan to do?

+++ plugins/quickhighlight/gedit-quick-highlight-plugin.c 2024-02-20=20
06:28:14.583217602 +0100
@@ -90,11 +90,12 @@
  if (style_scheme !=3D NULL)
  {
   style =3D gtk_source_style_scheme_get_style (style_scheme,=20
"quick-highlight-match");
-
+#if 0
   if (style !=3D NULL)
   {
    plugin->priv->style =3D gtk_source_style_copy (style);
   }
+#endif
  }
 }


On Mon, Feb 19 2024 at 07:51:43 PM -08:00:00, Khem Raj=20
<raj.khem@gmail.com> wrote:
> with clang (clang-18) I am seeing this error
>=20
> <https://errors.yoctoproject.org/Errors/Details/753847/>
>=20
> On Sun, Feb 18, 2024 at 11:01=E2=80=AFPM Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>> wrote:
>>=20
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   meta-gnome/recipes-gnome/gedit/{gedit_46.1.bb =3D> gedit_46.2.bb} |=20
>> 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>   rename meta-gnome/recipes-gnome/gedit/{gedit_46.1.bb =3D>=20
>> gedit_46.2.bb} (92%)
>>=20
>>  diff --git a/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb=20
>> b/meta-gnome/recipes-gnome/gedit/gedit_46.2.bb
>>  similarity index 92%
>>  rename from meta-gnome/recipes-gnome/gedit/gedit_46.1.bb
>>  rename to meta-gnome/recipes-gnome/gedit/gedit_46.2.bb
>>  index c0221b9a7..c073eb9b9 100644
>>  --- a/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb
>>  +++ b/meta-gnome/recipes-gnome/gedit/gedit_46.2.bb
>>  @@ -23,7 +23,7 @@ inherit gnomebase gsettings itstool gnome-help=20
>> gobject-introspection gtk-doc get
>>   def gnome_verdir(v):
>>       return oe.utils.trim_version(v, 1)
>>=20
>>  -SRC_URI[archive.sha256sum] =3D=20
>> "a1a6e37f041765dff7227a1f5578b6f49faaf016b1e17e869caf5bfb94c6aa4e"
>>  +SRC_URI[archive.sha256sum] =3D=20
>> "c0866412bad147ebace2d282ffcbb5a0e9a304b20fd55640bee21c81e6d501ef"
>>=20
>>   # gobject-introspection is mandatory and cannot be configured
>>   REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
>>  --
>>  2.43.0
>>=20
>>=20
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>  Links: You receive all messages sent to this group.
>>  View/Reply Online (#108844):=20
>> <https://lists.openembedded.org/g/openembedded-devel/message/108844>
>>  Mute This Topic:=20
>> <https://lists.openembedded.org/mt/104442407/1997914>
>>  Group Owner: openembedded-devel+owner@lists.openembedded.org=20
>> <mailto:openembedded-devel+owner@lists.openembedded.org>
>>  Unsubscribe:=20
>> <https://lists.openembedded.org/g/openembedded-devel/unsub>=20
>> [raj.khem@gmail.com <mailto:raj.khem@gmail.com>]
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>=20


--=-p1b24nQDkaBW8J4TTF+s
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div><div>There is already an issue for=
 this:</div><div><a href=3D"https://gitlab.gnome.org/GNOME/gedit/-/issues/5=
88">https://gitlab.gnome.org/GNOME/gedit/-/issues/588</a></div><div><br></d=
iv><div>Unlike gtksourceview, libgedit-gtksourceview seems to be missing gt=
k_source_style_copy().</div><div>I was able to fix the build by doing so, b=
ut perhaps it would be best to wait and see what the developers of gedit pl=
an to do?</div></div><div><br></div><div>+++ plugins/quickhighlight/gedit-q=
uick-highlight-plugin.c	2024-02-20 06:28:14.583217602 +0100</div><div>@@ -9=
0,11 +90,12 @@</div><div>&nbsp; if (style_scheme !=3D NULL)</div><div>&nbsp=
; {</div><div>&nbsp; &nbsp;style =3D gtk_source_style_scheme_get_style (sty=
le_scheme, "quick-highlight-match");</div><div>-</div><div>+#if 0</div><div=
>&nbsp; &nbsp;if (style !=3D NULL)</div><div>&nbsp; &nbsp;{</div><div>&nbsp=
; &nbsp; plugin-&gt;priv-&gt;style =3D gtk_source_style_copy (style);</div>=
<div>&nbsp; &nbsp;}</div><div>+#endif</div><div>&nbsp; }</div><div>&nbsp;}<=
/div><div><br></div></div><div id=3D"geary-quote" dir=3D"auto"><br>On Mon, =
Feb 19 2024 at 07:51:43 PM -08:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; w=
rote:<br><blockquote type=3D"cite"><div class=3D"plaintext" style=3D"white-=
space: break-spaces;">with clang (clang-18) I am seeing this error

<a href=3D"https://errors.yoctoproject.org/Errors/Details/753847/">https://=
errors.yoctoproject.org/Errors/Details/753847/</a>

On Sun, Feb 18, 2024 at 11:01=E2=80=AFPM Markus Volk &lt;<a href=3D"mailto:=
f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:
<blockquote>
 Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@=
t-online.de</a>&gt;
 ---
  meta-gnome/recipes-gnome/gedit/{gedit_46.1.bb =3D&gt; gedit_46.2.bb} | 2 =
+-
  1 file changed, 1 insertion(+), 1 deletion(-)
  rename meta-gnome/recipes-gnome/gedit/{gedit_46.1.bb =3D&gt; gedit_46.2.b=
b} (92%)

 diff --git a/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb b/meta-gnome/rec=
ipes-gnome/gedit/gedit_46.2.bb
 similarity index 92%
 rename from meta-gnome/recipes-gnome/gedit/gedit_46.1.bb
 rename to meta-gnome/recipes-gnome/gedit/gedit_46.2.bb
 index c0221b9a7..c073eb9b9 100644
 --- a/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb
 +++ b/meta-gnome/recipes-gnome/gedit/gedit_46.2.bb
 @@ -23,7 +23,7 @@ inherit gnomebase gsettings itstool gnome-help gobject-i=
ntrospection gtk-doc get
  def gnome_verdir(v):
      return oe.utils.trim_version(v, 1)

 -SRC_URI[archive.sha256sum] =3D "a1a6e37f041765dff7227a1f5578b6f49faaf016b=
1e17e869caf5bfb94c6aa4e"
 +SRC_URI[archive.sha256sum] =3D "c0866412bad147ebace2d282ffcbb5a0e9a304b20=
fd55640bee21c81e6d501ef"

  # gobject-introspection is mandatory and cannot be configured
  REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
 --
 2.43.0


 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
 Links: You receive all messages sent to this group.
 View/Reply Online (#108844): <a href=3D"https://lists.openembedded.org/g/o=
penembedded-devel/message/108844">https://lists.openembedded.org/g/openembe=
dded-devel/message/108844</a>
 Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104442407/19=
97914">https://lists.openembedded.org/mt/104442407/1997914</a>
 Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded=
.org">openembedded-devel+owner@lists.openembedded.org</a>
 Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-deve=
l/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a =
href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>]
 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</blockquote></div></blockquote></div>
--=-p1b24nQDkaBW8J4TTF+s--


