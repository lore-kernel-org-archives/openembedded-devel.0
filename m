Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1PNtHs-0002Ss-S4
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 21:28:27 +0100
Received: from dlep35.itg.ti.com ([157.170.170.118])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id oB1KR1cQ011770
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 1 Dec 2010 14:27:01 -0600
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep35.itg.ti.com (8.13.7/8.13.7) with ESMTP id oB1KR1PM026052
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 1 Dec 2010 14:27:01 -0600 (CST)
Received: from dlee74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id oB1KR0Ow027937
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 1 Dec 2010 14:27:01 -0600 (CST)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee74.ent.ti.com
	([157.170.170.8]) with mapi; Wed, 1 Dec 2010 14:27:00 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 1 Dec 2010 14:26:59 -0600
Thread-Topic: [oe] [PATCH (v2)] Reverse the order of OVERRIDES
Thread-Index: AcuA9I+EjQC1g1bdRje/jNy7jKVv1QQoVfkQ
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080329CC199B@dlee06.ent.ti.com>
References: <1287113787-21268-1-git-send-email-kergoth@gmail.com>
	<1287157281-31597-1-git-send-email-kergoth@gmail.com>
	<i9aai3$tmj$1@dough.gmane.org>
	<AANLkTimuTVEWPsZT=hx+fuLLHKtVVrVzud0xq5R_TSEO@mail.gmail.com>
	<1289399216.1272.415.camel@rex> <4CDAC864.7050803@mentor.com>
In-Reply-To: <4CDAC864.7050803@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.94.94.40
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH (v2)] Reverse the order of OVERRIDES
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
X-List-Received-Date: Wed, 01 Dec 2010 20:28:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Tom Rini
> Sent: Wednesday, November 10, 2010 10:29 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH (v2)] Reverse the order of OVERRIDES
>=20
> Richard Purdie wrote:
> > On Fri, 2010-10-15 at 12:44 -0700, Chris Larson wrote:
> >> On Fri, Oct 15, 2010 at 12:37 PM, Koen Kooi
> <k.kooi@student.utwente.nl>wrote:
> >>
> >>> -----BEGIN PGP SIGNED MESSAGE-----
> >>> Hash: SHA1
> >>>
> >>> On 15-10-10 17:41, Chris Larson wrote:
> >>>> From: Chris Larson <chris_larson@mentor.com>
> >>>>
> >>>> Given the current implementation of OVERRIDES in bitbake, the
> variable is
> >>>> expected to contain elements in the order least specific to most
> >>> specific,
> >>>> however, our current usage of it does not match that.  As one exampl=
e,
> >>> "local"
> >>>> is supposed to always be the most specific override, yet currently
> it's
> >>> the
> >>>> least specific.  As another example, currently the target
> architecture is
> >>> seen
> >>>> as more specific than the machine, which is also clearly wrong.
> >>>>
> >>>> Big thanks to Chase Maupin for investigating and identifying this
> long
> >>>> standing issue.
> >>>>
> >>>> It becomes clear that a reversal of the current value will bring us
> to a
> >>> more
> >>>> sane behavior, and avoids the need for the dual overrides hack
> mentioned
> >>> in
> >>>> the comments, so this implements this reversal, and drops the
> unnecessary
> >>> and
> >>>> confusing comments.
> >>>>
> >>>> This also introduces a MACHINE_OVERRIDES variable as a generic
> mechanism
> >>> to
> >>>> inject overrides elements which are more specific than the distro bu=
t
> >>> less
> >>>> specific than the machine, which is where things like MACHINE_CLASS
> or
> >>>> SOC_FAMILY or the like would go.  This variable is *space* separated=
,
> to
> >>> make
> >>>> it easier and more convenient to assemble the variable incrementally=
.
> >>>>
> >>>> Reported-by: Chase Maupin <chase.maupin@ti.com>
> >>>> Signed-off-by: Chris Larson <chris_larson@mentor.com>
> >>> Acked-by: Koen Kooi <k-kooi@ti.com>
> >>>
> >> This is now in master -- thanks to all for the acks, review, comments =
-
> - let
> >> me know if any problems result from this.
> >
> > You do realise the damage this potentially causes for compatibility of
> > metadata between OE and Poky?
> >
> > This change is pretty serious and potentially alters the handling of an=
y
> > double override. Poky uses them a bit more extensively than OE does. It=
s
> > effectively an architecture change to OE yet no discussion was had at
> > any TSC meeting :(.
> >
> > I even asked about this a while back and was *told* that "local" was
> > meant to be weak, I therefore added a strong version to Poky, in the
> > spirit of maintaining compatibility.
> >
>=20
> (a) Eeep! and (b) That's pretty much the opposite of what the rest of
> the thread / discussion was, which is to say "local is supposed to be
> the final winner, why isn't it?"
>=20
> Now... what do we do here?

I know this was all posted a while back.  Has there been any resolution on =
this?  I didn't notice any additional responses to this thread.

>=20
> --
> Tom Rini
> Mentor Graphics Corporation
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


