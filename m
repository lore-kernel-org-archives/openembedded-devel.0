Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QIDo4-00047W-9H for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2011 07:42:28 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QIDlV-0003yE-Aq for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2011 07:39:49 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2011 07:39:49 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2011 07:39:49 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 06 May 2011 07:39:37 +0200
Message-ID: <iq01ip$n8v$1@dough.gmane.org>
References: <1304653677-2982-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1304653677-2982-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH] conf/layer.conf: Use .= for BBPATH and += for BBFILES
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
X-List-Received-Date: Fri, 06 May 2011 05:42:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 06-05-11 05:47, raj.khem@gmail.com wrote:
> From: Khem Raj <raj.khem@gmail.com>


>  # We have a conf and classes directory, prepend to BBPATH to prefer our versions
> -BBPATH := "${LAYERDIR}:${BBPATH}"
> +BBPATH .= ":${LAYERDIR}"

I haven't had my morning coffee yet, but that either doesn't prepend
LAYERDIR to BBPATH or the colons are in the wrong place.


regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNw4mZMkyGM64RGpERAsNyAJ9UJ4GJ6blWQaYpCRO6s2v9N55jDQCdHeoR
gGUq5MZHntHS6d42OzHwjCM=
=G4SQ
-----END PGP SIGNATURE-----



