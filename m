Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C5EC77B75
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 05:29:07 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web11.42935.1684301338405524267
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 May 2023 22:28:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=buTP5JY5;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-39462726590so305218b6e.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 22:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684301337; x=1686893337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dekFl13poptfu6AI8OqB+kNq+0wKtvh6F3qGa7/p0Gs=;
        b=buTP5JY5C+kzXsstvLip+4dk4zlYJotfDIrXYr0Ik2+G+PjCtifW9Z91va0ZT9Omnu
         fh9PE9Cvxs+Py2nLkKE+cVEpB/ZctSe11OAodH31CF2M8zZzSg2ZFUs61QLlXFMD3BD6
         w3fbWV6NkNTduf9D1ezkS6OvuoK+OsWjSeq/HFJrdGvHTvtnZuDRSU0x8K4p9Km0DN0k
         fjOT0/UnMX1juO3U5PZV3x+Bfcc5xHuuTNfcmhbh6RwjM8YUYYeaMEdWlPGOikbm7Jhn
         9ZFGzG9Ny+lqHZGqxFHnK7+ekXtzLiIfxKqjSWKQUT1S2k7n+PuJ/FmP1L+PZZP3z7nO
         G/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684301337; x=1686893337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dekFl13poptfu6AI8OqB+kNq+0wKtvh6F3qGa7/p0Gs=;
        b=A1N+Pc3BkSkCfm/KylxI+swEifwB875Pm0BOdy38liGnXvTTeWpqC4CYjQKxNPrZXs
         mbPZNHroeDCYX8I052AQkZ9vs5j0BydaS9AuMr1qtSFp1+fw9Uws3cqRfinc9V/Njrv3
         9r0VLGAfiR7ztZP1DWGGDSAP/ro91LB79/05dLf2a5ccK/sCZUd/JEHyrkRcGQYaG0nr
         TlUe0HKSEBqjIdGE9afWwf6saQ19iL1hQadQVWv/fdeiqmTnQDNAVbJgPm32Z+m5dT3y
         Z94fQV+Eiecbm4f01Cfjr1SH4NDulbIR/OHzIgLmwnognIrmwF+nyH4ijOehvC3xNeGW
         85uw==
X-Gm-Message-State: AC+VfDyIsGkCdRgoS+0Z0+1ctTsU8XuzA4B/WUJHESwmRXYZPE1l0Y40
	eQk6SnFlyeRCKp/ixUIt2XHuUxYRATvfruo2uioItT6B/NY=
X-Google-Smtp-Source: ACHHUZ7zZuu8a7MKmSZ/+1lzbLFPzYiFKT54o27hf/bwEmkZnXuRX3LEl/YLL4ia8S6VDkWJvQ8MU2dsrqhKhJcQNxw=
X-Received: by 2002:a05:6808:2a0c:b0:38e:4a8e:d7e0 with SMTP id
 ez12-20020a0568082a0c00b0038e4a8ed7e0mr13495254oib.21.1684301337456; Tue, 16
 May 2023 22:28:57 -0700 (PDT)
MIME-Version: 1.0
References: <1684224813-27544-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1684224813-27544-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 May 2023 22:28:31 -0700
Message-ID: <CAMKF1soA3b0AMtpKC3pd0JpEiaDYdScmhyDk62AGXDLjeaqtqA@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia] [PATCH] mpd: fix build error when fmt updated
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 May 2023 05:29:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102638

here is next error

https://errors.yoctoproject.org/Errors/Details/704258/

On Tue, May 16, 2023 at 1:13=E2=80=AFAM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> backport upstream patch for build error when fmt updated:
> ix-build-error-when-fmt-updated.patch
> minor-fixup-for-libfmt10.patch
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../fix-build-error-when-fmt-updated.patch    | 71 +++++++++++++++++++
>  .../mpd/minor-fixup-for-libfmt10.patch        | 27 +++++++
>  .../recipes-multimedia/musicpd/mpd_0.23.12.bb |  6 +-
>  3 files changed, 102 insertions(+), 2 deletions(-)
>  create mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd/fix-bu=
ild-error-when-fmt-updated.patch
>  create mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd/minor-=
fixup-for-libfmt10.patch
>
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd/fix-build-err=
or-when-fmt-updated.patch b/meta-multimedia/recipes-multimedia/musicpd/mpd/=
fix-build-error-when-fmt-updated.patch
> new file mode 100644
> index 0000000000..ebbea2b358
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd/fix-build-error-when=
-fmt-updated.patch
> @@ -0,0 +1,71 @@
> +Upstream-Status: Backport [https://github.com/MusicPlayerDaemon/MPD/comm=
it/181b96dd2d71bc8f2668776719d344466f258b5d]
> +
> +Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> +
> +From 181b96dd2d71bc8f2668776719d344466f258b5d Mon Sep 17 00:00:00 2001
> +From: Max Kellermann <max.kellermann@gmail.com>
> +Date: Mon, 15 May 2023 20:52:21 +0200
> +Subject: [PATCH] command/player, SongPrint: use AudioFormatFormatter()
> +
> +libfmt version 10 apparently doesn't know how to format a
> +`StringBuffer`, failing the MPD build.  Since we have a formatter
> +specialization for `AudioFormat`, let's use that - it's better and
> +easier to use.
> +
> +Closes https://github.com/MusicPlayerDaemon/MPD/issues/1807
> +---
> + src/SongPrint.cxx              | 5 +++--
> + src/command/PlayerCommands.cxx | 3 ++-
> + 2 files changed, 5 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/SongPrint.cxx b/src/SongPrint.cxx
> +index 98d544cc38..835669d276 100644
> +--- a/src/SongPrint.cxx
> ++++ b/src/SongPrint.cxx
> +@@ -8,6 +8,7 @@
> + #include "TagPrint.hxx"
> + #include "client/Response.hxx"
> + #include "fs/Traits.hxx"
> ++#include "lib/fmt/AudioFormatFormatter.hxx"
> + #include "time/ChronoUtil.hxx"
> + #include "util/StringBuffer.hxx"
> + #include "util/UriUtil.hxx"
> +@@ -77,7 +78,7 @@ song_print_info(Response &r, const LightSong &song, bo=
ol base) noexcept
> +               time_print(r, "Last-Modified", song.mtime);
> +
> +       if (song.audio_format.IsDefined())
> +-              r.Fmt(FMT_STRING("Format: {}\n"), ToString(song.audio_for=
mat));
> ++              r.Fmt(FMT_STRING("Format: {}\n"), song.audio_format);
> +
> +       tag_print_values(r, song.tag);
> +
> +@@ -100,7 +101,7 @@ song_print_info(Response &r, const DetachedSong &son=
g, bool base) noexcept
> +               time_print(r, "Last-Modified", song.GetLastModified());
> +
> +       if (const auto &f =3D song.GetAudioFormat(); f.IsDefined())
> +-              r.Fmt(FMT_STRING("Format: {}\n"), ToString(f));
> ++              r.Fmt(FMT_STRING("Format: {}\n"), f);
> +
> +       tag_print_values(r, song.GetTag());
> +
> +diff --git a/src/command/PlayerCommands.cxx b/src/command/PlayerCommands=
.cxx
> +index 5108b9d3c4..0b5a917020 100644
> +--- a/src/command/PlayerCommands.cxx
> ++++ b/src/command/PlayerCommands.cxx
> +@@ -13,6 +13,7 @@
> + #include "Partition.hxx"
> + #include "Instance.hxx"
> + #include "IdleFlags.hxx"
> ++#include "lib/fmt/AudioFormatFormatter.hxx"
> + #include "util/StringBuffer.hxx"
> + #include "util/ScopeExit.hxx"
> + #include "util/Exception.hxx"
> +@@ -170,7 +171,7 @@ handle_status(Client &client, [[maybe_unused]] Reque=
st args, Response &r)
> +
> +               if (player_status.audio_format.IsDefined())
> +                       r.Fmt(FMT_STRING(COMMAND_STATUS_AUDIO ": {}\n"),
> +-                            ToString(player_status.audio_format));
> ++                            player_status.audio_format);
> +       }
> +
> + #ifdef ENABLE_DATABASE
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd/minor-fixup-f=
or-libfmt10.patch b/meta-multimedia/recipes-multimedia/musicpd/mpd/minor-fi=
xup-for-libfmt10.patch
> new file mode 100644
> index 0000000000..0c9d979107
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd/minor-fixup-for-libf=
mt10.patch
> @@ -0,0 +1,27 @@
> +Upstream-Status: Backport
> +[https://github.com/MusicPlayerDaemon/MPD/commit/f869593ac8913e52c711e97=
4257bd6dc0d5dbf26]
> +
> +Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> +
> +From f869593ac8913e52c711e974257bd6dc0d5dbf26 Mon Sep 17 00:00:00 2001
> +From: Max Kellermann <max.kellermann@gmail.com>
> +Date: Mon, 15 May 2023 20:59:58 +0200
> +Subject: [PATCH] TimePrint: minor fixup for libfmt 10
> +
> +libfmt version 10 has difficulties formatting a `StringBuffer`, and we
> +need to help it by explicitly invoking the `c_str()` method.
> +---
> + src/TimePrint.cxx | 2 +-
> + 1 files changed, 1 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/TimePrint.cxx b/src/TimePrint.cxx
> +index 5bf05f6238..d47f3178bb 100644
> +--- a/src/TimePrint.cxx
> ++++ b/src/TimePrint.cxx
> +@@ -20,5 +20,5 @@ time_print(Response &r, const char *name,
> +               return;
> +       }
> +
> +-      r.Fmt(FMT_STRING("{}: {}\n"), name, s);
> ++      r.Fmt(FMT_STRING("{}: {}\n"), name, s.c_str());
> + }
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb b/=
meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb
> index 13938444c8..c6672ca46b 100644
> --- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb
> +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb
> @@ -18,10 +18,12 @@ DEPENDS +=3D " \
>      fmt \
>  "
>
> -SRC_URI =3D "git://github.com/MusicPlayerDaemon/MPD;branch=3Dv0.23.x;pro=
tocol=3Dhttps \
> +SRC_URI =3D "git://github.com/MusicPlayerDaemon/MPD;branch=3Dmaster;prot=
ocol=3Dhttps \
>             file://mpd.conf.in \
> +           file://minor-fixup-for-libfmt10.patch \
> +           file://fix-build-error-when-fmt-updated.patch \
>             "
> -SRCREV =3D "d91da9679801224847c30147f5914785b6f8f240"
> +SRCREV =3D "b1422fbda40a1831d397fb161e7a555443c2a072"
>  S =3D "${WORKDIR}/git"
>
>  EXTRA_OEMESON +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '=
-Dsystemd=3Denabled -Dsystemd_system_unit_dir=3D${systemd_system_unitdir} -=
Dsystemd_user_unit_dir=3D${systemd_system_unitdir}', '-Dsystemd=3Ddisabled'=
, d)}"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102623): https://lists.openembedded.org/g/openembedde=
d-devel/message/102623
> Mute This Topic: https://lists.openembedded.org/mt/98922100/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

