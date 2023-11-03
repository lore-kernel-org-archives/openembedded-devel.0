Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A8DC4167B
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 18:33:27 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web11.61032.1699036406897117997
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 11:33:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nrr0BITY;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-da0cfcb9f40so2402534276.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 11:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699036406; x=1699641206; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4A0V5SskzeLcQxcTC0LEe+5Eck8AxEdqmVHPPtK8f8M=;
        b=nrr0BITYDal2ahOozvMCV3+oSPDevjQ1qS0G5CCo0oNlgQHNYZDTlcOG0FPwak4AAn
         jxY2XVsPow/Vbmh3oFZQubEv1aJtC8diEWQvSBKvWQwJwjXUyhQv4iUVandsa0Mckj9W
         I2YxMvK/u9M9IG/wNEyRO5+KD9Ir3hfy4S9VQ6HB8G0oS4NDwM7IjQ4N7LYSzR/bG0hD
         7N0C7yptgSKfmhL97z8kSJG+Lxo6n8hkVdV/i1LYqJeb9rae/UaTnBrMKwbUzUg3ICCc
         VpZ6/ZM0Xc/CxXzxNG/rAAXNv0OK13C5uBOYBLW4ePAmm5Vf4uB/wyfdKeH2Cqf2tem2
         koRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699036406; x=1699641206;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4A0V5SskzeLcQxcTC0LEe+5Eck8AxEdqmVHPPtK8f8M=;
        b=YheLG0WlGux2wJFEp8l9ty0kizgkrUp0YrPJ4JM8EZIPvkIgeRdtQ/41biZDCPCDLo
         Hnd5/5COaufKxbyjLCeHxVixHPNls4i2l7MzjD1RUyuz618G6Tp5NuEV1wZDspaS7hd1
         xsw4FrpYXg41gKrWSjnROqbEQdiNUXnAmudhN364rqwP6166m84PGxrTxySyRPJl8aIY
         KxQ8vxS08Kiebhmk3SEWm2lc+g3EhP6GpomkeJ3UwaW7BuI+tVnca3Cg397v+hNXG4TJ
         cZ2oz9gAJbjjQ1VZJ5gkR+iPrPYrmK7c1GDTVxsk6vKOSUkUH3QpI87vL/wIepDzSCZ6
         SyFQ==
X-Gm-Message-State: AOJu0YxZP/Gy33FwchCSQwjZmQ0Kv3xQYUCiAsgVG3aYzTm5TMZLJHEm
	WTfTUIGaBNPVw2VsEDSRCLrU1a11xSxvXtkMbE0=
X-Google-Smtp-Source: AGHT+IF9f1rtWqwBWeS6fdENNqq1KWj0UhFXefXaF43YWl7S/5blS5h9f7ch5ZFdTH6g46jKFD1ycotXLG7Tw4/tBWY=
X-Received: by 2002:a25:fc16:0:b0:d9b:4f28:f6ce with SMTP id
 v22-20020a25fc16000000b00d9b4f28f6cemr20786131ybd.1.1699036405889; Fri, 03
 Nov 2023 11:33:25 -0700 (PDT)
MIME-Version: 1.0
References: <20231103100246.3899364-1-jamin_lin@aspeedtech.com>
 <20231103100246.3899364-2-jamin_lin@aspeedtech.com> <CAMKF1sqiEcDb1XZ5ur_q211SKC95v+qSZA53Q9-0n0UGJ8rdmQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqiEcDb1XZ5ur_q211SKC95v+qSZA53Q9-0n0UGJ8rdmQ@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 3 Nov 2023 11:33:14 -0700
Message-ID: <CANx9H-CyW0-cb_cau0F-NAqAw8AfHmX9-x7Zq0jAj=QZg8kmOQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] ast2600:emmc: unsigned rot image align
 block size (512bytes)
To: Khem Raj <raj.khem@gmail.com>
Cc: jamin_lin@aspeedtech.com, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006effa6060943bd05"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 18:33:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105872

--0000000000006effa6060943bd05
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 3, 2023 at 10:08=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:

> we do not have this recipe in mets-oe. Did you intend to send this patch =
?
>

My guess  is you intended this for openbmc?


> On Fri, Nov 3, 2023 at 3:03=E2=80=AFAM Jamin Lin via lists.openembedded.o=
rg
> <jamin_lin=3Daspeedtech.com@lists.openembedded.org> wrote:
> >
> > Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> > Change-Id: I9b82f11cdf3e8524b99f8dfe6a102fedf2b87e5f
> > ---
> >  .../recipes-aspeed/images/aspeed-image-gen-secureboot.bb  | 8 ++++++++
> >  .../recipes-aspeed/images/aspeed-image-emmcboot.bb        | 5 +++++
> >  2 files changed, 13 insertions(+)
> >
> > diff --git a/meta-aspeed-sdk/meta-ast2600-sdk/recipes-aspeed/images/
> aspeed-image-gen-secureboot.bb
> b/meta-aspeed-sdk/meta-ast2600-sdk/recipes-aspeed/images/
> aspeed-image-gen-secureboot.bb
> > index 7a6ae1fa0b..f0d046ae58 100644
> > --- a/meta-aspeed-sdk/meta-ast2600-sdk/recipes-aspeed/images/
> aspeed-image-gen-secureboot.bb
> > +++ b/meta-aspeed-sdk/meta-ast2600-sdk/recipes-aspeed/images/
> aspeed-image-gen-secureboot.bb
> > @@ -193,6 +193,12 @@ make_recovery_image() {
> >      python3 ${STAGING_BINDIR_NATIVE}/gen_uart_booting_image.py
> ${S}/${GEN_IMAGE_MODE}/${SPL_IMAGE_NAME}
> ${S}/${GEN_IMAGE_MODE}/recovery_${SPL_IMAGE_NAME}
> >  }
> >
> > +make_emmc_unsigned_rot_image() {
> > +    if [ -f ${S}/${GEN_IMAGE_MODE}/${SPL_IMAGE_NAME}.unsigned ]; then
> > +        python3 ${STAGING_BINDIR_NATIVE}/gen_emmc_boot_image.py
> ${S}/${GEN_IMAGE_MODE}/${SPL_IMAGE_NAME}.unsigned
> ${S}/${GEN_IMAGE_MODE}/emmc_${SPL_IMAGE_NAME}.unsigned
> > +    fi
> > +}
> > +
> >  make_boot_partition_ext4() {
> >      # Generate a compressed ext4 filesystem with the fitImage file in
> it to be
> >      # flashed to the user data area at boot partition of the eMMC
> > @@ -617,6 +623,8 @@ python do_deploy() {
> >          bb.build.exec_func("make_recovery_image", d)
> >
> >          if aspeed_boot_emmc =3D=3D "yes":
> > +            print("Make emmc unsigned rot image")
> > +            bb.build.exec_func("make_emmc_unsigned_rot_image", d)
> >              print("Deploy mmc image...")
> >              deploy_mmc_image(d)
> >          else:
> > diff --git a/meta-aspeed-sdk/recipes-aspeed/images/
> aspeed-image-emmcboot.bb b/meta-aspeed-sdk/recipes-aspeed/images/
> aspeed-image-emmcboot.bb
> > index 4faf0d032c..9eb91e8b00 100644
> > --- a/meta-aspeed-sdk/recipes-aspeed/images/aspeed-image-emmcboot.bb
> > +++ b/meta-aspeed-sdk/recipes-aspeed/images/aspeed-image-emmcboot.bb
> > @@ -61,6 +61,11 @@ do_mk_emmc_boot_image_g6() {
> >          install -m 0644
> ${SOURCE_IMAGE_DIR}/${ASPEED_EMMC_IMAGE_UBOOT_SPL_IMAGE}.${UBOOT_SUFFIX}
> ${OUTPUT_IMAGE_DIR}
> >      else
> >          install -m 0644
> ${DEPLOY_DIR_IMAGE}/${ASPEED_IMAGE_UBOOT_SPL_IMAGE}.${UBOOT_SUFFIX}
> ${SOURCE_IMAGE_DIR}/${ASPEED_EMMC_IMAGE_UBOOT_SPL_IMAGE}.${UBOOT_SUFFIX}
> > +        if [ -f
> ${DEPLOY_DIR_IMAGE}/${ASPEED_IMAGE_UBOOT_SPL_IMAGE}.${UBOOT_SUFFIX}.unsig=
ned
> ]; then
> > +            install -m 0644
> ${DEPLOY_DIR_IMAGE}/${ASPEED_IMAGE_UBOOT_SPL_IMAGE}.${UBOOT_SUFFIX}.unsig=
ned
> ${SOURCE_IMAGE_DIR}
> > +            python3 ${STAGING_BINDIR_NATIVE}/gen_emmc_boot_image.py
> ${SOURCE_IMAGE_DIR}/${ASPEED_IMAGE_UBOOT_SPL_IMAGE}.${UBOOT_SUFFIX}.unsig=
ned
> ${SOURCE_IMAGE_DIR}/${ASPEED_EMMC_IMAGE_UBOOT_SPL_IMAGE}.${UBOOT_SUFFIX}.=
unsigned
> > +            install -m 0644
> ${SOURCE_IMAGE_DIR}/${ASPEED_EMMC_IMAGE_UBOOT_SPL_IMAGE}.${UBOOT_SUFFIX}.=
unsigned
> ${OUTPUT_IMAGE_DIR}
> > +        fi
> >      fi
> >  }
> >
> > --
> > 2.25.1
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105871):
> https://lists.openembedded.org/g/openembedded-devel/message/105871
> Mute This Topic: https://lists.openembedded.org/mt/102360863/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000006effa6060943bd05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Nov 3, 2023 at 10:08=E2=80=AFAM Khem Raj &lt;<a hre=
f=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:r=
gb(204,204,204)">we do not have this recipe in mets-oe. Did you intend to s=
end this patch ?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">My guess =C2=A0i=
s you intended this for openbmc?</div><div dir=3D"auto"><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-widt=
h:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,20=
4,204)"><br>
On Fri, Nov 3, 2023 at 3:03=E2=80=AFAM Jamin Lin via <a href=3D"http://list=
s.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded=
.org</a><br>
&lt;jamin_lin=3D<a href=3D"mailto:aspeedtech.com@lists.openembedded.org" ta=
rget=3D"_blank">aspeedtech.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Jamin Lin &lt;<a href=3D"mailto:jamin_lin@aspeedtech.co=
m" target=3D"_blank">jamin_lin@aspeedtech.com</a>&gt;<br>
&gt; Change-Id: I9b82f11cdf3e8524b99f8dfe6a102fedf2b87e5f<br>
&gt; ---<br>
&gt;=C2=A0 .../recipes-aspeed/images/<a href=3D"http://aspeed-image-gen-sec=
ureboot.bb" rel=3D"noreferrer" target=3D"_blank">aspeed-image-gen-secureboo=
t.bb</a>=C2=A0 | 8 ++++++++<br>
&gt;=C2=A0 .../recipes-aspeed/images/<a href=3D"http://aspeed-image-emmcboo=
t.bb" rel=3D"noreferrer" target=3D"_blank">aspeed-image-emmcboot.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 5 +++++<br>
&gt;=C2=A0 2 files changed, 13 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta-aspeed-sdk/meta-ast2600-sdk/recipes-aspeed/images/<a=
 href=3D"http://aspeed-image-gen-secureboot.bb" rel=3D"noreferrer" target=
=3D"_blank">aspeed-image-gen-secureboot.bb</a> b/meta-aspeed-sdk/meta-ast26=
00-sdk/recipes-aspeed/images/<a href=3D"http://aspeed-image-gen-secureboot.=
bb" rel=3D"noreferrer" target=3D"_blank">aspeed-image-gen-secureboot.bb</a>=
<br>
&gt; index 7a6ae1fa0b..f0d046ae58 100644<br>
&gt; --- a/meta-aspeed-sdk/meta-ast2600-sdk/recipes-aspeed/images/<a href=
=3D"http://aspeed-image-gen-secureboot.bb" rel=3D"noreferrer" target=3D"_bl=
ank">aspeed-image-gen-secureboot.bb</a><br>
&gt; +++ b/meta-aspeed-sdk/meta-ast2600-sdk/recipes-aspeed/images/<a href=
=3D"http://aspeed-image-gen-secureboot.bb" rel=3D"noreferrer" target=3D"_bl=
ank">aspeed-image-gen-secureboot.bb</a><br>
&gt; @@ -193,6 +193,12 @@ make_recovery_image() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3 ${STAGING_BINDIR_NATIVE}/gen_uart_booting_=
image.py ${S}/${GEN_IMAGE_MODE}/${SPL_IMAGE_NAME} ${S}/${GEN_IMAGE_MODE}/re=
covery_${SPL_IMAGE_NAME}<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +make_emmc_unsigned_rot_image() {<br>
&gt; +=C2=A0 =C2=A0 if [ -f ${S}/${GEN_IMAGE_MODE}/${SPL_IMAGE_NAME}.unsign=
ed ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3 ${STAGING_BINDIR_NATIVE}/gen_emmc=
_boot_image.py ${S}/${GEN_IMAGE_MODE}/${SPL_IMAGE_NAME}.unsigned ${S}/${GEN=
_IMAGE_MODE}/emmc_${SPL_IMAGE_NAME}.unsigned<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 make_boot_partition_ext4() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Generate a compressed ext4 filesystem with the f=
itImage file in it to be<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # flashed to the user data area at boot partition =
of the eMMC<br>
&gt; @@ -617,6 +623,8 @@ python do_deploy() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.exec_func(&quot;make_recove=
ry_image&quot;, d)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if aspeed_boot_emmc =3D=3D &quot;yes=
&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;Make emmc unsig=
ned rot image&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.exec_func(&quot;ma=
ke_emmc_unsigned_rot_image&quot;, d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;Deploy mmc=
 image...&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deploy_mmc_image(d)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; diff --git a/meta-aspeed-sdk/recipes-aspeed/images/<a href=3D"http://a=
speed-image-emmcboot.bb" rel=3D"noreferrer" target=3D"_blank">aspeed-image-=
emmcboot.bb</a> b/meta-aspeed-sdk/recipes-aspeed/images/<a href=3D"http://a=
speed-image-emmcboot.bb" rel=3D"noreferrer" target=3D"_blank">aspeed-image-=
emmcboot.bb</a><br>
&gt; index 4faf0d032c..9eb91e8b00 100644<br>
&gt; --- a/meta-aspeed-sdk/recipes-aspeed/images/<a href=3D"http://aspeed-i=
mage-emmcboot.bb" rel=3D"noreferrer" target=3D"_blank">aspeed-image-emmcboo=
t.bb</a><br>
&gt; +++ b/meta-aspeed-sdk/recipes-aspeed/images/<a href=3D"http://aspeed-i=
mage-emmcboot.bb" rel=3D"noreferrer" target=3D"_blank">aspeed-image-emmcboo=
t.bb</a><br>
&gt; @@ -61,6 +61,11 @@ do_mk_emmc_boot_image_g6() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${SOURCE_IMAGE_DIR}/=
${ASPEED_EMMC_IMAGE_UBOOT_SPL_IMAGE}.${UBOOT_SUFFIX} ${OUTPUT_IMAGE_DIR}<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${DEPLOY_DIR_IMAGE}/=
${ASPEED_IMAGE_UBOOT_SPL_IMAGE}.${UBOOT_SUFFIX} ${SOURCE_IMAGE_DIR}/${ASPEE=
D_EMMC_IMAGE_UBOOT_SPL_IMAGE}.${UBOOT_SUFFIX}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -f ${DEPLOY_DIR_IMAGE}/${ASPEED_IMAG=
E_UBOOT_SPL_IMAGE}.${UBOOT_SUFFIX}.unsigned ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${DEPLOY_DI=
R_IMAGE}/${ASPEED_IMAGE_UBOOT_SPL_IMAGE}.${UBOOT_SUFFIX}.unsigned ${SOURCE_=
IMAGE_DIR}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 python3 ${STAGING_BINDIR_NA=
TIVE}/gen_emmc_boot_image.py ${SOURCE_IMAGE_DIR}/${ASPEED_IMAGE_UBOOT_SPL_I=
MAGE}.${UBOOT_SUFFIX}.unsigned ${SOURCE_IMAGE_DIR}/${ASPEED_EMMC_IMAGE_UBOO=
T_SPL_IMAGE}.${UBOOT_SUFFIX}.unsigned<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${SOURCE_IM=
AGE_DIR}/${ASPEED_EMMC_IMAGE_UBOOT_SPL_IMAGE}.${UBOOT_SUFFIX}.unsigned ${OU=
TPUT_IMAGE_DIR}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#105871): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/105871" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/105871</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102360863/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/102360863/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000006effa6060943bd05--

