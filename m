Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SFWU1-0002X3-CU
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Apr 2012 22:07:09 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 1502BEA040
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Apr 2012 21:27:17 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 311616017C; Wed,  4 Apr 2012 21:57:05 +0200 (CEST)
Date: Wed, 4 Apr 2012 21:57:04 +0200
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120404195704.GA16410@hermes>
References: <20120402210435.GA10553@hermes>
	<CAK18fxG5zusOY+WwnhBatbQ-3Kt8PUmHaafWoHTO=eWYzZ0Kyw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK18fxG5zusOY+WwnhBatbQ-3Kt8PUmHaafWoHTO=eWYzZ0Kyw@mail.gmail.com>
X-Operating-System: Debian GNU/Linux wheezy/sid
X-URL: http://www.seketeli.net/~apelete
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Package build failure
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
X-List-Received-Date: Wed, 04 Apr 2012 20:07:09 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le 03-Apr-12, Andrei Gherzan a =E9crit:
> On Tue, Apr 3, 2012 at 00:04, Apelete Seketeli <apelete@seketeli.net> w=
rote:
> >
> > It seems http://svn.openmoko.org is unreachable.
> > How can I resolve this issue ?
> >
> >
> You actually cant solve this issue as the upstream link is down. You ha=
ve
> two simple choices:
> 1. Find an upstream mirror
> 2. Use a local archive instead.

Thanks for the advice.
I decided to try this upstream mirror:
http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/.

So I replaced the SRC_URI as follow (hereafter is the content of
opkg-utils_svn.bb):


~~ beginning of file ~~
DESCRIPTION =3D "OPKG Package Manager Utilities"
SECTION =3D "base"
HOMEPAGE =3D "http://wiki.openmoko.org/wiki/Opkg"
PRIORITY =3D "optional"
LICENSE =3D "GPLv2"
RDEPENDS_${PN} =3D "python"
RDEPENDS_${PN}_virtclass-native =3D ""
SRCREV =3D "4747"
PV =3D "0.1.8+svnr${SRCPV}"
PR =3D "r7"

SRC_URI =3D "git://git.yoctoproject.org/opkg-utils;protocol=3Dgit \
           file://index-ignore-filenotfound.patch \
           file://arfile_header_split.patch \
           file://mtime-int.patch"

S =3D "${WORKDIR}/opkg-utils"

# Avoid circular dependencies from package_ipk.bbclass
PACKAGES_virtclass-native =3D ""

do_install() {
        oe_runmake PREFIX=3D${prefix} DESTDIR=3D${D} install
}

BBCLASSEXTEND =3D "native"
TARGET_CC_ARCH +=3D "${LDFLAGS}"
~~ end of file ~~


During the execution of my test command 'bitbake nano' I get the
following error:


~~ beginning of build output ~~
NOTE: Running task 352 of 557 (ID: 70, virtual:native:/home/apelete/devel=
/openembedded/master/recipes/opkg-utils/opkg-utils_svn.bb, do_fetch)
NOTE: package opkg-utils-native-0.1.8+svnr0+4747-r7: task do_fetch: Start=
ed
NOTE: package gcc-cross-4.5-r38.1+svnr170880: task do_populate_sysroot: S=
ucceeded
NOTE: Running task 353 of 557 (ID: 156, /home/apelete/devel/openembedded/=
master/recipes/libtool/libtool-cross_2.4.bb, do_configure)
NOTE: package libtool-cross-2.4-r28.2: task do_configure: Started
From git://git.yoctoproject.org/opkg-utils
  * branch            master     -> FETCH_HEAD
 fatal: Not a valid object name 4747
WARNING: /usr/lib/pymodules/python2.7/bb/fetch/git.py:191: DeprecationWar=
ning: Call to deprecated function bb.mkdirhier: Please use bb.utils.mkdir=
hier instead.
  bb.mkdirhier(codir)

NOTE: package opkg-utils-native-0.1.8+svnr0+4747-r7: task Fetch failed: U=
nable to fetch URL git://git.yoctoproject.org/opkg-utils;protocol=3Dgit f=
rom any source.: Failed
ERROR: Function 'Fetch failed: Unable to fetch URL git://git.yoctoproject=
.org/opkg-utils;protocol=3Dgit from any source.' failed
ERROR: Task 70 (virtual:native:/home/apelete/devel/openembedded/master/re=
cipes/opkg-utils/opkg-utils_svn.bb, do_fetch) failed with exit code '1'
Waiting for 1 active tasks to finish:
0: libtool-cross-2.4-r28.2 do_configure (pid 12101)
NOTE: package libtool-cross-2.4-r28.2: task do_configure: Succeeded
ERROR: 'virtual:native:/home/apelete/devel/openembedded/master/recipes/op=
kg-utils/opkg-utils_svn.bb' failed
~~ end of build output ~~


My guess is that the opkg-utils_svn.bb file now needs more changes, to
adapt to the new SRC_URI: it was an svn link and the mirror is now a
git link.

Somebody care to help some more ?
--=20
        Apelete


