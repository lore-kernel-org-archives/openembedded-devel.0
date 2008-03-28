Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JfBxN-000860-K7
	for openembedded-devel@openembedded.org; Fri, 28 Mar 2008 11:37:09 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2SAb9Yc012773;
	Fri, 28 Mar 2008 10:37:09 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12352-09; Fri, 28 Mar 2008 10:37:04 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2SAb1dM012766
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 28 Mar 2008 10:37:01 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Stanislav Brabec <utx@penguin.cz>
In-Reply-To: <1206699605.18251.39.camel@hammer.suse.cz>
References: <20080328011211.7c66e00b@zaurus>
	<1206696274.5029.14.camel@dax.rpnet.com>
	<1206699605.18251.39.camel@hammer.suse.cz>
Date: Fri, 28 Mar 2008 10:37:01 +0000
Message-Id: <1206700621.5029.50.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	m2SAb9Yc012773
Cc: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
Subject: Re: binconfig.bbclass breaks packages QA
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
X-List-Received-Date: Fri, 28 Mar 2008 10:37:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, 2008-03-28 at 11:20 +0100, Stanislav Brabec wrote:
> | CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/free=
type2
> | cc1: internal compiler error: in add_path, at c-incpath.c:371
>=20
> We may want -isysroot instead of -isystem (and report bug above to gcc
> developers, as the report advices), but only for cross builds.

This error is from a patch we add into gcc. It causes it to error if it
ever sees -I/usr/include. This is good since that breaks things badly.

> Exactly, we may want to set CFLAGS to -isysroot=3D (to root to target
> system) and HOST_CFLAGS to -isystem=3D (to make visible our native stag=
ing
> system) for cross builds and =EF=BB=BFCFLAGS to -isystem=3D for native =
builds.
> Maybe even more.

I don't think you understand the way sysroot works properly. It changes
the way gcc works internally, it looks in the sysroot instead
of /usr/include. It does not mangle paths passed in externally though.

> > The problem is that package b
> > should not be injecting the results from binconfig directly into a .p=
c
> > file, it should be using things like -L${libdir}/foo, not
> > -L/some/hardcoded/path.
>=20
> No, in this case it is correct (at least from upstream aspect of view).
> Application may never know, that ${prefix} of the foo-config is equal t=
o
> ${prefix} of me. So it has to trust, that foo-config application
> provided correct cflags.

The key point is "from upstream aspect of view" which doesn't consider
cross compiling. The flags are correct for passing to gcc. The flags are
not correct for the way we're using pkgconfig unfortunately.

I've had a quick look and the problem is from cups which doesn't have
a .pc file. The two solutions that spring to mind are:

1. Add a .pc file to cups and have libgnomecups use it
2. Add some sed to the libgnomecups recipe to fix the bad paths after
the compile completes.

> I just tried to disable mangling and rebuilt from scratch.
>=20
> I got QA error:
> ERROR: Task 2095 (/OE/org.openembedded.dev/packages/fontconfig/fontconf=
ig_2.4.1.bb, do_qa_configure) failed

That doesn't surprise me as we need that mangling. The problem is when
it leaks into the .pc space which we've cleaned up. I think everyone
would agree the .pc situation is much nicer than it used to be, we just
need to fix the relatively small number of corner cases where "bad" data
is leaking in and this is one of them.
=EF=BB=BF
> So I disabled the QA check, and I got above mentioned internal compiler=
 error.

Again, totally expected. We should never be calling the cross compiler
with -I/usr/include and since you removed the mangling it would start
doing that.

Cheers,

Richard



