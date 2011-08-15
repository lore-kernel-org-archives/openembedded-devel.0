Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QsrE2-0003RD-Sw for openembedded-devel@lists.openembedded.org;
	Mon, 15 Aug 2011 09:04:42 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Qsr9c-0006WP-39 for openembedded-devel@lists.openembedded.org;
	Mon, 15 Aug 2011 09:00:08 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2011 09:00:08 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2011 09:00:08 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 15 Aug 2011 08:57:48 +0200
Message-ID: <j2ag1c$7dv$2@dough.gmane.org>
References: <1313250436-32653-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
In-Reply-To: <1313250436-32653-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.2
Subject: Re: [meta-oe][PATCH 1/2] ocf-linux: extend to provide native and nativesdk recipes
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
X-List-Received-Date: Mon, 15 Aug 2011 07:04:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 13-08-11 17:47, Khem Raj schreef:
> Signed-off-by: Khem Raj <raj.khem@gmail.com> --- meta-oe/recipes-connectivity/openssl/ocf-linux.inc |    1 + 1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/meta-oe/recipes-connectivity/openssl/ocf-linux.inc b/meta-oe/recipes-connectivity/openssl/ocf-linux.inc index b98f887..f4ec7c9 100644 --- a/meta-oe/recipes-connectivity/openssl/ocf-linux.inc +++ b/meta-oe/recipes-connectivity/openssl/ocf-linux.inc @@ -22,3 +22,4 @@ do_install() { }
> 
> ALLOW_EMPTY = "1" +BBCLASSEXTEND = "native nativesdk"

Applied, thanks! I'll wait for a v2 of 2/2 which addressed Pauls comments.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOSMNsMkyGM64RGpERAt9tAKCRgTKhE1NYfkiwz5bMYHqnV0gKgQCgtUlF
aoKJUAolYcyRLCAGmN/ItQg=
=bV88
-----END PGP SIGNATURE-----



