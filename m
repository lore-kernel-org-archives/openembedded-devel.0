Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q25ML-0001i0-HH
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 18:27:10 +0100
Received: by yia13 with SMTP id 13so2974222yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 10:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=l7wlBshEHFUhzqXao7j1xbSN13Q5y9vm+t6zCemIEsw=;
	b=q/WdJkhim3PFURugB5NKyn7zk5xGd83zTCseytGxfVhur1Djra5MHf5zyfcOWiQqKY
	wfcMi4zYpSo343rLiqW/QTAwCh6KYrVWMz/LKKHaPfQHo/UlCQU7iCOGLGf0eQHRFdi3
	SOsyDps1nv279yFnz7JCfqckQZwVKDeodTWjk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=KAuvHKLJV/QEs7dN+lRuYQ4g3e7y/KZr5ks043xQoPW4kWlmX/fGO+3xZ/3dbA6Mtc
	t5Z9j9Hendz+fXzhvS1HSNxEQi5j5Pj4Argdazll54ceoo1S8eCzTtTgDZS+xXq0sY32
	8IG4DEuMeRvKMpLGhk9LRVdfu43mdnvyBfSJc=
Received: by 10.43.66.74 with SMTP id xp10mr4490475icb.150.1300814395641;
	Tue, 22 Mar 2011 10:19:55 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id uf10sm4735698icb.5.2011.03.22.10.19.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Mar 2011 10:19:47 -0700 (PDT)
Date: Tue, 22 Mar 2011 10:19:54 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110322171954.GA22283@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1300780910-28866-1-git-send-email-heinold@inf.fu-berlin.de>
	<1300780910-28866-3-git-send-email-heinold@inf.fu-berlin.de>
MIME-Version: 1.0
In-Reply-To: <1300780910-28866-3-git-send-email-heinold@inf.fu-berlin.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 2/3] cairo.inc: let arm, mips and ppc depend on libatomic-ops
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
X-List-Received-Date: Tue, 22 Mar 2011 17:27:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (22/03/11 09:01), heinold@inf.fu-berlin.de wrote:
> From: Henning Heinold <heinold@inf.fu-berlin.de>
> 
> 
> Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
> ---
>  recipes/cairo/cairo.inc |    9 ++++++++-
>  1 files changed, 8 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/cairo/cairo.inc b/recipes/cairo/cairo.inc
> index c60d7d9..fad50b3 100644
> --- a/recipes/cairo/cairo.inc
> +++ b/recipes/cairo/cairo.inc
> @@ -1,15 +1,22 @@
>  SECTION = "libs"
>  PRIORITY = "optional"
> -DEPENDS = "virtual/libx11 pixman libsm libpng fontconfig libxrender glib-2.0"
>  DESCRIPTION = "Cairo graphics library"
>  LICENSE = "MPL LGPL"
>  
> +DEPENDS = "virtual/libx11 pixman libsm libpng fontconfig libxrender glib-2.0"
> +
> +DEPENDS_append_arm = " libatomic-ops"
> +DEPENDS_append_mips = " libatomic-ops"
> +DEPENDS_append_mipsel = " libatomic-ops"
> +DEPENDS_append_ppc = " libatomic-ops"
> +

Do we need these deps suppose if one is using gcc 4.5 ?


