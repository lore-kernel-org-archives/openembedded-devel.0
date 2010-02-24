Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Nk7f5-00082a-Ec
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Feb 2010 04:11:46 +0100
Received: from gandalf.denix.org ([unknown] [71.251.51.225])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KYB00MSTSQ9JBK2@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	23 Feb 2010 21:08:45 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 21B4B14AF60; Tue,
	23 Feb 2010 22:08:33 -0500 (EST)
Date: Tue, 23 Feb 2010 22:08:33 -0500
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <19c1b8a91002231833v44b6ce07r22f9ea33c073f8dd@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100224030833.GD27420@denix.org>
MIME-version: 1.0
References: <mailman.5.1266922802.8892.openembedded-devel@lists.openembedded.org>
	<4B83DD5C.8050408@tycoelectronics.com> <4B8458A7.40807@balister.org>
	<19c1b8a91002231509v4a7d870dia190e9aa2c0f6739@mail.gmail.com>
	<4B847891.7030706@balister.org>
	<1266973598.18176.366.camel@trini-m4400>
	<19c1b8a91002231833v44b6ce07r22f9ea33c073f8dd@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.1
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: How to build g++ to run on target?
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
X-List-Received-Date: Wed, 24 Feb 2010 03:11:46 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Tue, Feb 23, 2010 at 06:33:43PM -0800, Khem Raj wrote:
> On Tue, Feb 23, 2010 at 5:06 PM, Tom Rini <tom_rini@mentor.com> wro=
te:
> > On Tue, 2010-02-23 at 16:53 -0800, Philip Balister wrote:
> >>
> >> On 02/23/2010 03:09 PM, Khem Raj wrote:
> >> > On Tue, Feb 23, 2010 at 2:37 PM, Philip Balister<philip@balist=
er.org> =A0wrote:
> >> >> On 02/23/2010 05:51 AM, Jay Snyder wrote:
> >> >>>
> >> >>> I was able to build gcc for installation directly onto the O=
E target
> >> >>> with "bitbake gcc". "bitbake g++" gives me "nothing provides=
 g++".
> >> >>>
> >> >>> What is the magic bitbake command to provide this?
> >> >>
> >> >> bitbake task-sdk-native, and install task-native-sdk. Anyone =
know why the
> >> >> task creates a package with different name?
> >> >
> >> > may be because
> >> >
> >> > task-sdk-native.bb:RPROVIDES_${PN} =3D "task-native-sdk"
> >>
> >> I know that :) I am curious why the renaming.
> >
> > And if perhaps we couldn't get a different name altogether? =A0'n=
ative'
> > has a meaning normally that's not what it means here.
> > task-on-device-sdk is a bit wordy, but avoids 'native'. =A0Of cou=
rse,
> > 'native development' also has a meaning too.. RPROVIDES perhaps? =
=A0Or is
> > that just the worst of both worlds..
>=20
> yeah thats a good point. although native is not as bad but in conte=
xt
> of OE we already
> assigned native to something that this task does not do. So using s=
omething like
> what you suggest or task-target-sdk would be nice.

Speaking of which, a collegue of mine was suggesting exactly the oppo=
site -=20
"native" should be used exactly for this type of naming, when it's na=
tive=20
development (regardless of whether it's on a target or on a host), an=
d OE's=20
use of "native" is wrong and should be "host" instead, i.e. "pkgname-=
host" :)
I know it's a historical naming and cannot be changed easily...


> to answer the original question I think RDEPEND was added for fixin=
g
> upgrade channels on existing systems.



