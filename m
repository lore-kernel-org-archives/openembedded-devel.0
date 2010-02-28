Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NlpHf-0003lA-Qu for openembedded-devel@lists.openembedded.org;
	Sun, 28 Feb 2010 20:58:39 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NlpEy-00032Y-Um for openembedded-devel@lists.openembedded.org;
	Sun, 28 Feb 2010 20:55:48 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2010 20:55:48 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2010 20:55:48 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 28 Feb 2010 20:55:37 +0100
Message-ID: <hmehnp$n57$1@dough.gmane.org>
References: <1267383448-7009-1-git-send-email-ospite@studenti.unina.it>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100219 Shredder/3.0.3pre
In-Reply-To: <1267383448-7009-1-git-send-email-ospite@studenti.unina.it>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] ezx: Use pulseaudio 0.9.15
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
X-List-Received-Date: Sun, 28 Feb 2010 19:58:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 28-02-10 19:57, Antonio Ospite wrote:
> Pulseaudio versions newer than 0.9.15 don't build on ezx machines (and
> presumably on any armv5te), stick to this version until the problem is
> handled upstream and a patch is available.
> 
> Cfr: http://bugs.openembedded.org/show_bug.cgi?id=5404
> 
> Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
> ---
>  conf/machine/include/motorola-ezx-base.inc |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/conf/machine/include/motorola-ezx-base.inc b/conf/machine/include/motorola-ezx-base.inc
> index 75c0f42..4d17211 100644
> --- a/conf/machine/include/motorola-ezx-base.inc
> +++ b/conf/machine/include/motorola-ezx-base.inc
> @@ -2,6 +2,7 @@ TARGET_ARCH = "arm"
>  
>  PREFERRED_PROVIDER_xserver = "xserver-kdrive"
>  PREFERRED_PROVIDER_virtual/kernel ?= "openezx-kernel"
> +PREFERRED_VERSION_pulseaudio = "0.9.15"

NAK: machines have no business setting versions (except for kernels and
even that is debatable).

If it doesn't build, fix your distro.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLiso5MkyGM64RGpERAlimAKCeTk+/aznFhmSWt+jrrARo3pU7/ACfbTVe
23RWoqCv4bOfPPRzj/0fKfg=
=v16E
-----END PGP SIGNATURE-----



