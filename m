Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id A275D9004E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2019 23:45:16 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id j31so1945914qta.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2019 16:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uUif1huVoXk7t0Cht8fnbttFGoMNNetEwz4Ea0hBtXw=;
	b=DCPTsxy9greD+jJMCH96ZBbyl4TtpcCiWjydMyVTPFUrPiQdUb6WFZCFXdy8KDvriu
	OiWq6QZAdXB6bWcuyXsFBQuSyj0ccuE3B21jPhSWHD5/iqX+iAJaepTzdJWNLoPaFRsG
	HzJB6oAvLhSo4W7kVwNdyTCy0gtp/umQXd/UG+uAn34+rCSjOKH1zEuVC48Bmj2AIWQu
	G+EQsFG7loGfjKXkjLoBFtyZl0Fi5QFTQsa0fc3QJCJ9wpKzTEQCpDaYQLKtYl78H5sH
	cU1N5C7KN/ywbpp/vixpulYznkHi67vdnUOdreAthaJcl0hZhgN9cbQJRbjopAvRP1cq
	CLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uUif1huVoXk7t0Cht8fnbttFGoMNNetEwz4Ea0hBtXw=;
	b=MmPgsLVMz0cVqpfOjt8Y8g7fVz+PbbT9e+NdCoXTFDxssQIHkmDNFqc61UY3WXPeIq
	V2hNCQjXazXMO/LbrEt+TXfYyxZrWHrh3X4rEFOpS24J5lByhPQFSwuiyuBdQb8SQ5Ow
	GfguBE2uHhvPdR541t0JChRj/pj6YtpiIsw/cTE5q51CJQwaPW4LJaUhMhK1LwcGL/lK
	j1st2T1Wn1ttY/97L4NHwl2TONkqT+A868vz3a6/gntybCy3z54mctXH+FQwOwZqJrlk
	xC8V8jphobgD8+fgQhFq8KF1D18RhNTF7oKvufuydXOpBNiM61Ln5gybxm3eV9c15ODs
	LNFA==
X-Gm-Message-State: APjAAAUclpzu2AyF9a8dTTHk88xb6HIA0arOIw3q6HRoxxFWTYcPoU7w
	NCFoUILFEPSqHBC4Oq9xyYJ0JBd0z2s2qo30AcEmh7SWpSY=
X-Google-Smtp-Source: APXvYqwikA30VpGeF1z1b/WlBcF4Bu7Lo8pm7QdT0cx0xO40ACFPWjxUP+YD6O/y3FzSPK7Pr96z16IbqmUEj8qHvGk=
X-Received: by 2002:aed:3576:: with SMTP id b51mr418426qte.378.1568850317100; 
	Wed, 18 Sep 2019 16:45:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190912223713.26895-1-open.source@oleksandr-kravchuk.com>
	<CAMKF1sqWfURSkMxAmENpxMqgYLn_gamUGbMnpZ57z3O0GHOE2w@mail.gmail.com>
	<1d2dd5dd-0a92-c14a-3d75-79e2eba8584f@oleksandr-kravchuk.com>
In-Reply-To: <1d2dd5dd-0a92-c14a-3d75-79e2eba8584f@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Sep 2019 16:44:49 -0700
Message-ID: <CAMKF1sojkV=3hHyW9hkd5P13LEH6DhxEjp8V0=hhF5hqgxL-Kg@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] pcsc-lite: update to 1.8.25
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
X-List-Received-Date: Wed, 18 Sep 2019 23:45:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 18, 2019 at 3:37 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Right. Is there a common way to go around this?
>

define packageconfig and enable it if systemd is in distro features

e.g.
PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
PACKAGECONFIG[systemd]  = "--enable-libsystemd,--disable-libsystemd,systemd,"

> On 13/09/2019 18:20, Khem Raj wrote:
> > I think we need to use systemd distro feature to control libsystemd
> > use see https://errors.yoctoproject.org/Errors/Details/270186/
> >
> > On Thu, Sep 12, 2019 at 3:37 PM Oleksandr Kravchuk
> > <open.source@oleksandr-kravchuk.com> wrote:
> >> License checksum was changed due to removed license info about remove
> >> code (see @0984e0f4a03e5e29bb5725b6f149f56c9e9c73c2).
> >>
> >> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> >> ---
> >>  .../pcsc-lite/{pcsc-lite_1.8.22.bb => pcsc-lite_1.8.25.bb} | 7 +++----
> >>  1 file changed, 3 insertions(+), 4 deletions(-)
> >>  rename meta-oe/recipes-support/pcsc-lite/{pcsc-lite_1.8.22.bb => pcsc-lite_1.8.25.bb} (86%)
> >>
> >> diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.25.bb
> >> similarity index 86%
> >> rename from meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb
> >> rename to meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.25.bb
> >> index 10f724e6c..1c764f7eb 100644
> >> --- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb
> >> +++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.25.bb
> >> @@ -8,13 +8,12 @@ LICENSE_${PN}-dev = "BSD"
> >>  LICENSE_${PN}-dbg = "BSD & GPLv3+"
> >>  LICENSE_${PN}-spy = "GPLv3+"
> >>  LICENSE_${PN}-spy-dev = "GPLv3+"
> >> -LIC_FILES_CHKSUM = "file://COPYING;md5=f38b3d1c7ef7fc2c8b6d20cd38efdc29"
> >> +LIC_FILES_CHKSUM = "file://COPYING;md5=628c01ba985ecfa21677f5ee2d5202f6"
> >>  DEPENDS = "udev"
> >>
> >>  SRC_URI = "https://pcsclite.apdu.fr/files/${BP}.tar.bz2"
> >> -SRC_URI[md5sum] = "0ec103b1ef298d0c58d6ef6b00b9cf17"
> >> -SRC_URI[sha256sum] = "6a358f61ed3b66a7f6e1f4e794a94c7be4c81b7a58ec360c33791e8d7d9bd405"
> >> -
> >> +SRC_URI[md5sum] = "c20650a36062ab1689f37f3302c988f2"
> >> +SRC_URI[sha256sum] = "d76d79edc31cf76e782b9f697420d3defbcc91778c3c650658086a1b748e8792"
> >>
> >>  inherit autotools systemd pkgconfig
> >>
> >> --
> >> 2.17.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

