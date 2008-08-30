Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1KZMtn-0005PC-Jy
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Aug 2008 11:37:40 +0200
Received: from 79-71-229-11.dynamic.dsl.as9105.com ([79.71.229.11]
	helo=[192.168.2.156])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1KZMrx-0003n9-To
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Aug 2008 10:35:47 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <48B90081.30105@whitby.id.au>
References: <48B90081.30105@whitby.id.au>
Date: Sat, 30 Aug 2008 10:36:12 +0100
Message-Id: <1220088972.9935.151.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.3 
Subject: Re: RFC: When PREFERRED_PROVIDER does not build, don't try	other alternatives by default
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
X-List-Received-Date: Sat, 30 Aug 2008 09:37:40 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2008-08-30 at 17:40 +0930, Rod Whitby wrote:
> Whenever I build virtual/kernel, and for some reason (perhaps a git
> fetcher problem, or a patch doesn't apply cleanly) it doesn't build,
> bitbake decides to then go and build every other kernel under the sun
> trying to complete virtual/kernel.

It shouldn't be doing that in the first place.  If PREFERRED_PROVIDER is
set and that package is considered statically buildable, bitbake will
try to build it.  If PREFERRED_PROVIDER names a package which is
statically unbuildable, bitbake will proceed as if that variable wasn't
set at all and select one according to its other rules.  In either case,
once it has made its determination, it will try to build that one
package and no other.  If the selected package turns out to be
dynamically unbuildable (which would include the reasons you mentioned
above) then it will stop.

So, it sounds like the behaviour you are experiencing is a bug rather
than a feature.

p.




