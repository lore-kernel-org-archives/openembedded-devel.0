Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Po321-0000Xb-3Z
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Feb 2011 01:08:09 +0100
Received: by gwaa12 with SMTP id a12so1290438gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 16:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=0tl92kN8ru+S7ahETtXCUWwkQcFMuE1ZInObKaU4SDM=;
	b=nyLmiXcur2GSBY4huUid+a7SQG+wjXi7/GvM26EMmcRbYzGl6+QSJFceHjPtHm7k97
	Eu7o0zgPuo6PcGYeNP+2kCfnAGNrqldxcleXTfW0WQVfVYapaUBjykSxTtn+S3mg5qd1
	4VrBMnv3UVGocOQ3xAiBiCWR61Mp7PEsKQQzM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=fuxhzzWhLfDNlsJywTzJOscYnmhkOwr1dY4Wi2LN1FMbrBiFbqiXo30YhasLS8gR2l
	KPWfJ/BfUoRU2v4T7bsJ5iggH4MNfyKnckDPQ++oR5+fI390q3octMy45cpHeH0fpVmk
	PfDLlQO17I+sbRAipDkLGwnhgG1X171xIcdl8=
Received: by 10.151.148.11 with SMTP id a11mr1362464ybo.3.1297469222292;
	Fri, 11 Feb 2011 16:07:02 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id j3sm926319ybe.23.2011.02.11.16.07.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Feb 2011 16:07:01 -0800 (PST)
Date: Fri, 11 Feb 2011 16:06:53 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110212000653.GE1010@gmail.com>
References: <1296512140-16744-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
In-Reply-To: <1296512140-16744-1-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: Re: [PATCH] sourceipk: fix race condition with compileconfigs
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
X-List-Received-Date: Sat, 12 Feb 2011 00:08:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (31/01/11 16:15), Chase Maupin wrote:
> * This patch adds an empty compileconfigs function to the
>   sourceipk class.
> * This is required because when making a sourceipk of a
>   package using the multi-kernel.inc functionality you will
>   have a race condition between the compileconfigs of the
>   multi-kernel file building the kernel and sourceipk trying
>   to copy and patch the sources.  The resulting conditions
>   can then occur:
>     - You will package some interim build files, yielding
>       a sourceipk that is not consistent between builds
>     - You will try to copy interim build files as they are
>       being deleted which will result in an error and break
>       the build.
> * The empty compileconfigs function is overwritten by the
>   real compileconfigs function when the multi-kernel.inc file
>   is used.
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  classes/sourceipk.bbclass |   13 ++++++++++++-
>  1 files changed, 12 insertions(+), 1 deletions(-)
> 
> diff --git a/classes/sourceipk.bbclass b/classes/sourceipk.bbclass
> index 8a92115..1b4a318 100644
> --- a/classes/sourceipk.bbclass
> +++ b/classes/sourceipk.bbclass
> @@ -144,7 +144,18 @@ EXPORT_FUNCTIONS do_create_srcipk
>  
>  do_create_srcipk[deptask] = "do_patch"
>  
> -addtask create_srcipk after do_patch before do_configure
> +# Add a blank compileconfigs task.  This allows the sourceipk to schedule
> +# its copy of the sources for kernels using the multi-kernel functionality
> +# before the compileconfigs task.  Failure to do this results in a race
> +# condition where in the best case the sources packaged may contain binary
> +# builds and in the worst case binary files being cleaned cause an error
> +# in the copy command for the sourceipk.
> +do_compileconfigs() {
> +    :
> +}
> +addtask compileconfigs after do_patch before do_configure
> +
> +addtask create_srcipk after do_patch before do_compileconfigs
>  
>  #Add source packages to list of packages OE knows about
>  PACKAGES_DYNAMIC += "${PN}-src"
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


