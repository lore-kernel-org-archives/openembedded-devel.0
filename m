Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1OtJMh-0003qo-Ah
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 14:04:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id B05BAA6054;
	Wed,  8 Sep 2010 13:02:18 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id es6bxuQdWNHL; Wed,  8 Sep 2010 13:02:14 +0100 (BST)
Received: from [192.168.1.119] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 1BE89A6051;
	Wed,  8 Sep 2010 13:02:14 +0100 (BST)
Message-ID: <4C877B47.8020609@xora.org.uk>
Date: Wed, 08 Sep 2010 13:02:15 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.7) Gecko/20100720 Lightning/1.0b2 Thunderbird/3.1.1
MIME-Version: 1.0
To: Steffen Sledz <sledz@dresearch.de>
References: <4C86151D.50801@dresearch.de>
	<1283947246-30457-1-git-send-email-sledz@dresearch.de>
In-Reply-To: <1283947246-30457-1-git-send-email-sledz@dresearch.de>
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] gtk+: fix configure problem for native build
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
X-List-Received-Date: Wed, 08 Sep 2010 12:05:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

 Acked-by: Graeme Gregory <dp@xora.org.uk>

G

On 08/09/10 13:00, Steffen Sledz wrote:
> Signed-off-by: Steffen Sledz <sledz@dresearch.de>
> ---
>  recipes/gtk+/gtk+_2.18.6.bb |    2 +-
>  recipes/gtk+/gtk+_2.20.0.bb |    2 +-
>  recipes/gtk+/gtk+_2.20.1.bb |    2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes/gtk+/gtk+_2.18.6.bb b/recipes/gtk+/gtk+_2.18.6.bb
> index 237689d..864f4ba 100644
> --- a/recipes/gtk+/gtk+_2.18.6.bb
> +++ b/recipes/gtk+/gtk+_2.18.6.bb
> @@ -16,7 +16,7 @@ XKBTOGGLE = " --disable-xkb"
>  XKBTOGGLE_angstrom = ""
>  
>  EXTRA_OECONF = "--with-libtiff ${XKBTOGGLE} --disable-glibtest gio_can_sniff=yes"
> -EXTRA_OECONF_append_virtclass-native = " --without-libtiff --without-libjpeg"
> +EXTRA_OECONF_append_virtclass-native = " --without-libtiff --without-libjpeg --disable-cups"
>  
>  PACKAGES_DYNAMIC = "gtk-module-* gdk-pixbuf-loader-* gtk-immodule-* gtk-printbackend-*"
>  
> diff --git a/recipes/gtk+/gtk+_2.20.0.bb b/recipes/gtk+/gtk+_2.20.0.bb
> index 2c061b7..1e07e83 100644
> --- a/recipes/gtk+/gtk+_2.20.0.bb
> +++ b/recipes/gtk+/gtk+_2.20.0.bb
> @@ -20,7 +20,7 @@ XKBTOGGLE = " --disable-xkb"
>  XKBTOGGLE_angstrom = ""
>  
>  EXTRA_OECONF = "--with-libtiff ${XKBTOGGLE} --disable-glibtest gio_can_sniff=yes"
> -EXTRA_OECONF_append_virtclass-native = " --without-libtiff --without-libjpeg"
> +EXTRA_OECONF_append_virtclass-native = " --without-libtiff --without-libjpeg --disable-cups"
>  
>  PACKAGES_DYNAMIC = "gtk-module-* gdk-pixbuf-loader-* gtk-immodule-* gtk-printbackend-*"
>  
> diff --git a/recipes/gtk+/gtk+_2.20.1.bb b/recipes/gtk+/gtk+_2.20.1.bb
> index 1568e61..ca5e197 100644
> --- a/recipes/gtk+/gtk+_2.20.1.bb
> +++ b/recipes/gtk+/gtk+_2.20.1.bb
> @@ -24,7 +24,7 @@ XKBTOGGLE = " --disable-xkb"
>  XKBTOGGLE_angstrom = ""
>  
>  EXTRA_OECONF = "--with-libtiff ${XKBTOGGLE} --disable-glibtest gio_can_sniff=yes"
> -EXTRA_OECONF_append_virtclass-native = " --without-libtiff --without-libjpeg"
> +EXTRA_OECONF_append_virtclass-native = " --without-libtiff --without-libjpeg --disable-cups"
>  
>  PACKAGES_DYNAMIC = "gtk-module-* gdk-pixbuf-loader-* gtk-immodule-* gtk-printbackend-*"
>  



