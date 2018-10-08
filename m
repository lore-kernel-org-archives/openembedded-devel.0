Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1A1CF79164
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Oct 2018 15:29:37 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id v68-v6so5265068qka.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Oct 2018 08:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=VA07/XTBIQQoDzQRU2bEkzRgv21VeyDkY0XaOb9Ty78=;
	b=s/4PDjwZnlNKwxljzYiaR/EbovpSnYFobPzA/cLimaR4zC0jeU+NzuxQ1RvA+Yj0lM
	X5phcMeUB/hxGtD83DHdLpBNmaxLDjsn37k4YI1EVxpaosur1zk8S/1o5wAYmtG/hBzG
	Nw7CDjf6OSfwI3JXY6poF/6Mf0zhdzHSRhrLuQhHxCeR6YxP67M0W+qL/f04Y42aChLP
	sni6HFugxgstqASs+nj2RuGzmVckZ66yrCSIgHVUL5MyhIVF/BjJQcQbyINBaHpykAcv
	/xhh29PG8PlPWWA336OwPZRd9BNwYoTG33M8YAUXR5y97yv1fcw0jhOCFQWLH4Mm+UuL
	gFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=VA07/XTBIQQoDzQRU2bEkzRgv21VeyDkY0XaOb9Ty78=;
	b=IiiMOWCQqLjXrDvEj3k6mPrHmHH1aBLlgmEds+OYhoCaoUBUkEowVHuXN1HGMzPMua
	qeoBJVyWW1TUBMqyme1vAUYO4TZI46hQFPbF32anpm6QDgNLLoTZ+ZGyaiHyAOL6mP9S
	d9+i04YVsRzUN2jKyWm/o7bMZr5jqNAgz+Fb7M+Rp5d9TUmUbo0TTOeWvw+IR+MrUk5Q
	kBjqTpgfdmckLmek9f4g/U5afpEUJ4XcVuFwIxV6NBKjhVcE+2ocqoocyeH7TsTwPY+A
	EPjUAMPI+xo8VmG7TDNpX4bmQQzOzij5Rl7SGC0tq13NyP4TjpELAyixB76e6Io+9Xzg
	AydQ==
X-Gm-Message-State: ABuFfohl2cw7QENrF+4SRibZHEKjX/XVXd4mqnpvcq2pwZsXVAAEdjPE
	j5W6Cw0zbH3r+wr/K2yFg2s2CvdsOQ3PY4EBPAQ=
X-Google-Smtp-Source: ACcGV62GMg0k8iD2FXXgVOfJugblFDjCDq3noxiuzKkOxv4Tn0D/BCXDpaRQ68UhObj//qgwi9UojIdawUEspFi57mo=
X-Received: by 2002:a37:9d55:: with SMTP id
	g82-v6mr19045679qke.315.1539012578767; 
	Mon, 08 Oct 2018 08:29:38 -0700 (PDT)
MIME-Version: 1.0
References: <20181008044741.37650-1-raj.khem@gmail.com>
	<bb6e4c87-6555-2045-d692-fc19de270c22@windriver.com>
In-Reply-To: <bb6e4c87-6555-2045-d692-fc19de270c22@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Oct 2018 08:29:12 -0700
Message-ID: <CAMKF1srvr6hG44N2-JXXo1iWEBBu+RRXB9dePNOA3V5BqDxNqQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>, Anuj Mittal <anuj.mittal@intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] umip: fix recipe location typo
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
X-List-Received-Date: Mon, 08 Oct 2018 15:29:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 7, 2018 at 10:44 PM Hongxu Jia <hongxu.jia@windriver.com> wrote=
:
>
> Thanks for V2, since the troubles introduced by V1, I am testing
> V2 with more builds, the build result is OK (glibc and musl)
>
> Hi Khem,
>
> Is nodejs supposed to be here?

This was an oversight on my part thanks to both of you for spotting it

>
> //Hongxu
>
> On 2018=E5=B9=B410=E6=9C=8808=E6=97=A5 12:47, Khem Raj wrote:
> > From: Hongxu Jia <hongxu.jia@windriver.com>
> >
> > Since `36983fe umip: move to meta-networking' applied,
> > it was moved to invalid location.
> >
> > Fix prior partial move to meta-networking
> >
> > Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >   .../umip/umip}/0001-Add-format-string-to-fprintf-call.patch     | 0
> >   ...01-replace-SIGCLD-with-SIGCHLD-and-include-sys-types.h.patch | 0
> >   .../umip/umip}/0001-support-openssl-1.1.x.patch                 | 0
> >   ...2-replace-PTHREAD_MUTEX_FAST_NP-with-PTHREAD_MUTEX_NOR.patch | 0
> >   .../umip}/add-dependency-to-support-parallel-compilation.patch  | 0
> >   .../recipes-connectivity/umip/umip}/mip6d                       | 0
> >   .../recipes-connectivity/umip/umip}/mip6d.service               | 0
> >   meta-networking/recipes-connectivity/{ =3D> umip}/umip_1.0.bb     | 0
> >   meta-oe/recipes-devtools/nodejs/nodejs_8.12.0.bb                | 2 +=
-
> >   9 files changed, 1 insertion(+), 1 deletion(-)
> >   rename {meta-oe/recipes-connectivity/umip/files =3D> meta-networking/=
recipes-connectivity/umip/umip}/0001-Add-format-string-to-fprintf-call.patc=
h (100%)
> >   rename {meta-oe/recipes-connectivity/umip/files =3D> meta-networking/=
recipes-connectivity/umip/umip}/0001-replace-SIGCLD-with-SIGCHLD-and-includ=
e-sys-types.h.patch (100%)
> >   rename {meta-oe/recipes-connectivity/umip/files =3D> meta-networking/=
recipes-connectivity/umip/umip}/0001-support-openssl-1.1.x.patch (100%)
> >   rename {meta-oe/recipes-connectivity/umip/files =3D> meta-networking/=
recipes-connectivity/umip/umip}/0002-replace-PTHREAD_MUTEX_FAST_NP-with-PTH=
READ_MUTEX_NOR.patch (100%)
> >   rename {meta-oe/recipes-connectivity/umip/files =3D> meta-networking/=
recipes-connectivity/umip/umip}/add-dependency-to-support-parallel-compilat=
ion.patch (100%)
> >   rename {meta-oe/recipes-connectivity/umip/files =3D> meta-networking/=
recipes-connectivity/umip/umip}/mip6d (100%)
> >   rename {meta-oe/recipes-connectivity/umip/files =3D> meta-networking/=
recipes-connectivity/umip/umip}/mip6d.service (100%)
> >   rename meta-networking/recipes-connectivity/{ =3D> umip}/umip_1.0.bb =
(100%)
> >
> > diff --git a/meta-oe/recipes-connectivity/umip/files/0001-Add-format-st=
ring-to-fprintf-call.patch b/meta-networking/recipes-connectivity/umip/umip=
/0001-Add-format-string-to-fprintf-call.patch
> > similarity index 100%
> > rename from meta-oe/recipes-connectivity/umip/files/0001-Add-format-str=
ing-to-fprintf-call.patch
> > rename to meta-networking/recipes-connectivity/umip/umip/0001-Add-forma=
t-string-to-fprintf-call.patch
> > diff --git a/meta-oe/recipes-connectivity/umip/files/0001-replace-SIGCL=
D-with-SIGCHLD-and-include-sys-types.h.patch b/meta-networking/recipes-conn=
ectivity/umip/umip/0001-replace-SIGCLD-with-SIGCHLD-and-include-sys-types.h=
.patch
> > similarity index 100%
> > rename from meta-oe/recipes-connectivity/umip/files/0001-replace-SIGCLD=
-with-SIGCHLD-and-include-sys-types.h.patch
> > rename to meta-networking/recipes-connectivity/umip/umip/0001-replace-S=
IGCLD-with-SIGCHLD-and-include-sys-types.h.patch
> > diff --git a/meta-oe/recipes-connectivity/umip/files/0001-support-opens=
sl-1.1.x.patch b/meta-networking/recipes-connectivity/umip/umip/0001-suppor=
t-openssl-1.1.x.patch
> > similarity index 100%
> > rename from meta-oe/recipes-connectivity/umip/files/0001-support-openss=
l-1.1.x.patch
> > rename to meta-networking/recipes-connectivity/umip/umip/0001-support-o=
penssl-1.1.x.patch
> > diff --git a/meta-oe/recipes-connectivity/umip/files/0002-replace-PTHRE=
AD_MUTEX_FAST_NP-with-PTHREAD_MUTEX_NOR.patch b/meta-networking/recipes-con=
nectivity/umip/umip/0002-replace-PTHREAD_MUTEX_FAST_NP-with-PTHREAD_MUTEX_N=
OR.patch
> > similarity index 100%
> > rename from meta-oe/recipes-connectivity/umip/files/0002-replace-PTHREA=
D_MUTEX_FAST_NP-with-PTHREAD_MUTEX_NOR.patch
> > rename to meta-networking/recipes-connectivity/umip/umip/0002-replace-P=
THREAD_MUTEX_FAST_NP-with-PTHREAD_MUTEX_NOR.patch
> > diff --git a/meta-oe/recipes-connectivity/umip/files/add-dependency-to-=
support-parallel-compilation.patch b/meta-networking/recipes-connectivity/u=
mip/umip/add-dependency-to-support-parallel-compilation.patch
> > similarity index 100%
> > rename from meta-oe/recipes-connectivity/umip/files/add-dependency-to-s=
upport-parallel-compilation.patch
> > rename to meta-networking/recipes-connectivity/umip/umip/add-dependency=
-to-support-parallel-compilation.patch
> > diff --git a/meta-oe/recipes-connectivity/umip/files/mip6d b/meta-netwo=
rking/recipes-connectivity/umip/umip/mip6d
> > similarity index 100%
> > rename from meta-oe/recipes-connectivity/umip/files/mip6d
> > rename to meta-networking/recipes-connectivity/umip/umip/mip6d
> > diff --git a/meta-oe/recipes-connectivity/umip/files/mip6d.service b/me=
ta-networking/recipes-connectivity/umip/umip/mip6d.service
> > similarity index 100%
> > rename from meta-oe/recipes-connectivity/umip/files/mip6d.service
> > rename to meta-networking/recipes-connectivity/umip/umip/mip6d.service
> > diff --git a/meta-networking/recipes-connectivity/umip_1.0.bb b/meta-ne=
tworking/recipes-connectivity/umip/umip_1.0.bb
> > similarity index 100%
> > rename from meta-networking/recipes-connectivity/umip_1.0.bb
> > rename to meta-networking/recipes-connectivity/umip/umip_1.0.bb
> > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_8.12.0.bb b/meta-oe=
/recipes-devtools/nodejs/nodejs_8.12.0.bb
> > index e3b46bc2c8..d0645007c5 100644
> > --- a/meta-oe/recipes-devtools/nodejs/nodejs_8.12.0.bb
> > +++ b/meta-oe/recipes-devtools/nodejs/nodejs_8.12.0.bb
> > @@ -44,7 +44,7 @@ do_configure () {
> >       export LD=3D"${CXX}"
> >       GYP_DEFINES=3D"${GYP_DEFINES}" export GYP_DEFINES
> >       # $TARGET_ARCH settings don't match --dest-cpu settings
> > -   ./configure --prefix=3D${prefix} --without-intl --without-snapshot =
--shared-openssl --shared-zlib \
> > +   ./configure --prefix=3D${prefix} --with-intl=3Dsmall-icu --without-=
snapshot --shared-openssl --shared-zlib \
> >                  --dest-cpu=3D"${@map_nodejs_arch(d.getVar('TARGET_ARCH=
'), d)}" \
> >                  --dest-os=3Dlinux \
> >                  ${ARCHFLAGS}
>
>

