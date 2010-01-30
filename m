Received: from mail-yx0-f180.google.com ([209.85.210.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NbCJz-0006lc-6s
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jan 2010 13:21:06 +0100
Received: by yxe10 with SMTP id 10so2593805yxe.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jan 2010 04:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=JaiAxuaWkBJXO1d6vX/OFCilEE4OBlFjE/y+oQ2vdEo=;
	b=vBFjRTdMVL8dH7jxwD91QaV7gGdaxWTyk97zgjHRAOISeTHOSWgS5G8XyST4oa3sDM
	qTFuYL8qLDX/JEISIVQJc2lw99SoIzU0UqYOZ0kegdOcxeoSCdPovTc2Mv93YcHe1/iU
	uZ+y/Pd3/0LTtrY4CuEO9psl/ul87jp2GMtW4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=W49ikBDUwRYecd83TuAYm0ABGRLdBSWovmDP74N5rT1uZsxBHISjUefRIH0/Md7lKK
	uRZZP2WvDHvIeW31XpD+IzTy2JRRf43W1+RQsB+fvo8mApe33ktKD+x3fK0hLKkz7bY3
	iQZhCIgnDXN3ozN55uwmZuA1Pz/W6NDTBCCNQ=
MIME-Version: 1.0
Received: by 10.101.170.12 with SMTP id x12mr2504716ano.127.1264853918268; 
	Sat, 30 Jan 2010 04:18:38 -0800 (PST)
Date: Sat, 30 Jan 2010 13:18:38 +0100
Message-ID: <ac9c93b11001300418t644f9b92h926dbae7a232b339@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.180
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: packaged staging issue; additional packages
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
X-List-Received-Date: Sat, 30 Jan 2010 12:21:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

I seem to have found an issue with packaged staging.
I'll try to describe the problem, but maybe my understanding is not
100% so bear with me in that case

What happens is that I wanted to rebuild console-image from packaged staging.

This failed with the following errors:

Collected errors:
 * opkg_install_cmd: Cannot install package task-base.
 * opkg_install_cmd: Cannot install package psplash-angstrom.
 * opkg_install_cmd: Cannot install package psplash-zap.
 * opkg_install_cmd: Cannot install package task-base-extended.
 * satisfy_dependencies_for: Cannot satisfy the following dependencies
for initscripts:
 * satisfy_dependencies_for:    update-rc.d *
 * opkg_install_cmd: Cannot install package initscripts.
 * satisfy_dependencies_for: Cannot satisfy the following dependencies for udev:
 * satisfy_dependencies_for:    update-rc.d *
 * opkg_install_cmd: Cannot install package udev.
 * satisfy_dependencies_for: Cannot satisfy the following dependencies
for sysvinit:
 * satisfy_dependencies_for:    sysvinit-inittab *
 * opkg_install_cmd: Cannot install package sysvinit.
 * opkg_install_cmd: Cannot install package angstrom-feed-configs.

I've focused myself on this one:

 * opkg_install_cmd: Cannot install package udev.
 * satisfy_dependencies_for: Cannot satisfy the following dependencies
for sysvinit:
 * satisfy_dependencies_for:    sysvinit-inittab *
 * opkg_install_cmd: Cannot install package sysvinit.

What seems to be the case here is the following:
sysvinit bb file contains the following:

RDEPENDS_${PN} = "${PN}-inittab"

PACKAGES =+ "bootlogd ${PN}-inittab"
FILES_bootlogd = "/etc/init.d/bootlogd /etc/init.d/stop-bootlogd
/etc/rc?.d/S*bootlogd /sbin/bootlogd"
FILES_${PN}-inittab = "${sysconfdir}/inittab"

So it generates the sysvinit-inittab package and RDEPENDS on it.

If I search for inittab in my work/sysvinit dir I get:
./inittab
./sysvinit-2.86/man/inittab.5
./staging-pkg/staging/armv7a-angstrom-linux-gnueabi/usr/share/man/man5/inittab.5
./staging-pkg/pkgdata/beagleboard-angstrom-linux-gnueabi/runtime/sysvinit-inittab
./staging-pkg/pkgdata/beagleboard-angstrom-linux-gnueabi/runtime/sysvinit-inittab.packaged
./sysroot-destdir/home/frans/oe/tmp_angstrom/staging/armv7a-angstrom-linux-gnueabi/usr/share/man/man5/inittab.5
./packages-split/sysvinit-inittab
./packages-split/sysvinit-inittab/etc
./packages-split/sysvinit-inittab/etc/inittab
./packages-split/sysvinit-doc/usr/share/man/man5/inittab.5
./package/etc/inittab
./package/usr/share/man/man5/inittab.5
./image/etc/inittab
./image/usr/share/man/man5/inittab.5

So the file inittab does not end up in packaged staging.

It seems to me that packaged-staging.bbclass needs some work and that
something like staging_packager needs to be involved for all packages
in a recipe.
Howeever, implementing this is beyond my python capabilities and also
beyond my understanding of the build system.

Is my analysis correct?
Can someone implement something or provide some guidance?

Frans


