Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Np5ls-0001i3-Ga
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 21:11:20 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Np5j0-00027M-Es from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 12:08:18 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 9 Mar 2010 12:08:17 -0800
Received: from 172.30.33.172 ([172.30.33.172]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Tue,  9 Mar 2010 20:07:31 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	09 Mar 2010 13:07:29 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1268134848.32439.12.camel@hydra>
References: <1268134848.32439.12.camel@hydra>
Organization: Mentor Graphics Corporation
Date: Tue, 09 Mar 2010 13:07:29 -0700
Message-ID: <1268165249.16526.156.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 09 Mar 2010 20:08:17.0842 (UTC)
	FILETIME=[42300920:01CABFC4]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Issue with (gcc-cross-|glibc-)initial and packaged staging
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
X-List-Received-Date: Tue, 09 Mar 2010 20:11:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-03-09 at 11:40 +0000, Thomas Horsten wrote:
> I've spotted a rather annoying interim build failure but I'm not sure
> how to best tackle the situation.
>=20
> For example, gcc-cross-initial and gcc-cross install some of the same
> files in staging. Normally this doesn't matter, since gcc-cross
> overwrites the earlier ones installed by -initial, but when using
> packaged staging and many threads (BBTHREADS=3D10 for example), it
> sometimes happens that the pstaging packages for gcc-cross-initial and
> gcc-cross get installed into staging in the wrong order (or at the same
> time in two different threads), resulting in all builds after that
> failing due to undefined references in the lib files from -initial.

So, my guess is that what happens is that when we copy the stamps from
the pstage package over to the live stamps directory to check them,
another thread comes along and sees they're in and we get out of order.
Can you try something like (pastebin'd to avoid patchwork doing
something silly):
http://pastebin.com/rCijESQ8

This is possibly not ideal, but as I comment there, grab the lock for
staging before we copy stamps in (and release it if there's problems).
But this should fix the problem, yes?  If gcc-cross-initial thread is
going and the gcc-cross thread fires, it'll be stuck waiting for
gcc-initial to finish up fully.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


