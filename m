Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OnScc-000850-0W for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 10:43:14 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OnSc3-0008Vu-3M for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 10:42:39 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 10:42:39 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 10:42:39 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 23 Aug 2010 10:42:23 +0200
Message-ID: <i4tc9f$qie$1@dough.gmane.org>
References: <1282245064-30490-1-git-send-email-jkridner@beagleboard.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100729 Shredder/3.0.7pre
In-Reply-To: <1282245064-30490-1-git-send-email-jkridner@beagleboard.org>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] beagleboard.conf: use qt4-x11-free-gles
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
X-List-Received-Date: Mon, 23 Aug 2010 08:43:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 19-08-10 21:11, Jason Kridner wrote:
> 
> Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
> ---
>  conf/machine/beagleboard.conf |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/conf/machine/beagleboard.conf b/conf/machine/beagleboard.conf
> index ce48019..579bcc6 100644
> --- a/conf/machine/beagleboard.conf
> +++ b/conf/machine/beagleboard.conf
> @@ -16,6 +16,7 @@ GUI_MACHINE_CLASS = "bigscreen"
>  require conf/machine/include/omap3.inc
>  
>  PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
> +PREFERRED_PROVIDER_qt4-x11-free = "qt4-x11-free-gles"

NAK, this is a distro setting, not a machine setting.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMcjRvMkyGM64RGpERAsVuAJ9EpJJSFAQyyeAkixmwf/Whzgv/lQCcDr6d
G9yO0djaY8rRqmA98aWxjZ0=
=0pc0
-----END PGP SIGNATURE-----



