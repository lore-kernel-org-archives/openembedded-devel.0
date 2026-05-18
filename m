Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3A6DCD4F3C
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 00:13:58 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7089.1779063229615025840
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2026 17:13:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Upz/6QNV;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-651c366f7efso1808739d50.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 17:13:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779063229; cv=none;
        d=google.com; s=arc-20240605;
        b=gGYZPIq5LF3WEhcGREtnLRZaNfKk0pxvRKGDHhNhtp3bEC1NNd68twQW+A4XyvbK5r
         woHiqK36p2WmGLRCt2CbhbJgpaK7R20Z9cxSkFuhY/ZEVwXPv3N2AG5jhGkRpk/iK8BX
         pj1pOZU02x6NNRc48JYsUxx3R5nSz08Khuy/3XlM8sNXrVVbddB26YsMn5Er2Kvm9hQD
         j7FnOclBOKUKpSbXVnT2DjmQpQ3srMzpMi5XpcakRxuEXP7zvTSap7XgWOcj8u/LA/d5
         lNqRIYEDr2BY5WfGAmgp1VWWtEW1XEFmfzatM9dQH6rxPLIHUeOipR0zYcV0CByNbx/5
         nbVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GaxelN0pZIO4tgKwKiuYbrA8qiuyWqkpF+iGUqagg+g=;
        fh=J4ZjfT6NqpCvCI41WUdYqc7gj6V/53EeAu6cIa+j048=;
        b=cp06sVgn7xSlVqVXxRUn4zfH/1L4rdpMsEj28L+EJJgLM+6mcSmdkYBm2hZfdXWBKy
         JT2zVIvfmhPdpjKT3g/iyt/RcpVbco5a3qUeWAWla8Fs54cfSt5utR7cDEg1d1+6kkw0
         e8tYKlIeDUwM9Fa7tg97kg3+rPU93CLudBid1x4T4WIX1t5fz5PaVhEG3wf5GYjTW+qK
         z+OzWYzBwXiP28qVXzCzY9cRj5iBVC7ZUZbeaLd5W5i+G3E4jPZj+I7v4Npx+ZiCls8m
         GNQ/TUlDslrBRjTu4Z0G6raMeZcVuhmIsLLMgFjBzPEyB8bkIj6liQm4XURyLrD3O009
         MQ4A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779063229; x=1779668029; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GaxelN0pZIO4tgKwKiuYbrA8qiuyWqkpF+iGUqagg+g=;
        b=Upz/6QNVN67KJ7/Iq7Th+xKoqpNX4Ky8yPHRe+d5Dp3AvhTKEPobQiXs2JIM4MqDb5
         PC/k2tkQVdw63suZAB3bBS/XgmsnK8qHCS+Yuxj0JvsKkipsQ5Qi1NoYvW6iTWgi9I7U
         Jh5sYqttXOpB9mGRMW9irGWDYU7z7+xKQZUYsD/OuUIx3jr37DOm8h1v+uz3BRr5fx0R
         3jSiS4ymEYA+jll9DwhvczramgeMJopBiwvHgFV6zICpOK0YGkf/IHSNCYDfK4yKLR9G
         zgGxnmbUnrOn3Hod30mDX4GM9W/IcWsTBS5bSwe4tgDzXptjDV0gbURkaPrbPrns3Ask
         N2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779063229; x=1779668029;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GaxelN0pZIO4tgKwKiuYbrA8qiuyWqkpF+iGUqagg+g=;
        b=TZBD9e19xy3DNM5AO6XoYOsHmXyMme4t0YPygJuInmaVtg5oVJX4m9yXCjKx8MKfeT
         Q2Vz+0O7tNT/04I1lkAsbn+IERwH0cx/zHWSi/a0skuLKnG3qcGMNc8q+z4TYmryY/v5
         uSTx1YIYuWTDrocYlQLVsCJ1D5WcLiMibSb2JK/kDvMCwOgKPH3w7N6rQgCtCSk9b+lE
         nc2R9Fi/0Xldx6hluU2VyhpBz0iHLAYogSUXm1LZfBiM4HY3W818BAd1hiu6CvhN65Dp
         0J78UAWvaJAp9FcuaR6qaekWD7Ig30/V+O9c/hxDVajws4KrCq/Rw80eNJ0/lKbr4UO3
         FUpw==
X-Gm-Message-State: AOJu0YzDCr7uXJFdQ/Xme5Od24WgVg2R/omHASLLgYdhSSZxYoFRtAAq
	WcSjJq2dW/PVNb8p/LOK7a4bbtIJFQO6TQNQ46k3jKxFXPGQn69GlXhBObY2HI7Yvb/KrpmD9gF
	h3PUyQahAnlxrKQIgKGT9PgbZRmJ+1nk=
X-Gm-Gg: Acq92OEJYASQ2i2KJJqM8BApLZgVQ+/INwiGII2q1oZitFUbhYc0CwwQ4XgvCTn4kYS
	CPDtOELAtmflqBUugIabXh15NKW8FYOe5ijV/JQYnEwvfSp5loddtbUibSdkwdwT4EICeJS9o4F
	DdbWe36JrqyqgE0Twp6bXoAVK9oTum/UwVpy6d4KCis921NXeJL6ObkiljDynP/kHy+XbwtR2HS
	WhCTAoi/MlQolC60M/dtMB+AaUIwA7jy3+nf3E1qqVHZ35Pa6EFxUvk1rjB2qh0V/8wIB7jro25
	2s0XbjwbUDc8O0uHfNfeOhdv6ak+iFEvJSD4TQhSrIUWY3e6kvQzgiNyqd/7Bt7UsQw1H0fOEX/
	LwVZ/NaxDV9SXBZkXkP8Q0hqBqZG8i+Mfa83rjhkAzuHfWBdAHBbwzqm9yqrvUyUPNzqvWzIKWA
	cPN2s=
X-Received: by 2002:a05:690e:1403:b0:65e:39d1:d9f4 with SMTP id
 956f58d0204a3-65e39d1e47amr7046860d50.9.1779063228696; Sun, 17 May 2026
 17:13:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260518000343.4136127-1-ethan.twardy@gmail.com>
In-Reply-To: <20260518000343.4136127-1-ethan.twardy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 17 May 2026 18:13:37 -0600
X-Gm-Features: AVHnY4LLHdcsXl4FknrhLMgU-BLohH0ODji80a_NfzQ5ch8L_uPeCN0RIqDsCMA
Message-ID: <CAMKF1srf8YTveQu7Hd9yL4LU0c5yuy=Yb=sVwLj5O0wKgxqFEg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] rsyslog: Fix missing runtime dependency on procps
To: "Ethan D. Twardy" <ethan.twardy@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c78ce506520c6ffe"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2026 00:13:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127046

--000000000000c78ce506520c6ffe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ethan,

Since pkill can also be provided by busybox, does this change require the
full-featured pkill implementation specifically from procps?

Best regards,

Khem Raj


On Sun, May 17, 2026, 6:05=E2=80=AFPM AmateurECE via lists.openembedded.org
<ethan.twardy=3Dgmail.com@lists.openembedded.org> wrote:

> The logrorate configuration installed by this recipe uses pkill(1),
> which is available in the procps recipe. Add this recipe to RDEPENDS to
> ensure that it's installed.
>
> Signed-off-by: Ethan D. Twardy <ethan.twardy@gmail.com>
> ---
>  meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb
> b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb
> index 186e1ccf24..107fee692a 100644
> --- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb
> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb
> @@ -178,7 +178,7 @@ RREPLACES:${PN} +=3D "${PN}-systemd"
>  RCONFLICTS:${PN} +=3D "${PN}-systemd"
>  SYSTEMD_SERVICE:${PN} =3D "${BPN}.service"
>
> -RDEPENDS:${PN} +=3D "logrotate"
> +RDEPENDS:${PN} +=3D "logrotate procps"
>
>  # for rsyslog-ptest
>  VALGRIND =3D "valgrind"
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127045):
> https://lists.openembedded.org/g/openembedded-devel/message/127045
> Mute This Topic: https://lists.openembedded.org/mt/119365819/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c78ce506520c6ffe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Ethan,<br><br>Since pkill can also be provided by busy=
box, does this change require the full-featured pkill implementation specif=
ically from procps?<br><br>Best regards,<br><br>Khem Raj<div><br></div></di=
v><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Sun, May 17, 2026, 6:05=E2=80=AFPM AmateurECE via <a h=
ref=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;ethan.=
twardy=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@list=
s.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">The logrorate configuration installed by this recipe uses=
 pkill(1),<br>
which is available in the procps recipe. Add this recipe to RDEPENDS to<br>
ensure that it&#39;s installed.<br>
<br>
Signed-off-by: Ethan D. Twardy &lt;<a href=3D"mailto:ethan.twardy@gmail.com=
" target=3D"_blank" rel=3D"noreferrer">ethan.twardy@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-extended/rsyslog/<a href=3D"http://rsyslog_8.2512.0.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">rsyslog_8.2512.0.bb</a> =
| 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-extended/rsyslog/<a href=3D"http://rsyslog_8.2=
512.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">rsyslog_8.2512.0.=
bb</a> b/meta-oe/recipes-extended/rsyslog/<a href=3D"http://rsyslog_8.2512.=
0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">rsyslog_8.2512.0.bb</=
a><br>
index 186e1ccf24..107fee692a 100644<br>
--- a/meta-oe/recipes-extended/rsyslog/<a href=3D"http://rsyslog_8.2512.0.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">rsyslog_8.2512.0.bb</a><=
br>
+++ b/meta-oe/recipes-extended/rsyslog/<a href=3D"http://rsyslog_8.2512.0.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">rsyslog_8.2512.0.bb</a><=
br>
@@ -178,7 +178,7 @@ RREPLACES:${PN} +=3D &quot;${PN}-systemd&quot;<br>
=C2=A0RCONFLICTS:${PN} +=3D &quot;${PN}-systemd&quot;<br>
=C2=A0SYSTEMD_SERVICE:${PN} =3D &quot;${BPN}.service&quot;<br>
<br>
-RDEPENDS:${PN} +=3D &quot;logrotate&quot;<br>
+RDEPENDS:${PN} +=3D &quot;logrotate procps&quot;<br>
<br>
=C2=A0# for rsyslog-ptest<br>
=C2=A0VALGRIND =3D &quot;valgrind&quot;<br>
-- <br>
2.53.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127045): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127045" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-devel/message/127045</a=
><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119365819/199=
7914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/119365819/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@lists.=
openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000c78ce506520c6ffe--

