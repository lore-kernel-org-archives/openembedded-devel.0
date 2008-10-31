Received: from [202.4.237.240] (helo=kirsty.vergenet.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raster@vergenet.net>) id 1Kvthu-0006rJ-1y
	for openembedded-devel@lists.openembedded.org;
	Fri, 31 Oct 2008 14:06:30 +0100
Received: by kirsty.vergenet.net (Postfix, from userid 1001)
	id 0CAD1240A3; Fri, 31 Oct 2008 23:38:04 +1100 (EST)
Date: Fri, 31 Oct 2008 23:37:53 +1100
From: Carsten Haitzler (The Rasterman) <raster@rasterman.com>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20081031233753.43f5f09d.raster@rasterman.com>
In-Reply-To: <20081031110045.7EF89189333@amethyst.openembedded.net>
References: <20081031110045.7EF89189333@amethyst.openembedded.net>
Organization: You expect me to be organized?
X-Mailer: Sylpheed 2.4.8 (GTK+ 2.12.9; i486-pc-linux-gnu)
X-Pants: on
X-Cluestick: Get jiggy with it!
Mime-Version: 1.0
Subject: Re: [oe-commits] Koen Kooi : initscripts: only run ldconfig on boot when ld.so. conf is present
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
X-List-Received-Date: Fri, 31 Oct 2008 13:06:30 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 31 Oct 2008 12:00:45 +0100 (CET) git@amethyst.openembedded.net (GIT
User account) babbled:

is there any reason to run ldconfig on boot? this should be handled by opkg on
package install/upgrade or by the flash image creation (this slows boot
significantly and i've patched out/disabled ldconfig run in bootmisc.sh with no
ill effects).

> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 6628886e858d77a8f9f94dd3229143e144d39f0e
> URL:
> http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=6628886e858d77a8f9f94dd3229143e144d39f0e
> 
> Author: Koen Kooi <koen@openembedded.org>
> Date:   Fri Oct 31 11:57:54 2008 +0100
> 
> initscripts: only run ldconfig on boot when ld.so.conf is present
> 
> ---
> 
>  packages/initscripts/initscripts-1.0/bootmisc.sh |    6 ++++--
>  packages/initscripts/initscripts_1.0.bb          |    2 +-
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/packages/initscripts/initscripts-1.0/bootmisc.sh
> b/packages/initscripts/initscripts-1.0/bootmisc.sh index 2a40e0c..dde1209
> 100755
> --- a/packages/initscripts/initscripts-1.0/bootmisc.sh
> +++ b/packages/initscripts/initscripts-1.0/bootmisc.sh
> @@ -57,9 +57,11 @@ then
>  fi
>  
>  #
> -# Update dynamic library cache
> +# Update dynamic library cache, but only if ld.so.conf is present
>  #
> -/sbin/ldconfig
> +if [ -e /etc/ld.so.conf ] ; then
> +	/sbin/ldconfig
> +fi
>  
>  # Set the system clock from hardware clock
>  # If the timestamp is 1 day or more recent than the current time,
> diff --git a/packages/initscripts/initscripts_1.0.bb
> b/packages/initscripts/initscripts_1.0.bb index b1c4317..8daefc5 100644
> --- a/packages/initscripts/initscripts_1.0.bb
> +++ b/packages/initscripts/initscripts_1.0.bb
> @@ -4,7 +4,7 @@ PRIORITY = "required"
>  DEPENDS = "makedevs"
>  RDEPENDS = "makedevs"
>  LICENSE = "GPL"
> -PR = "r109"
> +PR = "r110"
>  
>  SRC_URI = "file://functions \
>             file://halt \
> 
> 
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
> 


-- 
------------- Codito, ergo sum - "I code, therefore I am" --------------
The Rasterman (Carsten Haitzler)    raster@rasterman.com



