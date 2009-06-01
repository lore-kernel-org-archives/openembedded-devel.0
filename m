Received: from [192.94.94.40] (helo=arroyo.ext.ti.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin@ti.com>) id 1MBFq0-0003DD-Ul
	for openembedded-devel@openembedded.org; Tue, 02 Jun 2009 00:18:37 +0200
Received: from dlep35.itg.ti.com ([157.170.170.118])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id n51M9jBC003388
	for <openembedded-devel@openembedded.org>;
	Mon, 1 Jun 2009 17:09:50 -0500
Received: from dlep20.itg.ti.com (localhost [127.0.0.1])
	by dlep35.itg.ti.com (8.13.7/8.13.7) with ESMTP id n51M9i5P001126
	for <openembedded-devel@openembedded.org>;
	Mon, 1 Jun 2009 17:09:44 -0500 (CDT)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep20.itg.ti.com (8.12.11/8.12.11) with ESMTP id n51M9imX025438
	for <openembedded-devel@openembedded.org>;
	Mon, 1 Jun 2009 17:09:44 -0500 (CDT)
Received: from dlee02.ent.ti.com ([157.170.170.17]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Mon, 1 Jun 2009 17:09:44 -0500
From: "Ambrose, Martin" <martin@ti.com>
To: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
Date: Mon, 1 Jun 2009 17:09:44 -0500
Thread-Topic: [oe] Force clean of dependencies
Thread-Index: AcncrXfl/XwMyjUZQjqndzQlGOcYMQGV6wEA
Message-ID: <A24693684029E5489D1D202277BE894440C59C4D@dlee02.ent.ti.com>
References: <A24693684029E5489D1D202277BE8944404C82BA@dlee02.ent.ti.com>
	<gv6j7v$hkq$2@ger.gmane.org>
	<A24693684029E5489D1D202277BE8944404C850E@dlee02.ent.ti.com>
	<gv6to9$iev$2@ger.gmane.org> <20090524201917.GB1445@denix.org>
In-Reply-To: <20090524201917.GB1445@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: Force clean of dependencies
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
X-List-Received-Date: Mon, 01 Jun 2009 22:18:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On Sun, May 24, 2009 at 15:19:17, Denys Dmytriyenko wrote:

> > On 22-05-09 20:30, Ambrose, Martin wrote:
> >> On Fri, May 22, 2009 at 11:18:07, Koen Kooi wrote:
> >>
> >>>> I have searched this list and googled but can't find a way
> >>>> to force a clean of
> >>>> a package's dependencies.
> >>>
> >>> BB_STAMP_POLICY =3D "whitelist"?
> >>
> >> Thanks for the suggestion but it doesn't seem to work for me.
> >> Looking at the mplayer recipe, e.g, the DEPENDS list=20
> includes freetype.
> >> So my hope is that the latter 'ls' command in the=20
> following sequence
> >> would be empty but it  is not.
> >>
> >> $ ls work/armv5te-none-linux-gnueabi | grep freetype
> >> freetype-2.3.6-r0
> >>
> >> $ BB_STAMP_POLICY=3D"whitelist" bitbake mplayer -c clean
> >
> > Is BB_STAMP_POLICY in BB_ENV_*WHITE for you? If not, you=20
> need to set it in=20
> > local.conf.
>=20
> I believe Martin has BB_PRESERVE_ENV=3D1 set, which is default=20
> in Arago for now.

Yes. The comment above this setting indicates that the whitelist
feature is broken for now.
=20
> > Also, BB_STAMP_POLICY works in the other direction, it will=20
> invalidate=20
> > mplayer if you touch freetype.

Is there a variable setting which forces cleaning of dependencies?

FWIW I found this link but haven't tried yet which uses a script,
outside of bitbake, to parse the package for dependencies and cleans
them as instructed.
http://www.uv-ac.de/openembedded/openembedded-6.html#ss6.2


Regards,=20
Martin


