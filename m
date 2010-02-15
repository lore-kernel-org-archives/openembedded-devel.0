Received: from mail-fx0-f216.google.com ([209.85.220.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Nh4eX-00014l-Ja
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Feb 2010 18:22:36 +0100
Received: by fxm8 with SMTP id 8so5224649fxm.26
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2010 09:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=IIsC0zL51Y3puoyex+eCNXfdug6JEqRYqByIZv2zxRc=;
	b=Go9P5FimhEjyOH9/HqBZeUKNpKjYuHvfITTaWueNBF6kikW4ghUGNeVosaO/mEj5Cg
	tLuC/KPLPUl6WdfECrc9FDjaJW2lM2YTOc8qHtPTR68o3BOTwwjWCqFHlqHMK+X5OpSU
	d7GR0WC8T/PurWY1PvSbEYgxEJG3b+xpCbWW0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=hyqbRklUWgOaJ655D+oQ6dGHhTlh7SrwEeTJ/BKAoDNTRJoZypUjamzBQ5P+/lKjQV
	aiIEd3Mjbresvt4U3kGlRyU9fnceBLDJgDfe17/90b442s1ToBl0w7a/xj5Kqb+L2ioD
	P+2gLiWvHhOzYnCH8diiQR1/fGPzVpLEnUJMk=
Received: by 10.223.63.20 with SMTP id z20mr2154239fah.98.1266254395768;
	Mon, 15 Feb 2010 09:19:55 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm3094582fxm.10.2010.02.15.09.19.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 15 Feb 2010 09:19:53 -0800 (PST)
Date: Mon, 15 Feb 2010 18:19:52 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100215171952.GA3233@jama>
References: <20100214135613.GF5364@jama> <4B79673B.50108@balister.org>
	<ac9c93b11002150859i4aa5ee7eid6a648d95fa25d6c@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <ac9c93b11002150859i4aa5ee7eid6a648d95fa25d6c@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.216
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Using bitbake in minimal chroot environment
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
X-List-Received-Date: Mon, 15 Feb 2010 17:22:37 -0000
X-Groupsio-MsgNum: 16802
Content-Type: multipart/mixed; boundary="MGYHOYXEY6WxJCY8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Feb 15, 2010 at 05:59:39PM +0100, Frans Meulenbroeks wrote:
> >> I'm just thinking about using bitbake only in minimalistic chroot.

Already rebuilding in new chroot :).

> >>
> >> What are advantages/disadvantages?
> >>
> >> How I see it:
> >>
> >> Advantages:
> >> 1) more secure (I started to use separate user for bitbake, when I
> >>    started to play with bitbake master instead release - because that
> >>    warning it said), but chroot is even better.
> >> 2) less problems when autotools pick some header or lib from buildhost
> >>    instead of staging
> >> 3) easier to check, that -native package is missing for some important
> >>    lib
> >>
> >> Disadvantages:
> >> 1) Few more MB for building environment (extra libc, gcc, binutils, git,
> >>    svn, sh, etc. installed in chroot
> 
> If they are on the same filesystem you could use hard links and save those MBs.

Not so big problem for me, so I used mount --bind for dirs I want to
share (ie /usr/portage as I'm using gentoo) and it took only about
100MB.. so not a big deal

> >> 2) More administrative to keep chroot system updated
> >> 3) harder to check, that autotools won't pick something from buildhost
> >>    in normal environment before pushing new version/recipe (ie I won't
> >>    have SDL libs installed in chroot, but everybody else will and maybe
> >>    build will fail for them after I push some recipe.
> >
> > I see this as a good thing :)

The last point? Well it's good for me (less issues) but if I push some
recipe failing for 99% other builders just because they have pretty
standard libs on their systems, then I should be blamed for pushing
crappy recipe :).

> Seems a good plan to me, please keep us posted.
> (actually I've been considering building in a minimalistic VM)

Well VM would be much slower.. 

If someone is interested in that chroot I can push tar.bz2 somewhere..
but I guess that it's not needed (as it's only slightly stripped stage3
gentoo tarball).

Additional apps built (qemu-kvm just because I have ASSUME_PROVIDED for
that as there is mmap issue fixed in that newer version)

qemu-kvm diffstat texi2html cvs screen subversion git bitbake

/etc/make.conf and chrootOE.sh I'm using in attachement

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         

--MGYHOYXEY6WxJCY8
Content-Type: application/x-sh
Content-Disposition: attachment; filename="chrootOE.sh"
Content-Transfer-Encoding: quoted-printable

set -x
cd /home/projects/OE-chroot
mount -o bind /dev/ dev
mount -o bind /dev/pts dev/pts
mount -o bind /sys/ sys
mount -o bind /usr/src usr/src
#mount -o bind /etc/portage etc/portage
mount -o bind /tmp/ tmp
mount -o bind /home/projects/OE/ OE
mount -o bind /home/downloads/OE/ OE/downloads
mount -o bind /tmp/tmpwork/oe-dev-shr OE/tmpdir-dev-shr/work
mount -o bind /tmp/tmpwork/oe-dev OE/tmpdir-dev/work
mount -o bind /usr/local/portage usr/local/portage
mount -o bind /usr/portage usr/portage
mount -o bind /proc/ proc
#mount -o bind /proc/bus/usb proc/bus/usb
cp -pf /etc/resolv.conf etc >/dev/null &
cp -pf /etc/hosts etc > /dev/null &
cp -Ppf /etc/localtime etc >/dev/null &

chroot /home/projects/OE-chroot /bin/bash
umount dev/pts
umount dev
umount sys
umount usr/src
#umount etc/portage
umount home
umount tmp
umount OE/downloads
umount OE/tmpdir-dev-shr/work
umount OE/tmpdir-dev/work
umount OE
umount usr/local/portage
umount usr/portage
#umount proc/bus/usb
umount proc


--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="make.conf"

CHOST="x86_64-pc-linux-gnu"
USE="mmx sse sse2 -kde -gnome -doc -epydoc -webdav -perl -berkdb -dso -nls -python -sdl"
CFLAGS="-O2 -march=barcelona -pipe -ftree-vectorize"
CXXFLAGS="${CFLAGS} -fvisibility-inlines-hidden -fvisibility=hidden"
LDFLAGS="-Wl,-O1 -Wl,--as-needed -Wl,--hash-style=gnu"
#MAKEOPTS="-j1"
MAKEOPTS="-j5"
ACCEPT_KEYWORDS="~amd64"
PORTDIR=/usr/portage
PORTAGE_TMPDIR=/tmp/tmpwork
DISTDIR=/tmp/distfiles
PKGDIR=/tmp/binpkgs
FEATURES="sandbox usersandbox"
GENTOO_MIRRORS="http://gentoo.mirror.web4u.cz/distfiles/"
SYNC="rsync://rsync.gentoo.org/gentoo-portage"
PORTAGE_ECLASS_WARNING_ENABLE="0"
QEMU_SOFTMMU_TARGETS="arm"
QEMU_USER_TARGETS="arm armeb"

PORTDIR_OVERLAY="
/usr/local/portage
"


--MGYHOYXEY6WxJCY8--
