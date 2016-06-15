Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id A9954601A4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2016 07:11:49 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id m124so3510419wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2016 00:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=JG3hYCMYL2S1ceS75wjVLx/VdRD6HBT0ulGh6QaJp78=;
	b=hxGW3kL/z3ehNKtGm+xrGv0zPn7MC+HJqYRpdOosgK088b8rJ4X1iMnhyQcGRccE3Q
	MNlkYfKcwOPAwLKpVQsN2kcLIwj0v1PX55QqlRJggLMm7ybfrl5orJOeplTZxZ2vQDHu
	A702LXldKLueZO0I9xhlz5eYKydppIDxKZaJW4lcQopZalc7Ah9YBZwpuEy0n6KaTgau
	+c0YvdkjYepkTxqn7a2JMp319OIl/GEEQj1z6TAuPRGB6DiRKMZiSxl3CybHv0ITQhJy
	hvCcmTesaWFxoKwvwdJRlCiyUDhmYIINJ7vcw0PCmDFuusQILWglOpulkedaUOgjaNYT
	aPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=JG3hYCMYL2S1ceS75wjVLx/VdRD6HBT0ulGh6QaJp78=;
	b=aPo739dNGOZJfJdTwjeaqIVWfTR8ANtOWwf043J3A2HRzCOeTvkkpcPP8YyucaXzhW
	xS65ilpC3H6mv7UCwJOP63fl1jX4uCyTyhs0hEVQ1Ah1DtjCIoZrhyy+e9vAsZwEBZm6
	mx2CObKw+MpceO212JeU0ZFAlUjYOF5acOywYcjyrExPOlhbdqBFQSX5tJ+EsmtEL8k9
	jFJvY63awaYI0BbUyE+jV902jEAU5mUIsuLdOZUa6HgCZiSk+ooMSdkl8nkLjLxuPK30
	Qm+MEv8WPdVfIn1iY6LSWTpeldY4SnkV8SLggtGoSQSz/e1ikx8NJGQKTN+iSHcN+1T3
	pEew==
X-Gm-Message-State: ALyK8tIqn+b+0CWOAGf5Jl/DfyF+ONpVyoYYBTlOHhTQZaQ0mWyxIReCVhghWlA6Etg90Q==
X-Received: by 10.28.184.77 with SMTP id i74mr8617640wmf.66.1465974710144;
	Wed, 15 Jun 2016 00:11:50 -0700 (PDT)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by smtp.gmail.com with ESMTPSA id f73sm946156wmg.1.2016.06.15.00.11.48
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Jun 2016 00:11:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1465956740-84841-2-git-send-email-henry@kittyhawk.aero>
Date: Wed, 15 Jun 2016 09:11:47 +0200
Message-Id: <D56F5A73-035E-4C81-9CEE-F23311639B42@dominion.thruhere.net>
References: <CA+chaQe1rcKeNpny-bpghrLtz8eOpghos9jBPf95obvbC8ucuw@mail.gmail.com>
	<1465956740-84841-1-git-send-email-henry@kittyhawk.aero>
	<1465956740-84841-2-git-send-email-henry@kittyhawk.aero>
To: Henry Hallam <henry@kittyhawk.aero>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH v2] chrony: Versatile implementation of NTP
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
X-List-Received-Date: Wed, 15 Jun 2016 07:11:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> Op 15 jun. 2016, om 04:12 heeft Henry Hallam <henry@kittyhawk.aero> =
het volgende geschreven:
>=20
> From: Henry Hallam <henry@pericynthion.org>

[..]

> +DEPENDS =3D "pps-tools"
> +# It's probably a bad idea to run chrony and ntpd on the same system.
> +RCONFLICTS_${PN} =3D =E2=80=9Cntp"

The rule of thumb is to put variables where there are used, so R* go =
below do_install since they affect packaging.

> +
> +SRC_URI =3D =
"https://download.tuxfamily.org/chrony/chrony-${PV}.tar.gz \
> +	   file://chrony.conf \
> +	   file://chronyd"
> +
> +SRC_URI[md5sum] =3D "d0598aa8a9be8faccef9386f6fc0d5f2"
> +SRC_URI[sha256sum] =3D =
"8d04e7cda2333289c2104b731d39c3c1db94816e43bae35d7ee4e7ae8af6391f"
> +
> +# Note: Despite being built via './configure; make; make install',
> +#       chrony does not use GNU Autotools.
> +inherit update-rc.d systemd
> +
> +CONFFILES_${PN} =3D "${sysconfdir}/chrony.conf"
> +
> +INITSCRIPT_NAME =3D "chronyd"
> +INITSCRIPT_PARAMS =3D "defaults"
> +
> +SYSTEMD_PACKAGES =3D "${PN}"
> +SYSTEMD_SERVICE_${PN} =3D =E2=80=9Cchronyd.service"

The same CONFFILES/INITSCRIPT*/SYSTEMD_*, below do_install

> +
> +# Configuration options:
> +# - For command line editing support in chronyc, you may specify =
either
> +#   'editline' or 'readline' but not both.  editline is smaller, but
> +#   many systems already have readline for other purposes so you =
might want
> +#   to choose that instead.  However, beware license incompatibility
> +#   since chrony is GPLv2 and readline versions after 6.0 are GPLv3+.
> +#   You can of course choose neither, but if you're that tight on =
space
> +#   consider dropping chronyc entirely (you can use it remotely with
> +#   appropriate chrony.conf options).
> +# - Security-related:
> +#   - 'sechash' is omitted by default because it pulls in nss which =
is huge.
> +#   - 'privdrop' allows chronyd to run as non-root; would need =
changes to
> +#     chrony.conf and init script.
> +#   - 'scfilter' enables support for system call filtering, but =
requires the
> +#     kernel to have CONFIG_SECCOMP enabled.
> +PACKAGECONFIG ??=3D "editline scfilter"
> +PACKAGECONFIG[readline] =3D =
"--without-editline,--without-readline,readline"
> +PACKAGECONFIG[editline] =3D ",--without-editline,libedit"
> +PACKAGECONFIG[sechash] =3D "--without-tomcrypt,--disable-sechash,nss"
> +PACKAGECONFIG[privdrop] =3D ",--disable-privdrop,libcap"
> +PACKAGECONFIG[scfilter] =3D "--enable-scfilter,--without-seccomp"
> +
> +# --disable-static isn't supported by chrony's configure script.
> +DISABLE_STATIC =3D ""
> +
> +PACKAGES +=3D "chronyc"
> +FILES_${PN} =3D "${sbindir}/chronyd ${sysconfdir} ${localstatedir}"
> +FILES_chronyc =3D "${bindir}/chronyc=E2=80=9D

Change that to:

PACKAGES =3D+ =E2=80=9Cchronyc"
FILES_chronyc =3D "${bindir}/chronyc=E2=80=9D

And move those below do_install

The recipe looks good to me beside the points mentioned.

regards,

Koen

> +
> +do_configure() {
> +    ./configure --sysconfdir=3D${sysconfdir} --bindir=3D${bindir} =
--sbindir=3D${sbindir} \
> +                --localstatedir=3D${localstatedir} =
--datarootdir=3D${datadir} \
> +                ${EXTRA_OECONF}
> +}
> +
> +do_install() {
> +    # Binaries
> +    install -d ${D}${bindir}
> +    install -m 0755 ${S}/chronyc ${D}${bindir}
> +    install -d ${D}${sbindir}
> +    install -m 0755 ${S}/chronyd ${D}${sbindir}
> +
> +    # Config file
> +    install -d ${D}${sysconfdir}
> +    install -m 644 ${WORKDIR}/chrony.conf ${D}${sysconfdir}
> +
> +    # System V init script
> +    install -d ${D}${sysconfdir}/init.d
> +    install -m 755 ${WORKDIR}/chronyd ${D}${sysconfdir}/init.d
> +   =20
> +    # Systemd unit
> +    install -d ${D}${systemd_unitdir}/system
> +    install -m 0644 ${S}/examples/chronyd.service =
${D}${systemd_unitdir}/system/
> +   =20
> +    # Variable data (for drift file)
> +    install -d ${D}${localstatedir}/lib/chrony
> +
> +    # Log files
> +    install -d ${D}${localstatedir}/log/chrony
> +
> +    # Fix hard-coded paths in config files and init scripts
> +    sed -i -e 's!/var/!${localstatedir}/!g' -e =
's!/etc/!${sysconfdir}/!g' \
> +           -e 's!/usr/sbin/!${sbindir}/!g' -e =
's!/usr/bin/!${bindir}/!g' \
> +           ${D}${sysconfdir}/chrony.conf \
> +           ${D}${sysconfdir}/init.d/chronyd \
> +           ${D}${systemd_unitdir}/system/chronyd.service
> +    sed -i =
's!^PATH=3D.*!PATH=3D${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!'=
 ${D}${sysconfdir}/init.d/chronyd
> +    sed -i =
's!^EnvironmentFile=3D.*!EnvironmentFile=3D-${sysconfdir}/default/chronyd!=
' ${D}${systemd_unitdir}/system/chronyd.service
> +}
> --=20
> 2.8.1
>=20


