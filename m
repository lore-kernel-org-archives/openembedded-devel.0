Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95872C001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 14:29:29 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web11.162033.1692196164434309944
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Aug 2023 07:29:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=NLx3c5fW;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-56c711a88e8so4812000eaf.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 07:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692196164; x=1692800964;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xKRxOHGSwB0BlBYwPgOc93cfWqUImOr9qB/dSS2wfk0=;
        b=NLx3c5fWqQkwQxPJHeLbwmOVkTN8W94cc/qL/xvN9gQJxPZRIA1a3llXlbw1kiui9m
         ifzHm76c0mgPK+GsjFZhVLrAUZegP81czmHxZQum+e1wl0iMRspu3qzgm7x8ULQllh22
         wXJIZHlYf1KeKpVncIFk9EzctUfeuWVxMEzeO78IDV+KaSdh2AAe2kOOpaa4HoQOIHf8
         XFzqcm/ultc4aJ6AfR5a9/QPsWwZqE94HJiCG/+p+z66Si+As8rbEYw2IDbHVR+96nFD
         25Aep5G0NhOsy5dsYRKGeyyj8YqEDNnOr535NWduWjLRKa8+YMWLoTO4nJuTm/M/8RMS
         I8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692196164; x=1692800964;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xKRxOHGSwB0BlBYwPgOc93cfWqUImOr9qB/dSS2wfk0=;
        b=RPUFf7ILYaWvHs+s9p1g88099tBIFmEvFNAktjMEgQ/L+OlXx9lLhnRSRtgNrT3/8f
         MDkWCX8grA5ln9uG6iMogamKlUDn+CHDy6O/2u8T4bUr+BFtm4fe2wIJcavIDQqay1dN
         lcLfh3mE7O1ss7rvu5xFYnhyr10ZP9PVoruCbgbbDg6vweR7Orv58vn1c59w1tco9Q9T
         7VTjNgcYbAtysLo+hq8C4OItmp9e/AcuU1XR+oWECjB4ct4efY3CE4hTx6ZThzBEdpnQ
         h8j8rAJgrKQTIVsrKBfQynhw0MXAeyE7AslheR9R/quCooLejLujvElFtn1SDB2Qj4Pd
         CvgA==
X-Gm-Message-State: AOJu0YxFV62N1QY6B+zUd7T5PdPvhIjASEqR57pzORoBJq3IJnWU27eH
	+ca2jtU6+TFDbswtAPAWMNev23nU8Vro79pFyCFOXMd7
X-Google-Smtp-Source: AGHT+IGp4C0glqEzRtJ/vWKlSmJFEmPOO3bo9YvIdT9JTh6tqBvW1vZq0s5eO1u2nUVLJbEB8j7lBs3uJjGiiKT6Pc4=
X-Received: by 2002:a4a:9b8c:0:b0:566:ed69:422d with SMTP id
 x12-20020a4a9b8c000000b00566ed69422dmr2093058ooj.7.1692196163584; Wed, 16 Aug
 2023 07:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <bfcfacfd-2484-55db-2c33-2c2e5fbd9b1e@3mdeb.com>
In-Reply-To: <bfcfacfd-2484-55db-2c33-2c2e5fbd9b1e@3mdeb.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Aug 2023 07:29:12 -0700
Message-ID: <CAMKF1spiH6fXqoN=J5vvTNMdyYsbbwXkn7Np+OAYBiuPy_9zHA@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] recipes-devtools/python3-gspread:
 interface for google spreadsheet
To: Danik <daniil.klimuk@3mdeb.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003888ca06030b1f30"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 14:29:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104429

--0000000000003888ca06030b1f30
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 16, 2023 at 1:43 AM Danik <daniil.klimuk@3mdeb.com> wrote:

> Author: Daniil Klimuk <daniil.klimuk@3mdeb.com>
> Date:   Mon Aug 14 15:46:40 2023 +0200
>
>      recipes-devtools/python3-gspread: interface for google spreadsheet
>
>      Simple interface for working with Google Sheets.
>
>      Signed-off-by: Daniil Klimuk <daniil.klimuk@3mdeb.com>
>
> diff --git
> a/meta-python/recipes-devtools/python3-gspread/python3-gspread_5.10.0.bb
> b/meta-python/recipes-devtools/python3-gspread/python3-gspread_5.10.0.bb
> new file mode 100644
> index 000000000000..e13e452353cd
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python3-gspread/
> python3-gspread_5.10.0.bb
> @@ -0,0 +1,15 @@
> +SUMMARY = "Google Spreadsheets Python API"
> +HOMEPAGE = "https://github.com/burnash/gspread"
> +AUTHOR = "Anton Burnashev <fuss.here@gmail.com>"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=9488e21983675fa56dc05af558b83e2f"
> +
> +SRC_URI =
> "
> https://files.pythonhosted.org/packages/b4/4f/033ebf34778745061b67b104ef212ed5b05fa65a530f345f88c4355fdcc3/gspread-5.10.0.tar.gz
> "
> +SRC_URI[md5sum] = "f21198e80a50d0e6d557d9fea6a79e8e"
> +SRC_URI[sha256sum] =
> "2b6bba6dc111580170346a9bcd1893e0e8c52f67a9e537caec7b7a1e27c14435"
> +
> +S = "${WORKDIR}/gspread-5.10.0"


Use PV instead of hardcoding 5.10.0 here


> +
> +RDEPENDS:${PN} = "python3-requests"
> +
> +inherit python_poetry_core
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104419):
> https://lists.openembedded.org/g/openembedded-devel/message/104419
> Mute This Topic: https://lists.openembedded.org/mt/100775688/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000003888ca06030b1f30
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Aug 16, 2023 at 1:43 AM Danik &lt;<a href=3D"mailto=
:daniil.klimuk@3mdeb.com">daniil.klimuk@3mdeb.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">Author: Daniil Klimuk &lt;<a href=3D"mailto:d=
aniil.klimuk@3mdeb.com" target=3D"_blank">daniil.klimuk@3mdeb.com</a>&gt;<b=
r>
Date:=C2=A0=C2=A0 Mon Aug 14 15:46:40 2023 +0200<br>
<br>
=C2=A0=C2=A0=C2=A0=C2=A0 recipes-devtools/python3-gspread: interface for go=
ogle spreadsheet<br>
<br>
=C2=A0=C2=A0=C2=A0=C2=A0 Simple interface for working with Google Sheets.<b=
r>
<br>
=C2=A0=C2=A0=C2=A0=C2=A0 Signed-off-by: Daniil Klimuk &lt;<a href=3D"mailto=
:daniil.klimuk@3mdeb.com" target=3D"_blank">daniil.klimuk@3mdeb.com</a>&gt;=
<br>
<br>
diff --git <br>
a/meta-python/recipes-devtools/python3-gspread/<a href=3D"http://python3-gs=
pread_5.10.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-gspread_5.10.=
0.bb</a> <br>
b/meta-python/recipes-devtools/python3-gspread/<a href=3D"http://python3-gs=
pread_5.10.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-gspread_5.10.=
0.bb</a><br>
new file mode 100644<br>
index 000000000000..e13e452353cd<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python3-gspread/<a href=3D"http://python=
3-gspread_5.10.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-gspread_5=
.10.0.bb</a><br>
@@ -0,0 +1,15 @@<br>
+SUMMARY =3D &quot;Google Spreadsheets Python API&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/burnash/gspread" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/burnash/gspread</a>&quot;<b=
r>
+AUTHOR =3D &quot;Anton Burnashev &lt;<a href=3D"mailto:fuss.here@gmail.com=
" target=3D"_blank">fuss.here@gmail.com</a>&gt;&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D <br>
&quot;file://LICENSE.txt;md5=3D9488e21983675fa56dc05af558b83e2f&quot;<br>
+<br>
+SRC_URI =3D <br>
&quot;<a href=3D"https://files.pythonhosted.org/packages/b4/4f/033ebf347787=
45061b67b104ef212ed5b05fa65a530f345f88c4355fdcc3/gspread-5.10.0.tar.gz" rel=
=3D"noreferrer" target=3D"_blank">https://files.pythonhosted.org/packages/b=
4/4f/033ebf34778745061b67b104ef212ed5b05fa65a530f345f88c4355fdcc3/gspread-5=
.10.0.tar.gz</a>&quot;<br>
+SRC_URI[md5sum] =3D &quot;f21198e80a50d0e6d557d9fea6a79e8e&quot;<br>
+SRC_URI[sha256sum] =3D <br>
&quot;2b6bba6dc111580170346a9bcd1893e0e8c52f67a9e537caec7b7a1e27c14435&quot=
;<br>
+<br>
+S =3D &quot;${WORKDIR}/gspread-5.10.0&quot;</blockquote><div dir=3D"auto">=
<br></div><div dir=3D"auto">Use PV instead of hardcoding 5.10.0 here=C2=A0<=
/div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto=
"><br>
+<br>
+RDEPENDS:${PN} =3D &quot;python3-requests&quot;<br>
+<br>
+inherit python_poetry_core<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#104419): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/104419" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/104419</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100775688/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100775688/1997914</a><br>
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

--0000000000003888ca06030b1f30--

