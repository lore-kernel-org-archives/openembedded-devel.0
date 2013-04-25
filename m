Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1UVH2l-0000dX-Q8 for openembedded-devel@lists.openembedded.org;
	Thu, 25 Apr 2013 09:56:47 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1UVGld-0000ft-7S for openembedded-devel@lists.openembedded.org;
	Thu, 25 Apr 2013 09:38:57 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Apr 2013 09:38:57 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Apr 2013 09:38:57 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 25 Apr 2013 09:38:52 +0200
Message-ID: <klami4$1ur$1@ger.gmane.org>
References: <1366874779-31059-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
In-Reply-To: <1366874779-31059-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.5.1
Subject: Re: [meta-networking][PATCH] nuttcp_7.2.1.bb: Add new recipe
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
X-List-Received-Date: Thu, 25 Apr 2013 07:56:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 25-04-13 09:26, Khem Raj schreef:
> nuttcp is a network perf measurement tool
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com> --- 
> .../recipes-support/nuttcp/nuttcp_7.2.1.bb         |   31
> ++++++++++++++++++++ 1 file changed, 31 insertions(+) create mode 100644
> meta-networking/recipes-support/nuttcp/nuttcp_7.2.1.bb
> 
> diff --git a/meta-networking/recipes-support/nuttcp/nuttcp_7.2.1.bb
> b/meta-networking/recipes-support/nuttcp/nuttcp_7.2.1.bb new file mode
> 100644 index 0000000..225ba1f --- /dev/null +++
> b/meta-networking/recipes-support/nuttcp/nuttcp_7.2.1.bb @@ -0,0 +1,31
> @@ +# Copyright (C) 2013 Khem Raj <raj.khem@gmail.com> +# Released under
> the MIT license (see COPYING.MIT for the terms) + +SUMMARY = "network
> performance measurement tool" +DESCRIPTION = "nuttcp is a network
> performance measurement tool intended for use by network \ +and system
> managers. Its most basic usage is to determine the raw TCP (or UDP) \ 
> +network layer throughput by transferring memory buffers from a source
> system \ +across an interconnecting network to a destination system,
> either transferring \ +data for a specified time interval, or
> alternatively transferring a specified \ +number of bytes." +HOMEPAGE =
> "http://www.nuttcp.net/nuttcp/Welcome%20Page.html" +LICENSE = "GPL-2.0" 
> +SECTION = "net" +DEPENDS = "" +PR = "r0"

With PRserv being inescapable nowadays we really shouldn't add PR = "r0" to
new recipes anymore.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFReN2MMkyGM64RGpERAp3JAKCj1JdO8NZV1/44YY/QzHDwfxYytQCcDzvq
sGUPUQUMaAb/xEtjKX8CIRE=
=W42n
-----END PGP SIGNATURE-----



