Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 74D1D7259C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Dec 2014 07:26:31 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Y0mWe-0004ws-94 from Awais_Belal@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Dec 2014 23:26:32 -0800
Received: from EU-MBX-03.mgc.mentorg.com ([169.254.2.55]) by
	SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) with mapi id
	14.03.0181.006; Tue, 16 Dec 2014 07:26:31 +0000
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH v2 1/2] mplayer2: use autotools-brokensep
	(B =	S)
Thread-Index: AQHQEtPT5DH+Nbl5AEGMBP08djCw+5yR3YlJ
Date: Tue, 16 Dec 2014 07:26:30 +0000
Message-ID: <2021B186DC632746BD5A3CE32F12BD28E9FE2BE6@EU-MBX-03.mgc.mentorg.com>
References: <1418035371-3544-1-git-send-email-awais_belal@mentor.com>
In-Reply-To: <1418035371-3544-1-git-send-email-awais_belal@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH v2 1/2] mplayer2: use autotools-brokensep (B =	S)
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
X-List-Received-Date: Tue, 16 Dec 2014 07:26:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ping!=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel=
-bounces@lists.openembedded.org] on behalf of Belal, Awais=0A=
Sent: Monday, December 08, 2014 3:42 PM=0A=
To: openembedded-devel@lists.openembedded.org=0A=
Subject: [oe] [meta-oe][PATCH v2 1/2] mplayer2: use autotools-brokensep (B =
=3D    S)=0A=
=0A=
The mplayer2 package does not support out of tree builds=0A=
and the do_configure step also tries to find the configure=0A=
script in the same build directory while the script lies in=0A=
the src directory.=0A=
This patch updates the builddir to point to the srcdir in=0A=
order to cope with the above issues.=0A=
=0A=
Signed-off-by: Drew Moseley <drew_moseley@mentor.com>=0A=
Signed-off-by: Awais Belal <awais_belal@mentor.com>=0A=
---=0A=
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    2 +-=0A=
 1 file changed, 1 insertion(+), 1 deletion(-)=0A=
=0A=
diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/r=
ecipes-multimedia/mplayer/mplayer2_git.bb=0A=
index 65fab1f..6b3d120 100644=0A=
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb=0A=
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb=0A=
@@ -36,7 +36,7 @@ CONFFILES_${PN} +=3D "/usr/etc/mplayer/input.conf \=0A=
                     /usr/etc/mplayer/codecs.conf \=0A=
 "=0A=
=0A=
-inherit autotools pkgconfig=0A=
+inherit autotools-brokensep pkgconfig=0A=
=0A=
 EXTRA_OECONF =3D " \=0A=
     --prefix=3D/usr \=0A=
--=0A=
1.7.9.5=0A=
=0A=
--=0A=
_______________________________________________=0A=
Openembedded-devel mailing list=0A=
Openembedded-devel@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-devel=0A=

