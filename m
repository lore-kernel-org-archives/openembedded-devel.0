Received: from [202.4.237.240] (helo=kirsty.vergenet.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raster@vergenet.net>) id 1L2Yll-0003mW-5a
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Nov 2008 23:10:02 +0100
Received: by kirsty.vergenet.net (Postfix, from userid 1001)
	id A0BE824075; Wed, 19 Nov 2008 09:07:33 +1100 (EST)
Date: Wed, 19 Nov 2008 08:52:31 +1100
From: Carsten Haitzler (The Rasterman) <raster@rasterman.com>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20081119085231.45d162ae.raster@rasterman.com>
In-Reply-To: <20081118210044.GA2528@dodger.lab.datenfreihafen.org>
References: <20081117151909.GG11401@datenfreihafen.org>
	<c384c5ea0811171047oa367b5bg25d01e3f50a9592f@mail.gmail.com>
	<20081118210044.GA2528@dodger.lab.datenfreihafen.org>
Organization: You expect me to be organized?
X-Mailer: Sylpheed 2.4.8 (GTK+ 2.12.9; i486-pc-linux-gnu)
X-Pants: on
X-Cluestick: Get jiggy with it!
Mime-Version: 1.0
Subject: Re: Moving fontconfig cache out of tmpfs
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
X-List-Received-Date: Tue, 18 Nov 2008 22:10:02 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 18 Nov 2008 22:00:44 +0100 Stefan Schmidt <stefan@datenfreihafen.org>
babbled:

> Hello.
> 
> On Mon, 2008-11-17 at 19:47, Leon Woestenberg wrote:
> > 
> > /var/lib/ looks fine to me.
> 
> Luckily fontconfig already has a configure option for the cache dir. Only some
> small EXTRA_OECONF fiddeling was needed.
> 
> People are fine with this?

thumbsup++ :)

> diff --git a/packages/fontconfig/fontconfig.inc
> b/packages/fontconfig/fontconfig.inc index 252b843..9af3540 100644
> --- a/packages/fontconfig/fontconfig.inc
> +++ b/packages/fontconfig/fontconfig.inc
> @@ -18,7 +18,7 @@ inherit autotools pkgconfig
>  
>  export HASDOCBOOK="no"
>  
> -EXTRA_OECONF = " --disable-docs"
> +EXTRA_OECONF = " --disable-docs --with-cache-dir=/var/lib/fontconfig"
>  EXTRA_OEMAKE = "FC_LANG=fc-lang FC_GLYPHNAME=fc-glyphname"
>  
>  # The tarball has some of the patched files as read only, which
> diff --git a/packages/fontconfig/fontconfig_2.6.0.bb
> b/packages/fontconfig/fontconfig_2.6.0.bb index 3f7eca4..d6c1019 100644
> --- a/packages/fontconfig/fontconfig_2.6.0.bb
> +++ b/packages/fontconfig/fontconfig_2.6.0.bb
> @@ -24,7 +24,7 @@ inherit autotools pkgconfig
>  
>  export HASDOCBOOK="no"
>  
> -EXTRA_OECONF = " --disable-docs --with-arch=${HOST_ARCH}"
> +EXTRA_OECONF = " --disable-docs --with-arch=${HOST_ARCH}
> --with-cache-dir=/var/lib/fontconfig" EXTRA_OEMAKE = "FC_LANG=fc-lang
> FC_GLYPHNAME=fc-glyphname" 
>  # The tarball has some of the patched files as read only, which
> 
> regards
> Stefan Schmidt
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 


-- 
------------- Codito, ergo sum - "I code, therefore I am" --------------
The Rasterman (Carsten Haitzler)    raster@rasterman.com



