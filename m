Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2B36F7C377
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Mar 2019 18:25:48 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id d18so9950301qtg.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Mar 2019 10:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=cESzcFrN8I+z3meXJMMcXoe7njnCRPnDVfjK8vuNDrY=;
	b=nQeX3EGf+qI0K2DVlZi/Hx23cSzvmzJ6RbtxKkFZ6cYY0GzBYYp3VXG0IoCdDXtYLK
	Iy8JyJvEl0vCL/vpXa3VRzCLJ4qyb47z3avtqpwHhPZqxHusREn6AfLQCX0LdrczeYZd
	C9MyIwVsljQASmas31QdcrYdRu3vcZylDPLLwWMdjH9zoTlZnSE1kvHXFk+MDLEr3G8C
	ddzpmTytnD5yRHfWUrzGiVTZsZx41U5XSTcLPdzcIaP3LL/Qu8pnuLZMIvSJ4Q8iN6vx
	00NxWjwQrz7ffKyHqEzLLN3BmHrC2zAqWzHoSVmi2CZl0pZCKhgDJJgF2ZfMWaq/6nGr
	7abg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=cESzcFrN8I+z3meXJMMcXoe7njnCRPnDVfjK8vuNDrY=;
	b=B1U6sn94Kq63nBTXwvKzeddF30LaY6ntjpow+Iv6H2UszToe4DnlvM68gdY5vhL+lw
	LZ/NgGdHKWuwPUJ/Iv81pBTosOvC9N5Zyv6z/EflPfJ0e5s1D8OJf11FRR1K/hn2k1Yh
	/clezp80vvbIGAb+CB5WncFbBZNMcWuiGEzZKdsZCqZB31mE9UN4B6IkxbEOmeQ6FIc4
	5Hxj5aVgb8xLAI8G0fh+Jnas4y/x1QEtMtSfww2lOSuG7I2muIpX3KMqiDHen0Ao6dYt
	nUQu3l92zdntrug19y1WQ1uAFAnJJ1Wy6i4ZRXe16vtmwQR4UZx1Yiy/Rr6gZCXpsogV
	iMYA==
X-Gm-Message-State: APjAAAWmGErutQMcTw5GbMbyaCK64r1QOhjOlMV2K49VSOvN8sbdu55O
	0Eegd48en2Mnx/pxsMloyE4hJ6zirPzdO2rYWwQ=
X-Google-Smtp-Source: APXvYqw/ey1e9Gcoe79nex57CerEhWhhTxa2X2mFa1XPg1PlYQ1e4ybf4H7p7a0b7WtEjmsv0WRnFetDeCNuC2lcdc4=
X-Received: by 2002:a0c:ba1d:: with SMTP id w29mr3158545qvf.228.1551810348744; 
	Tue, 05 Mar 2019 10:25:48 -0800 (PST)
MIME-Version: 1.0
References: <20190304042758.30133-1-raj.khem@gmail.com>
	<5C7E1D80.3060405@windriver.com>
In-Reply-To: <5C7E1D80.3060405@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Mar 2019 10:25:22 -0800
Message-ID: <CAMKF1spidZ5pq7Fw5YJx8aq4C5jWodm9gT+8kvZiGPFQPaG-Zw@mail.gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] mariadb: Upgrade to 5.5.63
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
X-List-Received-Date: Tue, 05 Mar 2019 18:25:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 4, 2019 at 10:50 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> Hi Khem,
>
> I sent out another patch to upgrade mariadb to 10.3.13 as 5.5.x series
> is only supported until next year April 2020 per
> https://mariadb.org/about/maintenance-policy/, please help to review.
>

Thanks for update, I think its fine to move to 10.x

> Thanks,
>
> On 2019=E5=B9=B403=E6=9C=8804=E6=97=A5 12:27, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >   .../{mariadb-native_5.5.62.bb =3D> mariadb-native_5.5.63.bb}  | 0
> >   meta-oe/recipes-dbs/mysql/mariadb.inc                       | 6 +++--=
-
> >   .../mysql/{mariadb_5.5.62.bb =3D> mariadb_5.5.63.bb}          | 0
> >   3 files changed, 3 insertions(+), 3 deletions(-)
> >   rename meta-oe/recipes-dbs/mysql/{mariadb-native_5.5.62.bb =3D> maria=
db-native_5.5.63.bb} (100%)
> >   rename meta-oe/recipes-dbs/mysql/{mariadb_5.5.62.bb =3D> mariadb_5.5.=
63.bb} (100%)
> >
> > diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_5.5.62.bb b/meta-=
oe/recipes-dbs/mysql/mariadb-native_5.5.63.bb
> > similarity index 100%
> > rename from meta-oe/recipes-dbs/mysql/mariadb-native_5.5.62.bb
> > rename to meta-oe/recipes-dbs/mysql/mariadb-native_5.5.63.bb
> > diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-db=
s/mysql/mariadb.inc
> > index 8ca5b2ba42..f715542038 100644
> > --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> > +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> > @@ -4,7 +4,7 @@ SECTION =3D "libs"
> >   LICENSE =3D "GPLv2"
> >   LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa=
882bbe"
> >
> > -SRC_URI =3D "https://downloads.mariadb.org/f/${BP}/source/${BP}.tar.gz=
 \
> > +SRC_URI =3D "https://downloads.mariadb.org/interstitial/${BP}/source/$=
{BP}.tar.gz \
> >              file://fix-cmake-module-path.patch \
> >              file://remove-bad-path.patch \
> >              file://fix-mysqlclient-r-version.patch \
> > @@ -18,8 +18,8 @@ SRC_URI =3D "https://downloads.mariadb.org/f/${BP}/so=
urce/${BP}.tar.gz \
> >              file://change-cc-to-cc-version.patch \
> >              file://0001-disable-ucontext-on-musl.patch \
> >             "
> > -SRC_URI[md5sum] =3D "6375d577e9539b839f44d857e70f82b9"
> > -SRC_URI[sha256sum] =3D "56a365af71b8a9ec8bfee0801e2dec95011da8ee750798=
6ca329be11296411db"
> > +SRC_URI[md5sum] =3D "f91b31638d4dc47ed43172e56bec2cb7"
> > +SRC_URI[sha256sum] =3D "ef1cf79eec32ced9d1051998a8e458bb33dfbc62de297c=
ba37ee8e9f952b21ea"
> >
> >   UPSTREAM_CHECK_URI =3D "https://github.com/MariaDB/server/releases"
> >
> > diff --git a/meta-oe/recipes-dbs/mysql/mariadb_5.5.62.bb b/meta-oe/reci=
pes-dbs/mysql/mariadb_5.5.63.bb
> > similarity index 100%
> > rename from meta-oe/recipes-dbs/mysql/mariadb_5.5.62.bb
> > rename to meta-oe/recipes-dbs/mysql/mariadb_5.5.63.bb
> >

