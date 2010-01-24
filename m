Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NYsD7-0000o9-Tw
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 03:28:25 +0100
Received: by yxe5 with SMTP id 5so1989787yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 18:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=tNH5eZT7RE/DHYAJf+SeGUs7PXiCtIS+SYf58HwAmZQ=;
	b=JDSkcBN1ZoXwV2KueKBzE6Tlc/3tr62dp5lb8RhUVkkmcxROSGQWNLQUnVIGOXcbic
	ydNZFoJvSoLy0hsPX/Q1IoJ3tGScBo2Od0rFqvxgHczk+WCi5EMgpt5eloQxuebRwqUN
	3OGYNq7zD4l1gcaMVJycHqztr8UGahJzFdPxY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=xAVqWcGFOESL8kDjZYaCHEChp7TAiC45T3kv+q8zpHP5DckDnjZoHfGwh3BtZZZR2T
	PsSRl3ep6kMH67k+eWnAM9I6LBE3rS2bSjuPNvLnEFjJIQzNs3mTcoSnmw6hCwD2XuKM
	DCw1ldkLaQB0UHgFgJ3k0IyX22/3bOgAFxKLI=
Received: by 10.91.160.30 with SMTP id m30mr4311374ago.1.1264299962343;
	Sat, 23 Jan 2010 18:26:02 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.71.84])
	by mx.google.com with ESMTPS id 22sm1302028ywh.30.2010.01.23.18.25.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 23 Jan 2010 18:26:00 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <op.u6zcpxd7mn1qzu@guohr-laptop-ubuntu>
	<19c1b8a91001231532y27421c4fk33b7b2d961bc16cc@mail.gmail.com>
Date: Sun, 24 Jan 2010 10:25:51 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u60mc6flmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <19c1b8a91001231532y27421c4fk33b7b2d961bc16cc@mail.gmail.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: undefined reference to `_restfpr_14_x' in gcc-4.4.2/libgcc/../gcc/unwind.inc:307 when building ppc603e
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
X-List-Received-Date: Sun, 24 Jan 2010 02:28:25 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

By the way, the similar error occurs when LIBC=3Dglibc, DISTRO=3Dmicro a=
nd  =

MACHINE=3Dstorcenter

=E5=9C=A8 Sun, 24 Jan 2010 07:32:25 +0800=EF=BC=8CKhem Raj <raj.khem@gma=
il.com> =E5=86=99=E9=81=93:

>> Is it caused by the incorrect toolchain set?
> probably some gcc misconfiguration. What options are passed to gcc
> configure and eglibc configure can you post them plz.

eglibc-2.10 configuration options:
/media/work-disk/testslave/oe_gss_inc_change_allinone/build/tmp/work/egl=
ibc/ppc603e-oe-linux/eglibc-2.10-r8.6/eglibc-2_10/libc/configure  =

--build=3Di686-linux --host=3Dpowerpc-oe-linux --target=3Dpowerpc-oe-lin=
ux  =

--prefix=3D --exec_prefix=3D --bindir=3D/bin --sbindir=3D/sbin  =

--libexecdir=3D/libexec --datadir=3D/share --sysconfdir=3D/etc  =

--sharedstatedir=3D/com --localstatedir=3D/var --libdir=3D/lib  =

--includedir=3D/include --oldincludedir=3D/include --infodir=3D/share/in=
fo  =

--mandir=3D/share/man --enable-kernel=3D2.4.0 --without-cvs --disable-pr=
ofile  =

--disable-debug --without-gd --enable-clocale=3Dgnu  =

--enable-add-ons=3Dports,nptl,libidn,ports  =

--with-headers=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/b=
uild/tmp/staging/eglibc/ppc603e-oe-linux/include  =

--without-selinux

gcc-cross-initial-4.4.2 configuration options:
/media/work-disk/testslave/oe_gss_inc_change_allinone/build/tmp/work/egl=
ibc/ppc603e-oe-linux/gcc-cross-initial-4.4.2-r2.1/gcc-4.4.2/configure  =

--build=3Di686-linux --host=3Di686-linux  =

--target=3Dpowerpc-oe-linux                =

--prefix=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/build/t=
mp/cross/eglibc/ppc603e                    =

--exec_prefix=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/bu=
ild/tmp/cross/eglibc/ppc603e               =

--bindir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/build/t=
mp/cross/eglibc/ppc603e/bin                =

--sbindir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/build/=
tmp/cross/eglibc/ppc603e/bin               =

--libexecdir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/bui=
ld/tmp/cross/eglibc/ppc603e/libexec                =

--datadir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/build/=
tmp/cross/eglibc/ppc603e/share                     =

--sysconfdir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/bui=
ld/tmp/cross/eglibc/ppc603e/etc                    =

--sharedstatedir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone=
/build/tmp/cross/eglibc/ppc603e/com                =

--localstatedir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/=
build/tmp/cross/eglibc/ppc603e/var                 =

--libdir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/build/t=
mp/cross/eglibc/ppc603e/lib                =

--includedir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/bui=
ld/tmp/cross/eglibc/ppc603e/include                =

--oldincludedir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/=
build/tmp/cross/eglibc/ppc603e/include                     =

--infodir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/build/=
tmp/cross/eglibc/ppc603e/share/info                =

--mandir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/build/t=
mp/cross/eglibc/ppc603e/share/man                      =

--with-local-prefix=3D/media/work-disk/testslave/oe_gss_inc_change_allin=
one/build/tmp/staging/eglibc/ppc603e-oe-linux              =

--with-newlib           --without-headers                =

--disable-shared                --disable-threads                =

--disable-multilib              --disable-__cxa_atexit           =

--enable-languages=3Dc            --enable-target-optspace              =
   =

--program-prefix=3Dpowerpc-oe-linux-               =

--with-sysroot=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/b=
uild/tmp/staging/eglibc/ppc603e-oe-linux           =

--with-build-sysroot=3D/media/work-disk/testslave/oe_gss_inc_change_alli=
none/build/tmp/staging/eglibc/ppc603e-oe-linux                          =
     =

--disable-libmudflap            --disable-libgomp                =

--enable-decimal-float=3Dno               --disable-libssp  =

--enable-__cxa_atexit

gcc-cross-intermediate-4.4.2 configuration options:
/media/work-disk/testslave/oe_gss_inc_change_allinone/build/tmp/work/egl=
ibc/ppc603e-oe-linux/gcc-cross-intermediate-4.4.2-r2.1/gcc-4.4.2/configu=
re                     =

--build=3Di686-linux              --host=3Di686-linux                =

--target=3Dpowerpc-oe-linux                =

--prefix=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/build/t=
mp/cross/eglibc/ppc603e                    =

--exec_prefix=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/bu=
ild/tmp/cross/eglibc/ppc603e               =

--bindir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/build/t=
mp/cross/eglibc/ppc603e/bin                =

--sbindir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/build/=
tmp/cross/eglibc/ppc603e/bin               =

--libexecdir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/bui=
ld/tmp/cross/eglibc/ppc603e/libexec                =

--datadir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/build/=
tmp/cross/eglibc/ppc603e/share                     =

--sysconfdir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/bui=
ld/tmp/cross/eglibc/ppc603e/etc                    =

--sharedstatedir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone=
/build/tmp/cross/eglibc/ppc603e/com                =

--localstatedir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/=
build/tmp/cross/eglibc/ppc603e/var                 =

--libdir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/build/t=
mp/cross/eglibc/ppc603e/lib                =

--includedir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/bui=
ld/tmp/cross/eglibc/ppc603e/include                =

--oldincludedir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/=
build/tmp/cross/eglibc/ppc603e/include                     =

--infodir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/build/=
tmp/cross/eglibc/ppc603e/share/info                =

--mandir=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/build/t=
mp/cross/eglibc/ppc603e/share/man                      =

--with-local-prefix=3D/media/work-disk/testslave/oe_gss_inc_change_allin=
one/build/tmp/staging/eglibc/ppc603e-oe-linux              =

--enable-shared                 --disable-multilib               =

--disable-threads               --enable-languages=3Dc             =

--enable-target-optspace                 =

--program-prefix=3Dpowerpc-oe-linux-               =

--with-sysroot=3D/media/work-disk/testslave/oe_gss_inc_change_allinone/b=
uild/tmp/staging/eglibc/ppc603e-oe-linux           =

--with-build-sysroot=3D/media/work-disk/testslave/oe_gss_inc_change_alli=
none/build/tmp/staging/eglibc/ppc603e-oe-linux                          =
     =

--disable-libmudflap            --disable-libgomp                =

--disable-libssp               --enable-__cxa_atexit

-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


