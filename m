Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QyIc1-0001sc-4R for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 09:19:57 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QyIXK-0007xz-EX for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 09:15:06 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2011 09:15:06 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2011 09:15:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 30 Aug 2011 09:11:31 +0200
Message-ID: <j3i2f3$iel$1@dough.gmane.org>
References: <cover.1314603785.git.noor_ahsan@mentor.com>
	<d64d7f3b4f4c6ffeda342ce8df7ba1561fcb47b0.1314603785.git.noor_ahsan@mentor.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0) Gecko/20110812 Thunderbird/6.0
In-Reply-To: <d64d7f3b4f4c6ffeda342ce8df7ba1561fcb47b0.1314603785.git.noor_ahsan@mentor.com>
X-Enigmail-Version: 1.3
Subject: Re: [meta-oe][PATCH v2 3/4] lmbench: Add version 3.0-a9 (initial recipe)
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
X-List-Received-Date: Tue, 30 Aug 2011 07:19:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 29-08-11 10:17, Noor, Ahsan schreef:
> From: Noor Ahsan <noor_ahsan@mentor.com>
> 
> * Imported from oe.dev commit id bac6441118e0b78d55c98afdc108f03b6c655909.
> 
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>

You need to send a follow up patch to fix:

> diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb new file mode 100644 index 0000000..7efdad5 --- /dev/null +++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb

> +RDEPENDS_${PN} = "debianutils" +FILES_${PN} += "${datadir}/lmbench"

NOTE: Runtime target 'debianutils' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['debianutils']
ERROR: Required build target 'lmbench' has no buildable providers.
Missing or unbuildable dependency chain was: ['lmbench', 'debianutils']
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOXI0iMkyGM64RGpERAty/AJ9x8m6MshXyIi8mbORyEGRFYqXtQgCbB4xB
RHmSVE72NyAih3MsEaLn/Rk=
=HWaT
-----END PGP SIGNATURE-----



