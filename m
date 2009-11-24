Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1NCuEJ-0000dW-Uw
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Nov 2009 13:10:51 +0100
Received: from homiemail-a21.g.dreamhost.com (caiajhbdcaid.dreamhost.com
	[208.97.132.83])
	by hapkido.dreamhost.com (Postfix) with ESMTP id 94A91184B18
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2009 04:06:29 -0800 (PST)
Received: from [129.132.133.199] (mtec-hg-docking-1-dhcp-199.ethz.ch
	[129.132.133.199])
	by homiemail-a21.g.dreamhost.com (Postfix) with ESMTPA id BEFAD300059
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2009 04:06:04 -0800 (PST)
Message-ID: <4B0BCC2C.5020605@SSpaeth.de>
Date: Tue, 24 Nov 2009 13:06:04 +0100
From: Sebastian Spaeth <Sebastian@SSpaeth.de>
Organization: ETH Zurich
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.7
OpenPGP: id=C827A062
X-SA-Exim-Connect-IP: 66.33.216.122
X-SA-Exim-Mail-From: Sebastian@SSpaeth.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: app launchers should NOT modify /proc/sys/vm
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
X-List-Received-Date: Tue, 24 Nov 2009 12:10:51 -0000
X-Groupsio-MsgNum: 14661
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigBBB4BA3A6D96309E693571E8"

--------------enigBBB4BA3A6D96309E693571E8
Content-Type: multipart/mixed;
 boundary="------------080008000606060909060900"

--------------080008000606060909060900
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Currently, the navit (routing app) launcher script modifies
/proc/sys/vm/overcommit_memory without ever setting it back. This change
should -if at all- should only be done with serious evaluation on the
respective devices IMHO. I don't want to introduce random OOM process
killings because apps start using the RAM the kernel has promised to them=
=2E

Do I get the OK to remove the relevant lines? I will follow up on this
mail with a patch that you can ACK.

spaetz

Commit introducing this:
http://cgit.openembedded.net/cgit.cgi/openembedded/commit/?id=3D742fb4ae7=
1e6a7e655385086ba9edebbf00b6ebd

author	Matthias Hentges <oe@hentges.net>
committer	Matthias Hentges <oe@hentges.net>	2008-01-05
commit	742fb4ae71e6a7e655385086ba9edebbf00b6ebd
--- a/dev/null
+++ b/packages/navit/files/navit.launcher
=2E..
+ if test "$USER" =3D "root"
+ then
+ echo "Enabling low-mem workaround..."
+ echo 1 > /proc/sys/vm/overcommit_memory



--------------080008000606060909060900
Content-Type: application/pgp-signature;
 name="signature.asc"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuNC45IChHTlUv
TGludXgpCkNvbW1lbnQ6IFVzaW5nIEdudVBHIHdpdGggTW96aWxsYSAtIGh0dHA6Ly9lbmlnbWFp
bC5tb3pkZXYub3JnCgppRVlFQVJFQ0FBWUZBa3NMeVY0QUNna1FWWVgxak1nbm9HS2RaZ0NmYTN6
ZEdRdHhqZS9mQkRVWG1POHh3UVFZCmtlTUFuQXoybU1GZDNtT2JtQmF3Rk5rOEVzNzVSODIxCj0w
QWJmCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQoK

--------------080008000606060909060900--

--------------enigBBB4BA3A6D96309E693571E8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAksLzCwACgkQVYX1jMgnoGInUwCfXOK/QtDNZWz5GuIxNj0cHISk
h4oAn1LIvoao5axAUoBjqxjr/5olPBY/
=g+yr
-----END PGP SIGNATURE-----

--------------enigBBB4BA3A6D96309E693571E8--
