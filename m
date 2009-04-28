Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lyhbv-0003fO-TJ
	for openembedded-devel@openembedded.org; Tue, 28 Apr 2009 09:20:12 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LyhWx-0003iW-4E
	for openembedded-devel@openembedded.org; Tue, 28 Apr 2009 07:15:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 28 Apr 2009 07:15:03 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 28 Apr 2009 07:15:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 28 Apr 2009 09:10:55 +0200
Message-ID: <gt6a60$sbd$2@ger.gmane.org>
References: <20090428040959.GT18788@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090421 Shredder/3.0b3pre
In-Reply-To: <20090428040959.GT18788@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] Enable PTHREADS_DEBUG_SUPPORT on all uClibc builds
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
X-List-Received-Date: Tue, 28 Apr 2009 07:20:13 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28-04-09 06:09, Tom Rini wrote:
> As has been reported, building uClibc with PTHREADS_DEBUG_SUPPORT=n
> means that task-sdk-bare won't install due to missing uclibc-thread-db.
> The following enables it everywhere it was disabled and bumps PRs.  This
> should be fine given that we already have separate debug packages and
> the extra files end up in an additional package.
>
> Signed-off-by: Tom Rini<trini@embeddedalley.com>

Acked-by: Koen Kooi <koen@openembedded.org>


>
> diff --git a/recipes/uclibc/uclibc-0.9.27/wrt54/uClibc.config b/recipes/uclibc/uclibc-0.9.27/wrt54/uClibc.config
> index 5fddbed..1a24121 100644
> --- a/recipes/uclibc/uclibc-0.9.27/wrt54/uClibc.config
> +++ b/recipes/uclibc/uclibc-0.9.27/wrt54/uClibc.config
> @@ -63,7 +63,7 @@ LDSO_BASE_FILENAME="ld.so"
>   UCLIBC_CTOR_DTOR=y
>   # HAS_NO_THREADS is not set
>   UCLIBC_HAS_THREADS=y
> -# PTHREADS_DEBUG_SUPPORT is not set
> +PTHREADS_DEBUG_SUPPORT=y
>   UCLIBC_HAS_LFS=y
>   # MALLOC is not set
>   # MALLOC_SIMPLE is not set
> diff --git a/recipes/uclibc/uclibc-0.9.28/avr32/uClibc.config b/recipes/uclibc/uclibc-0.9.28/avr32/uClibc.config
> index 478c713..065b961 100644
> --- a/recipes/uclibc/uclibc-0.9.28/avr32/uClibc.config
> +++ b/recipes/uclibc/uclibc-0.9.28/avr32/uClibc.config
> @@ -63,7 +63,7 @@ LDSO_RUNPATH=y
>   UCLIBC_CTOR_DTOR=y
>   # HAS_NO_THREADS is not set
>   UCLIBC_HAS_THREADS=y
> -# PTHREADS_DEBUG_SUPPORT is not set
> +PTHREADS_DEBUG_SUPPORT=y
>   UCLIBC_HAS_LFS=y
>   UCLIBC_STATIC_LDCONFIG=y
>   # MALLOC is not set
> diff --git a/recipes/uclibc/uclibc-0.9.28/wrt54/uClibc.config b/recipes/uclibc/uclibc-0.9.28/wrt54/uClibc.config
> index 14779b7..d28b0a1 100644
> --- a/recipes/uclibc/uclibc-0.9.28/wrt54/uClibc.config
> +++ b/recipes/uclibc/uclibc-0.9.28/wrt54/uClibc.config
> @@ -66,7 +66,7 @@ LDSO_RUNPATH=y
>   UCLIBC_CTOR_DTOR=y
>   # HAS_NO_THREADS is not set
>   UCLIBC_HAS_THREADS=y
> -# PTHREADS_DEBUG_SUPPORT is not set
> +PTHREADS_DEBUG_SUPPORT=y
>   UCLIBC_HAS_LFS=y
>   UCLIBC_STATIC_LDCONFIG=y
>   # MALLOC is not set
> diff --git a/recipes/uclibc/uclibc-0.9.29/bfin/uClibc.machine b/recipes/uclibc/uclibc-0.9.29/bfin/uClibc.machine
> index 0c56523..33a294f 100644
> --- a/recipes/uclibc/uclibc-0.9.29/bfin/uClibc.machine
> +++ b/recipes/uclibc/uclibc-0.9.29/bfin/uClibc.machine
> @@ -73,7 +73,7 @@ LDSO_RUNPATH=y
>   UCLIBC_CTOR_DTOR=y
>   # HAS_NO_THREADS is not set
>   UCLIBC_HAS_THREADS=y
> -# PTHREADS_DEBUG_SUPPORT is not set
> +PTHREADS_DEBUG_SUPPORT=y
>   LINUXTHREADS_OLD=y
>   UCLIBC_HAS_LFS=y
>   MALLOC=y
> diff --git a/recipes/uclibc/uclibc-0.9.30.1/bfin/uClibc.machine b/recipes/uclibc/uclibc-0.9.30.1/bfin/uClibc.machine
> index 0c56523..33a294f 100644
> --- a/recipes/uclibc/uclibc-0.9.30.1/bfin/uClibc.machine
> +++ b/recipes/uclibc/uclibc-0.9.30.1/bfin/uClibc.machine
> @@ -73,7 +73,7 @@ LDSO_RUNPATH=y
>   UCLIBC_CTOR_DTOR=y
>   # HAS_NO_THREADS is not set
>   UCLIBC_HAS_THREADS=y
> -# PTHREADS_DEBUG_SUPPORT is not set
> +PTHREADS_DEBUG_SUPPORT=y
>   LINUXTHREADS_OLD=y
>   UCLIBC_HAS_LFS=y
>   MALLOC=y
> diff --git a/recipes/uclibc/uclibc-0.9.30.1/uClibc.distro b/recipes/uclibc/uclibc-0.9.30.1/uClibc.distro
> index 77f6091..31029a3 100644
> --- a/recipes/uclibc/uclibc-0.9.30.1/uClibc.distro
> +++ b/recipes/uclibc/uclibc-0.9.30.1/uClibc.distro
> @@ -17,7 +17,7 @@ UCLIBC_CTOR_DTOR=y
>   LDSO_GNU_HASH_SUPPORT=y
>   # HAS_NO_THREADS is not set
>   UCLIBC_HAS_THREADS=y
> -# PTHREADS_DEBUG_SUPPORT is not set
> +PTHREADS_DEBUG_SUPPORT=y
>   LINUXTHREADS_OLD=y
>   UCLIBC_HAS_LFS=y
>   # MALLOC is not set
> diff --git a/recipes/uclibc/uclibc-0.9.30/bfin/uClibc.machine b/recipes/uclibc/uclibc-0.9.30/bfin/uClibc.machine
> index 0c56523..33a294f 100644
> --- a/recipes/uclibc/uclibc-0.9.30/bfin/uClibc.machine
> +++ b/recipes/uclibc/uclibc-0.9.30/bfin/uClibc.machine
> @@ -73,7 +73,7 @@ LDSO_RUNPATH=y
>   UCLIBC_CTOR_DTOR=y
>   # HAS_NO_THREADS is not set
>   UCLIBC_HAS_THREADS=y
> -# PTHREADS_DEBUG_SUPPORT is not set
> +PTHREADS_DEBUG_SUPPORT=y
>   LINUXTHREADS_OLD=y
>   UCLIBC_HAS_LFS=y
>   MALLOC=y
> diff --git a/recipes/uclibc/uclibc-0.9.30/uClibc.distro b/recipes/uclibc/uclibc-0.9.30/uClibc.distro
> index b072b2f..d8eed91 100644
> --- a/recipes/uclibc/uclibc-0.9.30/uClibc.distro
> +++ b/recipes/uclibc/uclibc-0.9.30/uClibc.distro
> @@ -17,7 +17,7 @@ UCLIBC_CTOR_DTOR=y
>   LDSO_GNU_HASH_SUPPORT=y
>   # HAS_NO_THREADS is not set
>   UCLIBC_HAS_THREADS=y
> -# PTHREADS_DEBUG_SUPPORT is not set
> +PTHREADS_DEBUG_SUPPORT=y
>   LINUXTHREADS_OLD=y
>   UCLIBC_HAS_LFS=y
>   # MALLOC is not set
> diff --git a/recipes/uclibc/uclibc-nptl/uClibc.distro b/recipes/uclibc/uclibc-nptl/uClibc.distro
> index 8537080..e52db5c 100644
> --- a/recipes/uclibc/uclibc-nptl/uClibc.distro
> +++ b/recipes/uclibc/uclibc-nptl/uClibc.distro
> @@ -18,7 +18,7 @@ LDSO_GNU_HASH_SUPPORT=y
>   # HAS_NO_THREADS is not set
>   UCLIBC_HAS_THREADS=y
>   UCLIBC_HAS_THREADS_NATIVE=y
> -# PTHREADS_DEBUG_SUPPORT is not set
> +PTHREADS_DEBUG_SUPPORT=y
>   # LINUXTHREADS_OLD is not set
>   UCLIBC_HAS_LFS=y
>   # MALLOC is not set
> diff --git a/recipes/uclibc/uclibc-svn/uClibc.distro b/recipes/uclibc/uclibc-svn/uClibc.distro
> index 2b1406c..2f5e073 100644
> --- a/recipes/uclibc/uclibc-svn/uClibc.distro
> +++ b/recipes/uclibc/uclibc-svn/uClibc.distro
> @@ -17,7 +17,7 @@ UCLIBC_CTOR_DTOR=y
>   LDSO_GNU_HASH_SUPPORT=y
>   # HAS_NO_THREADS is not set
>   UCLIBC_HAS_THREADS=y
> -# PTHREADS_DEBUG_SUPPORT is not set
> +PTHREADS_DEBUG_SUPPORT=y
>   LINUXTHREADS_OLD=y
>   UCLIBC_HAS_LFS=y
>   # MALLOC is not set
> diff --git a/recipes/uclibc/uclibc_0.9.27.bb b/recipes/uclibc/uclibc_0.9.27.bb
> index 1357e58..56575da 100644
> --- a/recipes/uclibc/uclibc_0.9.27.bb
> +++ b/recipes/uclibc/uclibc_0.9.27.bb
> @@ -1,5 +1,5 @@
>   DEFAULT_PREFERENCE = "1"
> -PR = "r12"
> +PR = "r13"
>
>   require uclibc.inc
>
> diff --git a/recipes/uclibc/uclibc_0.9.28.bb b/recipes/uclibc/uclibc_0.9.28.bb
> index 1b0f2e0..adf7a74 100644
> --- a/recipes/uclibc/uclibc_0.9.28.bb
> +++ b/recipes/uclibc/uclibc_0.9.28.bb
> @@ -1,5 +1,5 @@
>   DEFAULT_PREFERENCE = "1"
> -PR = "r17"
> +PR = "r18"
>
>   require uclibc.inc
>
> diff --git a/recipes/uclibc/uclibc_0.9.29.bb b/recipes/uclibc/uclibc_0.9.29.bb
> index aba1830..f6bc689 100644
> --- a/recipes/uclibc/uclibc_0.9.29.bb
> +++ b/recipes/uclibc/uclibc_0.9.29.bb
> @@ -7,7 +7,7 @@
>   # on whether the base patches apply to the selected (SRCDATE) svn release.
>   #
>   UCLIBC_BASE ?= "0.9.29"
> -PR = "r30"
> +PR = "r31"
>
>   require uclibc.inc
>
> diff --git a/recipes/uclibc/uclibc_0.9.30.1.bb b/recipes/uclibc/uclibc_0.9.30.1.bb
> index d159ab3..ab6dcb9 100644
> --- a/recipes/uclibc/uclibc_0.9.30.1.bb
> +++ b/recipes/uclibc/uclibc_0.9.30.1.bb
> @@ -7,7 +7,7 @@
>   # on whether the base patches apply to the selected (SRCDATE) svn release.
>   #
>   UCLIBC_BASE ?= "0.9.30.1"
> -PR = "r1"
> +PR = "r2"
>   DEFAULT_PREFERENCE = "1"
>
>   require uclibc.inc
> diff --git a/recipes/uclibc/uclibc_0.9.30.bb b/recipes/uclibc/uclibc_0.9.30.bb
> index bbe809f..0a374ce 100644
> --- a/recipes/uclibc/uclibc_0.9.30.bb
> +++ b/recipes/uclibc/uclibc_0.9.30.bb
> @@ -7,7 +7,7 @@
>   # on whether the base patches apply to the selected (SRCDATE) svn release.
>   #
>   UCLIBC_BASE ?= "0.9.30"
> -PR = "r6"
> +PR = "r7"
>   DEFAULT_PREFERENCE = "1"
>
>   require uclibc.inc
> diff --git a/recipes/uclibc/uclibc_svn.bb b/recipes/uclibc/uclibc_svn.bb
> index 654cb6e..127cea7 100644
> --- a/recipes/uclibc/uclibc_svn.bb
> +++ b/recipes/uclibc/uclibc_svn.bb
> @@ -8,7 +8,7 @@
>   #
>   UCLIBC_BASE ?= "0.9.30"
>   PV = "${UCLIBC_BASE}+svnr${SRCREV}"
> -PR = "r0"
> +PR = "r1"
>   #DEFAULT_PREFERENCE = "2"
>   #DEFAULT_PREFERENCE is 0 (empty), releases have a preference of 1 so take
>   # precedence.
>




