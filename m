Received: from mail-dotnet1.eads.net ([80.156.45.103])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@eads.com>)
	id 1OWTOK-0003j4-KA for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 14:06:19 +0200
Received: from unknown (HELO de-gate1.mailhub.intra.corp) ([53.154.243.33])
	by mail-dotnet1.eads.net with ESMTP; 07 Jul 2010 13:53:09 +0200
Received: from gateinet1.mail.ds.corp ([149.207.23.241]) by
	de-gate1.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.6713); 
	Wed, 7 Jul 2010 14:01:13 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet1.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 7 Jul 2010 14:01:13 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 7 Jul 2010 14:01:15 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA501819C48@deimsg40.de.net.world>
In-Reply-To: <i11m2f$o0b$1@dough.gmane.org>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Is there a recipe for building and using busybox with
	libbusybox out there ?
Thread-Index: Acsdwh3LZPTlZvUmRwCu2YRuAbLEzAACAoaA
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA501819C15@deimsg40.de.net.world><1278498389.2345.1744.camel@mill.internal.reciva.com>
	<i11m2f$o0b$1@dough.gmane.org>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@eads.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 07 Jul 2010 12:01:13.0542 (UTC)
	FILETIME=[18B7BE60:01CB1DCC]
X-SA-Exim-Connect-IP: 80.156.45.103
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@eads.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Is there a recipe for building and using busybox with libbusybox out there ?
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
X-List-Received-Date: Wed, 07 Jul 2010 12:06:20 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

As I am a little new in OE, where you suggest to add a post process =
command to remove
the S98configure ?

In the image recipe ? In the busybox recipe ?

Append to which command ?

Regards=20
Wolfgang Hauser
 =20
-----Urspr=FCngliche Nachricht-----
Von: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-bounces@lists.openembedded.org] Im Auftrag =
von Koen Kooi
Gesendet: Mittwoch, 7. Juli 2010 12:49
An: openembedded-devel@lists.openembedded.org
Betreff: Re: [oe] Is there a recipe for building and using busybox with =
libbusybox out there ?

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 07-07-10 12:26, Phil Blundell wrote:
> On Wed, 2010-07-07 at 11:45 +0200, Hauser, Wolfgang (external) wrote:
>> I want to use busybox with the applet binaries linked against =
libbusybox
>> in our system.
>> We need a wide range of applets at the same time, so I suppose it =
will
>> save overall needed memory space.
>=20
> What's the advantage of this?  I would have thought it would give you =
a
> larger memory footprint rather than a smaller one.  I guess I must be
> missing something.
>=20
>> Also I want to prevent the system from updating alternatives while =
the
>> first boot. We have to provide a read only root file system.
>=20
> Yeah, this is a long-standing piece of OE suckage.  We should fix the
> alternative selection to work at image construction time.

OE already does that. But what it does after that is flag everything as
'unpacked' to have opkg rerun all postinsts at boot *again*. If OE
didn't run u-a at image time we wouldn't be able to use sysvinit for
example.
If you only care about u-a, just add a post process command to remove
the S98configure from the rootfs and opkg won't run.

In the long run a way to control this behaviour and optionally hook into
qemu or even targets over network to run them at image time. Having to
run a first boot, remove ssl keys and repackage everything is getting a
bit tedious.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMNFuPMkyGM64RGpERAmr3AKCNIYUK/AlJZyxB8CSNKGwTC34mywCeNUH4
yfJydmbOupXEw5hAvomV3sk=3D
=3Dt0HL
-----END PGP SIGNATURE-----


_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


