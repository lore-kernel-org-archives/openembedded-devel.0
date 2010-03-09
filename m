Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Np7YI-0000lM-W4
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 23:05:24 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Np7VQ-0006lh-O0 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 14:02:24 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 9 Mar 2010 14:02:24 -0800
Received: from 172.30.33.172 ([172.30.33.172]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Tue,  9 Mar 2010 22:01:38 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	09 Mar 2010 15:01:36 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <18e217241003091349kac343a2u7eb2b2801eae5e70@mail.gmail.com>
References: <18e217241003091006j4ccfd4d6l667710d0f5f26092@mail.gmail.com>
	<1268162140.16526.138.camel@trini-m4400>
	<18e217241003091349kac343a2u7eb2b2801eae5e70@mail.gmail.com>
Organization: Mentor Graphics Corporation
Date: Tue, 09 Mar 2010 15:01:36 -0700
Message-ID: <1268172096.16526.157.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 09 Mar 2010 22:02:24.0535 (UTC)
	FILETIME=[33227A70:01CABFD4]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [patch] build kernel in output dir
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
X-List-Received-Date: Tue, 09 Mar 2010 22:05:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-03-09 at 13:49 -0800, C Michael Sundius wrote:
> >
> > As a concept, yay!  I'd make a few suggestions on implementation
> > however:
> > - B is the normal shorthand for where we build.  See gcc / gdb / etc fo=
r
> > examples of where $B !=3D $S
> > - We should change $B to be something like, from the above example,
> > B=3D"${WORKDIR}/build-${MACHINE}
> > - We should then always work like this, rather than conditionally (sinc=
e
> > a kernel build where O=3D... fails is a bug, this should be fine).
> >
> > Ok thats all good to know, I made a few more changes.
>=20
> Also realizing that some of the staging that I had in my own recipe reall=
y
> belonged in the kernel.bbclass. Though, that staging task is starting to =
get
> pretty messy :[
>=20
> on the bright side, making those changes I think simplifies things even
> more.

On the kernel.bbclass side of things:

Acked-by: Tom Rini <tom_rini@mentor.com>

The stb-linux recipe should be its own patch, should have said that
before, sorry.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


