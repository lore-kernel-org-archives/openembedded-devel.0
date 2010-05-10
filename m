Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OBWKY-0008NL-UU
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 May 2010 19:00:02 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OBWGn-0005Ot-F8 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 May 2010 09:55:53 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 10 May 2010 09:55:52 -0700
Received: from 172.30.80.82 ([172.30.80.82]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Mon, 10 May 2010 16:55:51 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	10 May 2010 09:55:51 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4BE81DE7.90609@dresearch.de>
References: <4BE13C20.1010902@dresearch.de>  <4BE81DE7.90609@dresearch.de>
Organization: Mentor Graphics Corporation
Date: Mon, 10 May 2010 09:55:50 -0700
Message-ID: <1273510550.22943.298.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 10 May 2010 16:55:52.0926 (UTC)
	FILETIME=[A67E27E0:01CAF061]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Kernel Headers Quality Issue (was: linux vs. linux-libc-headers?)
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
X-List-Received-Date: Mon, 10 May 2010 17:00:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2010-05-10 at 16:53 +0200, Thilo Fromm wrote:
> Hello Guys,
>=20
> this is a somewhat cumulated response - I'd like to address some of the=20
> things mentioned at different points in the discussion in one place.=20
> Please forgive me should I misquote things.
>=20
>=20
>=20
> Graeme Gregory in <20100505094242.GF2444@xora-desktop.xora.org.uk>:
>=20
> [Steffen Sledz]
>  > > It seem's not to be possible to use DEFAULT_PREFERENCE_hipox in the
>  > > linux-libc-headers recipes. So what's the right way to handle this?
>  > > Something like PREFERRED_VERSION_linux-libc-headers_hipox =3D "2.6.2=
4"
>  > > in angstrom-2008.1.conf?
>  >
> [Graeme Gregory]
>  > I thought glibc was supposed to gracefully fall back on missing
>  > syscalls?
>=20
> Glibc is compiled against 2.6.31 headers, which is one of our main=20
> issues here. It only ever *runs* with a 2.6.24 kernel on the target=20
> system, though. So it cannot know about missing syscalls until runtime.

So, I think some of the confusion here stems from confusion about (and I
don't know the right answer off-hand) how glibc handles the
--with-kernel=3DVERSION stuff.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


