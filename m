Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ubzrr-0004Rr-Aa for openembedded-devel@lists.openembedded.org;
	Mon, 13 May 2013 23:01:14 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1UbzaH-0008RB-N5 for openembedded-devel@lists.openembedded.org;
	Mon, 13 May 2013 22:43:01 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 May 2013 22:43:01 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 May 2013 22:43:01 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 13 May 2013 22:42:52 +0200
Message-ID: <kmrj87$g8t$1@ger.gmane.org>
References: <1368448471-2941-1-git-send-email-jukka.rissanen@linux.intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
In-Reply-To: <1368448471-2941-1-git-send-email-jukka.rissanen@linux.intel.com>
X-Enigmail-Version: 1.5.1
Subject: Re: [meta-networking][PATCH] vpnc: Runtime dependency to perl was missing
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
X-List-Received-Date: Mon, 13 May 2013 21:01:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 13-05-13 14:34, Jukka Rissanen schreef:
> Generated package contains perl script but dependecy to perl was
> missing.
> 
> Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com> --- 
> meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb | 2 +- 1 file
> changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
> b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb index
> 2ce9530..df90234 100644 ---
> a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb +++
> b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb @@ -6,7 +6,7 @@
> PRIORITY = "optional" LICENSE = "GPL-2.0+" LIC_FILES_CHKSUM =
> "file://COPYING;md5=173b74cb8ac640a9992c03f3bce22a33" DEPENDS =
> "libgcrypt" -RDEPENDS_${PN} = "kernel-module-tun" +RDEPENDS_${PN} =
> "kernel-module-tun perl"

I've seen a number of patches doing this and I hate it for 2 reasons:

1) the perl stuff should be looked at and split out in a subpackage whenever
possible
2) it doesn't actually fix the problem, since you need to specify the
perl-modules it needs as well.

So patches like this drag in perl while at the same time not actually fixing
the problem of failing runtimes, only papering over RPM bitching out
dependencies.



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFRkVBMMkyGM64RGpERAnLvAJ0VTXP1DyYpLPkLp71UMs5f+xYE3ACgnNUE
MXjCjTRD/3hGYZ9bHbwdpMs=
=/124
-----END PGP SIGNATURE-----



