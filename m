Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B49CDB47E
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 14:51:27 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.94655.1697381479466156924
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 07:51:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SIUZzakA;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-32da9ef390fso605272f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 07:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697381478; x=1697986278; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ol2F1vcMuxBOEPRh2S05mOmF2HrdRZhLMUxkjbQ+Z7g=;
        b=SIUZzakAbq2+INSFSnrJCA3M2OiAheTcik7t+dCWtsBD9l84AJdfYTNWaUUojSLIZU
         ul9Z3QKgPWb9VE5GsovHtBPt5uQrTrIoho8d+c7bkNR5oWC3t9S5YDJVWPaByLt/bk/p
         A8/OzTpK+OaU9QQzPC9FKKsCTbCFWMoQ6xGmA2SrxlPjpVMxVWCQHM3xKF3p6QfNuFYO
         eUwnKLZIiMqdGEVGu3iXskveiGqDsNx62Rb67zggSq85u9zRT/rhHrToSLfGUdq8ej+g
         TtSyby4bvzVa/rHR9/mI4IhH1sdX6Bjp+mzjr63bgc4cy+4vdOs3MitOpQ1op1QV2aC1
         fqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697381478; x=1697986278;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ol2F1vcMuxBOEPRh2S05mOmF2HrdRZhLMUxkjbQ+Z7g=;
        b=aGqBaUdg7xE+xMxyKBRKC/P4KjuAtQOtAtQjTvkT5e6C749wd3LhEUqnjXIu47fB1L
         P/o4HixAA/7ZQ2GQeCkj9b4hwIfQGwq/9s19iEf84dPXarDOjjGFK15uiL+0OkdU4tIR
         ab5bsBnEopKmS3DeemhBPKA88aDzt84RDBGU9KslgRq+EvF6OzNZkZT79hXRBuKiaUlF
         Kyyq3o835MESZ4gv95FZiPtkTlmzKlS10mF9UhkO/DcVAloM/D6GaBPlQDs9kvVVaiUD
         qrE2rzDUKRAjaUnJl3lucb4LEIupL6MYTVTUjvWG03DkTx0OktyFWGo3o4YBgc3iLUyH
         jvrw==
X-Gm-Message-State: AOJu0Yx/QwuWByxf2viR9S36WB2v4PdZYxdP3YAUdg36mbH0XGDAAUDK
	VZDGWyLhYx3TccE5SWjdW+ZXOt5h1y3cCBsJ4Vs=
X-Google-Smtp-Source: AGHT+IF5itTVpkHWUSvGNDKfuRpAgeWbmcfcq+/dyU92y2zQIqKV+ei5a3WdpiYAsYKUWhnLpz8/zbRo+0qTbkZWBS4=
X-Received: by 2002:adf:9c8d:0:b0:32d:88dd:4142 with SMTP id
 d13-20020adf9c8d000000b0032d88dd4142mr9812926wre.16.1697381477486; Sun, 15
 Oct 2023 07:51:17 -0700 (PDT)
MIME-Version: 1.0
References: <20231015110154.53364-1-p.lobacz@welotec.com>
In-Reply-To: <20231015110154.53364-1-p.lobacz@welotec.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 15 Oct 2023 16:51:04 +0200
Message-ID: <CA+chaQfON78OrVdk1Wd1De3DY0f5B_e1p=YiO+TFP2zPaoSSRQ@mail.gmail.com>
Subject: Re: [oe] [OE-Core][PATCH v14 01/11] package.bbclass: override tar
 with tar-native
To: =?UTF-8?Q?Piotr_=C5=81obacz?= <p.lobacz@welotec.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000003985d0607c26c46"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 14:51:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105515

--00000000000003985d0607c26c46
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Wrong ML, oe-core patches should go to
openembedded-core@lists.openembedded.org

On Sun, Oct 15, 2023 at 3:19=E2=80=AFPM Piotr =C5=81obacz <p.lobacz@welotec=
.com> wrote:

> Due to the bugs https://savannah.gnu.org/bugs/?61934 and
> https://savannah.gnu.org/bugs/?59184, which are fixed in
> tar version 1.35, we need to force yocto to use it instead
> of the one provided by the host machine.
>
> perform_packagecopy function and opkg-build script, will use
> the tar provided by tar recipe, which is already in proper
> version.
>
> Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
> ---
>  meta/classes-global/package.bbclass | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-global/package.bbclass
> b/meta/classes-global/package.bbclass
> index 7787042e21..580884cd83 100644
> --- a/meta/classes-global/package.bbclass
> +++ b/meta/classes-global/package.bbclass
> @@ -58,8 +58,11 @@ ALL_MULTILIB_PACKAGE_ARCHS =3D
> "${@all_multilib_tune_values(d, 'PACKAGE_ARCHS')}"
>
>  # rpm is used for the per-file dependency identification
>  # dwarfsrcfiles is used to determine the list of debug source files
> -PACKAGE_DEPENDS +=3D "rpm-native dwarfsrcfiles-native"
> -
> +# minimal tar version 1.35 is needed as it has fixed bugs for storing AC=
L
> entries in textual representation
> +# and extracting files with xattrs that are read-only; this needs to wor=
k
> only if acl or xattr are turned on
> +PACKAGE_DEPENDS +=3D "rpm-native dwarfsrcfiles-native
> ${@bb.utils.contains_any('DISTRO_FEATURES', 'acl xattr',
> 'tar-replacement-native', '', d)}"
> +# perform_packagecopy and opkg-build require tar to be in the PATH
> +EXTRANATIVEPATH +=3D "${@bb.utils.contains_any('DISTRO_FEATURES', 'acl
> xattr', 'tar-native', '', d)}"
>
>  # If your postinstall can execute at rootfs creation time rather than on
>  # target but depends on a native/cross tool in order to execute, you nee=
d
> to
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105509):
> https://lists.openembedded.org/g/openembedded-devel/message/105509
> Mute This Topic: https://lists.openembedded.org/mt/101976150/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000003985d0607c26c46
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Wrong ML, oe-core patches should go to=C2=A0<a href=3D"mai=
lto:openembedded-core@lists.openembedded.org">openembedded-core@lists.opene=
mbedded.org</a></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Oct 15, 2023 at 3:19=E2=80=AFPM Piotr =C5=81obacz &=
lt;<a href=3D"mailto:p.lobacz@welotec.com">p.lobacz@welotec.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Due to the b=
ugs <a href=3D"https://savannah.gnu.org/bugs/?61934" rel=3D"noreferrer" tar=
get=3D"_blank">https://savannah.gnu.org/bugs/?61934</a> and<br>
<a href=3D"https://savannah.gnu.org/bugs/?59184" rel=3D"noreferrer" target=
=3D"_blank">https://savannah.gnu.org/bugs/?59184</a>, which are fixed in<br=
>
tar version 1.35, we need to force yocto to use it instead<br>
of the one provided by the host machine.<br>
<br>
perform_packagecopy function and opkg-build script, will use<br>
the tar provided by tar recipe, which is already in proper<br>
version.<br>
<br>
Signed-off-by: Piotr =C5=81obacz &lt;<a href=3D"mailto:p.lobacz@welotec.com=
" target=3D"_blank">p.lobacz@welotec.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-global/package.bbclass | 7 +++++--<br>
=C2=A01 file changed, 5 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/pack=
age.bbclass<br>
index 7787042e21..580884cd83 100644<br>
--- a/meta/classes-global/package.bbclass<br>
+++ b/meta/classes-global/package.bbclass<br>
@@ -58,8 +58,11 @@ ALL_MULTILIB_PACKAGE_ARCHS =3D &quot;${@all_multilib_tun=
e_values(d, &#39;PACKAGE_ARCHS&#39;)}&quot;<br>
<br>
=C2=A0# rpm is used for the per-file dependency identification<br>
=C2=A0# dwarfsrcfiles is used to determine the list of debug source files<b=
r>
-PACKAGE_DEPENDS +=3D &quot;rpm-native dwarfsrcfiles-native&quot;<br>
-<br>
+# minimal tar version 1.35 is needed as it has fixed bugs for storing ACL =
entries in textual representation<br>
+# and extracting files with xattrs that are read-only; this needs to work =
only if acl or xattr are turned on<br>
+PACKAGE_DEPENDS +=3D &quot;rpm-native dwarfsrcfiles-native ${@bb.utils.con=
tains_any(&#39;DISTRO_FEATURES&#39;, &#39;acl xattr&#39;, &#39;tar-replacem=
ent-native&#39;, &#39;&#39;, d)}&quot;<br>
+# perform_packagecopy and opkg-build require tar to be in the PATH<br>
+EXTRANATIVEPATH +=3D &quot;${@bb.utils.contains_any(&#39;DISTRO_FEATURES&#=
39;, &#39;acl xattr&#39;, &#39;tar-native&#39;, &#39;&#39;, d)}&quot;<br>
<br>
=C2=A0# If your postinstall can execute at rootfs creation time rather than=
 on<br>
=C2=A0# target but depends on a native/cross tool in order to execute, you =
need to<br>
-- <br>
2.42.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#105509): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/105509" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/105509</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101976150/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101976150/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" =
target=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000003985d0607c26c46--

