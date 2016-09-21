Return-Path: <raj.khem@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id D1AD96059F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2016 02:37:43 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id v2so1688218ywg.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2016 19:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nVzIHiAtFyB7nAMcSjfTDlolRqJAUCgmYMrC7Idljpc=;
	b=DasoWe2pL8JPJlmtghn9M8jsv4xCd+EHMaITzDr0zA54+zjNnCqnTu2hAZ7VRnoiNr
	1G9TYTlPuTcrOMwvd7H/nsNP8fJ8qE6R8B5GFfo3b+3dTCzk9yiZvGP0LvyIwiykFDAA
	RMpUrwotTSwRXdCseDLpx/417Yo/IqKOd4+t0McUGG2KfIGcYzcY0NHrDZbhSFR0D1bm
	+oUUihS0zuEau/lEgXYR98SP477V8f69OjGRpnNHpXfFXP7SWS+QSQo9uDLqYW+86oh5
	GYyqXXzjl3sXcvCWe96Cu5fBilPQbl1mlKLNAGrSGmenqT3sL4BE0mXSztwpnn2NzbMG
	L5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nVzIHiAtFyB7nAMcSjfTDlolRqJAUCgmYMrC7Idljpc=;
	b=HbhtEfGVwpy6Ec6wi6ZieQhglUc/KLT27YzhLIl1XSwux9996PyDn3vB/+yBi3HgMs
	TPiPsoZ8vaDgtzCN2Y2XxvLJw0j9jVsqnBafHxuuH1PJ/oZCqtpQ/PW35RlAcusiC1Xy
	JPStBEiMjl9x3qAlEaOQkvneMwoOhzpswXLzk8Qx/FUfL6/5wjCKY+oHdijp3mucvH1b
	01xGcChZ0byOcyD5I4OfxH8Z1Pw2Z79WKLF6t2z+vSFHjWShyJ9CENkx10JQKWF+7uSU
	f8rFyHeaCK/OszZqb7HGXRE5N3ksYULK9sCtsBd6EQBxj3D24fCcV1Q2oZ+lDOgF7hoh
	xWAQ==
X-Gm-Message-State: AE9vXwM23HHYFDzUNGSsYX2mgs9vZNWeT8dbCOCBiU1vQJ+AEzlR+S66JN0D73R7jtzLnTXHnOhPk+tUN0esaA==
X-Received: by 10.13.203.81 with SMTP id n78mr26545212ywd.350.1474425464640;
	Tue, 20 Sep 2016 19:37:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.80.33 with HTTP; Tue, 20 Sep 2016 19:37:14 -0700 (PDT)
In-Reply-To: <1649463.EYVuLskMBZ@peggleto-mobl.ger.corp.intel.com>
References: <1472730043-31245-1-git-send-email-maxin.john@intel.com>
	<1472730043-31245-5-git-send-email-maxin.john@intel.com>
	<12285709.EfYBoYq9CT@peggleto-mobl.ger.corp.intel.com>
	<1649463.EYVuLskMBZ@peggleto-mobl.ger.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Sep 2016 19:37:14 -0700
Message-ID: <CAMKF1spx33KNPnP4eWJ+cvNtp9zF-c7v5tyA0FV46-nopQwNDA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 4/4] tslib: move recipe from oe-core
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
X-List-Received-Date: Wed, 21 Sep 2016 02:37:44 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 15, 2016 at 3:19 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Fri, 16 Sep 2016 10:17:11 Paul Eggleton wrote:
>> On Thu, 01 Sep 2016 14:40:43 Maxin B. John wrote:
>> > Move tslib recipe from oe-core layer.
>> >
>> > Signed-off-by: Maxin B. John <maxin.john@intel.com>
>> > ---
>> >
>> >  meta-gpe/recipes-graphics/tslib/tslib/ts.conf  | 25 ++++++++++++
>> >  meta-gpe/recipes-graphics/tslib/tslib/tslib.sh |  8 ++++
>> >  meta-gpe/recipes-graphics/tslib/tslib_1.1.bb   | 53
>> >
>> > ++++++++++++++++++++++++++ 3 files changed, 86 insertions(+)
>> >
>> >  create mode 100644 meta-gpe/recipes-graphics/tslib/tslib/ts.conf
>> >  create mode 100644 meta-gpe/recipes-graphics/tslib/tslib/tslib.sh
>> >  create mode 100644 meta-gpe/recipes-graphics/tslib/tslib_1.1.bb
>> >
>> > diff --git a/meta-gpe/recipes-graphics/tslib/tslib/ts.conf
>> > b/meta-gpe/recipes-graphics/tslib/tslib/ts.conf new file mode 100644
>> > index 0000000..1b0da93
>> > --- /dev/null
>> > +++ b/meta-gpe/recipes-graphics/tslib/tslib/ts.conf
>> > @@ -0,0 +1,25 @@
>> > +# Uncomment if you wish to use the linux input layer event interface
>> > +module_raw input
>> > +
>> > +# Uncomment if you're using a Sharp Zaurus SL-5500/SL-5000d
>> > +# module_raw collie
>> > +
>> > +# Uncomment if you're using a Sharp Zaurus SL-C700/C750/C760/C860
>> > +# module_raw corgi
>> > +
>> > +# Uncomment if you're using a device with a UCB1200/1300/1400 TS
>> > interface
>> > +# module_raw ucb1x00
>> > +
>> > +# Uncomment if you're using an HP iPaq h3600 or similar
>> > +# module_raw h3600
>> > +
>> > +# Uncomment if you're using a Hitachi Webpad
>> > +# module_raw mk712
>> > +
>> > +# Uncomment if you're using an IBM Arctic II
>> > +# module_raw arctic2
>> > +
>> > +module pthres pmin=1
>> > +module variance delta=30
>> > +module dejitter delta=100
>> > +module linear
>> > diff --git a/meta-gpe/recipes-graphics/tslib/tslib/tslib.sh
>> > b/meta-gpe/recipes-graphics/tslib/tslib/tslib.sh new file mode 100644
>> > index 0000000..7068e8d
>> > --- /dev/null
>> > +++ b/meta-gpe/recipes-graphics/tslib/tslib/tslib.sh
>> > @@ -0,0 +1,8 @@
>> > +#!/bin/sh
>> > +
>> > +if [ -e /dev/input/touchscreen0 ]; then
>> > +    TSLIB_TSDEVICE=/dev/input/touchscreen0
>> > +
>> > +    export TSLIB_TSDEVICE
>> > +fi
>> > +
>> > diff --git a/meta-gpe/recipes-graphics/tslib/tslib_1.1.bb
>> > b/meta-gpe/recipes-graphics/tslib/tslib_1.1.bb new file mode 100644
>> > index 0000000..b0264c3
>> > --- /dev/null
>> > +++ b/meta-gpe/recipes-graphics/tslib/tslib_1.1.bb
>> > @@ -0,0 +1,53 @@
>> > +SUMMARY = "An abstraction layer for touchscreen panel events"
>> > +DESCRIPTION = "Tslib is an abstraction layer for touchscreen panel \
>> > +events, as well as a filter stack for the manipulation of those events. \
>> > +Tslib is generally used on embedded devices to provide a common user \
>> > +space interface to touchscreen functionality."
>> > +HOMEPAGE = "http://tslib.berlios.de/"
>> > +
>> > +AUTHOR = "Russell King w/ plugins by Chris Larson et. al."
>> > +SECTION = "base"
>> > +LICENSE = "LGPLv2"
>> > +LIC_FILES_CHKSUM = "file://COPYING;md5=f30a9716ef3762e3467a2f62bf790f0a"
>> > +
>> > +SRC_URI =
>> > "https://github.com/kergoth/tslib/releases/download/${PV}/tslib-${PV}.tar.
>> > x
>> > z;downloadfilename=tslib-${PV}.tar.xz \ +           file://ts.conf \
>> > +           file://tslib.sh \
>> > +"
>> > +
>> > +SRC_URI[md5sum] = "14771f8607b341bb4b297819d37e837d"
>> > +SRC_URI[sha256sum] =
>> > "fe35e5f710ea933b118f710e2ce4403ac076fe69926b570333867d4de082a51c" +
>> > +UPSTREAM_CHECK_URI = "https://github.com/kergoth/tslib/releases"
>> > +
>> > +inherit autotools pkgconfig
>> > +
>> > +EXTRA_OECONF = "--enable-shared --disable-h3600 --enable-input
>> > --disable-corgi --disable-collie --disable-mk712 --disable-arctic2
>> > --disable-ucb1x00" +
>> > +do_install_prepend() {
>> > +   install -m 0644 ${WORKDIR}/ts.conf ${S}/etc/ts.conf
>> > +}
>> > +
>> > +do_install_append() {
>> > +   install -d ${D}${sysconfdir}/profile.d/
>> > +   install -m 0755 ${WORKDIR}/tslib.sh ${D}${sysconfdir}/profile.d/
>> > +}
>> > +
>> > +# People should consider using udev's /dev/input/touchscreen0 symlink
>> > +# instead of detect-stylus
>> > +#RDEPENDS_tslib-conf_weird-machine = "detect-stylus"
>> > +RPROVIDES_tslib-conf = "libts-0.0-conf"
>> > +
>> > +PACKAGES =+ "tslib-conf tslib-tests tslib-calibrate"
>> > +DEBIAN_NOAUTONAME_tslib-conf = "1"
>> > +DEBIAN_NOAUTONAME_tslib-tests = "1"
>> > +DEBIAN_NOAUTONAME_tslib-calibrate = "1"
>> > +
>> > +RDEPENDS_${PN} = "tslib-conf"
>> > +RRECOMMENDS_${PN} = "pointercal"
>> > +
>> > +FILES_${PN}-dev += "${libdir}/ts/*.la"
>> > +FILES_tslib-conf = "${sysconfdir}/ts.conf
>> > ${sysconfdir}/profile.d/tslib.sh
>> > ${datadir}/tslib" +FILES_${PN} = "${libdir}/*.so.* ${libdir}/ts/*.so*"
>> > +FILES_tslib-calibrate += "${bindir}/ts_calibrate"
>> > +FILES_tslib-tests = "${bindir}/ts_harvest ${bindir}/ts_print
>> > ${bindir}/ts_print_raw ${bindir}/ts_test"
>>
>> So it seems like this has been blocked purely based on indentation that
>> arguably doesn't even really matter, and as a result we no longer have tslib
>> anywhere. Can you guys please resolve this ASAP?
>
> Also, is meta-gpe really an appropriate place for this?

It should go into meta-oe

>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

