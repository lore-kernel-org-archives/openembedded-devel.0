Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ve0-f173.google.com (unknown [209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5DE21605B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 08:57:33 +0000 (UTC)
Received: by mail-ve0-f173.google.com with SMTP id pa12so41452veb.32
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 01:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=0WNpTMR+tdwj6/iPMoNkb/JCDm533GqPHoLVetQfc7I=;
	b=yTE5m6hD+ERVZ/dEpsT5kbyL0DmwXL14x4J/IRqrZc6eZI5BeHlOt36VZWYiku1yBh
	oX2pfb0Q6W2HV+2ol3lofQ34QbJPGWRq4XQ28f7fq9++fhzk1mJaYqd88Cx92LHY9vTP
	r2q8s+cefr3gNZShguQFGZoiIWzAoymlR7V0MNNtJ8A2QWYZ1IRhqMyt5tDgPOCdGIW7
	uFNLXWy844p3/fs/hkgHr8klbjZ87L/jVOl0AmYWC3hv9D56w2ojKnSW44E46NBtOmSY
	LK7tlR7JqlvccE8LChwSWnIwK/l3yTABh235ufA0NC+m1b55TSTbw67SV/qwI4qNUElK
	AJ4w==
MIME-Version: 1.0
X-Received: by 10.220.167.198 with SMTP id r6mr224157vcy.36.1399971454147;
	Tue, 13 May 2014 01:57:34 -0700 (PDT)
Received: by 10.52.80.226 with HTTP; Tue, 13 May 2014 01:57:34 -0700 (PDT)
In-Reply-To: <20140513084225.GL22774@jama>
References: <1399887698-19336-1-git-send-email-schnitzeltony@googlemail.com>
	<1399887698-19336-4-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRTX4xmQL_-xgQutMkZJsw2Npq9gWaQoFNVSBDy0RFYaOg@mail.gmail.com>
	<20140513065700.GI22774@jama> <20140513084225.GL22774@jama>
Date: Tue, 13 May 2014 10:57:34 +0200
Message-ID: <CALbNGRThi+FVVQMmHzNpopc_H5Vvp9iNWAirR=a1fgj7vKVMPQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC][meta-qt5 3/3] qtwayland: install created private headers
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
X-List-Received-Date: Tue, 13 May 2014 08:57:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2014 at 10:42 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Tue, May 13, 2014 at 08:57:00AM +0200, Martin Jansa wrote:
>> On Tue, May 13, 2014 at 02:17:07AM +0200, Andreas M=C3=BCller wrote:
>> > On Mon, May 12, 2014 at 11:41 AM, Andreas M=C3=BCller
>> > <schnitzeltony@googlemail.com> wrote:
>> > > buildhistory diff:
>> > > --- a/packages/armv7at2hf-vfp-neon-angstrom_wl-linux-gnueabi/qtwayla=
nd/qtwayland-dev/latest
>> > > +++ b/packages/armv7at2hf-vfp-neon-angstrom_wl-linux-gnueabi/qtwayla=
nd/qtwayland-dev/latest
>> > > @@ -4,6 +4,6 @@ PKGV =3D 5.2.1+git0+f9ebbd6c61
>> > >  RPROVIDES =3D
>> > >  RDEPENDS =3D qtwayland
>> > >  RRECOMMENDS =3D eglibc-dev libgcc-dev libstdc++-dev libxkbcommon-de=
v qtbase-dev qtdeclarative-dev wayland-dev xproto-dev zlib-dev
>> > > -PKGSIZE =3D 295533
>> > > +PKGSIZE =3D 537651
>> > >  FILES =3D /usr/include /lib/lib*.so /usr/lib/lib*.so /usr/lib/*.la =
/usr/lib/*.o /usr/lib/pkgconfig /usr/share/pkgconfig /usr/share/aclocal /li=
b/*.o /usr/lib/qtwayland/*.la /lib/*.la
>> > > -FILELIST =3D /usr/include/qt5/QtCompositor/5.3.0/QtCompositor/priva=
te/qwlclientbufferintegration_p.h /usr/include/qt5/QtCompositor/5.3.0/QtCom=
positor/private/qwlclientbufferintegrat
>> > > +FILELIST =3D /usr/include/qt5/QtCompositor/5.3.0/QtCompositor/priva=
te/qwayland-server-hardware-integration.h /usr/include/qt5/QtCompositor/5.3=
.0/QtCompositor/private/qwayland-server
>> > >
>> > > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> > > ---
>> > >  recipes-qt/qt5/qtwayland_git.bb | 5 +++++
>> > >  1 file changed, 5 insertions(+)
>> > >
>> > > diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayl=
and_git.bb
>> > > index ebdda82..8da8249 100644
>> > > --- a/recipes-qt/qt5/qtwayland_git.bb
>> > > +++ b/recipes-qt/qt5/qtwayland_git.bb
>> > > @@ -9,3 +9,8 @@ SRCREV =3D "f9ebbd6c618488f9b671f5504528ced3350754fb=
"
>> > >  SRC_URI +=3D " \
>> > >      file://0001-examples.pro-include-server-buffer-only-when-buildi=
n.patch \
>> > >  "
>> > > +
>> > > +do_install_append() {
>> > > +       # do install files created by qtwaylandscanner
>> > > +       install ${B}/include/QtCompositor/5.2.1/QtCompositor/private=
/{qwayland-server-*,*protocol*}.h ${D}${includedir}/${QT_DIR_NAME}/QtCompos=
itor/5.2.1/QtCompositor/private
>> > Aargh: Wrong directory did test with /usr/include and expected
>> > includedir =3D /usr/include -> V2 will follow
>>
>> fwiw: 2/3 and 3/3 were using tabs in do_install, I've fixed it when
>> cherry-picking to master-next
>
> Fails in world builds with dash:
>
> | install: cannot stat
> `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-l=
inux-gnueabi/qtwayland/5.2.1+gitAUTOINC+f9ebbd6c61-r0/build/include/QtCompo=
sitor/5.2.1/QtCompositor/private/{qwayland-server-*,*protocol*}.h':
> No such file or directory
Yes I was afraid this would happen last night - but was too dizzy to
realize why. It was caused by a patch I had in temporary which pinned
qtwayland to 5.2.1. I will send V2 with 5.3.0 and spaces in
do_install_append. Sorry for causing extra efforts.

Andreas

