Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2708.1792805516858912962
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Oct 2026 18:31:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fPbtFjb4;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-475920b9ca2so565055fac.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 18:31:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792805516; cv=none;
        d=google.com; s=arc-20260327;
        b=R/oxoJoX/Sq7pT1tsumrvaJvlFVHkc9ISi7BE04WfI6uqv0/V5e4xT8DINI2UHPCXW
         GK/6z487fqo9fQVDrOoPyWJBj/cg0DGh06BPaY0r31splKQPaA5p99jFnxy4n3A64iRL
         /Z/Y8Dwa3IaUuKSQY55PaSDyGKDm/B+XyxP4A0ctHqKT8Giy4cD8wKDPDYKcqOxRwZid
         KKEnt6R0GaEAY/gUfZbdc1C7hBYiVOKlVI0UTY3JWR8dy2vebXCry2JUEk73UsyUvRzU
         lkGZ66vbuAlR3y/BoqzFuK+H7sCZEQUh4axHBAvRRD8nZ2oIV9f/IGzp935Qy4kPQgyo
         TFGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oB2JIHiI/B9H5L8YjFgTXclj+u9AZ0WPWcgVpgD66z4=;
        fh=VjYCm+IqwHOX69qHVtE68rkEZlFzULHuBjh3WJDkkSw=;
        b=Zi9VjgyrnzB/UoeXTE1aVzRYoLtvrDQblsy3P/cN8x2FxV5qgqhDiWCKtwNgS4uxRv
         pjAt8BENbXwI6cFH+70L/ykxyy/pWBfni/VWOPNle3EbTvRAYUz4N1ONPHeBbFNgo3Dg
         BtpD/v5FMs0Wk5W/2js6IeI62/QDl334QbNYRhW9W7T0uq672gbVYMbRRIVPtiBFKDQn
         7qMA56PE0MszOzsJbfc8Y0eBSmORBkrfniCEpAqst/shsUmdawRp0nythHewE55MaHkR
         Z87uzb4IzRUxpQTJS04mSw8a9yy0+bXehFDDB/SgeRiqX33O6ic+X1k2AVlln7c8dJWD
         R21w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792805516; x=1793410316; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oB2JIHiI/B9H5L8YjFgTXclj+u9AZ0WPWcgVpgD66z4=;
        b=fPbtFjb4RgcY6DiKfEKxXJBkspw/FyALJJyVLhqrfGhkZHUXV16SeasTitGC5zoeAN
         PNwHJiRdivtLqbA3aMZKHAhy0A/FTkH2+pDvHZByFYxUsfirHNe8SONvmjoCjPPznn/8
         mJ85ILk0g0wk8cwyo6TYPaOAOPNgafsQWPI8qCjOmndgoc2qDc9zbctvTbN8nY2adIrt
         XbjsllstSMed8bAYt0NzNNqfmAyBPrGc4n2sdQZGVW6yLCnH1qlyZEoFYrDuyXWbAi7t
         LBKEkmajAcfa1qGanoNZlQVA+4/sBrNlc80HWGnMC0l+GLu2fwsXFB7qWz2xYXyzuw6e
         0Ktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792805516; x=1793410316;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oB2JIHiI/B9H5L8YjFgTXclj+u9AZ0WPWcgVpgD66z4=;
        b=KhbQ4gCxZt8gQEQzr78zMupZGlpYHsP96prrrFpFwsMyBK4cHB1OALskercpQJvQo5
         uyzeA7Z9jPnU0sbpjzrBoKzDaOr2nPlh0ImD5wkDTxZJkkc5CVJsniJz0SAmwIITluUq
         kScDpnwXHCnMiF+htFYsUdKv6Wz2v2vrcanm5+rp6pFm4YBtPPwr1phKA3NgaIjqoT+u
         22nZDFXk1H3oOm2RQSz3Jif+AG34+s2I3m+NP9AMGA5+I6j0jBDInbXJZYM+ci514vOI
         YpaAOrCeubuu+c7XJfk/Wmmtj9UrFvsXwmzvdJu3v/7e+O1YKRHJVIHSay/IjwCfQPtt
         HS6Q==
X-Gm-Message-State: AFq9FYKuVnKtkz3JEtq4B/eAtkkY3U6anvPuEK7FmcYLbp9LFP7a9zoT
	kO+le4Z5ZjyOs8YCKfz0j9pRvA9hglpEHkZl8BmBsH4noiATd60POMvJo2vGwkjslEwTQA49LEu
	kFzD9mM4bVr7oyJ2AGKwjuHn9OCpg16U=
X-Gm-Gg: AYBFou1JvpnQ10sOe3C22rhcTvBXul5tiquMhbIY9tnZsk0+4kdtpENLqaFkatnMAOZ
	RL3dnXYspmW1PPQ2QnkFsIMiNxgYLqVPAjW0LF+8koElqYBgvJAlRaQxbP4+F9N2wpo+Eub9qrC
	R5b+dEX7YNdoqJHykcdBKvfZHk0bYkQRxUv7X/UDutfV7tu+di43qp7+QpdaY/FuMgWyyn8pKn7
	FCElPYBAJlluEvrpNez5gEz7iYcXEY/bOhLJM/+QjHPygy/QlzE4lhW7wcuj3OzFU+eWNh68BgG
	KyXiF4rxMvZS+tkMM6F0Lwdh1f4NPSb8ID/JQR43HIXPilqVX47iE0eaTaWwnEr6F05DPLKPhf8
	MQgWa0lJ3HIbUTBRx/f5cvoqOEjlQACbNFsVonGnUNlSDIMUVfuTYZ2DUA2X8jsYx73dqjheicf
	Hwlcp+KY4=
X-Received: by 2002:a05:6870:af91:b0:475:a112:126e with SMTP id
 586e51a60fabf-4a83f588ccemr677821fac.27.1792805515975; Fri, 23 Oct 2026
 18:31:55 -0700 (PDT)
MIME-Version: 1.0
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
 <20261021092857.3585453-37-ankur.tyagi85@gmail.com> <2794486.1792790132815517243@lists.openembedded.org>
 <2509021.1792790759849313683@lists.openembedded.org>
In-Reply-To: <2509021.1792790759849313683@lists.openembedded.org>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sat, 24 Oct 2026 14:31:45 +1300
X-Gm-Features: AclHuK8MJd8XLdoUCLm5ZzE72ktOLrvOqXYI0ayN2K7DQxBk-ZwtdNTqncDE6LQ
Message-ID: <CADySD0EQZSPPvK5i2ZgVGAtT4x1zUoBYdGWnyetFOfgWM0+w6Q@mail.gmail.com>
Subject: Re: [oe] [meta-webserver][blacksail][PATCH 37/44] nginx: set
 CVE_STATUS for CVE-2026-95101 and CVE-2026-97629
To: mominux@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 24 Oct 2026 01:31:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131391

Thanks Mohammad

On Sat, Oct 24, 2026 at 10:26=E2=80=AFAM mominux via lists.openembedded.org
<mominux=3Dgmail.com@lists.openembedded.org> wrote:
>
> Small correction to the trailer in my previous email:
>
> Tested-by: Mohammad Abdoli <mominux@gmail.com>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#131390): https://lists.openembedded.org/g/openembedde=
d-devel/message/131390
> Mute This Topic: https://lists.openembedded.org/mt/121863982/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
