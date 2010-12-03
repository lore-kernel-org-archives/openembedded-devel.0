Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1POW63-0000ks-3Q
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Dec 2010 14:54:48 +0100
Received: by bwz10 with SMTP id 10so8148786bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Dec 2010 05:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=KYlhJtFwt8SUl+9/jQSgHaqeEfySZEoBErnT2p60ZYQ=;
	b=GFWQ41VJLf/HRcxC7f7aUK8EgQRgXeTRislzluI0tqm1hrYGnK47hY3JHMK46DNbbz
	vko+87cYRB33Wdfx+g7KiEqmZNzCSkuKzQI9vyqBuenvOuoYOL0IKoEvJvl9iFQaq14D
	VqbfJOVmY1KYIXYi+o/2lL0bTpaXjQ3GhShHA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ceuo8InkwZhE8UEhXpbxKBXFIpBIag4o4yZLzA8zmCbbttSDqta3hu5cP/Q/UCcA/b
	oZoxHK4cSuXA0RmPQJnICJpvfDf+jmfvQ7EVebF/hJDso9Xu7ph68S3yhNKtMcuGLUG1
	WQX8gqz5i3xzwZGZa/VhChOq0vkA+b7UoQ6JA=
Received: by 10.204.68.76 with SMTP id u12mr2385014bki.6.1291384405093;
	Fri, 03 Dec 2010 05:53:25 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id d27sm904325bkw.2.2010.12.03.05.53.24
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 03 Dec 2010 05:53:24 -0800 (PST)
Date: Fri, 3 Dec 2010 14:53:24 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101203135324.GC3403@jama>
References: <1291383895.3669.11.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1291383895.3669.11.camel@mattotaupa>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] eina: Remove `gnu_source.patch` which was applied upstream.
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
X-List-Received-Date: Fri, 03 Dec 2010 13:54:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 03, 2010 at 02:44:55PM +0100, Paul Menzel wrote:
> Date: Fri, 3 Dec 2010 14:01:20 +0100
> 
> Something similar to this patch was applied upstream r53157 [1] which closes upstream ticket 537 [2].
> 
> 	$ git grep EFL_SRCREV
> 	classes/e-base.bbclass:EFL_SRCREV ?= "55157"
> 
> This change is build tested with the following configurations.
> 
> 	Build Configuration:
> 	BB_VERSION        = "1.10.0"
> 	METADATA_BRANCH   = "org.openembedded.dev"
> 	METADATA_REVISION = "842f05d"
> 	TARGET_ARCH       = "arm"
> 	TARGET_OS         = "linux-gnueabi"
> 	MACHINE           = "beagleboard"
> 	DISTRO            = "minimal"
> 	DISTRO_VERSION    = "dev-snapshot-20101203"
> 	TARGET_FPU        = "hard"
> 
> 	Build Configuration:
> 	BB_VERSION        = "1.10.0"
> 	METADATA_BRANCH   = "org.openembedded.dev"
> 	METADATA_REVISION = "842f05d"
> 	TARGET_ARCH       = "arm"
> 	TARGET_OS         = "linux-uclibceabi"
> 	MACHINE           = "beagleboard"
> 	DISTRO            = "minimal-uclibc"
> 	DISTRO_VERSION    = "dev-snapshot-20101203"
> 	TARGET_FPU        = "hard"
> 
> [1] http://trac.enlightenment.org/e/changeset/53157
> [2] https://trac.enlightenment.org/e/ticket/537
> 
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>

Thanks for spotting this!

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> CC: Henning Heinold <heinold@inf.fu-berlin.de>
> ---
>  recipes/efl1/eina/gnu_source.patch |   12 ------------
>  recipes/efl1/eina_svn.bb           |    2 --
>  2 files changed, 0 insertions(+), 14 deletions(-)
>  delete mode 100644 recipes/efl1/eina/gnu_source.patch
> 
> diff --git a/recipes/efl1/eina/gnu_source.patch b/recipes/efl1/eina/gnu_source.patch
> deleted file mode 100644
> index 8af08eb..0000000
> --- a/recipes/efl1/eina/gnu_source.patch
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -Index: eina/configure.ac
> -===================================================================
> ---- eina.orig/configure.ac	2009-11-26 15:58:28.784112802 +0100
> -+++ eina/configure.ac	2009-11-26 15:59:34.524939842 +0100
> -@@ -273,6 +273,7 @@
> - AC_C_INLINE
> - AC_C___ATTRIBUTE__
> - AC_PROG_CC_STDC
> -+AC_GNU_SOURCE
> - 
> - EINA_CPPFLAGS=""
> - case "$host_os" in
> diff --git a/recipes/efl1/eina_svn.bb b/recipes/efl1/eina_svn.bb
> index 34e1aa8..406db18 100644
> --- a/recipes/efl1/eina_svn.bb
> +++ b/recipes/efl1/eina_svn.bb
> @@ -6,8 +6,6 @@ SRCREV = "${EFL_SRCREV}"
>  
>  inherit efl
>  
> -SRC_URI += "file://gnu_source.patch"
> -
>  # Some upgrade path tweaking
>  AUTO_LIBNAME_PKGS = ""
>  
> -- 
> 1.7.2.3



> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


