Received: from mail-gh0-f178.google.com ([209.85.160.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SZl8U-00083I-Fr
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 May 2012 17:48:34 +0200
Received: by ghbf1 with SMTP id f1so3085318ghb.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2012 08:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=VRkgdH6JmsrOVuaeSwCU4D+sQpJuJXH8mWGnnKkYvoM=;
	b=oUvKj2DE8BgkcIearoTLM3btq9llXSI6ESid+jGUs3uNMbl3RN2GZcvMa4N+JsqEkW
	gw18Ri+99Y0hRZ6Rh30IW4l5vHU8YFnQAihzljQeEW16PuE2m3cBBz4BlnqAVUdrfCXb
	nvqVJ8D8gjkqSOlvOYCzC0R1inX9cQnEWLhnnVx6MlBkJl0QcdriGi3LQ1op4lu8immj
	hNC8IYW4mI3y1Iu+BE0JaHrylPnQDyQIkDHlFQLCzuJPdFEcNhbquInXDaNtqt37yd4u
	e7gWzcoJLY6raTRjbgRznf2z3JX7Lipkgw4XsZrbPB8CEgxizZL9Lc3IO/OK6t2I8gG0
	VsOA==
MIME-Version: 1.0
Received: by 10.50.158.233 with SMTP id wx9mr11187110igb.42.1338392294980;
	Wed, 30 May 2012 08:38:14 -0700 (PDT)
Received: by 10.64.18.10 with HTTP; Wed, 30 May 2012 08:38:14 -0700 (PDT)
In-Reply-To: <20120530153233.GR3138@jama.jama.net>
References: <cover.1338386047.git.Martin.Jansa@gmail.com>
	<2484826dbf17baf50370f5484aa22f43200992dd.1338386047.git.Martin.Jansa@gmail.com>
	<CALbNGRTHSa+An9tURPWUQRgzZL8dMWN2s1uYJ+WyH41W=y-98Q@mail.gmail.com>
	<20120530152220.GQ3138@jama.jama.net>
	<CALbNGRS2vZ5_57H+u8O=jWkXUy1UD__-aB6KwDTgY-gyXCen4A@mail.gmail.com>
	<20120530153233.GR3138@jama.jama.net>
Date: Wed, 30 May 2012 17:38:14 +0200
Message-ID: <CALbNGRTtxTWiLXG06uzUxy8oCBOaXrfsvN=JMHaAyFLSsY6W_g@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-efl][PATCH 2/3] systemd.bbclass: fix postinst/rdepends generation for recipes with SYSTEMD_SERVICE (without _PN suffix)
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
X-List-Received-Date: Wed, 30 May 2012 15:48:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, May 30, 2012 at 5:32 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Wed, May 30, 2012 at 05:26:46PM +0200, Andreas M=FCller wrote:
>> On Wed, May 30, 2012 at 5:22 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>> > On Wed, May 30, 2012 at 05:14:58PM +0200, Andreas M=FCller wrote:
>> >> On Wed, May 30, 2012 at 4:21 PM, Martin Jansa <martin.jansa@gmail.com=
> wrote:
>> >> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> >> > ---
>> >> > =A0meta-oe/classes/systemd.bbclass | =A0 =A03 ++-
>> >> > =A01 files changed, 2 insertions(+), 1 deletions(-)
>> >> >
>> >> > diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/syst=
emd.bbclass
>> >> > index db35717..e895021 100644
>> >> > --- a/meta-oe/classes/systemd.bbclass
>> >> > +++ b/meta-oe/classes/systemd.bbclass
>> >> > @@ -201,7 +201,8 @@ python populate_packages_prepend () {
>> >> > =A0 =A0 =A0 =A0# run all modifications once when creating package
>> >> > =A0 =A0 =A0 =A0if os.path.exists('${D}'):
>> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for pkg_systemd in d.getVar('SYSTEMD=
_PACKAGES', 1).split():
>> >> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if d.getVar('SYSTEMD_=
SERVICE' + "_" + pkg_systemd, 1) and d.getVar('SYSTEMD_SERVICE' + "_" + pkg=
_systemd, 1).strip():
>> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 systemd_services =3D =
d.getVar('SYSTEMD_SERVICE' + "_" + pkg_systemd, 1) or d.getVar('SYSTEMD_SER=
VICE', 1)
>> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if systemd_services a=
nd systemd_services.strip():
>> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0syst=
emd_generate_package_scripts(pkg_systemd)
>> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0syst=
emd_add_rdepends(pkg_systemd)
>> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0systemd_check_services()
>> >> > --
>> >> > 1.7.8.6
>> >> >
>> >> Two questions:
>> >>
>> >> 1. Did you see [1]?
>> >
>> > no, did you forgot to attach it? :)
>> >
>> >> 2. What is that strip for?
>> >
>> > In one .bbappend I had something like
>> >
>> > SERVICES =3D "foo"
>> > SERVICES_bar =3D ""
>> > SYSTEMD_SERVICE +=3D "${SERVICES}"
>> >
>> > And space was ending in SYSTEMD_SERVICE causing this to be executed
>> > without any real service in it (and failing).
>> >
>> > I can fix it by using _append but this .strip() looked like better
>> > solution for other who don't notice extra whitespace.
>> >
>> > Cheers,
>> >
>> > --
>> > Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
>> Yes :)
>> http://patches.openembedded.org/patch/28841/
>
> Ah, sorry, I haven't noticed this, looks good too (I can fix that case
> with extra whitespace in my .bbappend if needed).
>
> both can fix this:
> http://trac.shr-project.org/trac/ticket/2003
>
> :)
>
> Cheers,
>
I think yours is better for your use case - sorry I still do not yet
understand it - but don't worry for that. But my concern is that there
are other places in systemd.bbclass failing for space issue. Did you
check that?

Andreas


