Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF785F53D82
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 17:53:39 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57221.1773683614408935859
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 10:53:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kCfJzuHd;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64ad8435f46so5058316d50.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 10:53:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773683613; cv=none;
        d=google.com; s=arc-20240605;
        b=N7Q6tWUrUTVqL/Qs5Ysbud7GEAHeIFOpCXCBZuvbZYNxt0CCwOJ2cIeIjc/zugb3Fz
         hLNvWhpDCPQBq0fXU0H+cnOwnb9v/xr9dejFCvqqtiGGCX9QdDHyPUO2cz9S2V1hhnqx
         vNN/wyis26p0F8xfy9JiBI9bf9tOxW4V93yTPic8M4VVp3B1Y/vz9i5ii/THgUov/b6x
         A06z1FM53la0ZrCkizvsoNM7GDRSkACo6Ha89l76vkf1OL/3vqJL+0UTkY8jRUb69k+w
         UPR0W4Ora2714zVuq0Ur71TxhqPrL+xEIAuibLOIhfR1ISH3oOzNTZWINOFl9zGXuwX9
         AVZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fcziy1enOTWsdZn3i8FSXpUeM/hpH2a3RrWAnHHmcQU=;
        fh=h9Ex+wTSRxmfMFCG2Jr02FsC81+oMWKE4EbK/EoR1eM=;
        b=cUhqdyew1mzJ2YsIuEg3f4IU4DCS7ahlsGZBQHYvKHUMMquyQbmb/MbBLHAvyGyf5V
         gOzsHEmRgmoeL2Anof4Fg/GVPxVekzoxUomyzl8e9BLnNeazN8806T3ER9DgFLbFmtAU
         7OKKLfxUylls7cELXB1NL2LSLLCvyfpYsZJV+sE3XvcWyyCCIfZ6IgWsObxt5Gx2dQna
         pQOLTKPuk/Tto6WiTQykSBH6xJmVSJZnwDPwd/Sna7n+TN5Us9P8WR4spfJ3jhWdT9h0
         s654DRmc5L1BVJ+ls0iE/s20Pe2K6epbNprksshhp7a8fyjc6in+2jrXDDj0nQRmLQtB
         qdUQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773683613; x=1774288413; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fcziy1enOTWsdZn3i8FSXpUeM/hpH2a3RrWAnHHmcQU=;
        b=kCfJzuHdSKHdyuxF8W7o4ii9PBQjqjxDgRXPdelFgH8QKsmKPWZ1HGr3SCMjIuiBo8
         PGT4qU80g/Mlu/OMr0zLgcqqr3s38iDzb0TUPY9RxUmj7KGI79v7r5KEXtUAxalNagHt
         Q6VHFF8PJY/56dv0HgDWx72MbGd5Sv5/BN3yB9rl0fP73Ic1PeG15ZVlDOz+dy/9bE0H
         a9yvWrCoT2mz0WY+aWiq1QmMexXrGOl/m5khdQ9EANNNxX1l4oHll6HR6VsyHpsiUm5O
         SX/SbLXnXhnUEzxLsLlC4glr/SbNruoSbUiOZe+13voDKqBfFNFZJz/Ba+LgvZJrlXeS
         juxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773683613; x=1774288413;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcziy1enOTWsdZn3i8FSXpUeM/hpH2a3RrWAnHHmcQU=;
        b=Q8ujm/4wJZUvWsP+F6+kl3/TFgYClKNIk2oxyCjJrDunXVgCi/uKTi374N6s5zhL4D
         1rnvtOuWXfdHaOOI4V47gwq5/PP0pGEOhx3H7VzyHBGva2OjbXxJRpXA28G3fXIH/yen
         4jK8MSFGN3X6hsf1ILTVbv/2qidjCrNWRRGjc0/tWGaUJ6zg0BrYVsCLErm3Gtsspwob
         iWXQ6TexiTBqslkq15bjY1kvl8CRhZm67K0fiIBRpVAwtzL/hJFY8e6KfEXKxrB0QXin
         yovISaZhySBuwrC2T4O1pIZoiTW+VV0zCfE83LExJSF0JvqCRRWMUBEA/JjU4w8ucaHO
         hDyw==
X-Gm-Message-State: AOJu0YzEpa+Ou/fnEo9Lng7OMXYjtw7uEx/wrNjmMYjwMS3NL0JtK3vV
	tiNm6ZuPKjAbbbck+xobnqMcQKii8nmPFUhkjEhvmCh6IMcg+xLuFZh1Um7SPoRiOhGd0+Jqefm
	lnAoP5ivD6Y3ZFNhpocp9xDtk3LjvG5o=
X-Gm-Gg: ATEYQzyIXt10KwNCdmvRLR7L6uOPPxneRnib/Gx6YW/2LNw2LKtH6K2kwzGWruTfnqF
	TlP5PSLx7sh2oy4v9VbzsennYxcmdwQq4rdue2UboL/lDHxCWLc5769ySsRl/ALDUD26/b+1dfg
	talDlFgBZJwqQfK6WJVS7l0deKEAbAuaAQTyU1CEXOH96DNfYkWITTU0FhtPQBtkcNNrwxmsJfv
	6ZmxetClkwVI8uy2qMHlotADWhTo1FpKbKnMfYg2d0ThtDhhu8SDUoZqB1/wzCn0jVS9DD0JDd/
	xAEgwxZtHd3zgUcELt/Xc7rDdV+8utfqeeczN+xmiM6+BTSdg9X40j98J8ZVN4o6QS7Cg4gXZ7n
	y8hrRMLQ8WhS4UK5nAals8b6f
X-Received: by 2002:a05:690e:4492:b0:64c:ed48:dc84 with SMTP id
 956f58d0204a3-64e630a686fmr11818528d50.63.1773683613424; Mon, 16 Mar 2026
 10:53:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260312102411.128382-1-jiaying.song.cn@windriver.com>
In-Reply-To: <20260312102411.128382-1-jiaying.song.cn@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Mar 2026 10:53:06 -0700
X-Gm-Features: AaiRm51wwWHE2pYpW7jJ1Au0kkALUgbHfTRZNTO2o9ue5HZr6oVHjiz7LHlJoJQ
Message-ID: <CAMKF1sqngpzuOopp1zyTq3oMbhrKJ3gmDZt8y+4Dj57WCXFUmQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-redis: Upgrade 5.2.1->7.3.0
To: Jiaying.Song.CN@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b8e1a8064d27e57b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 17:53:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125281

--000000000000b8e1a8064d27e57b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There is upgrade to 5.3.1 staged in master-next please rebase it on top of
that

On Thu, Mar 12, 2026 at 3:24=E2=80=AFAM Song, Jiaying (CN) via
lists.openembedded.org <Jiaying.Song.CN=3Dwindriver.com@lists.openembedded.=
org>
wrote:

> From: Jiaying Song <jiaying.song.cn@windriver.com>
>
> Switch build system from setuptools3 to python_hatchling
>
> Changelog:
> https://github.com/redis/redis-py/releases
>
> Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> ---
>  .../python/{python3-redis_5.2.1.bb =3D> python3-redis_7.3.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-redis_5.2.1.bb =3D>
> python3-redis_7.3.0.bb} (82%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-redis_5.2.1.bb
> b/meta-python/recipes-devtools/python/python3-redis_7.3.0.bb
> similarity index 82%
> rename from meta-python/recipes-devtools/python/python3-redis_5.2.1.bb
> rename to meta-python/recipes-devtools/python/python3-redis_7.3.0.bb
> index ba214f5869..861221d3ee 100644
> --- a/meta-python/recipes-devtools/python/python3-redis_5.2.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-redis_7.3.0.bb
> @@ -7,9 +7,9 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D609ded3add9111c4c6e102f1d421d3f8"
>  # Prefix archive to avoid clashing with the main redis archives
>  PYPI_ARCHIVE_NAME_PREFIX =3D "pypi-"
>
> -SRC_URI[sha256sum] =3D
> "16f2e22dff21d5125e8481515e386711a34cbec50f0e44413dd7d9c060a54e0f"
> +SRC_URI[sha256sum] =3D
> "4d1b768aafcf41b01022410b3cc4f15a07d9b3d6fe0c66fc967da2c88e551034"
>
> -inherit pypi setuptools3
> +inherit pypi python_hatchling
>
>  RDEPENDS:${PN} +=3D " \
>      python3-asyncio \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125100):
> https://lists.openembedded.org/g/openembedded-devel/message/125100
> Mute This Topic: https://lists.openembedded.org/mt/118276387/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b8e1a8064d27e57b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There is upgrade to 5.3.1 staged in master-next please reb=
ase it on top of that</div><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 12, 2026 at 3:24=E2=
=80=AFAM Song, Jiaying (CN) via <a href=3D"http://lists.openembedded.org">l=
ists.openembedded.org</a> &lt;<a href=3D"http://Jiaying.Song.CN">Jiaying.So=
ng.CN</a>=3D<a href=3D"mailto:windriver.com@lists.openembedded.org">windriv=
er.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">From: Jiaying Song &lt;<a href=3D"mailto:jiayi=
ng.song.cn@windriver.com" target=3D"_blank">jiaying.song.cn@windriver.com</=
a>&gt;<br>
<br>
Switch build system from setuptools3 to python_hatchling<br>
<br>
Changelog:<br>
<a href=3D"https://github.com/redis/redis-py/releases" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/redis/redis-py/releases</a><br>
<br>
Signed-off-by: Jiaying Song &lt;<a href=3D"mailto:jiaying.song.cn@windriver=
.com" target=3D"_blank">jiaying.song.cn@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../python/{<a href=3D"http://python3-redis_5.2.1.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-redis_5.2.1.bb</a> =3D&gt; <a href=3D"http://=
python3-redis_7.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-redis_=
7.3.0.bb</a>} | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-redis_5.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-redis_5.2.1.b=
b</a> =3D&gt; <a href=3D"http://python3-redis_7.3.0.bb" rel=3D"noreferrer" =
target=3D"_blank">python3-redis_7.3.0.bb</a>} (82%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
redis_5.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-redis_5.2.1.bb=
</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-redis_=
7.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-redis_7.3.0.bb</a><b=
r>
similarity index 82%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-r=
edis_5.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-redis_5.2.1.bb<=
/a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-red=
is_7.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-redis_7.3.0.bb</a=
><br>
index ba214f5869..861221d3ee 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-redis_5=
.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-redis_5.2.1.bb</a><br=
>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-redis_7=
.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-redis_7.3.0.bb</a><br=
>
@@ -7,9 +7,9 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D609ded3add9=
111c4c6e102f1d421d3f8&quot;<br>
=C2=A0# Prefix archive to avoid clashing with the main redis archives<br>
=C2=A0PYPI_ARCHIVE_NAME_PREFIX =3D &quot;pypi-&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;16f2e22dff21d5125e8481515e386711a34cbec50f0e4=
4413dd7d9c060a54e0f&quot;<br>
+SRC_URI[sha256sum] =3D &quot;4d1b768aafcf41b01022410b3cc4f15a07d9b3d6fe0c6=
6fc967da2c88e551034&quot;<br>
<br>
-inherit pypi setuptools3<br>
+inherit pypi python_hatchling<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0python3-asyncio \<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#125100): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/125100" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/125100</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118276387/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118276387/1997914</a><br>
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

--000000000000b8e1a8064d27e57b--

