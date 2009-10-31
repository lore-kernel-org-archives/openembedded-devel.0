Received: from [206.46.173.3] (helo=vms173003pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1N48ZU-00016a-0S
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Oct 2009 08:40:27 +0100
Received: from gandalf.denix.org ([71.251.63.147]) by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KSD00E71BXG6DE9@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	31 Oct 2009 02:39:16 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0DE8A14AF60; Sat,
	31 Oct 2009 03:39:14 -0400 (EDT)
Date: Sat, 31 Oct 2009 03:39:14 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <ac9c93b10910301032s160461bv2c1ddf5a2a7736ec@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20091031073914.GE16188@denix.org>
MIME-version: 1.0
References: <ac9c93b10910300040v779f8446k31de3dfc2b2fe298@mail.gmail.com>
	<hcf53t$4jp$1@ger.gmane.org>
	<ac9c93b10910301032s160461bv2c1ddf5a2a7736ec@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.3
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: about staging
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
X-List-Received-Date: Sat, 31 Oct 2009 07:40:27 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Fri, Oct 30, 2009 at 06:32:05PM +0100, Frans Meulenbroeks wrote:
> 2009/10/30 Koen Kooi <k.kooi@student.utwente.nl>:
> > On 30-10-09 08:40, Frans Meulenbroeks wrote:
> >>
> >> Hi,
> >>
> >> Yesterday I ended up in a discussion on staging in #oe (ok, ok, =
I
> >> mainly caused the discussion :-) )
> >> Also based upon that I looked at various recipes on how people
> >> implement staging.
> >>
> >> There does not seem to be really standard way.
> >> Some recipes copy from ${S} which ihmo is not desirable; i think=
 it
> >> should be a file that is exported by the application).
> >> Others use other mechanisms.
> >>
> >> For my own recipe I ended up with something like:
> >>
> >> do_stage() {
> >> =A0 =A0 =A0 =A0 install -d ${STAGING_INCDIR}
> >> =A0 =A0 =A0 =A0 install -d ${STAGING_INCDIR}/${PN}
> >> =A0 =A0 =A0 =A0 install -m 0644 ${D}/${includedir}/${PN}/*.h
> >> ${STAGING_INCDIR}/${PN}
> >> }
> >>
> >> as that seems the best. ${D} contans the exported/installed file=
s from
> >> the application. Those files are the ones the application wants =
to
> >> make externally available and those should end up in staging. No=
t
> >> something from ${S}.
> >
> > Is ${D} garanteed to be present at staging time? I don't think we=
 have a
> > current hard rule for that.
>=20
> ${D} =3D install subdir, so in my case it is definitely there.
> but it might be absent in the generic case (e.g. in case of an empt=
y package)
> A solution which automates everything should take that into account
> (if ${D} does not exist: no action))
>=20
> Btw: as a starter I would already be happy with some scripting that
> allows easy copying from ${D} to staging
>=20
> (and I hope you agree with me that copying from ${S} to staging sho=
uld be a no)

Hmm, I guess I missed the discussion on irc, but I don't think the ab=
ove=20
statement is correct. For example, -native packages do have do_stage =
and=20
ususally don't have do_install. Also, staging some files w/o installi=
ng them=20
on the "target" (either the main or -dev package) may be desireable i=
n some=20
cases...

--=20
Denys



