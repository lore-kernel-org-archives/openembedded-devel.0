Return-Path: <troth@openavr.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96311FD8775
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 13:48:10 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76305.1773755282239374530
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 06:48:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20230601.gappssmtp.com header.s=20230601 header.b=GRbeSBUx;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.128.173, mailfrom: troth@openavr.org)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79a535e7c00so20005617b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 06:48:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773755281; cv=none;
        d=google.com; s=arc-20240605;
        b=YKFyuZ7ycoZwxXsMgv6x+mG4+RRPfmv1OxBO2E+P5qJV0+JNXFXfya/aDKMqEMM9EL
         ys9lWeHjUXS7fS9121/CNms8ZlBz5YbXeKtgKplLBHkHWftNt6f/Z1xbOvCcubMYuAsO
         ui9KK/Swc5Xcc+SKaMWm+C9ayLMr5N22JJypV9bdOweVpNbNwQyxaSjz+MZHMmCEtMUH
         Uub9NI4eUPeAoZMzeuqVU9t42JAfZYy834/fgdygKgPSrN/XyyMjv49cF4btXjwNGXcc
         4ZX18fHEFmDpBCjDys5NbBZ2mrwXC8e65XiUh+NQf+IxfditK8A7zwyukiYg67fA/Mb5
         1JOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Rfkq2M1FPgjh07UtY8SM5naFbE6ACAvvBwsP2LCujgg=;
        fh=EqFFGVnRn0qz4znwnmk0n+hFhLaJvAVW0pujP36Ql9U=;
        b=BAkfAVmxHwL1wRLjWAICe8aqRVKwl/6eOjMcVR/BPz6N9rkY8WjuOEj+AQCULv1tDp
         5kwhyrQveYK7qUDR5Bxwni1EM483GACLfeKm8HhSsH8CwDngCQHAwk/mrCHbefaSFNmE
         6sxu7ru4FfHzqOwEeJtU9yrll2sHjfF5sU4MnxR+9VJG3p/VfURsVuxjAYZcAWO7CCuL
         w8JQFhhOT+uAyxPW0xYSWk0TcKTootzW0rX51ddvMcyJ0Lxf1WW/OQfSYk43RDh6lfpV
         ENkzDIY1DcthdYNZLq5IrUxLZS3uK2lH9RIipg1+prW0yb9j8xr9+hnbM5vmX8aUGP8R
         MpMw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20230601.gappssmtp.com; s=20230601; t=1773755281; x=1774360081; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Rfkq2M1FPgjh07UtY8SM5naFbE6ACAvvBwsP2LCujgg=;
        b=GRbeSBUxSWm9WCb8fKeghauFsTvFKxH6yBqUKEoU9jyhJM0+wt/5BdMLf6MaXeRbpE
         wGV1mmpj4z9tbVMK8jMeqVpmpgUTdfGTVc8ccqRaleIOKEO8JeKAzrozqP5irrkXfKRI
         hiBv9CD3Xgo6FCAJKBUhinKorcIyXyU6Oicydk01ec1mxjOucTb1e0KoUMgDW0jK2QAo
         KpUlGXrAxa3zJrz7nZA8x4FvPJ6BO4KdmuX8Jz6Onq8k7rA7q65dYR3+Qr5D/AK9St23
         deRDLldKTgu4ku1ojOhW+hZK/pEdHB1nAymmqml78njQ880H5nYz4x+pgVPbY+NiCDjI
         wMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773755281; x=1774360081;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rfkq2M1FPgjh07UtY8SM5naFbE6ACAvvBwsP2LCujgg=;
        b=X8s8g1+bMGxD3/O7qAhznvXzyttZNGNnV2cSXhUI/YbxrdiyGDtRPZO6hRW22u1mDX
         uDFI6BbgSNO0VFYlQDVrmro3yGyuoqKL6IM9EXo50Ph90R94BrD5QZLE6xOlOHbv1ED5
         jhpQ2A2ElKJFcwQzjqlEkiSlMRujUM3QrOfU70/VTV5RaOFgEpcjbwuKqTe3uUDNRtx8
         22M4AB4M8mvU47ZKcBSWIBqFPF3wBYO95vVmwLJiqjN+rZnGhd6WJnk3SH9zJXiwnGNB
         Zz5Tbl81gppIB2zLXys/cOCQSeTwSE7u2ss/x2JYetmwkWoNJCnAHzmjZMeBUCgUjrJ/
         7xTw==
X-Gm-Message-State: AOJu0YzpNnKTrnPOkMRiQcm3u4UUgBa13bGb67Bv4Maq0TOz93WPw41v
	cGVETOqVhlUq71eGOyL0OrrTnXEzNxd0kG6PHDWYwt6y5cpIkoa0DpaT0sbbVtADAs6uAsMuhsM
	tg6M8bPgM+FQJ/4JWYyvuhuEsL4A4AO4lytqLUqEfHw==
X-Gm-Gg: ATEYQzyxYLefIVoZmxPdDr5Ar+10rg3ZvvXprjzk1HxKFN5gXE3ZhVLS+2De79Amc+X
	uD5OpJyEo2T3BER4tPrVGt7GXrazLJ+wjYgIHUpi3m0lOF3vxArOq6WDwhGY8jRpn+vFhH+TToj
	OTY5FkTlwHw1jLhaLcXar9VEL3JVO6enP2GrCzW0IyHWt0j7iDGXXmIX84244N58N2qskmO05oT
	7sBGOVIjRHUhrqkwUh8AXwS11W8O6kUxDzACzZaKcbk8/QlLDUoZ08vMDNIVi8FGZjRzNiXx3kY
	ZmAOEEk=
X-Received: by 2002:a05:690c:b:b0:79a:349e:953f with SMTP id
 00721157ae682-79a349ea9a4mr112262887b3.17.1773755281226; Tue, 17 Mar 2026
 06:48:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260311204335.718416-1-peter.marko@siemens.com>
In-Reply-To: <20260311204335.718416-1-peter.marko@siemens.com>
From: "Theodore A. Roth" <troth@openavr.org>
Date: Tue, 17 Mar 2026 07:47:50 -0600
X-Gm-Features: AaiRm52EDBjowXHHSn4q66rHqsRIDM2zxzxwnCRJqSrYIg52-PVRFP9pw73WXYQ
Message-ID: <CAFMvBt1zTRFtPO2Xy6CfwN3qC7M5qX_fKLJ8D8RXRrj2KpVdcA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libwebsockets: upgrade 4.5.2 -> 4.5.4
To: peter.marko@siemens.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000074cb5e064d3895d0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 13:48:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125312

--00000000000074cb5e064d3895d0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 2:43=E2=80=AFPM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:

> From: Peter Marko <peter.marko@siemens.com>
>
> Update to latest v4.5-stable patch level.
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../{libwebsockets_4.5.2.bb =3D> libwebsockets_4.5.4.bb}          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-connectivity/libwebsockets/{libwebsockets_4.5.2.b=
b
> =3D> libwebsockets_4.5.4.bb} (98%)
>
> diff --git a/meta-oe/recipes-connectivity/libwebsockets/
> libwebsockets_4.5.2.bb b/meta-oe/recipes-connectivity/libwebsockets/
> libwebsockets_4.5.4.bb
> similarity index 98%
> rename from meta-oe/recipes-connectivity/libwebsockets/
> libwebsockets_4.5.2.bb
> rename to meta-oe/recipes-connectivity/libwebsockets/
> libwebsockets_4.5.4.bb
> index 35545aacee..416d0c11bc 100644
> --- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.2.bb
> +++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.4.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Db5d391cc7929bcba238f9ba6805f7574"
>  DEPENDS =3D "zlib"
>  DEPENDS:append:class-native =3D " libcap-native"
>
> -SRCREV =3D "85c6f7959fd40d8aaf7a50be3c9b75f08389a01c"
> +SRCREV =3D "93adad56deb5d027eeb890ea86268d1d07fe204a"
>

This commit hash doesn't exist in the upstream git repo. As such, when
building with this commit from `master-next`,
I'm seeing the following error:

    ERROR: libwebsockets-4.5.4-r0 do_fetch: Fetcher failure: Unable to find
revision 93adad56deb5d027eeb890ea86268d1d07fe204a
    in branch v4.5-stable even from upstream

Looks like the correct SRCREV should
be c56adc3c62ee2545c77e0ba4cce67441be6955db

Ted Roth

--00000000000074cb5e064d3895d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote gmail_quote_container"><div =
dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 11, 2026 at 2:43=E2=80=AFPM Pe=
ter Marko via <a href=3D"http://lists.openembedded.org">lists.openembedded.=
org</a> &lt;peter.marko=3D<a href=3D"mailto:siemens.com@lists.openembedded.=
org">siemens.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">From: Peter Marko &lt;<a href=3D"mai=
lto:peter.marko@siemens.com" target=3D"_blank">peter.marko@siemens.com</a>&=
gt;<br>
<br>
Update to latest v4.5-stable patch level.<br>
<br>
Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" t=
arget=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://libwebsockets_4.5.2.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libwebsockets_4.5.2.bb</a> =3D&gt; <a href=3D"http://libwebs=
ockets_4.5.4.bb" rel=3D"noreferrer" target=3D"_blank">libwebsockets_4.5.4.b=
b</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-oe/recipes-connectivity/libwebsockets/{<a href=3D"http://=
libwebsockets_4.5.2.bb" rel=3D"noreferrer" target=3D"_blank">libwebsockets_=
4.5.2.bb</a> =3D&gt; <a href=3D"http://libwebsockets_4.5.4.bb" rel=3D"noref=
errer" target=3D"_blank">libwebsockets_4.5.4.bb</a>} (98%)<br>
<br>
diff --git a/meta-oe/recipes-connectivity/libwebsockets/<a href=3D"http://l=
ibwebsockets_4.5.2.bb" rel=3D"noreferrer" target=3D"_blank">libwebsockets_4=
.5.2.bb</a> b/meta-oe/recipes-connectivity/libwebsockets/<a href=3D"http://=
libwebsockets_4.5.4.bb" rel=3D"noreferrer" target=3D"_blank">libwebsockets_=
4.5.4.bb</a><br>
similarity index 98%<br>
rename from meta-oe/recipes-connectivity/libwebsockets/<a href=3D"http://li=
bwebsockets_4.5.2.bb" rel=3D"noreferrer" target=3D"_blank">libwebsockets_4.=
5.2.bb</a><br>
rename to meta-oe/recipes-connectivity/libwebsockets/<a href=3D"http://libw=
ebsockets_4.5.4.bb" rel=3D"noreferrer" target=3D"_blank">libwebsockets_4.5.=
4.bb</a><br>
index 35545aacee..416d0c11bc 100644<br>
--- a/meta-oe/recipes-connectivity/libwebsockets/<a href=3D"http://libwebso=
ckets_4.5.2.bb" rel=3D"noreferrer" target=3D"_blank">libwebsockets_4.5.2.bb=
</a><br>
+++ b/meta-oe/recipes-connectivity/libwebsockets/<a href=3D"http://libwebso=
ckets_4.5.4.bb" rel=3D"noreferrer" target=3D"_blank">libwebsockets_4.5.4.bb=
</a><br>
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Db5d391cc792=
9bcba238f9ba6805f7574&quot;<br>
=C2=A0DEPENDS =3D &quot;zlib&quot;<br>
=C2=A0DEPENDS:append:class-native =3D &quot; libcap-native&quot;<br>
<br>
-SRCREV =3D &quot;85c6f7959fd40d8aaf7a50be3c9b75f08389a01c&quot;<br>
+SRCREV =3D &quot;93adad56deb5d027eeb890ea86268d1d07fe204a&quot;<br></block=
quote><div><br></div><div>This commit hash doesn&#39;t exist=C2=A0in the up=
stream git repo. As such, when building with this commit from `master-next`=
,</div><div>I&#39;m seeing the following error:<br><br>=C2=A0 =C2=A0 ERROR:=
 libwebsockets-4.5.4-r0 do_fetch: Fetcher failure: Unable to find revision =
93adad56deb5d027eeb890ea86268d1d07fe204a</div><div>=C2=A0 =C2=A0 in branch =
v4.5-stable even from upstream</div><div><br></div><div>Looks like the corr=
ect SRCREV should be=C2=A0c56adc3c62ee2545c77e0ba4cce67441be6955db</div><di=
v><br></div><div>Ted Roth</div><div><br></div></div></div>

--00000000000074cb5e064d3895d0--

