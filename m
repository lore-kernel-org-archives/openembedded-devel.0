Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 57DFD75B98;
	Mon, 26 Oct 2015 22:04:39 +0000 (UTC)
Received: by ioll68 with SMTP id l68so203164544iol.3;
	Mon, 26 Oct 2015 15:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=hkfMVJu60CaOTsdsSV7KyoOWtLl9KCpNF9IK6DRTYu4=;
	b=X0qkf7VBYMGgs/F7xV2pDTOoOudjKItmGeZUuQwkDdeVW8tCE1nYY9HMFvyR1W/j+q
	Yu62eG2igN/a3vVKitYeqkQVQoPuyMNZj/W3GSK7RGWmGJCwwuLvcyO8fSUFig5fWpwR
	292u+V20ldkxrw9dE6HMykios3ILsaIR2moJcOPEQMvBCl76C3tFEl1FjeKrm8yBWMZz
	dqkve5y1PnYuKV/qhp0GSACXGoVUz5nR0uWYhrtStsOVSnYAzO1Qz+Cz6TyPL4R/irMH
	Q6uM/mZ17rNqMLWqY7kR/QxF84lAXMG3TS0C2FROboTNWMqtv0RIhJFJCmQLNoKwpo3D
	FqPw==
MIME-Version: 1.0
X-Received: by 10.107.135.95 with SMTP id j92mr33258002iod.148.1445897079546; 
	Mon, 26 Oct 2015 15:04:39 -0700 (PDT)
Received: by 10.36.31.131 with HTTP; Mon, 26 Oct 2015 15:04:39 -0700 (PDT)
In-Reply-To: <20151026132813.GC2554@jama>
References: <20150908142441.20F8650290@opal.openembedded.org>
	<20151026132813.GC2554@jama>
Date: Mon, 26 Oct 2015 23:04:39 +0100
Message-ID: <CALbNGRQ472dU6HBN6BG5buaJFSPhounE_cEonrkeO9OiBrqZyA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-commits@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IFtvZS1jb21taXRzXSBBbmRyZWFzIE3DvGxsZXIgOiBmb250Zm9yZ2U6IHVwZGF0ZSB0byAyMDE1MDgyNA==?=
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
X-List-Received-Date: Mon, 26 Oct 2015 22:04:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2015 at 2:28 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Tue, Sep 08, 2015 at 02:24:41PM +0000, git@git.openembedded.org wrote:
>> Module: meta-openembedded.git
>> Branch: master
>> Commit: de033e18d168af57cab6ce1aa6b01d2999f322b5
>> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommi=
t;h=3Dde033e18d168af57cab6ce1aa6b01d2999f322b5
>>
>> Author: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> Date:   Sun Aug 30 12:33:55 2015 +0200
>>
>> fontforge: update to 20150824
>>
>> * LICENSE was rewrittem stating out more clearly that huge parts were in=
itially
>>   licensed under BSD clause 3 - so add that licence.
>> * Follow suggestion not to use github release tarballs [1] and use git a=
s
>>   source.
>>
>> [1] http://lists.openembedded.org/pipermail/openembedded-devel/2015-Augu=
st/102843.html
>>
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>
>> ---
>>
>>  .../{fontforge_20141126.bb =3D> fontforge_20150824.bb}          | 11 ++=
++++-----
>>  1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20141126.bb b/=
meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
>> similarity index 77%
>> rename from meta-oe/recipes-graphics/fontforge/fontforge_20141126.bb
>> rename to meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
>> index a2d6cc6..eb58d8f 100644
>> --- a/meta-oe/recipes-graphics/fontforge/fontforge_20141126.bb
>> +++ b/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
>> @@ -1,9 +1,9 @@
>>  SUMMARY =3D "A font editor"
>>  HOMEPAGE =3D "http://fontforge.github.io/en-US/"
>> -LICENSE =3D "GPLv3"
>> +LICENSE =3D "BSD-3-Clause & GPLv3"
>>  LIC_FILES_CHKSUM =3D " \
>>      file://COPYING.gplv3;md5=3Dd32239bcb673463ab874e80d47fae504 \
>> -    file://LICENSE;md5=3D71d636ba7678baa1573e1b531041386e \
>> +    file://LICENSE;md5=3D3f922b42ed0033fa0fd4cd3268f6429c \
>>  "
>>
>>  inherit autotools pkgconfig pythonnative distro_features_check
>> @@ -12,9 +12,10 @@ DEPENDS =3D "glib-2.0 pango giflib tiff libxml2 jpeg =
python libtool"
>>  DEPENDS_append_class-target =3D " libxi"
>>  REQUIRED_DISTRO_FEATURES_append_class-target =3D " x11"
>>
>> -SRC_URI =3D "https://github.com/${BPN}/${BPN}/archive/${PV}.tar.gz"
>> -SRC_URI[md5sum] =3D "0d6f5112c4e5689087339a94aceadf77"
>> -SRC_URI[sha256sum] =3D "9c90c640023463c0b2b97b87575a014fcf44f688c3763f4=
cd136d3c267092106"
>> +SRC_URI =3D "git://github.com/${BPN}/${BPN}.git"
>> +# tag 20150824
>> +SRCREV =3D "07d5ccff2704f8a56f1b3cc6695a4e31f85f88e6"
>> +S =3D "${WORKDIR}/git"
>
> Can you please check why it downloads gnulib in do_configure and prevent =
it to do that?
>
> It just failed in my world build with:
>
> | bootstrap: running: libtoolize --force --quiet
> | bootstrap: running: git clone --depth 365 'git://git.sv.gnu.org/gnulib'=
 'gnulib'
> | fatal: read error: Connection reset by peer
> | Cloning into 'gnulib'...
> ..
> | configure.ac:677: error: required file 'lib/Makefile.in' not found
> | Makefile.am:63: error: required directory ./lib does not exist
> | Unicode/Makefile.am: installing 'config/depcomp'
> | autoreconf: automake failed with exit status: 1
>
> http://errors.yoctoproject.org/Errors/Details/21031/
>
>>
>>  EXTRA_OECONF_append_class-native =3D " with_x=3Dno --disable-python-ext=
ension --disable-python-scripting"
>>
>>
It is on my TODO list

Andreas

