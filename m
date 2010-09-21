Received: from mailde1.eads.com ([80.156.44.82])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@cassidian.com>)
	id 1Oxz0R-0006D3-VB for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 11:19:20 +0200
Received: from de-gate1.mailhub.intra.corp ([53.154.243.33]) by
	mailde1.eads.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 21 Sep 2010 11:20:02 +0200
Received: from gateinet1.mail.ds.corp ([149.207.23.241]) by
	de-gate1.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.6713); 
	Tue, 21 Sep 2010 11:18:12 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet1.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 21 Sep 2010 11:18:13 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Tue, 21 Sep 2010 11:18:11 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA501A74218@deimsg40.de.net.world>
In-Reply-To: <AANLkTim+VwnZH-yiNOPkQ-ZvbGLmjXpEz8U-WJOoPzt7@mail.gmail.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] [PATCH] qt4-embedded: avoid circular dependencies for
	reciped providing qt4-embedded
thread-index: ActY8AgfskykB3S0T2yBQj1ywUFRLwAfLGUg
References: <1284933592-4558-1-git-send-email-pirobk@gmail.com><4C9693E5.3040504@freyther.de>
	<AANLkTim+VwnZH-yiNOPkQ-ZvbGLmjXpEz8U-WJOoPzt7@mail.gmail.com>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 21 Sep 2010 09:18:13.0056 (UTC)
	FILETIME=[EA7D0400:01CB596D]
X-SA-Exim-Connect-IP: 80.156.44.82
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@cassidian.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] qt4-embedded: avoid circular dependencies for reciped providing qt4-embedded
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
X-List-Received-Date: Tue, 21 Sep 2010 09:19:20 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Is it possible to apply this patch soon ? I need the gles version of =
qt4-embedded. At the time I workaround this problem by a modified =
qt4-embedded recipe.
  =20
-----Urspr=FCngliche Nachricht-----
Von: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-bounces@lists.openembedded.org] Im Auftrag =
von Bj=F6rn Krombholz
Gesendet: Montag, 20. September 2010 20:16
An: openembedded-devel@lists.openembedded.org
Betreff: Re: [oe] [PATCH] qt4-embedded: avoid circular dependencies for =
reciped providing qt4-embedded

2010/9/20 Holger Freyther <holger+oe@freyther.de>
> On 09/20/2010 05:59 AM, Bj=F6rn Krombholz wrote:
> > @@ -1,4 +1,4 @@
> > -DEPENDS_prepend =3D "${@["qt4-embedded ", ""][(bb.data.getVar('PN', =
d, 1) =3D=3D 'qt4-embedded')]}"
> > +DEPENDS_prepend =3D "${@["qt4-embedded ", ""][(bb.data.getVar('PN', =
d, 1)[:12] =3D=3D 'qt4-embedded')]}"
> > =A0inherit qmake2
>
> use startsWith and avoid the extra array allocation?

Array slicing just provides a new mapping onto the original array and
doesn't copy any data.

I chose this syntax to make it consistent with qt4x11.bbclass

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


