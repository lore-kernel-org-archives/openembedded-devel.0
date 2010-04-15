Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1O2O4H-0001Fb-Ee
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Apr 2010 14:21:18 +0200
Received: (qmail 19236 invoked by uid 1003); 15 Apr 2010 12:17:43 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 15 Apr 2010 12:17:42 -0000
Message-ID: <4BC703E5.7080108@balister.org>
Date: Thu, 15 Apr 2010 08:17:41 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100330 Fedora/3.0.4-1.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1271270768-6212-1-git-send-email-marcin@juszkiewicz.com.pl>
In-Reply-To: <1271270768-6212-1-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH v3] linux-libc-headers 2.6.23: add newer ARM	hwcap flags
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
X-List-Received-Date: Thu, 15 Apr 2010 12:21:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Philip Balister <philip@balister.org>

On 04/14/2010 02:46 PM, Marcin Juszkiewicz wrote:
> From: Marcin Juszkiewicz<marcin@buglabs.net>
>
> OpenJDK uses HWCAP_THUMBEE which is not present in 2.6.23 headers.
>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
> ---
>   .../arm-hwcap-add-new-entries.patch                |   21 ++++++++++++++++++++
>   .../linux-libc-headers_2.6.23.bb                   |    5 ++-
>   2 files changed, 24 insertions(+), 2 deletions(-)
>   create mode 100644 recipes/linux-libc-headers/linux-libc-headers-2.6.23/arm-hwcap-add-new-entries.patch
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
> + #if defined(__KERNEL__)&&  !defined(__ASSEMBLY__)
> + /*
> +  * This yields a mask that user programs can use to figure out what
> +  * instruction set this cpu supports.
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
> index 95152f1..b4766bc 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
> @@ -2,11 +2,12 @@ require linux-libc-headers.inc
>
>   INHIBIT_DEFAULT_DEPS = "1"
>   DEPENDS += "unifdef-native"
> -PR = "r4"
> +PR = "r6"
>
>   SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
>              file://procinfo.h \
> -           file://unifdef.patch;patch=1"
> +           file://unifdef.patch;patch=1 \
> +           file://arm-hwcap-add-new-entries.patch;patch=1"
>
>   S = "${WORKDIR}/linux-${PV}"
>


