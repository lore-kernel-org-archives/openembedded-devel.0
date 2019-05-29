Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id E04077DED3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2019 09:12:50 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id k24so1635671qtq.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2019 02:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+VQNaP+hlfN6XQb/WZvpW6uLxPygwq2+WrSOFCqYI8A=;
	b=p5TOqJxLZ35eArqpzXYcP40Bu7a51aMvZqx3PJGjK0EB2FcM+OoWaPfcvnIOCdOKg3
	yDpsx/qK8hvJBVqE7AYD3CXnxLUe6NBaf0B5c2NU4Zx8wGgOXHygP1aBdrLVDUl+HMES
	t4GPs0HyOZivgUsg6lvWyZXk3X3wGcBJsA/Jp7ntC+MRRxpBu54LgL+oOADCDOXoGOhq
	Y6fv7QmKgVr1rdXOtEqoZ383fNs3xtGtJO+x7MqdqSfGpYrrDQUngbAiiguqOKz4K3Rs
	lQOGLoXW0bZNc/cTmmhSNV6XvxdLGPwgRP0nW7ZUcwgDt3K7TIZF5AX6Jf74cLVYtYWm
	Ghjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+VQNaP+hlfN6XQb/WZvpW6uLxPygwq2+WrSOFCqYI8A=;
	b=o2BoCPysyYvK9aS/YMK4sDlaYqkDWcRrL4h7fXJGUG3/5KZLX9E+J8q9eZ9iIjTgJR
	U6E84xSh6WImiVnBJpv98k7k/vVmyY3a80wGokk2z94fV9vS4Sbf7aTkW6DHiy1P/E5Q
	5ZUvIqsmE4VBrCb3WRfH2sLZ5vjn0sLcgQseO3EbJlcgtktT30h4TSmoQjHNOg4xX+oY
	cdP3cJOxXX4KISawyDLbjSyGgZHGsh13oQjp+BLwfzjIkmJgAJ7h24wkJ6F7vwx6HZGB
	Oui6JQCZF0zAsZKWxRY2lDpfAoxIzw3nOk/lAmNwfPK1yqHSJQq6LpZj1gefnSX/iCg4
	snoQ==
X-Gm-Message-State: APjAAAXKNdqUbwV7WOI4UqhO7yp02W4rbWmerRlMcevy89IzZcgPs/lz
	KW4gYUQLdHrVRGhsGDmDHI6VZU2d6NscikFcm/s7ZOSIyPI=
X-Google-Smtp-Source: APXvYqxi+Ox8f1jF4rqqLpxBr2sF+WoEZ7noL+HHQhAuOi2M+Ue2JuFgzbvLQM5dPPnBjwBlEizrifEvluBCPlYBkjk=
X-Received: by 2002:ac8:6b06:: with SMTP id w6mr3273176qts.80.1559121171491;
	Wed, 29 May 2019 02:12:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190427213551.14485-1-beniamin.sandu@gmail.com>
	<20190429005330.GH31207@bill-the-cat>
	<54b42f72-dba5-4c7e-7ff5-802e03285cd0@gmail.com>
	<20190429111639.GI31207@bill-the-cat>
	<6500bb24-f559-1a19-8b9f-896d3d71620e@gmail.com>
	<d4e80b44-4724-9cf4-4bc8-4e1a579e4237@gmail.com>
In-Reply-To: <d4e80b44-4724-9cf4-4bc8-4e1a579e4237@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 May 2019 11:12:25 +0200
Message-ID: <CAMKF1sp1rHcRHVA6Btkq3gX_OgY+zXtt3sxY=7Ys7ABip6x4Kw@mail.gmail.com>
To: Ben <beniaminsandu@gmail.com>
Cc: Tom Rini <trini@konsulko.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Beniamin Sandu <beniamin.sandu@gmail.com>
Subject: Re: [meta-networking][PATCH] unbound: create recipe for version 1.9.1
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
X-List-Received-Date: Wed, 29 May 2019 09:12:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 28, 2019 at 8:33 PM Ben <beniaminsandu@gmail.com> wrote:
>
> Hi,
>
> I got back to this and updated the recipe. Problem is the sysvinit
> script/systemd service file that come from the original package, don't
> work out of the box, they both require tinkering.
>
> What is the best "oe approach" for this? Do we ship new files that work
> with our bitbake package? Is the end user supposed to adapt the config
> files to the needed environment?

Generate the diff on top of provided scripts and submit patch upstream
to the package developers
and a patch to OE as well.

>
> Cheers,
>
> Beni
>
> On 29.04.2019 14:25, Ben wrote:
> > On 4/29/19 2:16 PM, Tom Rini wrote:
> >
> >> On Mon, Apr 29, 2019 at 02:09:08PM +0300, Ben wrote:
> >>> On 4/29/19 3:53 AM, Tom Rini wrote:
> >>>> On Sun, Apr 28, 2019 at 12:35:51AM +0300, Beniamin Sandu wrote:
> >>>>
> >>>>> Signed-off-by: Beniamin Sandu <beniamin.sandu@gmail.com>
> >>>>> ---
> >>>>>   .../recipes-support/unbound/unbound_1.9.1.bb  | 36
> >>>>> +++++++++++++++++++
> >>>>>   1 file changed, 36 insertions(+)
> >>>>>   create mode 100644
> >>>>> meta-networking/recipes-support/unbound/unbound_1.9.1.bb
> >>>>>
> >>>>> diff --git
> >>>>> a/meta-networking/recipes-support/unbound/unbound_1.9.1.bb
> >>>>> b/meta-networking/recipes-support/unbound/unbound_1.9.1.bb
> >>>>> new file mode 100644
> >>>>> index 000000000..84bbe6581
> >>>>> --- /dev/null
> >>>>> +++ b/meta-networking/recipes-support/unbound/unbound_1.9.1.bb
> >>>>> @@ -0,0 +1,36 @@
> >>>>> +SUMMARY = "Unbound is a validating, recursive, and caching DNS
> >>>>> resolver"
> >>>>> +DESCRIPTION = "Unbound's design is a set of modular components
> >>>>> which incorporate \
> >>>>> +    features including enhanced security (DNSSEC) validation,
> >>>>> Internet Protocol \
> >>>>> +    Version 6 (IPv6), and a client resolver library API as an
> >>>>> integral part of the \
> >>>>> +    architecture"
> >>>>> +
> >>>>> +HOMEPAGE = "https://www.unbound.net/"
> >>>>> +SECTION = "net"
> >>>>> +LICENSE = "BSD-3-Clause"
> >>>>> +LIC_FILES_CHKSUM =
> >>>>> "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
> >>>>> +
> >>>>> +SRC_URI =
> >>>>> "git://github.com/NLnetLabs/unbound.git;protocol=http;branch=master"
> >>>>> +SRCREV="16cc196bf28aec604ed2dae2b5af2ed82c8a58d6"
> >>>>> +
> >>>>> +inherit autotools pkgconfig systemd
> >>>>> +
> >>>>> +DEPENDS = "openssl libevent libtool-native bison-native expat"
> >>>>> +RDEPENDS_${PN} = "bash openssl-bin"
> >>>>> +
> >>>>> +S = "${WORKDIR}/git"
> >>>>> +
> >>>>> +EXTRA_OECONF = "libtool=${TARGET_PREFIX}libtool \
> >>>>> +        --with-ssl=${STAGING_EXECPREFIXDIR}"
> >>>>> +
> >>>>> +PACKAGECONFIG =
> >>>>> "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
> >>>>> +PACKAGECONFIG[systemd] = "--enable-systemd,,systemd"
> >>>> You should probably add:
> >>>> PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'largefile
> >>>> systemd', d)}"
> >>>> PACKAGECONFIG[dnscrypt] = "--enable-dnscrypt, --disable-dnscrypt,
> >>>> libsodium"
> >>>> PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
> >>>> PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
> >>> Thanks, I will add those. I've only used unbound a bit and thought
> >>> about
> >>> sending a patch with a recipe for it since I noticed there is none,
> >>> but I
> >>> didn't look into many configuration options.
> >> And thanks for your contribution!  I only kinda stumbled on those others
> >> being possible myself.
> >>
> >>>>> +do_install_append() {
> >>>>> +    # systemd support
> >>>>> +    if
> >>>>> ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};
> >>>>> then
> >>>>> +        install -d ${D}${systemd_unitdir}/system/
> >>>>> +        install -m 0644 ${B}/contrib/${BPN}.service
> >>>>> ${D}${systemd_unitdir}/system/${BPN}.service
> >>>>> +    fi
> >>>>> +}
> >>>>> +
> >>>>> +SYSTEMD_SERVICE_${PN} = "${BPN}.service"
> >>>> Then you're missing the sysvinit script too?  You can just do:
> >>>> do_install_append() {
> >>>>      install -d ${D}${systemd_unitdir}/system
> >>>>      install -m 0644 ${B}/contrib/unbound.service
> >>>> ${D}${systemd_unitdir}/system
> >>>>
> >>>>      install -d ${D}${sysconfdir}/init.d
> >>>>      install -m 0755 ${S}/contrib/unbound.init
> >>>> ${D}${sysconfdir}/init.d/unbound
> >>>> }
> >>>>
> >>>> And the right things are packaged or not.
> >>> Wouldn't be better to install these files under an if where we check
> >>> DISTRO_FEATURES for systemd/sysvinit like in my initial patch?
> >> No, that just adds more complexity to the recipe that we don't need to
> >> have.  Oh, and since we're adding the sysvinit script too you need
> >> to inherit update-rc.d and add some appropriate lines too so it's
> >> installed right.  The current best practice, iirc, is to do both if we
> >> can do both and then we have the right logic elsewhere to not do
> >> sysvinit stuff on systemd and vice-versa.
> >>
> > Cool, I will send a v2 when I get to a proper machine.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

