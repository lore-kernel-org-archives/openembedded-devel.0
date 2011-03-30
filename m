Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q4wzI-0004Dr-40 for openembedded-devel@lists.openembedded.org;
	Wed, 30 Mar 2011 17:07:12 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q4wxO-0000Wl-Nu for openembedded-devel@lists.openembedded.org;
	Wed, 30 Mar 2011 17:05:14 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Mar 2011 17:05:14 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Mar 2011 17:05:14 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 30 Mar 2011 17:04:58 +0200
Message-ID: <imvgqq$536$1@dough.gmane.org>
References: <1301494030-10554-1-git-send-email-v2g.udel@gmail.com>
	<1301494030-10554-2-git-send-email-v2g.udel@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1301494030-10554-2-git-send-email-v2g.udel@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 2/6] Allows the use of the angstrom distribution with ARM cores that do not support THUMB_INTERWORK instructions
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
X-List-Received-Date: Wed, 30 Mar 2011 15:07:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 30-03-11 16:07, UDel V2G Team wrote:
> * Setting THUMB_INTERWORK = "yes" precludes the building of
>   any angstrom distribution for cores that do not support
>   thumb and thumb_interwork since the distro definitions
>   take precedence over any local settings.
> 
> Signed-off-by: UDel V2G Team <v2g.udel@gmail.com>

That needs to be a real name, but the change looks OK otherwise

Khem, Thomas, how did you produce working collie image before this changes?

regards,

Koen

> ---
>  conf/distro/include/angstrom.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/distro/include/angstrom.inc b/conf/distro/include/angstrom.inc
> index 5a02723..9ec1dc7 100644
> --- a/conf/distro/include/angstrom.inc
> +++ b/conf/distro/include/angstrom.inc
> @@ -54,7 +54,7 @@ ARM_INSTRUCTION_SET = "${ANGSTROM_ARM_INSTRUCTION_SET}"
>  #    but requires more instructions (140% for 70% smaller code) so may be
>  #    slower.
>  
> -THUMB_INTERWORK = "yes"
> +THUMB_INTERWORK ?= "yes"
>  # "yes" "no"
>  #    Whether to compile with code to allow interworking between the two
>  #    instruction sets.  This allows thumb code to be executed on a primarily

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNk0aaMkyGM64RGpERAgM1AKCT29EFboKvc144BRY9nll1oVEX2ACgjeDm
DmldbpGH/jHxj7n/ZbAyNww=
=oPTu
-----END PGP SIGNATURE-----



