Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC1EACA5FCB
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 14:26:50 +0000 (UTC)
Received: from mail-yx2-f38.google.com (mail-yx2-f38.google.com [74.125.224.166])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12637.1790864809220206300
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2026 07:26:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VeExLiKl;
 spf=pass (domain: gmail.com, ip: 74.125.224.166, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f38.google.com with SMTP id 00721157ae682-8ab408a38bdso14655987b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 07:26:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790864808; cv=none;
        d=google.com; s=arc-20260327;
        b=nf2UETIIC4/iEvr9/dYwQV1eBUmdr3VrD0Ny9yBTlIKKnxHVA6ukk2LHb8MZewmmsC
         UiyWeqa2F8CZ7kGUSA+1/bJTZjI1io6482PmfAnhiVvIZ0tSucEyObAaPEIUaWq+/Iv7
         Nh4hznP2SAbGksTRXdDKJS3fXAy2mMF2Djf55Y96+zeDepaX59Q3KaCuO5TraZ11EsNP
         uAYlVCjQ9iS9QZPMJ/K4LK9z2pMJMM5ReG06dpS1lcXt7DORUTptZPaoT02SLeduDK4D
         QYxihWXiD2m1RNGm78BU0/fzyGDeSV8jNGoTyi/Pgz33L1xHKplW0j/MJPpcvUS4TOB8
         LxdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iXFdbaOWEmaQIkmg3WGZm9RRg6gpxpGBxfuUmBtTR1g=;
        fh=n0ZnAkKOhGDmrf8RLpwnC7FQ6xmEY5rofL6wXnjsXjs=;
        b=Kgsh1wQlzVKRXtTSl8ZRVrEWtoHvjMGhy9ZYyEL4uB92PU4S9ATgkS3ukGj0U6UIaC
         PJpi03e8f0wRVy15XqWT+dHO6myUOOc4gAr41AEYQTOcZAEigEFc119cTNcFTQp00M9l
         JckQrXqRC6433qYYTIMbIvyc9nxFZ52tRf5ycjJyDzVqzuAbDrd/+cJQyJcQ7HuMk3GM
         DXkQz/2aRWb7TYYsEn+PkIBtCfJgLcMjtV4Xh/+OBbHJRgm0+8ddZvzsqTYL79rY3/d+
         uaTwfVBquGVJZ9zKetWpFrZ0A9crw9j8eTOgBjQexLKbYGeRbCeU9xX3d6QB4KwL/Ju2
         XWRg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790864808; x=1791469608; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iXFdbaOWEmaQIkmg3WGZm9RRg6gpxpGBxfuUmBtTR1g=;
        b=VeExLiKlt9yOaakqx6QvpAgpgPSDdWytjRBOTOBQ3WZl2OZQoeDFIUkwfl0ooo7nLN
         xjubHG01VVN1dQ8M86NGtfT1RszMnoik825f5qkQydrsEZE+cxuR11T2qeEwDNgERGgq
         lN6dhPFLj2cugNYw5RHB805YoJyJhKdw5a92O0XqyGcMJ1fYsbxN4Pq+2RPYsFqeYx0n
         IoUWyVPVotw3xKePTyMppp6BMduA+Sec7AEhFUGEXerGsgGpDlMHtlD0dSCU4fLVt+7a
         1DmOLlDWz6FM2rSK7YbryxhfIBR8Iq6bjqcSeC7ZO2NImhxUKhz8jYP0gG+g4a0r/nl2
         b7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790864808; x=1791469608;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iXFdbaOWEmaQIkmg3WGZm9RRg6gpxpGBxfuUmBtTR1g=;
        b=IxHKdKYJH0T8Sp6Pg8oB9Uzk3fwAdonOlVoad/M3CDL4j+G2IK2T036JSPJcBvTwwg
         kmkhVw8L/aLAxY3pQYhAaN5hIYTOuE3bd2FcPsOSrmppjIeCmXU1LfuRYm4QjnP8f7sk
         iD/60C5B5q34dTZoZkwwQ1qYRM9xhpXmqesouU73Rw5xVQKMFKk8rJzRvZ3sfUOKi9Ph
         rw+WZPWSwZNRO+zXcrg9BexGsnRuA6/i3Pwl+deWhsMKADwdbTJauqCndJgTH40b6eEn
         MGO1PWO34bNwSVz3lhAkaN/eT11vDt4nUrhVj8TVCtaKWKhk3mz2vfWI2lMltucwVzfA
         6OnA==
X-Gm-Message-State: AFq9FYK8ih2VVTdC0OiVMd1IkQfUVtA3m8ZqnVVS0uhrObD45iqg+PO+
	O7nVvgiblpRVbCrpIo30E+K2bQeifYIBrOlnb57oOuw1dwjIZj9VVmH/PlHBndlVHd8UIzuSsAC
	bBZcWlKEgNXB6YN+ALkPTkJjj4mjPTsE=
X-Gm-Gg: AYBFou1UjmOOCFGQFhHfv4W5scv4+a6SmHiRYJ1F8kB4VYts35nWpTxeod8UgTTV7fz
	e6s+Kosut8fuBtDuN5eHJT2niOcHeGP7SmscY/Q+kX+M8GBOG8CGf15zp9NoJ6SZp45bjFR3DEJ
	SICbFGRG7wbIzUv2DVml7lk6oDtFS8kVIsvNc4CiOWfmpEA7A1GaXXOreisGAvj/LxJ0BTpdLf2
	y3Rwr45oTZPsAgn3cd+wI2LQqLyMs7bqRfo7newTsJ7JnyHZgrzkx/4JpJTyfOSbSLiDwLhYNku
	qG3PkrBwNVzqXqL1hi/Memu8JvPPjKdYcDoAtEmEB8dQgMltqTqBjNxUxnbb7uZgswuTcJbHXuu
	RWidQ0k7TNRNBS4F2Amo08eD8XVUgG9Oqx7S0s2vjfReLAYKAZmJ3R8yYEppS9Lg+rC8hwic7Kc
	yQCTFhB3g4PAozFV4sWWtN+IstPMo3JxOL0opnNh9gsCHq2Hd7JRJ6yH0cS76I//8B6FG+zBSB6
	ag+23JVHoYU6hJKep4mwmhfkZnn8HpCA/7FdLFNgQCuRLwm1Ca/78XejRx7dHh7rKU0iYKHk2xj
	PO5f+P/7CvRzjBtrJTzobyKthMO6f7m4+oL5GAA=
X-Received: by 2002:a05:690c:698a:b0:8ab:36db:e30e with SMTP id
 00721157ae682-8acdafb4837mr12843737b3.18.1790864807869; Thu, 01 Oct 2026
 07:26:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com> <20260927105002.1832451-35-ankur.tyagi85@gmail.com>
In-Reply-To: <20260927105002.1832451-35-ankur.tyagi85@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Oct 2026 07:26:20 -0700
X-Gm-Features: AclHuK8z4DTaNqVFuS7x1-iGzp_sMxDQTaMm7jhChae_kEw3ujbskVrUemDo7-U
Message-ID: <CAMKF1soezkx8wrLX9iUKmKgD9Z_Sgt1BpoDO=Ev2fN7qA7tfjQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 35/35] fuse3: upgrade 3.18.2 -> 3.18.3
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b6c44b065cc83468"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 14:26:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130594

--000000000000b6c44b065cc83468
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is failing ptests (meta-oe-image-ptest-fuse3)

AssertionError:
ptests which had no test results:
['fuse3']

On Sun, Sep 27, 2026 at 3:51=E2=80=AFAM Ankur Tyagi via lists.openembedded.=
org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:

> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Changelog:
> https://github.com/libfuse/libfuse/releases/tag/fuse-3.18.3
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../recipes-support/fuse/{fuse3_3.18.2.bb =3D> fuse3_3.18.3.bb}   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/fuse/{fuse3_3.18.2.bb =3D> fuse3_3.18.3.b=
b}
> (97%)
>
> diff --git a/meta-oe/recipes-support/fuse/fuse3_3.18.2.bb
> b/meta-oe/recipes-support/fuse/fuse3_3.18.3.bb
> similarity index 97%
> rename from meta-oe/recipes-support/fuse/fuse3_3.18.2.bb
> rename to meta-oe/recipes-support/fuse/fuse3_3.18.3.bb
> index f901b30efe..75dde98a7c 100644
> --- a/meta-oe/recipes-support/fuse/fuse3_3.18.2.bb
> +++ b/meta-oe/recipes-support/fuse/fuse3_3.18.3.bb
> @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM =3D " \
>  "
>
>  SRC_URI =3D "
> https://github.com/libfuse/libfuse/releases/download/fuse-${PV}/fuse-${PV=
}.tar.gz
> "
> -SRC_URI[sha256sum] =3D
> "f01de85717e20adf5f98aff324acd85dd73d61a5ca3834d573dcf0bd6e54a298"
> +SRC_URI[sha256sum] =3D
> "bcd19582c5e30f7fe45dd86a5540e998590aa01903afc7ebcbeea6c8ac5421ee"
>
>  S =3D "${UNPACKDIR}/fuse-${PV}"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130369):
> https://lists.openembedded.org/g/openembedded-devel/message/130369
> Mute This Topic: https://lists.openembedded.org/mt/121453691/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b6c44b065cc83468
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is failing ptests (meta-oe-image-ptest-fuse3)<div><br=
></div><div>AssertionError:<br>ptests which had no test results:<br>[&#39;f=
use3&#39;]</div></div><br><div class=3D"gmail_quote gmail_quote_container">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 27, 2026 at 3:51=E2=80=AF=
AM Ankur Tyagi via <a href=3D"http://lists.openembedded.org">lists.openembe=
dded.org</a> &lt;ankur.tyagi85=3D<a href=3D"mailto:gmail.com@lists.openembe=
dded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">From: Ankur Tyagi &lt;<a href=3D"=
mailto:ankur.tyagi85@gmail.com" target=3D"_blank">ankur.tyagi85@gmail.com</=
a>&gt;<br>
<br>
Changelog:<br>
<a href=3D"https://github.com/libfuse/libfuse/releases/tag/fuse-3.18.3" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/libfuse/libfuse/releas=
es/tag/fuse-3.18.3</a><br>
<br>
Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" t=
arget=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-support/fuse/{<a href=3D"http://fuse3_3.18.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">fuse3_3.18.2.bb</a> =3D&gt; <a href=3D"http://=
fuse3_3.18.3.bb" rel=3D"noreferrer" target=3D"_blank">fuse3_3.18.3.bb</a>}=
=C2=A0 =C2=A0| 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-oe/recipes-support/fuse/{<a href=3D"http://fuse3_3.18.2.b=
b" rel=3D"noreferrer" target=3D"_blank">fuse3_3.18.2.bb</a> =3D&gt; <a href=
=3D"http://fuse3_3.18.3.bb" rel=3D"noreferrer" target=3D"_blank">fuse3_3.18=
.3.bb</a>} (97%)<br>
<br>
diff --git a/meta-oe/recipes-support/fuse/<a href=3D"http://fuse3_3.18.2.bb=
" rel=3D"noreferrer" target=3D"_blank">fuse3_3.18.2.bb</a> b/meta-oe/recipe=
s-support/fuse/<a href=3D"http://fuse3_3.18.3.bb" rel=3D"noreferrer" target=
=3D"_blank">fuse3_3.18.3.bb</a><br>
similarity index 97%<br>
rename from meta-oe/recipes-support/fuse/<a href=3D"http://fuse3_3.18.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">fuse3_3.18.2.bb</a><br>
rename to meta-oe/recipes-support/fuse/<a href=3D"http://fuse3_3.18.3.bb" r=
el=3D"noreferrer" target=3D"_blank">fuse3_3.18.3.bb</a><br>
index f901b30efe..75dde98a7c 100644<br>
--- a/meta-oe/recipes-support/fuse/<a href=3D"http://fuse3_3.18.2.bb" rel=
=3D"noreferrer" target=3D"_blank">fuse3_3.18.2.bb</a><br>
+++ b/meta-oe/recipes-support/fuse/<a href=3D"http://fuse3_3.18.3.bb" rel=
=3D"noreferrer" target=3D"_blank">fuse3_3.18.3.bb</a><br>
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM =3D &quot; \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://github.com/libfuse/libfuse/relea=
ses/download/fuse-$%7BPV%7D/fuse-$%7BPV%7D.tar.gz" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/libfuse/libfuse/releases/download/fuse-${PV=
}/fuse-${PV}.tar.gz</a>&quot;<br>
-SRC_URI[sha256sum] =3D &quot;f01de85717e20adf5f98aff324acd85dd73d61a5ca383=
4d573dcf0bd6e54a298&quot;<br>
+SRC_URI[sha256sum] =3D &quot;bcd19582c5e30f7fe45dd86a5540e998590aa01903afc=
7ebcbeea6c8ac5421ee&quot;<br>
<br>
=C2=A0S =3D &quot;${UNPACKDIR}/fuse-${PV}&quot;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#130369): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/130369" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/130369</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121453691/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121453691/1997914</a><br>
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

--000000000000b6c44b065cc83468--

