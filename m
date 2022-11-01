Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D7C4FA373D
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 05:25:08 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.2879.1667280296442620079
 for <Openembedded-devel@lists.openembedded.org>;
 Mon, 31 Oct 2022 22:24:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kXmqd+XL;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id t25so34547815ejb.8
        for <Openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 22:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rUxwtgJD3LoM2HjKLjKKN6FkRSfw44nE5riQ+JbE/io=;
        b=kXmqd+XLQ/rtTgEe3HVJQh8OeSpytSjLEq3Vzd8obNBJKz9zqJ4kPu8HehM+ilPr9R
         7E6zw/cP6/xVVHuF0b1RuZFoL1mJkOISB9dn6vvpgcyxFdKc0rTWgvi+itRNGuol81+x
         ZP3qkKH6LC8dLqK9iAN8k5JqMkYn56srEPaD0E/6Ib5r8m1JkasH64yHdpWZ1+yFqEUj
         WY1swwauE8OGp1GnC6/IirhKfJE43iSc6a7Q4KZaXTaSGXfWy0ahUd62vHixi+K3AAIT
         EjrT59jjYq9DhfSWk/20XEZNL25PFdlw/wflkwECqAXoPNzdHpjY+ndKe9Avubo6f9Za
         amGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUxwtgJD3LoM2HjKLjKKN6FkRSfw44nE5riQ+JbE/io=;
        b=vcc5HaDXeeRrvXXKSuaWOJqoD7CmD67u5O62CAP4Qy+SCKGvAx4e2RvCzotx8ZovON
         TQ6gcol8ds9p4CBzSZjea5eG+wsBhVyw8WylWZpMvyswrCIDmBmNjZlMkyUByDvlty/C
         LMHFuMFXLz3jYZFgnHAXjnBnPc3JH2oIY8wtZexnZm6uHRr777DkWfplRnlHYqBRMeYi
         GcX/Zd6C6D/2vIonj2BImXAP/95kthpuEltrxX/iX5KNc/I1hK3OSfzgbqsB0p9aY07+
         3NkFWQ/Rfxu+CmD1QDuOm4Fz6WMcItk1lkThx0NUTpC4x3G2LhfIpjgCpYlLXoyoNrkg
         ChvQ==
X-Gm-Message-State: ACrzQf0pwG3RJKUlhLelkyhKCY1S2WQdbBdb1SVFjSZYEooOtYGi5gdN
	5vPv1QgjQlmcQa+ZnRZ/o5YOZJCUMZVXTfb+3R8=
X-Google-Smtp-Source: AMsMyM7ri5hBJSMDOEbu0IyJmUUpMz32To6/i6pAJrTxvFDKcPcayRxgi7pI0QtddAPUPlRk6IQSFl221TqHFIU8/2Q=
X-Received: by 2002:a17:906:f854:b0:7ad:d196:9df with SMTP id
 ks20-20020a170906f85400b007add19609dfmr8935010ejb.295.1667280294478; Mon, 31
 Oct 2022 22:24:54 -0700 (PDT)
MIME-Version: 1.0
References: <1667268480-10004-1-git-send-email-wangmy@fujitsu.com> <1667268480-10004-4-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1667268480-10004-4-git-send-email-wangmy@fujitsu.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 31 Oct 2022 22:24:43 -0700
Message-ID: <CANx9H-ApF5Ng8Kc33_=KBLhWGUkC-hFgzzthEXhT3B1eAQC7RQ@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-pytest-xdist: upgrade 2.5.0 -> 3.0.2
To: wangmy <wangmy@fujitsu.com>
Cc: Openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b188e505ec61f19a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Nov 2022 05:25:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99394

--000000000000b188e505ec61f19a
Content-Type: text/plain; charset="UTF-8"

Will you PLEASE put info in the commit message for such a major upgrade? It
took me 5 seconds to find this link:

https://pytest-xdist.readthedocs.io/en/latest/changelog.html


On Mon, Oct 31, 2022 at 7:08 PM wangmy <wangmy@fujitsu.com> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...hon3-pytest-xdist_2.5.0.bb => python3-pytest-xdist_3.0.2.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-pytest-xdist_2.5.0.bb
> => python3-pytest-xdist_3.0.2.bb} (84%)
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-pytest-xdist_2.5.0.bb b/meta-python/recipes-devtools/python/
> python3-pytest-xdist_3.0.2.bb
> similarity index 84%
> rename from meta-python/recipes-devtools/python/
> python3-pytest-xdist_2.5.0.bb
> rename to meta-python/recipes-devtools/python/
> python3-pytest-xdist_3.0.2.bb
> index c3e69e3e0a..4024905710 100644
> --- a/meta-python/recipes-devtools/python/python3-pytest-xdist_2.5.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pytest-xdist_3.0.2.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pytest-dev/pytest-xdist"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=772fcdaca14b378878d05c7d857e6c3e"
>
> -SRC_URI[sha256sum] =
> "4580deca3ff04ddb2ac53eba39d76cb5dd5edeac050cb6fbc768b0dd712b4edf"
> +SRC_URI[sha256sum] =
> "688da9b814370e891ba5de650c9327d1a9d861721a524eb917e620eec3e90291"
>
>  inherit pypi python_setuptools_build_meta
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99390):
> https://lists.openembedded.org/g/openembedded-devel/message/99390
> Mute This Topic: https://lists.openembedded.org/mt/94701256/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000b188e505ec61f19a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Will you PLEASE put info in the commit message for such a=
 major upgrade? It took me 5 seconds to find this link:</div><div dir=3D"au=
to"><br></div><div dir=3D"auto"><div><a href=3D"https://pytest-xdist.readth=
edocs.io/en/latest/changelog.html">https://pytest-xdist.readthedocs.io/en/l=
atest/changelog.html</a></div>=C2=A0</div><div dir=3D"auto"><br><div class=
=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Mon,=
 Oct 31, 2022 at 7:08 PM wangmy &lt;<a href=3D"mailto:wangmy@fujitsu.com">w=
angmy@fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Fr=
om: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank"=
>wangmy@fujitsu.com</a>&gt;<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...<a href=3D"http://hon3-pytest-xdist_2.5.0.bb" rel=3D"noreferrer" t=
arget=3D"_blank">hon3-pytest-xdist_2.5.0.bb</a> =3D&gt; <a href=3D"http://p=
ython3-pytest-xdist_3.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
pytest-xdist_3.0.2.bb</a>} | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-pytest-xdist_2.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest=
-xdist_2.5.0.bb</a> =3D&gt; <a href=3D"http://python3-pytest-xdist_3.0.2.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-pytest-xdist_3.0.2.bb</a>} (=
84%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pytest-xdist_2.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-=
xdist_2.5.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://=
python3-pytest-xdist_3.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-pytest-xdist_3.0.2.bb</a><br>
similarity index 84%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-p=
ytest-xdist_2.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-x=
dist_2.5.0.bb</a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-pyt=
est-xdist_3.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-xdi=
st_3.0.2.bb</a><br>
index c3e69e3e0a..4024905710 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
xdist_2.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-xdist_2=
.5.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
xdist_3.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-xdist_3=
.0.2.bb</a><br>
@@ -3,7 +3,7 @@ HOMEPAGE =3D &quot;<a href=3D"https://github.com/pytest-dev=
/pytest-xdist" rel=3D"noreferrer" target=3D"_blank">https://github.com/pyte=
st-dev/pytest-xdist</a>&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D772fcdaca14b378878d05=
c7d857e6c3e&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;4580deca3ff04ddb2ac53eba39d76cb5dd5edeac050cb=
6fbc768b0dd712b4edf&quot;<br>
+SRC_URI[sha256sum] =3D &quot;688da9b814370e891ba5de650c9327d1a9d861721a524=
eb917e620eec3e90291&quot;<br>
<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#99390): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/99390" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/99390</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94701256/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
94701256/924729</a><br>
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

--000000000000b188e505ec61f19a--

