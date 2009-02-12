Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>)
	id 1LXkHz-0006PQ-Bq; Thu, 12 Feb 2009 23:44:12 +0100
Received: from 79-79-208-205.dynamic.dsl.as9105.com ([79.79.208.205]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1LXkGV-0004Ho-Ms; Thu, 12 Feb 2009 22:42:42 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <49946CA4.6060303@dls.net>
References: <1234456715-23618-1-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-2-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-3-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-4-git-send-email-otavio@ossystems.com.br>
	<1234460865.3592.2.camel@mill.internal.reciva.com>
	<49946CA4.6060303@dls.net>
Date: Thu, 12 Feb 2009 22:42:24 +0000
Message-Id: <1234478544.4890.404.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH 3/6] package.bbclass, package_ipk.bbclass:	add	dynamic depends on locale packages (ipk	specific)
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
X-List-Received-Date: Thu, 12 Feb 2009 22:44:12 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-02-12 at 12:38 -0600, Mike (mwester) wrote:
> Phil Blundell wrote:
> > This looks like it will add locale dependencies to all the subpackages
> > (e.g. foo-doc, foo-dev and the like) as well as the main "foo" package,
> > which is a bit different to how the old code used to work.  But I guess
> > that's harmless enough: the worst effect will be to bloat the Packages
> > file a bit, and I doubt anybody will care too much.  So, thumbs up from
> > me.
> 
> How much bloat? 

For a source package "foo", you'd be talking about adding one copy of
the literal string "foo-locale-*" to the Depends line for each of its
subpackages (foo-doc, foo-dev, foo-dbg and the like).  The exact amount
obviously depends on the length of the package name, but I guess you
could call it about 16 bytes per binary package as a rough
approximation.

Exactly what the real-world impact of that would be will depend on your
distro policy.  If you already strip out the -dev and -doc packages from
the main Packages feed then obviously the impact will be virtually nil
because most of the affected packages won't be there in the first place.
At the other extreme, if your Packages files currently contain
everything from the control data (including Source:, Description: and so
on) then they are probably so huge already that another sixteen bytes
per package is negligible in percentage terms.

If those 16*n bytes did turn out to cause a problem for someone then it
probably wouldn't be that hard to reinstate the original behaviour of
only adding this dependency on the primary binary.

p.




