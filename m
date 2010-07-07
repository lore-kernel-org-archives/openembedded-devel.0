Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OWTLn-0002tq-CG
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 14:03:43 +0200
Received: from [62.7.80.98] (helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OWTH7-0004ib-Fv
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 12:58:49 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1OWTH7-0004oy-8I
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 12:58:49 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <0B51A1E7C61D114DAE6FC10B0FD0ABA501819C3E@deimsg40.de.net.world>
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA501819C15@deimsg40.de.net.world>
	<1278498389.2345.1744.camel@mill.internal.reciva.com>
	<0B51A1E7C61D114DAE6FC10B0FD0ABA501819C3E@deimsg40.de.net.world>
Date: Wed, 07 Jul 2010 12:58:48 +0100
Message-ID: <1278503928.2345.1780.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.1.2 
X-Broken-Reverse-DNS: no host name found for IP address 62.7.80.98
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
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
X-List-Received-Date: Wed, 07 Jul 2010 12:03:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Both, really.

If you have several applets running at the same time then they
will/should already share the busybox executable.  I would have expected
making it into a library to increase the memory footprint (as well as
the startup time and image size) since you will now have a bunch of
extra relocs to fix up.

p.

On Wed, 2010-07-07 at 13:34 +0200, Hauser, Wolfgang (external) wrote:
> Hello, what memory footprint do you mean, the image or the ram ?
>=20
> If I have to run several busybox applets at a time, e.g. sh, inetd, ftpd,=
 telnetd, syslogd ... it would probably be better to load the shared librar=
y once and share it by the applets.
>=20
> May be I am wrong, but the shared library overhead isn't that big at runt=
ime. Especially if several applets are running at the same time.
>=20
> Wolfgang Hauser
>=20
> -----Urspr=C3=BCngliche Nachricht-----
> Von: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedd=
ed-devel-bounces@lists.openembedded.org] Im Auftrag von Phil Blundell
> Gesendet: Mittwoch, 7. Juli 2010 12:26
> An: openembedded-devel@lists.openembedded.org
> Betreff: Re: [oe] Is there a recipe for building and using busybox with l=
ibbusybox out there ?
>=20
> On Wed, 2010-07-07 at 11:45 +0200, Hauser, Wolfgang (external) wrote:
> > I want to use busybox with the applet binaries linked against libbusybo=
x
> > in our system.
> > We need a wide range of applets at the same time, so I suppose it will
> > save overall needed memory space.
>=20
> What's the advantage of this?  I would have thought it would give you a
> larger memory footprint rather than a smaller one.  I guess I must be
> missing something.
>=20
> > Also I want to prevent the system from updating alternatives while the
> > first boot. We have to provide a read only root file system.
>=20
> Yeah, this is a long-standing piece of OE suckage.  We should fix the
> alternative selection to work at image construction time.
>=20
> p.
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




