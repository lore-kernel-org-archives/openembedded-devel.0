Return-Path: <nicolas.dechesne@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59516C43334
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 05:50:40 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web08.3966.1655877036704387791
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jun 2022 22:50:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=S2H5SQ87;
 spf=pass (domain: linaro.org, ip: 209.85.208.52,
 mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f52.google.com with SMTP id z7so22304246edm.13
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jun 2022 22:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UThQfTWxvP2au1OxoolhVMgNidFbd/jcxIEX4ApUXxY=;
        b=S2H5SQ87/89VdAr0/FjGHDX/NkCtMp1fW1gFx5VkO8cNWY8adRVEAMpDYhIQDT8B6R
         Glh39r74w0VVexJ+WVfDe36w/yM3kJ2WVpKxrgeevS0FBKOmCDBftE56IGVKs7S/djXg
         uwOlar40IbxTYQFAXrEeZdyY1pO2PVlLdiUxFjf2a2zz8A+nJ1YdoCztPtXPhuIlQmdQ
         fqq24k5CJLyEnewBB3acY3tTYrHN8OhWQTuJnUG1+9FBUHHOdrahCbk2kEbizHe1C/5/
         joQkBrOSRykSlSTsPlFLfmfrmEnGFVDk8FbuYy0Fbro0WwFXTEg45ZBIhIxe8TGXED2m
         WrXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UThQfTWxvP2au1OxoolhVMgNidFbd/jcxIEX4ApUXxY=;
        b=vfdr5OKp7wFS+IPerlC+lr0EFgFwxnZmCysd1FUkdx1GmCeeId25IEqEKDJRdBj56T
         BVKYP+oh2+jcnCIkIkkmRMbyrah7BY3S7K0mcBdc/kraquPwv0mrAGRbg95i7idOqXvi
         v718slqikTQHPhMoq1MSzDWdMaunO1HKPaqY8HM4axjZC9eCxcMky9io6iQuiuKHQUkC
         FDmjuxGj5mJR6ohjz4CutaehJi9dc7qrs7obl203v9DCdfzLv3UYDjwRmS4so+1RN8T4
         /c8TDm0ZmzHElsS9fiXpsyu9ffffc2Yp8CFJK4pFdPN4Z7iifOK0+tzHt3FtmhLwaIaQ
         oX9w==
X-Gm-Message-State: AJIora++0dkHo2lxp7PAPV/c5rAyOm64PMluSjDXyS0DTJsIe5Or0VJ6
	/ugQyj+Z6vUeBqth+zq1jRQA0vkIjQk/HcWez3ofVA==
X-Google-Smtp-Source: 
 AGRyM1t3YqjI7iY1MK3ZWPkwwPCxSU0rBiI2oW7bCPFQYZzZy+Wn/fkgRXEaVHNLL2Ia2Gp+05R8BlAcqQ5+X+tyLMI=
X-Received: by 2002:a05:6402:1d4b:b0:435:8336:6f6e with SMTP id
 dz11-20020a0564021d4b00b0043583366f6emr2081040edb.411.1655877035007; Tue, 21
 Jun 2022 22:50:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220621224203.127059-1-fabien.parent@linaro.org>
In-Reply-To: <20220621224203.127059-1-fabien.parent@linaro.org>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 22 Jun 2022 07:50:24 +0200
Message-ID: 
 <CAP71WjwbeTyWOmneUL0V3w7dNxTOjjLtoMCABk_F+SQB5Pggag@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] gpsd-machine-conf: allow creation of an empty
 package
To: Fabien Parent <fabien.parent@linaro.org>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000076b50f05e202ea6c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jun 2022 05:50:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97558

--00000000000076b50f05e202ea6c
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 22, 2022 at 12:42 AM Fabien Parent <fabien.parent@linaro.org>
wrote:

> gpsd-machine-conf is an empty recipe that does not ship any files on the
> rootfs. This recipe is targeted to be extended by a bbappend that
> will provide the gpsd machine configuration.
>
> In the case where gpsd-machine-conf is included into an image, and if no
> layers is providing the machine configuration, the build fails with
> the following error:
>
>         No match for argument: gpsd-machine-conf
>         Error: Unable to find a match: gpsd-machine-conf
>
> This error is because no package was created for gpsd-machine-conf
> since the recipe does not install any files.
>

It is worth mentioning that this is a new/recent issue which has been
around since June 7 in our CI. Looks like it came after we upgraded opkg to
0.6.0 [1], and the opkg 0.6.0 release notes [2] have this item:

- libsolv will now return a solver error if the user asks to install a
package which does not exist in the feeds.

So it might impact other recipes in case this 'pattern' is used elsewhere.

[1] 1e08da6a4387 (opkg: upgrade to version 0.6.0)
[2] http://downloads.yoctoproject.org/releases/opkg/opkg-0.6.0.release-notes


>
> This commit allows the creation of an empty package in order to avoid
> the do_rootfs failure when this package is included into an image.
>
> Signed-off-by: Fabien Parent <fabien.parent@linaro.org>
> ---
>  meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
> b/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
> index 9c1db3a6b0b1..4ced1c98db6f 100644
> --- a/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
> +++ b/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
> @@ -5,3 +5,4 @@ LIC_FILES_CHKSUM =
> "file://${COREBASE}/meta/files/common-licenses/BSD-3-Clause;m
>  # empty by default
>  # BSP layers can add stuff like meta-openmoko example:
>  #
> +ALLOW_EMPTY:${PN} = "1"
> --
> 2.36.1
>
>

--00000000000076b50f05e202ea6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 22, 2022 at 12:42 AM Fabi=
en Parent &lt;<a href=3D"mailto:fabien.parent@linaro.org">fabien.parent@lin=
aro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">gpsd-machine-conf is an empty recipe that does not ship any files on=
 the<br>
rootfs. This recipe is targeted to be extended by a bbappend that<br>
will provide the gpsd machine configuration.<br>
<br>
In the case where gpsd-machine-conf is included into an image, and if no<br=
>
layers is providing the machine configuration, the build fails with<br>
the following error:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 No match for argument: gpsd-machine-conf<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Error: Unable to find a match: gpsd-machine-con=
f<br>
<br>
This error is because no package was created for gpsd-machine-conf<br>
since the recipe does not install any files.<br></blockquote><div><br></div=
><div>It is worth mentioning that this is a new/recent issue which has been=
 around since June 7 in our CI. Looks like it came after we upgraded opkg t=
o 0.6.0 [1], and the opkg 0.6.0 release notes [2] have this item:</div><div=
><br></div><div>- libsolv will now return a solver error if the user asks t=
o install a package which does not exist in the feeds.</div><div><br></div>=
<div>So it might impact other recipes in case this &#39;pattern&#39; is use=
d elsewhere.=C2=A0</div><div><br></div><div>[1] 1e08da6a4387 (opkg: upgrade=
 to version 0.6.0)</div><div>[2]=C2=A0<a href=3D"http://downloads.yoctoproj=
ect.org/releases/opkg/opkg-0.6.0.release-notes">http://downloads.yoctoproje=
ct.org/releases/opkg/opkg-0.6.0.release-notes</a></div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
This commit allows the creation of an empty package in order to avoid<br>
the do_rootfs failure when this package is included into an image.<br>
<br>
Signed-off-by: Fabien Parent &lt;<a href=3D"mailto:fabien.parent@linaro.org=
" target=3D"_blank">fabien.parent@linaro.org</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-navigation/gpsd/<a href=3D"http://gpsd-machine-conf_1=
.0.bb" rel=3D"noreferrer" target=3D"_blank">gpsd-machine-conf_1.0.bb</a> | =
1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta-oe/recipes-navigation/gpsd/<a href=3D"http://gpsd-machine=
-conf_1.0.bb" rel=3D"noreferrer" target=3D"_blank">gpsd-machine-conf_1.0.bb=
</a> b/meta-oe/recipes-navigation/gpsd/<a href=3D"http://gpsd-machine-conf_=
1.0.bb" rel=3D"noreferrer" target=3D"_blank">gpsd-machine-conf_1.0.bb</a><b=
r>
index 9c1db3a6b0b1..4ced1c98db6f 100644<br>
--- a/meta-oe/recipes-navigation/gpsd/<a href=3D"http://gpsd-machine-conf_1=
.0.bb" rel=3D"noreferrer" target=3D"_blank">gpsd-machine-conf_1.0.bb</a><br=
>
+++ b/meta-oe/recipes-navigation/gpsd/<a href=3D"http://gpsd-machine-conf_1=
.0.bb" rel=3D"noreferrer" target=3D"_blank">gpsd-machine-conf_1.0.bb</a><br=
>
@@ -5,3 +5,4 @@ LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/meta/files/co=
mmon-licenses/BSD-3-Clause;m<br>
=C2=A0# empty by default<br>
=C2=A0# BSP layers can add stuff like meta-openmoko example:<br>
=C2=A0#<br>
+ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
-- <br>
2.36.1<br>
<br>
</blockquote></div></div>

--00000000000076b50f05e202ea6c--

