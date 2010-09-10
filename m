Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Ou8rJ-0000dU-P8
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 21:02:02 +0200
Received: from gandalf.denix.org ([unknown] [71.251.53.61])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L8J00H4AOTXB9VZ@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	10 Sep 2010 14:01:10 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 84D4E14AF64; Fri,
	10 Sep 2010 15:01:09 -0400 (EDT)
Date: Fri, 10 Sep 2010 15:01:09 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <AANLkTimU_Rbj=Kex3Qs-EkZSOLUZmV+pY_0xzt-dZ+Mx@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100910190109.GI28148@denix.org>
MIME-version: 1.0
References: <1283969035-1397-1-git-send-email-chase.maupin@ti.com>
	<AANLkTimU_Rbj=Kex3Qs-EkZSOLUZmV+pY_0xzt-dZ+Mx@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.17
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv2] common_use_cases: add description of SOC_FAMILY
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
X-List-Received-Date: Fri, 10 Sep 2010 19:02:03 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Thu, Sep 09, 2010 at 08:17:07AM +0200, Frans Meulenbroeks wrote:
> 2010/9/8 Chase Maupin <chasemaupin03@gmail.com>:
> > * Added a description of the SOC_FAMILY variable that
> > =A0can be set in the machine configuration files.
> >
> > Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> > ---
> > =A0docs/usermanual/chapters/common_use_cases.xml | =A0 24 +++++++=
+++++++++++++++++
> > =A01 files changed, 24 insertions(+), 0 deletions(-)
> >
> > diff --git a/docs/usermanual/chapters/common_use_cases.xml b/docs=
/usermanual/chapters/common_use_cases.xml
> > index d86d0ca..ef81b95 100644
> > --- a/docs/usermanual/chapters/common_use_cases.xml
> > +++ b/docs/usermanual/chapters/common_use_cases.xml
> > @@ -94,6 +94,30 @@ SRCDATE =3D "20061014"
> > =A0 =A0 =A0 =A0 </listitem>
> > =A0 =A0 =A0 </itemizedlist></para>
> >
> > + =A0 =A0<para>There are also some optional variables that can be=
 defined:
> > + =A0 =A0<itemizedlist>
> > + =A0 =A0<listitem>
> > + =A0 =A0 =A0 =A0 =A0<para><command>SOC_FAMILY</command> describe=
s a family of processors
> > + =A0 =A0 =A0 =A0 =A0 =A0that all share common features such as k=
ernel versions,
> > + =A0 =A0 =A0 =A0 =A0 =A0bootloaders, etc. =A0This is used to all=
ow overrides for a whole
> > + =A0 =A0 =A0 =A0 =A0 =A0set of devices rather than per machine o=
verrides being used.
> > + =A0 =A0 =A0 =A0 =A0 =A0The use of SOC_FAMILY as an override is =
currently a distribution
> > + =A0 =A0 =A0 =A0 =A0 =A0or local setting.
> > + =A0 =A0 =A0 =A0 =A0</para>
> > + =A0 =A0 =A0 =A0 =A0<para>
> > + =A0 =A0 =A0 =A0 =A0 =A0NOTE: SOC_FAMILY is different than MACHI=
NE_CLASS in that
> > + =A0 =A0 =A0 =A0 =A0 =A0MACHINE_CLASS is intended to specify a g=
rouping of devices
> > + =A0 =A0 =A0 =A0 =A0 =A0that may have different processors but s=
hare common features.
> > + =A0 =A0 =A0 =A0 =A0 =A0For example all OMAP3 devices can be des=
cribed using the SOC_FAMILY
> > + =A0 =A0 =A0 =A0 =A0 =A0"omap3" and this value can be used in ov=
errides to prevent
> > + =A0 =A0 =A0 =A0 =A0 =A0requiring multiple machine specific over=
rides. =A0MACHINE_CLASS
> > + =A0 =A0 =A0 =A0 =A0 =A0might be used to describe a class of dev=
ices such as a cell
> > + =A0 =A0 =A0 =A0 =A0 =A0phone in which the processor may be diff=
erent but the
> > + =A0 =A0 =A0 =A0 =A0 =A0features such as touchscreen, GPS, modem=
, etc are the same.
> > + =A0 =A0 =A0 =A0 =A0</para>
> > + =A0 =A0 =A0 =A0</listitem>
> > + =A0 =A0</itemizedlist></para>
> > +
> > =A0 =A0 <para>Next the kernel recipe needs to be added if it does=
n't already exist.
> > =A0 =A0 </para>
> > =A0 </section>
> > --
> > 1.7.0.4
>=20
> Thanks for writing this.
> Seems like a decent description to me.
>=20
> Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

Acked-by: Denys Dmytriyenko <denis@denix.org>

If there are no objections, I'd like to push it later today.

--=20
Denys



