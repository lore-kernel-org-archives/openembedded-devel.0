Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lx2ox-0000Oj-Q5
	for openembedded-devel@openembedded.org; Thu, 23 Apr 2009 19:34:47 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1Lx2kM-0007D6-IH
	for openembedded-devel@openembedded.org; Thu, 23 Apr 2009 17:30:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 23 Apr 2009 17:30:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 23 Apr 2009 17:30:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 23 Apr 2009 19:28:23 +0200
Message-ID: <gsq8fp$ids$1@ger.gmane.org>
References: <20090423153754.GW17629@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090415 Shredder/3.0b3pre
In-Reply-To: <20090423153754.GW17629@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC][PATCH] Make initscripts banner stop trying to be smart
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
X-List-Received-Date: Thu, 23 Apr 2009 17:34:48 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-04-09 17:37, Tom Rini wrote:
> I ran into this on my boards that start out with the really minimal
> (console and null only) set of dev nodes prior to udev running.  The
> banner script looks around for what might be the vtmaster (aka what's
> got console) to say that we're booting.  But that's where things go by
> default anyhow.  This would also let slugos use the normal version, if
> they want.

I looked into the history of this file and it seems it stems from the 
creation of the OE project (when we still had .oe files) and the only 
edit to is is to add the check for /dev/console.

Anyway:

Acked-by: Koen Kooi <koen@openembedded.org>



> Signed-off-by: Tom Rini<trini@embeddedalley.com>
>
> diff --git a/recipes/initscripts/initscripts-1.0/banner b/recipes/initscripts/initscripts-1.0/banner
> index 0349ce1..4e69c29 100644
> --- a/recipes/initscripts/initscripts-1.0/banner
> +++ b/recipes/initscripts/initscripts-1.0/banner
> @@ -1,17 +1,3 @@
>   #!/bin/sh
>
> -if [ ! -e /dev/tty ]; then
> -    /bin/mknod -m 0666 /dev/tty c 5 0
> -fi
> -
> -if (>  /dev/tty0 ) 2>/dev/null; then
> -    vtmaster=/dev/tty0
> -elif (>  /dev/vc/0 ) 2>/dev/null; then
> -    vtmaster=/dev/vc/0
> -elif (>  /dev/console ) 2>/dev/null; then
> -    vtmaster=/dev/console
> -else
> -    vtmaster=/dev/null
> -fi
> -echo>  $vtmaster
> -echo "Please wait: booting...">  $vtmaster
> +echo "Please wait: booting..."
> diff --git a/recipes/initscripts/initscripts_1.0.bb b/recipes/initscripts/initscripts_1.0.bb
> index cbcfec5..6642144 100644
> --- a/recipes/initscripts/initscripts_1.0.bb
> +++ b/recipes/initscripts/initscripts_1.0.bb
> @@ -4,7 +4,7 @@ PRIORITY = "required"
>   DEPENDS = "makedevs"
>   RDEPENDS = "makedevs"
>   LICENSE = "GPL"
> -PR = "r114"
> +PR = "r115"
>
>   SRC_URI = "file://functions \
>              file://halt \
>




