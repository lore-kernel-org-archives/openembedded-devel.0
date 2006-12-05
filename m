Received: from [84.12.140.56] (helo=moneypenny.softoption.local)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <Mark.Howells@softoption.com>) id 1Grctq-00021e-2M
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Dec 2006 17:12:06 +0100
MIME-Version: 1.0
X-MimeOLE: Produced By Microsoft Exchange V6.5
Date: Tue, 5 Dec 2006 16:10:26 -0000
Message-ID: <5144EF5B0ABC6745BEE64C74E43ABD8F11AA9E@moneypenny.softoption.local>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] e2fsprogs won't build [SOLVED]
Thread-Index: AccYXaLzrExj8BLxT6G+0S1MxIAH8QAKNLEA
From: "Mark Howells" <Mark.Howells@softoption.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: e2fsprogs won't build [SOLVED]
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Dec 2006 16:12:06 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

=20

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org=20
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On=20
> Behalf Of Mark Howells
> Sent: 05 December 2006 11:08
>=20
> I think _hope_ this is just a quickie - when I try to build=20
> e2fsprogs I see the following
> =20
> [snip]
> Packaged contents of e2fsprogs-doc into=20
> /home/mark/slugos-head/openslug/tmp/deploy/ipk/e2fsprogs-doc_1
> .38-r6_armeb.ipk
> NOTE: Not creating empty archive for e2fsprogs-dev-1.38-r6
> ERROR: Error in executing:=20
> /home/mark/slugos-head/openembedded/packages/e2fsprogs/e2fspro
> gs_1.38.bb
> ERROR: Exception:exceptions.OSError Message:[Errno 2] No such=20
> file or directory:=20
> '/home/mark/slugos-head/openslug/tmp/work/e2fsprogs-1.38-r6/in
> stall/e2fsprogs-locale'

I don't know what had happened, but I couldn't see anything wrong with =
the bb file so I cd'd to the e2fsprogs directory and did

zeus$> bb -c clean -b e2fsprogs_1.38.bb
zeus$> bb -b e2fsprogs_1.38.bb

And then ran

zeus$> make openslug-image=20

As before and all seems to be working.

Cheers

Mark

--=20
No virus found in this outgoing message.
Checked by AVG.
Version: 7.5.432 / Virus Database: 268.15.6/568 - Release Date: =
04/12/2006 15:20
=20


