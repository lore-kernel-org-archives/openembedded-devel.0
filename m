Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C333C5AC67
	for <webhook@archiver.kernel.org>; Sat,  8 Aug 2026 15:52:09 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8254.1786204321939927713
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Aug 2026 08:52:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CSsyJvOe;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8200b55dc47so6589747b3.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Aug 2026 08:52:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786204321; cv=none;
        d=google.com; s=arc-20260327;
        b=Efoq43DJ+aIEOg4OMqCk2WqDCLyv7L42ivVy5YFeqKj+JiWguVyepYDzeDaCxRhGJ/
         YEXExXpmKY0UTFA+Pp1gqvB3dnlgMVGhsQTG0/wSNxQi/G4T2KKesyyPqFbBNv7dAHM7
         y6eK2uy/CvGYV36YmUpGKPAOC2cTD4+W0c3zjQJKiobVTwT9iikQjIRJmARc3XOAu6Pr
         rccJ4wuMa7YYyL0nyN7eleLJEHu9TRHmGxQo5rUeFQMK9CpYhni9RJoJOMwh2LTHS47m
         B9Gy4D0N5AGqiR+r3wQkIISbbcTkFyBZ1EP/1zIR9HF1Qrk1o3Xp7NeS0XZpdBGtK5jC
         fZzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oUVuty06atRVpK9Moi8+JQtbkmSvT9ye7FLwqPu3BhQ=;
        fh=tDsdhJPgG01DWoYSpzSCAIkVHp0Jn1becVrHAX0oCi0=;
        b=nm59zxqbIYFTdxtXGl0rvUuSpXsBc/gKEhCorAM2UpYYbhkr4AbuX9izEx+0Nw1bxA
         /xQi9fIPXTZLzpEoRqon+adkUUGEpSzb4yo2eUvJoww8aQcUJ++EU+2gof8YVMvYZbib
         v9f9pYzAnTzz+2bqJUV/H7Zsi0X0z9K4Lw1gRA+k0mVZRBfZ/fGO/IhVig11FY6uLk4A
         wW0ImI9i7ijqkZf+6f82/nFa9b/KklJIvEvGqA0DKfd2DxuR0WAHF1NFgRTJWGlg5zyG
         Z0rqw6KWNkautxgDo63/FUO9cweWNqxv1aR9U3tiQMez42u4bT9qsS1R9xF7YKEyn14r
         kzOA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786204321; x=1786809121; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oUVuty06atRVpK9Moi8+JQtbkmSvT9ye7FLwqPu3BhQ=;
        b=CSsyJvOeU3i7hshPdXo1twMgMT+MfEDVAHpjjVKiuTKFpJFQZBwpRTyTwkxDRl0eYo
         E0DYm9YaoHvoSQ9UratQ4CnrQZQanU/etDj+a6Az3FO2sSqpnIr0RRuVQ+o/f+OMwCIe
         zjhplXM+d58XshoWXtloSPfY5gbEWw/Mv3oLOem3CIaedzcHfw9Lv5azOc6bNV6R3ShD
         3Qym37WegZndInHRwQGOUsviECFBiYqDr73y3OSbAAxS3XwWFyRWwOizYBnQArfVCcbJ
         9ZyLUhYn3lN+kUkBzAYF2uLve7ZhOmX2+llAvGLZU6lfQcxd+ReA3d5CaljDRMBI8ddG
         Fz5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786204321; x=1786809121;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oUVuty06atRVpK9Moi8+JQtbkmSvT9ye7FLwqPu3BhQ=;
        b=Ft/VPHe/n24qR8L+B7Rxz2msaHzmL2bvNbArTrEV03mvIky6o8naboB3Apn7WgKQaC
         BGc5oig/dkq0JkYED7buVcgnL2h4Jfo+SJf5r33UPeGwAuZTPXvNqM77B82xOd8zJPvj
         3KPZ35WvE/g9wSQ46kKxgtE757CM6ahDyKaPQRnCFxo6UzyRotRE5ROQpRzPu2HduGg/
         Nw4PEPNU0+f1guzBBJ2Yd2XCLdtlA1H6vCgqMG7aonT0Pgo43G1iKDb0dGCReLHaAdR8
         tbU59q1gyZy9ci8xAEwb07WqTTxFHQSPO6djOV4jyBwoRKypGnVkWGEagqIjqS7xtwX1
         02dw==
X-Gm-Message-State: AOJu0Ywye1WHHmvxZ11UwlvPL7O3hbYpcDnAF8/8dKQk9nRbXCIrLBwt
	fAC4ncCjO67rIbqlNZXIZ+4g3ZeqgxvZGObSWKDC9+a2MPKfhtNzmrKDmRURi1OMKUbZuuQR4da
	EKwLB+pZ2uFt6div9lWRl7Iy0DL2wifw=
X-Gm-Gg: AR+sD113yfiWJbOh1/nkG8ZWk4Ha1v93TKhp7ncNUcUN18emNXpQHLK14nkntvti0pc
	Uw+xncpBJ5IJ5ybQTYG5BROIf+P1nQcCiQNuv4xttwrq0AsejnDfrcy8tQ1enZ9vdpfRccYe7cF
	fNVoeBOn9TPq86FcWycKqdUuDc9m3uxsBsQTqgxUjyJF5aCU+OSUSfrlq00IGRMEESjX6RCvaZJ
	egGA+RE8TgfOmW0s5EfquGI07y6jW3TzWMzCY/YblZSI46fFytDDsPSBZfyydv0U8q4S/QJN13w
	otPBBl56x9k8Rua1ZWCejZ1mnGTLrcGfUI3IPMm/Oz/ynNXJFxF113ihjVGNFYiErSAEnxBX7Hm
	O8VVwdF/d7SRzGNUo66ugUIRGEEPzBXYCCnyatfapeEMvA6U3WjFL2R7AOYhhVEl36rrb7vhBT/
	w39SB9Sydi7fE4UOO5+ZDJ0MlZQYF/hH2OBFzgnDNySqsUxseNMbI5
X-Received: by 2002:a05:690c:6302:b0:7ff:19d6:74ee with SMTP id
 00721157ae682-825788334e9mr50679707b3.33.1786204320775; Sat, 08 Aug 2026
 08:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260808124744.468104-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260808124744.468104-1-dmitry.baryshkov@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 8 Aug 2026 08:51:34 -0700
X-Gm-Features: AUfX_mzIzx_RUjPDHc6pGHt8BxiPlMBJQ0gkeLPfr0CRJ0gtJUqlqH2ZirilMFI
Message-ID: <CAMKF1srO3P5izzfUmA1UXGX+onL3VJGTxADppoLP0sj9BPhfoA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] thermald: fix building on 32-bit ARM systems
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000009441e06588b1a66"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Aug 2026 15:52:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128869

--00000000000009441e06588b1a66
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 8, 2026 at 5:47=E2=80=AFAM Dmitry Baryshkov via lists.openembed=
ded.org
<dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> Apply a patch fixing the following error:
>
> thd_gddv.cpp: In member function 'int
> thd_gddv::evaluate_condition(condition&)':
> thd_gddv.cpp:1721:39: error: format '%ld' expects argument of type 'long
> int', but argument 4 has type 'time_t' {aka 'long long int'}
> [-Werror=3Dformat=3D]
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  ..._gddv-fix-building-on-32-bit-systems.patch | 29 +++++++++++++++++++
>  .../recipes-bsp/thermald/thermald_2.5.12.bb   |  5 +++-
>  2 files changed, 33 insertions(+), 1 deletion(-)
>  create mode 100644
> meta-oe/recipes-bsp/thermald/thermald/0001-thd_gddv-fix-building-on-32-bi=
t-systems.patch
>
> diff --git
> a/meta-oe/recipes-bsp/thermald/thermald/0001-thd_gddv-fix-building-on-32-=
bit-systems.patch
> b/meta-oe/recipes-bsp/thermald/thermald/0001-thd_gddv-fix-building-on-32-=
bit-systems.patch
> new file mode 100644
> index 000000000000..b445c98db9bb
> --- /dev/null
> +++
> b/meta-oe/recipes-bsp/thermald/thermald/0001-thd_gddv-fix-building-on-32-=
bit-systems.patch
> @@ -0,0 +1,29 @@
> +From 30251d7754fe308251747dc40328a52a6b0e0601 Mon Sep 17 00:00:00 2001
> +From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> +Date: Sat, 8 Aug 2026 00:27:15 +0300
> +Subject: [PATCH] thd_gddv: fix building on 32-bit systems
> +
> +Fix the error caused by type mismatch:
> +
> +src/thd_gddv.cpp: In member function 'int
> cthd_gddv::evaluate_condition(condition&)':
> +src/thd_gddv.cpp:1721:39: error: format '%ld' expects argument of type
> 'long int', but argument 4 has type 'time_t' {aka 'long long int'}
> [-Werror=3Dformat=3D]
> +
> +Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> +Upstream-Status: Pending [waiting for clearance]
> +---
> + src/thd_gddv.cpp | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/thd_gddv.cpp b/src/thd_gddv.cpp
> +index e822b9f72f45..a2691594960d 100644
> +--- a/src/thd_gddv.cpp
> ++++ b/src/thd_gddv.cpp
> +@@ -1718,7 +1718,7 @@ int cthd_gddv::evaluate_condition(struct condition=
&
> condition) {
> +                       return ret;
> +
> +               if (condition.time) {
> +-                      thd_log_debug("time condition matched %ld \n",
> condition.state_entry_time);
> ++                      thd_log_debug("time condition matched %" PRId64"
> \n", condition.state_entry_time);
>

I think there should be a space between PRId64 and end quote. There is
another pattern to fix these kind
of errors where typecast is used e.g. (intmax_t)condition.state_entry_time,
I do see this pattern used in
same file e.g. see

https://github.com/intel/thermal_daemon/blob/2d93d94c2b726c6b7695104c0f43b0=
cfaa533568/src/thd_gddv.cpp#L545

I think it would be good to make it consistent from upstreaming point of
view,


> +                       if (condition.state_entry_time =3D=3D 0) {
> +                               condition.state_entry_time =3D time(nullp=
tr);
> +                               return THD_ERROR;
> diff --git a/meta-oe/recipes-bsp/thermald/thermald_2.5.12.bb
> b/meta-oe/recipes-bsp/thermald/thermald_2.5.12.bb
> index 6b193466a367..937e9a5705c2 100644
> --- a/meta-oe/recipes-bsp/thermald/thermald_2.5.12.bb
> +++ b/meta-oe/recipes-bsp/thermald/thermald_2.5.12.bb
> @@ -12,7 +12,10 @@ DEPENDS +=3D "autoconf-archive-native"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dea8831610e926e2e469075b52bf08=
848"
>
> -SRC_URI =3D "git://
> github.com/intel/thermal_daemon/;branch=3Dmaster;protocol=3Dhttps;tag=3Dv=
${PV}
> <http://github.com/intel/thermal_daemon/;branch=3Dmaster;protocol=3Dhttps=
;tag=3Dv$%7BPV%7D>
> "
> +SRC_URI =3D " \
> +    git://
> github.com/intel/thermal_daemon/;branch=3Dmaster;protocol=3Dhttps;tag=3Dv=
${PV}
> <http://github.com/intel/thermal_daemon/;branch=3Dmaster;protocol=3Dhttps=
;tag=3Dv$%7BPV%7D>
> \
> +    file://0001-thd_gddv-fix-building-on-32-bit-systems.patch \
> +"
>
>  SRCREV =3D "9996a1a1cdd01d32cd411459368a177f463d0047"
>
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128868):
> https://lists.openembedded.org/g/openembedded-devel/message/128868
> Mute This Topic: https://lists.openembedded.org/mt/120656212/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000009441e06588b1a66
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Aug 8, =
2026 at 5:47=E2=80=AFAM Dmitry Baryshkov via <a href=3D"http://lists.openem=
bedded.org">lists.openembedded.org</a> &lt;dmitry.baryshkov=3D<a href=3D"ma=
ilto:oss.qualcomm.com@lists.openembedded.org">oss.qualcomm.com@lists.openem=
bedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Apply a patch fixing the following error:<br>
<br>
thd_gddv.cpp: In member function &#39;int thd_gddv::evaluate_condition(cond=
ition&amp;)&#39;:<br>
thd_gddv.cpp:1721:39: error: format &#39;%ld&#39; expects argument of type =
&#39;long int&#39;, but argument 4 has type &#39;time_t&#39; {aka &#39;long=
 long int&#39;} [-Werror=3Dformat=3D]<br>
<br>
Signed-off-by: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@oss.=
qualcomm.com" target=3D"_blank">dmitry.baryshkov@oss.qualcomm.com</a>&gt;<b=
r>
---<br>
=C2=A0..._gddv-fix-building-on-32-bit-systems.patch | 29 ++++++++++++++++++=
+<br>
=C2=A0.../recipes-bsp/thermald/<a href=3D"http://thermald_2.5.12.bb" rel=3D=
"noreferrer" target=3D"_blank">thermald_2.5.12.bb</a>=C2=A0 =C2=A0|=C2=A0 5=
 +++-<br>
=C2=A02 files changed, 33 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta-oe/recipes-bsp/thermald/thermald/0001-thd_gdd=
v-fix-building-on-32-bit-systems.patch<br>
<br>
diff --git a/meta-oe/recipes-bsp/thermald/thermald/0001-thd_gddv-fix-buildi=
ng-on-32-bit-systems.patch b/meta-oe/recipes-bsp/thermald/thermald/0001-thd=
_gddv-fix-building-on-32-bit-systems.patch<br>
new file mode 100644<br>
index 000000000000..b445c98db9bb<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-bsp/thermald/thermald/0001-thd_gddv-fix-building-on-3=
2-bit-systems.patch<br>
@@ -0,0 +1,29 @@<br>
+From 30251d7754fe308251747dc40328a52a6b0e0601 Mon Sep 17 00:00:00 2001<br>
+From: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@oss.qualcomm=
.com" target=3D"_blank">dmitry.baryshkov@oss.qualcomm.com</a>&gt;<br>
+Date: Sat, 8 Aug 2026 00:27:15 +0300<br>
+Subject: [PATCH] thd_gddv: fix building on 32-bit systems<br>
+<br>
+Fix the error caused by type mismatch:<br>
+<br>
+src/thd_gddv.cpp: In member function &#39;int cthd_gddv::evaluate_conditio=
n(condition&amp;)&#39;:<br>
+src/thd_gddv.cpp:1721:39: error: format &#39;%ld&#39; expects argument of =
type &#39;long int&#39;, but argument 4 has type &#39;time_t&#39; {aka &#39=
;long long int&#39;} [-Werror=3Dformat=3D]<br>
+<br>
+Signed-off-by: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@oss=
.qualcomm.com" target=3D"_blank">dmitry.baryshkov@oss.qualcomm.com</a>&gt;<=
br>
+Upstream-Status: Pending [waiting for clearance]<br>
+---<br>
+ src/thd_gddv.cpp | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/thd_gddv.cpp b/src/thd_gddv.cpp<br>
+index e822b9f72f45..a2691594960d 100644<br>
+--- a/src/thd_gddv.cpp<br>
++++ b/src/thd_gddv.cpp<br>
+@@ -1718,7 +1718,7 @@ int cthd_gddv::evaluate_condition(struct condition&a=
mp; condition) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return ret;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (condition.time)=
 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 thd_log_debug(&quot;time condition matched %ld \n&quot;, condition.stat=
e_entry_time);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 thd_log_debug(&quot;time condition matched %&quot; PRId64&quot; \n&quot=
;, condition.state_entry_time);<br></blockquote><div><br></div><div>I think=
 there should be a space between PRId64 and end quote. There is another pat=
tern to fix these kind</div><div>of errors where typecast is used e.g. (int=
max_t)condition.state_entry_time, I do see this pattern used in</div><div>s=
ame file e.g. see</div><div><br></div><div><a href=3D"https://github.com/in=
tel/thermal_daemon/blob/2d93d94c2b726c6b7695104c0f43b0cfaa533568/src/thd_gd=
dv.cpp#L545">https://github.com/intel/thermal_daemon/blob/2d93d94c2b726c6b7=
695104c0f43b0cfaa533568/src/thd_gddv.cpp#L545</a></div><div><br></div><div>=
I think it would be good to make it consistent from upstreaming point of vi=
ew,</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (condition.state_entry_time =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0condition.state_entry_time =3D time(n=
ullptr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return THD_ERROR;<br>
diff --git a/meta-oe/recipes-bsp/thermald/<a href=3D"http://thermald_2.5.12=
.bb" rel=3D"noreferrer" target=3D"_blank">thermald_2.5.12.bb</a> b/meta-oe/=
recipes-bsp/thermald/<a href=3D"http://thermald_2.5.12.bb" rel=3D"noreferre=
r" target=3D"_blank">thermald_2.5.12.bb</a><br>
index 6b193466a367..937e9a5705c2 100644<br>
--- a/meta-oe/recipes-bsp/thermald/<a href=3D"http://thermald_2.5.12.bb" re=
l=3D"noreferrer" target=3D"_blank">thermald_2.5.12.bb</a><br>
+++ b/meta-oe/recipes-bsp/thermald/<a href=3D"http://thermald_2.5.12.bb" re=
l=3D"noreferrer" target=3D"_blank">thermald_2.5.12.bb</a><br>
@@ -12,7 +12,10 @@ DEPENDS +=3D &quot;autoconf-archive-native&quot;<br>
=C2=A0LICENSE =3D &quot;GPL-2.0-only&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dea8831610e926e2e46907=
5b52bf08848&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/intel/thermal_daemon/=
;branch=3Dmaster;protocol=3Dhttps;tag=3Dv$%7BPV%7D" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/intel/thermal_daemon/;branch=3Dmaster;protocol=3Dh=
ttps;tag=3Dv${PV}</a>&quot;<br>
+SRC_URI =3D &quot; \<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://github.com/intel/thermal_daemon/;bra=
nch=3Dmaster;protocol=3Dhttps;tag=3Dv$%7BPV%7D" rel=3D"noreferrer" target=
=3D"_blank">github.com/intel/thermal_daemon/;branch=3Dmaster;protocol=3Dhtt=
ps;tag=3Dv${PV}</a> \<br>
+=C2=A0 =C2=A0 file://0001-thd_gddv-fix-building-on-32-bit-systems.patch \<=
br>
+&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;9996a1a1cdd01d32cd411459368a177f463d0047&quot;<br>
<br>
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128868): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128868" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/128868</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120656212/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120656212/1997914</a><br>
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

--00000000000009441e06588b1a66--

