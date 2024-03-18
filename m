Return-Path: <chris.chapuis@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A240BC54E58
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 15:42:35 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web11.47940.1710776551598528038
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 08:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MUP2Rl15;
 spf=pass (domain: gmail.com, ip: 209.85.166.175, mailfrom: chris.chapuis@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3669fadea4cso12509205ab.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 08:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710776551; x=1711381351; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gy6JimEGCci0o/p6J+XJXXFumu7TyPkVpjZwl8PlvgI=;
        b=MUP2Rl15VQoGYmb4HD04BC7XcEGBvLg0wTmpw8tfAyxfxjfanQpZyoei2sTcrcKGCT
         62A28hbyIuub5OuVaJ2/w6cae1WNFIGjGOgRaFmiXl11Hw2RJqNmkUtCYlvZWgxQzUS7
         vcRa2tGU53Sm5u+L+dpaQrzuN4Lj9fx4yu+gPKYuDrfusJ12D6+lJpxznGaUUx4TVqgr
         BhDVz1WwArJKOUP9SpKQcYWy2WF+ne3xf1ez75mrArLoGagrm+BGe0pSLmUu1yKXfsR1
         ebwoQK6AP2eoMZyeKW2OpJAHoOrj2rqcw0vQQcKXl2y1dOPNYLf/ce1rtdqEWnFfe6q2
         Fw5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710776551; x=1711381351;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gy6JimEGCci0o/p6J+XJXXFumu7TyPkVpjZwl8PlvgI=;
        b=dBeC6VzAxBAsANq5a65wxbjZvEAxWNobSlH51IDMDhwrC9/XYXJrCHkdI9MVcQuNUR
         cf6qBByMZMuETD5G/gyjnUoidW3GAJij/Oei1RQLgrJj+PvZv8aBqu/dEgLXEwavbUnC
         IcOmnI3afqo20XHVusIH+m71GcqzwwgIuH8tO4iFoN5fF4FzpSItuqAB3ovY+TmtJLKy
         u5m2jtQC1TW53kkHPNoxwBziyPSbD8SYbWLy6Dat3dcD4z1wP+b2hEK2V5vf7o0Zll+R
         BLBamVwo8odi/YwBWkmBS7wwsb4yDQdP3T59rpoe/gt/e5/LcuSyWzS/F6nJMcHDvqi6
         jCRg==
X-Forwarded-Encrypted: i=1; AJvYcCUnJ6FQXa4pLMGM1kJNHHhAR0Mkm+NBD7UlgE2i8WcL7yCf3zYPEyLPU3Ma5U2GO8wXDRN7VsRHDHkt3EWhLPYaTG2ywZ7QldRm5ivX5EJ0XFaCNQ2wZjps0Q==
X-Gm-Message-State: AOJu0YwlZo4+BMTHLeRI/haSiy3e8IGnP/Wj6VoR2m2qGzIRcWx+R5E9
	xoUocbMXpr2dP6ycoNRbHjE3Urb8vUvjKTkDrKxtsLL413eoALRZMXkQH+dRgPQXMB+XD/KInlV
	ag4jvwhwSVXCeA86KcCOPYqCBido=
X-Google-Smtp-Source: AGHT+IEJPllPGSIo50vuZDhC9Vy2glHBk0G5YUkk/srE7FzBOA++ZCUlbEAqPZgQTl6nQrJ0FznghyHpxoGPTtXyMaE=
X-Received: by 2002:a05:6e02:1c0a:b0:366:bc86:351d with SMTP id
 l10-20020a056e021c0a00b00366bc86351dmr7239810ilh.15.1710776550558; Mon, 18
 Mar 2024 08:42:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240316100056.409758-1-chris.chapuis@gmail.com>
 <20240316100056.409758-7-chris.chapuis@gmail.com> <DB5PR02MB102132F3CAC801E36E7B462A7EF2D2@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <868000cd-9113-4615-89ac-e7d35a564937@denx.de>
In-Reply-To: <868000cd-9113-4615-89ac-e7d35a564937@denx.de>
From: Christophe Chapuis <chris.chapuis@gmail.com>
Date: Mon, 18 Mar 2024 16:42:19 +0100
Message-ID: <CACA7eUT_5948nd+rHtieSTrGmm1J6tjqQ8s8z7g0g5E+xAfkJA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v4 7/7] lvgl: lv-conf.inc: generalize sed instructions
To: Marek Vasut <marex@denx.de>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Fabio Estevam <festevam@denx.de>
Content-Type: multipart/alternative; boundary="00000000000096189a0613f1346c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 15:42:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109405

--00000000000096189a0613f1346c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I avoided \s because it's not well known, and I would also prefer using
[[:space:]] as it is POSIX compliant.

I can propose a patch for this, taking Peter's remarks into account.

On Mon, Mar 18, 2024 at 3:46=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:

> On 3/18/24 2:10 PM, Peter Kjellerstedt wrote:
> >> -----Original Message-----
> >> From: openembedded-devel@lists.openembedded.org <
> openembedded-devel@lists.openembedded.org> On Behalf Of Tofe
> >> Sent: den 16 mars 2024 11:01
> >> To: openembedded-devel@lists.openembedded.org
> >> Cc: Marek Vasut <marex@denx.de>; Khem Raj <raj.khem@gmail.com>; Fabio
> Estevam <festevam@denx.de>; Christophe Chapuis <chris.chapuis@gmail.com>
> >> Subject: [oe] [meta-oe][PATCH v4 7/7] lvgl: lv-conf.inc: generalize se=
d
> instructions
> >>
> >> Use [ \t] to detect optionnal spaces at the beginning of each
> >> line, and after the define.
> >>
> >> Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
> >> ---
> >>   meta-oe/recipes-graphics/lvgl/lv-conf.inc | 46 +++++++++++----------=
--
> >>   1 file changed, 23 insertions(+), 23 deletions(-)
> >>
> >> diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> b/meta-oe/recipes-
> >> graphics/lvgl/lv-conf.inc
> >> index 9ee9f283d..2b5d4a14a 100644
> >> --- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> >> +++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> >> @@ -35,37 +35,37 @@ do_configure:append() {
> >>
> >>       sed -e "s|#if 0 .*Set it to \"1\" to enable content.*|#if 1 //
> Enabled by ${PN}|g" \
> >>           \
> >> -        -e "s|\(^#define LV_USE_LINUX_DRM
> \).*|\1${LVGL_CONFIG_USE_DRM}|g" \
> >> +        -e "s|\(^[ \t]*#define LV_USE_LINUX_DRM[
> \t]\).*|\1${LVGL_CONFIG_USE_DRM}|g" \
> >>           \
> >> -        -e "s|\(^#define LV_USE_LINUX_FBDEV
> \).*|\1${LVGL_CONFIG_USE_FBDEV}|g" \
> >> +        -e "s|\(^[ \t]*#define LV_USE_LINUX_FBDEV[
> \t]\).*|\1${LVGL_CONFIG_USE_FBDEV}|g" \
> >>           \
> >> -        -e "s|\(^#define LV_USE_SDL \).*|\1${LVGL_CONFIG_USE_SDL}|g" =
\
> >> -        -e "s|\(^#define LV_USE_DRAW_SDL
> \).*|\1${LVGL_CONFIG_USE_SDL}|g" \
> >> -        -e "s|\(^ \+#define LV_SDL_BUF_COUNT \).*|\1 2|g" \
> >> -        -e "s|\(^ \+#define LV_SDL_FULLSCREEN
> \).*|\1${LVGL_CONFIG_SDL_FULLSCREEN}|g" \
> >> +        -e "s|\(^[ \t]*#define LV_USE_SDL[
> \t]\).*|\1${LVGL_CONFIG_USE_SDL}|g" \
> >> +        -e "s|\(^[ \t]*#define LV_USE_DRAW_SDL[
> \t]\).*|\1${LVGL_CONFIG_USE_SDL}|g" \
> >> +        -e "s|\(^[ \t]*#define LV_SDL_BUF_COUNT[ \t]\).*|\1 2|g" \
> >> +        -e "s|\(^[ \t]*#define LV_SDL_FULLSCREEN[
> \t]\).*|\1${LVGL_CONFIG_SDL_FULLSCREEN}|g" \
> >>           \
> >> -        -e "s|\(^#define LV_COLOR_DEPTH
> \).*|\1${LVGL_CONFIG_LV_COLOR_DEPTH}|g" \
> >> -        -e "s|\(#define LV_MEM_CUSTOM
> .*\).*|\1${LVGL_CONFIG_LV_MEM_CUSTOM}|g" \
> >> -        -e "s|\(^ \+#define LV_MEM_SIZE
> \).*|\1${LVGL_CONFIG_LV_MEM_SIZE}|g" \
> >> +        -e "s|\(^[ \t]*#define LV_COLOR_DEPTH[
> \t]\).*|\1${LVGL_CONFIG_LV_COLOR_DEPTH}|g" \
> >> +        -e "s|\(^[ \t]*#define LV_MEM_CUSTOM[
> \t].*\).*|\1${LVGL_CONFIG_LV_MEM_CUSTOM}|g" \
> >> +        -e "s|\(^[ \t]*#define LV_MEM_SIZE[
> \t]\).*|\1${LVGL_CONFIG_LV_MEM_SIZE}|g" \
> >>           \
> >> -        -e "s|\(#define LV_TICK_CUSTOM \).*|\1 1|g" \
> >> -        -e "s|\(#define LV_TICK_CUSTOM_INCLUDE \).*|\1 <stdint.h>|g" =
\
> >> -        -e "s|\(#define LV_TICK_CUSTOM_SYS_TIME_EXPR \).*|extern
> uint32_t custom_tick_get(void);\n\1 (custom_tick_get())|g" \
> >> +        -e "s|\(^[ \t]*#define LV_TICK_CUSTOM[ \t]\).*|\1 1|g" \
> >> +        -e "s|\(^[ \t]*#define LV_TICK_CUSTOM_INCLUDE[ \t]\).*|\1
> <stdint.h>|g" \
> >> +        -e "s|\(^[ \t]*#define LV_TICK_CUSTOM_SYS_TIME_EXPR[
> \t]\).*|extern uint32_t custom_tick_get(void);\n\1 (custom_tick_get())|g"=
 \
> >>           \
> >> -        -e "s|\(^#define LV_USE_EVDEV
> \).*|\1${LVGL_CONFIG_USE_EVDEV}|g" \
> >> +        -e "s|\(^[ \t]*#define LV_USE_EVDEV[
> \t]\).*|\1${LVGL_CONFIG_USE_EVDEV}|g" \
> >>           \
> >> -        -e "s|\(^#define LV_USE_ASSERT_NULL \).*|\1${DEBUG_BUILD}|g" =
\
> >> -        -e "s|\(^#define LV_USE_ASSERT_MALLOC \).*|\1${DEBUG_BUILD}|g=
"
> \
> >> -        -e "s|\(^#define LV_USE_ASSERT_STYLE \).*|\1${DEBUG_BUILD}|g"=
 \
> >> -        -e "s|\(^#define LV_USE_ASSERT_MEM_INTEGRITY
> \).*|\1${DEBUG_BUILD}|g" \
> >> -        -e "s|\(^#define LV_USE_ASSERT_OBJ \).*|\1${DEBUG_BUILD}|g" \
> >> +        -e "s|\(^[ \t]*#define LV_USE_ASSERT_NULL[
> \t]\).*|\1${DEBUG_BUILD}|g" \
> >> +        -e "s|\(^[ \t]*#define LV_USE_ASSERT_MALLOC[
> \t]\).*|\1${DEBUG_BUILD}|g" \
> >> +        -e "s|\(^[ \t]*#define LV_USE_ASSERT_STYLE[
> \t]\).*|\1${DEBUG_BUILD}|g" \
> >> +        -e "s|\(^[ \t]*#define LV_USE_ASSERT_MEM_INTEGRITY[
> \t]\).*|\1${DEBUG_BUILD}|g" \
> >> +        -e "s|\(^[ \t]*#define LV_USE_ASSERT_OBJ[
> \t]\).*|\1${DEBUG_BUILD}|g" \
> >>           \
> >> -        -e "s|\(^#define LV_USE_LOG
> \).*|\1${LVGL_CONFIG_LV_USE_LOG}|g" \
> >> -        -e "s|\(^ \+#define LV_LOG_LEVEL
> \).*|\1${LVGL_CONFIG_LV_LOG_LEVEL}|g" \
> >> -        -e "s|\(^ \+#define LV_LOG_PRINTF
> \).*|\1${LVGL_CONFIG_LV_LOG_PRINTF}|g" \
> >> +        -e "s|\(^[ \t]*#define LV_USE_LOG[
> \t]\).*|\1${LVGL_CONFIG_LV_USE_LOG}|g" \
> >> +        -e "s|\(^[ \t]*#define LV_LOG_LEVEL[
> \t]\).*|\1${LVGL_CONFIG_LV_LOG_LEVEL}|g" \
> >> +        -e "s|\(^[ \t]*#define LV_LOG_PRINTF[
> \t]\).*|\1${LVGL_CONFIG_LV_LOG_PRINTF}|g" \
> >>           \
> >> -        -e "s|\(^#define LV_USE_FONT_COMPRESSED
> \).*|\1${LVGL_CONFIG_LV_USE_FONT_COMPRESSED}|g" \
> >> -        -e "s|\(^ \+#define LV_THEME_DEFAULT_DARK
> \).*|\1${LVGL_CONFIG_LV_THEME_DEFAULT_DARK}|g" \
> >> +        -e "s|\(^[ \t]*#define LV_USE_FONT_COMPRESSED[
> \t]\).*|\1${LVGL_CONFIG_LV_USE_FONT_COMPRESSED}|g" \
> >> +        -e "s|\(^[ \t]*#define LV_THEME_DEFAULT_DARK[
> \t]\).*|\1${LVGL_CONFIG_LV_THEME_DEFAULT_DARK}|g" \
> >>           \
> >>           -i "${S}/lv_conf.h"
> >>   }
> >> --
> >> 2.44.0
> >
> > I would recommend the following:
> > * Use "\s" instead of "[ \t]".
>
> I didn't know \s , where is this documented ? Is this similar to
> [[:space:]] ?
>
> > * Enable extended regular expressions (ERE) by adding the -r option.
> >    Then you can change "\(...\)" to "(...)".
> > * Change "\(^....\)" to "^(...)" (with ERE enabled).
> > * Remove the "g" flag as none of the expressions are designed to match
> >    multiple times per line.
>
> Chris, do you want to send a follow up patch (I think this series is
> already applied), or shall I do that while preparing LVGL 9.1 series?
>

--00000000000096189a0613f1346c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div></div><div>I avoided \s because it&#39;s not well kno=
wn, and I would also prefer using [[:space:]] as it is POSIX compliant.</di=
v><div><br></div><div>I can propose a patch for this, taking Peter&#39;s re=
marks into account.<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Mar 18, 2024 at 3:46=E2=80=AFPM Marek=
 Vasut &lt;<a href=3D"mailto:marex@denx.de">marex@denx.de</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On 3/18/24 2:10 PM=
, Peter Kjellerstedt wrote:<br>
&gt;&gt; -----Original Message-----<br>
&gt;&gt; From: <a href=3D"mailto:openembedded-devel@lists.openembedded.org"=
 target=3D"_blank">openembedded-devel@lists.openembedded.org</a> &lt;<a hre=
f=3D"mailto:openembedded-devel@lists.openembedded.org" target=3D"_blank">op=
enembedded-devel@lists.openembedded.org</a>&gt; On Behalf Of Tofe<br>
&gt;&gt; Sent: den 16 mars 2024 11:01<br>
&gt;&gt; To: <a href=3D"mailto:openembedded-devel@lists.openembedded.org" t=
arget=3D"_blank">openembedded-devel@lists.openembedded.org</a><br>
&gt;&gt; Cc: Marek Vasut &lt;<a href=3D"mailto:marex@denx.de" target=3D"_bl=
ank">marex@denx.de</a>&gt;; Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.c=
om" target=3D"_blank">raj.khem@gmail.com</a>&gt;; Fabio Estevam &lt;<a href=
=3D"mailto:festevam@denx.de" target=3D"_blank">festevam@denx.de</a>&gt;; Ch=
ristophe Chapuis &lt;<a href=3D"mailto:chris.chapuis@gmail.com" target=3D"_=
blank">chris.chapuis@gmail.com</a>&gt;<br>
&gt;&gt; Subject: [oe] [meta-oe][PATCH v4 7/7] lvgl: lv-conf.inc: generaliz=
e sed instructions<br>
&gt;&gt;<br>
&gt;&gt; Use [ \t] to detect optionnal spaces at the beginning of each<br>
&gt;&gt; line, and after the define.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Christophe Chapuis &lt;<a href=3D"mailto:chris.chap=
uis@gmail.com" target=3D"_blank">chris.chapuis@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0meta-oe/recipes-graphics/lvgl/lv-conf.inc | 46 +++++++=
++++------------<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 23 insertions(+), 23 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/r=
ecipes-<br>
&gt;&gt; graphics/lvgl/lv-conf.inc<br>
&gt;&gt; index 9ee9f283d..2b5d4a14a 100644<br>
&gt;&gt; --- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc<br>
&gt;&gt; +++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc<br>
&gt;&gt; @@ -35,37 +35,37 @@ do_configure:append() {<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e &quot;s|#if 0 .*Set it to \&quot;=
1\&quot; to enable content.*|#if 1 // Enabled by ${PN}|g&quot; \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^#define LV_USE_LINUX_DR=
M \).*|\1${LVGL_CONFIG_USE_DRM}|g&quot; \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^[ \t]*#define LV_USE_LI=
NUX_DRM[ \t]\).*|\1${LVGL_CONFIG_USE_DRM}|g&quot; \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^#define LV_USE_LINUX_FB=
DEV \).*|\1${LVGL_CONFIG_USE_FBDEV}|g&quot; \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^[ \t]*#define LV_USE_LI=
NUX_FBDEV[ \t]\).*|\1${LVGL_CONFIG_USE_FBDEV}|g&quot; \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^#define LV_USE_SDL \).*=
|\1${LVGL_CONFIG_USE_SDL}|g&quot; \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^#define LV_USE_DRAW_SDL=
 \).*|\1${LVGL_CONFIG_USE_SDL}|g&quot; \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^ \+#define LV_SDL_BUF_C=
OUNT \).*|\1 2|g&quot; \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^ \+#define LV_SDL_FULLS=
CREEN \).*|\1${LVGL_CONFIG_SDL_FULLSCREEN}|g&quot; \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^[ \t]*#define LV_USE_SD=
L[ \t]\).*|\1${LVGL_CONFIG_USE_SDL}|g&quot; \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^[ \t]*#define LV_USE_DR=
AW_SDL[ \t]\).*|\1${LVGL_CONFIG_USE_SDL}|g&quot; \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^[ \t]*#define LV_SDL_BU=
F_COUNT[ \t]\).*|\1 2|g&quot; \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^[ \t]*#define LV_SDL_FU=
LLSCREEN[ \t]\).*|\1${LVGL_CONFIG_SDL_FULLSCREEN}|g&quot; \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^#define LV_COLOR_DEPTH =
\).*|\1${LVGL_CONFIG_LV_COLOR_DEPTH}|g&quot; \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(#define LV_MEM_CUSTOM .*=
\).*|\1${LVGL_CONFIG_LV_MEM_CUSTOM}|g&quot; \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^ \+#define LV_MEM_SIZE =
\).*|\1${LVGL_CONFIG_LV_MEM_SIZE}|g&quot; \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^[ \t]*#define LV_COLOR_=
DEPTH[ \t]\).*|\1${LVGL_CONFIG_LV_COLOR_DEPTH}|g&quot; \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^[ \t]*#define LV_MEM_CU=
STOM[ \t].*\).*|\1${LVGL_CONFIG_LV_MEM_CUSTOM}|g&quot; \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^[ \t]*#define LV_MEM_SI=
ZE[ \t]\).*|\1${LVGL_CONFIG_LV_MEM_SIZE}|g&quot; \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(#define LV_TICK_CUSTOM \=
).*|\1 1|g&quot; \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(#define LV_TICK_CUSTOM_I=
NCLUDE \).*|\1 &lt;stdint.h&gt;|g&quot; \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(#define LV_TICK_CUSTOM_S=
YS_TIME_EXPR \).*|extern uint32_t custom_tick_get(void);\n\1 (custom_tick_g=
et())|g&quot; \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^[ \t]*#define LV_TICK_C=
USTOM[ \t]\).*|\1 1|g&quot; \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^[ \t]*#define LV_TICK_C=
USTOM_INCLUDE[ \t]\).*|\1 &lt;stdint.h&gt;|g&quot; \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^[ \t]*#define LV_TICK_C=
USTOM_SYS_TIME_EXPR[ \t]\).*|extern uint32_t custom_tick_get(void);\n\1 (cu=
stom_tick_get())|g&quot; \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^#define LV_USE_EVDEV \)=
.*|\1${LVGL_CONFIG_USE_EVDEV}|g&quot; \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^[ \t]*#define LV_USE_EV=
DEV[ \t]\).*|\1${LVGL_CONFIG_USE_EVDEV}|g&quot; \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^#define LV_USE_ASSERT_N=
ULL \).*|\1${DEBUG_BUILD}|g&quot; \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^#define LV_USE_ASSERT_M=
ALLOC \).*|\1${DEBUG_BUILD}|g&quot; \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^#define LV_USE_ASSERT_S=
TYLE \).*|\1${DEBUG_BUILD}|g&quot; \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^#define LV_USE_ASSERT_M=
EM_INTEGRITY \).*|\1${DEBUG_BUILD}|g&quot; \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^#define LV_USE_ASSERT_O=
BJ \).*|\1${DEBUG_BUILD}|g&quot; \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^[ \t]*#define LV_USE_AS=
SERT_NULL[ \t]\).*|\1${DEBUG_BUILD}|g&quot; \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^[ \t]*#define LV_USE_AS=
SERT_MALLOC[ \t]\).*|\1${DEBUG_BUILD}|g&quot; \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^[ \t]*#define LV_USE_AS=
SERT_STYLE[ \t]\).*|\1${DEBUG_BUILD}|g&quot; \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^[ \t]*#define LV_USE_AS=
SERT_MEM_INTEGRITY[ \t]\).*|\1${DEBUG_BUILD}|g&quot; \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^[ \t]*#define LV_USE_AS=
SERT_OBJ[ \t]\).*|\1${DEBUG_BUILD}|g&quot; \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^#define LV_USE_LOG \).*=
|\1${LVGL_CONFIG_LV_USE_LOG}|g&quot; \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^ \+#define LV_LOG_LEVEL=
 \).*|\1${LVGL_CONFIG_LV_LOG_LEVEL}|g&quot; \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^ \+#define LV_LOG_PRINT=
F \).*|\1${LVGL_CONFIG_LV_LOG_PRINTF}|g&quot; \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^[ \t]*#define LV_USE_LO=
G[ \t]\).*|\1${LVGL_CONFIG_LV_USE_LOG}|g&quot; \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^[ \t]*#define LV_LOG_LE=
VEL[ \t]\).*|\1${LVGL_CONFIG_LV_LOG_LEVEL}|g&quot; \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^[ \t]*#define LV_LOG_PR=
INTF[ \t]\).*|\1${LVGL_CONFIG_LV_LOG_PRINTF}|g&quot; \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^#define LV_USE_FONT_COM=
PRESSED \).*|\1${LVGL_CONFIG_LV_USE_FONT_COMPRESSED}|g&quot; \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^ \+#define LV_THEME_DEF=
AULT_DARK \).*|\1${LVGL_CONFIG_LV_THEME_DEFAULT_DARK}|g&quot; \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^[ \t]*#define LV_USE_FO=
NT_COMPRESSED[ \t]\).*|\1${LVGL_CONFIG_LV_USE_FONT_COMPRESSED}|g&quot; \<br=
>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|\(^[ \t]*#define LV_THEME_=
DEFAULT_DARK[ \t]\).*|\1${LVGL_CONFIG_LV_THEME_DEFAULT_DARK}|g&quot; \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-i &quot;${S}/lv_conf.h&qu=
ot;<br>
&gt;&gt;=C2=A0 =C2=A0}<br>
&gt;&gt; --<br>
&gt;&gt; 2.44.0<br>
&gt; <br>
&gt; I would recommend the following:<br>
&gt; * Use &quot;\s&quot; instead of &quot;[ \t]&quot;.<br>
<br>
I didn&#39;t know \s , where is this documented ? Is this similar to <br>
[[:space:]] ?<br>
<br>
&gt; * Enable extended regular expressions (ERE) by adding the -r option.<b=
r>
&gt;=C2=A0 =C2=A0 Then you can change &quot;\(...\)&quot; to &quot;(...)&qu=
ot;.<br>
&gt; * Change &quot;\(^....\)&quot; to &quot;^(...)&quot; (with ERE enabled=
).<br>
&gt; * Remove the &quot;g&quot; flag as none of the expressions are designe=
d to match<br>
&gt;=C2=A0 =C2=A0 multiple times per line.<br>
<br>
Chris, do you want to send a follow up patch (I think this series is <br>
already applied), or shall I do that while preparing LVGL 9.1 series?<br>
</blockquote></div>

--00000000000096189a0613f1346c--

