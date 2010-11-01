Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PCrQf-0003WF-Fz for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 11:15:54 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PCrPs-0000KT-Tx for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 11:15:04 +0100
Received: from 88-149-161-38.dynamic.ngi.it ([88.149.161.38])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 11:15:04 +0100
Received: from walter.franzini by 88-149-161-38.dynamic.ngi.it with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 11:15:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Walter Franzini <walter.franzini@gmail.com>
Date: Mon, 01 Nov 2010 10:59:58 +0100
Message-ID: <8739rlqs81.fsf@walter-nb.nord-com.it>
References: <AANLkTimpAJJUoDkY=JvH6o39kssgWdGkgWs_fHa4q-Gd@mail.gmail.com>
	<3F7F8AC4C7A0A042A2FE40720B75E208F0321F@nvs0086.nedap.local>
	<20101030102143.GC21651@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: 88-149-161-38.dynamic.ngi.it
X-Archive: encrypt
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.1 (gnu/linux)
Cancel-Lock: sha1:wMYhYH7Mn+RZpmgBU3MbXSDJYqA=
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: bitbake error?
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
X-List-Received-Date: Mon, 01 Nov 2010 10:15:54 -0000
X-Groupsio-MsgNum: 25658
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--=-=-=
Content-Transfer-Encoding: quoted-printable

Denys Dmytriyenko <denis@denix.org> writes:

> On Sat, Oct 30, 2010 at 12:16:23PM +0200, Jaap de Jong wrote:
>> That fixes it...
>>=20
>> If relevant:=20
>> org.openembedded/conf/sanity.conf needs to be patched?
>>=20
>>     -BB_MIN_VERSION =3D "1.8.18"
>>     +BB_MIN_VERSION =3D "1.10.1"
>
> NAK! It is not officially decided or announced to require 1.10 as a minim=
al=20
> version of Bitbake for OpenEmbedded. The minimal version is still 1.8.18 =
and=20
> if it is broken now, it needs to be fixed, not worked around. Too many pe=
ople=20
> (especially, out of tree) use 1.8.x bitbake.

The patch below fix the problem for me with bitbake 1.8.18.=20

HTH :-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 8708fa9..a14354d 100644
=2D-- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -237,12 +237,6 @@ python base_eventhandler() {
 	from bb import note, error, data
 	from bb.event import getName
=20
=2D	# Only need to output when using 1.8 or lower, the UI code handles it
=2D	# otherwise
=2D	if (int(bb.__version__.split(".")[0]) <=3D 1 and int(bb.__version__.spl=
it(".")[1]) <=3D 8):
=2D		if msg:
=2D			note(msg)
=2D
 	if isinstance(e, bb.event.BuildStarted):
 		bb.data.setVar( 'BB_VERSION', bb.__version__, e.data )
 		statusvars =3D bb.data.getVar("BUILDCFG_VARS", e.data, 1).split()

=2D-=20
Walter Franzini
http://aegis.stepbuild.org/

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkzOj6AACgkQlqotV8s/60PsMACbBUOqSOtaznjkGucDaAhyrKHT
6tUAnixBHE8SFBhmUuHSMJbnl0zdFjAs
=X3hj
-----END PGP SIGNATURE-----

--=-=-=--
