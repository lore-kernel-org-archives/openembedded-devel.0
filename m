Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Mv5Ai-0000Qi-6L
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Oct 2009 10:13:27 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id EC18E11001B7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Oct 2009 10:04:57 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 366E211000B1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Oct 2009 10:04:57 +0200 (CEST)
Received: from rhein.familie-heinold.de (g225074180.adsl.alicedsl.de
	[92.225.74.180]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Oct 2009 10:04:57 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 536A43C100; Tue,  6 Oct 2009 10:04:56 +0200 (CEST)
Date: Tue, 6 Oct 2009 10:04:56 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091006080456.GA20066@rhein.zuhause.netz>
References: <1254776922-10892-1-git-send-email-marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
In-Reply-To: <1254776922-10892-1-git-send-email-marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [STABLE][PATCH] java.bbclass: Use force (-f) for ln (suggested by Marcin).
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
X-List-Received-Date: Tue, 06 Oct 2009 08:13:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 05, 2009 at 11:08:42PM +0200, Marcin Juszkiewicz wrote:
> From: Robert Schuster <rschus@entw2.(none)>
> 
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
> 
> ---
>  classes/java.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/classes/java.bbclass b/classes/java.bbclass
> index 38256d7..cacd2ce 100644
> --- a/classes/java.bbclass
> +++ b/classes/java.bbclass
> @@ -72,7 +72,7 @@ oe_jarinstall() {
>        oewarn "file was in the way. removing:" $dir/$1
>        rm $dir/$1
>      fi
> -    ln -s $destname $dir/$1
> +    ln -sf $destname $dir/$1
>      shift
>    done
>  }
> -- 

ACK

Bye Henning


