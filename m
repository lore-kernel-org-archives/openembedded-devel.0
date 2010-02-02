Received: from mail-yw0-f195.google.com ([209.85.211.195])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NcDg2-0000lx-1X
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Feb 2010 09:00:05 +0100
Received: by ywh33 with SMTP id 33so5143743ywh.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Feb 2010 23:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=uypq1pg9syvy/H6m4UkHoowqQ64Q8Xat9i6+9UljsyI=;
	b=Qc4VH+c4za71kEK1VTZj0As1qSA1ATsj1j5m4jF8jdWvGs5nZN1J/oyBvMBl4nseyG
	mCpH88Jl9sG3fyg5ls8F+iFlIEoadu4SnRJcJUnS/7s1CyMnod/uXhZLDGSObQQfG46X
	9cf0W92Qh3yOINZT9YYfqFnI1Z7rM53Wr9AIE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=dfNARtYcvY9qLLCKb4SfbAgaFzLas47iZXXWW0mc+43IJg2nvtqhreaPlNg/cKMbdg
	Bkax2LDPscZrwjtar8ayFPFfQvm3tLK6lQU1anNyM7tUOGuMmKQ8fW7FlCmveTubnTHx
	kiEebfrw0nYwqWD+7QcgDGmV1l3WZKEO6ZShA=
MIME-Version: 1.0
Received: by 10.100.235.26 with SMTP id i26mr7025509anh.126.1265097454840; 
	Mon, 01 Feb 2010 23:57:34 -0800 (PST)
In-Reply-To: <1265065663.3159.8.camel@rex>
References: <ac9c93b11001300418t644f9b92h926dbae7a232b339@mail.gmail.com>
	<1265065663.3159.8.camel@rex>
Date: Tue, 2 Feb 2010 08:57:34 +0100
Message-ID: <ac9c93b11002012357k2f7a920dqd800db05beab0664@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.195
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: packaged staging issue; additional packages
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
X-List-Received-Date: Tue, 02 Feb 2010 08:00:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/2/2 Richard Purdie <rpurdie@rpsys.net>:
> On Sat, 2010-01-30 at 13:18 +0100, Frans Meulenbroeks wrote:
>> I seem to have found an issue with packaged staging.
>> I'll try to describe the problem, but maybe my understanding is not
>> 100% so bear with me in that case
> [...]
>> I've focused myself on this one:
>>
>> =A0* opkg_install_cmd: Cannot install package udev.
>> =A0* satisfy_dependencies_for: Cannot satisfy the following dependencies
>> for sysvinit:
>> =A0* satisfy_dependencies_for: =A0 =A0sysvinit-inittab *
>> =A0* opkg_install_cmd: Cannot install package sysvinit.
>>
>> What seems to be the case here is the following:
>> sysvinit bb file contains the following:
>>
>> RDEPENDS_${PN} =3D "${PN}-inittab"
>>
>> PACKAGES =3D+ "bootlogd ${PN}-inittab"
>> FILES_bootlogd =3D "/etc/init.d/bootlogd /etc/init.d/stop-bootlogd
>> /etc/rc?.d/S*bootlogd /sbin/bootlogd"
>> FILES_${PN}-inittab =3D "${sysconfdir}/inittab"
>>
>> So it generates the sysvinit-inittab package and RDEPENDS on it.
>>
>> If I search for inittab in my work/sysvinit dir I get:
>> ./inittab
>> ./sysvinit-2.86/man/inittab.5
>> ./staging-pkg/staging/armv7a-angstrom-linux-gnueabi/usr/share/man/man5/i=
nittab.5
>> ./staging-pkg/pkgdata/beagleboard-angstrom-linux-gnueabi/runtime/sysvini=
t-inittab
>> ./staging-pkg/pkgdata/beagleboard-angstrom-linux-gnueabi/runtime/sysvini=
t-inittab.packaged
>> ./sysroot-destdir/home/frans/oe/tmp_angstrom/staging/armv7a-angstrom-lin=
ux-gnueabi/usr/share/man/man5/inittab.5
>> ./packages-split/sysvinit-inittab
>> ./packages-split/sysvinit-inittab/etc
>> ./packages-split/sysvinit-inittab/etc/inittab
>> ./packages-split/sysvinit-doc/usr/share/man/man5/inittab.5
>> ./package/etc/inittab
>> ./package/usr/share/man/man5/inittab.5
>> ./image/etc/inittab
>> ./image/usr/share/man/man5/inittab.5
>>
>> So the file inittab does not end up in packaged staging.
>>
>> It seems to me that packaged-staging.bbclass needs some work and that
>> something like staging_packager needs to be involved for all packages
>> in a recipe.
>> Howeever, implementing this is beyond my python capabilities and also
>> beyond my understanding of the build system.
>>
>> Is my analysis correct?
>> Can someone implement something or provide some guidance?
>
> inittab is a false lead but you're heading in the right direction. The
> staging package should contain a sysvinit-inittab*.ipk. Whilst I only
> have a Poky build handy, I see:
>
> find -name sysvinit-inittab*
> ./packages-split/sysvinit-inittab
> ./staging-pkg/deploy/ipk/netbook/sysvinit-inittab_2.86-r32_netbook.ipk
> ./staging-pkg/pkgdata/netbook-poky-linux/runtime/sysvinit-inittab
> ./staging-pkg/pkgdata/netbook-poky-linux/runtime/sysvinit-inittab.package=
d
>
> The key line being:
>
> ./staging-pkg/deploy/ipk/netbook/sysvinit-inittab_2.86-r32_netbook.ipk
>
> If something like that file isn't there, something in OE's package
> staging is broken.
>
> Cheers,
>
> Richard

Hi Richard,

Thanks for the reply.
I have an ipk in deploy in my tmp dir, but I guess that is not the one I ne=
ed.

What I tried to do is to move the staging files out of the temp dir by
saying in my local.conf:

DEPLOY_DIR_PSTAGE =3D "${OETREE}/build/pstage/"

(where OETREE evaluates to /home/frans/OE )

This is as described by hrw in
http://marcin.juszkiewicz.com.pl/2008/07/01/packaged-staging-and-what-it-gi=
ves/

I get the errors above after removing my tmp dir.
When i search for sysvinit in my staging dir I only find this:

frans@frans:~/OE$ find build/pstage -name *sysvinit*
build/pstage/angstromglibc/staging-sysvinit-beagleboard-angstrom-linux-gnue=
abi_2.86-r57_i686-linux.ipk

If I run find on the whole tree I get:

frans@frans:~/OE$ find  -name *sysvinit*
./downloads/sysvinit-2.86.tar.gz.md5
./downloads/sysvinit-2.86.tar.gz
./openembedded/recipes/sysvinit
./openembedded/recipes/sysvinit/sysvinit
./openembedded/recipes/sysvinit/sysvinit_2.86.bb
./openembedded/recipes/sysvinit/sysvinit-2.86
./angstrom-dev/deploy/glibc/sources/GPL/sysvinit
./angstrom-dev/deploy/glibc/sources/GPL/sysvinit/sysvinit-2.86.tar.gz.md5
./angstrom-dev/deploy/glibc/sources/GPL/sysvinit/sysvinit-2.86.tar.gz
./angstrom-dev/deploy/glibc/ipk/armv7a/sysvinit-pidof_2.86-r57.5_armv7a.ipk
./angstrom-dev/deploy/glibc/ipk/armv7a/sysvinit-doc_2.86-r57.5_armv7a.ipk
./angstrom-dev/deploy/glibc/ipk/armv7a/sysvinit-sulogin_2.86-r57.5_armv7a.i=
pk
./angstrom-dev/deploy/glibc/ipk/armv7a/sysvinit-dbg_2.86-r57.5_armv7a.ipk
./angstrom-dev/deploy/glibc/ipk/armv7a/sysvinit-dev_2.86-r57.5_armv7a.ipk
./angstrom-dev/deploy/glibc/ipk/armv7a/sysvinit-utils_2.86-r57.5_armv7a.ipk
./angstrom-dev/deploy/glibc/ipk/armv7a/sysvinit_2.86-r57.5_armv7a.ipk
./angstrom-dev/deploy/glibc/ipk/beagleboard/sysvinit-inittab_2.86-r57.5_bea=
gleboard.ipk
./angstrom-dev/pkgdata/beagleboard-angstrom-linux-gnueabi/sysvinit
./angstrom-dev/pkgdata/beagleboard-angstrom-linux-gnueabi/runtime/sysvinit-=
sulogin.packaged
./angstrom-dev/pkgdata/beagleboard-angstrom-linux-gnueabi/runtime/sysvinit-=
locale
./angstrom-dev/pkgdata/beagleboard-angstrom-linux-gnueabi/runtime/sysvinit
./angstrom-dev/pkgdata/beagleboard-angstrom-linux-gnueabi/runtime/sysvinit-=
doc.packaged
./angstrom-dev/pkgdata/beagleboard-angstrom-linux-gnueabi/runtime/sysvinit-=
pidof.packaged
./angstrom-dev/pkgdata/beagleboard-angstrom-linux-gnueabi/runtime/sysvinit-=
dbg
./angstrom-dev/pkgdata/beagleboard-angstrom-linux-gnueabi/runtime/sysvinit-=
pidof
./angstrom-dev/pkgdata/beagleboard-angstrom-linux-gnueabi/runtime/sysvinit-=
doc
./angstrom-dev/pkgdata/beagleboard-angstrom-linux-gnueabi/runtime/sysvinit-=
dev.packaged
./angstrom-dev/pkgdata/beagleboard-angstrom-linux-gnueabi/runtime/sysvinit-=
dbg.packaged
./angstrom-dev/pkgdata/beagleboard-angstrom-linux-gnueabi/runtime/sysvinit-=
dev
./angstrom-dev/pkgdata/beagleboard-angstrom-linux-gnueabi/runtime/sysvinit-=
utils
./angstrom-dev/pkgdata/beagleboard-angstrom-linux-gnueabi/runtime/sysvinit-=
utils.packaged
./angstrom-dev/pkgdata/beagleboard-angstrom-linux-gnueabi/runtime/sysvinit.=
packaged
./angstrom-dev/pkgdata/beagleboard-angstrom-linux-gnueabi/runtime/sysvinit-=
inittab
./angstrom-dev/pkgdata/beagleboard-angstrom-linux-gnueabi/runtime/sysvinit-=
sulogin
./angstrom-dev/pkgdata/beagleboard-angstrom-linux-gnueabi/runtime/sysvinit-=
static
./angstrom-dev/pkgdata/beagleboard-angstrom-linux-gnueabi/runtime/sysvinit-=
inittab.packaged
./angstrom-dev/stamps/beagleboard-angstrom-linux-gnueabi/sysvinit-2.86-r57.=
do_populate_staging
./angstrom-dev/stamps/beagleboard-angstrom-linux-gnueabi/sysvinit-2.86-r57.=
do_qa_configure
./angstrom-dev/stamps/beagleboard-angstrom-linux-gnueabi/sysvinit-2.86-r57.=
do_package
./angstrom-dev/stamps/beagleboard-angstrom-linux-gnueabi/sysvinit-2.86-r57.=
do_package_write
./angstrom-dev/stamps/beagleboard-angstrom-linux-gnueabi/sysvinit-2.86-r57.=
do_compile
./angstrom-dev/stamps/beagleboard-angstrom-linux-gnueabi/sysvinit-2.86-r57.=
do_patch
./angstrom-dev/stamps/beagleboard-angstrom-linux-gnueabi/sysvinit-2.86-r57.=
do_distribute_sources
./angstrom-dev/stamps/beagleboard-angstrom-linux-gnueabi/sysvinit-2.86-r57.=
do_qa_staging
./angstrom-dev/stamps/beagleboard-angstrom-linux-gnueabi/sysvinit-2.86-r57.=
do_configure
./angstrom-dev/stamps/beagleboard-angstrom-linux-gnueabi/sysvinit-2.86-r57.=
do_rm_work
./angstrom-dev/stamps/beagleboard-angstrom-linux-gnueabi/sysvinit-2.86-r57.=
do_package_write_ipk
./angstrom-dev/stamps/beagleboard-angstrom-linux-gnueabi/sysvinit-2.86-r57.=
do_package_stage
./angstrom-dev/stamps/beagleboard-angstrom-linux-gnueabi/sysvinit-2.86-r57.=
do_package_stage_all
./angstrom-dev/stamps/beagleboard-angstrom-linux-gnueabi/sysvinit-2.86-r57.=
do_build
./angstrom-dev/stamps/beagleboard-angstrom-linux-gnueabi/sysvinit-2.86-r57.=
do_install
./angstrom-dev/stamps/beagleboard-angstrom-linux-gnueabi/sysvinit-2.86-r57.=
do_unpack
./angstrom-dev/stamps/beagleboard-angstrom-linux-gnueabi/sysvinit-2.86-r57.=
do_setscene
./angstrom-dev/stamps/beagleboard-angstrom-linux-gnueabi/sysvinit-2.86-r57.=
do_fetch
./angstrom-dev/work/beagleboard-angstrom-linux-gnueabi/sysvinit-2.86-r57
./angstrom-dev/usr/lib/opkg/info/staging-sysvinit-beagleboard-angstrom-linu=
x-gnueabi.control
./angstrom-dev/usr/lib/opkg/info/staging-sysvinit-beagleboard-angstrom-linu=
x-gnueabi.list
./build/pstage/angstromglibc/staging-sysvinit-beagleboard-angstrom-linux-gn=
ueabi_2.86-r57_i686-linux.ipk

here angstrom-dev is the tmp dir (I followed the instructions from
angstrom-distributions to set up this tree), and the package is there
in deploy, but (as per hrw's page) those are gone.

The only thing I can think of is what is suggested by denix on
http://blog.denix.org/2008/09/getting-dangerous-with-packaged-staging.html
: also move deploy out of the temp dir. (actually only found this
while posting this, so didn't test it).
Can I change DEPLOY_DIR in local.conf? Do I need to? (currently it is
set in conf/distro/include/angstrom.inc )
(anyway will give it a try).

Frans.


