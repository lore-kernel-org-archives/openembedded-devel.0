Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TzZKy-0004Yw-Fu for openembedded-devel@lists.openembedded.org;
	Sun, 27 Jan 2013 22:00:25 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TzZ67-0008Hr-IR for openembedded-devel@lists.openembedded.org;
	Sun, 27 Jan 2013 21:45:03 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Jan 2013 21:45:03 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Jan 2013 21:45:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 27 Jan 2013 21:40:47 +0100
Message-ID: <ke43cb$5d8$2@ger.gmane.org>
References: <1359182715-3063-1-git-send-email-raj.khem@gmail.com>
	<1359182715-3063-2-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
In-Reply-To: <1359182715-3063-2-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.4.6
Subject: Re: [meta-networking][PATCH 2/2] ebtables, arptables: add perl as runtime dependency
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
X-List-Received-Date: Sun, 27 Jan 2013 21:00:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 26-01-13 07:45, Khem Raj schreef:
> Fixes errors like
> 
> | Computing transaction...error: Can't install 
> arptables-0.0.3+4-r0.0@ppce500v2: no package provides /usr/bin/perl
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com> --- 
> .../recipes-filter/ebtables/ebtables_2.0.10-4.bb   |    2 ++ 
> .../recipes-support/arptables/arptables_0.0.3-4.bb |    2 ++ 2 files
> changed, 4 insertions(+)
> 
> diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb index
> 2596d2f..4e9b0bc 100644 ---
> a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb +++
> b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb @@ -4,6
> +4,8 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=53b4a999993871a28ab1488fdbd2e73e" SECTION =
> "console/network" PR = "r1"
> 
> +RDEPENDS += "perl"

Can yo split out out the things that need perl? The meat of ebtables doesn't
need perl AFAIK and it would be a shame to drag in perl only for some helper
apps

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFRBZDPMkyGM64RGpERAngPAJ9ZXq43eATpg+dYBN9b0M0Sg/LJTgCfZltV
oA6rQGFkTCuvBBEwwOClEMc=
=n1zu
-----END PGP SIGNATURE-----



