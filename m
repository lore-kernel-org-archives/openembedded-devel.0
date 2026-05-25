Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD86CD5BBF
	for <webhook@archiver.kernel.org>; Mon, 25 May 2026 05:12:27 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9930.1779685941308520031
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 May 2026 22:12:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XR9LXCI0;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-69d42abd04dso2419101eaf.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 24 May 2026 22:12:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779685940; cv=none;
        d=google.com; s=arc-20240605;
        b=k+QEhC6YmLwaGFPPElEO5Pke5CLONDpX6/wM87cHtUmSJdsde3x30Uaf9+bIrNKVdo
         88PcGcPdaP4E0gDHWKrBP/XmV+yclsPQdV4ll/LErkAIW43n1LJKPqjQUHsGqUdlzQU+
         uwpium8wyScxvz/gvUtHN/y+HBb9XfcEa65lpdXs9mu2BWFRWhqtTmZgntjKzbsoB2Jx
         X57RB8gWS/z2T/AwcZJnDJVQh4aB1xwr0Y+FyVESBVywOhygTJuETi7uwoqrcsAUji/m
         a93zYz28ALiw7UaZwnAX+PoQdVHy4HIlMFqXZPtYLrJmtI9Cle574mC3QJ3jo+cdzJ5L
         odLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aIOlv0F+FnK0exzst9UE30hIUjTtxGhH4fgvfAOF4bw=;
        fh=LZspYXC3IzyIN8FmVwz229n7pZIWt1HqVNc3WYXGu+o=;
        b=K5oBxYAD6jWQBRZe9XytBNib8ohcpG+vt6jtLZFbK5mlNjinWyQsjWeOv5RlJllSdB
         99iJcYv6JjB0uYIUNEcz0nfd9tmVq8TwIpHG9nkGT/y1BNaBqqvDC6qVZMq0rv2Cjnvs
         f9BDnu4+N8R11Bo6ySJYL5+Js2XkV0NwJhdxwsUqbj3EB+Rn8byanyvczF8CQpAVZIdR
         4lycNhSpSZfNhqrk8M5ptWBgQwMGdFSWePlTwn5n4G8SWowlXJ5H3i/uifrWO7S9M/mA
         NKE1FABRRqiMhyyQ0+YO9gnfhil/DiDEfGPjhUjoKUH5N+qq1T4tJHY4isW5JKx8kIUR
         8r+A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779685940; x=1780290740; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIOlv0F+FnK0exzst9UE30hIUjTtxGhH4fgvfAOF4bw=;
        b=XR9LXCI0s6p2xdUCLBJzo5ErjMe6qJaLVPsXBQ1xXRDT5QOYkb4g/KKcrJog2ja8NG
         oQGrQZAXeWtP0pOKUOMa+1yACmmUvOCQ2UTf9h1BtXpBIStuBr8zfO10cO8BsApIb3Qa
         2RWndJkBYVCrP3dAed3+l7ZbqRkFTgkcbIOVBgv1ca3ebRFJIIGqfJUM4k7FR/wPENbE
         F9DWlaRrxC13/p/H44Mi2/e8h8sqTUVslc32Yn7jb5Lcjbhr14X5egB5wS5ZWoc8sbRP
         pezUu57wynveu/I3dZVr1t0WFtoLpkJ/fhE2v7BBTgS8EJT9qUyLxYpg/f/oiWFhzKVC
         3KWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779685940; x=1780290740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aIOlv0F+FnK0exzst9UE30hIUjTtxGhH4fgvfAOF4bw=;
        b=lDkKZwMDAZIjD3BGPpzSIFj/q+T7hls48Ewm7bi2juIF8GHRjunHP+a0woaprEAUKp
         Z9iCF8q8AYTnIAxTgHY4NaNnSZ5IGGMj0//Z++3wDGod0Z0G7/D5ibWJ47qxKI1l6Jfy
         1zDsDdgf557mkpbk6rkReIoF0tvHwm+f8Y4GMHWax6b2ovAPrXcjxGf0QkumpfJ+frrZ
         66noaT9SfKezjxtRhVA94dULCNu0P8H5gERAHTjwV8GalP11hnlifKdSRL9MHDNzo8pk
         pc5Oc2OHoH3xbwgAS+KvOXcCZjh8smnvGlzxJVHHdUUNRD2m6Pd+/ZRnvG0PZDjbeN9R
         eJcw==
X-Gm-Message-State: AOJu0YzNm425oYVn/QN5tBHlZeIDQnMZl9LuLTcXNl+7ISB4CexoLp6Z
	0mDZpD99Na9hI7wwWPNuuehlsAiHj2LanbWjGaTMi6Y/94qxp4UP2J4/qUFaVdABpEnhHpOp+FT
	2hhtU8dGTs4S71dnScGa6eusnPXDcGt0=
X-Gm-Gg: Acq92OGMP+GG9o2Sy6eqNYhiWmZ8fhw7aGx6nokTsZPdjAyH4RxyKeFGwd0B9TUighQ
	z55b3tu0wca957y71bWRe6owDz/mmA9ID3Y3snPOp5YP6wBHyx96QthR4Ru2xqkqJ/0TJfjDb3A
	mB/1ZFsG4rcYMW5NVguYoOYBnzXgWWmRPQWb+Atam7INJd6vOMdYVHfr+3pGOPPIO8XHGjZev3x
	7nKMxtPPlYvfHoMThHft5tj4wxHX5iYsgA+TZvb+oPhLrqxLrPTcccnXlkA4hM9zAhJS/5z6nHJ
	blyEK4nzqw==
X-Received: by 2002:a05:6820:868b:b0:69b:5f97:de79 with SMTP id
 006d021491bc7-69d7eb91b64mr5388859eaf.19.1779685940417; Sun, 24 May 2026
 22:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260524125709.9164-1-f_l_k@t-online.de>
In-Reply-To: <20260524125709.9164-1-f_l_k@t-online.de>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Mon, 25 May 2026 17:12:09 +1200
X-Gm-Features: AVHnY4KC993eijnL0sIxGs71fdnlu4VvMsNWpZdWtCa9CRww6D3ItwyAb8P1SNI
Message-ID: <CADySD0GZTZpc7VpPmGd-k40X7iknMDu_kYQUcwnaP9HpMksUCw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/3] playerctl: add recipe
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 May 2026 05:12:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127195

Last release and commit was Sep 2021, is upstream still active?

On Mon, May 25, 2026 at 12:57=E2=80=AFAM Markus Volk via
lists.openembedded.org <f_l_k=3Dt-online.de@lists.openembedded.org>
wrote:
>
> Playerctl is a command-line utility and library for controlling media pla=
yers that
> implement the MPRIS D-Bus Interface Specification. Playerctl makes it eas=
y to bind
> player actions, such as play and pause, to media keys. You can also get m=
etadata
> about the playing track such as the artist and title for integration into=
 statusline
> generators or other command-line tools.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../playerctl/playerctl_2.4.1.bb                | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-oe/recipes-multimedia/playerctl/playerctl_2.4.1.=
bb
>
> diff --git a/meta-oe/recipes-multimedia/playerctl/playerctl_2.4.1.bb b/me=
ta-oe/recipes-multimedia/playerctl/playerctl_2.4.1.bb
> new file mode 100644
> index 0000000000..9d933e63b3
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/playerctl/playerctl_2.4.1.bb
> @@ -0,0 +1,17 @@
> +SUMMARY =3D "For true players only: vlc, mpv, RhythmBox, web browsers, c=
mus, mpd, spotify and others."
> +LICENSE =3D "LGPL-3.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De6a600fd5e1d9cbde2d983680233a=
d02"
> +
> +SRC_URI =3D "git://github.com/altdesktop/playerctl.git;protocol=3Dhttps;=
branch=3Dmaster"
> +
> +DEPENDS =3D "glib-2.0"
> +RDEPENDS:${PN} =3D "glib-2.0"
> +
> +inherit meson pkgconfig gobject-introspection
> +
> +EXTRA_OEMESON +=3D "--buildtype=3Drelease -Dbash-completions=3Dtrue -Dgt=
k-doc=3Dfalse"
> +
> +SRCREV =3D "e5304e9dc9a0c0c32b3689c3f141cf266d27f59c"
> +
> +FILES:${PN} +=3D "${datadir}"
> +
> --
> 2.54.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127186): https://lists.openembedded.org/g/openembedde=
d-devel/message/127186
> Mute This Topic: https://lists.openembedded.org/mt/119466180/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

