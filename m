Received: from leibniz.math.fu-berlin.de ([160.45.40.10]
	helo=mail.math.fu-berlin.de) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1OGCCl-0003bT-5O
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 May 2010 16:31:04 +0200
Received: (qmail 26776 invoked from network); 23 May 2010 16:25:56 +0200
Received: from hydra.imp.fu-berlin.de (HELO hydra) (160.45.117.149)
	by leibniz.math.fu-berlin.de with SMTP; 23 May 2010 16:25:56 +0200
X-Virus-Scanned: Debian amavisd-new on 'hydra':10024 at mi.fu-berlin.de
Received: from math.fu-berlin.de ([160.45.40.10])
	by hydra (hydra.imp.fu-berlin.de [160.45.117.149]) (amavisd-new,
	port 10024) with SMTP id fPzVz9B+G4s3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 May 2010 16:25:39 +0200 (CEST)
Received: (Qmail 26726 invoked from network); 23 May 2010 16:25:39 +0200
Received: From andorra.imp.fu-berlin.de (160.45.42.84)
	by leibniz.math.fu-berlin.de with SMTP; 23 May 2010 14:25:39 -0000
Received: from heinold by andorra.imp.fu-berlin.de with local (Exim 4.69 #1
	(Debian)) id 1OGC7W-0007jc-Vr; Sun, 23 May 2010 16:25:39 +0200
Date: Sun, 23 May 2010 16:25:38 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: Vladimir Zapolskiy <vzapolskiy@gmail.com>
Message-ID: <20100523142538.GA27824@mi.fu-berlin.de>
References: <1274536328-31845-1-git-send-email-vzapolskiy@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1274536328-31845-1-git-send-email-vzapolskiy@gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-SA-Exim-Connect-IP: 160.45.40.10
X-SA-Exim-Mail-From: heinold@mi.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,UNPARSEABLE_RELAY
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] e2fsprogs: disable tls build with uclibc toolchain
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
X-List-Received-Date: Sun, 23 May 2010 14:31:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 22, 2010 at 05:52:08PM +0400, Vladimir Zapolskiy wrote:
> This patch removes dependency on oabi toolchain, because eabi uclibc
> toolchain anyway does not have tls support.
> 
> Signed-off-by: Vladimir Zapolskiy <vzapolskiy@gmail.com>
> Cc: woglinde <heinold@inf.fu-berlin.de>
> ---
>  recipes/e2fsprogs/e2fsprogs.inc |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/e2fsprogs/e2fsprogs.inc b/recipes/e2fsprogs/e2fsprogs.inc
> index 119efb0..0eeedcd 100644
> --- a/recipes/e2fsprogs/e2fsprogs.inc
> +++ b/recipes/e2fsprogs/e2fsprogs.inc
> @@ -14,8 +14,7 @@ INC_PR = "r23"
>  inherit autotools
>  
>  #if uclibc ntpl is merged into trunk we can enable tls for armv4 again
> -EXTRA_OECONF = "${@['','--disable-tls'][bb.data.getVar('ARM_ABI', d, 1) == 'oabi' and \
> -		bb.data.getVar('TARGET_OS', d, 1).find('uclibc') >= 0 ]} \
> +EXTRA_OECONF = "${@['','--disable-tls'][bb.data.getVar('TARGET_OS', d, 1).find('uclibc') >= 0 ]} \
>  		--enable-elf-shlibs \
>  		--enable-dynamic-e2fsck --disable-nls --sbindir=${base_sbindir} \
>  		--disable-libuuid --disable-libblkid --disable-fsck"

Sorry,

but you are wrong here the _git uclibc recipe and the hopefully soon comming out
new uClibc will have tls support, but not for all archs. We will change the .inc
then.


Bye Henning


