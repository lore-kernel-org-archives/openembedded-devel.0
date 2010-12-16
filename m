Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1PTFBG-00030S-9K
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Dec 2010 15:51:43 +0100
Received: from keemun.altell.local (unknown [192.168.1.169])
	by mail.altell.local (Postfix) with ESMTPS id C965F5442
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Dec 2010 17:49:54 +0300 (MSK)
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Dec 2010 17:56:57 +0300
User-Agent: KMail/1.13.5 (Linux/2.6.34.7-0.5-desktop; KDE/4.4.4; x86_64; ; )
References: <131E5DFBE7373E4C8D813795A6AA7F080329DB6BBC@dlee06.ent.ti.com>
	<201012161732.17976.khimov@altell.ru>
	<131E5DFBE7373E4C8D813795A6AA7F080329E92AE9@dlee06.ent.ti.com>
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F080329E92AE9@dlee06.ent.ti.com>
MIME-Version: 1.0
Message-Id: <201012161756.57857.khimov@altell.ru>
X-Altell-MailScanner-ID: C965F5442.F0B6E
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] move openssl.cnf file into base openssl package
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
X-List-Received-Date: Thu, 16 Dec 2010 14:51:43 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3 16 =D0=B4=D0=B5=D0=BA=D0=B0=D0=
=B1=D1=80=D1=8F 2010 17:30:58 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Maupin, Chase =
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> > Roman I Khimov
> > Sent: Thursday, December 16, 2010 8:32 AM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [RFC] move openssl.cnf file into base openssl package
> >=20
> > =D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=
=82 =D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3 16 =D0=B4=D0=B5=D0=BA=D0=B0=
=D0=B1=D1=80=D1=8F 2010 17:10:37 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Koen Kooi =
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> > > >>> So it seems like there are two packages that need this default
> > > >>=20
> > > >> openssl.cnf
> > > >>=20
> > > >>>  file, the libcrypto and openssl packages.  Would it perhaps be a
> > > >>>  better idea to pull the configuration file into its own package
> > > >>>  and then set
> > > >>=20
> > > >> the
> > > >>=20
> > > >>>  RDEPENDS for the libcrypto and openssl packages to use the opens=
sl
> > > >>>  configuration package? That way you can still have multiple
> >=20
> > versions
> >=20
> > > >>>  of libcrypto (like Koen was trying to do) and have the default
> > > >>>  file shared between both packages that need it.
> > > >>=20
> > > >> openssl is rdepending on libcrypto anyway (it's linked with it and=
 I
> > > >> don't think it'll change any time soon). But configs for different
> > > >> versions can be
> > > >> conflicting, so I'm not sure this kind of approach solves anything.
> > > >=20
> > > > I noticed that.  I think the only thing that putting this into its
> > > > own package would solve is addressing Koen's comment about having
> > > > multiple versions of libcrypto installed.
> > > >=20
> > > > Koen, can you comment on your change that moved the openssl.cnf file
> >=20
> > to
> >=20
> > > > the misc package?  Do you still need to be able to install multiple
> > > > versions of libcrypto?
> > >=20
> > > Yes, I still need to be able to do that, couldn't you just add an
> > > rrecommend for -misc?
> >=20
> > To get all -misc stuff? I'd opt for putting openssl.cnf in its own
> > package and
> > setting it as RRECOMMENDS for libcrypto in that case.
>=20
> Agreed.  Although would you say RRECOMMENDS or RDEPENDS?

I've just said above, RRECOMMENDS. Most applications using libcrypto can wo=
rk=20
without a default config file. They even worked for a long time before I've=
=20
packaged it. But you get it installed by default with RRECOMMENDS, and only=
 if=20
you know what you're doing you add it in BAD_RECOMMENDATIONS or delete it i=
n=20
some other way.

Speaking of which, it should also be listed in CONFFILES, missed that in=20
March.


