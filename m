Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OUupS-0001wS-Bx
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Jul 2010 06:59:52 +0200
Received: by pwi10 with SMTP id 10so1596258pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Jul 2010 21:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=rbV+rSGge/vQfGqLqB6GIuna3BjBXjovUH/gjuaWros=;
	b=QjviJmGcVyJ3vopM661pFg5ylZWA1yjAjX1eTaAMfM+QZAsjZb4a2SP5UMlVeeinpN
	F6ji41Iiqu6Ij4HIYwMsOPyxGsIQAnwVxTjCrsU6zuD1r9MHvJ0mIfpT9oT+WgNDbHtR
	gVZ2m+vEvXR0i5CEVnPhp1waqCSMZgKCZLnYE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=uAGti9R4crb1SRXJl0Szzc8gjV5Y7XBgAXQQC/HjN8rP/PLLnnB+FQCyl9KwA8+laH
	ySLhOUKq78YyTI7tTix1/xddGVcY7D6YQIaW1X2f9JFubsrWqmQ+YeA5BDVFDj0/Enqk
	UVAZ/Pk190X1xveanCWxqtMOJkb3HPuq1pI/8=
Received: by 10.142.207.9 with SMTP id e9mr2177112wfg.328.1278132902783;
	Fri, 02 Jul 2010 21:55:02 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id r27sm1617191rvq.9.2010.07.02.21.55.01
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 02 Jul 2010 21:55:01 -0700 (PDT)
Date: Fri, 2 Jul 2010 21:55:04 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100703045504.GB17627@gmail.com>
References: <1278082654-10070-1-git-send-email-khimov@altell.ru>
	<1278082654-10070-2-git-send-email-khimov@altell.ru>
	<1278082654-10070-3-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <1278082654-10070-3-git-send-email-khimov@altell.ru>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] base-files: profile: don't set TZ if /etc/TZ is present
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
X-List-Received-Date: Sat, 03 Jul 2010 04:59:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (02/07/10 18:57), Roman I Khimov wrote:
> uClibc-based systems can have system-wide TZ in /etc/TZ, thus we shouldn't
> set TZ variable if it is present.
> 
> Signed-off-by: Roman I Khimov <khimov@altell.ru>

Acked-by: Khem Raj <raj.khem@gmail.com>

what all shells did you test it on.

> ---
>  recipes/base-files/base-files/jornada6xx/profile   |    2 +-
>  .../base-files/base-files/omap3-pandora/profile    |    2 +-
>  .../base-files/base-files/oplinux-uclibc/profile   |    2 +-
>  recipes/base-files/base-files/oplinux/profile      |    2 +-
>  recipes/base-files/base-files/profile              |    2 +-
>  recipes/base-files/base-files/shr/profile          |    2 +-
>  recipes/base-files/base-files_3.0.14.bb            |    2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/recipes/base-files/base-files/jornada6xx/profile b/recipes/base-files/base-files/jornada6xx/profile
> index bff0f42..bd9e3e6 100755
> --- a/recipes/base-files/base-files/jornada6xx/profile
> +++ b/recipes/base-files/base-files/jornada6xx/profile
> @@ -9,7 +9,7 @@ if [ "`id -u`" -eq 0 ]; then
>     PATH="$PATH:/sbin:/usr/sbin:/usr/local/sbin"
>  fi
>  
> -if [ ! -e /etc/localtime ]; then
> +if [ ! -e /etc/localtime -a ! -e /etc/TZ ]; then
>  	TZ="UTC"		# Time Zone. Look at http://theory.uwinnipeg.ca/gnu/glibc/libc_303.html
>  				# for an explanation of how to set this to your local timezone.
>  	export TZ
> diff --git a/recipes/base-files/base-files/omap3-pandora/profile b/recipes/base-files/base-files/omap3-pandora/profile
> index 5797535..99b6fce 100644
> --- a/recipes/base-files/base-files/omap3-pandora/profile
> +++ b/recipes/base-files/base-files/omap3-pandora/profile
> @@ -5,7 +5,7 @@ PATH="/usr/local/bin:/usr/bin:/bin"
>  EDITOR="/bin/vi"			# needed for packages like cron
>  test -z "$TERM" && TERM="vt100"	# Basic terminal capab. For screen etc.
>  
> -if [ ! -e /etc/localtime ]; then
> +if [ ! -e /etc/localtime -a ! -e /etc/TZ ]; then
>  	TZ="UTC"		# Time Zone. Look at http://theory.uwinnipeg.ca/gnu/glibc/libc_303.html 
>  				# for an explanation of how to set this to your local timezone.
>  	export TZ
> diff --git a/recipes/base-files/base-files/oplinux-uclibc/profile b/recipes/base-files/base-files/oplinux-uclibc/profile
> index f6ae329..5ad2967 100644
> --- a/recipes/base-files/base-files/oplinux-uclibc/profile
> +++ b/recipes/base-files/base-files/oplinux-uclibc/profile
> @@ -5,7 +5,7 @@ PATH="/usr/local/bin:/usr/bin:/bin"
>  EDITOR="/usr/bin/nano"	# needed for packages like cron
>  TERM="linux"		# Basic terminal capab. For screen etc.
>  
> -if [ ! -e /etc/localtime ]; then
> +if [ ! -e /etc/localtime -a ! -e /etc/TZ ]; then
>  	TZ="UTC"		# Time Zone. Look at http://theory.uwinnipeg.ca/gnu/glibc/libc_303.html 
>  				# for an explanation of how to set this to your local timezone.
>  	export TZ
> diff --git a/recipes/base-files/base-files/oplinux/profile b/recipes/base-files/base-files/oplinux/profile
> index f6ae329..5ad2967 100644
> --- a/recipes/base-files/base-files/oplinux/profile
> +++ b/recipes/base-files/base-files/oplinux/profile
> @@ -5,7 +5,7 @@ PATH="/usr/local/bin:/usr/bin:/bin"
>  EDITOR="/usr/bin/nano"	# needed for packages like cron
>  TERM="linux"		# Basic terminal capab. For screen etc.
>  
> -if [ ! -e /etc/localtime ]; then
> +if [ ! -e /etc/localtime -a ! -e /etc/TZ ]; then
>  	TZ="UTC"		# Time Zone. Look at http://theory.uwinnipeg.ca/gnu/glibc/libc_303.html 
>  				# for an explanation of how to set this to your local timezone.
>  	export TZ
> diff --git a/recipes/base-files/base-files/profile b/recipes/base-files/base-files/profile
> index b5ce69d..8f7f6b5 100644
> --- a/recipes/base-files/base-files/profile
> +++ b/recipes/base-files/base-files/profile
> @@ -5,7 +5,7 @@ PATH="/usr/local/bin:/usr/bin:/bin"
>  EDITOR="/bin/vi"			# needed for packages like cron
>  test -z "$TERM" && TERM="vt100"	# Basic terminal capab. For screen etc.
>  
> -if [ ! -e /etc/localtime ]; then
> +if [ ! -e /etc/localtime -a ! -e /etc/TZ ]; then
>  	TZ="UTC"		# Time Zone. Look at http://theory.uwinnipeg.ca/gnu/glibc/libc_303.html 
>  				# for an explanation of how to set this to your local timezone.
>  	export TZ
> diff --git a/recipes/base-files/base-files/shr/profile b/recipes/base-files/base-files/shr/profile
> index 05e8490..6e11e81 100644
> --- a/recipes/base-files/base-files/shr/profile
> +++ b/recipes/base-files/base-files/shr/profile
> @@ -5,7 +5,7 @@ PATH="/usr/local/bin:/usr/bin:/bin"
>  EDITOR="/bin/vi"			# needed for packages like cron
>  test -z "$TERM" && TERM="vt100"	# Basic terminal capab. For screen etc.
>  
> -if [ ! -e /etc/localtime ]; then
> +if [ ! -e /etc/localtime -a ! -e /etc/TZ ]; then
>  	TZ="UTC"		# Time Zone. Look at http://theory.uwinnipeg.ca/gnu/glibc/libc_303.html 
>  				# for an explanation of how to set this to your local timezone.
>  	export TZ
> diff --git a/recipes/base-files/base-files_3.0.14.bb b/recipes/base-files/base-files_3.0.14.bb
> index 9801f8a..02bd39b 100644
> --- a/recipes/base-files/base-files_3.0.14.bb
> +++ b/recipes/base-files/base-files_3.0.14.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "Miscellaneous files for the base system."
>  SECTION = "base"
>  PRIORITY = "required"
> -PR = "r94"
> +PR = "r95"
>  LICENSE = "GPL"
>  
>  SRC_URI = " \
> -- 
> 1.5.6.5
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


