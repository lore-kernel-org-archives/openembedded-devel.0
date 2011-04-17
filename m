Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QBWr4-0005wC-7j for openembedded-devel@lists.openembedded.org;
	Sun, 17 Apr 2011 20:37:54 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QBWoo-0008Ia-9w for openembedded-devel@lists.openembedded.org;
	Sun, 17 Apr 2011 20:35:34 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Apr 2011 20:35:34 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Apr 2011 20:35:34 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 17 Apr 2011 20:35:19 +0200
Message-ID: <iofbt7$hur$1@dough.gmane.org>
References: <1302328581-30367-1-git-send-email-heroor@gmail.com>
	<1302328581-30367-3-git-send-email-heroor@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1302328581-30367-3-git-send-email-heroor@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 3/3] libgles-omap3: Remove SGX Fixup for TI816x.
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
X-List-Received-Date: Sun, 17 Apr 2011 18:37:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09-04-11 07:56, Siddharth Heroor wrote:
> From: Siddharth Heroor <heroor@ti.com>
> 
> * Unlike OMAP3, the SGX core has not undergone revisions in TI816x.
>   The libraries for TI816x are also fixed and do not need fixup based
>   on revision of the SGX core.
> 
> Signed-off-by: Siddharth Heroor <heroor@ti.com>

So, I'm back from travelling now and I'll have to NAK this patch:

1) it assumes netra will never have an sgx core update and makes it
diverge from the other platforms.

2) it adds a useless 2 second boot delay

So the net result is a harder to maintain slower version of the scripts,
which is not acceptable.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNqzLnMkyGM64RGpERAgHyAKCXhRIKrqjA1FMKG+nJ8U2d+rAfYgCfSxEf
cywcK4FZnaGd12H1+B9fk4Q=
=goBu
-----END PGP SIGNATURE-----



