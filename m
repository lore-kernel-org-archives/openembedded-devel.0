Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PBDwA-0007bA-7V
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Oct 2010 23:53:38 +0200
Received: by bwz10 with SMTP id 10so1032901bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Oct 2010 14:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=1R6+Sq1y4nwKAEj3AzrFdyp2+4fxHVQen63Tz9E+weg=;
	b=ntgt+qmjrjaCHDASWwGGsP6oRhLNyBKY5dK4b9Q2wtmfBCaw4Ttd4Hdkuir74+jjg5
	vsvevX1tYUdQXjnRt34MuA4Erg8LbljX8vhD7R7H3LzhVfwO89m0vRBnzrBRjOq8AyXr
	SGvJF+qYvdvcvrFzeAo+0AVmkgicYe3x3L2+w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=WOI3h10ltrjdSohuHdPY//ufpzSENzes7uHITEVQiqZKyUNOK0GNw2QN5V5a3HQsZl
	orEA4/mTHHhje10tcrsmX/1aKsJb/sRfGYb4rEAYmwC7kzW+q/nVzOtYlNDYbMATnvJ2
	okTsgbi1BBj46Z6AhKHv5UusH5dDDVvc1s9rA=
Received: by 10.204.120.74 with SMTP id c10mr1508025bkr.116.1288216375332;
	Wed, 27 Oct 2010 14:52:55 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id p34sm7381896bkf.15.2010.10.27.14.52.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 27 Oct 2010 14:52:48 -0700 (PDT)
Date: Wed, 27 Oct 2010 23:52:49 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101027215249.GF3514@jama>
References: <1288214778-31692-1-git-send-email-cliff.brake@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1288214778-31692-1-git-send-email-cliff.brake@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Cliff Brake <cbrake@bec-systems.com>
Subject: Re: [PATCH] libfontenc: add font-util depend
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
X-List-Received-Date: Wed, 27 Oct 2010 21:53:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 27, 2010 at 05:26:18PM -0400, Cliff Brake wrote:
> From: Cliff Brake <cbrake@bec-systems.com>
> 
> when building, I got the following error:
> configure.ac:44: error: must install X.Org font-util 1.1 or later before running autoconf/autogen
> ---
>  recipes/xorg-lib/libfontenc_1.1.0.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/xorg-lib/libfontenc_1.1.0.bb b/recipes/xorg-lib/libfontenc_1.1.0.bb
> index bce1aa5..757431f 100644
> --- a/recipes/xorg-lib/libfontenc_1.1.0.bb
> +++ b/recipes/xorg-lib/libfontenc_1.1.0.bb
> @@ -1,7 +1,7 @@
>  require xorg-lib-common.inc
>  DESCRIPTION = "X11 font encoding library"
>  LICENSE = "BSD-X"
> -DEPENDS += "zlib xproto"
> +DEPENDS += "zlib xproto font-util"
>  PE = "1"
>  PR = "${INC_PR}.0"

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


