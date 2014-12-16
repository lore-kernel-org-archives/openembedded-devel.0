Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 8057172596
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Dec 2014 07:26:20 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Y0mWT-0004v0-2l from Awais_Belal@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Dec 2014 23:26:21 -0800
Received: from EU-MBX-03.mgc.mentorg.com ([169.254.2.55]) by
	SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) with mapi id
	14.03.0181.006; Tue, 16 Dec 2014 07:26:20 +0000
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH v2 2/2] mplayer2: cleanup empty directories
Thread-Index: AQHQEtPb2iasIFVWV0amQJwwNYR9UJyR3Xpu
Date: Tue, 16 Dec 2014 07:26:19 +0000
Message-ID: <2021B186DC632746BD5A3CE32F12BD28E9FE2BDA@EU-MBX-03.mgc.mentorg.com>
References: <1418035371-3544-1-git-send-email-awais_belal@mentor.com>,
	<1418035371-3544-2-git-send-email-awais_belal@mentor.com>
In-Reply-To: <1418035371-3544-2-git-send-email-awais_belal@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH v2 2/2] mplayer2: cleanup empty directories
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
X-List-Received-Date: Tue, 16 Dec 2014 07:26:31 -0000
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
Subject: [oe] [meta-oe][PATCH v2 2/2] mplayer2: cleanup empty directories=
=0A=
=0A=
The mplayer "make install" phase leaves an empty=0A=
/usr/lib directory seemingly regardless of the setting=0A=
of libdir.  Remove it to avoid a packaging warning.=0A=
=0A=
Signed-off-by: Drew Moseley <drew_moseley@mentor.com>=0A=
Signed-off-by: Awais Belal <awais_belal@mentor.com>=0A=
---=0A=
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    1 +=0A=
 1 file changed, 1 insertion(+)=0A=
=0A=
diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/r=
ecipes-multimedia/mplayer/mplayer2_git.bb=0A=
index 6b3d120..a68a2ba 100644=0A=
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb=0A=
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb=0A=
@@ -141,4 +141,5 @@ do_install() {=0A=
     install ${S}/etc/input.conf ${D}/usr/etc/mplayer/=0A=
     install ${S}/etc/example.conf ${D}/usr/etc/mplayer/=0A=
     install ${S}/etc/codecs.conf ${D}/usr/etc/mplayer/=0A=
+    [ -e ${D}/usr/lib ] && rmdir ${D}/usr/lib=0A=
 }=0A=
--=0A=
1.7.9.5=0A=
=0A=
--=0A=
_______________________________________________=0A=
Openembedded-devel mailing list=0A=
Openembedded-devel@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-devel=0A=

