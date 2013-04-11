Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1UQG2n-0004E1-Op
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Apr 2013 13:51:59 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 5E93EF811FC; Thu, 11 Apr 2013 05:34:36 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 6909AF811F9;
	Thu, 11 Apr 2013 05:34:35 -0600 (MDT)
Message-ID: <51669FCB.8000607@mlbassoc.com>
Date: Thu, 11 Apr 2013 05:34:35 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1365677165-9296-1-git-send-email-koen@dominion.thruhere.net>
	<1365677165-9296-3-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1365677165-9296-3-git-send-email-koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCHv2 3/8] python-tornado: update to top of 2.2 branch
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
X-List-Received-Date: Thu, 11 Apr 2013 11:52:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-04-11 04:46, Koen Kooi wrote:
> Drags in a few bugfixes needed for gateone
>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>   meta-oe/recipes-devtools/python/python-tornado_git.bb | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/python/python-tornado_git.bb b/meta-oe/recipes-devtools/python/python-tornado_git.bb
> index 00d0bbb..f158923 100644
> --- a/meta-oe/recipes-devtools/python/python-tornado_git.bb
> +++ b/meta-oe/recipes-devtools/python/python-tornado_git.bb
> @@ -2,9 +2,9 @@ DESCRIPTION = "Tornado is an open source version of the scalable, non-blocking w
>   LICENSE = "Apache"
>   LIC_FILES_CHKSUM = "file://README;md5=e7fb9954003d7cd93322ccf282210d1c"
>
> -PV = "2.2"
> -SRCREV = "02bc76155de5bf4dca243e4d0c019c0ac4c8b3be"
> -PR = "r1"
> +PV = "2.2.1+git${SRCPV}"

Why not go to the latest stable version 2.4.1?

> +
> +SRCREV = "c501917eba46dec30b1f2ef12497dffc4beec505"
>   SRC_URI = "git://github.com/facebook/tornado.git;branch=branch2.2 \
>              file://0001-disable-AI_ADDRCONFIG-flag.patch \
>             "
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


