Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14596.1793092558196536145
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:15:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=q08dXT4W;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-48eee44b908so2340748fac.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:15:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793092557; cv=none;
        d=google.com; s=arc-20260327;
        b=opuWuhRMPuJby2HM5FpZXyw/5N9tvwG0cEMVIMtEiOPVAa7817Bl59boMuw3t1a7gO
         WEo/Az/CvzxRW5tuaawfYhKmpVeT80ttKPV2/YCh/Adf0faMgXJh0tRIy7SWZtYSPgrd
         AKUVz6srm8sriyV2uKyHYKBnKIFDgyIhIGpmEzRIM/4Xpnv33cZ6ItM6rXqmyLp83zk0
         6vy8pLqe4c3jrQaT3ub3UWaldXVM+PEoHDUHyuvHcUMlvzuTbiRkOj63dzPcB+laiDcd
         z9PaWExXEqZk/+dPzSmTMhRnJkU3nWjKxNuNrgS04fdyXaqLrh4W1pnqzoy9FnUsGH83
         WXow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9S+KbVGH9DF5Nhti97NGZ6flqK98bgQBirJoqm64Rs8=;
        fh=/ocEzzqrd6xq7lLe0Pdn4i+HA2K5/K+r/itKI3dg96U=;
        b=PbjIJnvGi7qp6eGjs7s9M+CcpVBHUns7vRagO9cG8woYxYsE+Oke7Fp0gQI2Nqj4iX
         Ye376lBrKZKsWLfSw7xAjwGfKYwW9eCsFGN8yme+5IkmI+IgqowIz2BzgglmUu3QQeWb
         LDxJKervv8B7KInePoaLUyC6NR6emxhu/+VpYGyWPi9HPkiubwddb8yqMVWzZGmCM9to
         zN0AkeGuLq06FQ4vMemEmQ/2v8GfZCy37Hn3Shf7mwlNYuvXjnooEk5pln2uiexL1U5n
         OrCtlECH0imdFdcsF9VRIX/e+aKLNBwzOuDtnOsgbUGJ/jx1Wl9GbYqzj92J3iy1McnC
         udtA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793092557; x=1793697357; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9S+KbVGH9DF5Nhti97NGZ6flqK98bgQBirJoqm64Rs8=;
        b=q08dXT4WqH49Wx6nC+P9vBf8l7d/iQ4PmagOwVeIjueAZHyhaQ43amOpwRadX09eYH
         xc86YQebhaBQGieskEQDUJLqHxFN0oK3ZMlGiA7MEZmXU9j0fykqHWgD5tbyJouviKsv
         vJSI/9haX1tgmCXF+fZeKsjV6U0r2w86bRm1NGlmh+KhIE+JcoMJTRSzwpoYZLWWVM5a
         e/ScgAsg5DDdG/H5KZdRKu4D+dou3RJID1KzN9J2yIDrcAd422g/HUykFRzd7iVLzMaE
         A8TTxRME+eo77jtmz+zArzE5/YTkla+nQ8qp3v3mi2iF1t2Qs5Jg0j3fc8Yf7dKZE5UE
         x+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092557; x=1793697357;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9S+KbVGH9DF5Nhti97NGZ6flqK98bgQBirJoqm64Rs8=;
        b=NA0Kc97WO52+FQvgc0lCT7wm6h0g8sOHvpTUxpa31jYA//aQqwnMufRcjobI0EHw5a
         uT6uenHtciT5VB/VL+LrhxKpxULpoLQhqw/lYsLwXLAxDczYCRJmhGnjm9O3rPi8VoKY
         LHVlp0xWwa736vTmBQ7540VczGb+yhfKrKBs9XIXbw2KU6Xgcx1sit58/fWnxvlhPJiy
         1CizKYuFGNOupsicuxLNq6FaiVrrkrgkio/KztvPcqoP10GL62UIVP7QkguqpKoLWi0D
         55UJkOKRrHGPlpG3zhkDULaH/T/hZkFQHUtUOn4/tZw3EfIf4I6E5fwec/xUZnOEO4aV
         PcUQ==
X-Gm-Message-State: AFq9FYJEbXxqOIhhaIJckYrcpWtL9LQcxiaM538FfFZKMjB4BAN96uvA
	BrDVmtFC9vFXR11omiBvITf1OryUAJJAXV7BQyIbjry68WSSUXAWK6XD/BiwW9v50isHvelD9c8
	6dSsVIsonMJewbeOy8GrkGPslTlWVNhAWpg==
X-Gm-Gg: AYBFou3QNg/Nw4NYyaxTXxgluAVAJDlY6GCqDMx945DmMssBD8m0/OVGUAAzPh/S6Gv
	ZbHcsG+jRIumH0oLzY2h8XvvdP71E2VAMclcPKIK4nyES8EKCS49ltFMOR+UVb5JnWu/NmKeLyB
	JOSTVzffTXcBK6i9Iztv+6u0MGDNcxSpEZhKjt075RFHSgnuig3Zo4Lxh3wCsOHGdxEjn4Lr+MX
	mKejsU+gAt8PeneYws/s9Bbr6C73lBqEtetEF8F2uJvqR0mlyWzgp+KrX9EY5IrmI3BUl59E1ei
	QWxiw3ZgS7RrULASGQyvRRKxccXWMOkkikoKStLqR7KOg8gf9SeUHbC4sxEQliVIXQXCYYCoq7X
	bnq0BEPiTX8b4p+iP6cN0bIWh7wsI+OmhaAAbXwGEy5aOxW4MtpLxSkAt49k=
X-Received: by 2002:a05:6871:807:b0:48f:e0e5:a1ea with SMTP id
 586e51a60fabf-4a83f53b740mr6066284fac.47.1793092557358; Tue, 27 Oct 2026
 02:15:57 -0700 (PDT)
MIME-Version: 1.0
References: <20261027081632.2560647-1-james@codeconstruct.com.au>
In-Reply-To: <20261027081632.2560647-1-james@codeconstruct.com.au>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 27 Oct 2026 22:15:45 +1300
X-Gm-Features: AclHuK-Zydp93Q9YhYsLkNRtWqJtB5kYHbPj3P7O77T8RQc8sK5jh6-5MuloZ-w
Message-ID: <CADySD0F3PJ3eVNkSW0nWBXP0Z5V95wVLAB3gneXo4zVsz+4V3A@mail.gmail.com>
Subject: Re: [oe] [blacksail][meta-networking][PATCH] mctp: upgrade 2.6 -> 2.6.1
To: james@codeconstruct.com.au
Cc: openembedded-devel@lists.openembedded.org, jk@codeconstruct.com.au
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131463

Hi James,

On Tue, Oct 27, 2026 at 9:16=E2=80=AFPM James Lee via lists.openembedded.or=
g
<james=3Dcodeconstruct.com.au@lists.openembedded.org> wrote:
>
> mctp 2.6.1 is a bugfix release that corrects mctpd's systemd service
> file. mctpd requires CAP_NET_RAW to send MCTP control messages when
> running as an unprivileged user. This capability is missing from
> version 2.6, breaking mctpd.
>
> Bump mctp and mctpd to version 2.6.1 to correct this.
>
> Changelog:
> https://github.com/CodeConstruct/mctp/blob/v2.6.1/CHANGELOG.md
>
> Signed-off-by: James Lee <james@codeconstruct.com.au>
> ---
>  meta-networking/recipes-support/mctp/mctp.inc                   | 2 +-
>  .../recipes-support/mctp/{mctp_2.6.bb =3D> mctp_2.6.1.bb}         | 0
>  .../recipes-support/mctp/{mctpd_2.6.bb =3D> mctpd_2.6.1.bb}       | 0
>  3 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta-networking/recipes-support/mctp/{mctp_2.6.bb =3D> mctp_2.6.1=
.bb} (100%)
>  rename meta-networking/recipes-support/mctp/{mctpd_2.6.bb =3D> mctpd_2.6=
.1.bb} (100%)
>
> diff --git a/meta-networking/recipes-support/mctp/mctp.inc b/meta-network=
ing/recipes-support/mctp/mctp.inc
> index c8fc98f63a..5c66d8c620 100644
> --- a/meta-networking/recipes-support/mctp/mctp.inc
> +++ b/meta-networking/recipes-support/mctp/mctp.inc
> @@ -3,7 +3,7 @@ SECTION =3D "net"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61d=
b21"
>
> -SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Dmain;protocol=
=3Dhttps;tag=3Dv${PV}"
> +SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Dstable/2.6.x;p=
rotocol=3Dhttps;tag=3Dv${PV}"
>  SRCREV =3D "31ac0e86b0e23d32abf34d191653a87a47f3c9a7"

Please send v2 with updated SRCREV

cheers
Ankur

>
>  inherit meson pkgconfig
> diff --git a/meta-networking/recipes-support/mctp/mctp_2.6.bb b/meta-netw=
orking/recipes-support/mctp/mctp_2.6.1.bb
> similarity index 100%
> rename from meta-networking/recipes-support/mctp/mctp_2.6.bb
> rename to meta-networking/recipes-support/mctp/mctp_2.6.1.bb
> diff --git a/meta-networking/recipes-support/mctp/mctpd_2.6.bb b/meta-net=
working/recipes-support/mctp/mctpd_2.6.1.bb
> similarity index 100%
> rename from meta-networking/recipes-support/mctp/mctpd_2.6.bb
> rename to meta-networking/recipes-support/mctp/mctpd_2.6.1.bb
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#131459): https://lists.openembedded.org/g/openembedde=
d-devel/message/131459
> Mute This Topic: https://lists.openembedded.org/mt/121956406/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
