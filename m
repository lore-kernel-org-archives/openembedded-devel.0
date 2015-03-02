Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 2196F72130
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2015 10:29:10 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1YSNb4-00047K-U0 for openembedded-devel@lists.openembedded.org;
	Mon, 02 Mar 2015 11:29:11 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Mar 2015 11:29:10 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Mar 2015 11:29:10 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 02 Mar 2015 11:28:56 +0100
Message-ID: <md1e18$243$1@ger.gmane.org>
References: <1425248708-4076-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
In-Reply-To: <1425248708-4076-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH 1/4] soci: Add recipe
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
X-List-Received-Date: Mon, 02 Mar 2015 10:29:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Khem Raj schreef op 01-03-15 om 23:25:
> Define PACKAGECONFIG to enable a given backend of choice by default its
> 'empty'
> 
> Change-Id: Ie1123af658ca94d2fe22a3ca1a32dfb47d58979e Signed-off-by: Khem
> Raj <raj.khem@gmail.com> --- meta-oe/recipes-support/soci/soci_3.2.2.bb |
> 46 ++++++++++++++++++++++++++++++ 1 file changed, 46 insertions(+) create
> mode 100644 meta-oe/recipes-support/soci/soci_3.2.2.bb
> 
> diff --git a/meta-oe/recipes-support/soci/soci_3.2.2.bb
> b/meta-oe/recipes-support/soci/soci_3.2.2.bb new file mode 100644 index
> 0000000..1c333cb --- /dev/null +++
> b/meta-oe/recipes-support/soci/soci_3.2.2.bb @@ -0,0 +1,46 @@ +#
> Copyright (C) 2015 Khem Raj <raj.khem@gmail.com> +# Released under the
> MIT license (see COPYING.MIT for the terms) + +DESCRIPTION = "The C++
> Database Access Library" +HOMEPAGE = "http://soci.sourceforge.net" 
> +LICENSE = "BSL-1.0" +SECTION = "libs" +DEPENDS = "boost" + 
> +LIC_FILES_CHKSUM =
> "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"

Please group this with the lICENSE field

> + +SRC_URI =
> "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${P}/${P}.tar.gz" 
> +SRC_URI[md5sum] = "bc3c35f6cd3f80a1be19fe30b3c111bf" +SRC_URI[sha256sum]
> = "30ea2f4d26639ef5b5cdc24fb300b3896746243dbb77b743582de2ff443ccb1c" + 
> +TESTCONFIG = '-DSOCI_TEST_EMPTY_CONNSTR="dummy"
> -DSOCI_TEST_SQLITE3_CONNSTR="test.db" \ +
> -DSOCI_TEST_POSTGRESQL_CONNSTR:STRING="dbname=soci_test" \ +
> -DSOCI_TEST_MYSQL_CONNSTR:STRING="db=soci_test user=oe password=oe"' + 
> +OBASEDIR ?= "/opt/oracle" +OINCDIR = "rdbms/public" +OLIBDIR = "lib" + 
> +PACKAGECONFIG[sqlite3] =
> "-DSOCI_SQLITE3=ON,-DSOCI_SQLITE3=OFF,sqlite3," +PACKAGECONFIG[mysql] =
> "-DSOCI_MYSQL=ON,-DSOCI_MYSQL=OFF,mariadb," +PACKAGECONFIG[postgresql] =
> "-DSOCI_POSTGRESQL=ON,-DSOCI_POSTGRESQL=OFF,postgresql," 
> +PACKAGECONFIG[odbc] = "-DSOCI_ODBC=ON,-DSOCI_ODBC=OFF,," 
> +PACKAGECONFIG[empty] = "-DSOCI_EMPTY=ON,-DSOCI_EMPTY=OFF,," 
> +PACKAGECONFIG[oracle] = "-DWITH_ORACLE=ON
> --with-oracle-include=${OINCDIR}
> --with-oracle-lib=${OLIBDIR},-DWITH_ORACLE=OFF,," +PACKAGECONFIG[ptest] =
> "${TESTCONFIG},,," + +# enable your backend by default we enable 'empty' 
> +PACKAGECONFIG ??= "empty" + +# Take the flags added by PACKAGECONFIG and
> pass them to cmake. +EXTRA_OECMAKE = "${EXTRA_OECONF}" + +inherit cmake 
> + +PACKAGES += "${PN}-sqlite3 ${PN}-mysql ${PN}-postgresql ${PN}-odbc
> ${PN}-oracle" + +FILES_${PN}-sqlite3 =
> "${libdir}/lib${BPN}_sqlite3.so.*" +FILES_${PN}-mysql =
> "${libdir}/lib${BPN}_mysql.so.*" +FILES_${PN}-postgresql =
> "${libdir}/lib${BPN}_postgresql.so.*" +FILES_${PN}-odbc =
> "${libdir}/lib${BPN}_odbc.so.*" +FILES_${PN}-oracle =
> "${libdir}/lib${BPN}_oracle.so.*"
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFU9DtoMkyGM64RGpERAtcGAJ0dzZ17XwT7UJyHij29TcbpTM1wlQCfTebl
d2QKkc75bG2LTXTDp5pXVM0=
=cKrw
-----END PGP SIGNATURE-----


