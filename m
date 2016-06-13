Return-Path: <pespin.shar@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 22BD360767
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jun 2016 22:22:03 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id w130so9254649lfd.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jun 2016 15:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=7ERen9HHDAs15/7ckx1UF4lOkybpSdE/BAN7w/eZYZM=;
	b=UAjIkvKKNevG4kCdpdMtSGQWC3q2LeOjG2BRVFul0SZJTO6VKpM0PEpo+01Nq9nlJX
	XKPrAfKLZhVAaV/mx3ezyXDKodEz90bwAWVcFJ00MjpgK8+hfEIm2Ms6LK6OBmLxU/dT
	mmlIiDEDqFXRGDnd8744hUQvSRGf+rAFGBpkuzOhis8oGQ3OcOMcuJKQS+Ft3FXZNyOk
	MpAkBIDCdqdvWvD+i5MdamD6OstKDi9RrzDWiRoUJvqz4nwtAyUI59Uac1okE63v1r9Y
	T8HMTGJ0jSMoz2ZZJ/qzW0BGMLkBgeORDDQIUhDXehO7qBPc6yUsfYJHigGGUY97AywA
	Rfmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=7ERen9HHDAs15/7ckx1UF4lOkybpSdE/BAN7w/eZYZM=;
	b=MK7DaDP9KiPwn/Z6b7kTOj9mVDWTWWopXCNoYj1urbsN7kwGvNSME3giA1bPe0M4kn
	04ipVe9X1BeqRxzDhUIhuXo1AiPWZWbSCwOrlHH4U53X4yA5wpzCuk0Gw7jZ/V+eO7Ja
	D14ZHSnbD5TzgCamSH238b9AIGAqUzqRiUjM/8x1+mFwqXdllO9elu532W7HnG3X+8Qp
	wigKiCZ/pZWlQfanBKIrodYuHnezSiE+gVU2SszdMERQ9GiFbu8HN166sz0JIaYvGhSP
	fHxxFHjKNj6qBnmLmiztJwJh8kIn9qaiG+W7elyO99wjW0PMixAyHMgUKsPR4VM38k5z
	F4QQ==
X-Gm-Message-State: ALyK8tKCJT7cqMYtJb24aZ66555mm9ZZcWi1+041119055ZJ4quUX3dHFuV5mPp9O1uCKtj4c5O5X6R8y1WlFw==
X-Received: by 10.25.21.32 with SMTP id l32mr721234lfi.229.1465856523008; Mon,
	13 Jun 2016 15:22:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.162.68 with HTTP; Mon, 13 Jun 2016 15:22:02 -0700 (PDT)
In-Reply-To: <20160613203211.GC2580@jama>
References: <1465355197-28010-1-git-send-email-wenzong.fan@windriver.com>
	<20160613203211.GC2580@jama>
From: Pau Espin Pedrol <pespin.shar@gmail.com>
Date: Tue, 14 Jun 2016 00:22:02 +0200
Message-ID: <CAEGpDuaUm6oiZjfEwp0GD2gCsBa++naDaCRuwk3h3=Q2skB4Bg@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH][meta-oe] krb5: add systemd support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Jun 2016 22:22:04 -0000
Content-Type: text/plain; charset=UTF-8

Hi, could you please use "${D}${systemd_system_unitdir}/XYZ.service"
instead of "${D}${systemd_unitdir}/system/XYZ.service" in here?

Pau Espin Pedrol
mail/jabber: pespin.shar@gmail.com
http://blog.espeweb.net

2016-06-13 22:32 GMT+02:00 Martin Jansa <martin.jansa@gmail.com>:

> On Tue, Jun 07, 2016 at 11:06:37PM -0400, wenzong.fan@windriver.com wrote:
> > From: Wenzong Fan <wenzong.fan@windriver.com>
> >
> > Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> > ---
> >  .../krb5/krb5/krb5-admin-server.service            | 14 +++++++++++
> >  .../krb5/krb5/krb5-kdc.service                     | 13 ++++++++++
> >  meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb   | 29
> +++++++++++++++-------
> >  3 files changed, 47 insertions(+), 9 deletions(-)
> >  create mode 100644
> meta-oe/recipes-connectivity/krb5/krb5/krb5-admin-server.service
> >  create mode 100644
> meta-oe/recipes-connectivity/krb5/krb5/krb5-kdc.service
> >
> > diff --git
> a/meta-oe/recipes-connectivity/krb5/krb5/krb5-admin-server.service
> b/meta-oe/recipes-connectivity/krb5/krb5/krb5-admin-server.service
> > new file mode 100644
> > index 0000000..1b42716
> > --- /dev/null
> > +++ b/meta-oe/recipes-connectivity/krb5/krb5/krb5-admin-server.service
> > @@ -0,0 +1,14 @@
> > +[Unit]
> > +Description=MIT Kerberos KDC administrative daemon
> > +After=syslog.target network.target
> > +ConditionPathExists=/etc/krb5.conf
> > +
> > +[Service]
> > +Type=forking
> > +ExecStartPre=/bin/sh -c "test ! -f /var/log/kadmind.log || test ! -x
> /sbin/restorecon || /sbin/restorecon -F /var/log/kadmind.log"
> > +ExecStart=/usr/sbin/kadmind
> > +SuccessExitStatus=1 2 SIGKILL
> > +TimeoutStopSec=30
> > +
> > +[Install]
> > +WantedBy=multi-user.target
> > diff --git a/meta-oe/recipes-connectivity/krb5/krb5/krb5-kdc.service
> b/meta-oe/recipes-connectivity/krb5/krb5/krb5-kdc.service
> > new file mode 100644
> > index 0000000..d5e5a95
> > --- /dev/null
> > +++ b/meta-oe/recipes-connectivity/krb5/krb5/krb5-kdc.service
> > @@ -0,0 +1,13 @@
> > +[Unit]
> > +Description=MIT Kerberos KDC
> > +After=syslog.target network.target
> > +ConditionPathExists=/etc/krb5.conf
> > +
> > +[Service]
> > +Type=forking
> > +ExecStart=/usr/sbin/krb5kdc
> > +SuccessExitStatus=1 2 SIGKILL
> > +TimeoutStopSec=30
> > +
> > +[Install]
> > +WantedBy=multi-user.target
> > diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
> b/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
> > index 0c566cb..d60e332 100644
> > --- a/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
> > +++ b/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
> > @@ -17,7 +17,7 @@ LICENSE = "MIT"
> >  LIC_FILES_CHKSUM =
> "file://${S}/../NOTICE;md5=f64248328d2d9928e1f04158b5243e7f"
> >  DEPENDS = "ncurses util-linux e2fsprogs e2fsprogs-native"
> >
> > -inherit autotools-brokensep binconfig perlnative
> > +inherit autotools-brokensep binconfig perlnative systemd
> >
> >  SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
> >  SRC_URI = "
> http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}-signed.tar \
> > @@ -32,6 +32,8 @@ SRC_URI = "
> http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}-signed.tar
> >             file://etc/init.d/krb5-admin-server \
> >             file://etc/default/krb5-kdc \
> >             file://etc/default/krb5-admin-server \
> > +           file://krb5-kdc.service \
> > +           file://krb5-admin-server.service \
> >             file://krb5-CVE-2016-3119.patch;striplevel=2 \
> >
>  file://0001-Work-around-uninitialized-warning-in-cc_kcm.c.patch;striplevel=2
> \
> >  "
> > @@ -40,6 +42,9 @@ SRC_URI[sha256sum] =
> "e528c30b0209c741f6f320cb83122ded92f291802b6a1a1dc1a01dcdb3
> >
> >  S = "${WORKDIR}/${BP}/src"
> >
> > +SYSTEMD_SERVICE_${PN} = "krb5-admin-server.service krb5-kdc.service"
> > +SYSTEMD_AUTO_ENABLE = "disable"
> > +
> >  PACKAGECONFIG ??= "openssl"
> >  PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
> >  PACKAGECONFIG[openssl] = "--with-pkinit-crypto-impl=openssl,,openssl"
> > @@ -79,20 +84,26 @@ do_configure() {
> >  }
> >
> >  do_install_append() {
> > -    mkdir -p ${D}/${sysconfdir}/init.d ${D}/${sysconfdir}/default
> > -    install -m 0755 ${WORKDIR}/etc/init.d/* ${D}/${sysconfdir}/init.d
> > -    install -m 0644 ${WORKDIR}/etc/default/* ${D}/${sysconfdir}/default
> > -
> >      rm -rf ${D}/${localstatedir}/run
> > -    mkdir -p ${D}/${sysconfdir}/default/volatiles
> > -    echo "d root root 0755 ${localstatedir}/run/krb5kdc none" \
> > -           > ${D}${sysconfdir}/default/volatiles/87_krb5
> > +
> > +    if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false',
> d)}; then
>
> Don't use base_contains
>
> Did you test this change in master? You would see this note:
>
> NOTE:
> /OE/build/oe-core/meta-openembedded/meta-oe/recipes-connectivity/krb5/
> krb5_1.13.2.bb: base_contains is deprecated, please use bb.utils.contains
> instead.
>
> > +        mkdir -p ${D}/${sysconfdir}/init.d ${D}/${sysconfdir}/default
> > +        install -m 0755 ${WORKDIR}/etc/init.d/*
> ${D}/${sysconfdir}/init.d
> > +        install -m 0644 ${WORKDIR}/etc/default/*
> ${D}/${sysconfdir}/default
> > +
> > +        mkdir -p ${D}/${sysconfdir}/default/volatiles
> > +        echo "d root root 0755 ${localstatedir}/run/krb5kdc none" \
> > +              > ${D}${sysconfdir}/default/volatiles/87_krb5
> > +    fi
> >      if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true',
> 'false', d)}; then
> >          install -d ${D}${sysconfdir}/tmpfiles.d
> >          echo "d /run/krb5kdc - - - -" \
> >                > ${D}${sysconfdir}/tmpfiles.d/krb5.conf
> > -    fi
> >
> > +        install -d ${D}${systemd_unitdir}/system
> > +        install -m 0644 ${WORKDIR}/krb5-admin-server.service
> ${D}${systemd_unitdir}/system
> > +        install -m 0644 ${WORKDIR}/krb5-kdc.service
> ${D}${systemd_unitdir}/system
> > +    fi
> >  }
> >
> >  pkg_postinst_${PN} () {
> > --
> > 2.8.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

