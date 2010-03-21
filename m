Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Nt9C2-0003Oc-BI
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Mar 2010 01:39:06 +0100
Received: by gye5 with SMTP id 5so1994234gye.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Mar 2010 17:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=gKEakfXcezj6T53k0qZyw9fegm2EeBNwaNkGYAIU71U=;
	b=HKxNZ05Kwt+p7REpYzZ4ikgSOHMerEH2K1Mfej0LTZB+hDPKlGC61tvFAsvVIyiI1u
	mFMuHni4Db4BiN8YGnd3SQVp7vUcse8zAcutsNInwkIn1MUqwW2pmQ/pshvqEUBE4YbK
	rLs5dEJoIEr8Okam6s6kpRjVEJIXBIsH5TuO8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Zeu+ZOci4X35LsjEMzj77s54nFa0NevMZuwgxsqcPMwCFIfi8YZZwi2zzHlRWNNXME
	EP5YymImvY/YgaQ8+skuu4r2w13nLNq0IgM//f+7tmDnTLfBT9nJ1rW+LoyTVJkKWiH4
	0WGIuiuSS3HHHZByYSckiE1gf80LSTv8QYyCg=
Received: by 10.150.55.25 with SMTP id d25mr3570279yba.330.1269131755222;
	Sat, 20 Mar 2010 17:35:55 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 23sm2726172iwn.10.2010.03.20.17.35.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 20 Mar 2010 17:35:54 -0700 (PDT)
Date: Sat, 20 Mar 2010 17:35:46 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100321003546.GA4351@gmail.com>
References: <1267725265.28881.9.camel@localhost.localdomain>
	<b6ebd0a51003041142n1e407a7elc8e16bcf57d0d9c5@mail.gmail.com>
	<1267778060.3095.38.camel@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <1267778060.3095.38.camel@localhost.localdomain>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Fix packaged staging for cross packages
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
X-List-Received-Date: Sun, 21 Mar 2010 00:39:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (05/03/10 08:34), Joshua Lock wrote:
> Hi Chris,
> 
> On Thu, 2010-03-04 at 13:42 -0600, Chris Larson wrote:
> > It looks like this does fix the problem, and good job in spotting the
> > problem, but this fix assumes that the basename of CROSS_DIR is
> > BASE_PACKAGE_ARCH.  If that ever changes for whatever reason, it will break.
> >  I'd suggest instead changing it to continue to copy the contents of the
> > dir, but to change the destination to match the destination used in the
> > postamble (${PSTAGE_TMPDIR_STAGE}/cross/${BASE_PACKAGE_ARCH}).
> 
> Thanks for the quick review, I've attached a modified patch to account
> for potential changes in the base name of CROSS_DIR as suggested.
> 
> Regards,
> Joshua
> -- 
> Joshua Lock
>         Intel Open Source Technology Centre

> From f40c45b8cba055d698e22c2b7444bc21c5a47eb8 Mon Sep 17 00:00:00 2001
> From: Joshua Lock <josh@linux.intel.com>
> Date: Fri, 5 Mar 2010 08:23:39 +0000
> Subject: [PATCH] packaged-staging: Fix packagaging of cross packages
> 
> packagedstaging_fastpath() was only copying the contents of CROSS_DIR to
> PSTAGE_TMPDIR resulting in the folders contents being packaged and then
> installed incorrectly at the top level of CROSS_DIR rather than in HOST_ARCH
> specific sub directories.
> 
> This patch fixes that issue by copying the directory and its contents rather
> than just the directory contents.
> 
> Signed-off-by: Joshua Lock <josh@linux.intel.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  classes/packaged-staging.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/classes/packaged-staging.bbclass b/classes/packaged-staging.bbclass
> index 1ede25c..f50ccad 100644
> --- a/classes/packaged-staging.bbclass
> +++ b/classes/packaged-staging.bbclass
> @@ -289,7 +289,7 @@ packagedstaging_fastpath () {
>  		mkdir -p ${PSTAGE_TMPDIR_STAGE}/staging/
>  		mkdir -p ${PSTAGE_TMPDIR_STAGE}/cross/
>  		cp -fpPR ${SYSROOT_DESTDIR}${STAGING_DIR}/* ${PSTAGE_TMPDIR_STAGE}/staging/ || /bin/true
> -		cp -fpPR ${SYSROOT_DESTDIR}${CROSS_DIR}/* ${PSTAGE_TMPDIR_STAGE}/cross/ || /bin/true
> +		cp -fpPR ${SYSROOT_DESTDIR}${CROSS_DIR}/* ${PSTAGE_TMPDIR_STAGE}/cross/${BASE_PACKAGE_ARCH}/ || /bin/true
>  	fi
>  }
>  
> -- 
> 1.6.6.1
> 

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



