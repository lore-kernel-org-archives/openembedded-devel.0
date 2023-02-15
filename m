Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C9E9C636CC
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 20:27:23 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.4048.1676492837822223275
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Feb 2023 12:27:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G9y7FB69;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id l2so3785306wry.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Feb 2023 12:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1y7zTTqxAaCk6qNfywhAXf/kuunI9BILX66yw/DCGw=;
        b=G9y7FB69xKzlYmKCirv5Snj/caOCtfKlg4woV+ASWgCGEmYJLdbw/v4oDh+uHCfZKF
         OrNgfmTOnQ7pXMOdfisfn3/uH9Rj6gQzGtxwHkEq9RV0U1/v//wdUX1aWqf00k/UDdQ1
         9grhv85MpbR5VunpcEIzYr1XtyfS8YWIaF20jR5dTHkheTcG03TL1FW6Tq5jk0tyrQKA
         avCUJJjhaQiaNnL4RVfxZ6rN5thx/+bTGoF8kqGn9e7gmEPPj1L9u335nHQA7pYG+4XL
         YppFIqpAuCNYPau+/U+1ZOukA4c6Mh1Q48mIVX6zfP0TarHUAf+NRAO0GOdCHcR0vcsH
         YqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z1y7zTTqxAaCk6qNfywhAXf/kuunI9BILX66yw/DCGw=;
        b=URd5qQhcIjvgk/VJj7q3h3cU0PQPGU3ggsGKyaPphZAXleQE2eMvEH90o/HWVsOUOZ
         FF1j8khQN+yb80HisT4HJy6jVHX+CJly5N3XR7lnWAaWyzS5AoIr92qOCqK7OZJdyas8
         04D3dH7YM/oeefmA34expZyFrvAbNQBcE8VxoXyiwLzDA0vS/tMMKeNb/GdKFdap0BDK
         wKfKeHLsbAM77y3SPb2PyYKUL438lIoWPecgBo//L2jUj1NfylNVijplomj/UE3S34EO
         sQTnLNZtM8R6SxImVRQt2l+W6eeGEm7+LZBQoBGiDBzyuHwKqd/H+n5h796yfDrJereE
         eDew==
X-Gm-Message-State: AO0yUKUSlr5rHlK9xddZK8i16n2/QPTiAadjHQjSG88ZT25L/rHRMumG
	gIFhZQ85WPAD3bh/lbp/RpIzBMcSB+3kxPMCQ2sR8bAF4UQ=
X-Google-Smtp-Source: AK7set8rD+a4mRfdSzY3W3NYnpot2ddV6UHw0RqypcY8o76EYaCe+fIsTfws49mRJKzdsEEi0J3f/D92EnfuJGFc6Q0=
X-Received: by 2002:a5d:484a:0:b0:2c5:5788:c516 with SMTP id
 n10-20020a5d484a000000b002c55788c516mr82601wrs.127.1676492836008; Wed, 15 Feb
 2023 12:27:16 -0800 (PST)
MIME-Version: 1.0
References: <20230208131157.2564692-1-archana.polampalli@windriver.com>
In-Reply-To: <20230208131157.2564692-1-archana.polampalli@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 15 Feb 2023 21:27:02 +0100
Message-ID: <CA+chaQcOOhCszggnTyR2fhsuwTGODcb1yZUFfcTyyur2C7Ze8w@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 1/1] Nodejs: fix buildpaths warning
To: "Polampalli, Archana" <archana.polampalli@windriver.com>
Cc: openembedded-devel@lists.openembedded.org, Hari.GPillai@windriver.com
Content-Type: multipart/alternative; boundary="000000000000f5769605f4c2e7ec"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Feb 2023 20:27:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101084

--000000000000f5769605f4c2e7ec
Content-Type: text/plain; charset="UTF-8"

This breaks the do_install when "shared" PACKAGECONFIG is enabled, see:

http://errors.yoctoproject.org/Errors/Details/689959/


On Wed, Feb 8, 2023 at 2:12 PM Polampalli, Archana <
archana.polampalli@windriver.com> wrote:

> Correct libdir used at configure time to avoid packaging warnings
> WARNING: nodejs-18.12.1-r0 do_package_qa: QA Issue:
> File /usr/bin/node in package nodejs contains reference to TMPDIR
> [buildpaths]
> File /usr/bin/.debug/node in package nodejs-dbg contains reference to
> TMPDIR
> File /usr/lib64/nodejs/ptest/.debug/cctest in package nodejs-dbg contains
> reference to TMPDIR [buildpaths]
> File /usr/lib64/nodejs/ptest/cctest in package nodejs-ptest contains
> reference to TMPDIR [buildpaths]
> File /usr/include/node/config.gypi in package nodejs-dev contains
> reference to TMPDIR [buildpaths]
>
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---
>  meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
> b/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
> index e96913e56..04a80a6b8 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
> @@ -145,7 +145,7 @@ do_configure () {
>                 --without-etw \
>                 --dest-cpu="${@map_nodejs_arch(d.getVar('TARGET_ARCH'),
> d)}" \
>                 --dest-os=linux \
> -               --libdir=${D}${libdir} \
> +               --libdir=${libdir} \
>                 ${ARCHFLAGS} \
>                 ${PACKAGECONFIG_CONFARGS}
>  }
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100995):
> https://lists.openembedded.org/g/openembedded-devel/message/100995
> Mute This Topic: https://lists.openembedded.org/mt/96829436/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000f5769605f4c2e7ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This breaks the do_install when &quot;shared&quot; PACKAGE=
CONFIG is enabled, see:<div><br></div><div><a href=3D"http://errors.yoctopr=
oject.org/Errors/Details/689959/">http://errors.yoctoproject.org/Errors/Det=
ails/689959/</a><br><div><br></div></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 8, 2023 at 2:12 PM Pol=
ampalli, Archana &lt;<a href=3D"mailto:archana.polampalli@windriver.com" ta=
rget=3D"_blank">archana.polampalli@windriver.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Correct libdir used at conf=
igure time to avoid packaging warnings<br>
WARNING: nodejs-18.12.1-r0 do_package_qa: QA Issue:<br>
File /usr/bin/node in package nodejs contains reference to TMPDIR [buildpat=
hs]<br>
File /usr/bin/.debug/node in package nodejs-dbg contains reference to TMPDI=
R<br>
File /usr/lib64/nodejs/ptest/.debug/cctest in package nodejs-dbg contains r=
eference to TMPDIR [buildpaths]<br>
File /usr/lib64/nodejs/ptest/cctest in package nodejs-ptest contains refere=
nce to TMPDIR [buildpaths]<br>
File /usr/include/node/config.gypi in package nodejs-dev contains reference=
 to TMPDIR [buildpaths]<br>
<br>
Signed-off-by: Archana Polampalli &lt;<a href=3D"mailto:archana.polampalli@=
windriver.com" target=3D"_blank">archana.polampalli@windriver.com</a>&gt;<b=
r>
---<br>
=C2=A0meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_18.12.1.bb" =
rel=3D"noreferrer" target=3D"_blank">nodejs_18.12.1.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_18.12=
.1.bb" rel=3D"noreferrer" target=3D"_blank">nodejs_18.12.1.bb</a> b/meta-oe=
/recipes-devtools/nodejs/<a href=3D"http://nodejs_18.12.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">nodejs_18.12.1.bb</a><br>
index e96913e56..04a80a6b8 100644<br>
--- a/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_18.12.1.bb" =
rel=3D"noreferrer" target=3D"_blank">nodejs_18.12.1.bb</a><br>
+++ b/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_18.12.1.bb" =
rel=3D"noreferrer" target=3D"_blank">nodejs_18.12.1.bb</a><br>
@@ -145,7 +145,7 @@ do_configure () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --without-etw \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --dest-cpu=3D&quot;=
${@map_nodejs_arch(d.getVar(&#39;TARGET_ARCH&#39;), d)}&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --dest-os=3Dlinux \=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--libdir=3D${D}${li=
bdir} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--libdir=3D${libdir=
} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${ARCHFLAGS} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PACKAGECONFIG_CON=
FARGS}<br>
=C2=A0}<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#100995): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/100995" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/100995</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96829436/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/96829436/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000f5769605f4c2e7ec--

