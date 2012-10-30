Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TTALL-0006OG-1Q for openembedded-devel@lists.openembedded.org;
	Tue, 30 Oct 2012 12:50:51 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TTA8L-0005eb-Ec for openembedded-devel@lists.openembedded.org;
	Tue, 30 Oct 2012 12:37:25 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2012 12:37:25 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2012 12:37:25 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 30 Oct 2012 12:37:10 +0100
Message-ID: <k6oe50$iv9$2@ger.gmane.org>
References: <20121024064022.C7F781032E@opal>
	<CAGiJk9fcWHvEdK_bc3ApwExvGM1PKVh6-y9Hj1ifMA0HQG19+w@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
In-Reply-To: <CAGiJk9fcWHvEdK_bc3ApwExvGM1PKVh6-y9Hj1ifMA0HQG19+w@mail.gmail.com>
X-Enigmail-Version: 1.4.4
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
X-List-Received-Date: Tue, 30 Oct 2012 11:50:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 30-10-12 10:24, Samuel Stirtzel schreef:
> 2012/10/24  <git@git.openembedded.org>:
>> Module: meta-openembedded.git Branch: master Commit:
>> 80ef3c0aa0f92e93d1581e47ccb77a04022d04cf URL:
>> http://git.openembedded.org/?p=meta-openembedded.git&a=commit;h=80ef3c0aa0f92e93d1581e47ccb77a04022d04cf
>>
>>
>> 
Author: Koen Kooi <koen@dominion.thruhere.net>
>> Date:   Wed Oct 24 08:39:12 2012 +0200
>> 
>> Revert "maliit-framework: Clean up recipe and use
>> gtk-immodules-cache.bbclass"
>> 
>> The class hasn't hit oe-core yet
>> 
>> This reverts commit eb66e508e33ccbec8299041265eef183913a3a8c.
>> 
>> ---
>> 
>> .../recipes-support/maliit/maliit-framework_git.bb |   32
>> +++++++++++++++---- 1 files changed, 25 insertions(+), 7 deletions(-)
>> 
>> diff --git a/meta-oe/recipes-support/maliit/maliit-framework_git.bb
>> b/meta-oe/recipes-support/maliit/maliit-framework_git.bb index
>> 534a3c8..3f50d1b 100644 ---
>> a/meta-oe/recipes-support/maliit/maliit-framework_git.bb +++
>> b/meta-oe/recipes-support/maliit/maliit-framework_git.bb @@ -4,7 +4,7
>> @@ HOMEPAGE = "https://wiki.maliit.org/Main_Page" LICENSE = "LGPLv2.1" 
>> LIC_FILES_CHKSUM =
>> "file://LICENSE.LGPL;md5=5c917f6ce94ceb8d8d5e16e2fca5b9ad"
>> 
>> -inherit autotools qt4x11 gtk-immodules-cache +inherit autotools
>> qt4x11
>> 
>> 
>> SRC_URI =
>> "git://gitorious.org/maliit/maliit-framework.git;branch=master \ @@
>> -16,8 +16,9 @@ SRCREV = "750842dec74a9b17dca91ef779c4fc5a43c4d9dc" PV =
>> "0.92.3+git${SRCPV}"
>> 
>> 
>> -PACKAGES =+ "${PN}-gtk" -GTKIMMODULES_PACKAGES = "${PN}-gtk" +PACKAGES
>> =+ "\ +    ${PN}-gtk \ +    "
>> 
>> # Maliit needs Qt configured with -accessibility, a patch for that was
>> already sent and will get merged in post 1.2. RDEPENDS_${PN} =
>> "qt4-plugin-inputmethod-imsw-multi libqtsvg4" @@ -57,12 +58,29 @@
>> EXTRA_QMAKEVARS_PRE = "\ CONFIG+=local-install \ "
>> 
>> -EXTRA_OEMAKE += "INSTALL_ROOT=${D}" +do_install() { +    cd ${S} &&
>> (INSTALL_ROOT=${D} oe_runmake install)
>> 
>> -do_install_append() { #Fix absolute paths -    sed -i -e
>> "s|/usr|${STAGING_DIR_TARGET}${prefix}|"
>> ${D}/${datadir}/qt4/mkspecs/features/maliit-framework.prf -    sed -i
>> -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|"
>> ${D}/${datadir}/qt4/mkspecs/features/maliit-plugins.prf +    cd
>> ${D}/${datadir}/qt4/mkspecs/features && sed -i -e
>> "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ./maliit-framework.prf +    cd
>> ${D}/${datadir}/qt4/mkspecs/features && sed -i -e
>> "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ./maliit-plugins.prf +} + + + 
>> +# Update the inputmethod modules in gtk +pkg_postinst_${PN}-gtk() { 
>> +if [ "x$D" != "x" ]; then +    exit 1 +fi +gtk-query-immodules-2.0 >
>> /etc/gtk-2.0/gtk.immodules +} + +pkg_postrm_${PN}-gtk() { +if [ "x$D"
>> != "x" ]; then +    exit 1 +fi +gtk-query-immodules-2.0 >
>> /etc/gtk-2.0/gtk.immodules }
>> 
>> S= "${WORKDIR}/git"
>> 
>> 
>> _______________________________________________ Openembedded-commits
>> mailing list 
>> Openembedded-commits@lists.openembedded.org 
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>
>> 
> Hi, can this be re-applied please?
> 
> The .bbclass was taken in OE-Core with commit: [1]
> 
> [1]
> https://github.com/openembedded/oe-core/commit/c67f64e5846bb2a6774e61a4f3719c5f82fc3bd8


That's
> 
not present in the danny branch, see the RFC I sent about that a few
days ago.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQj7vmMkyGM64RGpERAj1SAJ9ozJzcWiIZaeYYsRvRC0vfYM3kYACgpCnu
fjQDb9JsGhFaGQ0bJgjkTxo=
=6kZU
-----END PGP SIGNATURE-----



