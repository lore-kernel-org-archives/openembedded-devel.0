Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f180.google.com (mail-vc0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id CEAC460167;
	Wed,  8 Oct 2014 09:46:40 +0000 (UTC)
Received: by mail-vc0-f180.google.com with SMTP id le20so6212287vcb.25
	for <multiple recipients>; Wed, 08 Oct 2014 02:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=8u8+B5SClEhy7JmYxOBSMA3EvdYsTcy0yjQHlq6V60s=;
	b=TkthlpWztXcanl29bDcsviacc0FPrO9LAIaWZsfsmTXa/90k0BacMybS4pdYOu4sPo
	FxxJMQeFUIr1zQiJTFjIYf9iPIWW4d49eKjFRwZHwnukefCJEN93hrS2TBVzkaJtrj2J
	UIXkQIi634Sqb56AW6cuDZ9oXphe92XMrR+dcWBXsFrQgk/0eiVCmCuj1sHRTXvG8DrB
	Ks7zJzp+GjyblUq1NM6i6ZkieJ70ns3J5QjxzWXTrgxXCCHJloPg6W6JFY3STopZSuSe
	92REnEkBcUgfoiWquckZ8HVU0v5/BfSgHo47qvavGEAzLUgGJhnqoi15wyxTnjbdWED9
	Wgxw==
MIME-Version: 1.0
X-Received: by 10.221.21.134 with SMTP id qs6mr3539767vcb.72.1412761601147;
	Wed, 08 Oct 2014 02:46:41 -0700 (PDT)
Received: by 10.52.171.233 with HTTP; Wed, 8 Oct 2014 02:46:41 -0700 (PDT)
In-Reply-To: <CALbNGRQ44osDGnd2q+QWsqhXS+SbLMKuBFn8q8Rir9GPn+Akdw@mail.gmail.com>
References: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
	<1412151555-19865-5-git-send-email-schnitzeltony@googlemail.com>
	<20141003200426.GM25706@jama> <20141003201007.GN25706@jama>
	<CALbNGRTP7S6MAxFU-yo2xXWTMbo3h-A8uS94ALLxgOOiONL6nQ@mail.gmail.com>
	<20141006152331.GV25706@jama>
	<CALbNGRQ44osDGnd2q+QWsqhXS+SbLMKuBFn8q8Rir9GPn+Akdw@mail.gmail.com>
Date: Wed, 8 Oct 2014 11:46:41 +0200
Message-ID: <CALbNGRQaozpFn0GzTz6+NEK==DTeYFo9zJLgQF_bCiJjtVEStA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH][meta-oe 04/15] network-manager-applet: update to 0.9.8.10
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Oct 2014 09:46:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 7, 2014 at 8:41 AM, Andreas M=C3=BCller <schnitzeltony@googlema=
il.com
> wrote:

> On Mon, Oct 6, 2014 at 5:23 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>> On Mon, Oct 06, 2014 at 10:32:49AM +0200, Andreas M=C3=BCller wrote:
>> > On Fri, Oct 3, 2014 at 10:10 PM, Martin Jansa <martin.jansa@gmail.com>
>> > wrote:
>> >
>> > > On Fri, Oct 03, 2014 at 10:04:26PM +0200, Martin Jansa wrote:
>> > > > On Wed, Oct 01, 2014 at 10:19:04AM +0200, Andreas M=C3=BCller wrot=
e:
>> > > > > * add libsecret to DEPENDS
>> > > > > * remove libglade from DEPENDS
>> > > > > * wireless (nm-signal-*.png) icons were updated upstream
>> > > > > * inherit gnomebase instead of gnome
>> > > > > * make bluetooth PACKAGECONFIG - disabled by default
>> > > >
>> > > > For some reason it has now the same problem as navit (through
>> gypsy.la)
>> > > >
>> > > > | x86_64-oe-linux-libtool: compile:  x86_64-oe-linux-gcc -m64
>> > > -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse
>> > >
>> --sysroot=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-6=
4
>> > > -DHAVE_CONFIG_H -I.
>> > >
>> -I/home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/netwo=
rk-manager-applet/0.9.8.10-r0/network-manager-applet-0.9.8.10/src/utils
>> > > -I../.. -pthread
>> > >
>> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/incl=
ude/gtk-2.0
>> > >
>> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/lib/=
gtk-2.0/include
>> > >
>> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/incl=
ude/pango-1.0
>> > >
>> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/incl=
ude/atk-1.0
>> > >
>> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/incl=
ude/cairo
>> > >
>> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/incl=
ude/pixman-1
>> > >
>> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/incl=
ude/libpng16
>> > >
>> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/incl=
ude/gdk-pixbuf-2.0
>> > >
>> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/incl=
ude/libpng16
>> > >
>> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/incl=
ude/pango-1.0
>> > >
>> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/incl=
ude/harfbuzz
>> > >
>> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/incl=
ude/pango-1.0
>> > >
>> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/incl=
ude/glib-2.0
>> > >
>> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/lib/=
glib-2.0/include
>> > >
>> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/home/jen=
kins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/include/freetype2
>> > >
>> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/incl=
ude/freetype2
>> > > -pthread
>> > >
>> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/incl=
ude/libnm-glib
>> > >
>> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/incl=
ude/NetworkManager
>> > > -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64
>> > > > | ../../x86_64-oe-linux-libtool  --tag=3DCC   --mode=3Dlink
>> > > x86_64-oe-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3
>> -mfpmath=3Dsse
>> > >
>> --sysroot=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-6=
4
>> > > -Wall -std=3Dgnu89  -O2 -pipe -g -feliminate-unused-debug-types -Wsh=
adow
>> > > -Wmissing-declarations -Wmissing-prototypes
>> -Wdeclaration-after-statement
>> > > -Wstrict-prototypes -Wfloat-equal -Wno-unused-parameter
>> -Wno-sign-compare
>> > > -fno-strict-aliasing -Wno-unused-but-set-variable   -Wl,-O1
>> > > -Wl,--hash-style=3Dgnu -Wl,--as-needed -o libutils.la
>> libutils_la-utils.lo
>> > > -lgtk-x11-2.0 -lgdk-x11-2.0 -lpangocairo-1.0 -latk-1.0 -lcairo
>> > > -lgdk_pixbuf-2.0 -lgio-2.0 -lpangoft2-1.0 -lpango-1.0 -lgobject-2.0
>> > > -lglib-2.0 -lfontconfig -lfreetype  -lgio-2.0 -lnm-glib -lnm-util
>> > > -lnm-glib-vpn -ldbus-glib-1 -ldbus-1 -lgobject-2.0
>> -Wl,--export-dynamic
>> > > -lgmodule-2.0 -pthread -lglib-2.0
>> > > > | /bin/grep:
>> > > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/li=
b/
>> > > libgudev-1.0.la: No such file or directory
>> > > > | sed: can't read
>> > > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/li=
b/
>> > > libgudev-1.0.la: No such file or directory
>> > > > | x86_64-oe-linux-libtool: link:
>> > >
>> `/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/lib/
>> > > libgudev-1.0.la' is not a valid libtool archive
>> > > > | make[5]: *** [libutils.la] Error 1
>> > > > | make[5]: Leaving directory
>> > >
>> `/home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/networ=
k-manager-applet/0.9.8.10-r0/build/src/utils'
>> > > > | make[4]: *** [all-recursive] Error 1
>> > > > | make[4]: Leaving directory
>> > >
>> `/home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/networ=
k-manager-applet/0.9.8.10-r0/build/src/utils'
>> > >
>> > > the libgudev-1.0.la was moved from /usr/lib to /lib in systemd
>> 215-216
>> > > updated
>> > >
>> > > --- a/packages/arm920tt-oe-linux-gnueabi/systemd/systemd-dbg/latest
>> > > +++ b/packages/arm920tt-oe-linux-gnueabi/systemd/systemd-dbg/latest
>> > > @@ -1,11 +1,11 @@
>> > >  PE =3D 1
>> > > -PV =3D 215+gitAUTOINC+252ff40a38
>> > > +PV =3D 216+gitAUTOINC+5d0ae62c66
>> > >  PR =3D r0
>> > > -PKGV =3D 215+git0+252ff40a38
>> > > -PKGR =3D r0.1
>> > > +PKGV =3D 216+git0+5d0ae62c66
>> > > +PKGR =3D r0.0
>> > >  RPROVIDES =3D
>> > >  RDEPENDS =3D
>> > > -RRECOMMENDS =3D eglibc-dbg glib-2.0-dbg libacl-dbg libcap-dbg
>> libffi-dbg
>> > > libgcc-dbg libkmod-dbg liblzma-dbg libpam-dbg libudev-dbg
>> > > util-linux-libblkid-dbg zlib-dbg
>> > > -PKGSIZE =3D 49629406
>> > > +RRECOMMENDS =3D glib-2.0-dbg glibc-dbg libacl-dbg libcap-dbg libffi=
-dbg
>> > > libgcc-dbg libkmod-dbg liblzma-dbg libpam-dbg libudev-dbg
>> > > util-linux-libblkid-dbg zlib-dbg
>> > > +PKGSIZE =3D 50305088
>> > >  FILES =3D /usr/bin/.debug /usr/sbin/.debug /usr/lib/systemd/.debug
>> > > /usr/lib/.debug /bin/.debug /sbin/.debug /lib/.debug
>> > > /usr/lib/systemd/.debug /usr/lib/matchbox-panel/.debug
>> > > /usr/lib/systemd/systemd/.debug /usr/src/debug
>> > > /usr/lib/systemd/ptest/.debug /lib/.debug /lib/systemd/.debug
>> > > /lib/systemd/*/.debug /lib/security/.debug/
>> > > -RDEPENDS =3D libgudev-1.0 libsystemd libudev systemd (=3D
>> > > 1:215+git0+252ff40a38-r0.1)
>> > > -RRECOMMENDS =3D acl-dev base-files-dev base-passwd-dev dbus-dev
>> eglibc-dev
>> > > glib-2.0-dev kmod-dev libacl-dev libcap-dev libcgroup-dev libffi-dev
>> > > libgcc-dev libgcrypt-dev libgudev-1.0-dev libkmod-dev liblzma-dev
>> > > libpam-dev libsystemd-dev libudev-dev readline-dev shadow-dev
>> > > shadow-sysroot-dev systemd-binfmt-dev udev-dev
>> update-alternatives-opkg-dev
>> > > util-linux-dev util-linux-libblkid-dev util-linux-mount-dev
>> > > volatile-binds-dev xz-dev zlib-dev
>> > > -PKGSIZE =3D 78365
>> > > +RDEPENDS =3D libgudev-1.0 libsystemd libudev systemd (=3D
>> > > 1:216+git0+5d0ae62c66-r0.0)
>> > > +RRECOMMENDS =3D acl-dev base-files-dev base-passwd-dev dbus-dev
>> > > glib-2.0-dev glibc-dev kmod-dev libacl-dev libcap-dev libcgroup-dev
>> > > libffi-dev libgcc-dev libgcrypt-dev libgudev-1.0-dev libkmod-dev
>> > > liblzma-dev libpam-dev libsystemd-dev libudev-dev readline-dev
>> shadow-dev
>> > > shadow-sysroot-dev systemd-binfmt-dev udev-dev
>> update-alternatives-opkg-dev
>> > > util-linux-dev util-linux-libblkid-dev util-linux-mount-dev
>> > > volatile-binds-dev xz-dev zlib-dev
>> > > +PKGSIZE =3D 79477
>> > >  FILES =3D /usr/include /lib/lib*.so /usr/lib/lib*.so /usr/lib/*.la
>> > > /usr/lib/*.o /usr/lib/pkgconfig /usr/share/pkgconfig
>> /usr/share/aclocal
>> > > /lib/*.o /usr/lib/systemd/*.la /lib/*.la /lib/security/*.la
>> > > /usr/share/dbus-1/interfaces/ /etc/rpm/macros.systemd
>> > > -FILELIST =3D /lib/security/pam_systemd.la
>> > > /usr/include/gudev-1.0/gudev/gudev.h
>> > > /usr/include/gudev-1.0/gudev/gudevclient.h
>> > > /usr/include/gudev-1.0/gudev/gudevdevice.h
>> > > /usr/include/gudev-1.0/gudev/gudevenumerator.h
>> > > /usr/include/gudev-1.0/gudev/gudevenums.h
>> > > /usr/include/gudev-1.0/gudev/gudevenumtypes.h
>> > > /usr/include/gudev-1.0/gudev/gudevtypes.h /usr/include/libudev.h
>> > > /usr/include/systemd/_sd-common.h /usr/include/systemd/sd-daemon.h
>> > > /usr/include/systemd/sd-id128.h /usr/include/systemd/sd-journal.h
>> > > /usr/include/systemd/sd-login.h /usr/include/systemd/sd-messages.h
>> /usr/lib/
>> > > libgudev-1.0.la /usr/lib/libgudev-1.0.so /usr/lib/
>> libnss_myhostname.la
>> > > /usr/lib/libsystemd.la /usr/lib/libsystemd.so /usr/lib/libudev.la
>> > > /usr/lib/libudev.so /usr/lib/pkgconfig/gudev-1.0.pc
>> > > /usr/lib/pkgconfig/libsystemd.pc /usr/lib/pkgconfig/libudev.pc
>> > > /usr/share/pkgconfig/systemd.pc /usr/share/pkgconfig/udev.pc
>> > > +FILELIST =3D /lib/libgudev-1.0.la /lib/libgudev-1.0.so /lib/securit=
y/
>> > > pam_systemd.la /usr/include/gudev-1.0/gudev/gudev.h
>> > > /usr/include/gudev-1.0/gudev/gudevclient.h
>> > > /usr/include/gudev-1.0/gudev/gudevdevice.h
>> > > /usr/include/gudev-1.0/gudev/gudevenumerator.h
>> > > /usr/include/gudev-1.0/gudev/gudevenums.h
>> > > /usr/include/gudev-1.0/gudev/gudevenumtypes.h
>> > > /usr/include/gudev-1.0/gudev/gudevtypes.h /usr/include/libudev.h
>> > > /usr/include/systemd/_sd-common.h /usr/include/systemd/sd-daemon.h
>> > > /usr/include/systemd/sd-id128.h /usr/include/systemd/sd-journal.h
>> > > /usr/include/systemd/sd-login.h /usr/include/systemd/sd-messages.h
>> /usr/lib/
>> > > libnss_myhostname.la /usr/lib/libnss_mymachines.la /usr/lib/
>> libsystemd.la
>> > > /usr/lib/libsystemd.so /usr/lib/libudev.la /usr/lib/libudev.so
>> > > /usr/lib/pkgconfig/gudev-1.0.pc /usr/lib/pkgconfig/libsystemd.pc
>> > > /usr/lib/pkgconfig/libudev.pc /usr/share/pkgconfig/systemd.pc
>> > > /usr/share/pkgconfig/udev.pc
>> > >
>> > > Hmm - I made my tests with systemd 216 and had no errors. Shouldn't
>> > pkg-config find libgudev <http://libgudev-1.0.la>?
>>
>> See http://patchwork.openembedded.org/patch/81291/ for more details.
>>
>> Yes I saw that - still wondering why it works fine here without this
> patch.
>
>
> FWIW: meta-angstrom has an own systemd recipe (oftopic: total disagreemen=
t
from my side). After update of meta-angstrom I can now reproduce the error.

Andreas

