Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C31C433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 13:13:23 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web09.6987.1645103603166762033
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Feb 2022 05:13:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c41LeqwR;
 spf=pass (domain: gmail.com, ip: 209.85.210.53,
 mailfrom: peron.clem@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id
 c16-20020a9d6850000000b005ad05c1c8d7so2499931oto.9
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Feb 2022 05:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=G6rZeq50p4b5/pebwgb9d7RULAE35RL5ZZEOsn+Z/EI=;
        b=c41LeqwRYJDy2xT6cFdhiss5bCvrEnJZwE3CSu5inxx+s2Db2ouoWmX0FrpillJ6AW
         3MqTEHNaKSyn+abTwHZ27DGJ/cLxRy5bR7p2eKJ7LZWBZUoeDOeXVOtqiyeVVkoQHPmA
         ZuxzOeCBIiue0s2nv7MN//9STWiZ7v6DozLuOxGjXg3xgYqdOwfKKYw82ksp+XKILuHf
         gdk6M0xfaxC4V29VSW7xWxKH+7K3+QvdrY4E24IQxw7m7v+b2nti3uc2c92RDf2XvfjG
         V7tSrXDvG2JY+RY/xKGEEheEsreeyVXYeszNxp/TL/qdlHLYfFtsfGfYfzN7yjhpx6ro
         roLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=G6rZeq50p4b5/pebwgb9d7RULAE35RL5ZZEOsn+Z/EI=;
        b=d0c/dBMNb41D+XAmBAQO/FHO8T7t851sIDTTNn4CWFS422v/2ZLWQMW2ZobEGoSe3e
         IAMTFUBnt+WeKuh1NiVbl4ZNC64LIFKm3CnXLzNuySGdDx7TMNO+d78id7agHnvUBwKs
         Fi4z790cJREx0Ni6iVVXUwCYf4iv0CIX4bAwPgYqcsE7w7u0pevvnDhvq81MIY0b4N/k
         5aiSFJm5vkUiSWe6aChErBpUHGMdpal8SVfFWdhZeYU/J76lZZD3AE2uCzswTlPt/3v0
         hNtbVkNU6gvHadXZjG2Ltbtws0+Bpo68hrzN7FM5cFdv+nYHiIayw7HSOLQLXbBPR6su
         1TPw==
X-Gm-Message-State: AOAM530APDeETfXYLoiWSdfVNmpYJSuMJWy1Kfjc+w3SS9obJ0kIfsom
	TB5epCm4yqrka7CtdZiURnJ01WrwgPdlT4TkNJTj0/Wyris=
X-Google-Smtp-Source: 
 ABdhPJzfpDlEoxm7JiBIWl2TLZdbj9bdO7h85k9b/JKzP8gGvBr7SYutonW+PaHjwrx90CWnWrUPlYICFTOthainldM=
X-Received: by 2002:a05:6830:348b:b0:5ac:62e0:f559 with SMTP id
 c11-20020a056830348b00b005ac62e0f559mr790329otu.326.1645103602225; Thu, 17
 Feb 2022 05:13:22 -0800 (PST)
MIME-Version: 1.0
References: <20220216145314.94270-1-peron.clem@gmail.com>
 <525df22a-d452-1b1b-7e7f-4aa017e97524@gmail.com>
In-Reply-To: <525df22a-d452-1b1b-7e7f-4aa017e97524@gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Thu, 17 Feb 2022 14:13:10 +0100
Message-ID: 
 <CAJiuCccP3BTaXDeggNnS9KtocYSRYUWwf0Lujxf30OnYa_-k_g@mail.gmail.com>
Subject: Re: [meta-networking][PATCH] networking: add new netsniff-ng recipe
 version 0.6.8
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Feb 2022 13:13:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95356

Hi Khem,


On Wed, 16 Feb 2022 at 18:57, Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 2/16/22 6:53 AM, Cl=C3=A9ment P=C3=A9ron wrote:
> > Netsniff-ng is a fast zero-copy analyzer, pcap capturing and replaying =
tool.
> >
> > Actually the Makefile doesn't create the folder when installing tools, =
let's
> > add a patch to fix this.
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >   ...001-Cmds-automatically-create-folder.patch | 26 +++++++++++++
> >   .../netsniff-ng/netsniff-ng_0.6.8.bb          | 39 ++++++++++++++++++=
+
> >   2 files changed, 65 insertions(+)
> >   create mode 100644 meta-networking/recipes-support/netsniff-ng/files/=
0001-Cmds-automatically-create-folder.patch
> >   create mode 100644 meta-networking/recipes-support/netsniff-ng/netsni=
ff-ng_0.6.8.bb
> >
> > diff --git a/meta-networking/recipes-support/netsniff-ng/files/0001-Cmd=
s-automatically-create-folder.patch b/meta-networking/recipes-support/netsn=
iff-ng/files/0001-Cmds-automatically-create-folder.patch
> > new file mode 100644
> > index 000000000..e535aedf5
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/netsniff-ng/files/0001-Cmds-autom=
atically-create-folder.patch
> > @@ -0,0 +1,26 @@
> > +From 7c00d75d16da18a9998fc4cca28d3c953dd54ceb Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Cl=3DC3=3DA9ment=3D20P=3DC3=3DA9ron?=3D <peron.clem@=
gmail.com>
> > +Date: Mon, 14 Feb 2022 18:37:22 +0100
> > +Subject: [PATCH] Cmds: automatically create folder
> > +
> > +---
> > + Cmds | 3 ++-
> > + 1 file changed, 2 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/Cmds b/Cmds
> > +index e590b38..3df23b8 100644
> > +--- a/Cmds
> > ++++ b/Cmds
> > +@@ -44,7 +44,8 @@ ifeq ("$(origin PREFIX)", "$(filter $(origin PREFIX)=
, file command line)")
> > +   INSTX =3D echo -e "  INST\t$(1)" && install -d $(2) && \
> > +     install -C $(1) $(2)/$(shell basename $(1))
> > + else
> > +-  INSTX =3D echo -e "  INST\t$(1)" && install -C $(1) $(2)/$(shell ba=
sename $(1))
> > ++  INSTX =3D echo -e "  INST\t$(1)" && install -d $(2) && \
> > ++    install -C $(1) $(2)/$(shell basename $(1))
> > + endif
> > +
> > + MKDIR =3D echo -e  "  MKDIR\t$(1)" && mkdir -p $(1)
> > +--
> > +2.32.0
> > +
> > diff --git a/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.=
6.8.bb b/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb
> > new file mode 100644
> > index 000000000..cb4f03400
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb
> > @@ -0,0 +1,39 @@
> > +DESCRIPTION =3D "Netsniff-ng is a fast zero-copy analyzer, pcap captur=
ing and replaying tool"
> > +HOMEPAGE =3D "http://netsniff-ng.org"
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9dd40dfb621eed702c0775577fb=
b7011"
> > +DEPENDS =3D "libpcap"
> > +
> > +SRCREV =3D "v${PV}"
>
> Please use hardcoded git sha for SRCREV
>
> > +SRC_URI =3D " \
> > +     git://github.com/netsniff-ng/netsniff-ng.git;protocol=3Dhttps;bra=
nch=3Dmaster \
> > +     file://0001-Cmds-automatically-create-folder.patch \
> > +     "
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +# Avoids build breaks when using no-static-libs.inc
> > +DISABLE_STATIC =3D ""
>
> can this be explained a better why it fails.

Hi, sorry this was required in a previous version when I used EXTRA_OECONF.

Without this EXTRA_OECONF was automatically set to "--disable-static"
which is unrecognised by the configure script and makes the configure
step fail.

I will remove this in v2

Thanks for the catch,
Clement

>
> > +
> > +inherit pkgconfig
> > +
> > +EXTRA_OEMAKE +=3D " TERM=3D'' "
> > +
> > +PACKAGECONFIG ??=3D ""
> > +PACKAGECONFIG[zlib] =3D ",--disable-zlib,zlib,"
> > +PACKAGECONFIG[libnl] =3D ",--disable-libnl,libnl,"
> > +PACKAGECONFIG[geoip] =3D ",--disable-geoip,geoip,"
> > +
> > +do_configure() {
> > +    ./configure --prefix=3D${prefix}
> > +}
> > +
> > +do_compile() {
> > +    oe_runmake
> > +}
> > +
> > +do_install() {
> > +    oe_runmake DESTDIR=3D${D} netsniff-ng_install
> > +}
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"

