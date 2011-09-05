Received: from david.siemens.de ([192.35.17.14])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Fabrice.Aeschbacher@siemens.com>) id 1R0aPo-0008RN-E9
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Sep 2011 16:44:49 +0200
Received: from mail3.siemens.de (localhost [127.0.0.1])
	by david.siemens.de (8.13.6/8.13.6) with ESMTP id p85EdlRS003323
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 5 Sep 2011 16:39:47 +0200
Received: from DEMCHP99ET3MSX.ww902.siemens.net
	(demchp99et3msx.ww902.siemens.net [139.25.131.243])
	by mail3.siemens.de (8.13.6/8.13.6) with ESMTP id p85EdkJR004356
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 5 Sep 2011 16:39:47 +0200
Received: from DEMCHP99E35MSX.ww902.siemens.net ([169.254.2.243]) by
	DEMCHP99ET3MSX.ww902.siemens.net ([139.25.131.243]) with mapi;
	Mon, 5 Sep 2011 16:39:24 +0200
From: "Aeschbacher, Fabrice" <Fabrice.Aeschbacher@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 5 Sep 2011 16:39:45 +0200
Thread-Topic: [oe] Open Embedded and Gumstix
Thread-Index: Acxr1ct4VwH05yDsTjSK/eiszPHyXwAAUduA
Message-ID: <09D9BE2AC4AA764DABAA8C91E48D819E02DBCEC1DE@DEMCHP99E35MSX.ww902.siemens.net>
References: <loom.20110905T160251-647@post.gmane.org>
In-Reply-To: <loom.20110905T160251-647@post.gmane.org>
Accept-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
MIME-Version: 1.0
Subject: Re: Open Embedded and Gumstix
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
X-List-Received-Date: Mon, 05 Sep 2011 14:44:49 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

> [mailto:openembedded-devel-bounces@lists.openembedded.org] Im=20
> Auftrag von Chinab
> I am using a Gumstix and have set up Open Embedded+Bitbake on=20
> my local linux
> machine for cross debugging C code using eclipse IDE.
>=20
> I am interested for having all my lab computers (all ubuntu=20
> machines as well) to
> be able to do the same but I dont want to bitbake and install each and
> everything again and again. Would it be possible for me to=20
> simple make an SDK
> and install it on all the other computers? What would be part=20
> of the SDK? As in,
> can I simply transfer the overo-oe folder to the rest of the=20
> computers and will it work?

We do this kind of thing by using 'packaged-staging':

- compile the toolchain once on one computer (e.g. 'bitbake meta-toolchain'=
)
- copy the resulting staging dir ( ${PSTAGE_DIR} )
 somewhere ( e.g. http://server/pstage )
- Set PSTAGE_MIRROR in your local.conf (e.g. PSTAGE_MIRROR =3D http://serve=
r/pstage/ )

When then  building on another computer, pre-built packages will be fetched=
 from PSTAGE_MIRROR and not rebuilt. This will drastically speed up build t=
imes.

Note: if you want to use local URIs for PSTAGE_MIRROR (e.g.: file://xxx), y=
ou will need following patch, which has been acked but not merged upstream =
yet:

http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-July/033967.ht=
ml

With kind regards,
   Fabrice=


