Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F93DC48BC3
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 00:53:43 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.2626.1708476821024182039
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 16:53:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZmSgQc/k;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-20536d5c5c7so3960009fac.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 16:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708476820; x=1709081620; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSzRQ2qzxhHBWkuLBmetQaLsNFwmeP2ZsPEUkhZ43/g=;
        b=ZmSgQc/kC28TtVjTxfCD56aiSIoH+OAzW/vpaNn9hiETf4UHHl1UD/JSKwEjRpjekC
         xTSQY8H5oTaTheo8BmnxYRMUwTnqugSzBvzqSlYWSuh1p4915xk0XOrd5bCxJHdwMfTu
         hHGdtz+ZaKsBhpgEUaWYz78soGvSoPpbAXt5FTbL4ezoeZ9g7onWymUkE/PDdcbZMCqd
         3oXmuXVeetgO1uD88SjUIzByh8oAFDT7q3yngWybzXaMnSI82nAyuUkHLGXkczcVAQZm
         mfsDRo4MIP03zFpYVGsbFbjII0bBLaNzCSVzN5bLAuOVOJ9046+CeNsbP/+FTZn190JY
         VVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708476820; x=1709081620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LSzRQ2qzxhHBWkuLBmetQaLsNFwmeP2ZsPEUkhZ43/g=;
        b=dPrT/H1n5XAMfLVI/DiqSSJhQ9Lo0w6DfhE24ERwgoUTWuCsA7asIMTMGQ1zCjFLE9
         KRHrXgYMoP9trVna5M9Zr8CO6NfIUINvyRwc6FHWwzoKnVezmw53QU43Cj9B4T29TjcE
         nQ5wJc87be4XBNtxBuxuvW+zjdncU41gyb9ab89/nTu2JyrXfDN3/j4M2FI3MWiiUneY
         eEwW42xf1hK17TckNZJoivnZXKuJoQ/ChGPmVdlGTCAsMLZgm9WOLysU3RKSJpOyFYjf
         CEO9kufG3iKydN5A4vQYwtxYQz7FbAzBdmE18w4Rs6wF628yxFiAzD/fVPuDokQ2lnrc
         lrRA==
X-Gm-Message-State: AOJu0YwQbed8MIFbc+P0GkoSKZq5IyJkPZx9vQ7SeEmcNU0GrNbvB7ha
	Q4T4koQSqgwe+wzXkhsGr7yB4+Inhv10PQXXZf97GMDYtGYtAqmICtrK8ba9PuuwbQWmTpAPYU7
	zXeWc8P2txMcL1QzOp5Kbn7Oah+Q=
X-Google-Smtp-Source: AGHT+IH4WpunpMRIS7cZ1XB7SgFXbicU9awYg3heiWbGkA3LOzOWQeK5X7UuHnl5/7rQ9N4O4KPM9vkknDII53lESic=
X-Received: by 2002:a05:6871:22c4:b0:21e:e85d:4648 with SMTP id
 se4-20020a05687122c400b0021ee85d4648mr6289771oab.44.1708476819643; Tue, 20
 Feb 2024 16:53:39 -0800 (PST)
MIME-Version: 1.0
References: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com> <1708419281-26047-4-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1708419281-26047-4-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Feb 2024 16:53:13 -0800
Message-ID: <CAMKF1soNMWU-pdFzwAUnC-dyWMp9hpV2P_xTA=JS8Su=wTr=PA@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH 04/26] webkitgtk3: upgrade 2.42.4 -> 2.42.5
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 00:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108954

This seems to fail on 32bit ( qemux86)

https://errors.yoctoproject.org/Errors/Details/754010/

On Tue, Feb 20, 2024 at 12:55=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> - Fix webkit_web_context_allow_tls_certificate_for_host to handle IPv6 UR=
Is produced by SoupURI.
> - Ignore stops with offset zero before last one when rendering gradients =
with cairo.
> - Write bwrapinfo.json to disk for xdg-desktop-portal.
> - Fix gamepads detection by correctly handling focused window in GTK4.
> - Fix several crashes and rendering issues.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../webkitgtk/{webkitgtk3_2.42.4.bb =3D> webkitgtk3_2.42.5.bb}    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.42.4.bb =3D> webk=
itgtk3_2.42.5.bb} (99%)
>
> diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.4.bb b/met=
a-oe/recipes-support/webkitgtk/webkitgtk3_2.42.5.bb
> similarity index 99%
> rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.4.bb
> rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.5.bb
> index 3c6b7db81..d12ae2819 100644
> --- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.4.bb
> +++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.5.bb
> @@ -15,7 +15,7 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/webkitg=
tk-${PV}.tar.xz \
>             file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
>             file://no-musttail-arm.patch \
>             "
> -SRC_URI[sha256sum] =3D "52288b30bda22373442cecb86f9c9a569ad8d4769a1f97b3=
52290ed92a67ed86"
> +SRC_URI[sha256sum] =3D "b64278c1f20b8cfdbfb5ff573c37d871aba74a1db26d9b39=
f74e8953fe61e749"
>
>  inherit cmake pkgconfig gobject-introspection perlnative features_check =
upstream-version-is-even gi-docgen
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108924): https://lists.openembedded.org/g/openembedde=
d-devel/message/108924
> Mute This Topic: https://lists.openembedded.org/mt/104464212/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

