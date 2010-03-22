Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NtgyL-0005aP-64 for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 13:43:15 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NtgvL-00071J-Ew for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 13:40:03 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Mar 2010 13:40:03 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Mar 2010 13:40:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 22 Mar 2010 13:36:30 +0100
Message-ID: <ho7o8e$nb2$13@dough.gmane.org>
References: <1269256016-13155-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1269256016-13155-8-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100314 Shredder/3.0.4pre
In-Reply-To: <1269256016-13155-8-git-send-email-marcin@juszkiewicz.com.pl>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][STABLE] shadow: Extend securetty file to include more common ttys (inc. ones used on OMAP3 platforms). Small correction for login pam file.
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
X-List-Received-Date: Mon, 22 Mar 2010 12:43:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Acked-by: Koen Kooi <koen@openembedded.org>

On 22-03-10 12:06, Marcin Juszkiewicz wrote:
> From: David-John Willis <John.Willis@Distant-earth.com>
> 
> Signed-off-by: Chris Larson <clarson@mvista.com>
> ---
>  recipes/shadow/files/pam.d/login |    2 +-
>  recipes/shadow/files/securetty   |   31 +++++++++++++++++++++++++++++--
>  recipes/shadow/shadow.inc        |    2 +-
>  3 files changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes/shadow/files/pam.d/login b/recipes/shadow/files/pam.d/login
> index 65992c6..e41eb04 100644
> --- a/recipes/shadow/files/pam.d/login
> +++ b/recipes/shadow/files/pam.d/login
> @@ -44,7 +44,7 @@ session       required   pam_env.so readenv=1
>  session       required   pam_env.so readenv=1 envfile=/etc/default/locale
>  
>  # Standard Un*x authentication.
> -@include common-auth
> +auth       include      common-auth
>  
>  # This allows certain extra groups to be granted to a user
>  # based on things like time of day, tty, service, and user.
> diff --git a/recipes/shadow/files/securetty b/recipes/shadow/files/securetty
> index 2705baa..8fd26e0 100644
> --- a/recipes/shadow/files/securetty
> +++ b/recipes/shadow/files/securetty
> @@ -5,12 +5,20 @@ console
>  # Standard serial ports
>  ttyS0
>  ttyS1
> +ttyS2
> +ttyS3
>  
>  # USB dongles
>  ttyUSB0
>  ttyUSB1
>  ttyUSB2
>  
> +# PowerMac
> +ttyPZ0
> +ttyPZ1
> +ttyPZ2
> +ttyPZ3
> +
>  # Embedded MPC platforms
>  ttyPSC0
>  ttyPSC1
> @@ -94,8 +102,27 @@ tty61
>  tty62
>  tty63
>  
> -# devfs consoles
> -# Note: On kernels greater than 2.6.12, this is not needed.
> +# Local X displays (allows empty passwords with pam_unix's nullok_secure)
> +:0
> +:0.0
> +:0.1
> +:1
> +:1.0
> +:1.1
> +:2
> +:2.0
> +:2.1
> +:3
> +:3.0
> +:3.1
> +
> +# Embedded Freescale i.MX ports
> +ttymxc0
> +ttymxc1
> +ttymxc2
> +ttymxc3
> +ttymxc4
> +ttymxc5
>  
>  # Standard serial ports, with devfs
>  tts/0
> diff --git a/recipes/shadow/shadow.inc b/recipes/shadow/shadow.inc
> index 4a40151..68381f0 100644
> --- a/recipes/shadow/shadow.inc
> +++ b/recipes/shadow/shadow.inc
> @@ -11,7 +11,7 @@ LICENSE = "BSD"
>  SECTION = "base"
>  DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>  
> -INC_PR = "r7"
> +INC_PR = "r8"
>  
>  # Additional Policy files for PAM
>  PAM_SRC_URI = " \

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLp2ROMkyGM64RGpERAm6OAJ9Kjoc0X35EFEUSVlylx4hSVJljPACfcaai
ZSCwFkDGNKbGcaAWM8/ku8M=
=6NuH
-----END PGP SIGNATURE-----



