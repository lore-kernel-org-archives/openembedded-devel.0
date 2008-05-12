Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1JvUCl-0001sb-5X
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 May 2008 11:20:23 +0200
Received: from xora.org.uk ([::ffff:78.86.128.56])
	(AUTH: LOGIN dp, SSL: TLSv1/SSLv3,128bits,AES128-SHA)
	by xora.org.uk with esmtp; Mon, 12 May 2008 10:19:09 +0100
	id 0008455C.48280B8D.00000A0F
Date: Mon, 12 May 2008 10:20:07 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080512092007.GC3841@cimmeria.hyboria>
References: <20080512001723.81DEF1892C6@amethyst.openembedded.net>
Mime-Version: 1.0
In-Reply-To: <20080512001723.81DEF1892C6@amethyst.openembedded.net>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
Subject: Re: [oe-commits] org.oe.dev autotools.bbclass: from OM. Needed as	commit 85a5e185b6a21e42e4243ad17befe40373025e0e alone will break	uclibc/gettext builds.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Mon, 12 May 2008 09:20:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, May 12, 2008 at 02:17:23AM +0200, likewise commit wrote:
> autotools.bbclass: from OM. Needed as commit 85a5e185b6a21e42e4243ad17befe40373025e0e alone will break uclibc/gettext builds.
> 
I was specifically asked not to merge this from OM to OE until more
investigation was carried out.

> -		cp -fpPR "$from"/* "$to"
> +		cp -fpPR -t "$to" "$from"/*
>  
Isnt this a reverse diff of a previous change for no real reason?

> -				echo "oe_libinstall -C ${S} -so $(basename $i .la) ${STAGING_LIBDIR}/${dir}"
> -				oe_libinstall -C ${S} -so $(basename $i .la) ${STAGING_LIBDIR}/${dir}
> +				echo "oe_libinstall -C ${STAGE_TEMP}/${libdir}/${dir} -so $(basename $i .la) ${STAGING_LIBDIR}/${dir}"
> +				oe_libinstall -C ${STAGE_TEMP}/${libdir}/${dir} -so $(basename $i .la) ${STAGING_LIBDIR}/${dir}

And this section was under discussion with Holger, RP and myself.

I dont think this commit should have gone in without discussion.

Graeme



