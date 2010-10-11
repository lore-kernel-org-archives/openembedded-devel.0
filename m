Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1P5NS4-0006tH-Bb
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 20:50:27 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 2548D11000B9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 20:50:00 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id C71C911000A8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 20:49:58 +0200 (CEST)
Received: from rhein.familie-heinold.de (f052226098.adsl.alicedsl.de
	[78.52.226.98]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 20:49:58 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 4E7883C0FD; Mon, 11 Oct 2010 20:49:35 +0200 (CEST)
Date: Mon, 11 Oct 2010 20:49:35 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101011184934.GA3461@rhein.zuhause.netz>
References: <i8ufbd$27r$1@dough.gmane.org>
	<1286795697-9335-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1286795697-9335-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] openjade: return oj-native-libosp-fix.patch, lost in BBCLASSEXTEND change fdf02c61607acb5046afaa11c5c682ab99f4d508
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
X-List-Received-Date: Mon, 11 Oct 2010 18:50:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 11, 2010 at 01:14:57PM +0200, Martin Jansa wrote:
> ---
>  recipes/openjade/openjade_1.3.2.bb |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/openjade/openjade_1.3.2.bb b/recipes/openjade/openjade_1.3.2.bb
> index 238586b..9462636 100644
> --- a/recipes/openjade/openjade_1.3.2.bb
> +++ b/recipes/openjade/openjade_1.3.2.bb
> @@ -5,9 +5,10 @@ DESCRIPTION = "OpenJade is a suite of tools for validating, \
>  processing, and applying DSSSL (Document Style Semantics and \
>  Specification Language) stylesheets to SGML and XML documents."
>  LICENSE = "BSD"
> -PR = "r2"
> +PR = "r3"
>  SRC_URI = "${SOURCEFORGE_MIRROR}/openjade/openjade-${PV}.tar.gz \
> -	   file://configure.patch \
> +           file://oj-native-libosp-fix.patch \
> +           file://configure.patch \
>            "
>  
>  inherit autotools

Didnt you forgot the oj-native-libosp-fix.patch or came it from an earlier version?

Bye Henning


