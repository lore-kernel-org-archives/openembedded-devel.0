Received: from leibniz.math.fu-berlin.de ([160.45.40.10]
	helo=mail.math.fu-berlin.de) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1P7lIz-0002PG-KQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 10:42:54 +0200
Received: (qmail 16560 invoked from network); 18 Oct 2010 10:42:15 +0200
Received: from hydra.imp.fu-berlin.de (HELO hydra) (160.45.117.149)
	by leibniz.math.fu-berlin.de with SMTP; 18 Oct 2010 10:42:15 +0200
X-Virus-Scanned: Debian amavisd-new on 'hydra':10024 at mi.fu-berlin.de
Received: from math.fu-berlin.de ([160.45.40.10])
	by hydra (hydra.imp.fu-berlin.de [160.45.117.149]) (amavisd-new,
	port 10024) with SMTP id 34qIWiR8LTvM
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 10:42:13 +0200 (CEST)
Received: (Qmail 16534 invoked from network); 18 Oct 2010 10:42:13 +0200
Received: From andorra.imp.fu-berlin.de (160.45.42.84)
	by leibniz.math.fu-berlin.de with SMTP; 18 Oct 2010 08:42:13 -0000
Received: from heinold by andorra.imp.fu-berlin.de with local (Exim 4.69 #1
	(Debian)) id 1P7lIK-0000rQ-T1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 10:42:12 +0200
Date: Mon, 18 Oct 2010 10:42:12 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101018084212.GA2530@mi.fu-berlin.de>
References: <1287349925-14997-1-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <1287349925-14997-1-git-send-email-obi@opendreambox.org>
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
Subject: Re: [PATCH] directfb-1.4.6: fix packaging
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
X-List-Received-Date: Mon, 18 Oct 2010 08:42:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 17, 2010 at 09:12:05PM +0000, Andreas Oberritter wrote:
> * Files were searched in the wrong directory, because $RV was wrong.
> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  recipes/directfb/directfb_1.4.6.bb |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes/directfb/directfb_1.4.6.bb b/recipes/directfb/directfb_1.4.6.bb
> index 1d4f34a..70c0225 100644
> --- a/recipes/directfb/directfb_1.4.6.bb
> +++ b/recipes/directfb/directfb_1.4.6.bb
> @@ -1,7 +1,7 @@
>  require directfb.inc
>  
> -RV = "1.4-0"
> -PR = "r1"
> +RV = "1.4-5"
> +PR = "r2"
>  
>  DEPENDS += "sysfsutils"
>  
> @@ -21,7 +21,7 @@ EXTRA_OECONF = "\
>    --disable-x11 \
>  "
>  
> -LEAD_SONAME = "libdirectfb-1.4.so.0"
> +LEAD_SONAME = "libdirectfb-1.4.so.5"
>  
>  SRC_URI[md5sum] = "dbe1957932f81790742b58b94c1c7b84"
>  SRC_URI[sha256sum] = "b18121e60e9a084ee347037a53a46cfaea1c09505bd99d673c2e65eca285e69b"

Thanks for spotting.

Bye Henning


