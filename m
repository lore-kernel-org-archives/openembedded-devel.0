Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id BE3EF6DEF3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2013 08:19:03 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Vo7fi-0003y8-HP for openembedded-devel@lists.openembedded.org;
	Wed, 04 Dec 2013 09:19:02 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Dec 2013 09:19:02 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Dec 2013 09:19:02 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 04 Dec 2013 09:20:10 +0100
Message-ID: <l7mogt$5cp$1@ger.gmane.org>
References: <1386107047-27409-1-git-send-email-otavio@ossystems.com.br>
	<1386107047-27409-2-git-send-email-otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
In-Reply-To: <1386107047-27409-2-git-send-email-otavio@ossystems.com.br>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe 2/5] proj: Use 'lib_package' class and add data files
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
X-List-Received-Date: Wed, 04 Dec 2013 08:19:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Otavio Salvador schreef op 03-12-13 22:44:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br> --- 
> meta-oe/recipes-navigation/proj/proj_4.8.0.bb | 5 +++-- 1 file changed, 3
> insertions(+), 2 deletions(-)
> 
> diff --git a/meta-oe/recipes-navigation/proj/proj_4.8.0.bb
> b/meta-oe/recipes-navigation/proj/proj_4.8.0.bb index 6784dde..b4bfaf4
> 100644 --- a/meta-oe/recipes-navigation/proj/proj_4.8.0.bb +++
> b/meta-oe/recipes-navigation/proj/proj_4.8.0.bb @@ -1,4 +1,4 @@ 
> -DESCRIPTION = "PROJ.4 - Cartographic Projections Library" +SUMMARY =
> "PROJ.4 - Cartographic Projections library" HOMEPAGE =
> "http://trac.osgeo.org/proj/" SECTION = "libs"
> 
> @@ -9,5 +9,6 @@ SRC_URI =
> "http://download.osgeo.org/proj/proj-${PV}.tar.gz" SRC_URI[md5sum] =
> "d815838c92a29179298c126effbb1537" SRC_URI[sha256sum] =
> "2db2dbf0fece8d9880679154e0d6d1ce7c694dd8e08b4d091028093d87a9d1b5"
> 
> -inherit autotools pkgconfig +inherit autotools pkgconfig lib_package
> 
> +FILES_${PN} += "${datadir}/proj"

Will this cause renaming of the output packages?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSnuW6MkyGM64RGpERAphPAJ49M3CTR0Icv49TAhosWl2nL6KISgCglXzQ
7Vy2I/QcO4Atgu9fEjpHiO0=
=QS3a
-----END PGP SIGNATURE-----


