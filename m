Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59AC8C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 04:55:07 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web10.813.1743569700348856294
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Apr 2025 21:55:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ATicsomQ;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-60208b7a6d6so1824670eaf.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 21:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743569699; x=1744174499; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKuekLav0Ci7TpKAXnxW4PXa2vVd3edSemSw1ttJQuQ=;
        b=ATicsomQDCecZxid4zLLyc2lW3wisyO/IkjgieqT7K7aI9dhDPqQ/QU0m3NlCL5Kug
         p9qkDMcr+ohDxTQDvu/IY2Ven49d4gYGwcQxoxkTnyuIBnxTvF0GKkRWAXBPwrw7km8O
         k8vO+Ha6s4b8iTha32q/Sa+qcrRITWRmmgWoizKnNcB5OXFlN/a6t3Qcv01hEgAeHNKL
         +fq7MAwejWYnoOI8EXRTzk9yF2iW+a6UxBpUyvzaudASEcWPxCaCKFjgdauSRk8qrRzv
         cvukelSrrnP5g+Od4tLDabxPyajmqMYlcYCHXUxTYLt1a1iBLQu0HgEHSzuIMntmmloX
         mE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743569699; x=1744174499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CKuekLav0Ci7TpKAXnxW4PXa2vVd3edSemSw1ttJQuQ=;
        b=otbysneAtb4gC0LsBiWBJhEXN1bhHowFjYLwuHSRjzuH7BKODMUXaBdx9kL10QmY0w
         McmaG6qnaGbD4I97axBqlVPydxseRyFaGn6DudM6csmk3G+fmHBC0uVgmprKLy1dD3Ag
         I7ididd+rwcZVJAZjxwkHAMBk03ZfiulQLGwFwb1ayfyYdoR9AaTlIrR7kXCaphig7q8
         yMxbteuccltHnbuS2KNrNtDSTYSEZCW1qLoB9OFhhBkvs9DKmBribZgCE/Nv5Qyu85zQ
         Xz0N83Ff08GcWq2xf6G5Ec63psZfPSpuSs71LUCzGAX0C/3WimK0iPHeFVugxhnyfR+Z
         Iq5g==
X-Gm-Message-State: AOJu0Yyubzh1aF28y1U/IsXATJ6Qq0soYZKTnxz4Beqz+TPO+clXoUQI
	Qd+jRrXGEvG1on5EpBxM7/w4y4ZmMxaO48iXy598xSodeBQJ0EnrplQpI7+bloQRfflahRNfgeo
	m/4nFrAY6Yys6SJXUqDeH+rNA5tM=
X-Gm-Gg: ASbGncuT1jEKDcl1Rzv3SeNCODA0Kl62Xn/VctJ0sLMPoLIY9614nPW5PdNzwJ+PazY
	Uca6fP/mUUYwid+LnN+fnGxfv+zQ5cNMI53qcxYPymy8HPIBKRE4KfxodLTj8MLR6cpz1j624XR
	bLQsUueZUHDg7QZTYwOo3QPYpG6udDbw6dMNWcfLUW
X-Google-Smtp-Source: AGHT+IGT5kgGpUbLEAth0bkl0B/voZXAIxAgG0q1CUP47BzZrNjFrUAatx7tfPmQ0zb7zBwc6ynZh07lUVoVjFLWPTY=
X-Received: by 2002:a05:6820:208a:b0:603:f1b5:ca02 with SMTP id
 006d021491bc7-604004373c7mr589850eaf.6.1743569699543; Tue, 01 Apr 2025
 21:54:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250401185718.2447415-1-jan.vermaete@gmail.com>
In-Reply-To: <20250401185718.2447415-1-jan.vermaete@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Apr 2025 21:54:33 -0700
X-Gm-Features: AQ5f1JrE24-EYzJi_2wemtGzPA5b3YjbeIFqkY6-kyo7W4WPiERRITUO69jBrpI
Message-ID: <CAMKF1srQL9v2vfqEpdk6BffkhPc5K=gVJf5oN1gwxCp6SGKYyg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/4] python3-mdurl: new recipe version 0.1.2
To: jan.vermaete@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 04:55:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116500

it seems to have pytests please add support for it and tie it into
meta-python/conf/include/ptest-packagelists-meta-python.inc

On Tue, Apr 1, 2025 at 11:57=E2=80=AFAM Jan Vermaete via
lists.openembedded.org <jan.vermaete=3Dgmail.com@lists.openembedded.org>
wrote:
>
> * no tests are distributed in the pypi package
>
> Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> ---
>  .../recipes-devtools/python/python3-mdurl_0.1.2.bb  | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-mdurl_0.1=
.2.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-mdurl_0.1.2.bb b=
/meta-python/recipes-devtools/python/python3-mdurl_0.1.2.bb
> new file mode 100644
> index 0000000000..cc110784e3
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-mdurl_0.1.2.bb
> @@ -0,0 +1,13 @@
> +SUMMARY =3D "Markdown URL utilities"
> +DESCRIPTION =3D "This is a Python port of the JavaScript mdurl package."
> +HOMEPAGE =3D "https://github.com/executablebooks/mdurl"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Daca1dc6b9088f1dda81c89cad2c77=
ad1"
> +
> +SRC_URI[sha256sum] =3D "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f9=
7bf925588687c1ba"
> +
> +inherit pypi python_flit_core
> +
> +PYPI_PACKAGE =3D "mdurl"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116484): https://lists.openembedded.org/g/openembedde=
d-devel/message/116484
> Mute This Topic: https://lists.openembedded.org/mt/112032802/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

