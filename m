Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NwYrB-0006xJ-3g for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 12:39:58 +0200
Received: from f053036078.adsl.alicedsl.de ([78.53.36.78]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NwYo1-0005Qh-Hb; Tue, 30 Mar 2010 10:36:21 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1269927805.3142.7.camel@mattotaupa>
References: <1269927805.3142.7.camel@mattotaupa>
Date: Tue, 30 Mar 2010 12:36:20 +0200
Message-ID: <1269945380.4103.14.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,URI_HEX
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Richard Purdie <rpurdie@linux.intel.com>
Subject: Re: BitBake: Always fails the first time with Mercuarial/hg repository in `SRC_URI`.
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
X-List-Received-Date: Tue, 30 Mar 2010 10:40:05 -0000
X-Groupsio-MsgNum: 18251
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-tThNy1B+epsnbcZhzcta"

--=-tThNy1B+epsnbcZhzcta
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


Am Dienstag, den 30.03.2010, 07:43 +0200 schrieb Paul Menzel:

>         $ bitbake --version
>         BitBake Build Tool Core version 1.8.19, bitbake version 1.8.19
>=20
> For example if I do
>=20
>         $ bitbake -b /oe/recipes/libvalhalla/libvalhalla_hg.bb
>=20
> `do_fetch` is then failing for me when `hg update`(?) is run.
>=20
> Running the command again works then.
>=20
> Can you reproduce this and do you know a fix for it?

zecke asked for detailed log files on IRC. Here you go.

        $ bitbake -DDD -vvv -f -b /oe/openembedded/recipes/libvalhalla/libv=
alhalla_hg.bb
       =20
        [=E2=80=A6]
       =20
        NOTE: Running task 2 of 19 (ID: 5, /oe/openembedded/recipes/libvalh=
alla/libvalhalla_hg.bb, do_fetch)
        DEBUG: Parsing /oe/openembedded/recipes/libvalhalla/libvalhalla_hg.=
bb (full)
        DEBUG: BB /oe/openembedded/recipes/libvalhalla/libvalhalla_hg.bb: h=
andle(data)
        DEBUG: BB /oe/openembedded/recipes/libvalhalla/libvalhalla.inc: han=
dle(data, include)
        DEBUG: BB :0: inheriting classes/autotools.bbclass
        DEBUG: BB /oe/openembedded/classes/autotools.bbclass: handle(data, =
include)
        DEBUG: BB :0: inheriting classes/siteinfo.bbclass
        DEBUG: BB /oe/openembedded/classes/siteinfo.bbclass: handle(data, i=
nclude)
        DEBUG: BB :0: inheriting classes/pkgconfig.bbclass
        DEBUG: BB /oe/openembedded/classes/pkgconfig.bbclass: handle(data, =
include)
        DEBUG: update_data()
        DEBUG: update_data()
        DEBUG: Executing task do_fetch
        DEBUG: update_data()
        DEBUG: mkdirhier(/oe/downloads)
        DEBUG: mkdirhier(/oe/downloads)
        DEBUG: update_data()
        DEBUG: update_data()
        NOTE: fetch http://www.angstrom-distribution.org/unstable/sources/l=
ibvalhalla__hg.geexbox.org_a12610802732.tar.gz
        DEBUG: executing /usr/bin/env 'PATH=3D/oe/angstrom-dev/staging/i686=
-linux/usr/bin/armv7a-angstrom-linux-gnueabi:/oe/angstrom-dev/staging/i686-=
linux/usr/bin/armv7a-angstrom-linux-gnueabi:/oe/angstrom-dev/staging/i686-l=
inux/usr/sbin:/oe/angstrom-dev/staging/i686-linux/usr/bin:/oe/angstrom-dev/=
cross/armv7a//bin:/oe/angstrom-dev/staging/i686-linux/sbin:/oe/angstrom-dev=
/staging/i686-linux/bin:/oe/bitbake/bin:/usr/local/texlive/2008/bin/i386-li=
nux:/usr/local/bin:/usr/bin:/bin:/usr/games:/home/username/neo/bin:/home/us=
ername/neo/' wget -t 5 --passive-ftp --no-check-certificate -P /oe/download=
s 'http://www.angstrom-distribution.org/unstable/sources/libvalhalla__hg.ge=
exbox.org_a12610802732.tar.gz'
        --2010-03-30 12:18:14--  http://www.angstrom-distribution.org/unsta=
ble/sources/libvalhalla__hg.geexbox.org_a12610802732.tar.gz
        Resolving www.angstrom-distribution.org... 188.40.83.200
        Connecting to www.angstrom-distribution.org|188.40.83.200|:80... co=
nnected.
        HTTP request sent, awaiting response... 404 Not Found
        2010-03-30 12:18:15 ERROR 404: Not Found.
       =20
        NOTE: fetch http://mirrors.openembedded.org//libvalhalla__hg.geexbo=
x.org_a12610802732.tar.gz
        DEBUG: executing /usr/bin/env 'PATH=3D/oe/angstrom-dev/staging/i686=
-linux/usr/bin/armv7a-angstrom-linux-gnueabi:/oe/angstrom-dev/staging/i686-=
linux/usr/bin/armv7a-angstrom-linux-gnueabi:/oe/angstrom-dev/staging/i686-l=
inux/usr/sbin:/oe/angstrom-dev/staging/i686-linux/usr/bin:/oe/angstrom-dev/=
cross/armv7a//bin:/oe/angstrom-dev/staging/i686-linux/sbin:/oe/angstrom-dev=
/staging/i686-linux/bin:/oe/bitbake/bin:/usr/local/texlive/2008/bin/i386-li=
nux:/usr/local/bin:/usr/bin:/bin:/usr/games:/home/username/neo/bin:/home/us=
ername/neo/' wget -t 5 --passive-ftp --no-check-certificate -P /oe/download=
s 'http://mirrors.openembedded.org//libvalhalla__hg.geexbox.org_a1261080273=
2.tar.gz'
        --2010-03-30 12:18:15--  http://mirrors.openembedded.org//libvalhal=
la__hg.geexbox.org_a12610802732.tar.gz
        Resolving mirrors.openembedded.org... 82.197.159.157
        Connecting to mirrors.openembedded.org|82.197.159.157|:80... connec=
ted.
        HTTP request sent, awaiting response... 404 Not Found
        2010-03-30 12:18:15 ERROR 404: Not Found.
       =20
        NOTE: fetch http://sources.openembedded.org//libvalhalla__hg.geexbo=
x.org_a12610802732.tar.gz
        DEBUG: executing /usr/bin/env 'PATH=3D/oe/angstrom-dev/staging/i686=
-linux/usr/bin/armv7a-angstrom-linux-gnueabi:/oe/angstrom-dev/staging/i686-=
linux/usr/bin/armv7a-angstrom-linux-gnueabi:/oe/angstrom-dev/staging/i686-l=
inux/usr/sbin:/oe/angstrom-dev/staging/i686-linux/usr/bin:/oe/angstrom-dev/=
cross/armv7a//bin:/oe/angstrom-dev/staging/i686-linux/sbin:/oe/angstrom-dev=
/staging/i686-linux/bin:/oe/bitbake/bin:/usr/local/texlive/2008/bin/i386-li=
nux:/usr/local/bin:/usr/bin:/bin:/usr/games:/home/username/neo/bin:/home/us=
ername/neo/' wget -t 5 --passive-ftp --no-check-certificate -P /oe/download=
s 'http://sources.openembedded.org//libvalhalla__hg.geexbox.org_a1261080273=
2.tar.gz'
        --2010-03-30 12:18:15--  http://sources.openembedded.org//libvalhal=
la__hg.geexbox.org_a12610802732.tar.gz
        Resolving sources.openembedded.org... 140.211.169.165
        Connecting to sources.openembedded.org|140.211.169.165|:80... conne=
cted.
        HTTP request sent, awaiting response... 404 Not Found
        2010-03-30 12:18:16 ERROR 404: Not Found.
       =20
        DEBUG: Tarball stash fetch failure: http://www.angstrom-distributio=
n.org/unstable/sources/libvalhalla__hg.geexbox.org_a12610802732.tar.gz
        DEBUG: Fetch: checking for module directory '/oe/downloads/hg/hg.ge=
exbox.org/libvalhalla'
        NOTE: Fetch hg://hg.geexbox.org;module=3Dlibvalhalla;rev=3Da1261080=
2732
        DEBUG: mkdirhier(/oe/downloads/hg/hg.geexbox.org)
        DEBUG: Running /usr/bin/env hg clone -r a12610802732 http://hg.geex=
box.org/libvalhalla libvalhalla
        DEBUG: Running export HOME=3D/home/username; export SSH_AUTH_SOCK=
=3D/tmp/keyring-6Ph6Yc/socket.ssh; export PATH=3D/oe/angstrom-dev/staging/i=
686-linux/usr/bin/armv7a-angstrom-linux-gnueabi:/oe/angstrom-dev/staging/i6=
86-linux/usr/bin/armv7a-angstrom-linux-gnueabi:/oe/angstrom-dev/staging/i68=
6-linux/usr/sbin:/oe/angstrom-dev/staging/i686-linux/usr/bin:/oe/angstrom-d=
ev/cross/armv7a//bin:/oe/angstrom-dev/staging/i686-linux/sbin:/oe/angstrom-=
dev/staging/i686-linux/bin:/oe/bitbake/bin:/usr/local/texlive/2008/bin/i386=
-linux:/usr/local/bin:/usr/bin:/bin:/usr/games:/home/username/neo/bin:/home=
/username/neo/; /usr/bin/env hg clone -r a12610802732 http://hg.geexbox.org=
/libvalhalla libvalhalla
        requesting all changes
        adding changesets
        adding manifests
        adding file changes
        added 907 changesets with 2071 changes to 169 files
        updating to branch default
        165 files updated, 0 files merged, 0 files removed, 0 files unresol=
ved
        DEBUG: Running /usr/bin/env hg update -C -r a12610802732
        DEBUG: Running export HOME=3D/home/username; export SSH_AUTH_SOCK=
=3D/tmp/keyring-6Ph6Yc/socket.ssh; export PATH=3D/oe/angstrom-dev/staging/i=
686-linux/usr/bin/armv7a-angstrom-linux-gnueabi:/oe/angstrom-dev/staging/i6=
86-linux/usr/bin/armv7a-angstrom-linux-gnueabi:/oe/angstrom-dev/staging/i68=
6-linux/usr/sbin:/oe/angstrom-dev/staging/i686-linux/usr/bin:/oe/angstrom-d=
ev/cross/armv7a//bin:/oe/angstrom-dev/staging/i686-linux/sbin:/oe/angstrom-=
dev/staging/i686-linux/bin:/oe/bitbake/bin:/usr/local/texlive/2008/bin/i386=
-linux:/usr/local/bin:/usr/bin:/bin:/usr/games; /usr/bin/env hg update -C -=
r a12610802732
        abort: There is no Mercurial repository here (.hg not found)!
        NOTE: Task failed: Fetch failed: Fetch command export HOME=3D/home/=
username; export SSH_AUTH_SOCK=3D/tmp/keyring-6Ph6Yc/socket.ssh; export PAT=
H=3D/oe/angstrom-dev/staging/i686-linux/usr/bin/armv7a-angstrom-linux-gnuea=
bi:/oe/angstrom-dev/staging/i686-linux/usr/bin/armv7a-angstrom-linux-gnueab=
i:/oe/angstrom-dev/staging/i686-linux/usr/sbin:/oe/angstrom-dev/staging/i68=
6-linux/usr/bin:/oe/angstrom-dev/cross/armv7a//bin:/oe/angstrom-dev/staging=
/i686-linux/sbin:/oe/angstrom-dev/staging/i686-linux/bin:/oe/bitbake/bin:/u=
sr/local/texlive/2008/bin/i386-linux:/usr/local/bin:/usr/bin:/bin:/usr/game=
s; /usr/bin/env hg update -C -r a12610802732 failed with signal 255, output=
:
        abort: There is no Mercurial repository here (.hg not found)!
       =20
        ERROR: TaskFailed event exception, aborting
        ERROR: Build of /oe/openembedded/recipes/libvalhalla/libvalhalla_hg=
.bb do_fetch failed
        ERROR: Task 5 (/oe/openembedded/recipes/libvalhalla/libvalhalla_hg.=
bb, do_fetch) failed
        NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be=
 rerun and 1 failed.
        ERROR: '/oe/openembedded/recipes/libvalhalla/libvalhalla_hg.bb' fai=
led

Running those commands by myself (including entering the checkout
directory) on the commandline works for me.

So I guess BitBake is in the wrong directory. Richard, could you please
take a look. It might be related to commit
36e892cedf337b771b51852d4875962abaa199d7 in BitBake regarding
`/lib/bb/fetch/hg.py`.


Thanks,

Paul

--=-tThNy1B+epsnbcZhzcta
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkux1BoACgkQPX1aK2wOHVijAACeNAXC7BVqcntEWJ3fwiqDlEso
qH8AmgJm7Lrnrl7KAEuwC/uyEtaZiN+B
=IHWU
-----END PGP SIGNATURE-----

--=-tThNy1B+epsnbcZhzcta--
