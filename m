Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1LXg8Q-00086O-7Z
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Feb 2009 19:18:02 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1LXff8-0008Tg-VS; Thu, 12 Feb 2009 17:47:48 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>)
	id 1LXff8-0002ow-1x; Thu, 12 Feb 2009 17:47:46 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1234456715-23618-4-git-send-email-otavio@ossystems.com.br>
References: <1234456715-23618-1-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-2-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-3-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-4-git-send-email-otavio@ossystems.com.br>
Date: Thu, 12 Feb 2009 17:47:45 +0000
Message-Id: <1234460865.3592.2.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH 3/6] package.bbclass, package_ipk.bbclass: add	dynamic depends on locale packages (ipk specific)
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
X-List-Received-Date: Thu, 12 Feb 2009 18:18:02 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-02-12 at 14:38 -0200, Otavio Salvador wrote:
> +
> +		if pkgname.find('-locale-') == -1:
> +			rdepends.append('%s-locale*' % pkgname)
> +

This looks like it will add locale dependencies to all the subpackages
(e.g. foo-doc, foo-dev and the like) as well as the main "foo" package,
which is a bit different to how the old code used to work.  But I guess
that's harmless enough: the worst effect will be to bloat the Packages
file a bit, and I doubt anybody will care too much.  So, thumbs up from
me.

p.




