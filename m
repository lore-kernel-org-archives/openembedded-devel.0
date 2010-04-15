Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O2JB1-0002A4-Of for openembedded-devel@lists.openembedded.org;
	Thu, 15 Apr 2010 09:08:01 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O2J7c-0002JS-Lq for openembedded-devel@lists.openembedded.org;
	Thu, 15 Apr 2010 09:04:20 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Apr 2010 09:04:20 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Apr 2010 09:04:20 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 15 Apr 2010 09:04:09 +0200
Message-ID: <hq6dp9$62o$1@dough.gmane.org>
References: <1271270768-6212-1-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100406 Shredder/3.0.5pre
In-Reply-To: <1271270768-6212-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH v3] linux-libc-headers 2.6.23: add newer ARM hwcap flags
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
X-List-Received-Date: Thu, 15 Apr 2010 07:08:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 14-04-10 20:46, Marcin Juszkiewicz wrote:
> From: Marcin Juszkiewicz <marcin@buglabs.net>
> 
> OpenJDK uses HWCAP_THUMBEE which is not present in 2.6.23 headers.


Acked-by: Koen Kooi <koen@openembedded.org>


> 
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
> ---
>  .../arm-hwcap-add-new-entries.patch                |   21 ++++++++++++++++++++
>  .../linux-libc-headers_2.6.23.bb                   |    5 ++-
>  2 files changed, 24 insertions(+), 2 deletions(-)
>  create mode 100644 recipes/linux-libc-headers/linux-libc-headers-2.6.23/arm-hwcap-add-new-entries.patch
> 
> diff --git a/recipes/linux-libc-headers/linux-libc-headers-2.6.23/arm-hwcap-add-new-entries.patch b/recipes/linux-libc-headers/linux-libc-headers-2.6.23/arm-hwcap-add-new-entries.patch
> new file mode 100644
> index 0000000..934db51
> --- /dev/null
> +++ b/recipes/linux-libc-headers/linux-libc-headers-2.6.23/arm-hwcap-add-new-entries.patch
> @@ -0,0 +1,21 @@
> +---
> + include/asm-arm/hwcap.h |    4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +--- linux-2.6.23.orig/include/asm-arm/hwcap.h
> ++++ linux-2.6.23/include/asm-arm/hwcap.h
> +@@ -13,10 +13,14 @@
> + #define HWCAP_VFP	64
> + #define HWCAP_EDSP	128
> + #define HWCAP_JAVA	256
> + #define HWCAP_IWMMXT	512
> + #define HWCAP_CRUNCH	1024
> ++#define HWCAP_THUMBEE	2048
> ++#define HWCAP_NEON	4096
> ++#define HWCAP_VFPv3	8192
> ++#define HWCAP_VFPv3D16	16384
> + 
> + #if defined(__KERNEL__) && !defined(__ASSEMBLY__)
> + /*
> +  * This yields a mask that user programs can use to figure out what
> +  * instruction set this cpu supports.
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
> index 95152f1..b4766bc 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
> @@ -2,11 +2,12 @@ require linux-libc-headers.inc
>  
>  INHIBIT_DEFAULT_DEPS = "1"
>  DEPENDS += "unifdef-native"
> -PR = "r4"
> +PR = "r6"
>  
>  SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
>             file://procinfo.h \
> -           file://unifdef.patch;patch=1"
> +           file://unifdef.patch;patch=1 \
> +           file://arm-hwcap-add-new-entries.patch;patch=1"
>  
>  S = "${WORKDIR}/linux-${PV}"
>  

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLxrppMkyGM64RGpERAsaaAJ93gZArcrMiufcUSGDNmYAmKWUVXACaA4VX
TeeiM7IQ0DL3xrZhM7F9qXA=
=RKq6
-----END PGP SIGNATURE-----



