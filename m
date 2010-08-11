Received: from vms173009pub.verizon.net ([206.46.173.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Oj0Lc-0007Au-DE
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Aug 2010 03:43:18 +0200
Received: from gandalf.denix.org ([unknown] [71.251.53.61])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L6Y00MLWSRAE5I0@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	10 Aug 2010 20:42:51 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0366D14AF64; Tue,
	10 Aug 2010 21:42:45 -0400 (EDT)
Date: Tue, 10 Aug 2010 21:42:45 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <AANLkTinkuGZVYFHL7N6GwM5BftTr-+L4BP7-jwsRZzqL@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100811014245.GF7189@denix.org>
MIME-version: 1.0
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E82@deimsg40.de.net.world>
	<AANLkTinK5O3F25QJ40B8+rt5M57BKwWVOYytUEZqvP-D@mail.gmail.com>
	<AANLkTikjcrh78MDsSbdALEWbZGHU7nwrk14FQFiU=ynA@mail.gmail.com>
	<AANLkTimbjUYY22nf59gPAw-Xm05mMLNdDA61Ydc63DFs@mail.gmail.com>
	<i3se2n$gj7$1@dough.gmane.org>
	<AANLkTikUdG4hRo1wJmObU1g5fomeuViCirSBsVFCEYYZ@mail.gmail.com>
	<AANLkTinkuGZVYFHL7N6GwM5BftTr-+L4BP7-jwsRZzqL@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.9
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Why PREFERRED_VERSION setting of <distro>.conf overrules	local.conf setting ?
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
X-List-Received-Date: Wed, 11 Aug 2010 01:43:18 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Wed, Aug 11, 2010 at 09:14:41AM +0930, Graham Gower wrote:
> On 11 August 2010 06:26, Chris Larson <clarson@kergoth.com> wrote:
> > On Tue, Aug 10, 2010 at 1:50 PM, Koen Kooi <k.kooi@student.utwent=
e.nl>wrote:
> >> What's the point of setting a preferred version at all if you ma=
ke it a
> >> weak assignment?
> >> The distro nearly always knows better and if you want to use a d=
ifferent
> >> version, sending a patch to change that version for review isn't=
 exactly
> >> rocket science.
> >
> >
> > How about having decent usability? =A0The user asking for somethi=
ng and not
> > getting it is completely unintuitive. =A0If the user doesn't know=
 what they
> > want, they won't request a specific version. =A0If they do reques=
t it, they
> > should get it, anything else is an OE usability issue.
>=20
> Precisely. The user shouldn't have to understand the details of
> parsing order, weak assignments, etc. in order to write a local.con=
f
> which works for them.

Yeah, and then distro maintainers are blamed for the breakage when us=
ers unpin=20
and change specific dependency for a package.

It's not just the parsing order problem. It's not clear for users tha=
t if they=20
change anything in local.conf, it can break. I.e. you break it - you =
fix it.

--=20
Denys



