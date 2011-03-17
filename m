Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Q0CIs-0002xm-8c
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 13:27:46 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Q0CHE-0002ui-8c
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 13:26:04 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1300363716-32402-1-git-send-email-Martin.Jansa@gmail.com>
References: <1300363716-32402-1-git-send-email-Martin.Jansa@gmail.com>
Date: Thu, 17 Mar 2011 12:29:39 +0000
Message-ID: <1300364979.9054.2.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] gtk+: define empty PACKAGES_DYNAMIC_virtclass-native
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
X-List-Received-Date: Thu, 17 Mar 2011 12:27:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-17 at 13:08 +0100, Martin Jansa wrote:
> --- a/recipes/gtk+/gtk+_2.18.6.bb
> +++ b/recipes/gtk+/gtk+_2.18.6.bb
> @@ -19,6 +19,7 @@ EXTRA_OECONF = "--with-libtiff ${XKBTOGGLE} --disable-glibtest gio_can_sniff=yes
>  EXTRA_OECONF_append_virtclass-native = " --without-libtiff --without-libjpeg --disable-cups"
>  
>  PACKAGES_DYNAMIC = "gtk-module-* gdk-pixbuf-loader-* gtk-immodule-* gtk-printbackend-*"
> +PACKAGES_DYNAMIC_virtclass-native = ""

Can you not put this in gtk+.inc?

p.




