Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Ok1mk-0002Dx-RH for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 23:27:32 +0200
Received: from g225083123.adsl.alicedsl.de ([92.225.83.123]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Ok1mY-0003t7-PU for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 21:27:18 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.LNX.2.00.1008132255040.11048@asterix.crazy-teaparty.dyndns.org>
References: <1281677417-15063-1-git-send-email-vjensen@gmx.de>
	<alpine.LNX.2.00.1008131040070.11048@asterix.crazy-teaparty.dyndns.org>
	<AANLkTikQ5qGF4N1N0Ud11cdS7P4+HxfPEXSvWwMvm4YV@mail.gmail.com>
	<alpine.LNX.2.00.1008131154370.11048@asterix.crazy-teaparty.dyndns.org>
	<AANLkTinChtk+VTgQ4H3+sMfyTRUQks+=YQR9Agj8M7a_@mail.gmail.com>
	<alpine.LNX.2.00.1008132255040.11048@asterix.crazy-teaparty.dyndns.org>
Date: Fri, 13 Aug 2010 23:27:05 +0200
Message-ID: <1281734825.3858.281.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: patch queue/patchwork: How should states be used? (was: update canutils to current version)
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
X-List-Received-Date: Fri, 13 Aug 2010 21:27:32 -0000
X-Groupsio-MsgNum: 22165
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Fj1kKE7ar4QUIN3fICBH"

--=-Fj1kKE7ar4QUIN3fICBH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 13.08.2010, 23:01 +0200 schrieb Vitus Jensen:
> On Fri, 13 Aug 2010, Khem Raj wrote:
> > On Fri, Aug 13, 2010 at 2:59 AM, Vitus Jensen <vjensen@gmx.de> wrote:

[=E2=80=A6]

> >> They did.  But after you posted you ACKs I changed their state to "Acc=
epted"
> >> and then they are usually filtered by "Action Required".  I'm not real=
ly
> >> sure I did the right thing but I don't believe they shouldn't remain i=
n
> >> "New".
> >
> > If they got applied change the state to 'applied'
>=20
> Sure, already did!  Do I set the 'archive' bit, too?

I think so. Yes.

> Frans got hit by the fact, that 'accepted' patches don't show up in the=
=20
> list by default.
>=20
> Vitus posts patches
> Frans acks patches
> Vitus changes state to 'accepted'
> Vitus asks Frans to apply
> Frans: where are those patches in patchwork???
> Frans forces his googlemail to produce usable mail and applies
> Vitus changes state to 'applied'

I would also advise to set the commit ID when setting the state to
applied. Actually this can be done automatically [2], but the
administrators have not yet had time to address this.

We have the following 11 states.

        $ pwclient state
        ID    Name
        --    ----
        1     New
        2     Under Review
        3     Accepted
        4     Rejected
        5     RFC
        6     Not Applicable
        7     Changes Requested
        8     Awaiting Upstream
        9     Superseded
        10    Deferred
        11    Applied

What is the difference between 3 (Accepted) and 8 (Awaiting Upstream)?

> Probably I should update the wiki [1] to document the above procedure, ri=
ght?

That would be great. But before there should be reached a little
consensus to save you some unnecessary work.

I guess the accepted state is too much work and could be skipped?

+ Normally people reviewing and acknowledging patches have commit access
and will do this shortly afterward.
- People with commit access not searching the list and just looking at
the patch queue would see that those patches have been reviewed and
acknowledged and could commit these patches.

I do not know if we already have some people taking care of the patch
queue. If there are such folks, they should voice their opinion what
they prefer.


Thanks,

Paul


[1] http://wiki.openembedded.net/index.php/Patchwork
[2] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-August/022=
588.html

--=-Fj1kKE7ar4QUIN3fICBH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxluKkACgkQPX1aK2wOHVhiYACeMcWEqFna20kaTDBpl8ULiOYV
s0AAnj4uDqENy68O9E+rmiZgmBwMSmAH
=R7bN
-----END PGP SIGNATURE-----

--=-Fj1kKE7ar4QUIN3fICBH--
