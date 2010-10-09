Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P4U31-0002S4-KP
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 09:40:57 +0200
Received: by iwn7 with SMTP id 7so536532iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Oct 2010 00:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ULvosqjqUuG6zGvNwFbe72drJCYDL8n6UyjYS57EXg4=;
	b=Hqd0HKHD7Jdt7Wl28n1zJbd9usHNfZgq589OeZJTdeArPa+kE3pPNbKZclcKYTzhA5
	qHoc6tiMD8XVEbzkDeTWE2JrErMXmDn93eJc6w3dfyNUdbMd2dN/tCccT5O9t53k4Z76
	iDimiJd6aNYK8K96W7QsKi2i/pTvHbXMXlzo4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=e/N8iENMtceqa/JIcF95cV94MdvNFXYNvEeTY1Wi3kAkn2GtfhLWU88EiM/PBmD5ZE
	MViZs6n7JN/77tcdzK/+xd35Yw5mgfVODgHixl20NZgyINBMSG92zkhr/+QARNM5oYf6
	1ag7UkuICjHqNW6jhK9fnl81Qcpgu7Pom0qvA=
MIME-Version: 1.0
Received: by 10.231.130.145 with SMTP id t17mr2329244ibs.144.1286610028891;
	Sat, 09 Oct 2010 00:40:28 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sat, 9 Oct 2010 00:40:28 -0700 (PDT)
In-Reply-To: <AANLkTi=eg==2A_jTuUcqYtbvE1B6mBtqi28qKetGH9B-@mail.gmail.com>
References: <AANLkTin=ucR4=4zJQg=thwRbqehhCzRa-DE6NwCGb76R@mail.gmail.com>
	<AANLkTi=eg==2A_jTuUcqYtbvE1B6mBtqi28qKetGH9B-@mail.gmail.com>
Date: Sat, 9 Oct 2010 09:40:28 +0200
Message-ID: <AANLkTingvXhvTDmxpcoZPN-MminaqhAviLczt8KyqwmL@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: recipy_sanity experiment
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
X-List-Received-Date: Sat, 09 Oct 2010 07:40:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/9 Khem Raj <raj.khem@gmail.com>:
> On Fri, Oct 8, 2010 at 1:23 PM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> Dear all,
>>
>> as a test I decided to run recipe_sanity on our tree, and here are the r=
esults
>> There are 1801 warnings:
>
>
> interesting data

Oh well, it was just to give my system something to do on a boring
friday evening.
>
>>
>> =A0 =A0954 candidate for removal of S
>> =A0 =A0373 LICENSE should be defined to something other than default (un=
known)
>
> this should be fixed first.
>

Well did a quick grep:

frans@linux-suse:~/oe/openembedded/recipes> grep -r LICENSE */*bb | wc
   3752   11438  173789
frans@linux-suse:~/oe/openembedded/recipes> grep -r LICENSE */*inc | wc
    708    2194   30190

another grep was for LICENSE.*\"\"
This gave 6 files:
2 with LICENSE =3D "GPLv2""  removed the superfluous " on these
4 iwth LICENSE =3D "". Fixed 3 of these, could not find a license for
the last one (maemo/osso-gwconnect)

I agree that it is useful to have LICENSE in order.
Then again I feel this is also a task for the recipe maintainer (and
frankly speaking I do not feel on wasting time to sort this out for
legacy recipes).
(having said that, I will go through the list and fix whatever recipe
I feel associated with/responsible for)

Anyway, below is the list with files (including the 5 that I just fixed).

Enjoy! Frans.

NOTE: aceofpenguins-1.2: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: aceofpenguins-1.3: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: angstrom-feed-configs-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: angstrom-gdm-autologin-hack-1.0: recipe_sanity: LICENSE should
be defined to something other than default (unknown)
NOTE: angstrom-gpe-task-apps-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: angstrom-gpe-task-base-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: angstrom-gpe-task-game-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: angstrom-gpe-task-pim-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: angstrom-gpe-task-settings-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: angstrom-led-config-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: angstrom-libc-fixup-hack-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: angstrom-ohand-task-pim-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: angstrom-task-office-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: angstrom-task-printing-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: angstrom-task-sectest-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: angstrom-uboot-scripts-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: angstrom-x11-base-depends-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: angstrom-zeroconf-audio-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: epiphany-firefox-replacement-1.0: recipe_sanity: LICENSE should
be defined to something other than default (unknown)
NOTE: omap3-mkcard-1.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: task-angstrom-e-1.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: apache2-2.2.14: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: apache2-2.2.3: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: apache2-native-2.2.14: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: apache2-native-2.2.3: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: apm-tosa-suspendfix-0.1: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: apm-wifi-suspendfix-0.1: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: argp-standalone-1.3: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: at91bootstrap-2.13: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: mango-lassi-0.0+r1+gitr73638817126a68d62f1233f6e6859ce75a259e93:
recipe_sanity: LICENSE should be defined to something other than
default (unknown)
NOTE: ido-0.1.6: recipe_sanity: LICENSE should be defined to something
other than default (unknown)
NOTE: indicator-applet-0.4.3: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: beagleboard-test-scripts-git: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: beecrypt-3.1.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: beecrypt-native-3.1.0: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: bind-9.3.1: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: blipomoko-0.2.99+gitr0+73ffa20d535d7bcf693981ac00d488db72dd2f68:
recipe_sanity: LICENSE should be defined to something other than
default (unknown)
NOTE: blueman-1.10: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: blueman-1.21: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: cdump-native-1.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: cellhunter-0.5.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: classpath-tools-native-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: cup-0.10k: recipe_sanity: LICENSE should be defined to something
other than default (unknown)
NOTE: cup-native-0.10k: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: devhelp-0.23: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: diffstat-1.47: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: docbook-sgml-dtd-3.1-native-1.0: recipe_sanity: LICENSE should
be defined to something other than default (unknown)
NOTE: docbook-sgml-dtd-4.1-native-1.0: recipe_sanity: LICENSE should
be defined to something other than default (unknown)
NOTE: docbook-sgml-dtd-4.4-native-1.0: recipe_sanity: LICENSE should
be defined to something other than default (unknown)
NOTE: docbook-sgml-dtd-4.5-native-1.0: recipe_sanity: LICENSE should
be defined to something other than default (unknown)
NOTE: driftnet-0.1.6: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: driftnet-nogui-0.1.6: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: glamo-dri-tests-1.0.0+gitr0+062cc7ef88078815fc2f8d0da3abd80d0514c248:
recipe_sanity: LICENSE should be defined to something other than
default (unknown)
NOTE: dropbear-early-1.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: dvd+rw-tools-7.1: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: illume-keyboards-shr-0.0+gitr0+4064489f359a1addf572089b582f317dff5f50=
e1:
recipe_sanity: LICENSE should be defined to something other than
default (unknown)
NOTE: e-wm-illume-dict-pl-1.0+gitr0+1cc80e26a4558dfc2268b349d9a1f468e515bcf=
b:
recipe_sanity: LICENSE should be defined to something other than
default (unknown)
NOTE: em8300-0.16.3: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: emelfm2-0.0.8: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: esc-node-demo-0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: farsight2-0.0.9: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: fbset-init-1.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: firmware-marvell-sd8688-10.38.1-p25: recipe_sanity: LICENSE
should be defined to something other than default (unknown)
NOTE: firmware-ti-wl1251-1.0: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: marvell-gspi-fw-9.70.3-p37: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: marvell-license-9.70.3-p37: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: marvell-sdio-fw-9.70.3-p37: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: marvell-sdio-tf-fw-9.0.7-p2: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: font-update-common-0.1: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: free42-vga-1.4.41: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: opimd-utils-0.0.3+gitr0+98ccc66d1e0e5e74bd8ea8c761116fb6a1844fc7:
recipe_sanity: LICENSE should be defined to something other than
default (unknown)
NOTE: frobtads-0.8: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: fsx-linux-0.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: geoclue-0.12.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: geoclue-0.11.1: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: gkdial-1.8.1: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: epiphany-extensions-2.30.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: epiphany-2.20.1+svnr7837: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: gconf-native-2.6.1: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: mm-common-0.9.1: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: gpe-theme-neo-0.2-53084+gitr0+1cc80e26a4558dfc2268b349d9a1f468e515bcf=
b:
recipe_sanity: LICENSE should be defined to something other than
default (unknown)
NOTE: gpe-othello-0.2-1: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: gpe-scap-1.4+svn-20101008: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: gpe-today-0.11+svn-20101008: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: gst-meta-base-0.10: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: gst-player-svnr6: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: elementary-icon-theme-2.3: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: elementary-icon-theme-enable-1.0: recipe_sanity: LICENSE should
be defined to something other than default (unknown)
NOTE: pixops-test-1.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: gtk-sharp-2.10.2: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: gtkterm2-0.2.3: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: guichan-0.7.1: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: i2c-1.0: recipe_sanity: LICENSE should be defined to something
other than default (unknown)
NOTE: omap3-writeprom-1.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: ibrcommon-0.4.2: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: ibrdtn-0.4.2: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: ibrdtnd-0.4.2: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: ibrdtn-tools-0.4.2: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: ica-bin-10.6: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: ica-bin-8.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: devimage-0.1: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: dropbear-backdoor-0.1: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: initramfs-jffs2-0.1: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: initramfs-module-aufs-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: initramfs-module-block-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: initramfs-module-bootldr-buster-1.0: recipe_sanity: LICENSE
should be defined to something other than default (unknown)
NOTE: initramfs-module-bootmenu-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: initramfs-module-check-modules-1.0: recipe_sanity: LICENSE
should be defined to something other than default (unknown)
NOTE: initramfs-module-ext3-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: initramfs-module-initfs-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: initramfs-module-kexecboot-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: initramfs-module-loop-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: initramfs-module-nfs-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: initramfs-module-psplash-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: initramfs-module-squashfs-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: initramfs-uniboot-1.0: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: ipkg-native-0.99.163: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: jacl-1.4.1: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: bsf-2.4.0: recipe_sanity: LICENSE should be defined to something
other than default (unknown)
NOTE: jsch-0.1.40: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: jzlib-1.0.7: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: jhead-2.6.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: jikes-initial-1.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: jlex-1.2.6: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: jlex-native-1.2.6: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: junit-3.8.2: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: junit4-4.3.1: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: kbd-1.15.2: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: strigi-0.5.10: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: fribidi-0.19.2: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: libfribidi-0.10.4: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: libgpeplugin-0.0+svn20101008: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: libgsasl-1.4.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: librcf-0.4: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: libsexy-0.1.10: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: libsexy-0.1.11: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: libsexy-0.1.6: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: libsexy-0.1.8: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: libtheora-0.9+1.0alpha7: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: linux-firmware-git: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: llvm-common-1.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: lxde-common-0.3.2.1: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: lxde-common-0.5.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: lxmenu-data-0.1.1: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: lxmenu-data-0.1: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: lxpanel-0.3.8.1: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: lxpanel-0.3.99: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: lxpanel-0.5.5: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: lxsession-0.4.4: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: lxsession-lite-0.3.6: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: menu-cache-0.2.2: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: osso-af-startup-0.28-1: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: osso-core-config-200515.1: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: osso-gwconnect-0.70.1: recipe_sanity: LICENSE should be set
NOTE: matchbox-wm-2-0.1.0+svnr2087: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: matchbox-session-1.0: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: mbw-1.1: recipe_sanity: LICENSE should be defined to something
other than default (unknown)
NOTE: mesa-dri-glsl-native-7.8.2: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: cross-linkage-1.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: distro-feed-configs-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: external-toolchain-1.0: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: external-toolchain-csl-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: external-toolchain-generic-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: meta-angstrom-2007-1.0: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: run-postinsts-1.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: staging-linkage-1.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: mingw-runtime-3.15.1: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: mingw-runtime-3.15.2: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: mingw-runtime-headers-3.15.1: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: mingw-runtime-headers-3.15.2: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: mingw-w32api-3.13: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: mingw-w32api-headers-3.13: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: dictionary-en-GB: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: libdictionary-1.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: minipredict-1.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: prism2-firmware-update-1.7.4: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: tda1004x-firmware-1.0: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: bickley-0.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: json-glib-0.6.2: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: json-glib-0.6.2+git930fdf4c4dff1f5310a946c2a9f5b6860f7c8ba8:
recipe_sanity: LICENSE should be defined to something other than
default (unknown)
NOTE: libccss-0.3.1+gitcd63b0960ca782987d226811d1473e5745d2591d:
recipe_sanity: LICENSE should be defined to something other than
default (unknown)
NOTE: librest-0.0+git14d35103d9649dc1e10c3e9ac2c690b3165c8184:
recipe_sanity: LICENSE should be defined to something other than
default (unknown)
NOTE: moblin-menus-0.0+gite1d63681739dd16195d005b3cf15752df294bd3c:
recipe_sanity: LICENSE should be defined to something other than
default (unknown)
NOTE: mojito-0.0+git0542c4b0e26c0e3b69c5ad1fa1898dc276fb9f48:
recipe_sanity: LICENSE should be defined to something other than
default (unknown)
NOTE: twitter-glib-0.0+git849bec29292df88590e0b2898b50b9b8d766817e:
recipe_sanity: LICENSE should be defined to something other than
default (unknown)
NOTE: mono-xsp-1.2.5: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: mono-xsp-2.4.2: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: firefox-addon-full-fullscreen-3.3: recipe_sanity: LICENSE should
be defined to something other than default (unknown)
NOTE: firefox-l10n-pt-br-3.0.4: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: mpeg-encode-1.5b: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: mplayer-common-0.0.1: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: mtpaint-3.02: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: mythplugins-0.22: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: myththemes-0.22: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: ncdu-1.3: recipe_sanity: LICENSE should be defined to something
other than default (unknown)
NOTE: pwdutils-2.6: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: ypbind-mt-1.18: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: ypbind-mt-1.19: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: ypserv-2.17: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: yp-tools-2.9: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: odcctools-cross-sdk-0.0+svnr280: recipe_sanity: LICENSE should
be defined to something other than default (unknown)
NOTE: odcctools-cross-0.0+svnr280: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: openal-0.0.8: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: openbmap-logger-0.2.0: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: openbmap-logger-0.4.0: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: openbox-3.4.7.2: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: openbsc-0.0.1.1+gitr5e68183a201ab92f29cd2467df5209f7b351a66d:
recipe_sanity: LICENSE should be defined to something other than
default (unknown)
NOTE: openbsc-onwaves-0.0.1.1+gitr0d9ed87d5c7d5b6e21dc3bbb282e215068742566:
recipe_sanity: LICENSE should be defined to something other than
default (unknown)
NOTE: openchrome-svn: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: xf86-video-openchrome-0.2.902: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: libjana-0.1.0+svnr749: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: openmoko-sound-system2-0.1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: openmoko-common-0.0+svnr1: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: openmoko-icon-theme-standard-0.1+svnr1: recipe_sanity: LICENSE
should be defined to something other than default (unknown)
NOTE: openmoko-session-0.1+svnr1: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: openmoko-sound-system-0.1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: openmoko-sound-theme-standard-0.1+svnr1: recipe_sanity: LICENSE
should be defined to something other than default (unknown)
NOTE: openmoko-theme-standard-qvga-0.0+svnr1: recipe_sanity: LICENSE
should be defined to something other than default (unknown)
NOTE: openmoko-theme-standard-0.0+svnr1: recipe_sanity: LICENSE should
be defined to something other than default (unknown)
NOTE: openmoko-finger-demo-0.0.1+svnr1: recipe_sanity: LICENSE should
be defined to something other than default (unknown)
NOTE: openmoko-panel-demo-simple-0.0.1+svnr1328: recipe_sanity:
LICENSE should be defined to something other than default (unknown)
NOTE: openmoko-panel-demo-0.0.1+svnr1622: recipe_sanity: LICENSE
should be defined to something other than default (unknown)
NOTE: openmoko-stylus-demo-simple-0.0.1+svnr1: recipe_sanity: LICENSE
should be defined to something other than default (unknown)
NOTE: openmoko-stylus-demo-0.0.1+svnr1: recipe_sanity: LICENSE should
be defined to something other than default (unknown)
NOTE: openmoko-community-repository-1.0: recipe_sanity: LICENSE should
be defined to something other than default (unknown)
NOTE: openmoko-toolchain-scripts-0.0+svnr4913: recipe_sanity: LICENSE
should be defined to something other than default (unknown)
NOTE: libopensync-plugin-evo2-sync-0.22: recipe_sanity: LICENSE should
be defined to something other than default (unknown)
NOTE: libopensync-plugin-evo2-sync-0.22+svn20101008: recipe_sanity:
LICENSE should be defined to something other than default (unknown)
NOTE: libopensync-plugin-evolution2-0.36: recipe_sanity: LICENSE
should be defined to something other than default (unknown)
NOTE: libopensync-plugin-file-0.36: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: libopensync-plugin-file-sync-0.22: recipe_sanity: LICENSE should
be defined to something other than default (unknown)
NOTE: libopensync-plugin-file-sync-0.22+svn20101008: recipe_sanity:
LICENSE should be defined to something other than default (unknown)
NOTE: libopensync-plugin-google-calendar-0.36: recipe_sanity: LICENSE
should be defined to something other than default (unknown)
NOTE: libopensync-plugin-irmc-0.36: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: libopensync-plugin-irmc-sync-0.22: recipe_sanity: LICENSE should
be defined to something other than default (unknown)
NOTE: libopensync-plugin-syncml-0.22+svn20101008: recipe_sanity:
LICENSE should be defined to something other than default (unknown)
NOTE: libopensync-plugin-syncml-0.36: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: libopensync-plugin-syncml-client-plugin-0.22+svn20101008:
recipe_sanity: LICENSE should be defined to something other than
default (unknown)
NOTE: libopensync-plugin-syncml-plugin-0.22+svn20101008:
recipe_sanity: LICENSE should be defined to something other than
default (unknown)
NOTE: libopensync-plugin-vformat-0.36: recipe_sanity: LICENSE should
be defined to something other than default (unknown)
NOTE: opie-ttf-support-1.1: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: opkg-ipkg-compat-1.0: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: spectrum-fw-1.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: orrery-2.7: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: oxnas-boot-tools-0.1: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: libio-stringy-perl-2.110: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: liblinux-dvb-perl-1.0: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: libunicode-utf8simple-perl-1.06: recipe_sanity: LICENSE should
be defined to something other than default (unknown)
NOTE: libxml-dom-perl-1.44: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: libxml-libxml-perl-1.70: recipe_sanity: LICENSE should be set
NOTE: libxml-namespacesupport-perl-1.11: recipe_sanity: LICENSE should be s=
et
NOTE: libxml-regexp-perl-0.03: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: libxml-sax-perl-0.96: recipe_sanity: LICENSE should be set
NOTE: pmount-0.9.4: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: pmtools-20050926: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: pngcrush-1.7.9: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: policykit-0.96: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: policykit-0.9: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: policykit-gnome-0.9.2: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: policykit-gnome-0.96: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: prism54-firmware-1.0.3.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: psplash-zap-1.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: pulseaudio-meta-0.9.10: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: puzzles-r7436: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: puzzles-r7436+svn20101008: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: python-phoneutils-0.0.2+gitr0+8a7c719e0c3f1f8c10f77f17422da02d7177f0d=
d:
recipe_sanity: LICENSE should be defined to something other than
default (unknown)
NOTE: python-pycap-0.1.6: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: qgears-2: recipe_sanity: LICENSE should be defined to something
other than default (unknown)
NOTE: qhull-2003.1: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: wolfenqt-e-0.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: wolfenqt-0.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: gtkimageview-1.3.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: fconfig-20060419: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: fis-1.0: recipe_sanity: LICENSE should be defined to something
other than default (unknown)
NOTE: robostix-cmdline-1.0: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: robostix-sertest-1.0: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: r-native-2.0.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: rt61-firmware-1.2: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: rt73-firmware-1.8: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: rygel-0.4.8: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: rygel-0.6.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: schedstat-utils-1.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: elementary-theme-gry-0.8-53084+gitr0+8ca0e9347a7a7fe10dbd5e7d6a4c8d3d=
12482035:
recipe_sanity: LICENSE should be defined to something other than
default (unknown)
NOTE: elementary-theme-neo-0.5-53084+gitr0+fb377425e69ce1fc13f5094801b96836=
203e8154:
recipe_sanity: LICENSE should be defined to something other than
default (unknown)
NOTE: elementary-theme-o2-0.1-53084+gitr0+b5eb3134850c277ad8ae1a960b03ff4a5=
09278a8:
recipe_sanity: LICENSE should be defined to something other than
default (unknown)
NOTE: e-wm-theme-illume-gry-0.3-53084+gitr0+bed3a9ac381b88717b153012fa4b9da=
0c860c6b0:
recipe_sanity: LICENSE should be defined to something other than
default (unknown)
NOTE: e-wm-theme-illume-neo-0.1-53084+gitr0+bed3a9ac381b88717b153012fa4b9da=
0c860c6b0:
recipe_sanity: LICENSE should be defined to something other than
default (unknown)
NOTE: gtk-theme-neo-0.2-53084+gitr0+f847105c5ef5d488a4bce0c0a85d572c3509d56=
f:
recipe_sanity: LICENSE should be defined to something other than
default (unknown)
NOTE: icon-theme-neo-0.2-53084+gitr0+f847105c5ef5d488a4bce0c0a85d572c3509d5=
6f:
recipe_sanity: LICENSE should be defined to something other than
default (unknown)
NOTE: libmodulo-0.0.1+gitr0+7d2f657d248bd86377e66c329aa6826459d406da:
recipe_sanity: LICENSE should be defined to something other than
default (unknown)
NOTE: libphone-ui-shr-0.0.1+gitr0+cced1441a94b08af7576c58f3c7ee29a679ecfeb:
recipe_sanity: LICENSE should be defined to something other than
default (unknown)
NOTE: libphone-utils-0.0.2+gitr0+d3f510d75f76d6d03c53b3376ce1aba1c88062e7:
recipe_sanity: LICENSE should be defined to something other than
default (unknown)
NOTE: ologicd-0.0.1+gitr0+4a32af91a9479ebd4d1d39057354ac9904d74cbb:
recipe_sanity: LICENSE should be defined to something other than
default (unknown)
NOTE: phoneui-shr-theme-neo-0.1+gitr0+20e5e82819a7612aa31c753a6898ccc9e940c=
7c6:
recipe_sanity: LICENSE should be defined to something other than
default (unknown)
NOTE: phoneui-shr-theme-niebiee-0.1+gitr0+8bf704525807f8a29fa1f3ad653d3fea8=
1cd5aa3:
recipe_sanity: LICENSE should be defined to something other than
default (unknown)
NOTE: phoneui-shr-theme-o2-0.1+gitr0+20e5e82819a7612aa31c753a6898ccc9e940c7=
c6:
recipe_sanity: LICENSE should be defined to something other than
default (unknown)
NOTE: shr-installer-0.0.2+gitr0+26c914bb438be450ba768b6131cbb52250ae55ae:
recipe_sanity: LICENSE should be defined to something other than
default (unknown)
NOTE: shr-settings-0.1.1+gitr0+cc7917afdc958443e9110004b3adb38af65ad16e:
recipe_sanity: LICENSE should be defined to something other than
default (unknown)
NOTE: shr-theme-gry-0.1: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: shr-theme-neo-0.2: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: shr-theme-niebiee-0.1: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: shr-theme-o2-0.1: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: shr-theme-sixteen-0.1: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: shr-today-0.0.1+gitr0+7b69649a9df0e85f0c0f7985fd1d93543c3b11e2:
recipe_sanity: LICENSE should be defined to something other than
default (unknown)
NOTE: sl-3.03: recipe_sanity: LICENSE should be defined to something
other than default (unknown)
NOTE: sudo-enable-wheel-group-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: sugar-fructose-1.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: sugar-sucrose-1.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: syslog-ng-2.0.5: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: tango-icon-theme-enable-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: angstrom-task-gnome-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: angstrom-task-lxde-1.0: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: task-arago-toolchain-dvsdk-host-1.0: recipe_sanity: LICENSE
should be defined to something other than default (unknown)
NOTE: task-arago-toolchain-dvsdk-target-1.0: recipe_sanity: LICENSE
should be defined to something other than default (unknown)
NOTE: task-arago-toolchain-gst-host-1.0: recipe_sanity: LICENSE should
be defined to something other than default (unknown)
NOTE: task-arago-toolchain-gst-target-1.0: recipe_sanity: LICENSE
should be defined to something other than default (unknown)
NOTE: task-arago-toolchain-host-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: task-arago-toolchain-target-1.0: recipe_sanity: LICENSE should
be defined to something other than default (unknown)
NOTE: task-base-1.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: task-beagleboard-demo-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: task-boot-1.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: task-demo-x11-1.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: task-e-x11-1.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: task-gmae-1.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: task-gstreamer-ti-1.0: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: task-mamona-systemtap-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: task-mipl-1.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: task-openprotium-1.0: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: task-perl-module-all-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: task-proper-tools-1.0: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: task-sugar-sucrose-1.0: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: task-xfce46-base-1.0: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: task-xfce46-extras-1.0: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: bitblit-0+svnr2: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: ti-dsplib-1_20: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: ti-msp430-chronos-1_05_00_00: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: ti-sysbios-6_21_01_16: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: ti-xgxperf-qt-embedded-1.0.0.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: ti-xgxperf-qt-x11-1.0.0.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: ttf-freefonts-20090104: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: ttyrec-1.0.8: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: tzcode-native-2010m: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: tzdata-2010m: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: u-boot-env-1.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: elf2flt-0.0+svnr1786: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: udev-hostap-cs-vcc-workaround-1.0: recipe_sanity: LICENSE should
be defined to something other than default (unknown)
NOTE: udev-static-devices-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: udns-0.0.9: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: unixbench-4.1.0: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: unixbench-5.1.2: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: unrar-3.9.9: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: vagalume-0.5.1: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: vagalume-0.7.1: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: vagalume-0.8.3: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: vala-terminal-1.1.1+gitr0+0241cf2f19710b885dc060d03ec80af438e8246e:
recipe_sanity: LICENSE should be defined to something other than
default (unknown)
NOTE: vlan-1.8: recipe_sanity: LICENSE should be defined to something
other than default (unknown)
NOTE: vlan-1.9: recipe_sanity: LICENSE should be defined to something
other than default (unknown)
NOTE: arora-0.10.1: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: arora-0.10.2: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: arora-e-0.10.1: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: arora-e-0.10.2: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: webkit-gtk-1.2.3: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: webkit-gtk-1.3.4+svnr68244-r68244: recipe_sanity: LICENSE should
be defined to something other than default (unknown)
NOTE: loader-0.04: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: wrt-imagetools-native-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: xcb-proto-0.9: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: xdg-user-dirs-0.10: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: xerces-j-2.9.1: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: xinetd-2.3.13: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: jaxp1.3-1.3.04: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: xml-commons-resolver1.1-1.2: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: xmltv-0.5.56: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: xorg-headers-native-1.0: recipe_sanity: LICENSE should be
defined to something other than default (unknown)
NOTE: xserver-xorg-conf-0.1: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: createrepo-native-0.9: recipe_sanity: LICENSE should be defined
to something other than default (unknown)
NOTE: yum-3.2.18: recipe_sanity: LICENSE should be defined to
something other than default (unknown)
NOTE: yum-native-3.2.18: recipe_sanity: LICENSE should be defined to
something other than default (unknown)


