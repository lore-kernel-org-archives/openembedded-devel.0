Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1R383L-0005f6-P6
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Sep 2011 17:04:07 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so2381030bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2011 07:59:01 -0700 (PDT)
Received: by 10.204.143.28 with SMTP id s28mr990020bku.119.1315839541694;
	Mon, 12 Sep 2011 07:59:01 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (pd95cb174.dip0.t-ipconnect.de
	[217.92.177.116])
	by mx.google.com with ESMTPS id b17sm6403252bkd.8.2011.09.12.07.58.59
	(version=SSLv3 cipher=OTHER); Mon, 12 Sep 2011 07:59:00 -0700 (PDT)
Message-ID: <4E6E1E32.6010307@dresearch-fe.de>
Date: Mon, 12 Sep 2011 16:58:58 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110907 Thunderbird/6.0.2
MIME-Version: 1.0
To: Steffen Sledz <sledz@dresearch-fe.de>
References: <1315581753-7944-1-git-send-email-sledz@dresearch-fe.de>
In-Reply-To: <1315581753-7944-1-git-send-email-sledz@dresearch-fe.de>
X-Enigmail-Version: 1.3.1
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] linux-libc-headers 2.6.24: backport arm/asm/hwcap.h from recent kernels
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
X-List-Received-Date: Mon, 12 Sep 2011 15:04:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.09.2011 17:22, Steffen Sledz wrote:
> This patch is similar to the one in linux-libc-headers 2.6.23.

No NACKs? Then i'll push this patch tomorrow to oe-dev master.

> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> ---
>  .../arm-hwcap-add-new-entries.patch                |   21 ++++++++++++++++++++
>  .../linux-libc-headers_2.6.24.bb                   |    6 +++-
>  2 files changed, 25 insertions(+), 2 deletions(-)
>  create mode 100644 recipes/linux-libc-headers/linux-libc-headers-2.6.24/arm-hwcap-add-new-entries.patch
> 
> diff --git a/recipes/linux-libc-headers/linux-libc-headers-2.6.24/arm-hwcap-add-new-entries.patch b/recipes/linux-libc-headers/linux-libc-headers-2.6.24/arm-hwcap-add-new-entries.patch
> new file mode 100644
> index 0000000..6975317
> --- /dev/null
> +++ b/recipes/linux-libc-headers/linux-libc-headers-2.6.24/arm-hwcap-add-new-entries.patch
> @@ -0,0 +1,21 @@
> +---
> + include/asm-arm/hwcap.h |    4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +--- linux-2.6.24.orig/include/asm-arm/hwcap.h
> ++++ linux-2.6.24/include/asm-arm/hwcap.h
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
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
> index 148d03f..e321351 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
> @@ -2,16 +2,18 @@ require linux-libc-headers.inc
>  
>  INHIBIT_DEFAULT_DEPS = "1"
>  DEPENDS += "unifdef-native"
> -PR = "r7"
> +PR = "r8"
>  
>  SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
>             file://procinfo.h \
>             file://export_falloc_h.patch \
>             file://make-3.82.patch \
> -           file://unifdef.patch"
> +           file://unifdef.patch \
> +           file://arm-hwcap-add-new-entries.patch"
>  
>  SRC_URI_append_hipox = " \
>  	file://siocoutqsnd.patch \
> +	file://drbcc-linedisc.patch \
>  	"
>  
>  S = "${WORKDIR}/linux-${PV}"

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


