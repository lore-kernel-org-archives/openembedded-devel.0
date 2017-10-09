Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1EE2C6FF73
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Oct 2017 15:37:12 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id m28so9198459pfi.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Oct 2017 08:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Rn49Z/2ghCpS6bUSwj/F7G86E9FgQ2yjApYWqhL+Lts=;
	b=CVna6uz6H/1yBxWPwUv9DOfsptEB471TWx4L4Pryntgrb2LPZqAt6uls/GKLBmsCDx
	nbeskx5G8qcYUz6Eq46R19/G0CamSR05QDoZ+ZtpAnohF/8QMS9WKga4A7TdVsTAc9Px
	nDpm1tBmplN/RxbKG+5L1B649fGswr43+1v2O2lqiTk3PuLkW9RI6zVmlVOIUxTRz3ev
	h/nS+iEMr3Qdy2fM3AogXpECGvHgWH7L63ZJwNvnubtLdheKgUzPYlLof3r13PVNtI+D
	S/orDOFTdTy5vFQt9/+POxSE1TQTiwhUD8Qhmig8vBiJ+9z0YG+6fmOB6pmZBUpLrP1T
	zEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Rn49Z/2ghCpS6bUSwj/F7G86E9FgQ2yjApYWqhL+Lts=;
	b=ou+ciG+FnX2+OaQaE/ASH+22AbGkHTCD5XwgRE91xYb96TEFHuBKWHtCqf1UAzbWx3
	88d0k0kLDSOkO2uYdLewY0rYYpUhEpH2pkx+5/CbHDbsiaZJ9NTqMbbJq8LDIQlgbcEX
	YKiDoTEvn+upkU4tnW2J+6eb3VCRGEI/4NGiB7mo80BLSX+uCIkqQFxUffH38bZ2Y+DY
	ch251JyU3AHiSV0CLCH/PSEdMuDZOwxsp4qziBTtmvopYrr62dpmzFT++WoiFoWXVrZx
	AnIjhz7G91amod5DSG4b37DH8y03eXEVcQtg5HN7qFHdI5xK+8wUdD3+dzzI+Qd8CKMo
	Ovsg==
X-Gm-Message-State: AMCzsaVTyGkE6KJk+y95B8bmH0TczvlzjUQkL2xkpWfeGja5CHxBWV/2
	31WEe6mbQCcac6U9wrzo4SDzhhn2518J7Edruvo=
X-Google-Smtp-Source: AOwi7QADrQ9xjNp01LfHQDNBaBShWXs3TLYaR3vOgD4bgd4m9iyOCG1ZqU5+Z7RBl8fQZ2Qz3TU/xuqWAgyDF94th3k=
X-Received: by 10.98.19.24 with SMTP id b24mr10698976pfj.168.1507563433928;
	Mon, 09 Oct 2017 08:37:13 -0700 (PDT)
MIME-Version: 1.0
References: <1507289466-13238-1-git-send-email-pascal.bach@siemens.com>
	<CAMKF1srGvzWgLJA8muqkTWCA-ahxrKQVbN8JM7y237M8JTXsAg@mail.gmail.com>
	<e86a9605-7690-c7cb-e48c-e31ac1badb9a@siemens.com>
In-Reply-To: <e86a9605-7690-c7cb-e48c-e31ac1badb9a@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 09 Oct 2017 15:37:02 +0000
Message-ID: <CAMKF1sqOqhOXEM_9Lbf0Ut6yg+6wDRWpnvX-W4SGVr-wSke-bQ@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] rocksdb: add version 5.8
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
X-List-Received-Date: Mon, 09 Oct 2017 15:37:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 9, 2017 at 12:16 AM Pascal Bach <pascal.bach@siemens.com> wrote=
:

>
> On 06.10.2017 16:05, Khem Raj wrote:
> > On Fri, Oct 6, 2017 at 4:31 AM, Pascal Bach <pascal.bach@siemens.com>
> wrote:
> >> Version 5.8 does no longer includes the facebook patent grant and is
> >> licensed under the Apache-2.0 license.
> >>
> > I see leveldb as well as GPL-2.0 licence file in repo. Are they not use=
d
> The detailed license assessment from our side is still in progress and
> will probably take several weeks till I have the result.
> I just did a quick survey again and it seems the license is something lik=
e
> (Apache-2.0 | GPL-2.0) & BSD-3-Clause
> The BSD-3-Clause comes from leveldb.


I think it=E2=80=99s good if you can have this sorted in v2

>
>
> I can update the recipe with the above license statement and then, if the
> detailed reports finds something different, I can update the recipe.
> Would this be desirable or should I wait and submit the recipe again afte=
r
> the results are in?
>
> >
> >> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> >> ---
> >>  meta-oe/recipes-extended/rocksdb/rocksdb_git.bb | 26
> +++++++++++++++++++++++++
> >>  1 file changed, 26 insertions(+)
> >>  create mode 100644 meta-oe/recipes-extended/rocksdb/rocksdb_git.bb
> >>
> >> diff --git a/meta-oe/recipes-extended/rocksdb/rocksdb_git.bb
> b/meta-oe/recipes-extended/rocksdb/rocksdb_git.bb
> >> new file mode 100644
> >> index 0000000..a4fbf34
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-extended/rocksdb/rocksdb_git.bb
> >> @@ -0,0 +1,26 @@
> >> +SUMMARY =3D "RocksDB an embeddable, persistent key-value store"
> >> +DESCRIPTION =3D "RocksDB is library that provides an embeddable,
> persistent key-value store for fast storage."
> >> +HOMEPAGE =3D "http://rocksdb.org/"
> >> +LICENSE =3D "Apache-2.0"
> >> +LIC_FILES_CHKSUM =3D
> "file://LICENSE.Apache;md5=3D3b83ef96387f14655fc854ddc3c6bd57"
> >> +
> >> +SRCREV =3D "266ac245affd69555643b735d19d3715c4eff91a"
> >> +PV =3D "5.8+git${SRCPV}"
> >> +
> >> +SRC_URI =3D "git://github.com/facebook/${BPN}.git
> <http://github.com/facebook/$%7BBPN%7D.git>"
> >> +
> >> +S =3D "${WORKDIR}/git"
> >> +
> >> +inherit cmake
> >> +
> >> +PACKAGECONFIG ??=3D "bzip2 zlib lz4"
> >> +PACKAGECONFIG[bzip2] =3D "-DWITH_BZ2=3DON,-DWITH_BZ2=3DOFF,bzip2"
> >> +PACKAGECONFIG[lz4] =3D "-DWITH_LZ4=3DON,-DWITH_LZ4=3DOFF,lz4"
> >> +PACKAGECONFIG[zlib] =3D "-DWITH_ZLIB=3DON,-DWITH_ZLIB=3DOFF,zlib"
> >> +PACKAGECONFIG[lite] =3D "-DROCKSDB_LITE=3DON,-DROCKSDB_LITE=3DOFF"
> >> +
> >> +EXTRA_OECMAKE =3D "\
> >> +    -DPORTABLE=3DON \
> >> +"
> >> +
> >> +FILES_${PN}-dev +=3D "${libdir}/cmake"
> >> --
> >> 2.1.4
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

