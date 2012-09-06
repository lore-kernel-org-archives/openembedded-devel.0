Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T9fML-0006cL-R7 for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 18:55:17 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T9fAO-0004om-42 for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 18:42:56 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2012 18:42:56 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2012 18:42:56 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 06 Sep 2012 18:42:40 +0200
Message-ID: <k2ajpv$k3m$1@ger.gmane.org>
References: <5048B901.3060103@communistcode.co.uk>
	<1346943545.2673.198.camel@phil-desktop>
	<5048BC6D.8080904@communistcode.co.uk>
	<1346944157.2673.199.camel@phil-desktop>
	<5048BE25.2070004@communistcode.co.uk>
	<1346944624.2673.200.camel@phil-desktop>
	<5048BF04.2000904@communistcode.co.uk>
	<5048C7D5.70301@communistcode.co.uk>
	<1346947708.2673.201.camel@phil-desktop>
	<5048CC32.30705@communistcode.co.uk>
	<1346948364.2673.203.camel@phil-desktop>
	<5048D11C.9050108@communistcode.co.uk>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <5048D11C.9050108@communistcode.co.uk>
X-Enigmail-Version: 1.4.4
Subject: Re: Issues building tinyXML
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
X-List-Received-Date: Thu, 06 Sep 2012 16:55:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 06-09-12 18:36, Jack Mitchell schreef:

> DESCRIPTION = "A simple, small, C++ XML parser that can be easily
> integrated into other programs"
> 
> LICENSE = "zlib" LIC_FILES_CHKSUM = 
> "file://tinyxml.cpp;endline=23;md5=b97285d8fafcc49b761ca785816cc397"
> 
> SRC_URI = 
> "http://ftp.debian.org/debian/pool/main/t/tinyxml/${PN}_${PV}.orig.tar.gz"
>
>  SRC_URI[md5sum] = "c1b864c96804a10526540c664ade67f0" SRC_URI[sha256sum]
> = "15bdfdcec58a7da30adc87ac2b078e4417dbe5392f3afb719f9ba6d062645593"
> 
> S = "${WORKDIR}/tinyxml"
> 
> TINYXML_USE_STL = "YES"
> 
> do_compile() { oe_runmake LD="${CXX}"
> 
> ${CXX} -fpic -shared -o lib${PN}.so.0.${PV} \ -Wl,-soname,lib${PN}.so.0
> $(ls *.o | grep -v xmltest)
> 
> }
> 
> do_install() {
> 
> install -d -m 0755 ${D}/usr/{lib,include}

${libdir}
${includedir}

> install -m 0755 lib${PN}.so.0.${PV} ${D}${libdir} install -m 0644 ${PN}.h
> tinystr.h ${D}${includedir}
> 
> (cd ${D}/usr/lib

${libdir}

> ln -s lib${PN}.so.0.${PV} lib${PN}.so.0 ln -s lib${PN}.so.0.${PV}
> lib${PN}.so )
> 
> }
> 
> FILES_${PN}-dbg = "/usr/src/debug \ ${libdir}/.debug \

Both should be in already, no?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQSNKAMkyGM64RGpERAiQYAJ4vU59XUZ1Ae+8BQaH1ejZ2DjK97QCeL8PL
sogMu1ndRf9XyrUgi0O6PbY=
=1PxS
-----END PGP SIGNATURE-----



