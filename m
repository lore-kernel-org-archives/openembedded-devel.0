Received: from [216.145.245.199] (helo=mx03.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1Lxp4h-0002hW-NI
	for openembedded-devel@openembedded.org; Sat, 25 Apr 2009 23:06:15 +0200
Received: from [209.242.7.134] (helo=[192.168.231.111])
	by mx03.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1Lxozy-0000cP-Rk
	for openembedded-devel@openembedded.org; Sat, 25 Apr 2009 16:01:22 -0500
Message-ID: <49F37A22.4050003@dls.net>
Date: Sat, 25 Apr 2009 16:01:22 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.21) Gecko/20090302 Thunderbird/2.0.0.21 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <20090423153754.GW17629@smtp.west.cox.net>
In-Reply-To: <20090423153754.GW17629@smtp.west.cox.net>
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
X-List-Received-Date: Sat, 25 Apr 2009 21:06:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Tom Rini wrote:
> I ran into this on my boards that start out with the really minimal
> (console and null only) set of dev nodes prior to udev running.  The
> banner script looks around for what might be the vtmaster (aka what's
> got console) to say that we're booting.  But that's where things go by
> default anyhow.  This would also let slugos use the normal version, if
> they want.
> 
> Signed-off-by: Tom Rini <trini@embeddedalley.com>

Acked-by: Mike Westerhof <mwester@dls.net>

Yes, SlugOS will happily return to using the normal version. :)


> diff --git a/recipes/initscripts/initscripts-1.0/banner b/recipes/initscripts/initscripts-1.0/banner
> index 0349ce1..4e69c29 100644
> --- a/recipes/initscripts/initscripts-1.0/banner
> +++ b/recipes/initscripts/initscripts-1.0/banner
> @@ -1,17 +1,3 @@
>  #!/bin/sh
>  
> -if [ ! -e /dev/tty ]; then
> -    /bin/mknod -m 0666 /dev/tty c 5 0
> -fi
> -
> -if ( > /dev/tty0 ) 2>/dev/null; then
> -    vtmaster=/dev/tty0
> -elif ( > /dev/vc/0 ) 2>/dev/null; then
> -    vtmaster=/dev/vc/0
> -elif ( > /dev/console ) 2>/dev/null; then
> -    vtmaster=/dev/console
> -else
> -    vtmaster=/dev/null
> -fi
> -echo > $vtmaster
> -echo "Please wait: booting..." > $vtmaster
> +echo "Please wait: booting..."
> diff --git a/recipes/initscripts/initscripts_1.0.bb b/recipes/initscripts/initscripts_1.0.bb
> index cbcfec5..6642144 100644
> --- a/recipes/initscripts/initscripts_1.0.bb
> +++ b/recipes/initscripts/initscripts_1.0.bb
> @@ -4,7 +4,7 @@ PRIORITY = "required"
>  DEPENDS = "makedevs"
>  RDEPENDS = "makedevs"
>  LICENSE = "GPL"
> -PR = "r114"
> +PR = "r115"
>  
>  SRC_URI = "file://functions \
>             file://halt \
> 


