Received: from [209.85.198.250] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LytlY-0005LI-9V
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Apr 2009 22:18:56 +0200
Received: by rv-out-0708.google.com with SMTP id f25so533460rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2009 13:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=4/UEoq3MAbut0kq68OKXGOLBkJtjg27+rb4jMCAkDJU=;
	b=eJHiKfUydfdnO5oCdNuBAJECAjplTdwlza6lt5RCNxmEJFmz0LI2ZHlgWEyiT59oxq
	M9mbtqfmRFTKVLkZ07ncgvcEs/3/6i/SD/P+qD7kvYj9HTsLzxrsIsPpGpsfRLvcL8Fe
	2p/RoDf5Hsb/PkcvV9XpUM59bj4+6GJJDPniA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=AGWuNtjzrZTUGKYni2xonZyQHWgSgla07uoB7nLqbx+uG5GzJ+wian1r/UQFTsIWJC
	+YewZIs4DXFDhpuocJux1AYJLzFTCEIb6kegRP3CiZyqmsEKHjjyZ0Wi3v+g7n4Jbwmp
	AtGnd3lQFoG+7nglGs7F8G7c0WLfgf7N3vdWs=
Received: by 10.114.211.1 with SMTP id j1mr3660784wag.176.1240949624844;
	Tue, 28 Apr 2009 13:13:44 -0700 (PDT)
Received: from gmail.com (adsl-71-146-25-44.dsl.pltn13.sbcglobal.net
	[71.146.25.44])
	by mx.google.com with ESMTPS id n9sm216038wag.34.2009.04.28.13.13.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 28 Apr 2009 13:13:43 -0700 (PDT)
Date: Tue, 28 Apr 2009 13:13:40 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090428201340.GD26082@gmail.com>
References: <1240589520-1104-1-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-2-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-3-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-4-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-5-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-6-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-7-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-8-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-9-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-10-git-send-email-trini@kernel.crashing.org>
MIME-Version: 1.0
In-Reply-To: <1240589520-1104-10-git-send-email-trini@kernel.crashing.org>
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Subject: Re: [PATCH][STABLE] canadian-sdk: We DO want DEPENDS_prepend	to always bring in host virtual gcc/binutils
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
X-List-Received-Date: Tue, 28 Apr 2009 20:18:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (24/04/09 09:11), Tom Rini wrote:
> From: Tom Rini <trini@embeddedalley.com>
> 
> 
> Signed-off-by: Tom Rini <trini@embeddedalley.com>

Acked-by: Khem Raj <raj.khem@gmail.com>


> ---
>  classes/canadian-sdk.bbclass                   |    6 +-----
>  recipes/binutils/binutils-canadian-sdk_2.18.bb |    6 +-----
>  recipes/make/mingw-make-canadian-sdk_3.81.bb   |    2 --
>  3 files changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/classes/canadian-sdk.bbclass b/classes/canadian-sdk.bbclass
> index 6b4fdf8..a6c5552 100644
> --- a/classes/canadian-sdk.bbclass
> +++ b/classes/canadian-sdk.bbclass
> @@ -19,11 +19,7 @@ CFLAGS = "${SDK_CFLAGS}"
>  CXXFLAGS = "${SDK_CFLAGS}"
>  LDFLAGS = "${SDK_LDFLAGS}"
>  
> -# TODO: add logic to add the following unless PN ~= gcc*
> -#DEPENDS_prepend = "virtual/${HOST_PREFIX}binutils virtual/${HOST_PREFIX}gcc "
> -# and otherwise just
> -DEPENDS_prepend = "virtual/${HOST_PREFIX}binutils "
> -
> +DEPENDS_prepend = "virtual/${HOST_PREFIX}binutils virtual/${HOST_PREFIX}gcc "
>  
>  # On mingw systems we want to have the real sysroot default to c:/... and
>  # assume that the default install will be on the C drive.  This can be changed
> diff --git a/recipes/binutils/binutils-canadian-sdk_2.18.bb b/recipes/binutils/binutils-canadian-sdk_2.18.bb
> index e44e7b7..96726f8 100644
> --- a/recipes/binutils/binutils-canadian-sdk_2.18.bb
> +++ b/recipes/binutils/binutils-canadian-sdk_2.18.bb
> @@ -2,11 +2,7 @@ SECTION = "devel"
>  require binutils_${PV}.bb
>  inherit canadian-sdk
>  
> -DEPENDS="\
> -	virtual/${HOST_PREFIX}binutils \
> -	virtual/${HOST_PREFIX}gcc \
> -	flex-native bison-native \
> -"
> +DEPENDS = "flex-native bison-native"
>  
>  FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/binutils-${PV}"
>  # On MinGW hosts we want to prepend a drive letter, in ${SDK_REALPATH_MINGW}
> diff --git a/recipes/make/mingw-make-canadian-sdk_3.81.bb b/recipes/make/mingw-make-canadian-sdk_3.81.bb
> index 3479dad..a4b1f72 100644
> --- a/recipes/make/mingw-make-canadian-sdk_3.81.bb
> +++ b/recipes/make/mingw-make-canadian-sdk_3.81.bb
> @@ -9,8 +9,6 @@ interdependent files, and, if necessary, issues commands \
>  to bring them up-to-date - MinGW port."
>  HOMEPAGE = "http://www.mingw.org/"
>  
> -DEPENDS = "virtual/${HOST_PREFIX}binutils virtual/${HOST_PREFIX}gcc"
> -
>  SRC_URI = "${SOURCEFORGE_MIRROR}/mingw/mingw32-make-3.81-20080326-src.tar.gz"
>  
>  S = "${WORKDIR}/make-${PV}-patched"
> -- 
> 1.5.6.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


