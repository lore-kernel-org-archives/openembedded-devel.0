Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D129DC433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 17:34:11 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web12.14479.1639416851214852207
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 09:34:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H1qp9xs7;
 spf=pass (domain: gmail.com, ip: 209.85.222.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id t83so14560643qke.8
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 09:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ExiN7nwHLvmmQw22YP7bOG91WqWXNgYgxrkbEqWN6a8=;
        b=H1qp9xs767lW2kyJNfOcnU4rm2qAcB+3ksS22AU67R3CvPBrzO0xNrOn2QOx3irSL8
         qH7rRaE34rSzdZdUEiSu8d1zho7Mwht+8Vq0ioC4cQejE4/8635OB8X3Qzxn2CHtMLPY
         EJspXYvAQdYecLWwIp4SQ2CjxeXEuzIUQUW1wNTCrOtAZQieI/yv8c80lG5+gllW6ZIz
         QLIS4rv8cPL95Hs0J5ItTgsdiuh6k/mnofNP3evR++NO1S9XAs5TL10WAW8AOVwdTXjC
         k0kgY3gw3NQuvWXSnhpErjsI7g/UOw29v/ilFFzgyPUIr1xi2cXImmnQ3xu9SclmDwTL
         YRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ExiN7nwHLvmmQw22YP7bOG91WqWXNgYgxrkbEqWN6a8=;
        b=r5M+OlZc1WSzysx8bn/qNdxLkN+3RjuzRDW3AU9y199aXeCTgjUlA3DkZWBQ3DH0RM
         U0lVUa9E7T7dAtMMRpr/JWTWLJUaX8zsJeQhJfQVb8GmzRV86f+v7VvHmD+pNQ/ECbHl
         BiB2jR/eUeJLfakPBRJxtT0FW1VL5Z/JsJL7kI6ZRlpGrmxwH4FN/F6ywmPkJ1tazYPH
         QBBs82awJMrOQ3KkqQNKYMsZtKFm/cWVUXh6X2cszWdD6rqWE29thas99T0Y1z6/+zyy
         qP54ODzv3PKiXv7GwyKiVMR3Eulo0KAjlU/wVFLt+RWGlRIrv6O5qqw8QPxhhtk6hRcw
         B6Hw==
X-Gm-Message-State: AOAM532cZ/gqr2nuzX7qd50nb3vMu67mje/2ryRPwOceJhF6IxP1KFlM
	BzvjXSywsOW1XFsw9jZfNJ/ETfsyTKZ6qB9TV6A=
X-Google-Smtp-Source: 
 ABdhPJwB104u+uAjEiVYOJJkvoaJLI9uMvODsRIS01HmESAZLgtdDjn34nDHg7Kw5Mai4hochvBEFPxynRAoL2Mm2h8=
X-Received: by 2002:a37:dd4:: with SMTP id 203mr33831215qkn.149.1639416850056;
 Mon, 13 Dec 2021 09:34:10 -0800 (PST)
MIME-Version: 1.0
References: <20211212183612.3489223-1-open.source@oleksandr-kravchuk.com>
 <CAMKF1sqGtF4cQd8yRpR4r-QsLCG909cKa66+4bA95+dUfD4kJw@mail.gmail.com>
 <81f3d2f0-6596-14d6-ba4f-78780b0dacf0@oleksandr-kravchuk.com>
 <30a7788b-8a47-ec0a-8c65-3cc179a21d19@gmail.com>
 <a8c93ec8-f8fa-b65d-2161-1c834bb33491@oleksandr-kravchuk.com>
In-Reply-To: <a8c93ec8-f8fa-b65d-2161-1c834bb33491@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Dec 2021 09:33:43 -0800
Message-ID: 
 <CAMKF1srrBXsM-VQyUopSA1EEY1_U2v0MQs3juO-8Rx8SZMvtXA@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] gssdp: update to 1.4.0.1
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 17:34:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94343

On Mon, Dec 13, 2021 at 8:53 AM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Random q: shouldn't this kind of e-mails be automated, e.g. CI/CD sw
> notifies you that your patch fails to build?

In theory yes. However, we do not have such sophisticated CI systems to avail.

>
> On 13/12/2021 17:39, Khem Raj wrote:
> >
> >
> > On 12/13/21 8:15 AM, Oleksandr Kravchuk wrote:
> >> Isn't it because meta-gnome is not included?
> >
> > point is that we can not create hard dependency for meta-oe on
> > meta-gnome, otherway around is fine. So this recipe should be able to
> > build
> > without gtk4+ and perhaps can be enabled with packageconfig.
> >
> >>
> >> On 13/12/2021 17:09, Khem Raj wrote:
> >>> I am seeing this failure
> >>>
> >>> stdio: ERROR: Nothing PROVIDES 'gtk4' (but
> >>> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
> >>>
> >>> DEPENDS on or otherwise requires it). Close matches:
> >>> stdio: ERROR: Required build target 'meta-world-pkgdata' has no
> >>> buildable providers.
> >>> stdio: ERROR: Nothing PROVIDES 'gtk4' (but
> >>> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
> >>>
> >>> DEPENDS on or otherwise requires it). Close matches:
> >>> stdio: ERROR: Required build target 'meta-world-pkgdata' has no
> >>> buildable providers.
> >>> stdio: ERROR: Command . ./oe-init-build-env; yocto-check-layer-wrapper
> >>> ../meta-openembedded failed with exit code 2, see errors above.
> >>> (1639376061.2: 1715.6)
> >>>
> >>> see
> >>> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1788
> >>>
> >>> On Sun, Dec 12, 2021 at 10:36 AM Oleksandr Kravchuk
> >>> <open.source@oleksandr-kravchuk.com> wrote:
> >>>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> >>>> ---
> >>>>   .../recipes-connectivity/gupnp/gssdp_1.2.3.bb | 20 --------------
> >>>>   .../gupnp/gssdp_1.4.0.1.bb                    | 27
> >>>> +++++++++++++++++++
> >>>>   2 files changed, 27 insertions(+), 20 deletions(-)
> >>>>   delete mode 100644
> >>>> meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.3.bb
> >>>>   create mode 100644
> >>>> meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
> >>>>
> >>>> diff --git
> >>>> a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.3.bb
> >>>> b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.3.bb
> >>>> deleted file mode 100644
> >>>> index 8f27ae292..000000000
> >>>> --- a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.3.bb
> >>>> +++ /dev/null
> >>>> @@ -1,20 +0,0 @@
> >>>> -SUMMARY = "Resource discovery and announcement over SSDP"
> >>>> -DESCRIPTION = "GSSDP implements resource discovery and
> >>>> announcement over SSDP (Simpe Service Discovery Protocol)."
> >>>> -LICENSE = "LGPLv2"
> >>>> -LIC_FILES_CHKSUM =
> >>>> "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
> >>>> -DEPENDS = "glib-2.0 libsoup-2.4"
> >>>> -
> >>>> -SRC_URI = "${GNOME_MIRROR}/${BPN}/1.2/${BPN}-${PV}.tar.xz"
> >>>> -SRC_URI[md5sum] = "ef3295a965c06ce0f683522391fbb910"
> >>>> -SRC_URI[sha256sum] =
> >>>> "a263dcb6730e3b3dc4bbbff80cf3fab4cd364021981d419db6dd5a8e148aa7e8"
> >>>> -
> >>>> -GTKDOC_MESON_OPTION = 'gtk_doc'
> >>>> -
> >>>> -inherit meson pkgconfig gobject-introspection vala gtk-doc
> >>>> -
> >>>> -PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11',
> >>>> 'sniffer', '', d)}"
> >>>> -PACKAGECONFIG[sniffer] = "-Dsniffer=true,-Dsniffer=false,gtk+3,"
> >>>> -
> >>>> -PACKAGES =+ "gssdp-tools"
> >>>> -
> >>>> -FILES:gssdp-tools = "${bindir}/gssdp* ${datadir}/gssdp/*.glade"
> >>>> diff --git
> >>>> a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
> >>>> b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
> >>>> new file mode 100644
> >>>> index 000000000..43d2fcfa0
> >>>> --- /dev/null
> >>>> +++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
> >>>> @@ -0,0 +1,27 @@
> >>>> +SUMMARY = "Resource discovery and announcement over SSDP"
> >>>> +DESCRIPTION = "GSSDP implements resource discovery and
> >>>> announcement over SSDP \
> >>>> +               (Simpe Service Discovery Protocol)."
> >>>> +HOMEPAGE = "https://gitlab.gnome.org/GNOME/gssdp/"
> >>>> +BUGTRACKER = "https://gitlab.gnome.org/GNOME/gssdp/-/issues"
> >>>> +LICENSE = "LGPLv2.1"
> >>>> +LIC_FILES_CHKSUM =
> >>>> "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> >>>> +
> >>>> +SRC_URI = "${GNOME_MIRROR}/${BPN}/1.4/${BPN}-${PV}.tar.xz"
> >>>> +SRC_URI[sha256sum] =
> >>>> "8676849d57fb822b8728856dbadebf3867f89ee47a0ec47a20045d011f431582"
> >>>> +
> >>>> +GTKDOC_MESON_OPTION = 'gtk_doc'
> >>>> +
> >>>> +DEPENDS = " \
> >>>> +    glib-2.0 \
> >>>> +    libsoup-2.4 \
> >>>> +    gtk4 \
> >>>> +"
> >>>> +
> >>>> +inherit meson pkgconfig gobject-introspection vala gtk-doc
> >>>> +
> >>>> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11',
> >>>> 'sniffer', '', d)}"
> >>>> +PACKAGECONFIG[sniffer] = "-Dsniffer=true,-Dsniffer=false,gtk+3,"
> >>>> +
> >>>> +PACKAGES =+ "gssdp-tools"
> >>>> +
> >>>> +FILES:gssdp-tools = "${bindir}/gssdp* ${datadir}/gssdp/*.glade"
> >>>> --
> >>>> 2.25.1
> >>>>
> >>>>
> >>>> -=-=-=-=-=-=-=-=-=-=-=-
> >>>> Links: You receive all messages sent to this group.
> >>>> View/Reply Online (#94306):
> >>>> https://lists.openembedded.org/g/openembedded-devel/message/94306
> >>>> Mute This Topic: https://lists.openembedded.org/mt/87681937/1997914
> >>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >>>> Unsubscribe:
> >>>> https://lists.openembedded.org/g/openembedded-devel/unsub
> >>>> [raj.khem@gmail.com]
> >>>> -=-=-=-=-=-=-=-=-=-=-=-
> >>>>

