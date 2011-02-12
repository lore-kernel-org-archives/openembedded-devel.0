Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Po3Wc-0001A7-FB
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Feb 2011 01:39:46 +0100
Received: by yxd5 with SMTP id 5so1299093yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 16:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=5E9+dtBEMtMNGcSXIoutWA92p4ZW4WlL7UOIrRxn2rw=;
	b=K/4BLOTQ6eaDH7FWT8VCgvjqqVsazPjKgN0QGniV4FmUiFt1VgAiSqbnpb+Z87BYPy
	jEBo+Gqxb7RB9D+hV+OGzgd+MVccXjaWTcoHryJkZxdSGwoIQp1bpYkziyMu0quleiAL
	zufXlmee2eQjgmE53jwN3AOljETqWvnlVsCJs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Y91EVgV0psKCj6saGdx9QDjFAU5TXm7fVU+ipUW4x5FU0n1F1DhO/l2qoN9ugYhVIE
	ywM1o7Wp2snVWYx7xzeID1DZRbEwkSWhkqJKveq7vC5c07OjnpJxFWW6aL4YDgZwPWXO
	YmOzXNNC4T+YWGMmFw+X3gSsnAUG1udstSCR4=
Received: by 10.151.116.4 with SMTP id t4mr1321450ybm.355.1297471119582;
	Fri, 11 Feb 2011 16:38:39 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id q31sm943226yba.6.2011.02.11.16.38.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Feb 2011 16:38:38 -0800 (PST)
Date: Fri, 11 Feb 2011 16:38:30 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110212003830.GJ1010@gmail.com>
References: <1296716421-19240-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1296716421-19240-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] insane.bbclass: fix the check for bad RPATH
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
X-List-Received-Date: Sat, 12 Feb 2011 00:39:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (03/02/11 02:00), Denys Dmytriyenko wrote:
> * Variable 'sane' is boolean, so adding to it breaks the error condition
> * Fixes previous commit 6aa31074 ported from Yocto
> 
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  classes/insane.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/classes/insane.bbclass b/classes/insane.bbclass
> index 50752b5..a846832 100644
> --- a/classes/insane.bbclass
> +++ b/classes/insane.bbclass
> @@ -174,7 +174,7 @@ def package_qa_check_rpath(file,name,d, elf):
>          for dir in bad_dirs:
>              if dir in line:
>                  error_msg = "package %s contains bad RPATH %s in file %s" % (name, line, file)
> -                sane = sane + package_qa_handle_error(1, error_msg, name, file, d)
> +                sane = package_qa_handle_error(1, error_msg, name, file, d)
>  
>      return sane
>  
> -- 
> 1.7.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


