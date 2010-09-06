Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1Osaz6-0006Z6-Hi
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 14:39:44 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1OsayS-0004CW-Lu from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 05:39:00 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Mon, 6 Sep 2010 14:38:58 +0200
Message-ID: <989A078976CDAD4CB2DC976EEF70E2A5042F1615@eu2-mail.mgc.mentorg.com>
In-Reply-To: <AANLkTimzZ65faJVfh95+TgfKiNBJCTG5LJ=L9NxhFgN5@mail.gmail.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] [PATCH] libsdl-native: Convert to new style staging,
	remove do_stage
Thread-Index: ActNwBAOIVevIsSDSGCFj4YG5uEpzQAACx4g
References: <1283775540-13164-1-git-send-email-noor_ahsan@mentor.com>
	<AANLkTimzZ65faJVfh95+TgfKiNBJCTG5LJ=L9NxhFgN5@mail.gmail.com>
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Noor_Ahsan@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libsdl-native: Convert to new style staging, remove do_stage
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
X-List-Received-Date: Mon, 06 Sep 2010 12:39:46 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Yes. I checked the ipk file. There was no difference in lib dir.

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of =
Frans Meulenbroeks
Sent: Monday, September 06, 2010 5:35 PM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH] libsdl-native: Convert to new style =
staging,remove do_stage

2010/9/6 Noor Ahsan <noor_ahsan@mentor.com>:
> * Remove do_stage ()
> * Replace tabs with 8 spaces in do_configure
> * Bump INC_PR =3D "r3"
>
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> ---
> =A0recipes/libsdl/libsdl-native.inc | =A0 18 +++++++-----------
> =A01 files changed, 7 insertions(+), 11 deletions(-)
>
> diff --git a/recipes/libsdl/libsdl-native.inc =
b/recipes/libsdl/libsdl-native.inc
> index 783797a..faae90c 100644
> --- a/recipes/libsdl/libsdl-native.inc
> +++ b/recipes/libsdl/libsdl-native.inc
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "Simple DirectMedia Layer - native =
Edition"
> =A0HOMEPAGE =3D "http://www.libsdl.org"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "LGPL"
> -INC_PR =3D "r2"
> +INC_PR =3D "r3"
>
> =A0SRC_URI =3D "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
> =A0"
> @@ -23,15 +23,11 @@ EXTRA_OECONF =3D "--disable-debug --disable-cdrom =
--enable-threads --enable-timers
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 --disable-video-picogui =
--disable-video-qtopia --enable-dlopen"
>
> =A0do_configure() {
> - =A0 =A0 =A0 gnu-configize
> - =A0 =A0 =A0 oe_runconf
> - =A0 =A0 =A0 cd ${S}
> - =A0 =A0 =A0 # prevent libtool from linking libs against libstdc++, =
libgcc, ...
> - =A0 =A0 =A0 cat ${TARGET_PREFIX}libtool | sed -e =
's/postdeps=3D".*"/postdeps=3D""/' > ${TARGET_PREFIX}libtool.tmp
> - =A0 =A0 =A0 mv ${TARGET_PREFIX}libtool.tmp ${TARGET_PREFIX}libtool
> + =A0 =A0 =A0 =A0gnu-configize
> + =A0 =A0 =A0 =A0oe_runconf
> + =A0 =A0 =A0 =A0cd ${S}
> + =A0 =A0 =A0 =A0# prevent libtool from linking libs against =
libstdc++, libgcc, ...
> + =A0 =A0 =A0 =A0cat ${TARGET_PREFIX}libtool | sed -e =
's/postdeps=3D".*"/postdeps=3D""/' > ${TARGET_PREFIX}libtool.tmp
> + =A0 =A0 =A0 =A0mv ${TARGET_PREFIX}libtool.tmp =
${TARGET_PREFIX}libtool
> =A0}
>
> -do_stage() {
> - =A0 =A0 =A0 autotools_stage_all
> - =A0 =A0 =A0 install -m 0644 build/libSDLmain.a ${STAGING_LIBDIR}
> -}

when you build is tlibSDLmain.a still moved to staging ?

Frans

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


