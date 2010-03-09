Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Np39X-0008QR-6i for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 18:23:35 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Np36F-0002UN-28 for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 18:20:07 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Mar 2010 18:20:07 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Mar 2010 18:20:07 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 09 Mar 2010 08:45:37 +0100
Message-ID: <hn4ub1$s7h$1@dough.gmane.org>
References: <1268085262-29850-1-git-send-email-ynezz@true.cz>
	<1268085262-29850-2-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100223 Shredder/3.0.3pre
In-Reply-To: <1268085262-29850-2-git-send-email-ynezz@true.cz>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,
	DATE_IN_PAST_06_12,SPF_HELO_PASS,SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] angstrom-led-config: Add LED setup for the ts72xx and bump PR
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
X-List-Received-Date: Tue, 09 Mar 2010 17:23:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

This led patch is in now

On 08-03-10 22:54, Petr Štetiar wrote:
> 
> Signed-off-by: Petr Štetiar <ynezz@true.cz>
> ---
>  recipes/angstrom/angstrom-led-config.bb          |    2 +-
>  recipes/angstrom/angstrom-led-config/ts72xx/leds |    3 +++
>  2 files changed, 4 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/angstrom/angstrom-led-config/ts72xx/leds
> 
> diff --git a/recipes/angstrom/angstrom-led-config.bb b/recipes/angstrom/angstrom-led-config.bb
> index a0373ed..2213a76 100644
> --- a/recipes/angstrom/angstrom-led-config.bb
> +++ b/recipes/angstrom/angstrom-led-config.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "Configuration files for runtime LED configuration" 
>  
>  #PV = "${DISTRO_VERSION}"
> -PR = "r7"
> +PR = "r8"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  inherit update-rc.d
> diff --git a/recipes/angstrom/angstrom-led-config/ts72xx/leds b/recipes/angstrom/angstrom-led-config/ts72xx/leds
> new file mode 100644
> index 0000000..03fedd8
> --- /dev/null
> +++ b/recipes/angstrom/angstrom-led-config/ts72xx/leds
> @@ -0,0 +1,3 @@
> +#file format: name trigger
> +platform:grled nand-disk
> +platform:rdled heartbeat

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLlfyhMkyGM64RGpERApbGAJ4gtmI/6wc5s9QgnTzUkWv3n20lVQCgp9ws
E2KOcIhoyGnpn1q1YHOhRws=
=qa3k
-----END PGP SIGNATURE-----



