Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9564DD2FEDE
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 19:55:52 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21225.1769543745526441612
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 11:55:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1XOyqToW;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-432d2c96215so5314517f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 11:55:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769543744; cv=none;
        d=google.com; s=arc-20240605;
        b=KqY6IKiIBNE4hpJutlCoPTQ0qD+vbwmMsJvCnIpcb7lqL9GLOhrX5naXDx7ld1urxh
         t1C2QC9QkddBl4LHSnDLRVGqvgyUuAz5IGZukp+lSPU/xk47OAd/Pxn8bxzihlrrN2nD
         /ZtbRok4RBwNJDhpTTYK9U9nISm7rx3cs0avpWYx8NeCJwHmehlPJWD2l0qoRFntAdSf
         7mCklWsbc1JYOrpcsKGw6bs+KaOlYVWWxhTuumQk/uYM83f5StqYSauYx4oNTOiG56e9
         Aza4UP/g44udpbznYhjFqScnSSGgbNvJ3QSWKZae17HozlPKKnt5Krd7gDGy9L4bs4FJ
         YbtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vP/8cNBHpvtFJbl/eD/hjuydnYnW/dpWGZPFvYaIP9g=;
        fh=uxmG868Kd5t8XmSTYvkGG893HtAfHvsgyELZO06oZR8=;
        b=awAoj+JjnHvAJFdf6Xq+f9x2znwKiGLXvSZuM/APc8A1iNQUrnffWyey8CLBCTyiIM
         Z/qnhopXs+5RC5heuL0sMlh9FbJxWrReLQAURt0x79aYRk8nnkjZS2i6hlsP3DVHexOb
         TzVgVVaVpG960SOhBR8c1F/jz9wbJ4R9Dm5VlKz+E5WytXZU+ryae6PCzH+07OUPc3fB
         en3+N4sSKgCuVU9FRirzHiFf1pyAw5ijz9+N2yMoLse3sGxb+b6ULNgokS2KaXNCJQ28
         gwGNwH+Xdvrh+kSJ2YlCwF7XyGCztyneNwM6IuL9TaGJpLukR/yB9UAl6nN5iffdCEKv
         flHQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769543744; x=1770148544; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vP/8cNBHpvtFJbl/eD/hjuydnYnW/dpWGZPFvYaIP9g=;
        b=1XOyqToWcBTf3guB5mXjJvvKQcKaLy9QdlnirkmHg8wbIFcu/LAVMvmpgxKY5v/XyW
         RU5RJ+MdvgIKURZSP6fygTDTT6rpgTOKHIkAEANUtKxuQbBBzlfK57nFPDyWtT5ozqRJ
         m7RNNH1xp0rKyFLLZnfbGSth25vdph++IT39w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769543744; x=1770148544;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vP/8cNBHpvtFJbl/eD/hjuydnYnW/dpWGZPFvYaIP9g=;
        b=VYYMqPaq0crLQ7mepJf86mHDZ1ZWFKmkHIkk3nc3wfS/cYyLQwX8+Sjeo5M3rMMDK+
         tgWa7c7uXVuaSIQF0yYoUdbeYmpp75ay7HhxvoAMsfWE9zfxI4tkwGdFHohXXlQWxpXH
         VaKjvDJXqMmKuYk4P+0hAXMEdaBB4NMcY+jq4x6GokokyWIlL2oyXoVqWpZP26I5u1QJ
         24PiG6h6qGP9zP5dh7aiWEZXExNVPz7iE42e01u86EuJNZa4waO09rp6UsNt2oCBMBco
         ZmE3hr/FTu5jeHdbInDbrQo7eQgfpPT9fgbI8T07EXHLdILJjtkPbrHg5+QRjKcC2OLp
         FJ0w==
X-Gm-Message-State: AOJu0YwqWnKrU9pgsTZFgkWCpjgG2dtzfh3Y3K/i+yGbCSqqBePWWunT
	mjoOEiOdQqjuTzzpBG+VHHaaCoZHq0s3JZ0lh8wXWMPPkVPC//cT7QTmuTUiXN4Al6+xtDaVSaH
	dCpKt837cH1KmvMHN78XGVyXp89AOyBMIIgRaRjICrw==
X-Gm-Gg: AZuq6aIbXR1aW6YkvrVvfo7j08qYkqHb8JeY+036bVl6EF78HXmIufovsQmhz/EBtWl
	biMLzji3qH8EEGFuCvTsgTuqROGR8W/w8C7Wv5y38SECkiguGGtL16msl5x4BlQN/WBhODbgFil
	vaV3T2g5ubAwL31Ojv2RJUOg9Kx2uC++unxlPSRjq6y93eK+yfXWMyno3WLFXZq+VCJuNC+GHjX
	Mp5cqzHyy4PTxx3OyboIE3uvSEEU4EwEwccY1BrS5u75ze5mtgkINpZOGudeDHhF+TJTNDsD8ZG
	+/XQfBJp+YcDMR4x3VV2z0JHh266BUIbfG9/u8c=
X-Received: by 2002:a05:6000:2210:b0:431:35a:4a8f with SMTP id
 ffacd0b85a97d-435dd1bc2cdmr4131334f8f.47.1769543743800; Tue, 27 Jan 2026
 11:55:43 -0800 (PST)
MIME-Version: 1.0
References: <20260127181629.702469-1-tgamblin@baylibre.com>
In-Reply-To: <20260127181629.702469-1-tgamblin@baylibre.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 27 Jan 2026 20:55:17 +0100
X-Gm-Features: AZwV_QiL4Iu-hR06ipekslRQHNdYpHk-mlcISgyqNyynDCIyo9dhwDNI5nyUK84
Message-ID: <CAMSfU+4L1RwkFpNT6FyUx=gorWYhfBT3U481WuimimFVvQs46A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] hdf5: fix shasum, downloadfilename
To: tgamblin@baylibre.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000043974506496402c2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 19:55:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123960

--00000000000043974506496402c2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 27 janv. 2026 =C3=A0 19:21, Trevor Gamblin via lists.openembedded.o=
rg
<tgamblin=3Dbaylibre.com@lists.openembedded.org> a =C3=A9crit :

> Fixes: #1023
>
> Upstream seems to have regenerated the archive, as the checksum no
> longer matches the one specified in the recipe:
>
> |WARNING: hdf5-2.0.0-r0 do_fetch: Checksum failure encountered with
> download of
> https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/hdf5-2.0=
.0.tar.gz
> - will attempt other sources if available
> |WARNING: hdf5-2.0.0-r0 do_fetch: Checksum mismatch for local file
> /buildcache/downloads/hdf5-2.0.0.tar.gz
> |Cleaning and trying again.
> |WARNING: hdf5-2.0.0-r0 do_fetch: Renaming
> /buildcache/downloads/hdf5-2.0.0.tar.gz to
> /buildcache/downloads/hdf5-2.0.0.tar.gz_bad-checksum_a7a8f43e76e825ea2223=
4bc735d5b184e880d305e33e4c9bb93a3912421c9973
> |ERROR: hdf5-2.0.0-r0 do_fetch: Checksum failure fetching
> https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/hdf5-2.0=
.0.tar.gz
> |ERROR: hdf5-2.0.0-r0 do_fetch: Bitbake Fetcher Error:
> ChecksumError('Checksum mismatch!\nFile:
> \'/buildcache/downloads/hdf5-2.0.0.tar.gz\' has sha256 checksum
> \'a7a8f43e76e825ea22234bc735d5b184e880d305e33e4c9bb93a3912421c9973\' when
> \'6e45a4213cb11bb5860)
> |ERROR: Logfile of failure stored in:
> /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3=
-poky-linux/hdf5/2.0.0/temp/log.do_fetch.2054297
>
> However, the tarballs look identical. Update the hash and be explicit
> about downloadfilename to avoid any mirroring issues. A note has been
> left that this measure can be removed with a future upgrade.
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>

Thank you,

Reviewed-by: Yoann Congal <yoann.congal@smile.fr>


> ---
>  meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
> b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
> index 93fe352b99..350be8dc0e 100644
> --- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
> +++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
> @@ -11,11 +11,13 @@ inherit cmake pkgconfig siteinfo qemu multilib_header
> multilib_script
>
>  DEPENDS +=3D "qemu-native zlib"
>
> -SRC_URI =3D "
> https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BPN}-$=
{PV}.tar.gz
> \
> +# set downloadfilename to workaround mirroring test issues. When hdf5 is
> +# upgraded beyond 2.0.0 this can likely be removed
> +SRC_URI =3D "
> https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BPN}-$=
{PV}.tar.gz;downloadfilename=3D${BPN}-${PV}-1.tar.gz
> \
>
> file://0002-Remove-suffix-shared-from-shared-library-name.patch \
>             file://0001-cmake-remove-build-flags.patch \
>             "
> -SRC_URI[sha256sum] =3D
> "6e45a4213cb11bb5860e1b0a7645688ab55562cc2d55c6ff9bcb0984ed12b22b"
> +SRC_URI[sha256sum] =3D
> "f4c2edc5668fb846627182708dbe1e16c60c467e63177a75b0b9f12c19d7efed"
>
>  FILES:${PN} +=3D "${libdir}/libhdf5.settings ${datadir}/*"
>
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123959):
> https://lists.openembedded.org/g/openembedded-devel/message/123959
> Mute This Topic: https://lists.openembedded.org/mt/117493806/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--00000000000043974506496402c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 27=
 janv. 2026 =C3=A0=C2=A019:21, Trevor Gamblin via <a href=3D"http://lists.o=
penembedded.org">lists.openembedded.org</a> &lt;tgamblin=3D<a href=3D"mailt=
o:baylibre.com@lists.openembedded.org">baylibre.com@lists.openembedded.org<=
/a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Fixes: #1023<br>
<br>
Upstream seems to have regenerated the archive, as the checksum no<br>
longer matches the one specified in the recipe:<br>
<br>
|WARNING: hdf5-2.0.0-r0 do_fetch: Checksum failure encountered with downloa=
d of <a href=3D"https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/down=
loads/hdf5-2.0.0.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://suppo=
rt.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/hdf5-2.0.0.tar.gz</a> -=
 will attempt other sources if available<br>
|WARNING: hdf5-2.0.0-r0 do_fetch: Checksum mismatch for local file /buildca=
che/downloads/hdf5-2.0.0.tar.gz<br>
|Cleaning and trying again.<br>
|WARNING: hdf5-2.0.0-r0 do_fetch: Renaming /buildcache/downloads/hdf5-2.0.0=
.tar.gz to /buildcache/downloads/hdf5-2.0.0.tar.gz_bad-checksum_a7a8f43e76e=
825ea22234bc735d5b184e880d305e33e4c9bb93a3912421c9973<br>
|ERROR: hdf5-2.0.0-r0 do_fetch: Checksum failure fetching <a href=3D"https:=
//support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/hdf5-2.0.0.tar.g=
z" rel=3D"noreferrer" target=3D"_blank">https://support.hdfgroup.org/releas=
es/hdf5/v2_0/v2_0_0/downloads/hdf5-2.0.0.tar.gz</a><br>
|ERROR: hdf5-2.0.0-r0 do_fetch: Bitbake Fetcher Error: ChecksumError(&#39;C=
hecksum mismatch!\nFile: \&#39;/buildcache/downloads/hdf5-2.0.0.tar.gz\&#39=
; has sha256 checksum \&#39;a7a8f43e76e825ea22234bc735d5b184e880d305e33e4c9=
bb93a3912421c9973\&#39; when \&#39;6e45a4213cb11bb5860)<br>
|ERROR: Logfile of failure stored in: /home/tgamblin/workspace/yocto/openem=
bedded-core/build/tmp/work/x86-64-v3-poky-linux/hdf5/2.0.0/temp/log.do_fetc=
h.2054297<br>
<br>
However, the tarballs look identical. Update the hash and be explicit<br>
about downloadfilename to avoid any mirroring issues. A note has been<br>
left that this measure can be removed with a future upgrade.<br>
<br>
Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:tgamblin@baylibre.com" =
target=3D"_blank">tgamblin@baylibre.com</a>&gt;<br></blockquote><div><br></=
div><div>Thank you,</div><div><br></div><div>Reviewed-by: Yoann Congal &lt;=
<a href=3D"mailto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt;</div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0meta-oe/recipes-support/hdf5/<a href=3D"http://hdf5_2.0.0.bb" rel=3D"=
noreferrer" target=3D"_blank">hdf5_2.0.0.bb</a> | 6 ++++--<br>
=C2=A01 file changed, 4 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-support/hdf5/<a href=3D"http://hdf5_2.0.0.bb" =
rel=3D"noreferrer" target=3D"_blank">hdf5_2.0.0.bb</a> b/meta-oe/recipes-su=
pport/hdf5/<a href=3D"http://hdf5_2.0.0.bb" rel=3D"noreferrer" target=3D"_b=
lank">hdf5_2.0.0.bb</a><br>
index 93fe352b99..350be8dc0e 100644<br>
--- a/meta-oe/recipes-support/hdf5/<a href=3D"http://hdf5_2.0.0.bb" rel=3D"=
noreferrer" target=3D"_blank">hdf5_2.0.0.bb</a><br>
+++ b/meta-oe/recipes-support/hdf5/<a href=3D"http://hdf5_2.0.0.bb" rel=3D"=
noreferrer" target=3D"_blank">hdf5_2.0.0.bb</a><br>
@@ -11,11 +11,13 @@ inherit cmake pkgconfig siteinfo qemu multilib_header m=
ultilib_script<br>
<br>
=C2=A0DEPENDS +=3D &quot;qemu-native zlib&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"https://support.hdfgroup.org/releases/hdf5/v2=
_0/v2_0_0/downloads/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=
=3D"_blank">https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/download=
s/${BPN}-${PV}.tar.gz</a> \<br>
+# set downloadfilename to workaround mirroring test issues. When hdf5 is<b=
r>
+# upgraded beyond 2.0.0 this can likely be removed<br>
+SRC_URI =3D &quot;<a href=3D"https://support.hdfgroup.org/releases/hdf5/v2=
_0/v2_0_0/downloads/$%7BBPN%7D-$%7BPV%7D.tar.gz;downloadfilename=3D$%7BBPN%=
7D-$%7BPV%7D-1.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://support=
.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BPN}-${PV}.tar.gz;downl=
oadfilename=3D${BPN}-${PV}-1.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-Remove-suffix-shared-=
from-shared-library-name.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-cmake-remove-build-fl=
ags.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;6e45a4213cb11bb5860e1b0a7645688ab55562cc2d55c=
6ff9bcb0984ed12b22b&quot;<br>
+SRC_URI[sha256sum] =3D &quot;f4c2edc5668fb846627182708dbe1e16c60c467e63177=
a75b0b9f12c19d7efed&quot;<br>
<br>
=C2=A0FILES:${PN} +=3D &quot;${libdir}/libhdf5.settings ${datadir}/*&quot;<=
br>
<br>
-- <br>
2.52.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#123959): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123959" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/123959</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117493806/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117493806/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" t=
arget=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--00000000000043974506496402c2--

