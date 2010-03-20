Received: from mail-qy0-f194.google.com ([209.85.221.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1NspEO-0004cG-Np
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Mar 2010 04:20:44 +0100
Received: by qyk32 with SMTP id 32so1704081qyk.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Mar 2010 20:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=Lz9TuSwDpAJ+nqSC07bSqX1IbzBLPwhRKGqF8J3E8xQ=;
	b=mRoCz3yEaSpMRtlqiVMlzkoHgy7Z0S3eukrenB8VNxQt4ANUd+iI3PfpK5zKBaN2j9
	nof8TQ8k7N+ItcA5RxlS/138lqH5/XPKRW4LFGlTFvSiiKOLi+2Ia3TRwA+51Qft2n1O
	BjW+2acoiPUCP/K3qg4F7LhxiqbOXzEuIjIMs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=Ch+bRSco093GVDCoq8qXTw9vlbgwPSxzFSYNHnfRaNXl4qJLAk/GvCxCUEyV48KjLt
	v95llzcLwurhOEYYKM0wWD5xSxv3k6vrcq1X1Xgk9xz0x8UVobowp3d31D1t5hSInFKK
	pkWKtfQSw324nwSgWuGmlNw4nNNzDkqcI/yo0=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.129.29 with SMTP id m29mr510095qcs.33.1269055022170; Fri, 
	19 Mar 2010 20:17:02 -0700 (PDT)
In-Reply-To: <4BA43A58.905@mwester.net>
References: <4BA43A58.905@mwester.net>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 19 Mar 2010 20:16:42 -0700
X-Google-Sender-Auth: cad11fdb1280a034
Message-ID: <b6ebd0a51003192016t785699a7k486eadafab4307cf@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.194
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Patch "Don't inherit siteinfo in base.bbclass" breaks SlugOS
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
X-List-Received-Date: Sat, 20 Mar 2010 03:20:44 -0000
Content-Type: text/plain; charset=UTF-8

Damn, I fixed all the recipes using SITEINFO, but missed distros, sorry
about that.
I'd suggest doing INHERIT += "siteinfo" in the distro .conf, for now.
 Again, sorry about the breakage.

On Fri, Mar 19, 2010 at 8:00 PM, Mike Westerhof <mike@mwester.net> wrote:

> The following commit breaks SlugOS.  I apologize for starting a new
> thread on this, but I am unable to find the original discussion on the
> OE ml (but I probably missed it in the several hundred that piled up in
> my inbox this week).
>
> ------------
> commit a215c2f283476776567506c2e3f969c48f7e5e3d
> Author: Chris Larson <chris_larson@mentor.com>
> Date:   Tue Mar 9 16:54:57 2010 -0700
>
>    Don't inherit siteinfo in base.bbclass
>
>    Acked-by: Richard Purdie <rpurdie@linux.intel.com>
>    Acked-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
>    Signed-off-by: Chris Larson <chris_larson@mentor.com>
> ------------
>
> In a nutshell, the ixp4xx can run in either endianess, and SlugOS builds
> both a BE and an LE image.  Removing "inherit siteinfo" from
> base.bbclass causes parsing failures in every recipe.
>
> As an example of the issue, consider this lines in
> conf/distro/include/slugos.conf:
>
> IMAGE_BASENAME = "${@['slugos${SITEINFO_ENDIANESS}',
> 'ucslugc'][bb.data.getVar('TARGET_OS', d, 1) == 'linux-uclibc']}"
>
> and
>
> DISTRO_NAME ?=
> "INVALID-${SITEINFO_ENDIANESS}-${ARM_INSTRUCTION_SET}-${TARGET_OS}"
>
> There may be other locations (such as recipes, etc) where this problem
> may exist, these were just the two locations I found easily.
>
> Any ideas how to address this?
>
> -Mike (mwester)
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

