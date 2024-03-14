Return-Path: <chris.chapuis@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF21FC54E60
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 18:35:21 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web11.459.1710441317507000441
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Mar 2024 11:35:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C2Lw4O6J;
 spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: chris.chapuis@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-36671d34b58so7245145ab.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Mar 2024 11:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710441316; x=1711046116; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iEGYLWvS5q2s8UV3YUeCwh/qNV4C98i5oxGbP95pilw=;
        b=C2Lw4O6JjiFr/8dDEyy4hMZjE1Skbzff+nV3QaLsFDHFZW1WL6bXdOntdk+oKrQEWf
         ZLlHE5XN4L1SdhYkSQ4pje0OEQ2N/zSfH+wIjryvAITGv/qQ65rgnzjmVyHlfWNZrOWW
         BLYW8oJyIeI6bZbFIk0FBNssyIaVV2Km9EBEk9IDsFRmDP0GeOPGSFEr1D4WD7sz0A8h
         ZUQfyc4IMOrY3dB4usCzT/K8f30t5JgXQqzZIqcTaH/Q26o7hUeC3Piqn7epbJSGjORJ
         fiYUwVm8PgYrKrq6DvwQQ1mnhnj3NvGXZlQkUeFebuk0O48foVQ8h2LsE8poWO9luaN2
         yMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710441316; x=1711046116;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iEGYLWvS5q2s8UV3YUeCwh/qNV4C98i5oxGbP95pilw=;
        b=WFNUjbejTdJjvMfa4NgDDcwQC5gB4exVDdtrgYV8AwDmoZcGq+D8cM07SnFyYAj+bu
         ECKM+grRs5w/7IzQjQ3xSOG/dvXWmCD2dmgCq375EO9FAIXicZsbaMgaIXimtDL56cTo
         3XNu5paZ2AoEmOqBmsT207BIRPA1o8yXcsb9EH6iTmBtTN8IvSjgB60HXnYYPltijuyL
         WkYHB+XCpPDVJg5v/DxqsVoBzgEYF9JnHxyfCq0EkposON531FuiAso+IwVl3cnYEiP9
         QlHInpJM7PRCHPMCiGonEN2Q61R019g3538JEx8ax5qtpkib+YBTiTj0bHNXlcumNR+c
         a6Uw==
X-Gm-Message-State: AOJu0YymCWwFKgB8xq06E7D0bXqDhatia3wbn+fNwjlLqlgF6I6Ii/Ka
	Zf0RgSXpIHTJvRnLnp6/yZNAPcSyKdOd642yuZwpfvllcZ3DBt+8MWll3BNwI5z/lfogwZesTp2
	4GM0EkBf5ikVowMozN10GpIEOU87AtqA/
X-Google-Smtp-Source: AGHT+IFtwYU3xwXlUdDh0uSK48R7h1WdM6bVaKRlbp5K5Dv93eaVhXn3+hSrlwwFzXtwhzSqOyML2xKNCz0Py1nQe/4=
X-Received: by 2002:a05:6e02:5ce:b0:365:fe19:8919 with SMTP id
 l14-20020a056e0205ce00b00365fe198919mr2733170ils.29.1710441316477; Thu, 14
 Mar 2024 11:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <17BCB4EBC4571E41.6435@lists.openembedded.org>
In-Reply-To: <17BCB4EBC4571E41.6435@lists.openembedded.org>
From: Christophe Chapuis <chris.chapuis@gmail.com>
Date: Thu, 14 Mar 2024 19:35:05 +0100
Message-ID: <CACA7eUSbrGG83fbPjfrjYQbw-bG-BSz2XZrxj_3OdbWPZZsHEw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] lvgl: fix typo and install lv_conf.h
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>
Content-Type: multipart/alternative; boundary="00000000000013f5030613a327b0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Mar 2024 18:35:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109317

--00000000000013f5030613a327b0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

I realize there is no context in that patch proposal, let me clarify a bit.
First, there is a typo in the first sed instruction, and therefore the #if
0 is never changed to #if 1 at the beginning of lv_conf.h.

Secondly I added an install append to copy the generated lv_conf.h as part
of the lvgl package, so that it will be found and used by the recipes that
want to use lvgl.

With these changes I have a working build for my lvgl app; I added some
additional changes in a bbappend of my own, but I didn't want to put too
many of these in the main lv-conf.inc file so I didn't propose it here.

Christophe

On Thu, Mar 14, 2024 at 7:28=E2=80=AFPM Tofe via lists.openembedded.org
<chris.chapuis=3Dgmail.com@lists.openembedded.org> wrote:

> Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
> ---
>  meta-oe/recipes-graphics/lvgl/lv-conf.inc | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> index cb676ac62..cd14412e1 100644
> --- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> +++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> @@ -24,7 +24,7 @@ do_configure:append() {
>      # If there is a configuration template, start from that
>      [ -r "${S}/lv_conf_template.h" ] && cp -Lv "${S}/lv_conf_template.h"
> "${S}/lv_conf.h"
>
> -    sed -e "s|#if 0 .*Set it to \"1\" to enable the content.*|#if 1 //
> Enabled by ${PN}|g" \
> +    sed -e "s|#if 0 .*Set it to \"1\" to enable content.*|#if 1 //
> Enabled by ${PN}|g" \
>          \
>          -e "s|\(^#define LV_USE_LINUX_DRM \).*|#define LV_USE_LINUX_DRM
> ${LVGL_CONFIG_USE_DRM}|g" \
>          \
> @@ -52,3 +52,8 @@ do_configure:append() {
>          \
>          -i "${S}/lv_conf.h"
>  }
> +
> +do_install:append() {
> +    install -d "${D}${includedir}/lvgl"
> +    install -m 0644 "${S}/lv_conf.h" "${D}${includedir}/lvgl/lv_conf.h"
> +}
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109316):
> https://lists.openembedded.org/g/openembedded-devel/message/109316
> Mute This Topic: https://lists.openembedded.org/mt/104932391/8341124
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> chris.chapuis@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000013f5030613a327b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi</div><div><br></div><div>I realize there is no con=
text in that patch proposal, let me clarify a bit.</div><div>First, there i=
s a typo in the first sed instruction, and therefore the #if 0 is never cha=
nged to #if 1 at the beginning of lv_conf.h.</div><div><br></div><div>Secon=
dly I added an install append to copy the generated lv_conf.h as part of th=
e lvgl package, so that it will be found and used by the recipes that want =
to use lvgl.</div><div><br></div><div>With these changes I have a working b=
uild for my lvgl app; I added some additional changes in a bbappend of my o=
wn, but I didn&#39;t want to put too many of these in the main lv-conf.inc =
file so I didn&#39;t propose it here.<br></div><div><br></div><div>Christop=
he<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Thu, Mar 14, 2024 at 7:28=E2=80=AFPM Tofe via <a href=3D"htt=
p://lists.openembedded.org">lists.openembedded.org</a> &lt;chris.chapuis=3D=
<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openemb=
edded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Signed-off-by: Christophe Chapuis &lt;<a href=3D"mailto:chris.ch=
apuis@gmail.com" target=3D"_blank">chris.chapuis@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-graphics/lvgl/lv-conf.inc | 7 ++++++-<br>
=C2=A01 file changed, 6 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recipes-gr=
aphics/lvgl/lv-conf.inc<br>
index cb676ac62..cd14412e1 100644<br>
--- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc<br>
+++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc<br>
@@ -24,7 +24,7 @@ do_configure:append() {<br>
=C2=A0 =C2=A0 =C2=A0# If there is a configuration template, start from that=
<br>
=C2=A0 =C2=A0 =C2=A0[ -r &quot;${S}/lv_conf_template.h&quot; ] &amp;&amp; c=
p -Lv &quot;${S}/lv_conf_template.h&quot; &quot;${S}/lv_conf.h&quot;<br>
<br>
-=C2=A0 =C2=A0 sed -e &quot;s|#if 0 .*Set it to \&quot;1\&quot; to enable t=
he content.*|#if 1 // Enabled by ${PN}|g&quot; \<br>
+=C2=A0 =C2=A0 sed -e &quot;s|#if 0 .*Set it to \&quot;1\&quot; to enable c=
ontent.*|#if 1 // Enabled by ${PN}|g&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &quot;s|\(^#define LV_USE_LINUX_DRM \)=
.*|#define LV_USE_LINUX_DRM ${LVGL_CONFIG_USE_DRM}|g&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
@@ -52,3 +52,8 @@ do_configure:append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-i &quot;${S}/lv_conf.h&quot;<br>
=C2=A0}<br>
+<br>
+do_install:append() {<br>
+=C2=A0 =C2=A0 install -d &quot;${D}${includedir}/lvgl&quot;<br>
+=C2=A0 =C2=A0 install -m 0644 &quot;${S}/lv_conf.h&quot; &quot;${D}${inclu=
dedir}/lvgl/lv_conf.h&quot;<br>
+}<br>
-- <br>
2.44.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#109316): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/109316" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/109316</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104932391/834=
1124" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/104932391/8341124</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:chris.chapuis@gmail.com"=
 target=3D"_blank">chris.chapuis@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000013f5030613a327b0--

