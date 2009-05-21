Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1M7AbQ-00008A-Mi
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 17:54:41 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1M7AU4-0002id-7g
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 16:47:04 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1M7AU4-0006Vo-2Y
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 16:47:04 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1242912094-26435-1-git-send-email-ihar.hrachyshka@gmail.com>
References: <1242912094-26435-1-git-send-email-ihar.hrachyshka@gmail.com>
Date: Thu, 21 May 2009 16:47:03 +0100
Message-Id: <1242920823.9080.330.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [PATCH] gst-plugins: fixed pattern for meta package	dependencies.
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
X-List-Received-Date: Thu, 21 May 2009 15:54:47 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

>  	for pkg in packages[1:]:
> -		if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.count('dev') and not pkg.count( 'locale' ):
> +		if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-locale'):
>  			metapkg_rdepends.append(pkg)
>  	bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
>  	bb.data.setVar('DESCRIPTION_' + metapkg, pn + ' meta package', d)

This kind of matching on the package name is a bit unwholesome in
general.  It would be better to handle these excluded packages by
maintaining them in the blacklist at the point where they're actually
created, rather than trying to recreate that information again after the
fact.

For the -dev ones, that's easy: you can just add a hook function that
operates on the local blacklist variable.  For the locale things it
might be slightly more complicated since that logic is in
package.bbclass, but I think it should still be relatively
straightforward to get it to expose a list of the locale packages that
it's generated.

p.




