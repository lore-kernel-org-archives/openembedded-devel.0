Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TMFnQ-00030P-0F for openembedded-devel@lists.openembedded.org;
	Thu, 11 Oct 2012 12:15:16 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TMFan-00046v-HT for openembedded-devel@lists.openembedded.org;
	Thu, 11 Oct 2012 12:02:13 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Oct 2012 12:02:13 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Oct 2012 12:02:13 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 11 Oct 2012 12:02:06 +0200
Message-ID: <k565ek$4pd$1@ger.gmane.org>
References: <cover.1349944125.git.paul.eggleton@linux.intel.com>
	<a6614039ee04605d4b5efe6b2c2942dc9d0aac4d.1349944125.git.paul.eggleton@linux.intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
In-Reply-To: <a6614039ee04605d4b5efe6b2c2942dc9d0aac4d.1349944125.git.paul.eggleton@linux.intel.com>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-webserver][PATCH 2/2] apache2: reorganise packaging definitions
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
X-List-Received-Date: Thu, 11 Oct 2012 10:15:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 11-10-12 10:29, Paul Eggleton schreef:
> Move RDEPENDS to the end and PACKAGES before other packaging 
> definitions.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com> --- 
> .../recipes-httpd/apache2/apache2_2.4.2.bb         |    7 ++++--- 1 file
> changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb
> b/meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb index
> 2c0fa6b..5857be7 100644 ---
> a/meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb +++
> b/meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb

> +RDEPENDS_${PN} += "openssl libgcc"

To make it clearer for future generations, could you add a commend why these
aren't getting picked up by the shlib code?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQdpkeMkyGM64RGpERAn0nAJ9EmUE9s9NJnfs0JaYsyTMHfusJggCfWsez
aCjEmgGyXcmEt8JwpayqX4U=
=XkhP
-----END PGP SIGNATURE-----



