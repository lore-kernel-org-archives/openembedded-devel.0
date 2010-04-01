Received: from mail-yw0-f197.google.com ([209.85.211.197])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NxRox-0000Cg-MK
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 23:21:03 +0200
Received: by ywh35 with SMTP id 35so968012ywh.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Apr 2010 14:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=wBu08CP/esGKjqpWSgTMY2iaNhiuN48Cy/iGIjMwfFU=;
	b=A3FPizsNjZd4qcK/5Nr0rGXTGqsSUEblLOk0xhnCXxP2ZGoZKoat4U5/u6oUY9z/Ac
	Sck4z2Ial7N8EsmycXK2S1ZIPSXV4DMgASPkroihcBzy/5p1Ap8fFCMih+Z2of+kPbc/
	dJBft0NZClGhU29jDEjGlzydrpwOs5/2dvb7k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=gcIBHRR7ggOuXmTcj0+eZWV38bn5eFetvVe3J0ydUthRj8iIPI+nHR92O7hFY5Pw32
	Q5Ow5qVG+yssW4w8mZU7E+aVMso5IuBR3ekoY6LAR11RtXXSFmaP5GupMfhTtwXKSZ5g
	xC3ZIanzqa5fyvwMWNlQQR2SlnYzPxZxM4Yo4=
Received: by 10.151.59.15 with SMTP id m15mr1986528ybk.246.1270156646927;
	Thu, 01 Apr 2010 14:17:26 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 6sm2247061ywd.8.2010.04.01.14.17.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 01 Apr 2010 14:17:26 -0700 (PDT)
Date: Thu, 1 Apr 2010 14:18:18 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100401211818.GA5580@gmail.com>
References: <1270152215-17642-1-git-send-email-khimov@altell.ru>
	<1270152215-17642-2-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <1270152215-17642-2-git-send-email-khimov@altell.ru>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.211.197
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] sarg: new recipe
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
X-List-Received-Date: Thu, 01 Apr 2010 21:21:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (02/04/10 00:03), Roman I Khimov wrote:
> Squid Analysis Report Generator is a tool that allow you to
> view "where" your users are going to on the Internet.
> Sarg provides many informations about Squid users
> activities: times, bytes, sites, etc...
> 
> Signed-off-by: Roman I Khimov <khimov@altell.ru>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  recipes/sarg/files/sarg.conf |  637 ++++++++++++++++++++++++++++++++++++++++++
>  recipes/sarg/sarg_2.2.7.1.bb |   22 ++
>  2 files changed, 659 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/sarg/files/sarg.conf
>  create mode 100644 recipes/sarg/sarg_2.2.7.1.bb
> 
<snip>
> diff --git a/recipes/sarg/sarg_2.2.7.1.bb b/recipes/sarg/sarg_2.2.7.1.bb
> new file mode 100644
> index 0000000..77d6a72
> --- /dev/null
> +++ b/recipes/sarg/sarg_2.2.7.1.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION = "Squid Analysis Report Generator"
> +SECTION = "network"

may be it should be in 'web' section ?

> +DEPENDS = "gd-ft"
> +RDEPENDS = "squid"

may be squid should be a RSUGGESTS ?
> +LICENSE = "GPL"
> +HOMEPAGE = "http://sarg.sourceforge.net/sarg.php"
> +PR = "r0"
> +
> +SRC_URI = " \
> +	${SOURCEFORGE_MIRROR}/sarg/sarg-${PV}.tar.gz;name=tar \
> +	file://sarg.conf \
> +	"
> +SRC_URI[tar.md5sum] = "0ce83323978e715ce70a6d2ab4f0daa4"
> +SRC_URI[tar.sha256sum] = "209398e7690876ef9df04ba7f0b4b47c91ea8cdcfd7a54d78f15b5548a2dd32e"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE = "-DSYSCONFDIR:STRING=${sysconfdir}/squid"
> +
> +do_install_append() {
> +    install -m 0644 ${WORKDIR}/sarg.conf ${D}${sysconfdir}/squid/sarg.conf
> +}
> -- 
> 1.6.4.2
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


