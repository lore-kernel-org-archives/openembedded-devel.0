Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Po8gc-0006NC-N5
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Feb 2011 07:10:26 +0100
Received: by iyj8 with SMTP id 8so3096591iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 22:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=P/8IMe0xix21/P6HhBMtIdEd7QyEcK8mqtPIOu9F9t8=;
	b=eT6CPpN8zmF11BKZJtPBqb28Mmvb9e2kXEQNO+WDlmo2pAUZS/KA3fY2ryFZo2VvcN
	TK6v3HW5VsK51puLplg4yE6jLnqY6Ihh8JPpUY2lJnTkyiR9CSL+rN/WVvdLJIY/a3X0
	+93vAU9gFvgQkcyHv5l1FGP0I2y9hcc1VATV8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=YrAi8F0kANMq5a6QXSBoCthQ5PRxX4ILBmrfe8NpI0SugJeE3ULIlYlgdJ3aEzQQiS
	csgCp0DzNfM3Tnsqn6N+IQ1MdO8pxA9zgX1XM3WFuq6N0vHEmpC0j7hvEDv7q9yNm7+Q
	kLwF6SbY19a/fOzfHV2ydqLCcurVscONyr+uA=
Received: by 10.42.218.3 with SMTP id ho3mr1730789icb.437.1297490959154;
	Fri, 11 Feb 2011 22:09:19 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id gy41sm172150ibb.17.2011.02.11.22.09.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Feb 2011 22:09:17 -0800 (PST)
Date: Fri, 11 Feb 2011 22:09:13 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110212060913.GC3321@gmail.com>
References: <1297460941-5797-1-git-send-email-filip.zyzniewski@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1297460941-5797-1-git-send-email-filip.zyzniewski@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] dpkg: add perl modules package
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
X-List-Received-Date: Sat, 12 Feb 2011 06:10:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (11/02/11 22:49), Filip Zyzniewski wrote:
> dpkg contains of perl modules as well, we need to provide these for
> example for update-alternatives.
> 
> Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  recipes/dpkg/dpkg.inc |    6 +++++-
>  1 files changed, 5 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/dpkg/dpkg.inc b/recipes/dpkg/dpkg.inc
> index 133eff3..06c269a 100644
> --- a/recipes/dpkg/dpkg.inc
> +++ b/recipes/dpkg/dpkg.inc
> @@ -10,7 +10,11 @@ S = "${WORKDIR}/dpkg-${PV}"
>  
>  DEPENDS_${PN} += "update-alternatives"
>  
> -RDEPENDS_${PN} += "perl perl-module-base perl-module-carp perl-module-cwd perl-module-english perl-module-exporter perl-module-exporter-heavy perl-module-fcntl perl-module-file-spec-unix perl-module-file-temp perl-module-io perl-module-io-handle perl-module-posix perl-module-strict perl-module-vars perl-module-warnings perl-module-warnings-register perl-module-autoloader perl-module-config perl-module-constant perl-module-errno perl-module-file-basename perl-module-file-path perl-module-file-spec perl-module-overload perl-module-selectsaver perl-module-symbol perl-module-xsloader"
> +RDEPENDS_${PN} += "perl perl-module-base perl-module-carp perl-module-cwd perl-module-english perl-module-exporter perl-module-exporter-heavy perl-module-fcntl perl-module-file-spec-unix perl-module-file-temp perl-module-io perl-module-io-handle perl-module-posix perl-module-strict perl-module-vars perl-module-warnings perl-module-warnings-register perl-module-autoloader perl-module-config perl-module-constant perl-module-errno perl-module-file-basename perl-module-file-path perl-module-file-spec perl-module-overload perl-module-selectsaver perl-module-symbol perl-module-xsloader ${PN}-perl"
> +
> +PACKAGES += "${PN}-perl"
> +
> +FILES_${PN}-perl = "${libdir}"
>  
>  PARALLEL_MAKE = ""
>  
> -- 
> 1.7.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


