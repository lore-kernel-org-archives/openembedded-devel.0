Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D56E6ECD6F0
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 02:44:48 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.62509.1770950679924530534
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Feb 2026 18:44:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CzFN06g6;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7945838691aso36803177b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 18:44:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770950679; cv=none;
        d=google.com; s=arc-20240605;
        b=cMO+XLgj9c2C9G72XmRZBpA3skgBxQiOgNCfBfkSp/En+BFs5uF5xAXNuVcp3FLj9n
         3+K2ai5BEGObU9svjPlP9Y233MGK1eHD6qZErXVfSv0ouSJoy6aCZchslhFUpgOWugh6
         nnOaKWUKvdp7+KbkqUK1aZeQNAcs+CCUMq4XtPeiq97ySfnafGKZXtxm2Zi0yEs6iHlT
         4emSZBD2MifpaVaZhFuX7SQDBTTVmnPHVXoOCD5iWKnLtsCXTO8w+5b+4amItECS7jQQ
         ithI2DdtKgMWytXpe8D4g+IjLpjsOmXTuIs7jyroSuRBG8BjDJl8sH5PMwjW9/EDyC4+
         JKPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uAkNavMcsGazfYCiJV6G5sH1SmStHk+QaosquiGZiF4=;
        fh=DffDXmIUDBzQJf4pskKHRCNbOxmJnDMKPiE7VmryCpk=;
        b=cbOXVcjcFPOvFuv/erMuOiIDb10Xvk4MjBL7GG+/gsFhEp3TgjmV/kNOk2PJCo0l7W
         aNlAeTr4rCnzh14hrgRzd3MxtMPGBcxehbGPfOr7/lDFaWsEZqKXOXLEKg2yxfFYAPq9
         Ubs4qtyrE23bMzqNlc3wQNZOIIJbqdVVoLDVF47SC1WYtEmzcxqHjJUNGc1tkpicemdJ
         uwJfovB6jwhM6oK3TvM+I/quN2wIMB8S5zH3HT4aDEc/1T7Rix4NDhaJHXmSVmJRCgRa
         xS4dTOXg09cjH5BxO8VtPRxzjbZ9hICpP4nCg9ebA8jU1p5Y7csk2etw9d/PdGs23mZ9
         zXgA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770950679; x=1771555479; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uAkNavMcsGazfYCiJV6G5sH1SmStHk+QaosquiGZiF4=;
        b=CzFN06g6TFVduQp2rb0NminPxndlTFsT/ZV/VJ2BblLHmuOoJMuPFOCK+wEPVSimYE
         pzeYYFOuX4Itkux0ZJwZ78AGcOIaiZD+0gQEH7xfLG0NCQ03YA4g66FISniAQhlux8Vq
         0sl3uJRZy2B/SjYXT1t1ZZwrJrWCU1iuRjRNQ/I21Rho1tvxfoseXKSQcIe4fdg47nhC
         jr/tEB/syEv4w38jeGVutmyxtFbCvueRNKeWRWT4M8M+sgbNzOZOo2bGC9n/TcxK/meg
         R7p3lEuQsA5EXr3qSTqfiZ1M25ha/xCFaQ3TMSoByxjsTIXrgmtwacsPe/wHGWdhLoVG
         Ffwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770950679; x=1771555479;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uAkNavMcsGazfYCiJV6G5sH1SmStHk+QaosquiGZiF4=;
        b=kpTzCJdWktSeWAMqlfSclsm2byXpAvlspjQdIQveRDL1K/dPFlDTv8FaeUPpwd9ttM
         TiGfFgoFAkKm3hzgrVO6FphyHh+OgR7UaXLrI1qVMnPxjoPAMOTxqIWOyXMW8AxkQgW5
         8UbTeda+uUUfmjrW9rFgzE0N5veJ7CCtC7NLebvR7JjCrevmNVZgoJsD+4e4V8CKNNyS
         gRaU5BOvPDCLmrABH3qQ4Gan9ZtWE/GLIUeSLQlnJ6yh4SXUekOQ1L/wGBSKZi64MI3L
         mOF+lqRp7j6rLc0xIz5OG7EsSjE0MKPt2Yzk9qEZb/cx7ZMPNfwBWiVETi66ZghBWuGg
         xhTA==
X-Gm-Message-State: AOJu0Yyj+bt89mLwtdSx06TXu/LExASJvH8+dkP6bUGBegi9Yn/4GT1W
	wx9iNmJ1Y7hWyC1fSgOIoFITCZ9XBQtOkSm/G/04IJYeDtQ5CQnkvdwZkoKJI+Zfomcn6RzwRcm
	eC3+a+WepQvz4Xspo488zsDxx+bKBxlE=
X-Gm-Gg: AZuq6aIB1bmU/RpvlzEccpak3+JzFvcCe5wegxGeYMaojRQColdzwHZ9uJZkXot+Hqz
	3v30JTO/d26Y1NI7PnEshgiMWNU67vwuvupA8mCd0bPVK15deWR+PK59iRLI6C9LY1k+NQM23og
	UVuzHoCq2pIVEO9saOeBRAgT8Ue0EGFJZCzoR3AbnuRn5U0JguP1xCgeAvYzPSh0dk8HBI1az2w
	q0xJgvIQ7be8iF7936zbzJgnqaXi+KRACfDwWmbxJUPXtK/c3mZ1dW+IwRfkMrQrxBZ7ya0E6BP
	mMig3GVzKVVDdQWtfhI2g2RmZFEzkSriYBgxnU//EWGZK4sWNUoPR+kH4yVqBN8tU2tBTpTnDSj
	9PdR7zXMu3pbVnksNcjoH3r9XWWa/jyeKgR0=
X-Received: by 2002:a05:690c:c08:b0:78f:cd29:51b9 with SMTP id
 00721157ae682-797a0baf7f0mr3273797b3.10.1770950678946; Thu, 12 Feb 2026
 18:44:38 -0800 (PST)
MIME-Version: 1.0
References: <20260212173901.29309-1-eric.meyers@arthrex.com>
In-Reply-To: <20260212173901.29309-1-eric.meyers@arthrex.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Feb 2026 18:44:12 -0800
X-Gm-Features: AZwV_QjarUhk5i7P9dy05enS9TK-HqBJykIjekxr9gsIhJ1CRQVG7oNxb5V8uso
Message-ID: <CAMKF1spDyomcTiL=CdX9Wueun=bn3rn+iiqsvmdtNOkH5rcwqQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] redis: Remove debug paths to avoid TMPDIR
 [buildpaths] errors
To: eric.meyers15310@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Eric Meyers <eric.meyers@arthrex.com>
Content-Type: multipart/alternative; boundary="0000000000002226e8064aab96f5"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 02:44:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124371

--0000000000002226e8064aab96f5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 9:39=E2=80=AFAM Eric Meyers via lists.openembedded.=
org
<eric.meyers15310=3Dgmail.com@lists.openembedded.org> wrote:

> Takes similar approach to valkey recipe seen here:
>
>
> https://github.com/openembedded/meta-openembedded/commit/1b820b98afd55c88=
1822beb9057162dc67ecb386
>
> Signed-off-by: Eric Meyers <eric.meyers@arthrex.com>
> ---
>  meta-oe/recipes-extended/redis/redis_7.2.12.bb | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/meta-oe/recipes-extended/redis/redis_7.2.12.bb
> b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
> index 8abf758930..34f426457b 100644
> --- a/meta-oe/recipes-extended/redis/redis_7.2.12.bb
> +++ b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
> @@ -52,6 +52,11 @@ do_compile:prepend() {
>  }
>
>  do_install() {
> +    # Remove debug paths to avoid TMPDIR [buildpaths] errors
> +    sed -i -e 's#${TMPDIR}##g' ${S}/${PN}-${PV}/src/redis-benchmark
> +    sed -i -e 's#${TMPDIR}##g' ${S}/${PN}-${PV}/src/redis-server
> +    sed -i -e 's#${TMPDIR}##g' ${S}/${PN}-${PV}/src/redis-cli
> +
>

are these text files, which can be sed'ed I wonder ?


>      export PREFIX=3D${D}/${prefix}
>      oe_runmake install
>      install -d ${D}/${sysconfdir}/redis
> @@ -69,8 +74,12 @@ do_install() {
>          sed -i 's!daemonize yes!# daemonize yes!'
> ${D}/${sysconfdir}/redis/redis.conf
>          sed -i 's!supervised no!supervised systemd!'
> ${D}/${sysconfdir}/redis/redis.conf
>      fi
> +
> +
>  }
>
> +INSANE_SKIP:${PN} +=3D "already-stripped"
> +
>

why do we need this


>  CONFFILES:${PN} =3D "${sysconfdir}/redis/redis.conf"
>
>  INITSCRIPT_NAME =3D "redis-server"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124358):
> https://lists.openembedded.org/g/openembedded-devel/message/124358
> Mute This Topic: https://lists.openembedded.org/mt/117778395/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002226e8064aab96f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 12,=
 2026 at 9:39=E2=80=AFAM Eric Meyers via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;eric.meyers15310=3D<a href=3D"mailto=
:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Takes si=
milar approach to valkey recipe seen here:<br>
<br>
<a href=3D"https://github.com/openembedded/meta-openembedded/commit/1b820b9=
8afd55c881822beb9057162dc67ecb386" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/openembedded/meta-openembedded/commit/1b820b98afd55c881822b=
eb9057162dc67ecb386</a><br>
<br>
Signed-off-by: Eric Meyers &lt;<a href=3D"mailto:eric.meyers@arthrex.com" t=
arget=3D"_blank">eric.meyers@arthrex.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-extended/redis/<a href=3D"http://redis_7.2.12.bb" rel=
=3D"noreferrer" target=3D"_blank">redis_7.2.12.bb</a> | 9 +++++++++<br>
=C2=A01 file changed, 9 insertions(+)<br>
<br>
diff --git a/meta-oe/recipes-extended/redis/<a href=3D"http://redis_7.2.12.=
bb" rel=3D"noreferrer" target=3D"_blank">redis_7.2.12.bb</a> b/meta-oe/reci=
pes-extended/redis/<a href=3D"http://redis_7.2.12.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">redis_7.2.12.bb</a><br>
index 8abf758930..34f426457b 100644<br>
--- a/meta-oe/recipes-extended/redis/<a href=3D"http://redis_7.2.12.bb" rel=
=3D"noreferrer" target=3D"_blank">redis_7.2.12.bb</a><br>
+++ b/meta-oe/recipes-extended/redis/<a href=3D"http://redis_7.2.12.bb" rel=
=3D"noreferrer" target=3D"_blank">redis_7.2.12.bb</a><br>
@@ -52,6 +52,11 @@ do_compile:prepend() {<br>
=C2=A0}<br>
<br>
=C2=A0do_install() {<br>
+=C2=A0 =C2=A0 # Remove debug paths to avoid TMPDIR [buildpaths] errors<br>
+=C2=A0 =C2=A0 sed -i -e &#39;s#${TMPDIR}##g&#39; ${S}/${PN}-${PV}/src/redi=
s-benchmark<br>
+=C2=A0 =C2=A0 sed -i -e &#39;s#${TMPDIR}##g&#39; ${S}/${PN}-${PV}/src/redi=
s-server<br>
+=C2=A0 =C2=A0 sed -i -e &#39;s#${TMPDIR}##g&#39; ${S}/${PN}-${PV}/src/redi=
s-cli<br>
+<br></blockquote><div><br></div><div>are these text files, which can be se=
d&#39;ed=C2=A0I wonder ?</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0export PREFIX=3D${D}/${prefix}<br>
=C2=A0 =C2=A0 =C2=A0oe_runmake install<br>
=C2=A0 =C2=A0 =C2=A0install -d ${D}/${sysconfdir}/redis<br>
@@ -69,8 +74,12 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s!daemonize yes!# daemonize y=
es!&#39; ${D}/${sysconfdir}/redis/redis.conf<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s!supervised no!supervised sy=
stemd!&#39; ${D}/${sysconfdir}/redis/redis.conf<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
+<br>
=C2=A0}<br>
<br>
+INSANE_SKIP:${PN} +=3D &quot;already-stripped&quot;<br>
+<br></blockquote><div><br></div><div>why do we need this</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0CONFFILES:${PN} =3D &quot;${sysconfdir}/redis/redis.conf&quot;<br>
<br>
=C2=A0INITSCRIPT_NAME =3D &quot;redis-server&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#124358): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/124358" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/124358</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117778395/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117778395/1997914</a><br>
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

--0000000000002226e8064aab96f5--

