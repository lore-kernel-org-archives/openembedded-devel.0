Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F9FCCF9E9
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 08:59:35 +0000 (UTC)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.web11.38355.1727341173351346689
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Sep 2024 01:59:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i46003Bo;
 spf=pass (domain: gmail.com, ip: 209.85.217.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-49bdc6e2e3dso258773137.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Sep 2024 01:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727341172; x=1727945972; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lYZbo4F/CCKAY2sveoLTW28YsWy++833SQWPlTg5MyI=;
        b=i46003BoozGeOzErYShVc7+Kte25lhaFZA6GHLFy5y/WZvrbNcpU9re+YlD2Msu9Ek
         NG+7qRC1N5PLzKQllb1M6cLpKyxRt4lVU6ZUKq7KgA7rfAL+T2GAn6+osqmchOJCbL9R
         VrPm1wcSjfXN679jgsHBdPEB0033E6yeYqmEGmMlvbAtRUDJQsXg4osUUY7loqZopk+k
         MFcdJxdqYMHzXG37xzhHV0pcsfQvhCT0SyyN60FMJjzZ8SelXBQNdK42j5ZtTm80aHcl
         mMYcA053nzfdCFS2SpG8Ah+uxULiqXKB5FTesRembf77501aWF//1bM3GkCf9Us3MuvR
         GU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727341172; x=1727945972;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lYZbo4F/CCKAY2sveoLTW28YsWy++833SQWPlTg5MyI=;
        b=Rec2d2qsI5XzYs/p3gY6D0eoXi8e31vWKGWqFUdYbrbU4Jcwg/+tfjDBYaTrRVAN5Z
         TYPdNwKcjkmHd96G9KB/pWiwwxN++3oXctyrNmJIYxmOYNBV3f03hiUhL02VIfBPiZtR
         fwtU7hDCpU7G7ajlTwMZogPd74wlyy32VfMGNhiKkMJJOSgWkZzWBayKpiRHqxyRJA3j
         MoZ1n3nhNl40FTy4rkoRCqUGves8fF76CJ+nbVrux+Xtfi7003FBztNYaYCxuTVfx9ui
         hjV44iCL6BzYBxrRqOB04dVMIVs3Z7Zblb65EEzy+XRsJTuS6o+a8bF9HyR07HVmvv5m
         TKzw==
X-Gm-Message-State: AOJu0YwUsHCfHEZIJ+gdo/VpxX8Vy9l3x3o1n2vKqK6SqJS0P0CdC3fs
	FXLAPoDdttx1mUFfQ+Y+UHwFwGVTEk31ECqZjw30DouPPZ8z+qBq80VBTt35wjWNbwN/UrPEGOa
	EXi1CUGCFQzAVLlDx0NnljuReRd0=
X-Google-Smtp-Source: AGHT+IEogbEp2XP8UWTuZ/hU22LYJtD5o2VE1DmGjUkv0HUJYHKeNzzneY0AJqwl7UApzT0vTL/da+GQFxkxBnFaRek=
X-Received: by 2002:a05:6102:c0b:b0:49b:ffc8:f580 with SMTP id
 ada2fe7eead31-4a15dc7add0mr5522392137.11.1727341172283; Thu, 26 Sep 2024
 01:59:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240926083946.3733569-1-yoann.congal@smile.fr>
In-Reply-To: <20240926083946.3733569-1-yoann.congal@smile.fr>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 26 Sep 2024 09:59:21 +0100
Message-ID: <CANPvuRnLs5JwnesNmC2MjgC5CT2egFxWpL7Awx4s0ATOPz=gtg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] polkit: Update Upstream-Status of a merged patch
To: yoann.congal@smile.fr
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fae303062301f4c8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Sep 2024 08:59:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112512

--000000000000fae303062301f4c8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yoann Congal via lists.openembedded.org <yoann.congal=3D
smile.fr@lists.openembedded.org> escreveu (quinta, 26/09/2024 =C3=A0(s) 09:=
40):

> From: Yoann Congal <yoann.congal@smile.fr>
>
> https://github.com/polkit-org/polkit/pull/497 was merged as
>
> https://github.com/polkit-org/polkit/commit/1d4f7f4d9f3d74fb2649c96faa867=
7416c1aefc2
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  .../meson-build-Support-openembedded-OS-for-PAM-config.patch    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git
> a/meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedded-=
OS-for-PAM-config.patch
> b/meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedded-=
OS-for-PAM-config.patch
> index cc396dfa3b..54c0fb040f 100644
> ---
> a/meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedded-=
OS-for-PAM-config.patch
> +++
> b/meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedded-=
OS-for-PAM-config.patch
> @@ -14,7 +14,7 @@ NB: This is also the same config as Debian but its not
> mentioned in the
>  code.
>
>  Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> -Upstream-Status: Submitted [https://github.com/polkit-org/polkit/pull/49=
7
> ]
> +Upstream-Status: Upstream-Status: Backport [
> https://github.com/polkit-org/polkit/commit/1d4f7f4d9f3d74fb2649c96faa867=
7416c1aefc2
> ]
>

nitpick upstream-status duplicated.

Jose


>  ---
>   meson.build       | 2 +-
>   meson_options.txt | 2 +-
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112511):
> https://lists.openembedded.org/g/openembedded-devel/message/112511
> Mute This Topic: https://lists.openembedded.org/mt/108664105/5052612
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000fae303062301f4c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Yoann Congal via <a href=3D"http://li=
sts.openembedded.org">lists.openembedded.org</a> &lt;yoann.congal=3D<a href=
=3D"mailto:smile.fr@lists.openembedded.org">smile.fr@lists.openembedded.org=
</a>&gt; escreveu (quinta, 26/09/2024 =C3=A0(s) 09:40):<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">From: Yoann Congal &lt;<a href=3D"m=
ailto:yoann.congal@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt=
;<br>
<br>
<a href=3D"https://github.com/polkit-org/polkit/pull/497" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/polkit-org/polkit/pull/497</a> was m=
erged as<br>
<a href=3D"https://github.com/polkit-org/polkit/commit/1d4f7f4d9f3d74fb2649=
c96faa8677416c1aefc2" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/polkit-org/polkit/commit/1d4f7f4d9f3d74fb2649c96faa8677416c1aefc2</a><br=
>
<br>
Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" ta=
rget=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
---<br>
=C2=A0.../meson-build-Support-openembedded-OS-for-PAM-config.patch=C2=A0 =
=C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-extended/polkit/files/meson-build-Support-open=
embedded-OS-for-PAM-config.patch b/meta-oe/recipes-extended/polkit/files/me=
son-build-Support-openembedded-OS-for-PAM-config.patch<br>
index cc396dfa3b..54c0fb040f 100644<br>
--- a/meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedde=
d-OS-for-PAM-config.patch<br>
+++ b/meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedde=
d-OS-for-PAM-config.patch<br>
@@ -14,7 +14,7 @@ NB: This is also the same config as Debian but its not me=
ntioned in the<br>
=C2=A0code.<br>
<br>
=C2=A0Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.=
fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
-Upstream-Status: Submitted [<a href=3D"https://github.com/polkit-org/polki=
t/pull/497" rel=3D"noreferrer" target=3D"_blank">https://github.com/polkit-=
org/polkit/pull/497</a>]<br>
+Upstream-Status: Upstream-Status: Backport [<a href=3D"https://github.com/=
polkit-org/polkit/commit/1d4f7f4d9f3d74fb2649c96faa8677416c1aefc2" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/polkit-org/polkit/commit/1d=
4f7f4d9f3d74fb2649c96faa8677416c1aefc2</a>]<br></blockquote><div><br></div>=
<div>nitpick upstream-status duplicated.<br><br>Jose</div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0---<br>
=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0 meson_options.txt | 2 +-<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#112511): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/112511" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/112511</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/108664105/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/108664105/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000fae303062301f4c8--

