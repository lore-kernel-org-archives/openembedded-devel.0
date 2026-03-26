Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B68F310AB82E
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 23:01:47 +0000 (UTC)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.60631.1774566101669258692
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 16:01:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iX7zH5NY;
 spf=pass (domain: gmail.com, ip: 74.125.224.46, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64aedd812baso1576201d50.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 16:01:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774566101; cv=none;
        d=google.com; s=arc-20240605;
        b=XxMn+PXs62CiiRztcuQMynkJir+GB1DqHVPVbz+EXJA5SWgc6jzlv6JYYLySuntjZc
         RBdPzLe/hrzSGdxnwVbBF+eJ5DYPTGC5atL+dT8Cz9B6xsoe53gnXhgv80+JMzV02eXQ
         VxeRTML4qLZwOAUO54FcrAxUHD97N1HBJlTFEsoBG7ppU97cy4fve8iKGnd4eX1mJlLq
         0sMXbZ8tge8oa+6zQZP8jHPk260ps9gJ/uKDDvFakwf4kPxNlJrZqTqYyZrDLAtQF7Jc
         bqzb5enMB30yYLYwc4gUNTadBMBm3qYfRngffD2N166jGbpjMfhjAQhskdhiVKXW20kL
         qLsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eyXoVttUcA03BJWrScCB8pe6PIpS47Tvv1hPKMQMojE=;
        fh=LZspYXC3IzyIN8FmVwz229n7pZIWt1HqVNc3WYXGu+o=;
        b=b2fFA21izhpLG5O9KTTaimFNXx6BQnODkhIo1dg8nCNVvEoGI20FLset6AMVz2B94c
         ctXivLVnUiZgmPILxP2zhvzupnJoiNlilkDzrrxmejx6JURfbB9YOQwbCCCX94xHKk8H
         P9ZlEUB9JpXHqXZNeCD3qj8njswFO+DoQNdxP9W/mtsQXbRiHLy/Mc5cyjuzo+6ZTRf7
         dAubGyICHiL+Ov/wLXCxGzNtoxka2FcmtVEzQXqWaT4HDSBNv/9j/PGCN/EIBVmpeT2K
         Z61x5iUR4cBX+9jcEN8gz06aPp2GvMWJRrWFTgfIJE0rliBywDgVxKAQFzg3bGMuYbMT
         dfhA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774566101; x=1775170901; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eyXoVttUcA03BJWrScCB8pe6PIpS47Tvv1hPKMQMojE=;
        b=iX7zH5NY1Bht5lEFfhD35RzcTRXftGbQCOeZkKAuUBVmTYqthjcVUWr5/uiaN9MGqH
         T2h+wm2SsGJmDlAWPaRD/eQ9UziQrvIvQXIsq5eGe6aQZTJl8K55uiSeRqFLEZcNmSYV
         I10VKNIVeCa3ZwsIUfZPb/a5JvaWp9SfAFhAX9hWNsBBwXB0dLLIJzXVOrNEoj4WTuRz
         1odDz5PUkZ0W9j2w3HT3cnRuVoPNo9+5X+lGYDzMQWag2CetWBYWxDMHYkfDXu+N+BLl
         RlImvJz+uYRBtKbiXXTpF2H7RhHsnXeVcbri6rYWr23Q9ZWMLcZl8okZefgq+fOcbRPs
         oYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774566101; x=1775170901;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eyXoVttUcA03BJWrScCB8pe6PIpS47Tvv1hPKMQMojE=;
        b=TgPs9n7RNweCDO9Gum3bAnDUcZM41AEbAmS+H3nfptRgfsbv3puo33SnBBP6UKMoAd
         I6djm7ftBKTvsDtrLPBDcbvTQ3c/KR1GRwMgmRB/bELcQ/sYeQvZxQ0i3rvtXodrWbv3
         5our2R7dI3bWAMnEaUX9AaOeg2xjNWewL0Y1uF+zccogemsNlGXrFvPdnm43K9Z/BmH7
         Lf2dKNd5o7FxudC4MHu3LKzeE5K1L2JlQgW448mq7woyzIqgXjAVmbxjCf8yDA/dCO0U
         JnvhiJyO3p+qYgjel1RlxOnEYHRTSn3t8DJh+Nd0VG2LNZj0Zen8JbUs9KGySXaiXMNl
         bD7Q==
X-Gm-Message-State: AOJu0Yxx6z8tQtFZClOGYjDuYDKWwsrtyXGeaUifmsOX4qSp0O2LpBEn
	j5e4R3R84sY5CVLUaAD+BUjp99NQAHdmkG1WITOn9icDxK8F7huXPf98f4iLc9qfsBKJK6lcHqD
	V5X4y54T4p/mDo5Js//0hW1CDAZZYWz0=
X-Gm-Gg: ATEYQzyMbiyZpNtAFhf8bBUL2SPAaraOgqJ0Dqm6T2YSyFU3r8rMRtuC+i5nr+Wg+Us
	q5aUzoe+paK8vYhPlys6OvnFayZjzUFPY6sGyq/bKnYxufug6j34qduMEh3ZUE0SiQobXvWUtRx
	WB9bDeCVwAt9yU4qOyJiHeUz7rimuVDwZRa4W6B2ahBuyAussb3RqCaU1br02s2Ppd4bG05jIhP
	5eXb82vdQV9Qszd5ew2sQZXqmN2QOV9xlMVj5O6tWe8eYqAaCX4ISZfYmJV2sMfbmZSOm/nc2d4
	VY8mmq36j3cQkA27jV7XnW8PNLYkuGMPu+kccMBiN+ARbARG2bw3LsnTk1DVYt7Wct4e86dv0J8
	IuFrAdCFQVfOldGJ+OexxjF8C
X-Received: by 2002:a05:690e:4841:b0:64e:e464:12ec with SMTP id
 956f58d0204a3-64ff721328bmr426040d50.32.1774566100463; Thu, 26 Mar 2026
 16:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260326195119.2018455-1-f_l_k@t-online.de>
In-Reply-To: <20260326195119.2018455-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Mar 2026 16:01:14 -0700
X-Gm-Features: AQROBzAQDmEzN1bNLpCAlVG3MSTcjZhboz7gKNJ872UWSxVrfufjfVpkuxM16t0
Message-ID: <CAMKF1soZfzETRqqzuWE5pM0UaHe11+XbgNLkWJKfshYZ_QKu-A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] luajit: update license checksum
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000c744c064df55eea"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 23:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125774

--0000000000000c744c064df55eea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 12:51=E2=80=AFPM Markus Volk via lists.openembedded=
.org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

> - copyright year has been changed
>
>
isn't it already addressed in master via
https://git.openembedded.org/meta-openembedded/commit/?id=3D92fa6c0f86f4bda=
6d0b2529fa035032d025baea2


> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-oe/recipes-devtools/luajit/luajit_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb
> b/meta-oe/recipes-devtools/luajit/luajit_git.bb
> index 9cd97ad381..9873ed6f05 100644
> --- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
> +++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Just-In-Time Compiler for Lua"
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Dd421a5e2a24207f5e260537399a=
9a38b"
> +LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Da2c43bf4a9ea63755af2131b0ae=
59ff3"
>  HOMEPAGE =3D "http://luajit.org"
>
>  SRC_URI =3D "git://luajit.org/git/luajit-2.0.git;protocol=3Dhttp;branch=
=3Dv2.1
> \
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125771):
> https://lists.openembedded.org/g/openembedded-devel/message/125771
> Mute This Topic: https://lists.openembedded.org/mt/118524693/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000000c744c064df55eea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 26,=
 2026 at 12:51=E2=80=AFPM Markus Volk via <a href=3D"http://lists.openembed=
ded.org">lists.openembedded.org</a> &lt;f_l_k=3D<a href=3D"mailto:t-online.=
de@lists.openembedded.org">t-online.de@lists.openembedded.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">- copyright ye=
ar has been changed<br>
<br></blockquote><div><br></div><div>isn&#39;t it already addressed in mast=
er via</div><div><a href=3D"https://git.openembedded.org/meta-openembedded/=
commit/?id=3D92fa6c0f86f4bda6d0b2529fa035032d025baea2">https://git.openembe=
dded.org/meta-openembedded/commit/?id=3D92fa6c0f86f4bda6d0b2529fa035032d025=
baea2</a></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-devtools/luajit/<a href=3D"http://luajit_git.bb" rel=
=3D"noreferrer" target=3D"_blank">luajit_git.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-devtools/luajit/<a href=3D"http://luajit_git.b=
b" rel=3D"noreferrer" target=3D"_blank">luajit_git.bb</a> b/meta-oe/recipes=
-devtools/luajit/<a href=3D"http://luajit_git.bb" rel=3D"noreferrer" target=
=3D"_blank">luajit_git.bb</a><br>
index 9cd97ad381..9873ed6f05 100644<br>
--- a/meta-oe/recipes-devtools/luajit/<a href=3D"http://luajit_git.bb" rel=
=3D"noreferrer" target=3D"_blank">luajit_git.bb</a><br>
+++ b/meta-oe/recipes-devtools/luajit/<a href=3D"http://luajit_git.bb" rel=
=3D"noreferrer" target=3D"_blank">luajit_git.bb</a><br>
@@ -1,6 +1,6 @@<br>
=C2=A0SUMMARY =3D &quot;Just-In-Time Compiler for Lua&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYRIGHT;md5=3Dd421a5e2a24207f5e2605373=
99a9a38b&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYRIGHT;md5=3Da2c43bf4a9ea63755af2131b=
0ae59ff3&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://luajit.org" rel=3D"noreferrer" t=
arget=3D"_blank">http://luajit.org</a>&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://luajit.org/git/luajit-2.0.g=
it;protocol=3Dhttp;branch=3Dv2.1" rel=3D"noreferrer" target=3D"_blank">luaj=
it.org/git/luajit-2.0.git;protocol=3Dhttp;branch=3Dv2.1</a> \<br>
-- <br>
2.53.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#125771): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/125771" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/125771</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118524693/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118524693/1997914</a><br>
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

--0000000000000c744c064df55eea--

