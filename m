Return-Path: <net147@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4CBC76FFCC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2016 04:36:57 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id r145so2466744ior.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2016 21:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=tXOptE/kd0kQ57X55nbWCtVrcoXmuQcZim4BSHa6S54=;
	b=XHfpgLWbHXvZacW93DdswB6zK4gTnuj+WOEez32zJoYBgIgABgC5N1qUeCVbhCh7tE
	St78mDyJdgnbg8bpsq+d7n5po7uEclpmPSN2hxUr8gkE2pLkgsx0N4a0DZxw93ptEJVu
	uCepKmj1T/P8WQpL/TG06yknaomtDCvScuDo6Mtvoo9nN50e0UZ6JFEoiec/9c1Xb8BV
	nzI5iOH8A32tIHUS2vIQJqvH84oMip6WwrNXxMG5LNIk4e9mT6AYrkSyTq0FcWXuPQId
	7seF3gO5O74ihWON1QR/oY6m1F+9IhMQGDgaBF2/w+6cz852btNZfSQzBlsMgPEY6TwC
	rc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=tXOptE/kd0kQ57X55nbWCtVrcoXmuQcZim4BSHa6S54=;
	b=fKeHJATyKa9fepjm/BnqI+eDzcRuxm7f2EYFgfqwbpHceJdvzWMZC2PK00D6dVcqmI
	0BxhQSbDnotx+My5msAPjyhbvg2rlyJ+Dxk01e6CnhDGRGEpsccqjNHopsKbcPDde1MV
	mkqiMcJ2tmavL+wufq9J/tLyBQzVItl6CJV6+CtPLTU2dP8TvCxoA4nFFoa6vzukmMXv
	XYNjv632xuxjfV7KSynGwn3EbR65yXXsWdIvTcCDO40CDMoVlKlq852T9nfnVx36DkJ4
	8QDinefFB7/rpbjUXoIMFCRbfnJOLHUQ7ArJq5xAJUnFhRYaoDd0GzR/xuqk4G/R9AVe
	hquw==
X-Gm-Message-State: AE9vXwO4bBP72tbcAgd2HYUXiMwnffmcjuq8oyqeXA0ofIGq5HtKyuLX3AVLjKj0JPZvEkCUq7mIdn9mmuuO2g==
X-Received: by 10.107.11.101 with SMTP id v98mr49464362ioi.145.1474432618743; 
	Tue, 20 Sep 2016 21:36:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.36.60.73 with HTTP; Tue, 20 Sep 2016 21:36:58 -0700 (PDT)
In-Reply-To: <CAMKF1spx33KNPnP4eWJ+cvNtp9zF-c7v5tyA0FV46-nopQwNDA@mail.gmail.com>
References: <1472730043-31245-1-git-send-email-maxin.john@intel.com>
	<1472730043-31245-5-git-send-email-maxin.john@intel.com>
	<12285709.EfYBoYq9CT@peggleto-mobl.ger.corp.intel.com>
	<1649463.EYVuLskMBZ@peggleto-mobl.ger.corp.intel.com>
	<CAMKF1spx33KNPnP4eWJ+cvNtp9zF-c7v5tyA0FV46-nopQwNDA@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
Date: Wed, 21 Sep 2016 14:36:58 +1000
Message-ID: <CANwerB3Jk9VxiypnEQZp252MRVuDOZJ3e1DRb7EE7wVOodCujA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Wed, 21 Sep 2016 04:37:00 -0000
Content-Type: text/plain; charset=UTF-8

On 21 September 2016 at 12:37, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Sep 15, 2016 at 3:19 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
>> On Fri, 16 Sep 2016 10:17:11 Paul Eggleton wrote:
>>> On Thu, 01 Sep 2016 14:40:43 Maxin B. John wrote:
>>> > Move tslib recipe from oe-core layer.
>>> >
>>> > Signed-off-by: Maxin B. John <maxin.john@intel.com>
>>> > ---
>>> >
>>> >  meta-gpe/recipes-graphics/tslib/tslib/ts.conf  | 25 ++++++++++++
>>> >  meta-gpe/recipes-graphics/tslib/tslib/tslib.sh |  8 ++++
>>> >  meta-gpe/recipes-graphics/tslib/tslib_1.1.bb   | 53
>>> >
>>> > ++++++++++++++++++++++++++ 3 files changed, 86 insertions(+)
>>> >
>>> >  create mode 100644 meta-gpe/recipes-graphics/tslib/tslib/ts.conf
>>> >  create mode 100644 meta-gpe/recipes-graphics/tslib/tslib/tslib.sh
>>> >  create mode 100644 meta-gpe/recipes-graphics/tslib/tslib_1.1.bb
>>> >
>>> > diff --git a/meta-gpe/recipes-graphics/tslib/tslib/ts.conf
>>> > b/meta-gpe/recipes-graphics/tslib/tslib/ts.conf new file mode 100644
>>> > index 0000000..1b0da93
>>> > --- /dev/null
>>> > +++ b/meta-gpe/recipes-graphics/tslib/tslib/ts.conf
>>> > @@ -0,0 +1,25 @@
>>> > +# Uncomment if you wish to use the linux input layer event interface
>>> > +module_raw input
>>> > +
>>> > +# Uncomment if you're using a Sharp Zaurus SL-5500/SL-5000d
>>> > +# module_raw collie
>>> > +
>>> > +# Uncomment if you're using a Sharp Zaurus SL-C700/C750/C760/C860
>>> > +# module_raw corgi
>>> > +
>>> > +# Uncomment if you're using a device with a UCB1200/1300/1400 TS
>>> > interface
>>> > +# module_raw ucb1x00
>>> > +
>>> > +# Uncomment if you're using an HP iPaq h3600 or similar
>>> > +# module_raw h3600
>>> > +
>>> > +# Uncomment if you're using a Hitachi Webpad
>>> > +# module_raw mk712
>>> > +
>>> > +# Uncomment if you're using an IBM Arctic II
>>> > +# module_raw arctic2
>>> > +
>>> > +module pthres pmin=1
>>> > +module variance delta=30
>>> > +module dejitter delta=100
>>> > +module linear
>>> > diff --git a/meta-gpe/recipes-graphics/tslib/tslib/tslib.sh
>>> > b/meta-gpe/recipes-graphics/tslib/tslib/tslib.sh new file mode 100644
>>> > index 0000000..7068e8d
>>> > --- /dev/null
>>> > +++ b/meta-gpe/recipes-graphics/tslib/tslib/tslib.sh
>>> > @@ -0,0 +1,8 @@
>>> > +#!/bin/sh
>>> > +
>>> > +if [ -e /dev/input/touchscreen0 ]; then
>>> > +    TSLIB_TSDEVICE=/dev/input/touchscreen0
>>> > +
>>> > +    export TSLIB_TSDEVICE
>>> > +fi
>>> > +
>>> > diff --git a/meta-gpe/recipes-graphics/tslib/tslib_1.1.bb
>>> > b/meta-gpe/recipes-graphics/tslib/tslib_1.1.bb new file mode 100644
>>> > index 0000000..b0264c3
>>> > --- /dev/null
>>> > +++ b/meta-gpe/recipes-graphics/tslib/tslib_1.1.bb
>>> > @@ -0,0 +1,53 @@
>>> > +SUMMARY = "An abstraction layer for touchscreen panel events"
>>> > +DESCRIPTION = "Tslib is an abstraction layer for touchscreen panel \
>>> > +events, as well as a filter stack for the manipulation of those events. \
>>> > +Tslib is generally used on embedded devices to provide a common user \
>>> > +space interface to touchscreen functionality."
>>> > +HOMEPAGE = "http://tslib.berlios.de/"
>>> > +
>>> > +AUTHOR = "Russell King w/ plugins by Chris Larson et. al."
>>> > +SECTION = "base"
>>> > +LICENSE = "LGPLv2"
>>> > +LIC_FILES_CHKSUM = "file://COPYING;md5=f30a9716ef3762e3467a2f62bf790f0a"
>>> > +
>>> > +SRC_URI =
>>> > "https://github.com/kergoth/tslib/releases/download/${PV}/tslib-${PV}.tar.
>>> > x
>>> > z;downloadfilename=tslib-${PV}.tar.xz \ +           file://ts.conf \
>>> > +           file://tslib.sh \
>>> > +"
>>> > +
>>> > +SRC_URI[md5sum] = "14771f8607b341bb4b297819d37e837d"
>>> > +SRC_URI[sha256sum] =
>>> > "fe35e5f710ea933b118f710e2ce4403ac076fe69926b570333867d4de082a51c" +
>>> > +UPSTREAM_CHECK_URI = "https://github.com/kergoth/tslib/releases"
>>> > +
>>> > +inherit autotools pkgconfig
>>> > +
>>> > +EXTRA_OECONF = "--enable-shared --disable-h3600 --enable-input
>>> > --disable-corgi --disable-collie --disable-mk712 --disable-arctic2
>>> > --disable-ucb1x00" +
>>> > +do_install_prepend() {
>>> > +   install -m 0644 ${WORKDIR}/ts.conf ${S}/etc/ts.conf
>>> > +}
>>> > +
>>> > +do_install_append() {
>>> > +   install -d ${D}${sysconfdir}/profile.d/
>>> > +   install -m 0755 ${WORKDIR}/tslib.sh ${D}${sysconfdir}/profile.d/
>>> > +}
>>> > +
>>> > +# People should consider using udev's /dev/input/touchscreen0 symlink
>>> > +# instead of detect-stylus
>>> > +#RDEPENDS_tslib-conf_weird-machine = "detect-stylus"
>>> > +RPROVIDES_tslib-conf = "libts-0.0-conf"
>>> > +
>>> > +PACKAGES =+ "tslib-conf tslib-tests tslib-calibrate"
>>> > +DEBIAN_NOAUTONAME_tslib-conf = "1"
>>> > +DEBIAN_NOAUTONAME_tslib-tests = "1"
>>> > +DEBIAN_NOAUTONAME_tslib-calibrate = "1"
>>> > +
>>> > +RDEPENDS_${PN} = "tslib-conf"
>>> > +RRECOMMENDS_${PN} = "pointercal"
>>> > +
>>> > +FILES_${PN}-dev += "${libdir}/ts/*.la"
>>> > +FILES_tslib-conf = "${sysconfdir}/ts.conf
>>> > ${sysconfdir}/profile.d/tslib.sh
>>> > ${datadir}/tslib" +FILES_${PN} = "${libdir}/*.so.* ${libdir}/ts/*.so*"
>>> > +FILES_tslib-calibrate += "${bindir}/ts_calibrate"
>>> > +FILES_tslib-tests = "${bindir}/ts_harvest ${bindir}/ts_print
>>> > ${bindir}/ts_print_raw ${bindir}/ts_test"
>>>
>>> So it seems like this has been blocked purely based on indentation that
>>> arguably doesn't even really matter, and as a result we no longer have tslib
>>> anywhere. Can you guys please resolve this ASAP?
>>
>> Also, is meta-gpe really an appropriate place for this?
>
> It should go into meta-oe
>

+1
I think so too.

>>
>> Cheers,
>> Paul
>>
>> --
>>
>> Paul Eggleton
>> Intel Open Source Technology Centre
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

