Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 069D6C4321E
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 16:50:53 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.80799.1669999845141923126
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Dec 2022 08:50:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G6HZq9HG;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id p24-20020a0568301d5800b0066e6dc09be5so3256332oth.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Dec 2022 08:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/V3Q029AR0PEKBekAPEZJzUPyXqPgjGHEfZmpM8zQPw=;
        b=G6HZq9HGteiW5z19jYlBPmh2Y6F1d+smYGjFP/GkuQdJby9hVXEFebL4hzbdCYPi/T
         TpZpV3kQXewwqwJG9X/yJqrX7+M4tLI36PC1oUyt7+NumtEVFIAbEpVT9wfHMsSLK4Uw
         crrudZHSPr6W276P8+5tSK6YBhraO8DaXevit1IQ82aCR051unyiwM62bSvtliqqER28
         0eIuQH9QPyf31FG0svVLLDAH0NFA5bNXlvG1pjyv2l67ItGP9gt2f2zAjFYkhYjkulwX
         BoDQ+In9kboPflZIQn+wAGhgl+NYHkTLZUn+sVudfRKM8EpqErb+B+Y9qR7EOXB8XOST
         E8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/V3Q029AR0PEKBekAPEZJzUPyXqPgjGHEfZmpM8zQPw=;
        b=5qu1ItjsW6Uvr+pY6jTvBijmqP5sFmCURjuheRGwqn+H++67OUAlTmuRtHMHQ01NnA
         8alpEJIcJPAXKX9kwSV7YbWgt29hs69hqSW+sEK0Sp+PcRYexHqBY6hZvZlJjS9ZVGtb
         3/2PvkIJX0rFonzYQKPA55q59Q+nN4qgPVPXFzHmgx/bbyGmVvrpFbIghKtMaK6l4gwf
         9dLAN1jgLa4zbnZ6sZCHdJxmWQspacRHiUGIw8VmqVaPFpGE6oIOZ/MjXv5lNFJnepmz
         VhlugChlXC4iY+SaZvT2pVF+vnF997z7nVa8w/2WuRHn9kzYSGc08cXb9tqU/Htmpsyp
         Q1BQ==
X-Gm-Message-State: ANoB5pkiftaqWHoeLMpn5dP0HGB5CEVAAbYe6JyLAwHoZdiE0ztQtWMD
	g0FFNZwZVi/A0AnwnAJx1kGkqO4OWF46DjDvFQjfm5FV
X-Google-Smtp-Source: AA0mqf7jLyUyMD0ps0Ephc969yidDyNziJG5oKdBRVESit/W3j+8HOlcIOavxORCIbKlaa/Ye3efRd3/ZIszaUrHoF0=
X-Received: by 2002:a9d:6a44:0:b0:66c:fb5b:1d67 with SMTP id
 h4-20020a9d6a44000000b0066cfb5b1d67mr36749031otn.111.1669999844302; Fri, 02
 Dec 2022 08:50:44 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1srPUdH=DigZ_4c-jFYjAcfzJEw2jTMMdQVfKkYvSSgxwA@mail.gmail.com>
 <4965.1669963738713807357@lists.openembedded.org>
In-Reply-To: <4965.1669963738713807357@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 2 Dec 2022 08:50:18 -0800
Message-ID: <CAMKF1spLpKLY9=4sTeesFJtarUm2hzQ34-VpQT=dXQwK6_VkKA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH V3 1/2] python3-binwalk: add recipe for
 version 2.3.3
To: tomzy <tomasz.zyjewski@3mdeb.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Dec 2022 16:50:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99916

On Thu, Dec 1, 2022 at 10:49 PM tomzy <tomasz.zyjewski@3mdeb.com> wrote:
>
> On Thu, Dec 1, 2022 at 07:43 PM, Khem Raj wrote:
>
> Can you rebase these patches on top of master or master-next and
> resend v3 please ?
>
> I can but isn't it already merged in master?
>
> https://git.openembedded.org/meta-openembedded/commit/?id=3D7ea0e04aaee19=
f61e18bf998bb07f02e52d8146e
>

It is, thats why I am asking for an incremental patch on top of what is mer=
ged.

> On Thu, Dec 1, 2022 at 12:35 AM tomzy <tomasz.zyjewski@3mdeb.com> wrote:
>
> Install binwalk utility.
>
> Binwalk is a fast, easy to use tool for analyzing, reverse engineering,
> and extracting firmware images.
>
> Signed-off-by: Tomasz =C5=BByjewski <tomasz.zyjewski@3mdeb.com>
> ---
> .../python/python3-binwalk_2.3.3.bb | 17 +++++++++++++++++
> 1 file changed, 17 insertions(+)
> create mode 100644 meta-python/recipes-devtools/python/python3-binwalk_2.=
3.3.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb=
 b/meta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb
> new file mode 100644
> index 000000000000..362efa275148
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb
> @@ -0,0 +1,17 @@
> +SUMMARY =3D "Firmware analysis tool"
> +DESCRIPTION =3D "This package contains Python Binwalk tool. Binwalk is a=
 fast, \
> +easy to use tool for analyzing, reverse engineering, and extracting firm=
ware \
> +images."
> +HOMEPAGE =3D "https://github.com/ReFirmLabs/binwalk"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D65bbee055d3ea3bfc475f07aecf4d=
e64"
> +
> +SRC_URI =3D "git://github.com/ReFirmLabs/binwalk;protocol=3Dhttps;branch=
=3Dmaster"
> +
> +SRCREV =3D "fa0c0bd59b8588814756942fe4cb5452e76c1dcd"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit setuptools3
> +
> +RDEPENDS:${PN} +=3D "python3-core"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99908): https://lists.openembedded.org/g/openembedded=
-devel/message/99908
> Mute This Topic: https://lists.openembedded.org/mt/95377962/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

