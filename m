Return-Path: <sgh@sgh.dk>
Received: from mx-aarh-1.stofanet.dk (mx-aarh-1.stofanet.dk [212.10.10.11])
	by mail.openembedded.org (Postfix) with ESMTP id 458F76F8D1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Mar 2014 17:02:58 +0000 (UTC)
Received: from 5634f347.rev.stofanet.dk ([86.52.243.71] helo=asrock)
	by mx-aarh-1.stofanet.dk (envelope-from <sgh@sgh.dk>)
	with esmtp id 1WQJtK-0005gT-21; Wed, 19 Mar 2014 18:02:58 +0100
Received: from koontz.localnet (localhost [127.0.0.1])
	by asrock (Postfix) with ESMTPS id 3E146802E3;
	Wed, 19 Mar 2014 18:02:58 +0100 (CET)
From: =?ISO-8859-1?Q?S=F8ren?= Holm <sgh@sgh.dk>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 19 Mar 2014 18:02:57 +0100
Message-ID: <1647989.PEsjAC07VF@koontz>
User-Agent: KMail/4.12.3 (Linux/3.13.0-18-lowlatency; KDE/4.12.3; i686; ; )
In-Reply-To: <20140319141501.GA3726@jama>
References: <1395236677-28379-1-git-send-email-sgh@sgh.dk>
	<CAPbeDCkN2jeKJr-+0hV0DWvJ1v26a8WYHb3wn1u1Novssa7_=Q@mail.gmail.com>
	<20140319141501.GA3726@jama>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org, sgh@sgh.dk
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
X-List-Received-Date: Wed, 19 Mar 2014 17:03:00 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"


yes problably. I did not investigate the whole structure that thorough=20=

apparently.

Could that change get into dora?

Onsdag den 19. marts 2014 15:15:01 skrev Martin Jansa:
> On Wed, Mar 19, 2014 at 02:56:18PM +0100, Jacob Kroon wrote:
> > Maybe do something this instead ? This is only necessary for X11 ri=
ght ?
> >=20
> > -DEPENDS +=3D "qtbase-native"
> > +DEPENDS +=3D " \
> > +    qtbase-native \
> > +    ${@base_contains('DISTRO_FEATURES', 'x11', 'libxi', '', d)} \
> > +"
> >=20
> > /Jacob
>=20
> I think it belongs to
> PACKAGECONFIG[xinput2] =3D "-xinput2,-no-xinput2,libxi"
>=20
--=20
S=F8ren Holm

