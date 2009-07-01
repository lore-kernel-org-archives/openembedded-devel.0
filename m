Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MM654-0005wh-E2
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 22:06:58 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MM5tW-0006vB-NK
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 19:55:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 01 Jul 2009 19:55:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 01 Jul 2009 19:55:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 01 Jul 2009 21:17:02 +0200
Message-ID: <h2gcne$bts$10@ger.gmane.org>
References: <200907011819.54127.marcin@juszkiewicz.com.pl>
	<1246474518-16737-4-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090622 Shredder/3.0b3pre
In-Reply-To: <1246474518-16737-4-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 100/125] linux-kexecboot-2.6.24: fix compilation with gcc-4.3. Bump PR
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
X-List-Received-Date: Wed, 01 Jul 2009 20:06:58 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01-07-09 20:55, Marcin Juszkiewicz wrote:
> From: Andrea Adami<andrea.adami@gmail.com>
>
> Since some architectures don't support __udivdi3().
>
> Signed-off-by: Segher Boessenkool<segher@kernel.crashing.org>
> Cc: john stultz<johnstul@us.ibm.com>
> Cc: Ingo Molnar<mingo@elte.hu>
> Signed-off-by: Andrew Morton<akpm@linux-foundation.org>
> Signed-off-by: Thomas Gleixner<tglx@linutronix.de>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>

Acked-by: Koen Kooi <koen@openembedded.org>


> ---
>   ...vent-the-loop-in-timespec_add_ns-from-bei.patch |   15 +++++++++++++++
>   recipes/kexecboot/linux-kexecboot.inc              |    2 +-
>   recipes/kexecboot/linux-kexecboot_2.6.24.bb        |    1 +
>   3 files changed, 17 insertions(+), 1 deletions(-)
>   create mode 100644 recipes/kexecboot/linux-kexecboot-2.6.24/0001-time-prevent-the-loop-in-timespec_add_ns-from-bei.patch
>
> diff --git a/recipes/kexecboot/linux-kexecboot-2.6.24/0001-time-prevent-the-loop-in-timespec_add_ns-from-bei.patch b/recipes/kexecboot/linux-kexecboot-2.6.24/0001-time-prevent-the-loop-in-timespec_add_ns-from-bei.patch
> new file mode 100644
> index 0000000..9d7020d
> --- /dev/null
> +++ b/recipes/kexecboot/linux-kexecboot-2.6.24/0001-time-prevent-the-loop-in-timespec_add_ns-from-bei.patch
> @@ -0,0 +1,15 @@
> +Index: linux-2.6.24/include/linux/time.h
> +===================================================================
> +--- a/include/linux/time.h
> ++++ b/include/linux/time.h
> +@@ -172,6 +172,10 @@ static inline void timespec_add_ns(struct timespec *a, u64 ns)
> + {
> +	ns += a->tv_nsec;
> +	while(unlikely(ns>= NSEC_PER_SEC)) {
> ++		/* The following asm() prevents the compiler from
> ++		 * optimising this loop into a modulo operation.  */
> ++		asm("" : "+r"(ns));
> ++
> +		ns -= NSEC_PER_SEC;
> +		a->tv_sec++;
> +	}
> diff --git a/recipes/kexecboot/linux-kexecboot.inc b/recipes/kexecboot/linux-kexecboot.inc
> index eba5d66..e47d10b 100644
> --- a/recipes/kexecboot/linux-kexecboot.inc
> +++ b/recipes/kexecboot/linux-kexecboot.inc
> @@ -1,5 +1,5 @@
>   # We set PR here, since a change in the kexecboot recipe will need to get picked up by *all* the kernels:
> -PR = "r12"
> +PR = "r13"
>
>   SRC_URI = "file://defconfig"
>
> diff --git a/recipes/kexecboot/linux-kexecboot_2.6.24.bb b/recipes/kexecboot/linux-kexecboot_2.6.24.bb
> index f728c7a..82484f4 100644
> --- a/recipes/kexecboot/linux-kexecboot_2.6.24.bb
> +++ b/recipes/kexecboot/linux-kexecboot_2.6.24.bb
> @@ -21,6 +21,7 @@ DEFAULT_PREFERENCE_spitz = "1"
>   # Patches submitted upstream are towards top of this list
>   # Hacks should clearly named and at the bottom
>   SRC_URI += "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.24.tar.bz2 \
> +           file://0001-time-prevent-the-loop-in-timespec_add_ns-from-bei.patch;patch=1 \
>              ${RPSRC}/export_atags-r2.patch;patch=1;status=pending \
>              ${RPSRC}/lzo_crypto-r2.patch;patch=1;status=pending \
>              ${RPSRC}/corgi_rearrange_lcd-r0.patch;patch=1;status=pending \




