Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P9hBU-0005En-7Y for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 18:43:09 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P9hAq-00084c-7f for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 18:42:28 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Oct 2010 18:42:28 +0200
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Oct 2010 18:42:28 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 23 Oct 2010 18:42:13 +0200
Message-ID: <i9v396$cn4$1@dough.gmane.org>
References: <1287848486-14980-1-git-send-email-fransmeulenbroeks@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.14) Gecko/20101002 Shredder/3.0.9pre
In-Reply-To: <1287848486-14980-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] u-boot-sakoman_git.bb: updated SRCREV to head to make it building again
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
X-List-Received-Date: Sat, 23 Oct 2010 16:43:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 23-10-10 17:41, Frans Meulenbroeks wrote:
> SRCREV was "ccd0c67858c6e2807c695e2c8f545284cb871866", but that is not in the
> omap4s-exp branch any more. Guess it was gone after a merge. To make things
> building I moved the the head of the branch
> SRCREV = "8b931e51f46acffd61096553ae89dfb3ee30d398"

That branch is rebased frequently, so this won't help much. The tarball
snapshot for the current revision is available on the angstrom source
mirror, so if you are using angstrom and a recent bitbake you won't get
bothered by the rebasing.
Having said all that, we should find a working repo for panda uboot and
use that. AIUI denx git should work soon.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMwxBlMkyGM64RGpERApReAKCAOx35isbpE8o2U0RsdDO/OxDWGQCguAlh
BR8/QKObE+3qsXe6RgKiuUY=
=3vun
-----END PGP SIGNATURE-----



