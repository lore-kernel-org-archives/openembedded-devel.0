Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OvwPi-0005pU-FF
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 20:09:04 +0200
Received: by iwn2 with SMTP id 2so310413iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Sep 2010 11:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=1bCxCPTuTKuzQYaI+CczfWfiTuWR7jdLnTHzlWW0/e4=;
	b=YfAM68om8IlWAgLUBYmo4KVtu4+hMso3OGWzjjYWe7GRshwudOlfPmmHKUDaJ00yqM
	IUy9zr3NgW/5DE8q3YbKqCh2GnMuIuAXcRIY0TL618Q6si+GBuRndJsxNMZDEBujtF3h
	CWVbJameKt0oLGDGaNt/tVFyvjGPoRuBxHZFQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=s3FGHl600XMwsnBIZhR0JiG8syiRE61fQJOVQWLSgo0kHT2Z9ZAlDLpyhPuDvFQ+nC
	ob5DPApfut2VH3jv2PtVgIVXB7bbEbANrheLH4jnsYkTAq5YFQ63q17n26syVxRRUPkv
	k0Wv7CMrHVlcmrndN/k9+cvcBR+RLoZcOUViQ=
Received: by 10.231.11.197 with SMTP id u5mr1227117ibu.41.1284574080625; Wed,
	15 Sep 2010 11:08:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.205.134 with HTTP; Wed, 15 Sep 2010 11:07:29 -0700 (PDT)
In-Reply-To: <1284494173-30471-1-git-send-email-ydirson@altern.org>
References: <1284494173-30471-1-git-send-email-ydirson@altern.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Sep 2010 11:07:29 -0700
Message-ID: <AANLkTi=dPVmm5iB8mzpTvYSv17uiHcM5rx8z7LX02Z2C@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Yann Dirson <ydirson@altern.org>
Subject: Re: [PATCH 1/2] gnugo_3.8: initial packaging.
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
X-List-Received-Date: Wed, 15 Sep 2010 18:09:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 14, 2010 at 12:56 PM, Yann Dirson <ydirson@altern.org> wrote:
> Cross-compiling patches included.
>
> Signed-off-by: Yann Dirson <ydirson@altern.org>
> ---
> =C2=A0...C_CANONICAL_BUILD-for-cross-build-support.patch | =C2=A0 25 +
> =C2=A0...Add-support-for-BUILD_-for-cross-building.patch | =C2=A0 41 +
> =C2=A0...lso-generate-native-versions-use-them-whe.patch | =C2=A0263 +
> =C2=A0recipes/gnugo/gnugo/0004-Autotools-refresh.patch =C2=A0 |13671 ++++=
++++++++++++++++
> =C2=A0recipes/gnugo/gnugo_3.8.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 22 +
> =C2=A05 files changed, 14022 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/gnugo/gnugo/0001-Add-AC_CANONICAL_BUILD-=
for-cross-build-support.patch
> =C2=A0create mode 100644 recipes/gnugo/gnugo/0002-Add-support-for-BUILD_-=
for-cross-building.patch
> =C2=A0create mode 100644 recipes/gnugo/gnugo/0003-Make-libs-also-generate=
-native-versions-use-them-whe.patch
> =C2=A0create mode 100644 recipes/gnugo/gnugo/0004-Autotools-refresh.patch
> =C2=A0create mode 100644 recipes/gnugo/gnugo_3.8.bb
>
> diff --git a/recipes/gnugo/gnugo/0001-Add-AC_CANONICAL_BUILD-for-cross-bu=
ild-support.patch b/recipes/gnugo/gnugo/0001-Add-AC_CANONICAL_BUILD-for-cro=
ss-build-support.patch
> new file mode 100644
> index 0000000..8bdf952
> --- /dev/null
> +++ b/recipes/gnugo/gnugo/0001-Add-AC_CANONICAL_BUILD-for-cross-build-sup=
port.patch
> @@ -0,0 +1,25 @@
> +From d8cd51026264b5e08d12eec25722abc3156066cc Mon Sep 17 00:00:00 2001
> +From: Yann Dirson <ydirson@altern.org>
> +Date: Fri, 10 Sep 2010 21:45:41 +0200
> +Subject: [PATCH 1/4] Add AC_CANONICAL_BUILD for cross-build support.
> +
> +Signed-off-by: Yann Dirson <ydirson@altern.org>

> diff --git a/recipes/gnugo/gnugo_3.8.bb b/recipes/gnugo/gnugo_3.8.bb
> new file mode 100644
> index 0000000..4cdc8ff
> --- /dev/null
> +++ b/recipes/gnugo/gnugo_3.8.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION =3D "A Go/Weiqi/Baduk playing engine."
> +HOMEPAGE =3D "http://www.gnu.org/software/gnugo/gnugo.html"
> +SECTION =3D "console"
> +PRIORITY =3D "optional"
> +LICENSE =3D "GPL"
> +
> +SRC_URI =3D "${GNU_MIRROR}/gnugo/${PN}-${PV}.tar.gz"
> +
> +SRC_URI +=3D "file://0001-Add-AC_CANONICAL_BUILD-for-cross-build-support=
.patch"
> +SRC_URI +=3D "file://0002-Add-support-for-BUILD_-for-cross-building.patc=
h"
> +SRC_URI +=3D "file://0003-Make-libs-also-generate-native-versions-use-th=
em-whe.patch"
> +SRC_URI +=3D "file://0004-Autotools-refresh.patch"

SRC_URI could be something like

SRC_URI =3D "${GNU_MIRROR}/gnugo/${PN}-${PV}.tar.gz \
file://0001-Add-AC_CANONICAL_BUILD-for-cross-build-support.patch \
....
...
...
"


> +
> +S =3D "${WORKDIR}/gnugo-${PV}"

you might not need to set S here

> +PR =3D "r1"
> +

PR starts with r0 for initial recipes

> +inherit autotools
> +EXTRA_OEMAKE =3D 'BUILD_CC=3D"$BUILD_CC" BUILD_LD=3D"$BUILD_LD" BUILD_CF=
LAGS=3D"$BUILD_CFLAGS" BUILD_LDFLAGS=3D"$BUILD_LDFLAGS"'
> +
> +# FIXME: should verify those checksums through other means

> +SRC_URI[md5sum] =3D "6db0a528df58876d2b0ef1659c374a9a"
> +SRC_URI[sha256sum] =3D "da68d7a65f44dcf6ce6e4e630b6f6dd9897249d34425920b=
fdd4e07ff1866a72"
> --
> 1.7.2.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
-Khem


