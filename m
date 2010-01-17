Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NWcIx-0007ba-Gd for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 22:05:06 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NWcGo-0006OR-9l
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 22:02:50 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 22:02:50 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 22:02:50 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 17 Jan 2010 22:02:28 +0100
Message-ID: <hivtt3$v2r$1@ger.gmane.org>
References: <1263760344-26105-1-git-send-email-eric@eukrea.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100113 Shredder/3.0.2pre
In-Reply-To: <1263760344-26105-1-git-send-email-eric@eukrea.com>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] barebox: Add recipe for this new bootloader
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
X-List-Received-Date: Sun, 17 Jan 2010 21:05:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 17-01-10 21:32, Eric Benard wrote:
> * barebox is "a bootloader that inherits the best of U-Boot and the Linux kernel"
> * add recipe for v2009.12.0 (last stable)
> * add recipe for git repository
> 
> Signed-off-by: Eric Benard <eric@eukrea.com>

> +++ b/recipes/barebox/barebox_2009.12.bb
> @@ -0,0 +1,15 @@


> +PR = "r0"

> +++ b/recipes/barebox/barebox_git.bb
> @@ -0,0 +1,10 @@

> +PR = "r0"

Please don't set variables to the current default value, but leave them
out. We had tons of problems with vars getting copy/paste where the
default changed and we had to manually fix those (e.g. efl.bbclass still
pokes needlessly at PACKAGES).

Setting PR is relatively minor, but lets stay consistent :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLU3rkMkyGM64RGpERAozFAKCreMUUurwnuzOIWPSqx7ZEUTeNVACeNxUF
vSV+pweWy2F1wabuldokuIw=
=TFC8
-----END PGP SIGNATURE-----



