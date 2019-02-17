Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
	[209.85.222.173])
	by mail.openembedded.org (Postfix) with ESMTP id 146667C6A1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Feb 2019 20:21:15 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id w204so8905447qka.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Feb 2019 12:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WzhW8j+PrTct0e2PmGaUOM33KRKGsjB1K1OJ0bbSMQ4=;
	b=izlxV1+qC5Qw1xZR+/fVL8uzIIrsLLvRH6vTc86dJi9xWY2a+1IDB57qbAqBegdip0
	1WwWIQS3QgZe9+VIPo9Vusu7tZ3Iync7I/grry598YMUrt1twj8aDhoFnNw/GCAwoES7
	iqzudcKa+x7oQMd25iLkQELCHlmugSNlgKV0r5fvWxhxaU77NfXAhf/6JtCrJtsAsmTc
	n63UPY2o07/tyVi1WCJkAhHuBfRDG9euMQppRyozd5hAT0W08OWtEPLBqXwCdvoGt7Wp
	G2+PTAKzJmvHVeDK25fhEJnlvJiMVXMJRlFlUbtrZ4XLa1yXR8hAqc20V5ywc7SNlDCB
	KPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WzhW8j+PrTct0e2PmGaUOM33KRKGsjB1K1OJ0bbSMQ4=;
	b=ruzfaIiSHki7r6kJ++caMjXuozrc8Ki7zBc1X3EBORgaDL2BRBRsRwM77vlL8PXym/
	JwmgC0YxSEY1XW8iv/visVwveLRWwHd+JUjfrQEOuxZ7suTZBDljeEE/eXws0xcLEEtz
	QNnPl6EoJ3+xPP+4s2LhNJytSQw8cGLmfBvKvLOXvAyPhzsvvIZQ5GJPuulWyACkq1cQ
	g5JzZjPWwaHmZ/SFXf4ZT9UnpAy+k07wj4KwzogWFHaVO3ntZhNCG6oIhhv+h98v2Z0/
	MCEMbyGt2TU/xOdxyavX4tDxL2MAK/XjO18F1JbQ2gLtDIcZg09nnVo7jFB4RpIECW/j
	cTLQ==
X-Gm-Message-State: AHQUAuZ6myK93YfsnyggNUX8PgSzErPNQNQX9clngL+VjAOAjgNTXOXK
	fY0h3PBM9sspO/c50qn72GP3ikxhGURh7wGfRz0=
X-Google-Smtp-Source: AHgI3IaJfF4DnJISbLnPgh1D5h8QWNlIBcaVXgQ7zJkMYGjDBVxlu/GtKVBRXIEVzyj1kDWzr125ItZJFq7LlpJFFE0=
X-Received: by 2002:a37:9585:: with SMTP id
	x127mr14448511qkd.315.1550434876704; 
	Sun, 17 Feb 2019 12:21:16 -0800 (PST)
MIME-Version: 1.0
References: <20190215014113.52315-1-wak@google.com>
	<CAMKF1sqT-TRTXdzPA=-abmMrBE0X2PrW9J9pECNNckm7C0Y7sQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqT-TRTXdzPA=-abmMrBE0X2PrW9J9pECNNckm7C0Y7sQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 17 Feb 2019 12:20:50 -0800
Message-ID: <CAMKF1srKaGvor6bnAra5gwWU61Rrf45tQffKuPGQ3YG2Qzk6DA@mail.gmail.com>
To: "William A. Kennington III" <wak@google.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] dbus-broker: 16 -> 17
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
X-List-Received-Date: Sun, 17 Feb 2019 20:21:16 -0000
Content-Type: text/plain; charset="UTF-8"

here is full build error

https://errors.yoctoproject.org/Errors/Details/228429/

On Sun, Feb 17, 2019 at 12:04 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Fails with musl/qemux86
>
> | [45/177] /home/jenkins/oe/world/yoe/build/tmpfs/work/i586-yoe-linux-musl/dbus-broker/17-r0/recipe-sysroot-native/usr/bin/meson
> --internal symbolextractor subprojects/c-utf8/src/libcutf8.so.0
> 'subprojects/c-utf8/src/8c544e0@@cutf8@sha/libcutf8.so.0.symbols'
> --cross-host=linux-musl
> | ninja: build stopped: subcommand failed.
>
>
> On Thu, Feb 14, 2019 at 5:41 PM William A. Kennington III via
> Openembedded-devel <openembedded-devel@lists.openembedded.org> wrote:
> >
> > This change cleans up a number of things about the build
> >  - Upstream no longer depends on glib
> >  - We dont ever runtime depend on reference dbus
> >  - Docs are disabled by default so we don't need to specify the option
> >  - There is no native tooling so we shouldn't need a native bbclass
> >  - No longer depend on gitsm since upstream provides release tarballs
> >
> > Signed-off-by: William A. Kennington III <wak@google.com>
> > ---
> >  .../{dbus-broker_git.bb => dbus-broker_17.bb}   | 17 +++--------------
> >  1 file changed, 3 insertions(+), 14 deletions(-)
> >  rename meta-oe/recipes-core/dbus/{dbus-broker_git.bb => dbus-broker_17.bb} (60%)
> >
> > diff --git a/meta-oe/recipes-core/dbus/dbus-broker_git.bb b/meta-oe/recipes-core/dbus/dbus-broker_17.bb
> > similarity index 60%
> > rename from meta-oe/recipes-core/dbus/dbus-broker_git.bb
> > rename to meta-oe/recipes-core/dbus/dbus-broker_17.bb
> > index ac0f325a4..e940bb656 100644
> > --- a/meta-oe/recipes-core/dbus/dbus-broker_git.bb
> > +++ b/meta-oe/recipes-core/dbus/dbus-broker_17.bb
> > @@ -6,18 +6,12 @@ SECTION = "base"
> >  LICENSE = "Apache-2.0"
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=7b486c2338d225a1405d979ed2c15ce8"
> >
> > -DEPENDS = "dbus glib-2.0 expat"
> > -
> > -PV = "16+git${SRCPV}"
> > -SRCREV = "fc874afa0992d0c75ec25acb43d344679f0ee7d2"
> > -
> > -SRC_URI = "gitsm://github.com/bus1/dbus-broker;protocol=git"
> > -
> > -S = "${WORKDIR}/git"
> > +SRC_URI = "https://github.com/bus1/dbus-broker/releases/download/v${PV}/dbus-broker-${PV}.tar.xz"
> > +SRC_URI[sha256sum] = "4ec7491745a88ec5112644b0e2b9a0abe9107c85d7650be8988d88efb52da84b"
> >
> >  inherit meson pkgconfig systemd distro_features_check
> >
> > -EXTRA_OEMESON += "-Ddocs=false"
> > +DEPENDS = "expat systemd"
> >
> >  REQUIRED_DISTRO_FEATURES = "systemd"
> >
> > @@ -25,8 +19,3 @@ SYSTEMD_SERVICE_${PN} = "${BPN}.service"
> >
> >  FILES_${PN} += "${systemd_system_unitdir}"
> >  FILES_${PN} += "${systemd_user_unitdir}"
> > -
> > -RDEPENDS_${PN} = "dbus"
> > -
> > -BBCLASSEXTEND = "native"
> > -
> > --
> > 2.20.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

