Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E4E0C5DF81
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 18:57:33 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5017.1787597850524418154
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2026 11:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=l5Ed2Qrj;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-836cde02992so47136657b3.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Aug 2026 11:57:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787597849; cv=none;
        d=google.com; s=arc-20260327;
        b=Vf+4RB5T6bvX9wkGFcT1PTjebr77uSf4R68woSfAXSkctuyeNTXIBpyVQHfHyeaAJS
         fkGDZo+vRIQ4XNAGW/4KFjoKe3VU4IZB8O7T+KXnPgPvjy6qNftvrQnB84ORMKsXvWtl
         AFc7wTnuKSRLGhaW+6mxRsly5C1hI3si+5bCFQeusj687UQCYxVWmSnqC7aApyulEkW8
         Cc0EiDp9A+gGR2e3ploY7AYKqnwuuZuCSL8hWQ+UY2d6TCHcMnYcnl3+OPtETMJhJchX
         34P/zEgv5Ntcw7zbnZg/2UnSAqPGRRU1FvL2pPEi/tiTP9p/ZE5CCBWqHPXM2gzUrVac
         QXaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=chtet4EqQyR02nQykcgRA96PfHEOLZhwsCvofOHovY4=;
        fh=nY589uRHWux3vku2sHLufhNozrXqXOXrLnmQ1jgQe50=;
        b=BLJS8aAfWn5x8BjUT4kuIEXxapF27bNJECZvNjUoOBBl1pXxguFUhAiUqoIafu2SyY
         JDqjqWzd00kzP1uryRX9f0htmUzWQw4/pefn4mThumwKYtLsJTyyVrsmm7yGTfHpFRBR
         BIabevorhJvIRXUd8JU6uHpYq6Nu1R7QyiC4BAuZsZHIimUBNusnYpqax1tIGej/YEOn
         h6+WHJUrUiKxsgXAjknRgiq6FiWJlq1YOzonyAcatogxA3u5Wws6mfgYOpZ1cAULSvCq
         0teZY6/WIqZFdQUO8AGNx38xeinwg/OBDEekvaFlIUFZApuI8XG9S425lxxoFRKfhJPu
         8gTA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787597849; x=1788202649; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=chtet4EqQyR02nQykcgRA96PfHEOLZhwsCvofOHovY4=;
        b=l5Ed2QrjowCxffEId99kfItdrXrtcWDUlJ5Wrmcs0SvEg80jvCxBsERFz9APdWGSuA
         +RDz4hjF9RBN/YJXybNw/mGGJBswD5pNHXE1r+RPdV8k3yBhDfNBYsozHffJeaBR+x6y
         L6t0LK/7xFD9dHj4AL7DKCQ6gY0M3LBJqJ4ya+YsA2AIgGINZt8lZVM+K67RDHEZbz35
         vjnUKU1IW3fP6CHtMf3DLx6wwTGSYOy0KkPgGoR3rgx4c78pZGjtK6XNAUkkk+b2WEGp
         V5UiLOwvlqaYNuO+FXNiWX9J3JBUObznE25QwO9/M9Vr5mu3HOaT6b9Q2cEEy79GVP6m
         Swcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787597849; x=1788202649;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=chtet4EqQyR02nQykcgRA96PfHEOLZhwsCvofOHovY4=;
        b=MsxqKCrlcY8r/9SojFprSR5ktkFtMk5KXkxjOGbQKvgG2sZoHrf1+xk8Zr/4yoKHCW
         D2P7ZCSN2CGEtKLew+rVVbX3fFs5JhYkHxwZ62H89d22x4odQwPyi/INvwm8gvQNhr+b
         g+PnIr3SwYnd7bFrQ+xIxhI1QmMa1AOmhDIbnWLhqCaPdbUYwxrDAzrasyeTtU/yK1c5
         BGtPRPT31okYw5mKngIC+UkxPc+fdmSAkDC/KqrRz9eqO9exELDiexJjN0a3fgMEzMCu
         SQtyQufvZ2IOL36qBlwI9qQJAKWD7XRskvNmE78K5aTAOvd/ReGFcnN6y08BM4wVG/BS
         BgoA==
X-Gm-Message-State: AFuF++lCNL4f7ipW53dt/rurapFfALSf35AlcAlubTmMsum4phr/XklS
	d4hxQ6Gl4enyNNf/kiNhQCDwDofZ302tJZlBIGAkftwupoxaSzU1ZeDb/BL1oCalMGJ1EnkfL+0
	rdF0h1hGbgr4NXhtkdatTyyiVF1dQHX0=
X-Gm-Gg: AR+sD10Wc/Bf2IWP6uJU4MT7nr6sxtXtvGr7tDQbQSftP2v0NVg9e4D4IgTIn6FlFnI
	niGjpw117Yf3AYt/tQa5yH7rbcM4720Y7dZGPHu5/5xH2iRpPrw0Kry82jN9/17KBEfXVkmFFeB
	nHk2Qy6hRc3KzPJ2LBmoK1Ee6KKKfV7rCD0B+++oo/t74QyrLHlMHQQ8+7VzSlc+uP9IfHBSn2V
	aw3ZolyUrKQUPLJ8qi6s35nkU6ZxAHQdtaKhKcijNfuwg/xQX7GmFixmh/kDhD6MthbtHp1eMe2
	CeABN4SHlVGns5KKW2ChyuMSMByie8ei5pC7BsrEqGxexkHPSBWf1v+QUql0+5GJU531DrIDjZU
	4QLWSampba+U7MZEewCG4aL7BqTBUF1BIkw7ei5VcxBkShLCWzo4ebPaIhsE6X1rHTWaeH69jsj
	x54Tv0aAC7UHuv0tEz/XoGjvzdqbQWi65f5C9IKUS3DVJZBkpxlU3yASIZf3dRUUViHYO8lA/6y
	mueDWEzdu2TFn2wtQoHZR81
X-Received: by 2002:a05:690e:4402:b0:667:97c4:7058 with SMTP id
 956f58d0204a3-66d14afda5bmr303916d50.37.1787597849313; Mon, 24 Aug 2026
 11:57:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260824102907.2341187-1-locutusofborg@debian.org>
In-Reply-To: <20260824102907.2341187-1-locutusofborg@debian.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Aug 2026 11:57:02 -0700
X-Gm-Features: AcwNN1XoIoazKOtl49N2hnrGlvdLWMrYt_ghjCeOZ8Rr9GrDw7am2DzyVWNM6UQ
Message-ID: <CAMKF1spXrsRbf97NnyYa6yxpo4dGowqjYBAFEw7WPfrzKU6pYw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] vboxguestdrivers: update sha256sum hash for
 new release
To: costamagna.gianfranco@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Gianfranco Costamagna <locutusofborg@debian.org>, 
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Content-Type: multipart/alternative; boundary="000000000000cf478c0659cf8e03"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Aug 2026 18:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129465

--000000000000cf478c0659cf8e03
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In order to help bisecting in future, please squash it into upgrade patch
and resend a v2.

On Mon, Aug 24, 2026 at 3:34=E2=80=AFAM Gianfranco via lists.openembedded.o=
rg
<costamagna.gianfranco=3Dgmail.com@lists.openembedded.org> wrote:

> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> ---
>  .../recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.16.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_7.2.16.bb b/meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_7.2.16.bb
> index 952eca1a06..f12270680c 100644
> --- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.16.bb
> +++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.16.bb
> @@ -24,7 +24,7 @@ SRC_URI =3D "
> http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2
>      file://Makefile.utils \
>
>  file://0001-vboxvideo-let-the-build-decide-if-drm_fb_helper_alloc.patch =
\
>  "
> -SRC_URI[sha256sum] =3D
> "384f293184c52fd51bc941c17d753b4019446f53a6b07c828adfb3e61fe0a500"
> +SRC_URI[sha256sum] =3D
> "50356ccdaefe8f03537600ec31898b506e3a85ce79b94f26fb6cc1920c9e18eb"
>
>  S ?=3D "${UNPACKDIR}/vbox_module"
>  S:task-unpack =3D "${UNPACKDIR}/${VBOX_NAME}"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#129457):
> https://lists.openembedded.org/g/openembedded-devel/message/129457
> Mute This Topic: https://lists.openembedded.org/mt/120900785/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000cf478c0659cf8e03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">In order to help bisecting in future, please squash=C2=A0i=
t into upgrade patch and resend a v2.</div><br><div class=3D"gmail_quote gm=
ail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 24, =
2026 at 3:34=E2=80=AFAM Gianfranco via <a href=3D"http://lists.openembedded=
.org">lists.openembedded.org</a> &lt;costamagna.gianfranco=3D<a href=3D"mai=
lto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signe=
d-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:locutusofborg@debian.=
org" target=3D"_blank">locutusofborg@debian.org</a>&gt;<br>
Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:costamagnagianfr=
anco@yahoo.it" target=3D"_blank">costamagnagianfranco@yahoo.it</a>&gt;<br>
---<br>
=C2=A0.../recipes-support/vboxguestdrivers/<a href=3D"http://vboxguestdrive=
rs_7.2.16.bb" rel=3D"noreferrer" target=3D"_blank">vboxguestdrivers_7.2.16.=
bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-support/vboxguestdrivers/<a href=3D"http://vbo=
xguestdrivers_7.2.16.bb" rel=3D"noreferrer" target=3D"_blank">vboxguestdriv=
ers_7.2.16.bb</a> b/meta-oe/recipes-support/vboxguestdrivers/<a href=3D"htt=
p://vboxguestdrivers_7.2.16.bb" rel=3D"noreferrer" target=3D"_blank">vboxgu=
estdrivers_7.2.16.bb</a><br>
index 952eca1a06..f12270680c 100644<br>
--- a/meta-oe/recipes-support/vboxguestdrivers/<a href=3D"http://vboxguestd=
rivers_7.2.16.bb" rel=3D"noreferrer" target=3D"_blank">vboxguestdrivers_7.2=
.16.bb</a><br>
+++ b/meta-oe/recipes-support/vboxguestdrivers/<a href=3D"http://vboxguestd=
rivers_7.2.16.bb" rel=3D"noreferrer" target=3D"_blank">vboxguestdrivers_7.2=
.16.bb</a><br>
@@ -24,7 +24,7 @@ SRC_URI =3D &quot;<a href=3D"http://download.virtualbox.o=
rg/virtualbox/$%7BPV%7D/$%7BVBOX_NAME%7D.tar.bz2" rel=3D"noreferrer" target=
=3D"_blank">http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.ta=
r.bz2</a><br>
=C2=A0 =C2=A0 =C2=A0file://Makefile.utils \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-vboxvideo-let-the-build-decide-if-drm_fb_he=
lper_alloc.patch \<br>
=C2=A0&quot;<br>
-SRC_URI[sha256sum] =3D &quot;384f293184c52fd51bc941c17d753b4019446f53a6b07=
c828adfb3e61fe0a500&quot;<br>
+SRC_URI[sha256sum] =3D &quot;50356ccdaefe8f03537600ec31898b506e3a85ce79b94=
f26fb6cc1920c9e18eb&quot;<br>
<br>
=C2=A0S ?=3D &quot;${UNPACKDIR}/vbox_module&quot;<br>
=C2=A0S:task-unpack =3D &quot;${UNPACKDIR}/${VBOX_NAME}&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#129457): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/129457" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/129457</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120900785/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120900785/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000cf478c0659cf8e03--

