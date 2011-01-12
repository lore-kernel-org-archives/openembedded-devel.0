Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>) id 1Pcxou-0006Kg-GL
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 11:20:48 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 9B43DA5DCC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jan 2011 10:20:17 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id CVPne+UMcOj9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jan 2011 10:20:16 +0000 (GMT)
Received: from [192.168.1.10] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id BB643A5DC1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jan 2011 10:20:16 +0000 (GMT)
Message-ID: <4D2D8085.3020904@xora.org.uk>
Date: Wed, 12 Jan 2011 10:20:53 +0000
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D2D7BEB.8080706@dresearch.de>
	<1294826975-24312-1-git-send-email-sledz@dresearch.de>
In-Reply-To: <1294826975-24312-1-git-send-email-sledz@dresearch.de>
X-Enigmail-Version: 1.1.1
Subject: Re: [PATCH] epiphany-2.30.2: unbreak build by disabling CA files
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
X-List-Received-Date: Wed, 12 Jan 2011 10:20:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 12/01/2011 10:09, Steffen Sledz wrote:
> This is a workaround to unbreak the build of epiphany for various host
> operating systems, since nobody was able/willing to fix it in the right
> way.
>
> see also:
> * <http://thread.gmane.org/gmane.comp.handhelds.openembedded/38251>
> * <http://thread.gmane.org/gmane.comp.handhelds.openembedded/41291>
>
> Signed-off-by: Steffen Sledz <sledz@dresearch.de>
> ---
>  recipes/gnome/epiphany_2.30.2.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/gnome/epiphany_2.30.2.bb b/recipes/gnome/epiphany_2.30.2.bb
> index 57a5d9a..3a8b5f5 100644
> --- a/recipes/gnome/epiphany_2.30.2.bb
> +++ b/recipes/gnome/epiphany_2.30.2.bb
> @@ -11,7 +11,7 @@ SRC_URI[archive.md5sum] = "29b084acfa016540d91d3601ec3dff5c"
>  SRC_URI[archive.sha256sum] = "cd0124e71e72142593cfeb442d58d97e99ba94ace6e31d94717fe977c0bfb98a"
>  
>  
> -EXTRA_OECONF += "--disable-nss --with-engine=webkit --with-distributor-name=${DISTRO}"
> +EXTRA_OECONF += "--disable-nss --with-engine=webkit --with-distributor-name=${DISTRO} --without-ca-file"
>  
>  do_configure_prepend() {
>          touch ${S}/gnome-doc-utils.make
Acked-by: Graeme Gregory <dp@xora.org.uk>



