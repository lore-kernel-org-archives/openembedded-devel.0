Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OKCu5-0001ik-4A for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 18:04:21 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OKCpw-0007Dn-PQ for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 18:00:04 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jun 2010 18:00:04 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jun 2010 18:00:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 03 Jun 2010 17:51:35 +0200
Message-ID: <hu8j27$250$4@dough.gmane.org>
References: <1275579688-19909-1-git-send-email-chase.maupin@ti.com>	<1275579688-19909-2-git-send-email-chase.maupin@ti.com>
	<1275579688-19909-3-git-send-email-chase.maupin@ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100512 Shredder/3.0.6pre
In-Reply-To: <1275579688-19909-3-git-send-email-chase.maupin@ti.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/4] alsa-state/dm6467-evm: add asound file
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
X-List-Received-Date: Thu, 03 Jun 2010 16:04:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03-06-10 17:41, Chase Maupin wrote:
> * Add the asound.state file for the Texas Instruments
>   dm6467-evm platform.
> 
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>

Acked-by: Koen Kooi <k-kooi@ti.com>


> ---
>  .../{dm355-evm => dm6467-evm}/asound.state         |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
>  copy recipes/alsa/alsa-state/{dm355-evm => dm6467-evm}/asound.state (100%)
> 
> diff --git a/recipes/alsa/alsa-state/dm355-evm/asound.state b/recipes/alsa/alsa-state/dm6467-evm/asound.state
> similarity index 100%
> copy from recipes/alsa/alsa-state/dm355-evm/asound.state
> copy to recipes/alsa/alsa-state/dm6467-evm/asound.state
> index 8a5f84a..0ddbb54 100644
> --- a/recipes/alsa/alsa-state/dm355-evm/asound.state
> +++ b/recipes/alsa/alsa-state/dm6467-evm/asound.state
> @@ -534,7 +534,7 @@ state.EVM {
>  		comment.count 1
>  		iface MIXER
>  		name 'Right PGA Mixer Line1R Switch'
> -		value true
> +		value false
>  	}
>  	control.57 {
>  		comment.access 'read write'
> @@ -566,7 +566,7 @@ state.EVM {
>  		comment.count 1
>  		iface MIXER
>  		name 'Right PGA Mixer Mic3R Switch'
> -		value false
> +		value true
>  	}
>  	control.61 {
>  		comment.access 'read write'
> @@ -604,7 +604,7 @@ state.EVM {
>  		comment.count 1
>  		iface MIXER
>  		name 'Left PGA Mixer Line1L Switch'
> -		value true
> +		value false
>  	}
>  	control.65 {
>  		comment.access 'read write'
> @@ -628,7 +628,7 @@ state.EVM {
>  		comment.count 1
>  		iface MIXER
>  		name 'Left PGA Mixer Mic3L Switch'
> -		value false
> +		value true
>  	}
>  	control.68 {
>  		comment.access 'read write'

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMB8+HMkyGM64RGpERAstUAJ44tS+Y9pN8KAKMeJGSacLe1nyiCwCcDWjG
pactX+zwQdXUx0tR1B18c4g=
=gycC
-----END PGP SIGNATURE-----



