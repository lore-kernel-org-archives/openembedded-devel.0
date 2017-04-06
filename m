Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 07A747760E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Apr 2017 07:24:16 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id t20so8628913wra.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Apr 2017 00:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iP1jyo7IIHloHrEtn4x2JzlXTZslNokN/LucQGE0VVw=;
	b=lvdghpNc0K+JZ8PIMKXzVmpgwfbSWrUuoEtPo8JMJHF6EjwCzfEO3crO3i3EtK1OS0
	U/2OhXAw8DtB0H6Y7lWWSvrdAAO0y9ZOj6royIACwFB77mFErbdhwzLkfGgs50p8MTHe
	G5UrABqDeho9newwoLe/KNLMVGC/lXOnO1KpNiiem+xEIPaEKTj86o0DqRb8U/pp1c+k
	1lCh8mgDJifx+Ol+p9YMWjLcrq5NoMRyew1hwU8zIGnTlk7AM2B/atbftKFbpetFrqtD
	riXRJaq4xp8W+JpL4qO9KQqgAgp0FnpY1jTMZoRFPl4nHNPOvE7bvbdAFNthVTOz0DN/
	0Gyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iP1jyo7IIHloHrEtn4x2JzlXTZslNokN/LucQGE0VVw=;
	b=dlUR0TWeZTKPNsumSZFYI2opmCGKla9tdjMxGdWgrFE6+ILw6wxtm8r3KXGeVelqS5
	poJJhWfC0VDulsaotSwnQq01e7jK/qeu6833R/tT/d6aDm2hF2mB3uz24d3jWqxdlU4k
	JiGeUwWBO3RkfAJVKLa2S5EV+u6hvsoC8CkGDhVyL+XCHneeQG27d1WCKNQeg26tajWE
	6D7pE4pZiBA1egYy27frNh4eHreQRY5+IyW7XUm3hmVruxcPxyl8trjyMgJGtY9iPCFu
	zKk530qVqwjb5dtoa3YAS+wwjCIiosRUPWs3J04nnq+FYuKIhSLWOhZK/8vKJ5BJE7UM
	XzFw==
X-Gm-Message-State: AFeK/H19TlJhc+fuiq2pr7ps6CbQMvLA8KhwjMbdH/WiiKVVQBI46JRj7dTFKGyH4yixd1tJ4lhN+nojM5UYcQ==
X-Received: by 10.28.103.84 with SMTP id b81mr22337192wmc.124.1491463457861;
	Thu, 06 Apr 2017 00:24:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Thu, 6 Apr 2017 00:24:17 -0700 (PDT)
In-Reply-To: <CA+M3ks5hiM0JU6aUaVG7vbsjZGninS6y9qQHT-ObuGXv4USUPQ@mail.gmail.com>
References: <1491396806-3521-1-git-send-email-benjamin.gaignard@linaro.org>
	<20170405184114.GC3301@jama>
	<CA+M3ks5hiM0JU6aUaVG7vbsjZGninS6y9qQHT-ObuGXv4USUPQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 6 Apr 2017 09:24:17 +0200
Message-ID: <CA+chaQdkQaCs=k3ffET6VScpicFZBs1PTbRr0P8QEsr8G1JWWg@mail.gmail.com>
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] tinyproxy: Add recipe
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
X-List-Received-Date: Thu, 06 Apr 2017 07:24:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

It also fails to configure:
http://errors.yoctoproject.org/Errors/Details/139078/

On Thu, Apr 6, 2017 at 6:46 AM, Benjamin Gaignard <
benjamin.gaignard@linaro.org> wrote:

> 2017-04-05 20:41 GMT+02:00 Martin Jansa <martin.jansa@gmail.com>:
> > On Wed, Apr 05, 2017 at 02:53:26PM +0200, Benjamin Gaignard wrote:
> >> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> >> ---
> >>  .../tinyproxy/tinyproxy/tinyproxy.service          | 14 ++++++++++
> >>  .../recipes-support/tinyproxy/tinyproxy_1.8.4.bb   | 32
> ++++++++++++++++++++++
> >>  2 files changed, 46 insertions(+)
> >>  create mode 100644 meta-networking/recipes-
> support/tinyproxy/tinyproxy/tinyproxy.service
> >>  create mode 100644 meta-networking/recipes-support/tinyproxy/
> tinyproxy_1.8.4.bb
> >>
> >> diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyp=
roxy.service
> b/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service
> >> new file mode 100644
> >> index 0000000..800d2ad
> >> --- /dev/null
> >> +++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/
> tinyproxy.service
> >> @@ -0,0 +1,14 @@
> >> +[Unit]
> >> +Description=3DTinyproxy, Lightweight http(s) proxy daemon
> >> +RequiresMountsFor=3D/var
> >> +
> >> +[Service]
> >> +User=3Droot
> >> +ExecStartPre=3D/bin/mkdir -p /var/log/tinyproxy
> >> +ExecStartPre=3D/bin/chown -R nobody.adm /var/log/tinyproxy
> >> +ExecStartPre=3D/bin/mkdir -p /var/run/tinyproxy
> >> +ExecStartPre=3D/bin/chown -R nobody.adm /var/run/tinyproxy
> >> +ExecStart=3D/usr/sbin/tinyproxy -d
> >> +
> >> +[Install]
> >> +WantedBy=3Dmulti-user.target
> >> diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.
> 8.4.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
> >> new file mode 100644
> >> index 0000000..76cec63
> >> --- /dev/null
> >> +++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
> >> @@ -0,0 +1,32 @@
> >> +SUMMARY =3D "Lightweight http(s) proxy daemon"
> >> +HOMEPAGE =3D "https://tinyproxy.github.io/"
> >> +LICENSE =3D "GPLv2"
> >> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa=
882b
> be"
> >> +
> >> +SRC_URI =3D "https://github.com/tinyproxy/tinyproxy/releases/download=
/1.
> 8.4/tinyproxy-${PV}.tar.gz"
> >
> > Use ${PV} for 2nd 1.8.4 as well.
> >
> > You can also replace "tinyproxy-${PV}" with just "${BP}" and tinyproxy
> > with ${BPN}"
>
> I will do that in version 2
>
> >
> >> +SRC_URI +=3D "file://tinyproxy.service"
> >> +
> >> +SRC_URI[md5sum] =3D "3b60f7d08e0821ed1a3e2cf1e5778cac"
> >> +SRC_URI[sha256sum] =3D "8234c879a129feee61efa98bac14a1
> a3e46e5cf08f01696a216940872aa70faf"
> >> +
> >> +EXTRA_OECONF +=3D " \
> >> +     --enable-filter \
> >> +     --enable-transparent \
> >> +     --disable-regexcheck \
> >> +     --enable-reverse \
> >> +     --enable-upstream \
> >> +     --enable-xtinyproxy \
> >> +     "
> >> +
> >> +inherit autotools systemd
> >> +
> >> +SYSTEMD_PACKAGES +=3D "${PN}"
> >> +SYSTEMD_SERVICE_${PN} =3D "tinyproxy.service"
> >> +SYSTEMD_AUTO_ENABLE_${PN} =3D "enable"
> >> +
> >> +do_install_append() {
> >> +     install -d ${D}${systemd_system_unitdir}
> >> +     install -m 0644 ${WORKDIR}/tinyproxy.service
> ${D}${systemd_system_unitdir}
> >
> > IIRC this should respect systemd in DISTRO_FEATURES.
> >
>
> I will test if systemd is in DISTRO_FEATURES before installing the file.
>
> Thanks
>
> >> +}
> >> +
> >> +FILES_${PN} =3D+ "${systemd_system_unitdir}/tinyproxy.service"
> >> --
> >> 1.9.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
>
>
> --
> Benjamin Gaignard
>
> Graphic Study Group
>
> Linaro.org =E2=94=82 Open source software for ARM SoCs
>
> Follow Linaro: Facebook | Twitter | Blog
>

