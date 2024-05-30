Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A862FC25B7E
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 20:56:03 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.2691.1717102556516506852
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 May 2024 13:55:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YzStIqju;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-24c9f73ccaaso755110fac.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 13:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717102556; x=1717707356; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vHxKwtzUxo9Y3f0OkFXAQna+RAw5aET88Yl8vglK4O4=;
        b=YzStIqjuth+5/qUrXR7UTMUT3nL9vwi6A+eX3nzrueFqi+8+bPPUKKJLSszR7uzneM
         VitvKB36u0m5VZ0ZTTJ+Yu3F2eY3fasohHlIib0P0TGiI7EI8z9+e0dqvap+broh5ZsW
         Aqj3CAmuSNWLKRup4Zpzu8FvQn2P+fMCQwt3OVrDLtpAeDDFwZrBMxz2/71LexRtYFhE
         qzMcmC922ltutB+tuQljDqeXsFPNGtRIt/Cgg5xK6PFAQ9JEomPiptrZ4KJOlm3BgXqX
         SDGglpnwduRc36oGjz1Om1dfvoGT93WvMLzQSmBdA3fp1evA4aIvtBsE3JjEG89oc4e8
         o1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717102556; x=1717707356;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vHxKwtzUxo9Y3f0OkFXAQna+RAw5aET88Yl8vglK4O4=;
        b=UEN2j1bwUG/prITv4fRddYzOhNDgyAlG3oaRQ7zPwL2genIost85k+/cnrW4Y9qoxN
         HawrsKbOyo7aK1rb1ZniYNOSzEGoOuM4893pr5BkYcs2n2FAkx+eCXz98Cpw6DmXlfvG
         atzzIxas1sqhAGvquv6LfesWmZR/we368XYPqSpn2qVs0EoaWKThUb5csaTj8UTw768W
         LEtocIEp+ok8dVfcqdxPHDCBL8+IslxUT6IWG0PQudNS8O9RxIu1P3ECxdFCQfdyxi3x
         Xyru6sLE0GpOLumUHpmqRk8Zw2bAZ1GGGOs/hO2ZItLXA4RC7uO7TSb3MZom+VHUoCoL
         k0jA==
X-Gm-Message-State: AOJu0Yw+FdtTAqoOZ2LHqobdifv1RSe48BOnBpgJtIjGVzM9x2cRD+OS
	+223+coOaCD1WaizKPbt1XO7eIcy5wAbedbwBxIiKmSsdzmC6f/h85Vh/qIgU4yrF6BdcNMbmyD
	Yl8x7LTRha/XEJqMncXWhSKAh7jw=
X-Google-Smtp-Source: AGHT+IEX0SE0XO7yyzbN14Ij/ZDQKRi3UfhMtzRa9mTnKstZBRQaXZx/ybBaJtQOeE/0JreWQtL2bwTZQ5oR9Dmx1/8=
X-Received: by 2002:a05:6870:7010:b0:250:7e5f:5c73 with SMTP id
 586e51a60fabf-2508baa84f7mr48648fac.31.1717102555551; Thu, 30 May 2024
 13:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240530203349.641537-1-martin.jansa@gmail.com>
In-Reply-To: <20240530203349.641537-1-martin.jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 30 May 2024 13:55:43 -0700
Message-ID: <CAMKF1sp-dK-gKXDaaDPvvJ1tynW_O3G_JU8MmqASf=W1r+DvoA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] lvm2: restore Upstream-Status
To: martin.jansa@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000dde1820619b21793"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 20:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110649

--000000000000dde1820619b21793
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for taking care of this

On Thu, May 30, 2024 at 1:34=E2=80=AFPM Martin Jansa via lists.openembedded=
.org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:

> * accidentally removed in:
>
> https://git.openembedded.org/meta-openembedded/diff/meta-oe/recipes-suppo=
rt/lvm2/files/0001-implement-libc-specific-reopen_stream.patch?id=3Dcc4e9fb=
d823a9af1f6b8f622ce86d62172ee9ade
>
> * fixes:
>   ERROR: QA Issue: Missing Upstream-Status in patch
>
> TOPDIR/meta-oe/meta-oe/recipes-support/lvm2/files/0001-implement-libc-spe=
cific-reopen_stream.patch
>   Please add according to
> https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#p=
atch-upstream-status
> . [patch-status]
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  .../lvm2/files/0001-implement-libc-specific-reopen_stream.patch | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git
> a/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_=
stream.patch
> b/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_=
stream.patch
> index a064516e32..e11ac5ac08 100644
> ---
> a/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_=
stream.patch
> +++
> b/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_=
stream.patch
> @@ -13,6 +13,8 @@
> http://git.alpinelinux.org/cgit/aports/tree/main/lvm2/fix-stdio-usage.pat=
ch
>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  Signed-off-by: Dengke Du <dengke.du@windriver.com>
> +
> +Upstream-Status: Pending
>  ---
>   lib/log/log.c      | 6 ++++++
>   tools/lvmcmdline.c | 6 +++---
> --
> 2.45.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110648):
> https://lists.openembedded.org/g/openembedded-devel/message/110648
> Mute This Topic: https://lists.openembedded.org/mt/106396150/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000dde1820619b21793
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks for taking care of this</div><div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 30, 2024=
 at 1:34=E2=80=AFPM Martin Jansa via <a href=3D"http://lists.openembedded.o=
rg">lists.openembedded.org</a> &lt;martin.jansa=3D<a href=3D"mailto:gmail.c=
om@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">* accidentally removed in:<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded/diff/meta-=
oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.pa=
tch?id=3Dcc4e9fbd823a9af1f6b8f622ce86d62172ee9ade" rel=3D"noreferrer" targe=
t=3D"_blank">https://git.openembedded.org/meta-openembedded/diff/meta-oe/re=
cipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch?i=
d=3Dcc4e9fbd823a9af1f6b8f622ce86d62172ee9ade</a><br>
<br>
* fixes:<br>
=C2=A0 ERROR: QA Issue: Missing Upstream-Status in patch<br>
=C2=A0 TOPDIR/meta-oe/meta-oe/recipes-support/lvm2/files/0001-implement-lib=
c-specific-reopen_stream.patch<br>
=C2=A0 Please add according to <a href=3D"https://docs.yoctoproject.org/con=
tributor-guide/recipe-style-guide.html#patch-upstream-status" rel=3D"norefe=
rrer" target=3D"_blank">https://docs.yoctoproject.org/contributor-guide/rec=
ipe-style-guide.html#patch-upstream-status</a> . [patch-status]<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" t=
arget=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../lvm2/files/0001-implement-libc-specific-reopen_stream.patch | 2 +=
+<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specifi=
c-reopen_stream.patch b/meta-oe/recipes-support/lvm2/files/0001-implement-l=
ibc-specific-reopen_stream.patch<br>
index a064516e32..e11ac5ac08 100644<br>
--- a/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reope=
n_stream.patch<br>
+++ b/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reope=
n_stream.patch<br>
@@ -13,6 +13,8 @@ <a href=3D"http://git.alpinelinux.org/cgit/aports/tree/ma=
in/lvm2/fix-stdio-usage.patch" rel=3D"noreferrer" target=3D"_blank">http://=
git.alpinelinux.org/cgit/aports/tree/main/lvm2/fix-stdio-usage.patch</a><br=
>
<br>
=C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Signed-off-by: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.co=
m" target=3D"_blank">dengke.du@windriver.com</a>&gt;<br>
+<br>
+Upstream-Status: Pending<br>
=C2=A0---<br>
=C2=A0 lib/log/log.c=C2=A0 =C2=A0 =C2=A0 | 6 ++++++<br>
=C2=A0 tools/lvmcmdline.c | 6 +++---<br>
-- <br>
2.45.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#110648): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/110648" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/110648</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106396150/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/106396150/1997914</a><br>
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

--000000000000dde1820619b21793--

