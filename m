Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1KZNma-00036R-NW
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Aug 2008 12:34:16 +0200
Received: from 79-71-229-11.dynamic.dsl.as9105.com ([79.71.229.11]
	helo=[192.168.2.156])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1KZNkn-0005P1-PF
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Aug 2008 11:32:26 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <48B918C5.5080600@whitby.id.au>
References: <48B90081.30105@whitby.id.au>
	<1220088972.9935.151.camel@lenovo.internal.reciva.com>
	<48B918C5.5080600@whitby.id.au>
Date: Sat, 30 Aug 2008 11:32:56 +0100
Message-Id: <1220092376.9935.168.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.3 
Subject: Re: RFC: When PREFERRED_PROVIDER does not build, don't	try	other alternatives by default
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
X-List-Received-Date: Sat, 30 Aug 2008 10:34:17 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2008-08-30 at 19:24 +0930, Rod Whitby wrote:
> Ah, I forgot to say that the circumstances in which I see this are
> probably coincident with when I invoke bitbake with -k.

Oh right.  Yes, in that case, what you are seeing is expected.  As the
name suggests, PREFERRED_PROVIDER only affects the relative
attractiveness of the different possible providers for a given virtual:
it will not cause bitbake to build a package that wouldn't otherwise
have been considered, nor will it prevent other providers from being
considered if the preferred one is unavailable.  All it does is change
the ordering of bitbake's internal list of build candidates.

So, I think the problem you're seeing is actually unrelated to
PREFERRED_PROVIDER.  It sounds like what you really want is a variant of
"-k" that will cause bitbake to make only one attempt at building a
given virtual (as opposed to trying all the providers in descending
preference order, which is what happens now) but still allow it to
continue with other packages even if that one attempt fails.  That would
be easy enough to add, I imagine, and wouldn't have any compatibility
implications.  Patches welcome! :-)

p.




