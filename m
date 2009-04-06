Received: from [74.125.44.158] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LquXu-0000kC-8q
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Apr 2009 21:31:52 +0200
Received: by yx-out-1718.google.com with SMTP id 3so1595661yxi.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Apr 2009 12:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=79Csxpy2HOwcGejPT5MQ5Kt3BljtrstJ5x93tBfJ8ek=;
	b=rIu9iYOEAo2ckzhDiwYBZ+F0Wgm9nbQzPDvNsROtWc0+98nqeUZPJmWXJrbptPv2Ph
	cGhttg/IjSDjQuPtbW4m31mt2R2RsuVWFPy4y0IkVWd1QMm9qpgcY1xjDqjknp0LtAaA
	51aVX6FA9EgAbYuOhbBqv+jaBdeTWRp2RQbOM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=oC07hCEdmM5wrg0TuvvRBBRd4+r8Qxv34502a8xpLFFtJzY4y0pkRy95tR3KpU37Hu
	ay31wHCQ1pZZNfZoqfJMKR4p8rLmz3G4ZDZdl0n3T2oBi/l8WkczH+QliUchpZkO/Psz
	JZkBblgf3WzUTdudVLA6BQMNQHN2j3wWyDvJU=
MIME-Version: 1.0
Received: by 10.101.71.3 with SMTP id y3mr9000099ank.62.1239046137982; Mon, 06 
	Apr 2009 12:28:57 -0700 (PDT)
In-Reply-To: <20090403221721.GI30840@smtp.west.cox.net>
References: <20090403221352.GH30840@smtp.west.cox.net>
	<20090403221721.GI30840@smtp.west.cox.net>
Date: Mon, 6 Apr 2009 12:28:57 -0700
Message-ID: <19c1b8a90904061228q473ea2fey5d69a056c254ba87@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.44.158
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_20,RDNS_NONE,SPF_PASS
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] binutils-cross-sdk: Make relative, not absolute 	symlinks for 'as', etc, bump PR
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
X-List-Received-Date: Mon, 06 Apr 2009 19:31:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

looks good.

On 4/3/09, Tom Rini <trini@kernel.crashing.org> wrote:
> binutils-cross-sdk: Make relative, not absolute symlinks for 'as', etc, bump
> PR
>  While I'm in here, make the cvs recipe use FILESPATHPKG not mung FILESDIR.
>
> ---
>  recipes/binutils/binutils-cross-sdk.inc            |    2 +-
>  recipes/binutils/binutils-cross-sdk_2.14.90.0.6.bb |    1 +
>  recipes/binutils/binutils-cross-sdk_2.14.90.0.7.bb |    1 +
>  recipes/binutils/binutils-cross-sdk_2.15.94.0.1.bb |    2 +-
>  recipes/binutils/binutils-cross-sdk_2.16.91.0.6.bb |    1 +
>  recipes/binutils/binutils-cross-sdk_2.16.91.0.7.bb |    2 +-
>  .../binutils/binutils-cross-sdk_2.17.50.0.12.bb    |    2 +-
>  recipes/binutils/binutils-cross-sdk_2.18.50.0.7.bb |    2 +-
>  recipes/binutils/binutils-cross-sdk_2.18.bb        |    2 +-
>  recipes/binutils/binutils-cross-sdk_2.19.1.bb      |    2 +-
>  recipes/binutils/binutils-cross-sdk_2.19.bb        |    2 +-
>  recipes/binutils/binutils-cross-sdk_cvs.bb         |    4 ++--
>  12 files changed, 13 insertions(+), 10 deletions(-)
>
> diff --git a/recipes/binutils/binutils-cross-sdk.inc
> b/recipes/binutils/binutils-cross-sdk.inc
> index 5da1d4f..6e9cda0 100644
> --- a/recipes/binutils/binutils-cross-sdk.inc
> +++ b/recipes/binutils/binutils-cross-sdk.inc
> @@ -17,7 +17,7 @@ do_install () {
>  	rm ${D}${prefix}/${TARGET_SYS}/bin/.debug -Rf
>  	rm ${D}${prefix}/${TARGET_SYS}/bin/*
>  	for l in ${D}${bindir}/*; do
> -		ln -sf "${bindir}/`basename $l`"
> "${D}${prefix}/${TARGET_SYS}/bin/`basename $l | sed -e
> 's,${TARGET_PREFIX},,'`"
> +		ln -sf "../../${layout_base_bindir}/`basename $l`"
> "${D}${prefix}/${TARGET_SYS}/bin/`basename $l | sed -e
> 's,${TARGET_PREFIX},,'`"
>  	done
>
>          # Install the libiberty header
> diff --git a/recipes/binutils/binutils-cross-sdk_2.14.90.0.6.bb
> b/recipes/binutils/binutils-cross-sdk_2.14.90.0.6.bb
> index f509566..f84a61d 100644
> --- a/recipes/binutils/binutils-cross-sdk_2.14.90.0.6.bb
> +++ b/recipes/binutils/binutils-cross-sdk_2.14.90.0.6.bb
> @@ -1,2 +1,3 @@
>  require binutils_${PV}.bb
>  require binutils-cross-sdk.inc
> +PR = "r1"
> diff --git a/recipes/binutils/binutils-cross-sdk_2.14.90.0.7.bb
> b/recipes/binutils/binutils-cross-sdk_2.14.90.0.7.bb
> index f509566..f84a61d 100644
> --- a/recipes/binutils/binutils-cross-sdk_2.14.90.0.7.bb
> +++ b/recipes/binutils/binutils-cross-sdk_2.14.90.0.7.bb
> @@ -1,2 +1,3 @@
>  require binutils_${PV}.bb
>  require binutils-cross-sdk.inc
> +PR = "r1"
> diff --git a/recipes/binutils/binutils-cross-sdk_2.15.94.0.1.bb
> b/recipes/binutils/binutils-cross-sdk_2.15.94.0.1.bb
> index f84a61d..40e9889 100644
> --- a/recipes/binutils/binutils-cross-sdk_2.15.94.0.1.bb
> +++ b/recipes/binutils/binutils-cross-sdk_2.15.94.0.1.bb
> @@ -1,3 +1,3 @@
>  require binutils_${PV}.bb
>  require binutils-cross-sdk.inc
> -PR = "r1"
> +PR = "r2"
> diff --git a/recipes/binutils/binutils-cross-sdk_2.16.91.0.6.bb
> b/recipes/binutils/binutils-cross-sdk_2.16.91.0.6.bb
> index f509566..f84a61d 100644
> --- a/recipes/binutils/binutils-cross-sdk_2.16.91.0.6.bb
> +++ b/recipes/binutils/binutils-cross-sdk_2.16.91.0.6.bb
> @@ -1,2 +1,3 @@
>  require binutils_${PV}.bb
>  require binutils-cross-sdk.inc
> +PR = "r1"
> diff --git a/recipes/binutils/binutils-cross-sdk_2.16.91.0.7.bb
> b/recipes/binutils/binutils-cross-sdk_2.16.91.0.7.bb
> index 574265c..cde4e42 100644
> --- a/recipes/binutils/binutils-cross-sdk_2.16.91.0.7.bb
> +++ b/recipes/binutils/binutils-cross-sdk_2.16.91.0.7.bb
> @@ -1,3 +1,3 @@
>  require binutils_${PV}.bb
>  require binutils-cross-sdk.inc
> -PR = "r4"
> +PR = "r5"
> diff --git a/recipes/binutils/binutils-cross-sdk_2.17.50.0.12.bb
> b/recipes/binutils/binutils-cross-sdk_2.17.50.0.12.bb
> index 574265c..cde4e42 100644
> --- a/recipes/binutils/binutils-cross-sdk_2.17.50.0.12.bb
> +++ b/recipes/binutils/binutils-cross-sdk_2.17.50.0.12.bb
> @@ -1,3 +1,3 @@
>  require binutils_${PV}.bb
>  require binutils-cross-sdk.inc
> -PR = "r4"
> +PR = "r5"
> diff --git a/recipes/binutils/binutils-cross-sdk_2.18.50.0.7.bb
> b/recipes/binutils/binutils-cross-sdk_2.18.50.0.7.bb
> index 574265c..cde4e42 100644
> --- a/recipes/binutils/binutils-cross-sdk_2.18.50.0.7.bb
> +++ b/recipes/binutils/binutils-cross-sdk_2.18.50.0.7.bb
> @@ -1,3 +1,3 @@
>  require binutils_${PV}.bb
>  require binutils-cross-sdk.inc
> -PR = "r4"
> +PR = "r5"
> diff --git a/recipes/binutils/binutils-cross-sdk_2.18.bb
> b/recipes/binutils/binutils-cross-sdk_2.18.bb
> index 574265c..cde4e42 100644
> --- a/recipes/binutils/binutils-cross-sdk_2.18.bb
> +++ b/recipes/binutils/binutils-cross-sdk_2.18.bb
> @@ -1,3 +1,3 @@
>  require binutils_${PV}.bb
>  require binutils-cross-sdk.inc
> -PR = "r4"
> +PR = "r5"
> diff --git a/recipes/binutils/binutils-cross-sdk_2.19.1.bb
> b/recipes/binutils/binutils-cross-sdk_2.19.1.bb
> index 76dff54..f84a61d 100644
> --- a/recipes/binutils/binutils-cross-sdk_2.19.1.bb
> +++ b/recipes/binutils/binutils-cross-sdk_2.19.1.bb
> @@ -1,3 +1,3 @@
>  require binutils_${PV}.bb
>  require binutils-cross-sdk.inc
> -PR = "r0"
> +PR = "r1"
> diff --git a/recipes/binutils/binutils-cross-sdk_2.19.bb
> b/recipes/binutils/binutils-cross-sdk_2.19.bb
> index 76dff54..f84a61d 100644
> --- a/recipes/binutils/binutils-cross-sdk_2.19.bb
> +++ b/recipes/binutils/binutils-cross-sdk_2.19.bb
> @@ -1,3 +1,3 @@
>  require binutils_${PV}.bb
>  require binutils-cross-sdk.inc
> -PR = "r0"
> +PR = "r1"
> diff --git a/recipes/binutils/binutils-cross-sdk_cvs.bb
> b/recipes/binutils/binutils-cross-sdk_cvs.bb
> index 6886255..94d2704 100644
> --- a/recipes/binutils/binutils-cross-sdk_cvs.bb
> +++ b/recipes/binutils/binutils-cross-sdk_cvs.bb
> @@ -1,4 +1,4 @@
>  require binutils_cvs.bb
>  require binutils-cross-sdk.inc
> -PR = "r4"
> -FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/binutils-cvs"
> +PR = "r5"
> +FILESPATHPKG .= ":binutils-cvs"
> --
> 1.6.0.4
>
> --
> Tom Rini
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


