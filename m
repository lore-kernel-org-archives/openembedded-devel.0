Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PpqUy-0003oZ-TO
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 00:09:29 +0100
Received: by yie16 with SMTP id 16so839818yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 15:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=xmt4rf51NM3t4SY9FDrR/jLgbRQitRfIY+WtVsPSy1Q=;
	b=m84T5EivnMydAB47BdXIcEQi6PRckDJT9RfjffvH9FSAyhPwN/PyazJC3MoZogR2vO
	q6IcJenlqHTCTEGy35VUHfQSYBhrNwNJviSX33hq3kC3oDO/7RNN4vH2gg7oAofGIe9m
	Q4pBgJvIsfYULSaxxVCed++FmSNb14/bGMIrw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=C1eHjLnzghmFgO2nsasDeJjqxduDYCoMgAhIEJPX+7jkFxP+b+RPMeJLbQCHPUBNr3
	z79CFWqw4djZLkZL7xKLiYvWUd8TnU/C/hQbuZK3fjQAEJ12dNsj209+EL1BXNLvI+Rg
	ZFkLWtGHpwkLonTZU4F530vpPSOQyTdo4SB/M=
Received: by 10.151.155.4 with SMTP id h4mr1454170ybo.347.1297897695302;
	Wed, 16 Feb 2011 15:08:15 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id v8sm176144ybe.13.2011.02.16.15.08.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Feb 2011 15:08:14 -0800 (PST)
Date: Wed, 16 Feb 2011 15:08:17 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110216230817.GS14525@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio@ossystems.com.br>
References: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
	<1297855134-19216-7-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1297855134-19216-7-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH 07/13] libinih: add
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
X-List-Received-Date: Wed, 16 Feb 2011 23:09:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (16/02/11 11:18), Otavio Salvador wrote:
> This provides a C and C++ INI library that can be statically linked
> into projects.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  recipes/libinih/libinih_git.bb |   14 ++++++++++++++
>  1 files changed, 14 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/libinih/libinih_git.bb
> 
> diff --git a/recipes/libinih/libinih_git.bb b/recipes/libinih/libinih_git.bb
> new file mode 100644
> index 0000000..e9f811f
> --- /dev/null
> +++ b/recipes/libinih/libinih_git.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "C and C++ INI Library"
> +PRIORITY = "optional"
> +PV = "0.0+gitr${SRCPV}"
> +PKGV = "${GITPKGVTAG}"
> +PR = "r0"
> +LICENSE = "BSD"
> +RDEPENDS_${PN}-dev = ""
> +
> +SRCREV = "${AUTOREV}"
> +SRC_URI = "git://projetos.ossystems.com.br/git/libinih.git;protocol=git"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit gitpkgv cmake
> -- 
> 1.7.2.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


