Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 002C0C7619A
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 03:19:46 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.26685.1679887180719082235
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Mar 2023 20:19:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fy99cAWA;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-17683b570b8so7837561fac.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Mar 2023 20:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679887180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5IUSb/I06mENaEZhdJ/etQCxpHSCcjjBUENsLsO7kM=;
        b=Fy99cAWAagpd0oFrq9y8SN37Ewl5QakBVuZNLxPVq0BMrxuyAj45iyJynWfQk1o8aA
         keulkiGO+X6yTajHTXbt5LIX+g696kOgNz/lvD2R8/QmIK6vHkV13qZaLgvFkylvqajK
         1KBvIRjw4qtmhDwJzqNry2rsxMAodvpVwtaV7bm7cdxbfxN+DqfpIdx0v5vNqLuJ1EV2
         0TfSckWwiWuFeSMW35FDiGwbep+Qh1axtYgquPAqW96c01DXvNylgb1icGUINIt5c3H8
         jyKBi+jgg3aTwReXSGYI5CzClGsmLOFBfHh7mMp8gT+V2Tk04L3vDIsWsqOnd6vYrszM
         7E2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679887180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W5IUSb/I06mENaEZhdJ/etQCxpHSCcjjBUENsLsO7kM=;
        b=KrQrxjXMrLp6ZUZj7yLjGoFLMh5n97Ucac6ZBfHTvopmSXysdOVaKfqNJaTM8P8AcD
         vbIh0pchN49nLcniQaea+z2xKFv7N5fsUCLKkOzoICdillEB7xA0nkhTxcSTUFOmx9la
         MOHtAlEPCEK3FA+qQaZfXb5/CmPXmkuWA9H25UYUwhYJJZbNTX2cYaxA/bM6fWEDCrxH
         jLd7vGmvbABZ/j6Q1mrn6RBPwYOTOe0s1YsV38i2O8UAxQOCs9uYm8Dxm0/fghyjFHxK
         YyES5OZRSwMew+QO0Yv88QH/uYol6qSZ8gUY8BDIFD0GYIt0vy/pu6R7n+Ao/ajzxWsp
         cxFA==
X-Gm-Message-State: AO0yUKWy1WXsXvjGhol9SX8qxtswK94N7sX4Ux5C287MQtcRCEggLSOD
	DC9mt9BQnt9JbUTClovctK2S64ajszXREJ+mNIM=
X-Google-Smtp-Source: AKy350amRm14b9E9SN9vYGRQ7IfwuIiG8FYWMxIEK58/DWXLElBQ7zMHsAW42rB/nKR/KzMZHmr0iVdYKxQ9VKR4C0U=
X-Received: by 2002:a05:6870:130f:b0:177:a5ec:b41 with SMTP id
 15-20020a056870130f00b00177a5ec0b41mr3502010oab.4.1679887179813; Sun, 26 Mar
 2023 20:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <1679886213-20913-1-git-send-email-wangmy@fujitsu.com> <1679886213-20913-4-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1679886213-20913-4-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 26 Mar 2023 20:19:13 -0700
Message-ID: <CAMKF1soY+78Pu2thZ3au2E6iqBdfDaP_qAiuaYzXKTM7SsxT3w@mail.gmail.com>
Subject: Re: [oe] [meta-gnome] [PATCH] evolution-data-server(-native): upgrade
 3.46.3 -> 3.48.0
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 03:19:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101765

please rebase on master-next and see if its still needed then resend.

On Sun, Mar 26, 2023 at 8:04=E2=80=AFPM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Bug Fixes:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> I#276 - alarm-notify: Incorrectly handles changes in recurring events
> I#453 - build: Make it possible to override C++ standard
> I#454 - libedataserverui: Tweak lookout of the Trust Prompt dialog
> I#231 - Release unused memory in factories after certain operations
> I#445 - libedataserverui4: (almost) empty GIR/VAPI file
> I#446 - IMAP: Inbox hidden in offline with "Show only subscribed folders"
> I#447 - Google Task modification not synced
> I#452 - CalDAV: Can fail to refresh content in some cases
> M!112 - Update for removal of WebKitGTK sandbox API
> M!113 - Don't accidentally disable sandbox for GTK 3 users
> M!114 - OAuth2: stop trying to disable WebKit plugins
> M!114 - OAuth2: use WebKitNetworkSession to manage proxy settings
> evo-I#2161 - Mail: Add 'Learn as Junk' message filter action
> ews-I#210 - Add option to always use HTTP/1
> I#416 - LDAP: Possible memory leak in build_mods_from_contacts()
> I#417 - Serialize OAuth2 token refresh for an account
> I#418 - locale_supports_12_hour_format() can read uninitialized value
> I#419 - IMAP: Does not forget renamed folders on the server
> I#420 - LDAP: Use valid values for error paths of contact create/remove
> I#421 - libedataserver: Enhance two-digit year parsing
> I#427 - Tautology in e_named_parameters_equal()
> I#428 - Addressbook: Fix possible read of uninitialized data
> I#429 - Fix some (rarely) possible dereferences of NULL
> I#431 - e-xml-utils: Enable parse of huge XML files
> I#432 - Fix possible NULL-dereference in e_cal_backend_file_modify_object=
s()
> I#435 - ECalComponentAttendee: Default CUTYPE is INDIVIDUAL
> I#437 - IMAP: Excessive memory usage on folder summary download
> I#438 - Trust Prompt: Add issuer's certificate fingerprint
> I#439 - Fails to add task with X-EVOLUTION-GTASKS-POSITION into Google Ta=
sk list
> I#442 - e_util_change_uri_component: Reset default port when changing sch=
eme
> I#443 - Camel: Mail header order in malformed message matters
> M!97 - desktop: Remove obsolete Bugzilla entries
> M!102 - Stored values are never read
> M!106 - Fix few memory leaks
> M!107 - Use webkitgtk-6.0 API version
> M!108 - Try harder to support webkitgtk-6.0
> M!109 - EGDataSession: Make it available to the GObject introspection
> M!110 - typos: success, successful
> M!111 - addressbook: Add autocleanups
> ews-I#208 - Prompting for password too often
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../evolution-data-server/evolution-data-server.inc           | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server.inc
> index 2b74b2e60..9db5e9011 100644
> --- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.inc
> +++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.inc
> @@ -9,5 +9,5 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6a6e689d19255c=
f0557f3fe7d7068212 \
>
>  inherit gnomebase upstream-version-is-even
>
> -SRC_URI[archive.sha256sum] =3D "0938e2279e5cfbc2204766ca9d3fea570911699b=
07c10cbe01aca62a7e8b2bee"
> -PV =3D "3.46.3"
> +SRC_URI[archive.sha256sum] =3D "0f25f73331edf53909be40f412b2a86939270327=
517616303f322de157083c35"
> +PV =3D "3.48.0"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101757): https://lists.openembedded.org/g/openembedde=
d-devel/message/101757
> Mute This Topic: https://lists.openembedded.org/mt/97874721/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

