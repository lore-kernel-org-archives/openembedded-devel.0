Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Nzoq5-0005Kj-J9
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 12:19:59 +0200
Received: from keemun.localnet (unknown [192.168.1.169])
	by mail.altell.local (Postfix) with ESMTPS id 4FD086825A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Apr 2010 14:16:31 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Thu, 8 Apr 2010 14:15:52 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <1270719003-6168-1-git-send-email-ospite@studenti.unina.it>
	<1270719003-6168-2-git-send-email-ospite@studenti.unina.it>
	<4BBDAC94.10905@ge.com>
In-Reply-To: <4BBDAC94.10905@ge.com>
MIME-Version: 1.0
Message-Id: <201004081415.52206.khimov@altell.ru>
X-Altell-MailScanner-ID: 4FD086825A.B6B24
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] tzcode-native_2010f: Update tzdata SRC_URI and checksum
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
X-List-Received-Date: Thu, 08 Apr 2010 10:20:00 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3 08 =D0=B0=D0=BF=D1=80=D0=B5=D0=
=BB=D1=8F 2010 14:14:44 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Martyn Welch =D0=BD=
=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> > diff --git a/recipes/tzcode/tzcode-native_2010f.bb
> > b/recipes/tzcode/tzcode-native_2010f.bb index 6c361ac..fdd35ba 100644
> > --- a/recipes/tzcode/tzcode-native_2010f.bb
> > +++ b/recipes/tzcode/tzcode-native_2010f.bb
> > @@ -6,11 +6,11 @@ require tzcode-native.inc
> >  # fix this URLs
> >  SRC_URI =3D " \
> >  	ftp://elsie.nci.nih.gov/pub/tzcode${PV}.tar.gz;name=3Dtzcode-${PV} \
> > -	ftp://elsie.nci.nih.gov/pub/tzdata2010g.tar.gz;name=3Dtzdata-2010g \
> > +	ftp://elsie.nci.nih.gov/pub/tzdata2010h.tar.gz;name=3Dtzdata-2010h \
> >  	"
>=20
> Why is a recipe for "tzcode-native_2010f" downloading "tzdata2010g", let
> alone "tzdata2010h"?
>=20
> Surely a new recipe called "tzcode-native_2010h" is called for?

tzcode is still at 2010f and it needs things from tzdata archive and=20
tzdata2010f/tzdata2010g are unavailable. Yep, it's that bad.


