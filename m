Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1Pivij-0007l1-UD
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 22:19:05 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 1B177314D3CC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 22:18:12 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id idsEfyCqocv5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 22:18:06 +0100 (CET)
Received: from [172.22.22.61] (ip-94-79-168-47.unitymediagroup.de
	[94.79.168.47])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 6F3DC314D0AA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 22:18:06 +0100 (CET)
Message-ID: <4D43328F.5010301@opendreambox.org>
Date: Fri, 28 Jan 2011 22:18:07 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101210 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1296102459-29461-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1296102459-29461-1-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH] package(_ipk).bbclass: fix versioned dependencies in	RDEPENDS et al.
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
X-List-Received-Date: Fri, 28 Jan 2011 21:19:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/27/2011 05:27 AM, Andreas Oberritter wrote:
> * explode_deps() changed its behavior to omit version information
>   when the function was removed from OE in favor of BitBake's
>   implementation in March 2010. Since then, packages didn't contain
>   versioned runtime dependencies.
> 
>   See commit 89b7e433719f43f1c36c76cb8856d559014e99bc
> 
>   The solution is to switch to bb.utils.explode_dep_versions(), as
>   already used by package_rpm.bbclass.
> 
> * Two functions in package.bbclass needlessly added whitespace
>   characters to RDEPENDS_*. This was removed.
> 
> * The following statement was removed from package_ipk.bbclass:
> 
>   if not '-locale-' and not '-dbg' and not '-dev' in pkgname:
>       rdepends.append('%s-locale*' % pkgname)
> 
>   It was added in November 2008, but can never evaluate to true.
> 
>   See commit a045dfacf6f2541e0f410d9d109581f181303756
> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> CC: Chris Larson <chris_larson@mentor.com>
> CC: Otavio Salvador <otavio@ossystems.com.br>

Although this patch fixes the runtime dependencies for shlibs generated
versions, it doesn't cover versions specified in recipes. I'm going to
post an updated patch.

Regards,
Andreas



