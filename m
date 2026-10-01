Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B941CA5FCB
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 02:13:38 +0000 (UTC)
Received: from mail-yx2-f38.google.com (mail-yx2-f38.google.com [74.125.224.166])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2699.1790820809637893139
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 19:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NAF0PvKE;
 spf=pass (domain: gmail.com, ip: 74.125.224.166, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f38.google.com with SMTP id 00721157ae682-8ab408a38bdso11720237b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 19:13:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790820809; cv=none;
        d=google.com; s=arc-20260327;
        b=m31qEY9FwVrfUoJpxL1vXUeTmFzsDHM/ZumeykTO6KYULLaYzY7htTUHXLqEDQ5Ovn
         MBSkKuzkkyUr7uOdTthJfkjA7M/OUCKmIJcpSppODVeSW/AWr4i4d2ULjunwxEHmVkxa
         LgE5gSIE4+HwfSLz+1dEN117RF8q2W4/6jhperorXlg9iveV4W8cxQlXXJ/OywqtVqKb
         aGKUF6Ldx/LHDe9q1mR2ho8+Zj/mjrZjKYOzqO7rS643Ix2/2v5gaLZpup+6Qg4lTKsP
         vXsKVpmCXdPm8z9USYRWpL6FJdWdnUIGGvfYhC3doSXMZ4+/rsyhhPzluyPPSZGiqJfu
         i07g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GdL9kIHeQFacQlLqI9t0VzShQ03OmxfX9BJzoKtCb3s=;
        fh=sQq4UwMItvi2zQkbQsQ7gG/lHqOQ30Mc0djsN0hkevw=;
        b=smSNJnm1gr+6yqJ0axqmRp41SfnghSI4eEpwf/GkXPOjlQOynTeTHnzXTEsbwRdJJ4
         tWEZ5RzRO6BN9nHOoECJRNn0v5uYfnzOTQ1jBkDcQsS6HO6rgaQHlwvMCRYoP7j90Yg9
         1gEXo21Yz5Gefx9T0g9RreH8O5VJdmaNPNbzonk7OUOcV+faNKmJx+JY8bE98r4mt8kQ
         XhvYXXhj7Jx/yTt6l0MZFeSSqSttrMlSV1u+Lxrez1+2TxyE+ajHhtho2LuZwDehx5uI
         Gb6WBRgfOe2sLn2RMS+9Et1hxj0kLc69RzVJOl9KRznxPTPN2ncW/bUacgBkgvCvxLCS
         GvuA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790820809; x=1791425609; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GdL9kIHeQFacQlLqI9t0VzShQ03OmxfX9BJzoKtCb3s=;
        b=NAF0PvKEFO0a7i0HbJPevWYgdTcsc0Wfu5o+1qn3eqShCQuhWfqxhup18aS0qLDSww
         FFBwinP37YTAqNts/FCaBWurK36Wc19jeSvY4W/wuiyGECDQsdrZTQdshh5VtntULf2O
         XiO+Xjf3/j2QxNKSS/HdCxsBlDY0I3+pw/m/y0rl1SkJn7urG9ZDe033J5tmd9YHXIbu
         /p4Bs4hzzc5KO7/LFZFecp+TgrhkM5M5ywTFhd4vAlSIgfKwIB1TsVqbH6ST2/ArTOIy
         xYbCgZZyl/+V53XBwFAacv5dmSJdP6/YybyHUygib+qDXEKLqUcnnQA8Uw+9twD+SdwT
         eW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790820809; x=1791425609;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GdL9kIHeQFacQlLqI9t0VzShQ03OmxfX9BJzoKtCb3s=;
        b=HlM4aFHKFiuw/DjlnQ7akzRXW71R2HS+LWM5jL1n/4+okr/Z9+H0aQVnmPjdmrh2E2
         cSbyYJpVRy8TfwOO5+5e34YUy9DwaKu9L+fnXILQz0Dsa9GuAZFdgbbX7HThQ3UhTNhg
         XqC7T5UE786t+Qk3jC10XmQMFBkDumCVQgRacFZPxmp1F498TNH8A5zyYvPH0pvhJXOU
         GQCME5+52yQxfbWGzht5HIGa9yfS0iyn+20pOPtmnRIwO1lVkfgsXl/3uIL4wQTAdrmh
         rQR4BEsYhAYei0mF8PKa6b+/VS7R9PdUQzEgHxaJHPJuVuWvf7iH5OsuBDV92pIt+gkC
         /5lA==
X-Gm-Message-State: AFq9FYLlRM83R/FZjiM/NQfMXHIHoiJxM81k0H++Dr7aymMJ8yvHJwmh
	5ramHRa6oa169COL+6Yl1v4jFMoNJFkd4w54SlaGLcRM/Ih/lsTYT1u/1UbldkrUuJaKYlXxQAj
	lJSt/RUUflX7n7qQXiHz2r6cPWRpX4qQ=
X-Gm-Gg: AYBFou0BuVFwTIWfxc/5BnGxJ3bQNnhOWo0AeqIIRUoZMZBpuATcBHeOYL2tDp1XegB
	agobYnrqd/0DTP7J/2AdcWz9Z5ZcWhCRlyGtw/pmf0y/9hIfrXX5Vk2i4WRSAb8naQimUXZsnsB
	a5+PlEXKEe8Kp4uQO29NtohggNhA6Z31h80T9giHh0q9IMFBGKq0QENAadeM0aqv1MTk7u/5mgM
	EHp19guMfEGKB8LEuSxwbWjE9Ixq8oj1mkPPh2K6eXnJiX4dTcD6cS5qek1tY+eubXSnP6YmJsB
	J9KXQJLcTHiT8k64qb0AL6Mg1y1pigyUyJz4dHdJv9lb2sh/RPpCfJaqmYT1naCHBk+ezZ+uoA1
	mHqO3bPg1T/t7fpqvOrUx3mcpJmnk5BIz67a4mLFsiSphqsWIFtvLPG80keIV7LdHIBFlNndBuv
	x5Y6nad+Lwx6YALfWl2pS28IwasTN36uIGeUzutBMYNmylthd9fmXvz/74wii23M3ScLHpNmDX0
	R7QSj/4Fk1Rcwcfm4CFqMkEyvtl1tGOclgsnNw2rcOodMg79yexYfJPzOzmX+lohZBfBeYfYlKH
	H+d/JR9FJfZysMFRwbjlJx8it9bZBLiq+sXyhl6b
X-Received: by 2002:a05:690c:9988:b0:895:8474:3c6f with SMTP id
 00721157ae682-8acdacf3b79mr6692507b3.0.1790820808462; Wed, 30 Sep 2026
 19:13:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1790775073.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1790775073.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Sep 2026 19:13:00 -0700
X-Gm-Features: AclHuK_IxTt_kUs97bJk3tz-8Uv48f63I3t8DoGTpMB0rI6EshSgeTWklhOoHq4
Message-ID: <CAMKF1sp3ZbFveEATopAmqaSKjoRCvbU9YynGT_DQzm265s5GKw@mail.gmail.com>
Subject: Re: [oe] [PATCH 00/14] Scarthgap pull request
To: anuj.mittal@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000025199b065cbdf61d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 02:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130548

--00000000000025199b065cbdf61d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged now, thanks Anuj

On Wed, Sep 30, 2026 at 7:06=E2=80=AFAM Anuj Mittal via lists.openembedded.=
org
<anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> Please review and merge these changes in scarthgap. Tested on autobuilder
> and locally:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1836
>
> The following changes since commit
> b5874ea07d69919d9b40d59f2c2f0bbd24bc3259:
>
>   libssh: Fix CVE-2026-59850 (2026-09-02 10:39:59 +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/sca=
rthgap
>
> for you to fetch changes up to 0f00f8b9a21950640da8c5707343e5540133f86e:
>
>   vboxguestdrivers: fix vboxvideo build on kernels lacking
> drm_fb_helper_alloc_info (2026-09-29 16:10:23 +0530)
>
> ----------------------------------------------------------------
>
> Anuj Mittal (1):
>   vboxguestdrivers: fix vboxvideo build on kernels lacking
>     drm_fb_helper_alloc_info
>
> Benjamin Robin (Schneider Electric) (2):
>   libwebsockets: update to version 4.3.10
>   libwebsockets: fix CVE-2026-19773
>
> Deepak Rathore (1):
>   rsyslog: Fix CVE-2026-19654
>
> Himani Ramesh Barde (1):
>   postfix: fix build on hosts with Linux 7.x kernel
>
> Hitendra Prajapati (1):
>   python3-pillow: fix CVE-2026-42311
>
> Jason Schonberg (1):
>   php: upgrade 8.2.33 -> 8.2.34
>
> Peter Marko (3):
>   msgpack-c: patch CVE-2026-72854
>   recipes: correct homepage
>   polkit: patch CVE-2026-4897 and CVE-2026-85498
>
> Rohini Sangam (2):
>   python3-pillow: Security fix for CVE-2026-59198
>   python3-pillow: Security fix for CVE-2026-59204
>
> Viswanath Kraleti (1):
>   libfastjson: switch git branch from master to main
>
> Yogita Urade (1):
>   hdf5: Fix CVE-2026-17572
>
>  ...kedefs-Account-for-linux-7.x-version.patch |  47 +++
>  .../recipes-daemons/postfix/postfix_3.8.19.bb |   1 +
>  .../libwebsockets/CVE-2025-11677.patch        | 161 --------
>  .../libwebsockets/CVE-2025-11678.patch        | 128 -------
>  .../libwebsockets/CVE-2026-19773.patch        |  32 ++
>  ...ckets_4.3.3.bb =3D> libwebsockets_4.3.10.bb} |   7 +-
>  .../msgpack/msgpack-c/CVE-2026-72854.patch    | 127 +++++++
>  .../msgpack/msgpack-c_6.0.0.bb                |   1 +
>  .../php/{php_8.2.33.bb =3D> php_8.2.34.bb}      |   2 +-
>  .../polkit/files/CVE-2026-4897-01.patch       |  64 ++++
>  .../polkit/files/CVE-2026-4897-02.patch       |  32 ++
>  .../polkit/files/CVE-2026-85498.patch         |  38 ++
>  meta-oe/recipes-extended/polkit/polkit_124.bb |   3 +
>  .../rsyslog/libfastjson_1.2304.0.bb           |   2 +-
>  .../rsyslog/CVE-2026-19654-regression.patch   |  56 +++
>  .../rsyslog/rsyslog/CVE-2026-19654.patch      |  52 +++
>  .../rsyslog/rsyslog_8.2402.0.bb               |   2 +
>  .../hdf5/files/CVE-2026-17572.patch           | 272 +++++++++++++
>  meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |   1 +
>  ...-build-decide-if-drm_fb_helper_alloc.patch |  54 +++
>  .../vboxguestdrivers_7.0.14.bb                |   9 +-
>  .../python/python3-beautifulsoup4_4.12.3.bb   |   2 +-
>  .../python/python3-colorzero_2.0.bb           |   2 +-
>  .../python/python3-flask-login_0.6.3.bb       |   2 +-
>  .../python/python3-flask-mail_0.9.1.bb        |   2 +-
>  .../python/python3-flask-user_0.6.19.bb       |   2 +-
>  .../python3-pillow/CVE-2026-42311.patch       | 356 ++++++++++++++++++
>  .../python3-pillow/CVE-2026-59198.patch       |  60 +++
>  .../python3-pillow/CVE-2026-59204.patch       |  37 ++
>  .../python/python3-pillow_10.3.0.bb           |   3 +
>  .../python/python3-pyexpect_1.0.22.bb         |   2 +-
>  31 files changed, 1257 insertions(+), 302 deletions(-)
>  create mode 100644
> meta-networking/recipes-daemons/postfix/files/0001-makedefs-Account-for-l=
inux-7.x-version.patch
>  delete mode 100644
> meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2025-11677.p=
atch
>  delete mode 100644
> meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2025-11678.p=
atch
>  create mode 100644
> meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-19773.p=
atch
>  rename meta-oe/recipes-connectivity/libwebsockets/{libwebsockets_4.3.3.b=
b
> =3D> libwebsockets_4.3.10.bb} (94%)
>  create mode 100644
> meta-oe/recipes-devtools/msgpack/msgpack-c/CVE-2026-72854.patch
>  rename meta-oe/recipes-devtools/php/{php_8.2.33.bb =3D> php_8.2.34.bb}
> (99%)
>  create mode 100644
> meta-oe/recipes-extended/polkit/files/CVE-2026-4897-01.patch
>  create mode 100644
> meta-oe/recipes-extended/polkit/files/CVE-2026-4897-02.patch
>  create mode 100644
> meta-oe/recipes-extended/polkit/files/CVE-2026-85498.patch
>  create mode 100644
> meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2026-19654-regression.patch
>  create mode 100644
> meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2026-19654.patch
>  create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17572.pat=
ch
>  create mode 100644
> meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-vboxvideo-=
let-the-build-decide-if-drm_fb_helper_alloc.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pillow/CVE-2026-42311.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59198.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59204.patch
>
> --
> 2.55.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130524):
> https://lists.openembedded.org/g/openembedded-devel/message/130524
> Mute This Topic: https://lists.openembedded.org/mt/121508685/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000025199b065cbdf61d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Merged now, thanks=C2=A0Anuj</div><br><div class=3D"gmail_=
quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, =
Sep 30, 2026 at 7:06=E2=80=AFAM Anuj Mittal via <a href=3D"http://lists.ope=
nembedded.org">lists.openembedded.org</a> &lt;anuj.mittal=3D<a href=3D"mail=
to:oss.qualcomm.com@lists.openembedded.org">oss.qualcomm.com@lists.openembe=
dded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Please review and merge these changes in scarthgap. Tested on autob=
uilder<br>
and locally:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1836" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1836</a><br>
<br>
The following changes since commit b5874ea07d69919d9b40d59f2c2f0bbd24bc3259=
:<br>
<br>
=C2=A0 libssh: Fix CVE-2026-59850 (2026-09-02 10:39:59 +0530)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-opene=
mbedded-contrib</a> anujm/scarthgap<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib/lo=
g/?h=3Danujm/scarthgap" rel=3D"noreferrer" target=3D"_blank">https://git.op=
enembedded.org/meta-openembedded-contrib/log/?h=3Danujm/scarthgap</a><br>
<br>
for you to fetch changes up to 0f00f8b9a21950640da8c5707343e5540133f86e:<br=
>
<br>
=C2=A0 vboxguestdrivers: fix vboxvideo build on kernels lacking drm_fb_help=
er_alloc_info (2026-09-29 16:10:23 +0530)<br>
<br>
----------------------------------------------------------------<br>
<br>
Anuj Mittal (1):<br>
=C2=A0 vboxguestdrivers: fix vboxvideo build on kernels lacking<br>
=C2=A0 =C2=A0 drm_fb_helper_alloc_info<br>
<br>
Benjamin Robin (Schneider Electric) (2):<br>
=C2=A0 libwebsockets: update to version 4.3.10<br>
=C2=A0 libwebsockets: fix CVE-2026-19773<br>
<br>
Deepak Rathore (1):<br>
=C2=A0 rsyslog: Fix CVE-2026-19654<br>
<br>
Himani Ramesh Barde (1):<br>
=C2=A0 postfix: fix build on hosts with Linux 7.x kernel<br>
<br>
Hitendra Prajapati (1):<br>
=C2=A0 python3-pillow: fix CVE-2026-42311<br>
<br>
Jason Schonberg (1):<br>
=C2=A0 php: upgrade 8.2.33 -&gt; 8.2.34<br>
<br>
Peter Marko (3):<br>
=C2=A0 msgpack-c: patch CVE-2026-72854<br>
=C2=A0 recipes: correct homepage<br>
=C2=A0 polkit: patch CVE-2026-4897 and CVE-2026-85498<br>
<br>
Rohini Sangam (2):<br>
=C2=A0 python3-pillow: Security fix for CVE-2026-59198<br>
=C2=A0 python3-pillow: Security fix for CVE-2026-59204<br>
<br>
Viswanath Kraleti (1):<br>
=C2=A0 libfastjson: switch git branch from master to main<br>
<br>
Yogita Urade (1):<br>
=C2=A0 hdf5: Fix CVE-2026-17572<br>
<br>
=C2=A0...kedefs-Account-for-linux-7.x-version.patch |=C2=A0 47 +++<br>
=C2=A0.../recipes-daemons/postfix/<a href=3D"http://postfix_3.8.19.bb" rel=
=3D"noreferrer" target=3D"_blank">postfix_3.8.19.bb</a> |=C2=A0 =C2=A01 +<b=
r>
=C2=A0.../libwebsockets/CVE-2025-11677.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
61 --------<br>
=C2=A0.../libwebsockets/CVE-2025-11678.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
28 -------<br>
=C2=A0.../libwebsockets/CVE-2026-19773.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 32 ++<br>
=C2=A0...<a href=3D"http://ckets_4.3.3.bb" rel=3D"noreferrer" target=3D"_bl=
ank">ckets_4.3.3.bb</a> =3D&gt; <a href=3D"http://libwebsockets_4.3.10.bb" =
rel=3D"noreferrer" target=3D"_blank">libwebsockets_4.3.10.bb</a>} |=C2=A0 =
=C2=A07 +-<br>
=C2=A0.../msgpack/msgpack-c/CVE-2026-72854.patch=C2=A0 =C2=A0 | 127 +++++++=
<br>
=C2=A0.../msgpack/<a href=3D"http://msgpack-c_6.0.0.bb" rel=3D"noreferrer" =
target=3D"_blank">msgpack-c_6.0.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../php/{<a href=3D"http://php_8.2.33.bb" rel=3D"noreferrer" target=
=3D"_blank">php_8.2.33.bb</a> =3D&gt; <a href=3D"http://php_8.2.34.bb" rel=
=3D"noreferrer" target=3D"_blank">php_8.2.34.bb</a>}=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0.../polkit/files/CVE-2026-4897-01.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 64 ++++<br>
=C2=A0.../polkit/files/CVE-2026-4897-02.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 32 ++<br>
=C2=A0.../polkit/files/CVE-2026-85498.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 38 ++<br>
=C2=A0meta-oe/recipes-extended/polkit/<a href=3D"http://polkit_124.bb" rel=
=3D"noreferrer" target=3D"_blank">polkit_124.bb</a> |=C2=A0 =C2=A03 +<br>
=C2=A0.../rsyslog/<a href=3D"http://libfastjson_1.2304.0.bb" rel=3D"norefer=
rer" target=3D"_blank">libfastjson_1.2304.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../rsyslog/CVE-2026-19654-regression.patch=C2=A0 =C2=A0|=C2=A0 56 ++=
+<br>
=C2=A0.../rsyslog/rsyslog/CVE-2026-19654.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
52 +++<br>
=C2=A0.../rsyslog/<a href=3D"http://rsyslog_8.2402.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">rsyslog_8.2402.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0.../hdf5/files/CVE-2026-17572.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 272 +++++++++++++<br>
=C2=A0meta-oe/recipes-support/hdf5/<a href=3D"http://hdf5_1.14.4-3.bb" rel=
=3D"noreferrer" target=3D"_blank">hdf5_1.14.4-3.bb</a> |=C2=A0 =C2=A01 +<br=
>
=C2=A0...-build-decide-if-drm_fb_helper_alloc.patch |=C2=A0 54 +++<br>
=C2=A0.../<a href=3D"http://vboxguestdrivers_7.0.14.bb" rel=3D"noreferrer" =
target=3D"_blank">vboxguestdrivers_7.0.14.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A09 +-<br>
=C2=A0.../python/<a href=3D"http://python3-beautifulsoup4_4.12.3.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-beautifulsoup4_4.12.3.bb</a>=C2=A0 =
=C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../python/<a href=3D"http://python3-colorzero_2.0.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-colorzero_2.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../python/<a href=3D"http://python3-flask-login_0.6.3.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-flask-login_0.6.3.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../python/<a href=3D"http://python3-flask-mail_0.9.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">python3-flask-mail_0.9.1.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../python/<a href=3D"http://python3-flask-user_0.6.19.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-flask-user_0.6.19.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../python3-pillow/CVE-2026-42311.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 3=
56 ++++++++++++++++++<br>
=C2=A0.../python3-pillow/CVE-2026-59198.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 60 +++<br>
=C2=A0.../python3-pillow/CVE-2026-59204.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 37 ++<br>
=C2=A0.../python/<a href=3D"http://python3-pillow_10.3.0.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-pillow_10.3.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0.../python/<a href=3D"http://python3-pyexpect_1.0.22.bb" rel=3D"noref=
errer" target=3D"_blank">python3-pyexpect_1.0.22.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A031 files changed, 1257 insertions(+), 302 deletions(-)<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/postfix/files/0001=
-makedefs-Account-for-linux-7.x-version.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebs=
ockets/CVE-2025-11677.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebs=
ockets/CVE-2025-11678.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebs=
ockets/CVE-2026-19773.patch<br>
=C2=A0rename meta-oe/recipes-connectivity/libwebsockets/{<a href=3D"http://=
libwebsockets_4.3.3.bb" rel=3D"noreferrer" target=3D"_blank">libwebsockets_=
4.3.3.bb</a> =3D&gt; <a href=3D"http://libwebsockets_4.3.10.bb" rel=3D"nore=
ferrer" target=3D"_blank">libwebsockets_4.3.10.bb</a>} (94%)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/msgpack/msgpack-c/CVE-202=
6-72854.patch<br>
=C2=A0rename meta-oe/recipes-devtools/php/{<a href=3D"http://php_8.2.33.bb"=
 rel=3D"noreferrer" target=3D"_blank">php_8.2.33.bb</a> =3D&gt; <a href=3D"=
http://php_8.2.34.bb" rel=3D"noreferrer" target=3D"_blank">php_8.2.34.bb</a=
>} (99%)<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/polkit/files/CVE-2026-489=
7-01.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/polkit/files/CVE-2026-489=
7-02.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/polkit/files/CVE-2026-854=
98.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2026-=
19654-regression.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2026-=
19654.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17572.=
patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguest=
drivers/0001-vboxvideo-let-the-build-decide-if-drm_fb_helper_alloc.patch<br=
>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pillow=
/CVE-2026-42311.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pillow=
/CVE-2026-59198.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pillow=
/CVE-2026-59204.patch<br>
<br>
-- <br>
2.55.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#130524): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/130524" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/130524</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121508685/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121508685/1997914</a><br>
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

--00000000000025199b065cbdf61d--

