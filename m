Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>)
	id 1KW5A9-0005yA-4d; Thu, 21 Aug 2008 10:04:59 +0200
Received: from 88-111-45-211.dynamic.dsl.as9105.com ([88.111.45.211]
	helo=[192.168.2.156])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1KW573-0007uZ-Tv; Thu, 21 Aug 2008 09:01:56 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <g8i648$tfh$1@ger.gmane.org>
References: <19c1b8a90808200142y33c5baa3uee2398d7f87b4cc6@mail.gmail.com>
	<g8gmvc$cob$1@ger.gmane.org>
	<19c1b8a90808200902i4a0d448chfcd591a708717177@mail.gmail.com>
	<g8i648$tfh$1@ger.gmane.org>
Date: Thu, 21 Aug 2008 09:01:46 +0100
Message-Id: <1219305706.9935.27.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.3 
Cc: openembedded-devel@openembedded.org
Subject: Re: uclibc and uclibc-locale support in gcc 4.3.1
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
X-List-Received-Date: Thu, 21 Aug 2008 08:05:04 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-08-21 at 00:33 +0200, Koen Kooi wrote:
> Khem Raj wrote:
> > Hi Koen
> >
> > Thanks for looking at it. While I see that what you mention is
> > logical. The construct I have worked ok on uclibc and eglibc angstrom
> > builds. But I will change to what you suggested and do builds again.
> 
> I suspect we've hit a feature of bitbake again:
> 
> FOO = "bar"
> FOO_xyz ?= "baz"
> 
> => FOO is now baz
> 
> FOO_xyz = "bar"
> FOO_xyz ?= "baz"
> 
> => FOO is now bar
> 
> I still think this is a bug and depending on it would not be a good idea :)

I'm not exactly clear on what you think is a bug.  You're right that the
above sequence of assignments would result in FOO = "bar", irrespective
of whether xyz is in OVERRIDES or not, but I can't see any obvious way
in which this behaviour deviates from either what's expected or what's
documented in the manual.

The important thing to remember about how bitbake processes these
assignments is that, at the parser level, a line like 'FOO_xyz = "bar"'
is no different from any other variable assignment: it literally does
create a variable called FOO_xyz and give it the value bar.  At this
stage there is no linkage between FOO_xyz and FOO.  In the same way,
FOO_${PN} and FOO_xyz are distinct variables, even if it happens to be
true that PN = xyz.

So, an operation like FOO_xyz ?= "baz" does not mean "set FOO to baz if
xyz is true and FOO is previously unset".  It simply means "set FOO_xyz
to baz if FOO_xyz was previously unset": again, there is no
consideration of the state of FOO or any other variable.

All the overrides are processed in one block once the entire file has
been parsed.  This is the reason that the ordering between the
assignments to FOO_xyz and FOO is unimportant: the only thing that the
override processor cares about is the state of the metadata at the end
of parsing, not any intermediate state that it might have been in
earlier.  At this point, if the expansion of OVERRIDES includes "xyz",
the override processor will collapse FOO_xyz into FOO, overwriting the
value of the latter with the value of the former.  This operation is
independent of the strong/weak status of any previous assignments to
those variables.

p.




