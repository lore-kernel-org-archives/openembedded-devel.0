Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A7DC43217
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 23:18:08 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.81318.1669504679113438032
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Nov 2022 15:17:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=auwxu/Vn;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id n20so17809469ejh.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Nov 2022 15:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9gIOdtNL06MD/BjICfhP++ZrWVqUM2TKtB+7RIQzSgA=;
        b=auwxu/VnYc/uiwmpINtRYxyHCiiHcwfKT+gO8N/kxhe3NKZlhEn4DmEofBT63VoEA7
         S7/0vhj2xX1df/O1phhIDpDMgQlLYOJZLgBhycxpJU8VIJLo1Ki23lvTJEf6jCwcqax6
         G4dOi1Aug6US1DIT9BZoJPtHb78kujG8VbhHnxgWD6TBjD+d69yPQWHzHEY0rKIEHT18
         5BrFuW6IWVSmlUmX5CNS149k9jKnX+ozmvxMvA2P6sTE24ZTDaorDUQkgq9phZmd5xqd
         HZRcz5IcEY0wJaSkWQF1vkgdMLMjMhQXBjKff1uoS1cF5TxbpRVpcLEhLSlB3tXWPRnf
         zb8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9gIOdtNL06MD/BjICfhP++ZrWVqUM2TKtB+7RIQzSgA=;
        b=tokclw9kdflHCFpvVBqUxz+cg7WE9FNJD3N/1u+05TczoIhS7XOQ15F6SGDP/Esxr9
         BQUL68xvBfIrdVLxr/BL0qm3x77RpPKYeZeFQCgOMfvMEPGfKhq1Gm9owZWQd+xVLDUh
         jkGwvRruo+ewNhZTYWWnidLo9Xz9U9XMFQhjR5EX7h/pegfrNdQAs9otp/5VsAuD+TXG
         f0B9Eqg18JhFFgTjKsGL2K+svLooh2oso65ytJjMXjCOBZb1GTYMkvVwgQAIv7+wKi4N
         zHbk3AnY03cFtoowwTx85HVuGWSBATPzf+4RVbgC4ea36NPZRiTxfPC5dAhAYjmSA4zW
         CbLA==
X-Gm-Message-State: ANoB5plvSm0ZlyWS1p30E18I14WQdjyLdrPvzCAYCGyzCEUuprE5kUV2
	tzjEBCwu9iSwwqG4lQSYKeew7auSwuiO1tpgjjU=
X-Google-Smtp-Source: AA0mqf6kxpALdtEICqLXym6peoGZbakXyMrBE2m1Vbmclabm+Ga0+XXUkbIsvjliwAZLBIJA13E4apOMj7OygTvRWNE=
X-Received: by 2002:a17:907:601d:b0:78d:4abe:c4b6 with SMTP id
 fs29-20020a170907601d00b0078d4abec4b6mr21817387ejc.485.1669504677106; Sat, 26
 Nov 2022 15:17:57 -0800 (PST)
MIME-Version: 1.0
References: <20221125114411.128952-1-tomasz.zyjewski@3mdeb.com> <20221125114411.128952-2-tomasz.zyjewski@3mdeb.com>
In-Reply-To: <20221125114411.128952-2-tomasz.zyjewski@3mdeb.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 26 Nov 2022 15:17:46 -0800
Message-ID: <CANx9H-CFJ0KnQtNtejmpishDMxVdWaucGt05GYB+oHaADChdjA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-uefi-firmware: add recipe
 for version 1.9
To: tomzy <tomasz.zyjewski@3mdeb.com>
Cc: maciej.pijanowski@3mdeb.com, openembedded-devel@lists.openembedded.org, 
	piotr.krol@3mdeb.com
Content-Type: multipart/alternative; boundary="0000000000003ad70305ee67d918"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Nov 2022 23:18:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99766

--0000000000003ad70305ee67d918
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 25, 2022 at 3:44 AM tomzy <tomasz.zyjewski@3mdeb.com> wrote:

> Install uefi-firmware-parser tool
>
> Signed-off-by: Tomasz =C5=BByjewski <tomasz.zyjewski@3mdeb.com>
> ---
>  .../python/python3-uefi-firmware_1.9.bb         | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-uefi-firmware_1.9.bb
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-uefi-firmware_1.9.bb b/meta-python/recipes-devtools/python/
> python3-uefi-firmware_1.9.bb
> new file mode 100644
> index 000000000000..ba3124b36e60
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.9.bb
> @@ -0,0 +1,17 @@
> +SUMMARY =3D "Various data structures and parsing tools for UEFI firmware=
."
> +DESCRIPTION =3D "This package contains Python UEFI firmware parser tool.
> The \
> +UEFI firmware parser is a simple module and set of scripts for parsing, =
\
> +extracting, and recreating UEFI firmware volumes. This includes parsing =
\
> +modules for BIOS, OptionROM, Intel ME and other formats too."
> +HOMEPAGE =3D "https://github.com/theopolis/uefi-firmware-parser"
> +AUTHOR =3D "Teddy Reed <teddy@prosauce.org>"
> +LICENSE =3D "BSD-2-Clause & BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://setup.py;md5=3D90fa5bae1547550f1c1993f651ed=
a955"
> +
> +SRC_URI =3D "
> https://files.pythonhosted.org/packages/7e/b4/a4ec646d24a1aad709fdb83de6e=
5eddd6cb24faec02f3a94a3af3b0aba28/uefi_firmware-${PV}.tar.gz
> "
>

If you=E2=80=99re fetching from  pythonhosted, you could very likely simpli=
fy the
recipe by inheriting pypi bbclass

+SRC_URI[md5sum] =3D "ee5011b4d0bcb0eb7c06295e0107894f"


These days, we only really use the sha256sum

>
> +SRC_URI[sha256sum] =3D
> "234119dd92780c67cce3b664e86119c41d0b2af188d7f372b69789b32c5d5cd0"
> +
> +S =3D "${WORKDIR}/uefi_firmware-${PV}"
> +
> +inherit setuptools3
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99729):
> https://lists.openembedded.org/g/openembedded-devel/message/99729
> Mute This Topic: https://lists.openembedded.org/mt/95252447/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000003ad70305ee67d918
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Nov 25, 2022 at 3:44 AM tomzy &lt;<a href=3D"mailto=
:tomasz.zyjewski@3mdeb.com">tomasz.zyjewski@3mdeb.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">Install uefi-firmware-parser tool<br>
<br>
Signed-off-by: Tomasz =C5=BByjewski &lt;<a href=3D"mailto:tomasz.zyjewski@3=
mdeb.com" target=3D"_blank">tomasz.zyjewski@3mdeb.com</a>&gt;<br>
---<br>
=C2=A0.../python/<a href=3D"http://python3-uefi-firmware_1.9.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-uefi-firmware_1.9.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 17 +++++++++++++++++<br>
=C2=A01 file changed, 17 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-uefi-firmware_1.9.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-uefi-firmware_1.9.bb</a><br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
uefi-firmware_1.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-uefi-fir=
mware_1.9.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://py=
thon3-uefi-firmware_1.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-ue=
fi-firmware_1.9.bb</a><br>
new file mode 100644<br>
index 000000000000..ba3124b36e60<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-uefi-fi=
rmware_1.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-uefi-firmware_1=
.9.bb</a><br>
@@ -0,0 +1,17 @@<br>
+SUMMARY =3D &quot;Various data structures and parsing tools for UEFI firmw=
are.&quot;<br>
+DESCRIPTION =3D &quot;This package contains Python UEFI firmware parser to=
ol. The \<br>
+UEFI firmware parser is a simple module and set of scripts for parsing, \<=
br>
+extracting, and recreating UEFI firmware volumes. This includes parsing \<=
br>
+modules for BIOS, OptionROM, Intel ME and other formats too.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/theopolis/uefi-firmware-p=
arser" rel=3D"noreferrer" target=3D"_blank">https://github.com/theopolis/ue=
fi-firmware-parser</a>&quot;<br>
+AUTHOR =3D &quot;Teddy Reed &lt;<a href=3D"mailto:teddy@prosauce.org" targ=
et=3D"_blank">teddy@prosauce.org</a>&gt;&quot;<br>
+LICENSE =3D &quot;BSD-2-Clause &amp; BSD-3-Clause&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://setup.py;md5=3D90fa5bae1547550f1c1993f65=
1eda955&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"https://files.pythonhosted.org/packages/7e/b4=
/a4ec646d24a1aad709fdb83de6e5eddd6cb24faec02f3a94a3af3b0aba28/uefi_firmware=
-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://files.pytho=
nhosted.org/packages/7e/b4/a4ec646d24a1aad709fdb83de6e5eddd6cb24faec02f3a94=
a3af3b0aba28/uefi_firmware-${PV}.tar.gz</a>&quot;<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">If you=E2=80=99r=
e fetching from =C2=A0pythonhosted, you could very likely simplify the reci=
pe by inheriting pypi bbclass</div><div dir=3D"auto"><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex" dir=3D"auto">+SRC_URI[md5sum] =3D &quot;ee5011b4d0bcb0eb=
7c06295e0107894f&quot;</blockquote><div dir=3D"auto"><br></div><div dir=3D"=
auto">These days, we only really use the sha256sum</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex" dir=3D"auto"><br>
+SRC_URI[sha256sum] =3D &quot;234119dd92780c67cce3b664e86119c41d0b2af188d7f=
372b69789b32c5d5cd0&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/uefi_firmware-${PV}&quot;<br>
+<br>
+inherit setuptools3<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#99729): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/99729" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/99729</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95252447/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
95252447/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000003ad70305ee67d918--

