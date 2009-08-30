Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Mhq83-0007PG-1o
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Aug 2009 21:31:55 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id EA8E62200142
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Aug 2009 21:13:29 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 0B1E0220011C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Aug 2009 21:13:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from rhein.familie-heinold.de (unknown [78.52.227.219])
	by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Aug 2009 21:13:29 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 0988B3C327; Sun, 30 Aug 2009 21:13:27 +0200 (CEST)
Date: Sun, 30 Aug 2009 21:13:27 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090830191327.GA6349@rhein.zuhause.netz>
References: <1251594936-4909-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1251594936-4909-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [PATCH] micro.conf: Remove PREFERRED_PROVIDER_virtual/libintl
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
X-List-Received-Date: Sun, 30 Aug 2009 19:31:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 29, 2009 at 06:15:36PM -0700, Khem Raj wrote:
> This is set appropriately in toolchain configuration.
> It gives a possibility to cleanly override LIBC
> say to eglibc or glibc.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  conf/distro/micro.conf |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)
> 
> diff --git a/conf/distro/micro.conf b/conf/distro/micro.conf
> index 861f7ef..2d45425 100644
> --- a/conf/distro/micro.conf
> +++ b/conf/distro/micro.conf
> @@ -1,7 +1,7 @@
>  #############################################################################
>  #@TYPE: Distribution
>  #@NAME: Micro
> -#@DESCRIPTION: Micro Linux Distribution (glibc based)
> +#@DESCRIPTION: Micro Linux Distribution (eglibc based)
>  #@MAINTAINER: Martin Lund <mgl@doredevelopment.dk>
>  #@COMMENT: This distribution configuration defines a truely tiny OE Linux  
>  #@COMMENT: distribution. The matching buildable image target (micro-image)
> @@ -79,7 +79,6 @@ ${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
>  # PREFERRED PROVIDERS
>  #############################################################################
>  PREFERRED_PROVIDER_task-bootstrap	= "task-bootstrap"
> -PREFERRED_PROVIDER_virtual/libintl	= "glibc"
>  
>  #############################################################################
>  # PREFERRED VERSIONS
> -- 
> 1.6.3.3
 
*ACK*

Bye Henning


