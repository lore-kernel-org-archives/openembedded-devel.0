Received: from mail-wy0-f179.google.com ([74.125.82.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1R4VF5-000681-DO
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Sep 2011 12:01:57 +0200
Received: by wyh21 with SMTP id 21so3580778wyh.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2011 02:56:39 -0700 (PDT)
Received: by 10.227.12.10 with SMTP id v10mr2511463wbv.41.1316166999175;
	Fri, 16 Sep 2011 02:56:39 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id h20sm6080904wbo.22.2011.09.16.02.56.37
	(version=SSLv3 cipher=OTHER); Fri, 16 Sep 2011 02:56:37 -0700 (PDT)
Message-ID: <4E731D54.6020608@dresearch-fe.de>
Date: Fri, 16 Sep 2011 11:56:36 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110907 Thunderbird/6.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1316077506.4523.10.camel@mattotaupa>
	<1316089742-26495-1-git-send-email-sledz@dresearch-fe.de>
In-Reply-To: <1316089742-26495-1-git-send-email-sledz@dresearch-fe.de>
X-Enigmail-Version: 1.3.1
Subject: Re: [PATCH v5] linux-libc-headers 2.6.24: backport arm/asm/hwcap.h from linux 2.6.26
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
X-List-Received-Date: Fri, 16 Sep 2011 10:01:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.09.2011 14:29, Steffen Sledz wrote:
> Enables building of OpenJDK which uses HWCAP_THUMBEE that is not present
> in 2.6.24 headers and was introduced with
> 
>   commit d7f864be8323e5394040e2877594645b0e7da85d
>   Author: Catalin Marinas <catalin.marinas@arm.com>
>   Date:   Fri Apr 18 22:43:06 2008 +0100
> 
>       ARMv7: Add support for the ThumbEE state saving/restoring
> 
>       This patch adds the detection and handling of the ThumbEE extension on
>       ARMv7 CPUs.
> 
>       Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> 
> Upstream-Status: Backport [2.6.26]
> 
> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
> [PATCH v5] contains updates in commit comment and patch header as a result of
> Paul's review of [PATCH v4] especially the referenced linux commit.
> ---
>  .../arm-hwcap-add-new-entries.patch                |   31 ++++++++++++++++++++
>  .../linux-libc-headers_2.6.24.bb                   |    6 ++-
>  2 files changed, 35 insertions(+), 2 deletions(-)
>  create mode 100644 recipes/linux-libc-headers/linux-libc-headers-2.6.24/arm-hwcap-add-new-entries.patch
> 
> diff --git a/recipes/linux-libc-headers/linux-libc-headers-2.6.24/arm-hwcap-add-new-entries.patch b/recipes/linux-libc-headers/linux-libc-headers-2.6.24/arm-hwcap-add-new-entries.patch
> new file mode 100644
> index 0000000..80a7949
> --- /dev/null
> +++ b/recipes/linux-libc-headers/linux-libc-headers-2.6.24/arm-hwcap-add-new-entries.patch
> @@ -0,0 +1,31 @@
> +linux-libc-headers 2.6.24: backport arm/asm/hwcap.h from linux 2.6.26
> +
> +Enables building of OpenJDK which uses HWCAP_THUMBEE that is not present
> +in 2.6.24 headers and was introduced with
> +
> +  commit d7f864be8323e5394040e2877594645b0e7da85d
> +  Author: Catalin Marinas <catalin.marinas@arm.com>
> +  Date:   Fri Apr 18 22:43:06 2008 +0100
> +  
> +      ARMv7: Add support for the ThumbEE state saving/restoring
> +      
> +      This patch adds the detection and handling of the ThumbEE extension on
> +      ARMv7 CPUs.
> +            
> +      Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> +
> +Upstream-Status: Backport [2.6.26]
> +
> +Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> +
> +diff -Nurd linux-2.6.24.orig//include/asm-arm/hwcap.h linux-2.6.24/include/asm-arm/hwcap.h
> +--- linux-2.6.24.orig//include/asm-arm/hwcap.h	2011-09-15 08:42:58.467307245 +0200
> ++++ linux-2.6.24/include/asm-arm/hwcap.h	2011-09-15 08:43:46.004693497 +0200
> +@@ -15,6 +15,7 @@
> + #define HWCAP_JAVA	256
> + #define HWCAP_IWMMXT	512
> + #define HWCAP_CRUNCH	1024
> ++#define HWCAP_THUMBEE	2048
> + 
> + #if defined(__KERNEL__) && !defined(__ASSEMBLY__)
> + /*
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
> index 148d03f..d7f67ed 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
> @@ -2,13 +2,15 @@ require linux-libc-headers.inc
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
> +           file://arm-hwcap-add-new-entries.patch \
> +"
>  
>  SRC_URI_append_hipox = " \
>  	file://siocoutqsnd.patch \

applied and pushed

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


