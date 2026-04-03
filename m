Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7260ED730B7
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 08:06:01 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7068.1775203557345734372
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2026 01:05:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mLv0kz1S;
 spf=pass (domain: gmail.com, ip: 74.125.224.52, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6501d242e3fso1648873d50.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 01:05:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775203556; cv=none;
        d=google.com; s=arc-20240605;
        b=DAzmimnfSlcvA3MXFGJaqF2NIe81YVW152cI2YRkcUzt6aZ/DFGknR6N2/5oJRHfZF
         Q7ckRT27mUlUnW9YP5Dtlvjt6gWKMOOICBzxEamatW5bXLPKnAY4div7ZMXZgBOtSeqX
         GeiqD9/OcbnptfamrXE9PEkD43ZjQvl/mPUG9fysSsgmtjG2o98H5v18yvwjCKRzKqKp
         kVvmYHJq2eMpYk6aQp8RjLyGg6cwqV92W0G3Gbahh8RJlaUIKKNUb+C+ViU7ZU/l0lXu
         neYo5Pf1Isl0fTaVPr7Pa/Aok6txar4isEB6xS3fj6v8NIGNOxt34wXImtwmV0Ex7DZl
         zZmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=k3lnC4dtJ8G+6IP/8GO2DGWUz1dbeTTV3z530Dt50AE=;
        fh=mdatI5p+0W/IOPkKuFWsMPH6uomxe6ouTSPOfSPUDSo=;
        b=PxwvP/9dtLc0WzhzzDz7UNUqzNapE6X5fkewGS/SjcHt6re0IiXvnP34K8EJeejreK
         Eg3TrAw2hCiJRwxO7Fpa/rgWoRpNVUm043PUREgu5f0ovTHQixHN+bH2hZ+d7v57BBPi
         lTWgnWXy0odTUTRmMGqk3EVeUoEo940IyNSQA+VKfE9tgwf95RRDhv1ygFo7IkA+LsnZ
         w9fLnxppLd1IqWHKmlMqlLrRXQ0qS5cG+Wwk9mGhqDoUTg61yJoKUZhFWF8Xqsc/yd4B
         rEo/FdAA74oSGE7OtCi7uSFiuRWCd61bR5m5Yf+btiJ1vauTmKG8VLc8qtIzU9pWs3m6
         Qinw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775203556; x=1775808356; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k3lnC4dtJ8G+6IP/8GO2DGWUz1dbeTTV3z530Dt50AE=;
        b=mLv0kz1SfcDybPaQwLKFu+1JDWWRiuoS2v972s02HR/gHj177rvaAxtYMC+q8+C/Vk
         3BJUnyY7kPGkeF/4cY5pibliXPp55TuhOEAKVa87RvTp8fqionfx4T95myXA1+kj+zgK
         GAKzitccq/ULyfL3lBV8I9WrEYmX99ZKDbKM2Ac5Nb95Khc9N3LBPxQDDEbLzfeVqBS6
         xfM4N0ZdZxTXgzDR94XDMps+dOSWpKZLOUouKLGLh2X3FpDP/DjbsELynMtkr15MgWLh
         DEdjdj9MP5t0H72Un0oy71KSiL7y3/0vBfuDYy67O6epjhMSS6QY7Rtg838UPXdTvL9f
         YehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775203556; x=1775808356;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3lnC4dtJ8G+6IP/8GO2DGWUz1dbeTTV3z530Dt50AE=;
        b=mXzg9yDbbVQ9WPxhLEfPY1G9JpvJS/j03y0FV4TXsUgyFob4JT2a537nBOykrSfED4
         JDlJpn6e+d+iacJhVo2aUS3R062WXzvksryg92bCdqt/uQGx2XmLQ/6CA/hpcg2t1OtF
         8NLVryW0J7Rkuiu1k/oyu5dbLwVSeoCZs48HOI3Ygjuer5SMXa0RAcBU4oml4Bx4xncs
         2QDvlCbZE3X3TOPDSjVsq5zb1vxG8sTEGSkR+rju6ZfVLvIzydOdDu0ZseUl3RX/Ky7F
         LMXvEOZG6BGhcODUH1Lyu37r74jNwp8y+vkDlfJukgwHl2wjpKk7nNPWcZoKEa3ZVUUl
         CMeg==
X-Gm-Message-State: AOJu0YyNQe3sLSnPIvQNIH0+zZFaW4RlkHexDpoCNjFAYiPwz3uUdML3
	BvB2LyZD2fyPWgDDBB7z0QzOaWt54uQTzXaFxoCYyviAWeEyOwDENIqwY3sknw2U1PITfeytwvV
	FMtoWU9TSeDkE/ErkoEmkOu8KXFZ4y8Dg1tfifoU=
X-Gm-Gg: AeBDievLWvi/NZV/c3UbY+yDHjyOqhoi4skGvgW20hoIWLc57vPCC65zpMoLFw0TheS
	2by29VJ0uNociuLzjGKYsuxAZEiXJecxurgnAK35ehANhCEnuxCMiQFvwmhRuaGPGZyxgf87XqA
	qEvnySeO1OiJzu/Rk/fxaE2I49+rHJlvKRFsx/P1CnSCjRjei7bc6+TolgUdZmRVLhvg89Y44yV
	D5jUygFZktZrImqVlBQi8/VQ3NGRLMKsKYumj9sVY4giBRkKJk6Rfh2OMx4ov0mwyjFSVVOL5rE
	24sQxl784x7nQQjZCCelNJc5drYYCSuAixDXPu3C3AUtR/ZV2bo436mdh5bxuiCGjsDPGlkgghQ
	EIgfOtRxHFTAbECJOiFpYXU7l8d9IN4pFViU=
X-Received: by 2002:a05:690e:4190:b0:650:3307:f7c9 with SMTP id
 956f58d0204a3-6504880e977mr1782560d50.36.1775203556150; Fri, 03 Apr 2026
 01:05:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260402122730.1485735-1-archana.kakani@ibm.com>
In-Reply-To: <20260402122730.1485735-1-archana.kakani@ibm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Apr 2026 01:05:28 -0700
X-Gm-Features: AQROBzD-l-jpus2ACHzRUu6od6C37-fuq2cFFaGClebapjIWUGX5enrBrGHFqGQ
Message-ID: <CAMKF1sqrGbetAYMhBQo0Qru73x5sHMj=3S3uc2=yr2Qq=zv-1Q@mail.gmail.com>
Subject: Re: [oe] [PATCH] libspdm: enable shared library build
To: archana.kakani@ibm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005e4fb7064e89c9f0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 08:06:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125978

--0000000000005e4fb7064e89c9f0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This fails to build here on AB

|
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-lin=
ux/libspdm/3.8.2/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-pok=
y-linux-ld:
cannot find -lopenssllib: No such file or directory

See details -
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/6151636/raw_inlin=
e

On Thu, Apr 2, 2026 at 6:49=E2=80=AFAM Archana Kakani via lists.openembedde=
d.org
<archana.kakani=3Dibm.com@lists.openembedded.org> wrote:

> Update the libspdm recipe to build and install shared libraries.
>
> Signed-off-by: Archana Kakani <archana.kakani@ibm.com>
> ---
>  meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb
> b/meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb
> index 04f1ffc1fc..d3e4802d5e 100644
> --- a/meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb
> +++ b/meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb
> @@ -51,6 +51,7 @@ EXTRA_OECMAKE +=3D "\
>         -DTARGET=3DRelease \
>         -DCRYPTO=3Dopenssl \
>         -DENABLE_BINARY_BUILD=3D1 \
> +        -DBUILD_LINUX_SHARED_LIB=3DON \
>         -DCOMPILED_LIBCRYPTO_PATH=3D${libdir} \
>         -DCOMPILED_LIBSSL_PATH=3D${libdir} \
>         -DDISABLE_TESTS=3D1 \
> @@ -60,7 +61,7 @@ EXTRA_OECMAKE +=3D "\
>
>  do_install () {
>      install -d ${D}/${libdir}
> -    install -m 0644 lib/* ${D}/${libdir}/
> +    cp -rf lib/* ${D}/${libdir}/
>
>      install -d ${D}/${includedir}/${BPN}/
>      cp -rf ${S}/include/* ${D}/${includedir}/${BPN}/
> --
> 2.51.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125968):
> https://lists.openembedded.org/g/openembedded-devel/message/125968
> Mute This Topic: https://lists.openembedded.org/mt/118633256/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000005e4fb7064e89c9f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This fails to build here on AB<div><br></div><div>| /srv/p=
okybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-linux/lib=
spdm/3.8.2/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linu=
x-ld: cannot find -lopenssllib: No such file or directory<br></div><div><br=
></div><div>See details -=C2=A0<a href=3D"https://autobuilder.yoctoproject.=
org/valkyrie/api/v2/logs/6151636/raw_inline">https://autobuilder.yoctoproje=
ct.org/valkyrie/api/v2/logs/6151636/raw_inline</a></div></div><br><div clas=
s=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_att=
r">On Thu, Apr 2, 2026 at 6:49=E2=80=AFAM Archana Kakani via <a href=3D"htt=
p://lists.openembedded.org">lists.openembedded.org</a> &lt;archana.kakani=
=3D<a href=3D"mailto:ibm.com@lists.openembedded.org">ibm.com@lists.openembe=
dded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Update the libspdm recipe to build and install shared libraries.<br=
>
<br>
Signed-off-by: Archana Kakani &lt;<a href=3D"mailto:archana.kakani@ibm.com"=
 target=3D"_blank">archana.kakani@ibm.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-support/libspdm/<a href=3D"http://libspdm_3.8.2.bb" r=
el=3D"noreferrer" target=3D"_blank">libspdm_3.8.2.bb</a> | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-support/libspdm/<a href=3D"http://libspdm_3.8.=
2.bb" rel=3D"noreferrer" target=3D"_blank">libspdm_3.8.2.bb</a> b/meta-oe/r=
ecipes-support/libspdm/<a href=3D"http://libspdm_3.8.2.bb" rel=3D"noreferre=
r" target=3D"_blank">libspdm_3.8.2.bb</a><br>
index 04f1ffc1fc..d3e4802d5e 100644<br>
--- a/meta-oe/recipes-support/libspdm/<a href=3D"http://libspdm_3.8.2.bb" r=
el=3D"noreferrer" target=3D"_blank">libspdm_3.8.2.bb</a><br>
+++ b/meta-oe/recipes-support/libspdm/<a href=3D"http://libspdm_3.8.2.bb" r=
el=3D"noreferrer" target=3D"_blank">libspdm_3.8.2.bb</a><br>
@@ -51,6 +51,7 @@ EXTRA_OECMAKE +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DTARGET=3DRelease \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DCRYPTO=3Dopenssl \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DENABLE_BINARY_BUILD=3D1 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DBUILD_LINUX_SHARED_LIB=3DON \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DCOMPILED_LIBCRYPTO_PATH=3D${libdir} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DCOMPILED_LIBSSL_PATH=3D${libdir} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DDISABLE_TESTS=3D1 \<br>
@@ -60,7 +61,7 @@ EXTRA_OECMAKE +=3D &quot;\<br>
<br>
=C2=A0do_install () {<br>
=C2=A0 =C2=A0 =C2=A0install -d ${D}/${libdir}<br>
-=C2=A0 =C2=A0 install -m 0644 lib/* ${D}/${libdir}/<br>
+=C2=A0 =C2=A0 cp -rf lib/* ${D}/${libdir}/<br>
<br>
=C2=A0 =C2=A0 =C2=A0install -d ${D}/${includedir}/${BPN}/<br>
=C2=A0 =C2=A0 =C2=A0cp -rf ${S}/include/* ${D}/${includedir}/${BPN}/<br>
-- <br>
2.51.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#125968): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/125968" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/125968</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118633256/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118633256/1997914</a><br>
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

--0000000000005e4fb7064e89c9f0--

