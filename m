Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ve0-f170.google.com (unknown [209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id CEAFA65FE3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 07:06:45 +0000 (UTC)
Received: by mail-ve0-f170.google.com with SMTP id db11so10139665veb.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 00:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=uO2y3aXDXqz39e03CzbgFNw7g8/W85qSeBRU1x9LEQA=;
	b=GI+EDrSRgwiQfwvEeCqytFCxvFHS6s98IWWm8gljvpCaJCjK2zJzV+4Ed7/i0i6sE/
	6qs8tSB2Xt6tZGsDqe+cYPiF5TyG8/TaM9zIseFC5bBwt6anu0pTOkYwNQwXUUZzPJlo
	u32r8CpemVTXiOqM5CW2jfHE8Q4fPPY+ZXKNZJCeW+vUC7m4l8lFT7FH6CEjLvpSvcJI
	w8kaEEccJENhmOhTQQrDFoxpGOhpx9m3AH0ysol7/UnNicMMsyOGqBc6e8CRI51WsgWR
	kl5RKfJdPTe2cfPR5zUdbSnOgZY5IHe624mBxBJWf0KBb/3DP9SgTV1BGgxYv7rc10NB
	oi8w==
MIME-Version: 1.0
X-Received: by 10.52.37.48 with SMTP id v16mr22864017vdj.4.1399964806910; Tue,
	13 May 2014 00:06:46 -0700 (PDT)
Received: by 10.52.80.226 with HTTP; Tue, 13 May 2014 00:06:46 -0700 (PDT)
In-Reply-To: <20140513065700.GI22774@jama>
References: <1399887698-19336-1-git-send-email-schnitzeltony@googlemail.com>
	<1399887698-19336-4-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRTX4xmQL_-xgQutMkZJsw2Npq9gWaQoFNVSBDy0RFYaOg@mail.gmail.com>
	<20140513065700.GI22774@jama>
Date: Tue, 13 May 2014 09:06:46 +0200
Message-ID: <CALbNGRTutTFX6jGRXGgezGgUjkTJmcewrQtHzywTgY0Mns9NHw@mail.gmail.com>
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
X-List-Received-Date: Tue, 13 May 2014 07:06:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2014 at 8:57 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Tue, May 13, 2014 at 02:17:07AM +0200, Andreas M=C3=BCller wrote:
>> On Mon, May 12, 2014 at 11:41 AM, Andreas M=C3=BCller
>> <schnitzeltony@googlemail.com> wrote:
>> > buildhistory diff:
>> > --- a/packages/armv7at2hf-vfp-neon-angstrom_wl-linux-gnueabi/qtwayland=
/qtwayland-dev/latest
>> > +++ b/packages/armv7at2hf-vfp-neon-angstrom_wl-linux-gnueabi/qtwayland=
/qtwayland-dev/latest
>> > @@ -4,6 +4,6 @@ PKGV =3D 5.2.1+git0+f9ebbd6c61
>> >  RPROVIDES =3D
>> >  RDEPENDS =3D qtwayland
>> >  RRECOMMENDS =3D eglibc-dev libgcc-dev libstdc++-dev libxkbcommon-dev =
qtbase-dev qtdeclarative-dev wayland-dev xproto-dev zlib-dev
>> > -PKGSIZE =3D 295533
>> > +PKGSIZE =3D 537651
>> >  FILES =3D /usr/include /lib/lib*.so /usr/lib/lib*.so /usr/lib/*.la /u=
sr/lib/*.o /usr/lib/pkgconfig /usr/share/pkgconfig /usr/share/aclocal /lib/=
*.o /usr/lib/qtwayland/*.la /lib/*.la
>> > -FILELIST =3D /usr/include/qt5/QtCompositor/5.3.0/QtCompositor/private=
/qwlclientbufferintegration_p.h /usr/include/qt5/QtCompositor/5.3.0/QtCompo=
sitor/private/qwlclientbufferintegrat
>> > +FILELIST =3D /usr/include/qt5/QtCompositor/5.3.0/QtCompositor/private=
/qwayland-server-hardware-integration.h /usr/include/qt5/QtCompositor/5.3.0=
/QtCompositor/private/qwayland-server
>> >
>> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> > ---
>> >  recipes-qt/qt5/qtwayland_git.bb | 5 +++++
>> >  1 file changed, 5 insertions(+)
>> >
>> > diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwaylan=
d_git.bb
>> > index ebdda82..8da8249 100644
>> > --- a/recipes-qt/qt5/qtwayland_git.bb
>> > +++ b/recipes-qt/qt5/qtwayland_git.bb
>> > @@ -9,3 +9,8 @@ SRCREV =3D "f9ebbd6c618488f9b671f5504528ced3350754fb"
>> >  SRC_URI +=3D " \
>> >      file://0001-examples.pro-include-server-buffer-only-when-buildin.=
patch \
>> >  "
>> > +
>> > +do_install_append() {
>> > +       # do install files created by qtwaylandscanner
>> > +       install ${B}/include/QtCompositor/5.2.1/QtCompositor/private/{=
qwayland-server-*,*protocol*}.h ${D}${includedir}/${QT_DIR_NAME}/QtComposit=
or/5.2.1/QtCompositor/private
>> Aargh: Wrong directory did test with /usr/include and expected
>> includedir =3D /usr/include -> V2 will follow
>
> fwiw: 2/3 and 3/3 were using tabs in do_install, I've fixed it when
> cherry-picking to master-next
Thanks - hope to get that next time...

Andreas

