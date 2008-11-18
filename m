Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L2YQ0-0003R0-4r
	for openembedded-devel@openembedded.org; Tue, 18 Nov 2008 22:47:32 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L2YNc-0004Fk-4E
	for openembedded-devel@openembedded.org; Tue, 18 Nov 2008 21:45:04 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 18 Nov 2008 21:45:04 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 18 Nov 2008 21:45:04 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 18 Nov 2008 22:44:56 +0100
Message-ID: <gfvd0o$9h1$1@ger.gmane.org>
References: <20081117151909.GG11401@datenfreihafen.org>	<c384c5ea0811171047oa367b5bg25d01e3f50a9592f@mail.gmail.com>
	<20081118210044.GA2528@dodger.lab.datenfreihafen.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081114 Shredder/3.0b1pre
In-Reply-To: <20081118210044.GA2528@dodger.lab.datenfreihafen.org>
Sender: news <news@ger.gmane.org>
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
X-List-Received-Date: Tue, 18 Nov 2008 21:47:32 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18-11-08 22:00, Stefan Schmidt wrote:
> Hello.
>
> On Mon, 2008-11-17 at 19:47, Leon Woestenberg wrote:
>> /var/lib/ looks fine to me.
>
> Luckily fontconfig already has a configure option for the cache dir. Only some
> small EXTRA_OECONF fiddeling was needed.

Does it create the dir at runtime, or do we have to package it?

regards,

Koen

>
> People are fine with this?
>
> diff --git a/packages/fontconfig/fontconfig.inc b/packages/fontconfig/fontconfig.inc
> index 252b843..9af3540 100644
> --- a/packages/fontconfig/fontconfig.inc
> +++ b/packages/fontconfig/fontconfig.inc
> @@ -18,7 +18,7 @@ inherit autotools pkgconfig
>
>   export HASDOCBOOK="no"
>
> -EXTRA_OECONF = " --disable-docs"
> +EXTRA_OECONF = " --disable-docs --with-cache-dir=/var/lib/fontconfig"
>   EXTRA_OEMAKE = "FC_LANG=fc-lang FC_GLYPHNAME=fc-glyphname"
>
>   # The tarball has some of the patched files as read only, which
> diff --git a/packages/fontconfig/fontconfig_2.6.0.bb b/packages/fontconfig/fontconfig_2.6.0.bb
> index 3f7eca4..d6c1019 100644
> --- a/packages/fontconfig/fontconfig_2.6.0.bb
> +++ b/packages/fontconfig/fontconfig_2.6.0.bb
> @@ -24,7 +24,7 @@ inherit autotools pkgconfig
>
>   export HASDOCBOOK="no"
>
> -EXTRA_OECONF = " --disable-docs --with-arch=${HOST_ARCH}"
> +EXTRA_OECONF = " --disable-docs --with-arch=${HOST_ARCH} --with-cache-dir=/var/lib/fontconfig"
>   EXTRA_OEMAKE = "FC_LANG=fc-lang FC_GLYPHNAME=fc-glyphname"
>
>   # The tarball has some of the patched files as read only, which
>
> regards
> Stefan Schmidt




