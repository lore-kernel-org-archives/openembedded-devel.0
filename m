Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NsdF6-0001Tc-4L for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 15:32:09 +0100
Received: from g229060216.adsl.alicedsl.de ([92.229.60.216]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NsdC8-0002yy-Og for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 14:29:00 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Mar 2010 15:28:58 +0100
Message-ID: <1269008938.3893.34.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00, URI_HEX autolearn=no
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Problems with BitBake Mercurial/hg fetcher
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
X-List-Received-Date: Fri, 19 Mar 2010 14:32:09 -0000
X-Groupsio-MsgNum: 17867
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-xE9l4MkqmouCr6HB5QyR"

--=-xE9l4MkqmouCr6HB5QyR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


I have=20

        SRCREV =3D "8f6237741f72"
       =20
        SRC_URI =3D "hg://hg.geexbox.org;module=3D${PN};rev=3D${SRCREV}"

in my recipe. But the `do_fetch` fails.

        $ bitbake libnfo
        NOTE: Handling BitBake files: \ (8098/8098) [100 %]
        NOTE: Parsing finished. 7465 cached, 319 parsed, 314 skipped, 0 mas=
ked.
        NOTE: Resolving any missing task queue dependencies
        NOTE: Preparing runqueue
        NOTE: Executing runqueue
        NOTE: Running task 153 of 552 (ID: 479, virtual:native:/oe/openembe=
dded/recipes/libxml/libxml2_2.7.7.bb, do_qa_configure)
        NOTE: Running task 303 of 552 (ID: 1, /oe/openembedded/recipes/libn=
fo/libnfo_hg.bb, do_setscene)
        NOTE: Running task 410 of 552 (ID: 480, virtual:native:/oe/openembe=
dded/recipes/libxml/libxml2_2.7.7.bb, do_compile)
        NOTE: Running task 411 of 552 (ID: 2, /oe/openembedded/recipes/libn=
fo/libnfo_hg.bb, do_fetch)
        NOTE: fetch http://www.angstrom-distribution.org/unstable/sources/l=
ibnfo__hg.geexbox.org_8f6237741f72.tar.gz
        --2010-03-19 15:14:13--  http://www.angstrom-distribution.org/unsta=
ble/sources/libnfo__hg.geexbox.org_8f6237741f72.tar.gz
        Resolving www.angstrom-distribution.org... 188.40.83.200
        Connecting to www.angstrom-distribution.org|188.40.83.200|:80... co=
nnected.
        HTTP request sent, awaiting response... 404 Not Found
        2010-03-19 15:14:13 ERROR 404: Not Found.
       =20
        NOTE: fetch http://mirrors.openembedded.org//libnfo__hg.geexbox.org=
_8f6237741f72.tar.gz
        --2010-03-19 15:14:13--  http://mirrors.openembedded.org//libnfo__h=
g.geexbox.org_8f6237741f72.tar.gz
        Resolving mirrors.openembedded.org... 82.197.159.157
        Connecting to mirrors.openembedded.org|82.197.159.157|:80... connec=
ted.
        HTTP request sent, awaiting response... 404 Not Found
        2010-03-19 15:14:13 ERROR 404: Not Found.
       =20
        NOTE: fetch http://sources.openembedded.org//libnfo__hg.geexbox.org=
_8f6237741f72.tar.gz
        --2010-03-19 15:14:14--  http://sources.openembedded.org//libnfo__h=
g.geexbox.org_8f6237741f72.tar.gz
        Resolving sources.openembedded.org... 140.211.169.165
        Connecting to sources.openembedded.org|140.211.169.165|:80... conne=
cted.
        HTTP request sent, awaiting response... 404 Not Found
        2010-03-19 15:14:14 ERROR 404: Not Found.
       =20
        NOTE: Fetch hg://hg.geexbox.org;module=3Dlibnfo;rev=3D8f6237741f72
        requesting all changes
        adding changesets
        adding manifests
        adding file changes
        added 112 changesets with 176 changes to 39 files
        updating to branch default
        37 files updated, 0 files merged, 0 files removed, 0 files unresolv=
ed
        abort: There is no Mercurial repository here (.hg not found)!
        NOTE: Task failed: Fetch failed: Fetch command export HOME=3D/home/=
xy; export SSH_AUTH_SOCK=3D/tmp/keyring-rgxh0n/socket.ssh; export PATH=3D/o=
e/tangstrom-dev/staging/i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi:/o=
e/tangstrom-dev/staging/i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi:/o=
e/tangstrom-dev/staging/i686-linux/usr/sbin:/oe/tangstrom-dev/staging/i686-=
linux/usr/bin:/oe/tangstrom-dev/cross/armv7a//bin:/oe/tangstrom-dev/staging=
/i686-linux/sbin:/oe/tangstrom-dev/staging/i686-linux/bin:/oe/bitbake/bin:/=
usr/local/texlive/2008/bin/i386-linux:/usr/local/bin:/usr/bin:/bin:/usr/gam=
es; /usr/bin/env hg update -C -r 8f6237741f72 failed with signal 255, outpu=
t:
        abort: There is no Mercurial repository here (.hg not found)!
       =20
        ERROR: TaskFailed event exception, aborting
        ERROR: Build of /oe/openembedded/recipes/libnfo/libnfo_hg.bb do_fet=
ch failed
        ERROR: Task 2 (/oe/openembedded/recipes/libnfo/libnfo_hg.bb, do_fet=
ch) failed

It works if I run `bitbake libnfo` again afterwards and it looks like
the `hg update` command is not needed then.

Does anyone else experience this?


Thanks,

Paul

--=-xE9l4MkqmouCr6HB5QyR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkujiioACgkQPX1aK2wOHVg+QACfZUBKgJH/3EMYPRkVKun/w7GP
VZIAoIELCZJO8lnI4pXp/oQqVjBIyebj
=5yOd
-----END PGP SIGNATURE-----

--=-xE9l4MkqmouCr6HB5QyR--
