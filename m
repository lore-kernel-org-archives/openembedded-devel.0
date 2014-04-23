Return-Path: <sgh@sgh.dk>
Received: from mx-aarh-3.stofanet.dk (mx-aarh-3.stofanet.dk [212.10.10.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8691A609A7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 07:01:54 +0000 (UTC)
Received: from 5634f347.rev.stofanet.dk ([86.52.243.71] helo=asrock)
	by mx-aarh-3.stofanet.dk (envelope-from <sgh@sgh.dk>)
	with esmtp id 1WcrBp-0004eP-2v; Wed, 23 Apr 2014 09:01:53 +0200
Received: from koontz.localnet (localhost [127.0.0.1])
	by asrock (Postfix) with ESMTPS id 75AE97ECB5;
	Wed, 23 Apr 2014 09:01:53 +0200 (CEST)
From: =?ISO-8859-1?Q?S=F8ren?= Holm <sgh@sgh.dk>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 23 Apr 2014 09:00:09 +0200
Message-ID: <6764532.83vtKHNMPE@koontz>
User-Agent: KMail/4.13 (Linux/3.13.0-24-lowlatency; KDE/4.13.0; i686; ; )
In-Reply-To: <20140319174024.GB3726@jama>
References: <1395236677-28379-1-git-send-email-sgh@sgh.dk>
	<1647989.PEsjAC07VF@koontz> <20140319174024.GB3726@jama>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH] qtbase: Add libxi to depends.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Apr 2014 07:02:00 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi MArtin

This fix is not in master yet. Is it lost between two chairs ?

Onsdag den 19. marts 2014 18:40:24 skrev Martin Jansa:
> On Wed, Mar 19, 2014 at 06:02:57PM +0100, S=F8ren Holm wrote:
> > yes problably. I did not investigate the whole structure that thoro=
ugh
> > apparently.
> >=20
> > Could that change get into dora?
>=20
> Yes, but first it needs to go to master.
>=20
> > Onsdag den 19. marts 2014 15:15:01 skrev Martin Jansa:
> > > On Wed, Mar 19, 2014 at 02:56:18PM +0100, Jacob Kroon wrote:
> > > > Maybe do something this instead ? This is only necessary for X1=
1 right
> > > > ?
> > > >=20
> > > > -DEPENDS +=3D "qtbase-native"
> > > > +DEPENDS +=3D " \
> > > > +    qtbase-native \
> > > > +    ${@base_contains('DISTRO_FEATURES', 'x11', 'libxi', '', d)=
} \
> > > > +"
> > > >=20
> > > > /Jacob
> > >=20
> > > I think it belongs to
> > > PACKAGECONFIG[xinput2] =3D "-xinput2,-no-xinput2,libxi"

--=20
S=F8ren Holm

