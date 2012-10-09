Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TLW1q-0001yq-0w for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2012 11:23:06 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TLVpD-00011G-9d for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2012 11:10:03 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2012 11:10:03 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2012 11:10:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 09 Oct 2012 11:07:16 +0200
Message-ID: <k50pfs$558$4@ger.gmane.org>
References: <1349550426-12357-1-git-send-email-fcooper@ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
In-Reply-To: <1349550426-12357-1-git-send-email-fcooper@ti.com>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-oe][PATCH] iperf: Upgrade to version 2.0.5
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
X-List-Received-Date: Tue, 09 Oct 2012 09:23:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 06-10-12 21:07, Franklin S. Cooper Jr schreef:
> * Upgrade to version 2.0.5. * Below patches used in version 2.0.4 are no
> longer needed: 004-svn-r43-ro.patch (already applied) 
> 006-iperf-die-on-connect-fail.patch (already applied) 009-delayloop.patch
> (equivalent solution already exists) * Patch 000-Iperf_Fix-CPU-Usage.diff
> has been updated to apply to version 2.0.5 Signed-off-by: Franklin S.
> Cooper Jr <fcooper@ti.com>

> --- a/meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb +++
> b/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb @@ -4,22 +4,20 @@
> SECTION = "console/network" LICENSE = "NewBSD" LIC_FILES_CHKSUM =
> "file://COPYING;md5=e8478eae9f479e39bc34975193360298"
> 
> +PR = "r0" +

*deep sigh*

Remove that.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQc+lEMkyGM64RGpERAlVzAKCSUhWw5mn54/cnKPRMUPjgFCPlvACeP1TK
0HBNGUfRIEwnXFC9zuqZgEE=
=rxrK
-----END PGP SIGNATURE-----



