Return-Path: <sgh@sgh.dk>
Received: from mx-aarh-2.stofanet.dk (mx-aarh-2.stofanet.dk [212.10.10.12])
	by mail.openembedded.org (Postfix) with ESMTP id 695FC6F778
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 13:39:42 +0000 (UTC)
Received: from 5634f347.rev.stofanet.dk ([86.52.243.71] helo=asrock)
	by mx-aarh-2.stofanet.dk (envelope-from <sgh@sgh.dk>)
	with esmtp id 1WNMuE-0006wh-2L; Tue, 11 Mar 2014 14:39:42 +0100
Received: from koontz.localnet (localhost [127.0.0.1])
	by asrock (Postfix) with ESMTPS id 61FAA803C6;
	Tue, 11 Mar 2014 14:39:42 +0100 (CET)
From: =?ISO-8859-1?Q?S=F8ren?= Holm <sgh@sgh.dk>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 11 Mar 2014 14:39:41 +0100
Message-ID: <1737141.FrkhMrmf59@koontz>
User-Agent: KMail/4.12.3 (Linux/3.13.0-16-lowlatency; KDE/4.12.3; i686; ; )
In-Reply-To: <20140311131704.GM26981@jama>
References: <1394542497-23181-1-git-send-email-sgh@sgh.dk>
	<20140311131704.GM26981@jama>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH] qmake5_base: Add QT_DIR_NAME to "Headers"
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
X-List-Received-Date: Tue, 11 Mar 2014 13:39:46 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"


Oh!! That just excellent then. Can it be applied on to "dora" please?

Tirsdag den 11. marts 2014 14:17:04 skrev Martin Jansa:
> On Tue, Mar 11, 2014 at 01:54:57PM +0100, S=F8ren Holm wrote:
> > Without this we get Headers =3D "/usr/include" which is not meaning=
full
> > since is is searched by defaukt. What we realy want is
> > "/usr/local${QT_DIR_NAME}" which is my default "qt5" giving
> > "/usr/include/qt5".
>=20
> Please see discussion about this patch which is already applied:
> https://github.com/meta-qt5/meta-qt5/commit/2bd5fba34dd350807ac07828c=
d883d5b
> 6c7ec631
> > Signed-off-by: S=F8ren Holm <sgh@sgh.dk>
> > ---
> >=20
> >  classes/qmake5_base.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbcl=
ass
> > index 2db0fa3..24c1483 100644
> > --- a/classes/qmake5_base.bbclass
> > +++ b/classes/qmake5_base.bbclass
> > @@ -56,7 +56,7 @@ do_generate_qt_config_file() {
> >=20
> >      cat > ${QT_CONF_PATH} <<EOF
> > =20
> >  [Paths]
> >  Prefix =3D ${OE_QMAKE_PATH_PREFIX}
> >=20
> > -Headers =3D ${OE_QMAKE_PATH_HEADERS}
> > +Headers =3D ${OE_QMAKE_PATH_HEADERS}/${QT_DIR_NAME}
> >=20
> >  Libraries =3D ${OE_QMAKE_PATH_LIBS}
> >  ArchData =3D ${OE_QMAKE_PATH_ARCHDATA}
> >  Data =3D ${OE_QMAKE_PATH_DATA}

--=20
S=F8ren Holm

