Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E59E5D116E2
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 20:01:20 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2992.1764360074014673299
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 12:01:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QlwQJrh+;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-642fcb38f35so1681377d50.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 12:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764360073; x=1764964873; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=62kPeVX+t2rPRfDiT82AWvD3Fv7H+Z6VRjfw6j5Subc=;
        b=QlwQJrh+YxAVkc8ZgHWEb25W9lq3ZisGoMfiXFWlksWTvhE93CE86+rfUPM6xVscxz
         9gBjWH9ZBUQ5bmSjfvkA5XG8TBsnYb386HK+VkY5Fo+s3bwJsmfDSyiFgz/czEb+3nEi
         f/NzpnXwDUFzrRe3p0w6zI9hVJqc4okrnNAL/uTCsPKmeHEgB3tL/tbcwSHz+PxPmKnH
         R6wx6Cor5+EQoRjrLvp3ZFMigMqRTIqMlM9kc5n6ecMEf6Y9h0Xyl+TaFBLs0ypBAp6O
         Y5imwGaIlnx5zetW2XnR2KhbABSLn5/ESPJt1UTZ1K8AJ7Chzuq798pvGlJdUItmpXUO
         g3ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764360073; x=1764964873;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62kPeVX+t2rPRfDiT82AWvD3Fv7H+Z6VRjfw6j5Subc=;
        b=MO+TP1RiDqwaCVLGceNbam1dkjb5ezLr9Tg8odY9ZdF6eFd2CxL0vQgpsbYV8ZIvau
         mvbjWNX2aM6RtTTastux9c5yDbCNDAWwDhoFQN49hbTAlMFyR+CdGSBoyYx+2daXgdeR
         cqPFJ9C9F9J2erb7MwZC76Z5g00WbTK7ydvrCw3cqVClZude5b4H0QeIkO3OKsBXQwbc
         q0EEa3PNuzQhu+noxujOiOWM/Y9aRZipTNURfV9oqwP7SMo43AOanExF9MYcjfgAXAkG
         zxEEnZsuaFuOF07y1VsoiiTLx6KAzvnFBBe7FTsk855oyKnY2OFGMRnfWfBuCqK8bYiI
         Vdag==
X-Gm-Message-State: AOJu0YzgHJdFR/xknCLxgV0rHWQjVvfzYcJtqZBwFPbo44DzDpCjAjH3
	pNCzMyPoO8DXt9yGwNvFj8TuzX57XZ5q8as8nFydIxjLfoJmRYvPXcadpnSKH0ZVDp6l+LSKdUW
	jTA2t5Npuim9nREbm6AHMQekMZ4hQIovlICpPiE0=
X-Gm-Gg: ASbGncu1+WToIaQIQXq16tOOOarmSYF/BKGqxKXFJiXKBn4ZwjSRvuCgXYkGk8M0WVF
	ozLCw1rgkovWod3ZwHxD/4z5kWl+/b3xrp16eN4lz4nmleHSTfg4zv/xpsHUP6eZ0mPdWkd4+Dn
	TfZMXBAVI20lra77YJapw2DUYnpXFktEaN1mVFCB0FuqDWiPNHiwdWLgnKobofyW2sRCmVU3OlC
	caFXb/EOylIJnCLVu0+Rex3YXBtk7lJqQVYVrThaTn2DFa0oR24ZS/pL1O4SfJxcEOwDcdGu7aJ
	LanCXckqDXagjmYvv91XR23Iu/kzCdPnnc6SooYZGGZOUe4tR2n5ywJygKGSc8VfYGRvVlT2Akr
	onPiTESbr5pQlsGeiklY6mTrY7+7tDS2RCTZ0P6q+O2Tg2MI=
X-Google-Smtp-Source: AGHT+IF9+29iKB73ORbHHB1ew+SSahrvkp+FPjLJ+OBWuC758/xJsl76Mj7hB9Jv7nWnKGPzfmfcYlivYonbv2pmcsw=
X-Received: by 2002:a05:690e:12c5:b0:63f:a2a7:8f1f with SMTP id
 956f58d0204a3-64302a48ffbmr20590514d50.27.1764360072974; Fri, 28 Nov 2025
 12:01:12 -0800 (PST)
MIME-Version: 1.0
References: <20251128115800.2757259-1-jan.claussen10@web.de>
In-Reply-To: <20251128115800.2757259-1-jan.claussen10@web.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Nov 2025 12:00:46 -0800
X-Gm-Features: AWmQ_bkkORVp5U4crHuOyDVde8g-MNoh_uDWuANL_F-HwFRkTzDpBE7w6DlpCGM
Message-ID: <CAMKF1soRo6=R=mCu=tah=SvEECFxrwONKxPA3OzXCi9MQXcYsA@mail.gmail.com>
Subject: Re: [oe] [meta-python][master][PATCH] python3-soundcard: Add recipe
To: jan.claussen10@web.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000067d3eb0644ad1782"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 20:01:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122127

--00000000000067d3eb0644ad1782
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

results in

ERROR: ParseError at
/mnt/b/yoe/master/sources/meta-openembedded/meta-python/recipes-devtools/py=
thon/
python3-soundcard_0.4.5.bb:13: Unparsed lines
/mnt/b/yoe/master/sources/meta-openembedded/meta-python/recipes-devtools/py=
thon/
python3-soundcard_0.4.5.bb: ['RDEPENDS:${PN} +=3D " ', '    libpulse ']
ERROR: Parsing halted due to errors, see error messages above


On Fri, Nov 28, 2025 at 3:58=E2=80=AFAM Jan Clau=C3=9Fen via lists.openembe=
dded.org
<jan.claussen10=3Dweb.de@lists.openembedded.org> wrote:

> Signed-off-by: Jan Clau=C3=9Fen <jan.claussen10@web.de>
> ---
>  .../python/python3-soundcard_0.4.5.bb                | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-soundcard_0.4.5.bb
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-soundcard_0.4.5.bb b/meta-python/recipes-devtools/python/
> python3-soundcard_0.4.5.bb
> new file mode 100644
> index 0000000000..632b54eaef
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.bb
> @@ -0,0 +1,12 @@
> +SUMMARY =3D "Python library for accessing soundcards"
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De39df1540c06c17ca310ce87c36b0=
42c"
> +
> +SRC_URI[sha256sum] =3D
> "07272ba927e32cafdf634e4a1ca53b9a3218321a60c7d2e08f54b832a56946aa"
> +
> +inherit pypi setuptools3
> +
> +REQUIRED_DISTRO_FEATURES =3D "pulseaudio"
> +
> +RDEPENDS:${PN} +=3D " \
> +    libpulse \
> +    pulseaudio-server \
> +    python3-cffi \
> +    python3-numpy \
> +"
>




> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122121):
> https://lists.openembedded.org/g/openembedded-devel/message/122121
> Mute This Topic: https://lists.openembedded.org/mt/116512050/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000067d3eb0644ad1782
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">results in<div><br></div><div>ERROR: ParseError at /mnt/b/=
yoe/master/sources/meta-openembedded/meta-python/recipes-devtools/python/<a=
 href=3D"http://python3-soundcard_0.4.5.bb:13">python3-soundcard_0.4.5.bb:1=
3</a>: Unparsed lines /mnt/b/yoe/master/sources/meta-openembedded/meta-pyth=
on/recipes-devtools/python/<a href=3D"http://python3-soundcard_0.4.5.bb">py=
thon3-soundcard_0.4.5.bb</a>: [&#39;RDEPENDS:${PN} +=3D &quot; &#39;, &#39;=
 =C2=A0 =C2=A0libpulse &#39;]<br>ERROR: Parsing halted due to errors, see e=
rror messages above<br></div></div><div dir=3D"ltr"><div dir=3D"ltr"><br></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Fri, Nov 28, 2025 at 3:58=E2=80=AFAM Jan Clau=C3=9Fen via <a href=3D"http:=
//lists.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;=
jan.claussen10=3D<a href=3D"mailto:web.de@lists.openembedded.org" target=3D=
"_blank">web.de@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Signed-off-by: Jan Clau=C3=9Fen &lt;<=
a href=3D"mailto:jan.claussen10@web.de" target=3D"_blank">jan.claussen10@we=
b.de</a>&gt;<br>
---<br>
=C2=A0.../python/<a href=3D"http://python3-soundcard_0.4.5.bb" rel=3D"noref=
errer" target=3D"_blank">python3-soundcard_0.4.5.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 ++++++++++++<br>
=C2=A01 file changed, 12 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-soundcard_0.4.5.bb" rel=3D"noreferrer" target=3D"_blank">python=
3-soundcard_0.4.5.bb</a><br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
soundcard_0.4.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-soundcard_=
0.4.5.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-soundcard_0.4.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-soundcar=
d_0.4.5.bb</a><br>
new file mode 100644<br>
index 0000000000..632b54eaef<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-soundca=
rd_0.4.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-soundcard_0.4.5.b=
b</a><br>
@@ -0,0 +1,12 @@<br>
+SUMMARY =3D &quot;Python library for accessing soundcards&quot;<br>
+LICENSE =3D &quot;BSD-3-Clause&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3De39df1540c06c17ca310ce87c3=
6b042c&quot;<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;07272ba927e32cafdf634e4a1ca53b9a3218321a60c7d=
2e08f54b832a56946aa&quot;<br>
+<br>
+inherit pypi setuptools3<br>
+<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;pulseaudio&quot;<br>
+<br>
+RDEPENDS:${PN} +=3D &quot; \<br>
+=C2=A0 =C2=A0 libpulse \<br>
+=C2=A0 =C2=A0 pulseaudio-server \<br>
+=C2=A0 =C2=A0 python3-cffi \<br>
+=C2=A0 =C2=A0 python3-numpy \<br>
+&quot;<br></blockquote><div><br></div><div><br></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
-- <br>
2.52.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122121): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122121" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122121</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116512050/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116512050/1997914</a><br>
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

--00000000000067d3eb0644ad1782--

