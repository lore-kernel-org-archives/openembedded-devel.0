Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q0EWL-0007p2-Lz for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 15:49:49 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q0EUW-00073P-9w for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 15:47:56 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 15:47:56 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 15:47:56 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 17 Mar 2011 15:47:38 +0100
Message-ID: <ilt6ua$r2l$1@dough.gmane.org>
References: <1300325100-29332-1-git-send-email-denis@denix.org>
	<20110317141220.GA16796@rhein.zuhause.netz>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <20110317141220.GA16796@rhein.zuhause.netz>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] cairo: disable native atomic operations, conflicts with libatomics-ops
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
X-List-Received-Date: Thu, 17 Mar 2011 14:49:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 17-03-11 15:12, Henning Heinold wrote:
> Hi,
> 
> I looked deeper into the problem.
> Cairo looks first for:
> 
> return __sync_fetch_and_add
> __sync_val_compare_and_swap
> 
> and defines it as cairo_cv_atomic_primitives="Intel".
> 
> According to http://gcc.gnu.org/wiki/Atomic
> arm and sh3/4 should work too.
> 
> If the configure compile fails
> cairo is looking for libatomic-ops
> support.
> 
> The libatomic-ops in oe is very old and misses diffrent bug fixes and is only
> needed for ppc and mips.

Is there a new version released yet or do you mean debian/fedora/suse
bugfixes?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNgh8KMkyGM64RGpERAlJzAJ0b6sByXKXffddvKChK+FpL7Hu4ngCfcQwQ
ek1CXJV0RPVg0BNVudsCnl0=
=q81c
-----END PGP SIGNATURE-----



