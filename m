Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web09.10276.1612364020273017521
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Feb 2021 06:53:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vYLxn8m5;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id y4so4668138ybk.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Feb 2021 06:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HevtibusZ2YQdcDb1H39ZabIkjk8HgRcWblr/1HYO6c=;
        b=vYLxn8m5KmHfJ6XopqrpXYQB02n29p989hAUaF5sXbgk/SXt97uPT8QzcQ9lij8b4X
         x892dwrmZ5KnZzzfCkLBn++jF4NyMUg6sYTr9FJn69uCs4NcZa+I/DXnmVceLZ5YROWh
         TjErDc/9K/tKejJ8CeRCsHFp7xWsUI2rAcvyGcPtXxUHwI4cH9hJDcZCaBOSavEGv43T
         1pWuqOcG/DFLJts6U2F/PdkBI655MYkrJE3uO70oC0iRONKyV3eJkwRtNoxtcH4+yhER
         z9PO9CptdnexzsILmInxik5a69+o3txMV1Zzf8tkyZUdttb0Y5Dss3/EwJdF1or43YKa
         RTXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HevtibusZ2YQdcDb1H39ZabIkjk8HgRcWblr/1HYO6c=;
        b=A2GqLv59OBDc9gOElqlYAMZjg/BOwm+iP4rAXm3etmBSLoPnHGh9Uq7KSuqFkzVBEG
         GgC1h0s4fyztx7OczbaUakF8r8ENgINOnM0gfFgvD60NxErlD7y/0mkJ7rWJn5IbgZMJ
         STK9N5q0BiLYV9gAT3DNk0OTOxvtbq4pNCxYy6QOZb6ue7TrGwp7H00CUfF8kRCFawNv
         ZoSp3+MkjY2o8WEX6hEs/TcXBaK1MrO6Al6wtbsQPTS+Ydj0DmkXxVCl1ByO6n/64Vzz
         lENsmJkI/YQ2gWsInBCXERFlUs/paQ58cXBkq2wxOyrSLnD/rmhnmLUPuAx+atVpkTPb
         HbHg==
X-Gm-Message-State: AOAM530cPzUJ6QWfpm+09869SfbCbbeKcFzSG77sR5WvjtSqMpiC+g+R
	7wjf1ic1EES6aFn45F59KBqU8YJBd19DtqbWqAU=
X-Google-Smtp-Source: ABdhPJxSY5JpueF2iaGI8o54Tzz6zsxGHfsHXUmeJuArjIW/f47l/c4s6/XkmWVtur4LzDYh6HI/d4nbzOlz35rgoV0=
X-Received: by 2002:a25:3d81:: with SMTP id k123mr4672067yba.430.1612364019442;
 Wed, 03 Feb 2021 06:53:39 -0800 (PST)
MIME-Version: 1.0
References: <1612343174-28564-1-git-send-email-Harpritkaur.Bhandari@kpit.com>
In-Reply-To: <1612343174-28564-1-git-send-email-Harpritkaur.Bhandari@kpit.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Wed, 3 Feb 2021 04:53:27 -1000
Message-ID: <CAGDS+nmNuJSQfcbz8AXrZOuJpp92pi_4U8MxtjaxHRFAkemHmg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][dunfell][PATCH] python-urllib3/python3-urllib3: fix CVE-2020-7212
To: Harpritkaur Bhandari <harpritkaur.bhandari@kpit.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Khem Raj <raj.khem@gmail.com>, nisha.parrakat@kpit.com, 
	Aditya Tayade <aditya.tayade@kpit.com>, Haiqing Bai <Haiqing.Bai@windriver.com>, 
	Armin Kuster <akuster808@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 2, 2021 at 11:06 PM Harpritkaur Bhandari
<harpritkaur.bhandari@kpit.com> wrote:
>
> From: Haiqing Bai <Haiqing.Bai@windriver.com>
>
> Optimize _encode_invalid_chars for a denial of service (CPU consumption)
>
> Change-Id: I67a1b0acfe905cb9c0c0bd3f5e3917d49e670673
> Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> Signed-off-by: Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
> ---
>  .../python/python3-urllib3/CVE-2020-7212.patch     | 54 +++++++++++++++=
+++++++
>  .../python/python3-urllib3_1.25.7.bb               |  2 +
>  2 files changed, 56 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-urllib3/=
CVE-2020-7212.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-urllib3/CVE-202=
0-7212.patch b/meta-python/recipes-devtools/python/python3-urllib3/CVE-2020=
-7212.patch
> new file mode 100644
> index 0000000..a2bb0fb
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-urllib3/CVE-2020-7212.=
patch
> @@ -0,0 +1,54 @@
> +From aff951b7a41eb5b958b32c49eaa00da02adc9c2d Mon Sep 17 00:00:00 2001
> +From: Quentin Pradet <quentin.pradet@gmail.com>
> +Date: Tue, 21 Jan 2020 22:32:56 +0400
> +Subject: [PATCH] Optimize _encode_invalid_chars (#1787)
> +
> +Co-authored-by: Seth Michael Larson <sethmichaellarson@gmail.com>
> +
> +Upstream-Status: Backport
> +[from git://github.com/urllib3/urllib3.git commit:a2697e7c6b]
> +Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>

Patch is missing the CVE tag, see:

https://wiki.yoctoproject.org/wiki/Security

(in the "Patch name convention and commit message" section)

Thanks!

Steve

> +---
> + src/urllib3/util/url.py | 15 ++++++---------
> + 1 file changed, 6 insertions(+), 9 deletions(-)
> +
> +diff --git a/src/urllib3/util/url.py b/src/urllib3/util/url.py
> +index 9675f74..e353937 100644
> +--- a/src/urllib3/util/url.py
> ++++ b/src/urllib3/util/url.py
> +@@ -216,18 +216,15 @@ def _encode_invalid_chars(component, allowed_char=
s, encoding=3D"utf-8"):
> +
> +     component =3D six.ensure_text(component)
> +
> ++    # Normalize existing percent-encoded bytes.
> +     # Try to see if the component we're encoding is already percent-en=
coded
> +     # so we can skip all '%' characters but still encode all others.
> +-    percent_encodings =3D PERCENT_RE.findall(component)
> +-
> +-    # Normalize existing percent-encoded bytes.
> +-    for enc in percent_encodings:
> +-        if not enc.isupper():
> +-            component =3D component.replace(enc, enc.upper())
> ++    component, percent_encodings =3D PERCENT_RE.subn(
> ++        lambda match: match.group(0).upper(), component
> ++    )
> +
> +     uri_bytes =3D component.encode("utf-8", "surrogatepass")
> +-    is_percent_encoded =3D len(percent_encodings) =3D=3D uri_bytes.cou=
nt(b"%")
> +-
> ++    is_percent_encoded =3D percent_encodings =3D=3D uri_bytes.count(b"=
%")
> +     encoded_component =3D bytearray()
> +
> +     for i in range(0, len(uri_bytes)):
> +@@ -237,7 +234,7 @@ def _encode_invalid_chars(component, allowed_chars,=
 encoding=3D"utf-8"):
> +         if (is_percent_encoded and byte =3D=3D b"%") or (
> +             byte_ord < 128 and byte.decode() in allowed_chars
> +         ):
> +-            encoded_component.extend(byte)
> ++            encoded_component +=3D byte
> +             continue
> +         encoded_component.extend(b"%" + (hex(byte_ord)[2:].encode().zf=
ill(2).upper()))
> +
> +--
> +2.23.0
> +
> diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.25.7.=
bb b/meta-python/recipes-devtools/python/python3-urllib3_1.25.7.bb
> index 34c15b6..8d987a1 100644
> --- a/meta-python/recipes-devtools/python/python3-urllib3_1.25.7.bb
> +++ b/meta-python/recipes-devtools/python/python3-urllib3_1.25.7.bb
> @@ -8,6 +8,8 @@ SRC_URI[sha256sum] =3D "f3c5fd51747d450d4dcf6f923c81f78f=
811aab8205fda64b0aba34a4e4
>
>  inherit pypi setuptools3
>
> +SRC_URI +=3D "file://CVE-2020-7212.patch"
> +
>  RDEPENDS_${PN} +=3D "\
>      ${PYTHON_PN}-certifi \
>      ${PYTHON_PN}-cryptography \
> --
> 2.7.4
>
> This message contains information that may be privileged or confidential=
 and is the property of the KPIT Technologies Ltd. It is intended only for =
the person to whom it is addressed. If you are not the intended recipient, =
you are not authorized to read, print, retain copy, disseminate, distribute=
, or use this message or any part thereof. If you receive this message in e=
rror, please notify the sender immediately and delete all copies of this me=
ssage. KPIT Technologies Ltd. does not accept any liability for virus infec=
ted mails.
>
>=20
>
