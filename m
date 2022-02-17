Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D831C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 22:55:09 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.3972.1645138508052061330
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Feb 2022 14:55:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pOCUurgi;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id d7so11299618qvk.2
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Feb 2022 14:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qEv3GOBAmK8Ag6B1UjBOqjg/5JhDN5cWu16Rp0G7kZw=;
        b=pOCUurgiLDR1LFOO8itZCD2VjeY77jKvQUeuTRPWwHlb6BXEKdVt55E7iUVkyCbCNK
         uQYlQp2vJCAA9YqxTArpGwrwDcq0lEQSbJ9eIwuyJS5BwywmaeZfOINdRsgpZQN+kP2B
         jQObjF3HdpEWonoWy95DxTqg/JdB90b4Bf1M8O8rqvzIFsbhb9gyKCg9/8nxYJ8hGGtj
         Tqul3g2bxRsaQQabuI1Eg0PJp8XPZ9B4sG8Y7I/gmEGb/NKD43krjOgskHGyTIQhXvgx
         YBdDJBS/jEoIqtiCctPd26iH4JqWXL3rcMPHUE+usrF8DjJWJEh8TrCbHfRVQdzBN6JI
         zcJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qEv3GOBAmK8Ag6B1UjBOqjg/5JhDN5cWu16Rp0G7kZw=;
        b=lGcGtfJ/syRBavog5i4k+jFxwfefAmzDKNQyrR0hnUbeVYYoZnHx1Fnb6XDMme0S19
         j4r/hjeS+Z24O5Pt6J6yo8RVzVP1NM5Cx1PoqYutXBkhrlJxPv99bpD/EAtqIXFBvcEE
         DOH12MyS/iCJrGYvCnyxGxyExRqJy2MDNLYf3ffTIYMf6u9lZzgRjuuQ/CDs3zk2M+o+
         KH14G/O3OCKcqefmgyDEnSEtIZaWeR6T/ZnkHIYLctQyB4+nFnr1BZ/CgnNW/5FrMU9Y
         QXiM4bS7EWaUbaYJyKk/aqkuNx9/F0w2ILBXFmV3WFZma8V1Lh2eWqekK2dljBMMtfVo
         sY9g==
X-Gm-Message-State: AOAM531ydI9Yr5sHLonM2IK4mhGYJZmeFTqpGIxMQwgpnV6qbqRMvgGf
	+FFXpmS+sV4xadYf75TuYOYOkyEDEY9HanUMwe0=
X-Google-Smtp-Source: 
 ABdhPJzFFSQsKx2CON+9w01/LZYd1NLLActX5uQWV/SzBp6kgmMyZmRtXpD6kuJW/QRArQwxCiQe1CeCNHzrEg4xxq0=
X-Received: by 2002:a05:622a:e:b0:2dc:cc56:da64 with SMTP id
 x14-20020a05622a000e00b002dccc56da64mr4432032qtw.54.1645138506552; Thu, 17
 Feb 2022 14:55:06 -0800 (PST)
MIME-Version: 1.0
References: <20220216165722.25908-1-f_l_k@t-online.de>
 <CAMKF1sqA_Dryp--gMJtnbNtKgbzQ1KCJL31q_ptT54SOG0Ao3g@mail.gmail.com>
 <16D4815E2CBA08CD.19478@lists.openembedded.org>
 <16D4824B2C83E660.30488@lists.openembedded.org>
 <d4f68a6f-547b-dcc2-683f-bb0a4f4195fe@t-online.de>
 <CAMKF1srEf0wQneiNKUqc-2sjqaBjR+KkG6WA3dw_Y7Y6tcj=2w@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srEf0wQneiNKUqc-2sjqaBjR+KkG6WA3dw_Y7Y6tcj=2w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Feb 2022 14:54:40 -0800
Message-ID: 
 <CAMKF1srtFoy3-xf4UGRYmSveJAJ-ULmDqEtdO-TQUGj2FUAh8w@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] seahorse: initial add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Feb 2022 22:55:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95362

On Thu, Feb 17, 2022 at 11:04 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Feb 17, 2022 at 12:17 AM Markus Volk <f_l_k@t-online.de> wrote:
> >
> > Apologies. Caused by my testing I had a lingering symlink to ssh-keygen
> > in ${TMP}/hosttools. Therefore, I did not have a build error. Since
> > 'ssh' is in hosttools, maybe it would be best to add 'ssh-keygen' as well?
> >
> > Without building openssh-native, the only other way I could think of
> > would be to use a hardcoded path like this:
>
> adding dependency on openssh-native is ok here.

that also needs to enhance openssh recipe, on fedora and debian both
ssh and ssh-keygen come from same package, so perhaps unblocking it
for build host might be also equally good solution. Please propose
needed changes for oe-core first and then see whichever is acceptable
way resend this patch once dependencies are accepted in core.

>
> >
> > +--- a/meson.build       2022-02-17 09:03:00.081459067 +0100
> > ++++ b/meson.build       2022-02-17 09:02:34.321668809 +0100
> > +@@ -44,7 +44,7 @@
> > + libpwquality = dependency('pwquality')
> > + posix = valac.find_library('posix')
> > + ssh_bin = find_program('ssh')
> > +-ssh_keygen = find_program('ssh-keygen')
> > ++ssh_keygen = find_program('/usr/bin/ssh-keygen')
> > + gpg_bin = find_program('gpg2', 'gpg', required: get_option('pgp-support'))
> > + gpgme_dep = dependency('gpgme', version: '>= 1.14.0', required:
> > get_option('pgp-support'))
> > +
> > +
> >
> >
> > Am 17.02.22 um 08:29 schrieb Markus Volk:
> > > Maybe i'm not running into this because i have this in my config ?
> > >
> > > IMAGE_FEATURES += " ssh-server-openssh"
> > >
> > > Am 17.02.22 um 08:13 schrieb Markus Volk:
> > >> That's strange. I have this error only without using
> > >> meson-build-dont-look-for-native-ssh-keygen.patch
> > >>
> > >>
> > >> Native ssh Dependency is fullfilled because we have it in HOSTTOOLS,
> > >> probably because the machine fails to build openssh-native. But we
> > >> dont provide native ssh-keygen. Adding it to hosttools would help to
> > >> fix the issue.
> > >> Does it help to add 'openssh' to depends ?
> > >>
> > >> Am 17.02.22 um 07:59 schrieb Khem Raj:
> > >>> seeing configure failure
> > >>> https://errors.yoctoproject.org/Errors/Details/625735/
> > >>>
> > >>> On Wed, Feb 16, 2022 at 8:57 AM Markus Volk <f_l_k@t-online.de> wrote:
> > >>>> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > >>>> ---
> > >>>>   ...uild-dont-look-for-native-ssh-keygen.patch | 15 +++++++++++
> > >>>>   .../recipes-gnome/seahorse/seahorse_41.0.bb   | 27
> > >>>> +++++++++++++++++++
> > >>>>   2 files changed, 42 insertions(+)
> > >>>>   create mode 100644
> > >>>> meta-gnome/recipes-gnome/seahorse/seahorse/meson-build-dont-look-for-native-ssh-keygen.patch
> > >>>>   create mode 100644
> > >>>> meta-gnome/recipes-gnome/seahorse/seahorse_41.0.bb
> > >>>>
> > >>>> diff --git
> > >>>> a/meta-gnome/recipes-gnome/seahorse/seahorse/meson-build-dont-look-for-native-ssh-keygen.patch
> > >>>> b/meta-gnome/recipes-gnome/seahorse/seahorse/meson-build-dont-look-for-native-ssh-keygen.patch
> > >>>>
> > >>>> new file mode 100644
> > >>>> index 000000000..ac83de486
> > >>>> --- /dev/null
> > >>>> +++
> > >>>> b/meta-gnome/recipes-gnome/seahorse/seahorse/meson-build-dont-look-for-native-ssh-keygen.patch
> > >>>> @@ -0,0 +1,15 @@
> > >>>> +From: Markus Volk <f_l_k@t-online.de>
> > >>>> +Date: Tue, 16 Feb 2022 10:38:04 +0100
> > >>>> +Subject: [PATCH] meson.build: dont look for native ssh-keygen
> > >>>> +
> > >>>> +--- a/meson.build      2022-02-16 10:38:04.170081321 +0100
> > >>>> ++++ b/meson.build      2022-02-16 10:38:28.257864179 +0100
> > >>>> +@@ -44,7 +44,7 @@
> > >>>> + libpwquality = dependency('pwquality')
> > >>>> + posix = valac.find_library('posix')
> > >>>> + ssh_bin = find_program('ssh')
> > >>>> +-ssh_keygen = find_program('ssh-keygen')
> > >>>> ++ssh_keygen = find_program('ssh-keygen', native : false)
> > >>>> + gpg_bin = find_program('gpg2', 'gpg', required:
> > >>>> get_option('pgp-support'))
> > >>>> + gpgme_dep = dependency('gpgme', version: '>= 1.14.0', required:
> > >>>> get_option('pgp-support'))
> > >>>> +
> > >>>> diff --git a/meta-gnome/recipes-gnome/seahorse/seahorse_41.0.bb
> > >>>> b/meta-gnome/recipes-gnome/seahorse/seahorse_41.0.bb
> > >>>> new file mode 100644
> > >>>> index 000000000..ec1328598
> > >>>> --- /dev/null
> > >>>> +++ b/meta-gnome/recipes-gnome/seahorse/seahorse_41.0.bb
> > >>>> @@ -0,0 +1,27 @@
> > >>>> +SUMMARY = "Seahorse is a graphical interface for managing and
> > >>>> using encryption keys."
> > >>>> +LICENSE="GPLv2"
> > >>>> +LIC_FILES_CHKSUM =
> > >>>> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> > >>>> +
> > >>>> +GNOMEBASEBUILDCLASS = "meson"
> > >>>> +
> > >>>> +DEPENDS = " \
> > >>>> +    avahi \
> > >>>> +    gcr \
> > >>>> +    glib-2.0 \
> > >>>> +    gnupg \
> > >>>> +    gpgme \
> > >>>> +    gtk+3 \
> > >>>> +    libhandy \
> > >>>> +    libpwquality \
> > >>>> +    libsecret \
> > >>>> +    libsoup-2.4 \
> > >>>> +    openldap \
> > >>>> +"
> > >>>> +
> > >>>> +inherit gnomebase itstool vala
> > >>>> +
> > >>>> +SRC_URI:append = "
> > >>>> file://meson-build-dont-look-for-native-ssh-keygen.patch"
> > >>>> +SRC_URI[archive.sha256sum] =
> > >>>> "e6eec09e810448295f547f18c1d5772b65c3edc1d9e5a2595f10b5dde68929f5"
> > >>>> +
> > >>>> +FILES:${PN} += "${datadir}"
> > >>>> +
> > >>>> --
> > >>>> 2.25.1
> > >>>>
> > >>>>
> > >>>>
> > >>>>
> > >>
> > >>
> > >>
> > >
> > >
> > >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#95355): https://lists.openembedded.org/g/openembedded-devel/message/95355
> > Mute This Topic: https://lists.openembedded.org/mt/89189799/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

