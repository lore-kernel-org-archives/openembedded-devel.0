Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 0BDC960809
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Sep 2014 07:37:22 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1XYrzs-0005cm-I3 for openembedded-devel@lists.openembedded.org;
	Tue, 30 Sep 2014 09:37:20 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Sep 2014 09:37:20 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Sep 2014 09:37:20 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 30 Sep 2014 09:37:09 +0200
Message-ID: <m0dmj5$k28$1@ger.gmane.org>
References: <cover.1412056597.git.wenzong.fan@windriver.com>
	<a28a68062d37967e63ba90bcf1c6245c561d0a5e.1412056597.git.wenzong.fan@windriver.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
In-Reply-To: <a28a68062d37967e63ba90bcf1c6245c561d0a5e.1412056597.git.wenzong.fan@windriver.com>
Subject: Re: [PATCH 1/1][meta-oe] rsnapshot: add new package
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
X-List-Received-Date: Tue, 30 Sep 2014 07:37:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

wenzong.fan@windriver.com schreef op 30-09-14 08:02:
> From: Wenzong Fan <wenzong.fan@windriver.com>
> 
> rsnapshot is a filesystem snapshot utility based on rsync.
> 
> rsnapshot makes it easy to make periodic snapshots of local machines, and
> remote machines over ssh. The code makes extensive use of hard links 
> whenever possible, to greatly reduce the disk space required.
> 
> Homepage: http://www.rsnapshot.org/
> 
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com> --- 
> meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb |   34
> ++++++++++++++++++++ 1 file changed, 34 insertions(+) create mode 100644
> meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
> 
> diff --git a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
> b/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb new file mode
> 100644 index 0000000..afd3678 --- /dev/null +++
> b/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb @@ -0,0 +1,34 @@ 
> +SUMMARY = "A filesystem snapshot utility based on rsync" +HOMEPAGE =
> "http://www.rsnapshot.org" +BUGTRACKER =
> "https://sourceforge.net/projects/rsnapshot/" +SECTION =
> "console/network" + +LICENSE = "GPLv2" +LIC_FILES_CHKSUM =
> "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a" + +RDEPENDS_${PN} =
> "rsync \ +                  perl \ +
> perl-module-dirhandle \ +                  perl-module-cwd \ +
> perl-module-getopt-std \ +                  perl-module-file-path \ +
> perl-module-file-stat \ +                  perl-module-posix \ +
> perl-module-fcntl \ +                  perl-module-io-file \ +
> perl-module-constant \ +                  perl-module-overloading \ +
> " +

R* variables go below do_install


> +SRCREV = "1047cbb57937c29233388e2fcd847fecd3babe74" +PV =
> "1.3.1+git${SRCPV}" + +SRC_URI =
> "git://github.com/DrHyde/${BPN};branch=master;protocol=git \ +
> " + +S = "${WORKDIR}/git" + +inherit autotools + +PACKAGECONFIG ??=
> "logger" +PACKAGECONFIG[logger] =
> "--with-logger=${bindir}/logger,--without-logger,,util-linux"
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFUKl2lMkyGM64RGpERAr0PAKCip4Nj9nx9qy/f4oVBQRktspaUSgCaAkDK
f9YCGesJ+Wx2iacqpw82n3k=
=Yzvp
-----END PGP SIGNATURE-----


