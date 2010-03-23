Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NttTh-0002z6-4G
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 03:04:34 +0100
Received: (qmail 31820 invoked by uid 1003); 23 Mar 2010 02:01:10 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 23 Mar 2010 02:01:09 -0000
Message-ID: <4BA820E4.8020501@balister.org>
Date: Mon, 22 Mar 2010 22:01:08 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.8) Gecko/20100301 Fedora/3.0.3-1.fc11 Thunderbird/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1269256016-13155-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1269256016-13155-8-git-send-email-marcin@juszkiewicz.com.pl>
In-Reply-To: <1269256016-13155-8-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][STABLE] shadow: Extend securetty file to include more	common ttys (inc. ones used on OMAP3 platforms). Small	correction for login pam file.
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
X-List-Received-Date: Tue, 23 Mar 2010 02:04:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Philip Balister <philip@balister.org>


On 03/22/2010 07:06 AM, Marcin Juszkiewicz wrote:
> From: David-John Willis<John.Willis@Distant-earth.com>
>
> Signed-off-by: Chris Larson<clarson@mvista.com>
> ---
>   recipes/shadow/files/pam.d/login |    2 +-
>   recipes/shadow/files/securetty   |   31 +++++++++++++++++++++++++++++--
>   recipes/shadow/shadow.inc        |    2 +-
>   3 files changed, 31 insertions(+), 4 deletions(-)
>
> diff --git a/recipes/shadow/files/pam.d/login b/recipes/shadow/files/pam.d/login
> index 65992c6..e41eb04 100644
> --- a/recipes/shadow/files/pam.d/login
> +++ b/recipes/shadow/files/pam.d/login
> @@ -44,7 +44,7 @@ session       required   pam_env.so readenv=1
>   session       required   pam_env.so readenv=1 envfile=/etc/default/locale
>
>   # Standard Un*x authentication.
> -@include common-auth
> +auth       include      common-auth
>
>   # This allows certain extra groups to be granted to a user
>   # based on things like time of day, tty, service, and user.
> diff --git a/recipes/shadow/files/securetty b/recipes/shadow/files/securetty
> index 2705baa..8fd26e0 100644
> --- a/recipes/shadow/files/securetty
> +++ b/recipes/shadow/files/securetty
> @@ -5,12 +5,20 @@ console
>   # Standard serial ports
>   ttyS0
>   ttyS1
> +ttyS2
> +ttyS3
>
>   # USB dongles
>   ttyUSB0
>   ttyUSB1
>   ttyUSB2
>
> +# PowerMac
> +ttyPZ0
> +ttyPZ1
> +ttyPZ2
> +ttyPZ3
> +
>   # Embedded MPC platforms
>   ttyPSC0
>   ttyPSC1
> @@ -94,8 +102,27 @@ tty61
>   tty62
>   tty63
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
>   # Standard serial ports, with devfs
>   tts/0
> diff --git a/recipes/shadow/shadow.inc b/recipes/shadow/shadow.inc
> index 4a40151..68381f0 100644
> --- a/recipes/shadow/shadow.inc
> +++ b/recipes/shadow/shadow.inc
> @@ -11,7 +11,7 @@ LICENSE = "BSD"
>   SECTION = "base"
>   DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>
> -INC_PR = "r7"
> +INC_PR = "r8"
>
>   # Additional Policy files for PAM
>   PAM_SRC_URI = " \


