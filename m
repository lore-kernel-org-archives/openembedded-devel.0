Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QyNXg-0002ks-Cd for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 14:35:48 +0200
Received: from f053039119.adsl.alicedsl.de ([78.53.39.119]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QyNT1-00051M-SF for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 12:31:00 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Aug 2011 14:30:56 +0200
In-Reply-To: <4E5CC094.2020500@dresearch-fe.de>
References: <4E4E536D.7010103@dresearch-fe.de>
	<4E4E738C.70109@dresearch-fe.de> <4E5356B2.3060908@dresearch-fe.de>
	<4E53583A.3030405@gmx.net> <4E535B83.9080508@dresearch-fe.de>
	<CAFu+nvEh9tUGzQM1PFo1ErtOq+a+0yg94pZBO6Ohr92GNZoKBg@mail.gmail.com>
	<1314199372.21496.12.camel@jjg-linux>
	<4E562AFF.7090004@dresearch-fe.de>
	<4E56579C.7080207@dresearch-fe.de> <4E5CC094.2020500@dresearch-fe.de>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1314707457.3796.19.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: [2011.03-maintenance] do_compile failed for cacao_0.99.3.bb
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
X-List-Received-Date: Tue, 30 Aug 2011 12:35:48 -0000
X-Groupsio-MsgNum: 33894
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-Nvh72+KLyjdad9724q4r"

--=-Nvh72+KLyjdad9724q4r
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 30.08.2011, 12:51 +0200 schrieb Steffen Sledz:
> On 25.08.2011 16:09, Steffen Sledz wrote:
> > On 25.08.2011 12:59, Steffen Sledz wrote:
> >> On 24.08.2011 17:22, Jesse Gilles wrote:
> >>> On Tue, 2011-08-23 at 13:16 -0400, George C. Huntington, III wrote:
> >>>> I suspect that the problem is happening earlier, classpath isn't bui=
lding.
> >>>>  the javac wrapper eats the return code from a java compile.
> >>>
> >>> If George is right, then the following patch to the javac wrapper scr=
ipt
> >>> may fix the issue.  It fixes building classpath as well as returns th=
e
> >>> error code if all javac attempts fail.
> >>>
> >>> http://patches.openembedded.org/patch/9521/
> >>
> >> In our case this patch helps.
> >>
> >> If nobody has objections i will commit this patch to oe-dev master and=
 request a pull to 2011.03-maintenance.
> >=20
> > It would be still better if we can get some Acks from a java maintainer=
.
>=20
> No NACKs after another week. So i pushed the patch do oe-dev master.

Next time it would be better to resend the patch with a appropriate
subject line.

Unfortunately the commit message [1] does not conform to our commit
policy [2].

Please make sure to check those things next time. I feel uncomfortable
to ask new contributors to comply every time but when they look at the
commit history they see that the policies are often not cared about.


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D16a8a1e=
9175035b55d91a141d5302c38d63c16f1
[2] http://openembedded.org/index.php/Category:Policy

--=-Nvh72+KLyjdad9724q4r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5c2AAACgkQPX1aK2wOHVjaMwCeMju4MSVGh5PoejOyseqRMQR2
vLgAnRfhte1DFPxGc/s/+yF2f9UC3Nhl
=qnvb
-----END PGP SIGNATURE-----

--=-Nvh72+KLyjdad9724q4r--
