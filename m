Received: from mail-wg0-f45.google.com ([74.125.82.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TjTWe-0002fr-4x
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Dec 2012 12:33:56 +0100
Received: by mail-wg0-f45.google.com with SMTP id dq12so1315414wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Dec 2012 03:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=GJhUVLpEiRRWBpa2X6HnMFAAE9utY43u9YkweQTF2cw=;
	b=hGrGOOsm71whY5vq53Fx4uEUgzc5xVlOSVdDQY6M8o4VZxUgw5PrdSy6aV44XCOy83
	teADo14QTsozSmCE7rWT0i1SA2GddAe1gi9Xev2nwGGhHzFkEX9rEpXzlA/L9icOnep1
	Vc8Oe2sGC5p1qlZj2/6BCtD0euw9g39uMA6tVrnuEDwuMc1jfkVVl0MTClvMzpwCZ4lQ
	Tgt+43r9JJ+Cg4HIqMEhbpbMPJU1qAli7Tsq6NZL4dCMEJvSbjSbcVp2oCVZpvymCn9W
	g56+Heg8JLxAFdhceEffL75qtFlRBQuxGgPsA6d8kMiiGXdolhM/uMarvnlqGgx/+WAR
	JVXQ==
MIME-Version: 1.0
Received: by 10.180.98.8 with SMTP id ee8mr1994170wib.4.1355483960225; Fri, 14
	Dec 2012 03:19:20 -0800 (PST)
Received: by 10.194.84.103 with HTTP; Fri, 14 Dec 2012 03:19:20 -0800 (PST)
In-Reply-To: <CALbNGRSq_81mqhJjNvGKSerOe2-CM+EoFB-UXsfBOL-6nan4vQ@mail.gmail.com>
References: <cover.1355438401.git.Martin.Jansa@gmail.com>
	<438ebe8cfe643f3d82f3a825651693c4c90edb6f.1355438402.git.Martin.Jansa@gmail.com>
	<CALbNGRSq_81mqhJjNvGKSerOe2-CM+EoFB-UXsfBOL-6nan4vQ@mail.gmail.com>
Date: Fri, 14 Dec 2012 12:19:20 +0100
Message-ID: <CA+chaQd6fnQ9HkW_zoB9QP_a0CpSHepmaAmQ3Y1WU8dhsM1QvQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 09/11] glade3: disable html doc, fails to build
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
X-List-Received-Date: Fri, 14 Dec 2012 11:33:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 14, 2012 at 9:26 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Thu, Dec 13, 2012 at 11:41 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>  meta-oe/recipes-devtools/glade/glade3_3.8.2.bb | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb b/meta-oe/re=
cipes-devtools/glade/glade3_3.8.2.bb
>> index 8cd6a0e..049f7e3 100644
>> --- a/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb
>> +++ b/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb
>> @@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Daabe87591cb8a=
e0f3c68be6977bb5522 \
>>                      file://COPYING.LGPL;md5=3D3bf50002aefd002f49e7bb854=
063f7e7"
>>  DEPENDS =3D "gtk+ gnome-doc-utils-native"
>>
>> +PR =3D "r1"
>> +
>>  inherit autotools pkgconfig pythonnative
>>
>>  SRC_URI =3D "http://ftp.gnome.org/pub/GNOME/sources/glade3/3.8/glade3-$=
{PV}.tar.xz \
>> @@ -14,6 +16,10 @@ SRC_URI[sha256sum] =3D "f180a5018eee6e3fe574854cb025a=
f897dd9962b01d17d5752e626876d
>>
>>  EXTRA_OECONF +=3D "--disable-scrollkeeper"
>>
>> +do_configure_prepend() {
>> +  sed -i 's/HAVE_GNOME_DOC_UTILS/HAVE_GNOME_DOC_UTILS_IGNORED/g' ${S}/M=
akefile.am
>> +}
>> +
>>  FILES_${PN} +=3D "${datadir}/icons"
>>  FILES_${PN}-dbg +=3D "${libdir}/glade3/modules/.debug"
>>  FILES_${PN}-dev +=3D "${libdir}/glade3/modules/*.la"
>> --
>> 1.8.0.2
>>
> I am using the documentation from time to time. Don't misunderstand
> me: For now I have no problem disabling it but could you send the
> error information so we know what fails - maybe later there is a
> chance for fixing it.

Extended description in PATCHv2 and this bug is also related:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2416


