Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A883C433FE
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 02:31:30 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.36530.1665973883204281032
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Oct 2022 19:31:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P5Bek3eb;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id br15-20020a056830390f00b0061c9d73b8bdso5059798otb.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Oct 2022 19:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BzvJUKzwb+eB/ORFfI4lG/+4v7ICxvmrhIHrvmQL89o=;
        b=P5Bek3ebhkqUE7cyzxnwkbt5d5Ygr+T26Gw0HfroHUFtpINd+SL+FPDL8C2ADX8Wry
         UohalKxHSK8qqGlhO+cPTem08FDdgaXSJf4f4vGZUMdctcqnBFjqjIkVpLbXNx12Phnz
         llfF0n39WXsDDSR2d1G1B7M0oNXXMJ5xiV/CWg64tFJdtfuPkBdF2BuQQq5y+0KGNeyo
         UnW4Zh92SZuzlrBXYhH4k/B4Cs16VDGRCWIG+WX4IbW3gjQcvtr67hinTf68E3iSxjaR
         iyABAxY6YohDU22FQg8e4n4RtFlFxhLLtic65NCz+KAj+UHG0qhJzUfa7piW5p4ptaIC
         dYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BzvJUKzwb+eB/ORFfI4lG/+4v7ICxvmrhIHrvmQL89o=;
        b=4yrMi0FG8kt1ggTq0O/9EfNSL82Azoo4auD/g4pCAG2pwrViuC2mXM3oEriDDC6wL3
         Qn+1PZiJbbyy11VGrtE9ujvJRI0HRsPkHz57B5Z2W0qP5ZamGYysDzMkDQmCKJOYQN/m
         R3IoC2aUc3UKZv4BCT3i9zZ455QNH9uIKeE51SuGHiVSlqYBD6dQ1/smmUnuRkSxnAof
         G/oE2jj7tWUh8EupGz5wGD6vSDWBkBZaeWU4lOZqZLZH+xy0slSvYiBiGViDItxpNsNd
         H2AQmA0LU2wdNyDgc/O9tXDe04YrlK39Mmz2TJxENto+mWr8P0N3R8UIYGNiOw4FMtLh
         gf2w==
X-Gm-Message-State: ACrzQf0HnR6TP2ZcgivGBeRhkMiPm8DMDlkiblAZaj5N7GtYgSPKELrY
	i3SI5gQXRP2a3ZiOGXdvTl6L+ip8POILUnUQoB4=
X-Google-Smtp-Source: AMsMyM5nbqRzi0aJfPxMu3U+Ezd78KYgLTYxz3+pt8LRNjscNEBdfNDxjvtZzW/VhNKs+OqlRRby/0i1wcZzw7tw9IE=
X-Received: by 2002:a9d:61d6:0:b0:661:c1ad:848f with SMTP id
 h22-20020a9d61d6000000b00661c1ad848fmr4081685otk.111.1665973882150; Sun, 16
 Oct 2022 19:31:22 -0700 (PDT)
MIME-Version: 1.0
References: <20221017013600.2887829-1-wentao.zhang@windriver.com>
In-Reply-To: <20221017013600.2887829-1-wentao.zhang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 16 Oct 2022 19:31:11 -0700
Message-ID: <CAMKF1spEtSnyFtUA4E05XMWrqrnt0-PiCEcC2V70FmFSfoy2KQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][master][kirkstone][PATCH] psplash: delay the
 psplash service
To: Wentao Zhang <wentao.zhang@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000073649805eb31c53a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Oct 2022 02:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99186

--00000000000073649805eb31c53a
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 16, 2022 at 6:36 PM Wentao Zhang <wentao.zhang@windriver.com>
wrote:

> psplash starts too early to start on some types of
> machines. Fix this problem by delaying this service.
>
> Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
> ---
>  meta/recipes-core/psplash/files/psplash-start.service | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-core/psplash/files/psplash-start.service
> b/meta/recipes-core/psplash/files/psplash-start.service
> index 36c2bb38e0..9eaf2658a5 100644
> --- a/meta/recipes-core/psplash/files/psplash-start.service
> +++ b/meta/recipes-core/psplash/files/psplash-start.service
> @@ -2,6 +2,8 @@
>  Description=Start psplash boot splash screen
>  DefaultDependencies=no
>  RequiresMountsFor=/run
> +After=systemd-timesyncd.service
> +


I think this will fail on systems not having timesyncd or network

>
>
>  [Service]
>  Type=notify
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99185):
> https://lists.openembedded.org/g/openembedded-devel/message/99185
> Mute This Topic: https://lists.openembedded.org/mt/94376138/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000073649805eb31c53a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Oct 16, 2022 at 6:36 PM Wentao Zhang &lt;<a href=3D=
"mailto:wentao.zhang@windriver.com">wentao.zhang@windriver.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-=
left-color:rgb(204,204,204)">psplash starts too early to start on some type=
s of<br>
machines. Fix this problem by delaying this service.<br>
<br>
Signed-off-by: Wentao Zhang &lt;<a href=3D"mailto:wentao.zhang@windriver.co=
m" target=3D"_blank">wentao.zhang@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/psplash/files/psplash-start.service | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-core/psplash/files/psplash-start.service b/meta/r=
ecipes-core/psplash/files/psplash-start.service<br>
index 36c2bb38e0..9eaf2658a5 100644<br>
--- a/meta/recipes-core/psplash/files/psplash-start.service<br>
+++ b/meta/recipes-core/psplash/files/psplash-start.service<br>
@@ -2,6 +2,8 @@<br>
=C2=A0Description=3DStart psplash boot splash screen<br>
=C2=A0DefaultDependencies=3Dno<br>
=C2=A0RequiresMountsFor=3D/run<br>
+After=3Dsystemd-timesyncd.service<br>
+</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I think this wi=
ll fail on systems not having timesyncd or network=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1p=
x;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,20=
4)" dir=3D"auto"><br>
<br>
=C2=A0[Service]<br>
=C2=A0Type=3Dnotify<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#99185): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/99185" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/99185</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94376138/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94376138/1997914</a><br>
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

--00000000000073649805eb31c53a--

