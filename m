Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PLWoE-0001wN-Qb for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 09:04:03 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PLWn4-0008Au-5y for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 09:02:50 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Nov 2010 09:02:50 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Nov 2010 09:02:50 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 25 Nov 2010 09:02:37 +0100
Message-ID: <icl56t$5k0$1@dough.gmane.org>
References: <1290620636-21238-1-git-send-email-eric@eukrea.com>	<1290620636-21238-2-git-send-email-eric@eukrea.com>	<AANLkTi=vHic9JYNfFH0-giLnB0x929Czhj3C_BriAN9L@mail.gmail.com>
	<4CED64C8.7060909@eukrea.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.15) Gecko/20101031 Shredder/3.0.11pre
In-Reply-To: <4CED64C8.7060909@eukrea.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/3] busybox: add 1.17.4 (latest stable version)
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
X-List-Received-Date: Thu, 25 Nov 2010 08:04:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 24-11-10 20:17, Eric Bénard wrote:
> On 24/11/2010 19:44, Khem Raj wrote:
>> On Wed, Nov 24, 2010 at 9:43 AM, Eric Bénard<eric@eukrea.com>  wrote:
>>> this is the latest stable version (1.17.3 + its fixes).
>>>
>>> Signed-off-by: Eric Bénard<eric@eukrea.com>
>>
>> Please install it on release branch as well. Do we still need 1.17.3 ?
>>
> if SHR switch to 1.17.4 we shouldn't need it anymore.
> (and if Ångström 2010 also switch to 1.17.4 we won't need 1.17.1).
> 
> Martin, Koen, are you ok with the patch below ?

Yes, you can move angstrom 2010 to 1.18.x as well if you wish

regards,

Koen

> 
> diff --git a/conf/distro/include/angstrom-2010-preferred-versions.inc
> b/conf/distro/include/angstrom-2010-preferred-v
> index 12ee900..bda21d9 100644
> --- a/conf/distro/include/angstrom-2010-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-2010-preferred-versions.inc
> @@ -13,7 +13,7 @@ PREFERRED_VERSION_autoconf = "2.65"
>  PREFERRED_VERSION_autoconf-native = "2.65"
>  PREFERRED_VERSION_automake = "1.11.1"
>  PREFERRED_VERSION_automake-native = "1.11.1"
> -PREFERRED_VERSION_busybox      = "1.17.1"
> +PREFERRED_VERSION_busybox      = "1.17.4"
>  PREFERRED_VERSION_cairo                = "1.10.0"
>  PREFERRED_VERSION_dbus                 = "1.2.24"
>  PREFERRED_VERSION_dropbear      = "0.51"
> diff --git a/conf/distro/include/preferred-shr-versions.inc
> b/conf/distro/include/preferred-shr-versions.inc
> index 22e1c82..da11164 100644
> --- a/conf/distro/include/preferred-shr-versions.inc
> +++ b/conf/distro/include/preferred-shr-versions.inc
> @@ -13,7 +13,7 @@ PREFERRED_VERSION_emacs-x11 = "23.1"
>  PREFERRED_VERSION_ncurses = "5.7"
>  PREFERRED_VERSION_ncurses-native = "5.7"
>  PREFERRED_VERSION_python-pycairo = "1.8.0"
> -PREFERRED_VERSION_busybox = "1.17.3"
> +PREFERRED_VERSION_busybox = "1.17.4"
> 
>  # we need new headers for libc, now OLDEST_KERNEL_linux-gnueabi = "2.6.24"
>  # and 2.6.31 for fsodeviced
> 
> Eric
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFM7hgdMkyGM64RGpERAqSPAJ9Ol83LmCeidaDHmP0K7ogWfZnMXACeMzdP
nTJj2PEoVVDGi19pt9t5GYU=
=snIS
-----END PGP SIGNATURE-----



