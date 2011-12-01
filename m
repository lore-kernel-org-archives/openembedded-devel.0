Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1RW2GC-0004ra-Av
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Dec 2011 09:44:52 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 494AA11000B4;
	Thu,  1 Dec 2011 09:38:13 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 2311411000B0;
	Thu,  1 Dec 2011 09:38:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
Received: from rhein.familie-heinold.de (f052225171.adsl.alicedsl.de
	[78.52.225.171]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Thu,  1 Dec 2011 09:38:11 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id B3FF43C49D; Thu,  1 Dec 2011 09:38:10 +0100 (CET)
Date: Thu, 1 Dec 2011 09:38:10 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111201083810.GB4447@rhein.zuhause.netz>
References: <1322726587-5992-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1322726587-5992-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-java] jamvm git: use proper PV
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
X-List-Received-Date: Thu, 01 Dec 2011 08:44:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 01, 2011 at 09:03:07AM +0100, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  recipes-core/jamvm/jamvm_git.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes-core/jamvm/jamvm_git.bb b/recipes-core/jamvm/jamvm_git.bb
> index 6d06552..e6b6132 100644
> --- a/recipes-core/jamvm/jamvm_git.bb
> +++ b/recipes-core/jamvm/jamvm_git.bb
> @@ -4,7 +4,7 @@
>  require jamvm.inc
>  
>  SRCREV = "4617da717ecb05654ea5bb9572338061106a414d"
> -PV = "0.0+git${SRCPV}"
> +PV = "1.5.5+1.6.0-devel+git${SRCPV}"
>  
>  SRC_URI = "git://git.berlios.de/jamvm;protocol=git \
>             file://jamvm-jni_h-noinst.patch \
> -- 
> 1.7.2.5

Hi Koen,

thanks I applied the patch.

Bye Henning


