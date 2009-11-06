Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1N6KyV-0000lJ-0w
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Nov 2009 10:19:22 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id DFEB91100221
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Nov 2009 10:10:58 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 126B21100085
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Nov 2009 10:10:58 +0100 (CET)
Received: from rhein.familie-heinold.de (unknown [78.52.232.215])
	by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Nov 2009 10:10:58 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 41C843C108; Fri,  6 Nov 2009 10:10:57 +0100 (CET)
Date: Fri, 6 Nov 2009 10:10:57 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091106091056.GA4739@rhein.zuhause.netz>
References: <1257432076-12239-1-git-send-email-marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
In-Reply-To: <1257432076-12239-1-git-send-email-marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [STABLE][PATCH] java.bbclass: fixed oe_jarinstall for broken symlinks
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
X-List-Received-Date: Fri, 06 Nov 2009 09:19:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 05, 2009 at 03:41:16PM +0100, Marcin Juszkiewicz wrote:
> From: Marcin Juszkiewicz <marcin@buglabs.net>
> 
> Code checked for existance of JAR file and if it was present then it had
> to be removed before symlinking to it. But it was not working sometimes
> so we forced symlinking.
> 
> Proper fix is to check "does file exists or is a symlink" which we do
> now.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin@buglabs.net>
> ---
>  classes/java.bbclass |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/classes/java.bbclass b/classes/java.bbclass
> index cacd2ce..b68035c 100644
> --- a/classes/java.bbclass
> +++ b/classes/java.bbclass
> @@ -68,11 +68,11 @@ oe_jarinstall() {
>  
>    # Creates symlinks out of the remaining arguments.
>    while [ "$#" -gt 0 ]; do
> -    if [ -e $dir/$1 ]; then
> +    if [ -e $dir/$1 -o -h $dir/$1 ]; then
>        oewarn "file was in the way. removing:" $dir/$1
>        rm $dir/$1
>      fi
> -    ln -sf $destname $dir/$1
> +    ln -s $destname $dir/$1
>      shift
>    done
>  }
> -- 
*ACK*

Bye Henning


