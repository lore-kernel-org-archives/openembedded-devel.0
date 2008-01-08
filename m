Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <zecke@selfish.org>) id 1JCJDi-0000So-G8
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jan 2008 19:30:38 +0100
Received: from dsl-62-220-14-162.berlikomm.net ([62.220.14.162]
	helo=abughraib.localdomain) by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1JCJ6w-00061b-L8
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jan 2008 19:23:38 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 8 Jan 2008 19:23:38 +0100
User-Agent: KMail/1.9.6 (enterprise 0.20071204.744707)
References: <47836C9B.3000407@gmx.net> <200801081808.13174.zecke@selfish.org>
	<1199815430.2812.5.camel@hammer.suse.cz>
In-Reply-To: <1199815430.2812.5.camel@hammer.suse.cz>
MIME-Version: 1.0
Message-Id: <200801081923.39086.zecke@selfish.org>
Subject: Re: RFC: add osso version of libtool and libatk
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Jan 2008 18:30:39 -0000
Content-Disposition: inline
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 08 January 2008 19:03:50 Stanislav Brabec wrote:
> If I understand it correctly, it was really intended to only
> re-libtoolize the package with the libtool version supporting maemo.
>
> If it is true, calling libtoolize -f (or autoreconf -f -i) in the recipe
> is a much cleaner solution.

No it is not. Packages using autotools should inherit autotools which is
supposed to call autoreconf --install --force. :)

z.

PS: This is one of the places where OE really shines!


