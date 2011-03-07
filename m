Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Pwdkz-0007n9-Kn
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Mar 2011 17:58:05 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1PwdjW-0001Pv-R9
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Mar 2011 17:56:34 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1299516187-27151-1-git-send-email-sledz@dresearch.de>
References: <1299515323-2246-1-git-send-email-sledz@dresearch.de>
	<1299516187-27151-1-git-send-email-sledz@dresearch.de>
Date: Mon, 07 Mar 2011 16:57:24 +0000
Message-ID: <1299517044.2132.203.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH v2] gupnp_0.13.4/gupnp-av_0.5.9: disable introspection
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
X-List-Received-Date: Mon, 07 Mar 2011 16:58:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-03-07 at 17:43 +0100, Steffen Sledz wrote:
> --- a/recipes/upnp/gupnp_0.13.4.bb
> +++ b/recipes/upnp/gupnp_0.13.4.bb
> @@ -2,13 +2,14 @@ LICENSE = "LGPL"
>  DEPENDS = "e2fsprogs gssdp libsoup-2.4 libxml2 gtk-doc-native libgee"
>  
>  require gupnp.inc
> +PR = "1"
>  
>  SRC_URI[md5sum] = "0d562f5f02534c70c3743b2c514db8ba"
>  SRC_URI[sha256sum] = "7974953f38a41236c875c3df509abc43e8218b5925fdc18212a73b1ae0d0e7e8"
>  
>  inherit autotools pkgconfig
>  
> -EXTRA_OECONF = "--disable-gtk-doc"
> +EXTRA_OECONF = "--disable-gtk-doc --enable-introspection=no"

I can't help thinking that there must be a better place to put this,
maybe even autotools.bbclass.  We basically want those options for all
packages that will take them, right?

p.




