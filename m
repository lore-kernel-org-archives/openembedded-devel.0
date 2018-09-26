Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0889E6007A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2018 05:22:38 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id l16-v6so15484447qtq.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2018 22:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=fHZIuKR6oQNdksUwj3EOACmIvbrXARuWkDyWmSjsFKg=;
	b=KmI8T7bHl4U5R13ow9csL95jZJX8RwwUWbOp8JHjU7NWC/rpqLQUQ9DaeIlTi6CXEy
	bkCp0SP5EMjKvMjNLrP3VGNdTGGfN+iFamcJe3nb1re1ol+dlcKlPP1cQaXb+F7XePdC
	UBbxBLWnrkOwYwGCGWOCFdAdDE9BN5SNemICiU5X9oT+DOKbUy2Knlm41ORxFFOlwrph
	aOZbbDSWKYi7NHP3r5Sdu2VtM0GHwO0ntZuVC+IbELNMsW1hJ5s5O4f4uhEs+AmdEz8N
	TVZSUmfLfG3WV/kTgxokDhL6NxhB2EAue/YlUI8fFEk6MWLnB+p7k3UhoRZFPPAa5vIt
	tZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=fHZIuKR6oQNdksUwj3EOACmIvbrXARuWkDyWmSjsFKg=;
	b=Qw1lY2uUGXEAjvLgNfVeGw1X9RRS8ekGSrjJ+vuNIDkOgEY5L6zCznbACvUMUoZqnh
	s3kd5+oovIBK8fgqzBvLe7dNsq+OU6i0auFGp5CN/ND/m4mDPd8rBLjnPEa/ais1K0UR
	2ueHwoULaJNrG6jxiEn6y1yN973qJPJbsXWMWeQNiQrsTbpajtfIVm1wMgxtK4plmHUp
	yOHlJrlVZDFjpGfA8F5vCzM+68xVehDBK947UxF4h8zgdEot0/87Yf/GPNuimD+IkHLS
	8wgnErrOR5H02HqE7MozxUclqfh49AH0ItC8LONjUIXxTry2465mrRBz2bjKBwZSmzVs
	tZAg==
X-Gm-Message-State: ABuFfoiFjLhJZ835RwtTSdZt7kjJiIIvEYbDMuGUrp54FJ4/Gibaqvyc
	TRtizDIvT7Wr731Q9AA8M2IipvxLbu5RNmE5Yso=
X-Google-Smtp-Source: ACcGV60Fg1hoIV+yarZYpbpnEN9hqiSRP1/vAuRYWQJroqlTspViJayyN4bFnclnNK4jNi0oBG7XKGovh3abcPwuPF4=
X-Received: by 2002:a0c:e205:: with SMTP id
	q5-v6mr3078519qvl.224.1537939359531; 
	Tue, 25 Sep 2018 22:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <20180926041449.40951-1-raj.khem@gmail.com>
	<61f68a4a-8bf5-c382-e91e-b709305c722b@gmail.com>
In-Reply-To: <61f68a4a-8bf5-c382-e91e-b709305c722b@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Sep 2018 22:22:13 -0700
Message-ID: <CAMKF1sq0d_yCi3XjN733asUGDmyhNzTO3BH2HMXaB=W1ne3Yew@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] layers: Update layer compatibility to thud
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Sep 2018 05:22:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 25, 2018 at 10:20 PM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 09/25/2018 09:14 PM, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> > Cc: Derek Straka <derek@asterius.io>
> > Cc: Tim Orling <TicoTimo@gmail.com>
> > Cc: Hongxu Jia <hongxu.jia@windriver.com>
> > Cc: Armin Kuster <akuster808@gmail.com>
> > Cc: Joe MacDonald <joe_macdonald@mentor.com>
> > Cc: Andrea Adami <andrea.adami@gmail.com>
> > ---
> >  meta-filesystems/conf/layer.conf                       | 2 +-
> >  meta-gnome/conf/layer.conf                             | 2 +-
> >  meta-initramfs/conf/layer.conf                         | 2 +-
> >  meta-multimedia/conf/layer.conf                        | 2 +-
> >  meta-networking/conf/layer.conf                        | 2 +-
> >  meta-networking/recipes-support/netperf/netperf_git.bb | 2 +-
> >  meta-oe/conf/layer.conf                                | 2 +-
> >  meta-oe/recipes-dbs/mongodb/mongodb_git.bb             | 7 +++----
> Hang on, the mongodb nor the netperf have anything to do 'thud'.
>
> what are those changes for?
>

thanks for pointing it out. They are not meant
to be part here. I will send a v2

> >  meta-perl/conf/layer.conf                              | 2 +-
> >  meta-python/conf/layer.conf                            | 2 +-
> >  meta-webserver/conf/layer.conf                         | 2 +-
> >  meta-xfce/conf/layer.conf                              | 2 +-
> >  12 files changed, 14 insertions(+), 15 deletions(-)
> >
> > diff --git a/meta-filesystems/conf/layer.conf b/meta-filesystems/conf/l=
ayer.conf
> > index dbcff42d44..002f099760 100644
> > --- a/meta-filesystems/conf/layer.conf
> > +++ b/meta-filesystems/conf/layer.conf
> > @@ -15,4 +15,4 @@ LAYERVERSION_filesystems-layer =3D "1"
> >
> >  LAYERDEPENDS_filesystems-layer =3D "core openembedded-layer"
> >
> > -LAYERSERIES_COMPAT_filesystems-layer =3D "sumo"
> > +LAYERSERIES_COMPAT_filesystems-layer =3D "thud"
> > diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
> > index e6e9532b41..e9d0785b1d 100644
> > --- a/meta-gnome/conf/layer.conf
> > +++ b/meta-gnome/conf/layer.conf
> > @@ -14,7 +14,7 @@ LAYERVERSION_gnome-layer =3D "1"
> >
> >  LAYERDEPENDS_gnome-layer =3D "core openembedded-layer networking-layer=
"
> >
> > -LAYERSERIES_COMPAT_gnome-layer =3D "sumo"
> > +LAYERSERIES_COMPAT_gnome-layer =3D "thud"
> >
> >  # Sanity check for meta-gnome layer.
> >  # Setting SKIP_META_GNOME_SANITY_CHECK to "1" would skip the bbappend =
files check.
> > diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/layer=
.conf
> > index 97afc9374e..bd92ddfbc2 100644
> > --- a/meta-initramfs/conf/layer.conf
> > +++ b/meta-initramfs/conf/layer.conf
> > @@ -16,7 +16,7 @@ BBFILE_PATTERN_meta-initramfs :=3D "^${LAYERDIR}/"
> >  BBFILE_PRIORITY_meta-initramfs =3D "8"
> >  LAYERDEPENDS_meta-initramfs =3D "core"
> >
> > -LAYERSERIES_COMPAT_meta-initramfs =3D "sumo"
> > +LAYERSERIES_COMPAT_meta-initramfs =3D "thud"
> >
> >  SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D " \
> >    dracut->virtual/kernel \
> > diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/lay=
er.conf
> > index cfedf2f6b6..e2a7701c33 100644
> > --- a/meta-multimedia/conf/layer.conf
> > +++ b/meta-multimedia/conf/layer.conf
> > @@ -29,4 +29,4 @@ LAYERVERSION_multimedia-layer =3D "1"
> >
> >  LAYERDEPENDS_multimedia-layer =3D "core"
> >
> > -LAYERSERIES_COMPAT_multimedia-layer =3D "sumo"
> > +LAYERSERIES_COMPAT_multimedia-layer =3D "thud"
> > diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/lay=
er.conf
> > index e594b7b957..d36ff5bf95 100644
> > --- a/meta-networking/conf/layer.conf
> > +++ b/meta-networking/conf/layer.conf
> > @@ -17,7 +17,7 @@ LAYERDEPENDS_networking-layer =3D "core"
> >  LAYERDEPENDS_networking-layer +=3D "openembedded-layer"
> >  LAYERDEPENDS_networking-layer +=3D "meta-python"
> >
> > -LAYERSERIES_COMPAT_networking-layer =3D "sumo"
> > +LAYERSERIES_COMPAT_networking-layer =3D "thud"
> >
> >  LICENSE_PATH +=3D "${LAYERDIR}/licenses"
> >
> > diff --git a/meta-networking/recipes-support/netperf/netperf_git.bb b/m=
eta-networking/recipes-support/netperf/netperf_git.bb
> > index f0e0f9cf1f..b6c8027b87 100644
> > --- a/meta-networking/recipes-support/netperf/netperf_git.bb
> > +++ b/meta-networking/recipes-support/netperf/netperf_git.bb
> > @@ -13,7 +13,7 @@ SRC_URI=3D"git://github.com/HewlettPackard/netperf.gi=
t \
> >           file://vfork.patch \
> >           file://init"
> >
> > -SRCREV =3D "f482bab49fcedee46fc5b755da127f608325cd13"
> > +SRCREV =3D "bcb868bde7f0203bbab69609f65d4088ba7398db"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
> > index 1a43575304..64c888d51d 100644
> > --- a/meta-oe/conf/layer.conf
> > +++ b/meta-oe/conf/layer.conf
> > @@ -29,7 +29,7 @@ LAYERVERSION_openembedded-layer =3D "1"
> >
> >  LAYERDEPENDS_openembedded-layer =3D "core"
> >
> > -LAYERSERIES_COMPAT_openembedded-layer =3D "sumo"
> > +LAYERSERIES_COMPAT_openembedded-layer =3D "thud"
> >
> >  LICENSE_PATH +=3D "${LAYERDIR}/licenses"
> >
> > diff --git a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/recip=
es-dbs/mongodb/mongodb_git.bb
> > index bcb15e6c5b..dae1125265 100644
> > --- a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
> > +++ b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
> > @@ -10,9 +10,9 @@ DEPENDS =3D "openssl libpcre libpcap zlib boost curl =
python \
> >
> >  inherit scons dos2unix siteinfo pythonnative
> >
> > -PV =3D "4.0.1+git${SRCPV}"
> > -#v4.0.1
> > -SRCREV =3D "54f1582fc6eb01de4d4c42f26fc133e623f065fb"
> > +PV =3D "4.0.2+git${SRCPV}"
> > +#v4.0.2
> > +SRCREV =3D "fc1573ba18aee42f97a3bb13b67af7d837826b47"
> >  SRC_URI =3D "git://github.com/mongodb/mongo.git;branch=3Dv4.0 \
> >             file://0001-Tell-scons-to-use-build-settings-from-environme=
nt-va.patch \
> >             file://0001-Use-long-long-instead-of-int64_t.patch \
> > @@ -20,7 +20,6 @@ SRC_URI =3D "git://github.com/mongodb/mongo.git;branc=
h=3Dv4.0 \
> >             file://0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLA=
SS.patch \
> >             file://arm64-support.patch \
> >             file://0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_=
t.patch \
> > -           file://disable-hw-crc32-on-arm64-s390x.patch \
> >             file://0001-Support-deprecated-resolver-functions.patch \
> >             "
> >  SRC_URI_append_libc-musl =3D"\
> > diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
> > index ece6dd05eb..b2bb379105 100644
> > --- a/meta-perl/conf/layer.conf
> > +++ b/meta-perl/conf/layer.conf
> > @@ -15,4 +15,4 @@ LAYERVERSION_perl-layer =3D "1"
> >
> >  LAYERDEPENDS_perl-layer =3D "core openembedded-layer"
> >
> > -LAYERSERIES_COMPAT_perl-layer =3D "sumo"
> > +LAYERSERIES_COMPAT_perl-layer =3D "thud"
> > diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
> > index 7089071faf..321d51bee7 100644
> > --- a/meta-python/conf/layer.conf
> > +++ b/meta-python/conf/layer.conf
> > @@ -14,6 +14,6 @@ LAYERVERSION_meta-python =3D "1"
> >
> >  LAYERDEPENDS_meta-python =3D "core openembedded-layer"
> >
> > -LAYERSERIES_COMPAT_meta-python =3D "sumo"
> > +LAYERSERIES_COMPAT_meta-python =3D "thud"
> >
> >  LICENSE_PATH +=3D "${LAYERDIR}/licenses"
> > diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer=
.conf
> > index f205ef23b1..aaa3a95c4f 100644
> > --- a/meta-webserver/conf/layer.conf
> > +++ b/meta-webserver/conf/layer.conf
> > @@ -17,7 +17,7 @@ LAYERVERSION_webserver =3D "1"
> >
> >  LAYERDEPENDS_webserver =3D "core openembedded-layer"
> >
> > -LAYERSERIES_COMPAT_webserver =3D "sumo"
> > +LAYERSERIES_COMPAT_webserver =3D "thud"
> >
> >  LICENSE_PATH +=3D "${LAYERDIR}/licenses"
> >
> > diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
> > index bee8e70441..f5f44d64bc 100644
> > --- a/meta-xfce/conf/layer.conf
> > +++ b/meta-xfce/conf/layer.conf
> > @@ -18,7 +18,7 @@ LAYERDEPENDS_xfce-layer +=3D "gnome-layer"
> >  LAYERDEPENDS_xfce-layer +=3D "multimedia-layer"
> >  LAYERDEPENDS_xfce-layer +=3D "meta-python"
> >
> > -LAYERSERIES_COMPAT_xfce-layer =3D "sumo"
> > +LAYERSERIES_COMPAT_xfce-layer =3D "thud"
> >
> >  SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D " \
> >    xfce4-session->machine-host \
>

