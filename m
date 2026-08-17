Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 440FBC5DF7D
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 20:48:06 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4831.1786999685428402632
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2026 13:48:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=U6Z0LzGR;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-80cebd41372so57841397b3.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 13:48:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786999684; cv=none;
        d=google.com; s=arc-20260327;
        b=UqLJGmHkhr5467rcALMJ3MgWfYfRpcqTaHtoRhdU9bcbibnkJvsjuAMQzI8sXBxQJi
         jI/GoVMIAn8gTVfAuy+qqvBTpjSPl6i8qlj2yURx23aJB1NK2KlY/G0M+IsKXZqWtlML
         +oALRuOoHskqgefEXQOrWzoyKFcgCxMaWEzctembuDhiQj0bT3+GKtxOWKZiutf9IrmV
         Wqp1PTjj58DKFH7rDiQjt2cUjxxZkqC+szLnI/4QEFI2r2WfvPdzqEPKczhpWZP/EHDU
         LptEGf/+aISqEQ4ZWO5JMLyc7G/KeZbCDTrsuxipI8ymOwPTyIHMzdSQbEk2JmGzftDl
         QX7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hu5eh0JuqMrlehsW8neEV0KD8ejRrdoCBRLnNsHRZVE=;
        fh=32dNYDkrd4iFDxQzsKU/8p0Pftk8aq/K3E3B1xpVIPU=;
        b=l8NK6FyElF9i6hEMtTQiVtdSGxA6cbG1E4Gw714gBImJrgm+d9lxnK1EeAYOJFL1X9
         ufcU+v8KQvlSrUaG1Q56PPRAJuYWQg+nruwoBziOY/ZuygmAKc+inNRgDtpGj7XXKX09
         2an/pex0yO8l3v8+HVY2G1ZWNU6LEepNR7Hpx3ylqdR9PgZaSlhfv4t9GC51nDiUygRx
         77PThNOziBJwBKjNBsliiydgDZZJ5IiFk4spO1LpkE/vkUJzpCIPGiwOurd1UILGl/W/
         bnD5S1ZfVjeEIVvnb35XCiGn5G3Dv0bxqrbv5x7qa8shpBgnZbP2qrbk6OEsaqCxoQlj
         G0uw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786999684; x=1787604484; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hu5eh0JuqMrlehsW8neEV0KD8ejRrdoCBRLnNsHRZVE=;
        b=U6Z0LzGRfwx9/W35XGexm4+aQWGtm/RxBeOuZSBRtjtJbCcx6qKqyzMU1AKdAZufA4
         mVgk6/iw3dX6jdj4OrG3Tbz4pdWvzKGwjN7siPx+kAcLckofWeH0Zin9x0WvHg3FRdDR
         yxYwme2I0Bo4UzboHY44alazVfPL2m5WjnkU3+wTQkBpAwXgKEvJehE6wDI3UNWnyec0
         aPIX0N11jk+CZCr7zSh0jPHHTEy0N+SNdC3EIbz+u7XdW553sFLJexniXXjNO0n61hW7
         00lU25AtE6nXizAXN1CKj1KFBARCrlioxJPp/wcfPWQakt4uuWPeIhz3+2RmPnT0SI5i
         ItJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786999684; x=1787604484;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hu5eh0JuqMrlehsW8neEV0KD8ejRrdoCBRLnNsHRZVE=;
        b=AMQRiA0RgAAkZHy03I5MKMokcTjgfAn+6nahEPKFHejshbnQSuiW8IE3xGYKzRtILC
         rJAtdlLq1njkgoTZdqIEic5wJTwAahMj0Zx2Sn7hf3Pognm+z/NF8P3xnoGaqRojoFHT
         OYUPb/aabmwcO+/+xfrndU0M5/8a8KJS5fe2hhIDladubQO5qkfODbLvacwlz94+1FMu
         O8DM23AXQ/5O9kC2r1XTU25l7/K8ZuyXgDjLxK+2XpanjQ/cM4yhkpe3rXmURQkpZFM3
         NiktFosSr6yKme39CoaLloMhk/qiyFK+XMlf3ehIIAHjb2NVaQubbIydobWxnuf/3jd5
         Y91w==
X-Gm-Message-State: AOJu0YxUZJSGNzFr/QrV36pXjG600kzYPV7R+mFwsPHg1v31cpCsdhC+
	KiLxHtVTWUspHM2v0fbpKM8zE9rf3Gb/31r8oBHK6irt66fmjZ8jpw3Ik1cpSju5Fs4WLg22RVF
	6lhQC8sjDb5I1Q1R/F49Py9wkY6iVjHo=
X-Gm-Gg: AR+sD13HHsp3ECJmmsSUldR9QnSA1hjKYiSYEuIKM9IstmDuofKLlMm+A2T9Y9ZBhzc
	GJP4NXW1nUVY5EXXnkyADFt54U++kb7WSdgz25ZQVjjmy3dc+gyYLEfOHQzVG5BT0O/IpO3amjV
	OXhc8o3Xhs48tc1SQRBGZj/PUX71MIS1rjIFGAMQEFFY2aAQ3g8gfGEIXO0vpHreBd54Vaewfha
	h52DnZ47z5PAGtnY69UiEptr/pYBqfMK/M7NFx9/1bnpaFN9Q+wV/2RiCvC1s6QmDwGMsACB9Fk
	X6/oeNVm2PTwQacMXx9tw+Akc7Nb1QPtDT49YmcFHW5R4I1cpKA4hNd2X/1zDf74xf/USuawLhZ
	bNiQUuCg8zRCAv0bAoo2R95t9ljuA3YcNENxExPI8+t5NV0ea+hCkFyRGcpZwRELHwTu3kKnYsv
	xFnkLJZC7uYXbJg5qR6UMyI04hqHtxJOAD+ItKX0ujXJ+1id0mfPMWpa+215MTHoGPZ1IFPwIS+
	jlTr8Dm0TpQnA==
X-Received: by 2002:a05:690c:260e:b0:80f:d844:779c with SMTP id
 00721157ae682-83710b883ddmr109585867b3.22.1786999684330; Mon, 17 Aug 2026
 13:48:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260816163958.3664646-1-ricardo.salveti@oss.qualcomm.com>
 <CAMKF1sq_Rbg3gs2E4C+SUexJ3xZkkQ57hJP_NpeUt4wXZY2Ycw@mail.gmail.com> <CAA_5yovr5sZQsNtCR5B1kOAieUndWwzj+54i26ELHiG5CSO-Ng@mail.gmail.com>
In-Reply-To: <CAA_5yovr5sZQsNtCR5B1kOAieUndWwzj+54i26ELHiG5CSO-Ng@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Aug 2026 13:47:37 -0700
X-Gm-Features: AcwNN1Vx7c1B4keTX1eAnRshYWappQMciZPq4OqHgynpJL30R-o_k-ThI4HX54Q
Message-ID: <CAMKF1sr32BBBQTiB9rYw+2K42LnEj04BUTJx++Zhvop01YbyGA@mail.gmail.com>
Subject: Re: [oe] [PATCH] redis: fix build of the bundled xxHash with -Og
To: ricardo.salveti@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000065f8310659444974"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 20:48:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129196

--00000000000065f8310659444974
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 12:50=E2=80=AFPM Ricardo Salveti via lists.openembe=
dded.org
<ricardo.salveti=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> On Sun, Aug 16, 2026 at 7:48=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
> > On Sun, Aug 16, 2026 at 9:40=E2=80=AFAM Ricardo Salveti via
> lists.openembedded.org <ricardo.salveti=3D
> oss.qualcomm.com@lists.openembedded.org> wrote:
> >
> > I see that its fixed in xxhash recipe in oe-core
> >
> > CFLAGS +=3D "${@bb.utils.contains('SELECTED_OPTIMIZATION', '-Og',
> '-DXXH_NO_INLINE_HINTS', '', d)}"
>
> Indeed, I can do a v2 copying over the same line from oe-core.
>
> > I wonder if its better to depend on system xxhash instead of using
> vendored
> > version. Please explore if that option is possible.
>
> There are a few issues with this since it is not based on the exact
> 0.8.3 release (it is post release), and it could cause potential
> dependency issues in the future. The other issue is that there is no
> logic in redis to consume it as an external dependency, so it would be
> another patch we would have to carry which will probably not be
> accepted upstream.
>

I wanted to know if there is a configure time option to easily use system
version
or vendored version of xxhash library. It seems there is not, can you
confirm ?
if thats the case then just send the patch ported from xxhash oe-core
recipe.


>
> Technically possible, but it will potentially add more work to
> maintain the recipe moving forward (while the CFLAGS line is a
> one-liner). What do you think?
>
> Thanks,
>
> Ricardo
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#129195):
> https://lists.openembedded.org/g/openembedded-devel/message/129195
> Mute This Topic: https://lists.openembedded.org/mt/120778093/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000065f8310659444974
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 17,=
 2026 at 12:50=E2=80=AFPM Ricardo Salveti via <a href=3D"http://lists.opene=
mbedded.org">lists.openembedded.org</a> &lt;ricardo.salveti=3D<a href=3D"ma=
ilto:oss.qualcomm.com@lists.openembedded.org">oss.qualcomm.com@lists.openem=
bedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Sun, Aug 16, 2026 at 7:48=E2=80=AFPM Khem Raj &lt;<a href=3D"=
mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wro=
te:<br>
&gt; On Sun, Aug 16, 2026 at 9:40=E2=80=AFAM Ricardo Salveti via <a href=3D=
"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.=
openembedded.org</a> &lt;ricardo.salveti=3D<a href=3D"mailto:oss.qualcomm.c=
om@lists.openembedded.org" target=3D"_blank">oss.qualcomm.com@lists.openemb=
edded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; I see that its fixed in xxhash recipe in oe-core<br>
&gt;<br>
&gt; CFLAGS +=3D &quot;${@bb.utils.contains(&#39;SELECTED_OPTIMIZATION&#39;=
, &#39;-Og&#39;, &#39;-DXXH_NO_INLINE_HINTS&#39;, &#39;&#39;, d)}&quot;<br>
<br>
Indeed, I can do a v2 copying over the same line from oe-core.<br>
<br>
&gt; I wonder if its better to depend on system xxhash instead of using ven=
dored<br>
&gt; version. Please explore if that option is possible.<br>
<br>
There are a few issues with this since it is not based on the exact<br>
0.8.3 release (it is post release), and it could cause potential<br>
dependency issues in the future. The other issue is that there is no<br>
logic in redis to consume it as an external dependency, so it would be<br>
another patch we would have to carry which will probably not be<br>
accepted upstream.<br></blockquote><div><br></div><div>I wanted to know if =
there is a configure time option to easily use system version</div><div>or =
vendored version of xxhash library. It seems there is not, can you confirm =
?</div><div>if thats=C2=A0the case then just send the patch ported from xxh=
ash oe-core recipe.=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
Technically possible, but it will potentially add more work to<br>
maintain the recipe moving forward (while the CFLAGS line is a<br>
one-liner). What do you think?<br>
<br>
Thanks,<br>
<br>
Ricardo<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#129195): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/129195" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/129195</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120778093/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120778093/1997914</a><br>
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

--00000000000065f8310659444974--

