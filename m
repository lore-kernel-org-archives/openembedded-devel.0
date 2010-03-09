Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Np4x6-0007KV-Lv
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 20:18:49 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Np4uE-0002oO-VD from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 11:15:50 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 9 Mar 2010 11:15:50 -0800
Received: from 172.30.33.172 ([172.30.33.172]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Tue,  9 Mar 2010 19:15:42 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	09 Mar 2010 12:15:40 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <18e217241003091006j4ccfd4d6l667710d0f5f26092@mail.gmail.com>
References: <18e217241003091006j4ccfd4d6l667710d0f5f26092@mail.gmail.com>
Organization: Mentor Graphics Corporation
Date: Tue, 09 Mar 2010 12:15:40 -0700
Message-ID: <1268162140.16526.138.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 09 Mar 2010 19:15:50.0376 (UTC)
	FILETIME=[EE26D680:01CABFBC]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL,BAYES_00 autolearn=ham
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
X-List-Received-Date: Tue, 09 Mar 2010 19:18:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-03-09 at 10:06 -0800, C Michael Sundius wrote:
> We build our kernel in an output directory so that the objects don't
> muck up our source directory. We do this since during development,
> most engineers just set up a link to their SCM Project directory
> containing the source rather than having bitbake copy all the files
> in to the ${S} directory.
>=20
> I made some mods to the kernel.bbclass to allow us to build in the
> out directory and included it here in the attached patch (along w/ our
> own recipe for building the kernel). These mods *should* allow other
> kernel recipes to build unchanged.
>=20
> I'd love to get comments on this, understanding that:
> 1) there might be a better way someone else is already using
> 2) that I've screwed stuff up
> 3) something else.
>=20
> I'd also love to see this get pushed upstream if others find it useful..

As a concept, yay!  I'd make a few suggestions on implementation
however:
- B is the normal shorthand for where we build.  See gcc / gdb / etc for
examples of where $B !=3D $S
- We should change $B to be something like, from the above example,
B=3D"${WORKDIR}/build-${MACHINE}
- We should then always work like this, rather than conditionally (since
a kernel build where O=3D... fails is a bug, this should be fine).

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


