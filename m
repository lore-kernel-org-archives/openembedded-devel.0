Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 3BE996B7CB
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jun 2014 09:52:50 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Wsqbh-0005Xe-MU for openembedded-devel@lists.openembedded.org;
	Fri, 06 Jun 2014 11:38:41 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jun 2014 11:38:41 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jun 2014 11:38:41 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 06 Jun 2014 11:06:00 +0200
Message-ID: <lms09o$fas$1@ger.gmane.org>
References: <1401269527-16387-1-git-send-email-maxim.uvarov@linaro.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
In-Reply-To: <1401269527-16387-1-git-send-email-maxim.uvarov@linaro.org>
X-Enigmail-Version: 1.6
Subject: Re: [PATCHv2] daq fix compilation
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
X-List-Received-Date: Fri, 06 Jun 2014 09:52:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Maxim Uvarov schreef op 28-05-14 11:32:
> preset paths to remove that error: 
> /meta-oe/recipes-connectivity/daq/daq_2.0.2.bb ./config.log:cc1: warning:
> include location "/usr/local/include" is unsafe for cross-compilation
> [-Wpoison-system-directories]
> 
> Also this patch add required libdnet dependency.
> 
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org> --- v2: use
> ${includedir} ${STAGING_INCDIR} and ${STAGING_LIBDIR} instead of direct 
> reference to /usr/include or /usr/lib
> 
> 
> meta-oe/recipes-connectivity/daq/daq_2.0.2.bb | 5 ++++- 1 file changed, 4
> insertions(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
> b/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb index 4e85194..efdcf99
> 100644 --- a/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb +++
> b/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb @@ -5,7 +5,7 @@
> LIC_FILES_CHKSUM = "file://COPYING;md5=f9ce51a65dd738dc1ae631d8b21c40e0"
> 
> PARALLEL_MAKE = ""
> 
> -DEPENDS = "libpcap libpcre" +DEPENDS = "libpcap libpcre libdnet"
> 
> SRC_URI = "http://fossies.org/linux/misc/daq-${PV}.tar.gz \ 
> file://disable-run-test-program-while-cross-compiling.patch " @@ -15,6
> +15,9 @@ SRC_URI = "http://fossies.org/linux/misc/daq-${PV}.tar.gz \ #
> daq/daq/latest lost dependency on  libdnet libmnl libnetfilter-queue
> libnfnetlink EXTRA_OECONF += "--disable-nfq-module --disable-ipq-module"
> 
> +# never look to /usr/local lib while cross compiling +EXTRA_OECONF +=
> "--includedir=${includedir} --with-libpcap-includes=${STAGING_INCDIR}
> --with-dnet-includes=${STAGING_LIBDIR}" +

Please collaps the 2 EXTRA_OECONF += into as single EXTRA_OECONF = (without
the '+').

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTkYR3MkyGM64RGpERAnd+AJ9pD4N3uG5xYIOYSzmJfzwvpcoMmwCgmW3z
WTu9Sk8wA+ja+z8Cxm/e9rc=
=6hIa
-----END PGP SIGNATURE-----


