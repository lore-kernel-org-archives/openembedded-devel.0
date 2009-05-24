Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1M8Jym-0005k1-Qk
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 May 2009 22:07:32 +0200
Received: from 88-109-34-80.dynamic.dsl.as9105.com ([88.109.34.80]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1M8Jr7-0006yX-Ja
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 May 2009 20:59:37 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <fce2a370905241137s75e9e58ds6ab8a12f36389549@mail.gmail.com>
References: <1242912094-26435-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1242920823.9080.330.camel@mill.internal.reciva.com>
	<1242920910.9080.332.camel@mill.internal.reciva.com>
	<fce2a370905241137s75e9e58ds6ab8a12f36389549@mail.gmail.com>
Date: Sun, 24 May 2009 20:59:36 +0100
Message-Id: <1243195176.4869.12.camel@lenovo.internal.reciva.com>
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
X-List-Received-Date: Sun, 24 May 2009 20:07:33 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-05-24 at 21:37 +0300, Ihar Hrachyshka wrote:
> On Thu, May 21, 2009 at 6:48 PM, Phil Blundell <pb@reciva.com> wrote:
> > On Thu, 2009-05-21 at 16:47 +0100, Phil Blundell wrote:
> >> This kind of matching on the package name is a bit unwholesome in
> >> general.  It would be better to handle these excluded packages by
> >> maintaining them in the blacklist at the point where they're actually
> >> created, rather than trying to recreate that information again after the
> >> fact.
> >
> > Or, actually, in this specific case, just maintain a positive list of
> > the plugin packages that you _do_ want the metapackage to depend on, and
> > make it depend on those packages alone rather than starting from
> > ${PACKAGES} and filtering things out.
> 
> I think -meta package should depend on *all* the plugins. That's what
> -meta is made for. I think it's not very efficient to test every new
> gst-plugins-* release if there are any new or obsolete plugins there.

Yes, indeed, clearly -meta should depend on all the plugins: as you say,
that's exactly what it's for.  The point I was making was that, rather
than starting with ${PACKAGES} (i.e. all the subpackages) and trying to
find suitable heuristics to take out the things that aren't plugins, you
would be better off just computing a list of packages that _are_ plugins
and using that directly.

p.




