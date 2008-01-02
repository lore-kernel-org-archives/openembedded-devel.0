Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JA6gc-0002XN-4s
	for openembedded-devel@openembedded.org; Wed, 02 Jan 2008 17:43:22 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m02Gav8h024522
	for <openembedded-devel@openembedded.org>; Wed, 2 Jan 2008 16:36:57 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24460-02 for <openembedded-devel@openembedded.org>;
	Wed,  2 Jan 2008 16:36:53 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m02Gaqxe024513
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Wed, 2 Jan 2008 16:36:52 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <0ced01c84d5a$37ce9520$6e01a8c0@twilight>
References: <0cdd01c84d52$b60de4c0$6e01a8c0@twilight>
	<74d0deb30801020752p51c90f7fuff6d080fcf397e2f@mail.gmail.com>
	<0ced01c84d5a$37ce9520$6e01a8c0@twilight>
Date: Wed, 02 Jan 2008 16:36:51 +0000
Message-Id: <1199291811.4647.42.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: "as" has gone missing.
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
X-List-Received-Date: Wed, 02 Jan 2008 16:43:22 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2008-01-02 at 10:12 -0600, Mike (mwester) wrote:
> "pHilipp Zabel" <philipp.zabel@gmail.com> writes:
> ...
> > > I am need of a clue, if anyone can offer some direction.  Might this be
> as
> > > simple as a configuration option missing when gcc is built (and "as"
> should
> > > be part of the "gcc" package), or is this a case where I'll have to add
> > > support for a separate "as" package to the recipe?
> > >
> > > Thanks,
> > > Mike (~mwester)
> >
> > binutils, binutils-symlinks
> 
> Excellent, that (mostly) works.  So what's missing is the dependency in the
> gcc package.  Does anyone have any particular heartburn if I add a RDEPENDS
> = binutils to the gcc recipe?

Its not strictly an RDEPENDS. You would for example use odcctools+gcc if
you were on arm-darwin (this isn't a hypothetical example). This comes
back to the virtual and RPROVIDER mess I've commented on in the past. 

The thread was "[RFC] Handling of virtual/* namespace in packages" and I
proposed a VIRTUAL-RUNTIME namespace. In this case it would be a:

VIRTUAL_RUNTIME_binutils = "binutils"

and hence:

RDEPENDS = "${VIRTUAL_RUNTIME_binutils}

> (As for "mostly", it works, but there's a mismatch that might be important:
>     $ gcc hello.c
>     /usr/lib/gcc/armeb-linux/4.1.2/../../../../armeb-linux/bin/ld: Warning:
> /tmp/cceIGUyh.o does not support interworking,
>     whereas a.out does

Probably your libc was compiled with thumb interworking and your hello.c
was not. Using the correct gcc flags should remove the warning.

Cheers,

Richard



