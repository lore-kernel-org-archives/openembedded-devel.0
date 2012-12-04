Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1Tfn17-0003qk-D3
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 08:34:10 +0100
Received: by mail-ie0-f175.google.com with SMTP id qd14so5558800ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 23:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=DqWaySfRtjEXzt1uexBmiDu/AuRyHT2QrZbCD+DqF2s=;
	b=ZBH07n03ft8G4hxPoTbILCJjpBGjsPkaUwdWQvR2A0s0CTBzZC8NOMvyLZD66lBaaw
	hGxpdPusxZFmDnzAes5xaEHSO4Hh3QyH7VzLCEz+8lYQq62aiahmie2MRipqk63N0bkJ
	ktnmn2GXgEv/cIskjcwC503ZFcBKZSWNv3D7E/W8q+/EFl1H+ABBphU647kC8F0JXvac
	GgrJffG1SHXSOB/Mv+Cgy78kB72WCGljOLoXJIAswTZBJ/DHOBr3nljwfNFV74U3Tacb
	Pd7diI2daEQFsZ6VKo+C2Juty/4Wnnhz+sEDFY2Jp5ILYvqb5i3yJnRdML3tJldM6WBu
	oTtg==
MIME-Version: 1.0
Received: by 10.50.214.97 with SMTP id nz1mr1770530igc.36.1354605586378; Mon,
	03 Dec 2012 23:19:46 -0800 (PST)
Received: by 10.64.24.179 with HTTP; Mon, 3 Dec 2012 23:19:46 -0800 (PST)
In-Reply-To: <20121203185650.GF3354@jama.jama.net>
References: <20121024064022.C7F781032E@opal>
	<CAGiJk9fcWHvEdK_bc3ApwExvGM1PKVh6-y9Hj1ifMA0HQG19+w@mail.gmail.com>
	<k6oe50$iv9$2@ger.gmane.org>
	<CAGiJk9f6ZzvrZNrgDfmhMEDFNWiY4gsF-0GF4nz1=6qzZLexeg@mail.gmail.com>
	<CA+chaQes=2CvfGmW=_vOTiKQPRDgyxEZSty657FuE9SS=ptjWw@mail.gmail.com>
	<CAGiJk9ftka_L+iHO-OzkGAxXuvBatd3oFbXrqGNOPjtzp0bYqg@mail.gmail.com>
	<20121203185650.GF3354@jama.jama.net>
Date: Tue, 4 Dec 2012 08:19:46 +0100
Message-ID: <CAGiJk9faWX-5s_bUK1L3-DpJ6J+gDjKVXuZJAs3qGxw3s9z5rg@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Koen Kooi : Revert "maliit-framework: Clean up recipe and use gtk-immodules-cache.bbclass"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2012 07:34:11 -0000
Content-Type: text/plain; charset=UTF-8

2012/12/3 Martin Jansa <martin.jansa@gmail.com>:
> On Mon, Dec 03, 2012 at 05:23:07PM +0100, Samuel Stirtzel wrote:
>> 2012/12/3 Martin Jansa <martin.jansa@gmail.com>:
>> > On Tue, Oct 30, 2012 at 2:13 PM, Samuel Stirtzel
>> > <s.stirtzel@googlemail.com> wrote:
>> >> 2012/10/30 Koen Kooi <koen@dominion.thruhere.net>:
>> >>> -----BEGIN PGP SIGNED MESSAGE-----
>> >>> Hash: SHA1
>> >>>
>> >>> Op 30-10-12 10:24, Samuel Stirtzel schreef:
>> >>>> 2012/10/24  <git@git.openembedded.org>:
>> >>>>> Module: meta-openembedded.git Branch: master Commit:
>> >>>>> 80ef3c0aa0f92e93d1581e47ccb77a04022d04cf URL:
>> >>>>> http://git.openembedded.org/?p=meta-openembedded.git&a=commit;h=80ef3c0aa0f92e93d1581e47ccb77a04022d04cf
>> >>>>>
>> >>>>>
>> >>>>>
>> >>> Author: Koen Kooi <koen@dominion.thruhere.net>
>> >>>>> Date:   Wed Oct 24 08:39:12 2012 +0200
>> >>>>>
>> >>>>> Revert "maliit-framework: Clean up recipe and use
>> >>>>> gtk-immodules-cache.bbclass"
>> >>>>>
>> >>>>> The class hasn't hit oe-core yet
>> >>>>>
>> >>>>> This reverts commit eb66e508e33ccbec8299041265eef183913a3a8c.
>> >>>>>
>> >>>>> ---
>> >>>>>
>> >>>>> .../recipes-support/maliit/maliit-framework_git.bb |   32
>> >>>>> +++++++++++++++---- 1 files changed, 25 insertions(+), 7 deletions(-)
>> >>>>>
>> >>>>> diff --git a/meta-oe/recipes-support/maliit/maliit-framework_git.bb
>> >>>>> b/meta-oe/recipes-support/maliit/maliit-framework_git.bb index
>> >>>>> 534a3c8..3f50d1b 100644 ---
>> >>>>> a/meta-oe/recipes-support/maliit/maliit-framework_git.bb +++
>> >>>>> b/meta-oe/recipes-support/maliit/maliit-framework_git.bb @@ -4,7 +4,7
>> >>>>> @@ HOMEPAGE = "https://wiki.maliit.org/Main_Page" LICENSE = "LGPLv2.1"
>> >>>>> LIC_FILES_CHKSUM =
>> >>>>> "file://LICENSE.LGPL;md5=5c917f6ce94ceb8d8d5e16e2fca5b9ad"
>> >>>>>
>> >>>>> -inherit autotools qt4x11 gtk-immodules-cache +inherit autotools
>> >>>>> qt4x11
>> >>>>>
>> >>>>>
>> >>>>> SRC_URI =
>> >>>>> "git://gitorious.org/maliit/maliit-framework.git;branch=master \ @@
>> >>>>> -16,8 +16,9 @@ SRCREV = "750842dec74a9b17dca91ef779c4fc5a43c4d9dc" PV =
>> >>>>> "0.92.3+git${SRCPV}"
>> >>>>>
>> >>>>>
>> >>>>> -PACKAGES =+ "${PN}-gtk" -GTKIMMODULES_PACKAGES = "${PN}-gtk" +PACKAGES
>> >>>>> =+ "\ +    ${PN}-gtk \ +    "
>> >>>>>
>> >>>>> # Maliit needs Qt configured with -accessibility, a patch for that was
>> >>>>> already sent and will get merged in post 1.2. RDEPENDS_${PN} =
>> >>>>> "qt4-plugin-inputmethod-imsw-multi libqtsvg4" @@ -57,12 +58,29 @@
>> >>>>> EXTRA_QMAKEVARS_PRE = "\ CONFIG+=local-install \ "
>> >>>>>
>> >>>>> -EXTRA_OEMAKE += "INSTALL_ROOT=${D}" +do_install() { +    cd ${S} &&
>> >>>>> (INSTALL_ROOT=${D} oe_runmake install)
>> >>>>>
>> >>>>> -do_install_append() { #Fix absolute paths -    sed -i -e
>> >>>>> "s|/usr|${STAGING_DIR_TARGET}${prefix}|"
>> >>>>> ${D}/${datadir}/qt4/mkspecs/features/maliit-framework.prf -    sed -i
>> >>>>> -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|"
>> >>>>> ${D}/${datadir}/qt4/mkspecs/features/maliit-plugins.prf +    cd
>> >>>>> ${D}/${datadir}/qt4/mkspecs/features && sed -i -e
>> >>>>> "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ./maliit-framework.prf +    cd
>> >>>>> ${D}/${datadir}/qt4/mkspecs/features && sed -i -e
>> >>>>> "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ./maliit-plugins.prf +} + + +
>> >>>>> +# Update the inputmethod modules in gtk +pkg_postinst_${PN}-gtk() {
>> >>>>> +if [ "x$D" != "x" ]; then +    exit 1 +fi +gtk-query-immodules-2.0 >
>> >>>>> /etc/gtk-2.0/gtk.immodules +} + +pkg_postrm_${PN}-gtk() { +if [ "x$D"
>> >>>>> != "x" ]; then +    exit 1 +fi +gtk-query-immodules-2.0 >
>> >>>>> /etc/gtk-2.0/gtk.immodules }
>> >>>>>
>> >>>>> S= "${WORKDIR}/git"
>> >>>>>
>> >>>>>
>> >>>>> _______________________________________________ Openembedded-commits
>> >>>>> mailing list
>> >>>>> Openembedded-commits@lists.openembedded.org
>> >>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>> >>>>
>> >>>>>
>> >>>> Hi, can this be re-applied please?
>> >>>>
>> >>>> The .bbclass was taken in OE-Core with commit: [1]
>> >>>>
>> >>>> [1]
>> >>>> https://github.com/openembedded/oe-core/commit/c67f64e5846bb2a6774e61a4f3719c5f82fc3bd8
>> >>>
>> >>>
>> >>> That's
>> >>>>
>> >>> not present in the danny branch, see the RFC I sent about that a few
>> >>> days ago.
>> >>
>> >> Alright, this can wait until release branching is done.
>> >
>> > Even with this patch applied I still see a lot of QA ERRORs in my build:
>> >
>> > ERROR: QA Issue: non debug package contains .debug directory:
>> > maliit-framework-doc path
>> > /work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-framework/0.92.3+git1+750842dec74a9b17dca91ef779c4fc5a43c4d9dc-r0/packages-split/maliit-framework-doc/usr/share/doc/maliit-framework/maliit-sdk/examples/apps/settings/.debug/maliit-exampleapp-settings
>>
>> Seems odd, I can't reproduce the problem.
>> Can you post the content of your log.do_configure (or at least the
>> "qmake prevar substitution:").
>>
>>
>> Tested with Qt 4.8.1 and 4.8.3, nothing gives me any QA errors.
>> Do you have any custom config switches for Qt? I can't imagine that
>> debug files end up in the maliit-framework-doc package.
>> This recipe was tested on Ubuntu and Fedora with OpenEmbedded updated
>> last friday, no QA errors.
>> How can applications and .so files end up at /usr/share at all?
>
> Well they are in examples directory, so the difference of my build is
> that examples got built and installed.

Well i've got the examples too, the difference is that your build has
the "SDK" enabled which installs binaries to /usr/share/doc ?!

install_sdk_install: first build FORCE
	@$(CHK_DIR_EXISTS) $(INSTALL_ROOT)/usr/share/doc/maliit-framework/ ||
$(MKDIR) $(INSTALL_ROOT)/usr/share/doc/maliit-framework/
	-$(INSTALL_DIR)
/work/oe-core/tmp-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/maliit-framework/0.92.3+git1+750842dec74a9b17dca91ef779c4fc5a43c4d9dc-r0/git/sdk/build/maliit-sdk
$(INSTALL_ROOT)/usr/share/doc/maliit-framework/


Disabling the sdk will prevent these issues, I will send a follow-up patch soon.



-- 
Regards
Samuel


