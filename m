Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TgB21-0004F3-C9 for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 10:12:45 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TgAoE-0004Wc-3M for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 09:58:26 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2012 09:58:26 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2012 09:58:26 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 05 Dec 2012 09:58:02 +0100
Message-ID: <k9n2am$v6u$1@ger.gmane.org>
References: <1354689959-3796-1-git-send-email-b19537@freescale.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
In-Reply-To: <1354689959-3796-1-git-send-email-b19537@freescale.com>
X-Enigmail-Version: 1.4.6
Subject: Re: [meta-oe] cramfs: download source tarball from http server instead of cvs server
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
X-List-Received-Date: Wed, 05 Dec 2012 09:12:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 05-12-12 07:45, Zhenhua Luo schreef:
> cvs server is not available sometimes: ERROR: Fetcher failure: Fetch
> command failed with exit code 1, output: cvs [checkout aborted]: reading
> from server: Connection reset by peer ERROR: Function failed: Fetcher
> failure for URL:
> 'cvs://anonymous@cramfs.cvs.sourceforge.net/cvsroot/cramfs;module=linux'.
> Unable to fetch URL from any source.
> 
> Signed-off-by: Zhenhua Luo <b19537@freescale.com> --- 
> meta-oe/recipes-support/cramfs/cramfs_1.1.bb |   27
> +++++++++++++++++++++++ meta-oe/recipes-support/cramfs/cramfs_cvs.bb |
> 30 --------------------------

> -PV = "1.1+cvs${SRCDATE}"

You're making PV go backwards which breaks upgrades. I think the easiest
workaround is to add PE = 1.



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQvwyaMkyGM64RGpERAp4AAJ4zRO5JKndrB0REumT6EXYnOZJtbACeI/CS
toUKxqakaRyesxs1Ab2ImSI=
=CcN4
-----END PGP SIGNATURE-----



