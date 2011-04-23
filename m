Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QDQJb-0004dV-2i
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Apr 2011 02:03:11 +0200
Received: by eye27 with SMTP id 27so275485eye.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2011 17:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=dIRFpdnqLBJ87liaRpoLd0FnCb48PCj7KAuEDBYrSP8=;
	b=TYrH6sVhh+XJwHHFL50dq0DIQB8DowxsjinsLBGZGtmXiM/4r4qYkaLTduCsG/RsAn
	9mv6Doo/ZaG0rkxbP6vsrGPRn/0br6TmOG2EPotFcOedqpfmWUe9Evk30llXAcyUYNlT
	Wmu4o1fa/wQMzsn0v6viKh/n79TpMCIQAWSUE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=jh2bF84o211vlgSc0pqDcJEuBUNbNdoMWkTEAEVEfDgkOxzimJqroEWp3hbIjbiXKf
	qiVC8DzDLqeHhyz5RBzrQkDTDjpprKFUmwdp8a5nKfjapPfPxhBldFI0WihV3Cs6a4C8
	9dzqSrOyzMGHj88wXjNsyebbC1HsZm0l2DHAU=
Received: by 10.14.43.218 with SMTP id l66mr537401eeb.188.1303516842656; Fri,
	22 Apr 2011 17:00:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.119.196 with HTTP; Fri, 22 Apr 2011 17:00:12 -0700 (PDT)
In-Reply-To: <1303501867.4155.11.camel@mattotaupa>
References: <201104201007.04378.sgh@sgh.dk>
	<1303501867.4155.11.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Apr 2011 17:00:12 -0700
Message-ID: <BANLkTi=ESz3Eqxw52Rr1aOX0tEQ4bwiOHQ@mail.gmail.com>
To: Paul Menzel <paulepanter@users.sourceforge.net>
Cc: =?UTF-8?Q?S=C3=B8ren_Holm?= <soeren.holm@mikrofyn.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] wvstreams: add patch to add missing header includes
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
X-List-Received-Date: Sat, 23 Apr 2011 00:03:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 22, 2011 at 12:51 PM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> From: S=C3=B8ren Holm <soeren.holm@mikrofyn.com>
> Date: Wed, 20 Apr 2011 09:48:43 +0200
>
> Building fails with the following error.
>
> | ./CXX -c ipstreams/wvunixdgsocket
> | In file included from ./include/wvunixdgsocket.h:13:0,
> | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ipst=
reams/wvunixdgsocket.cc:1:
> | ./include/wvaddr.h: In member function 'uint32_t WvIPAddr::addr() const=
':
> | ./include/wvaddr.h:284:31: warning: dereferencing type-punned pointer w=
ill break strict-aliasing rules
> | ipstreams/wvunixdgsocket.cc: In constructor 'WvUnixDGSocket::WvUnixDGSo=
cket(const WvFastString&, bool, int)':
> | ipstreams/wvunixdgsocket.cc:50:32: error: 'chmod' was not declared in t=
his scope
> | make: *** [ipstreams/wvunixdgsocket.o] Error 1
>
> This patch is build tested using `angstrom-2010.x` and `minimal` for `MAC=
HINE =3D "beagleboard"`. The build still fails when uClibc is used.
>
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> CC: S=C3=B8ren Holm <soeren.holm@mikrofyn.com>
> CC: Khem Raj <raj.khem@gmail.com>

Looks ok to me.

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> 1. S=C3=B8ren, please add your Signed-off-by line in front of mine. This =
is a demanded by the commit policy [1].
> 2. I am adding Khem, since he seems to be the original author of this pat=
ch. It would be great to get his Acked-by too.
> 3. S=C3=B8ren, please send your patch upstream.
> 4. S=C3=B8ren, when you have a little time it would be great if you could=
 update WvStreams to 4.6.1 and test it.
> 5. S=C3=B8ren, I removed `apply=3Dyes` since that is the default.
>
> [1] http://openembedded.org/index.php/Commit_Policy
> ---
> =C2=A0.../files/0001-Fixed-missing-header-includes.patch | =C2=A0 37 ++++=
++++++++++++++++
> =C2=A0recipes/wvstreams/wvstreams_4.6.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A01 +
> =C2=A02 files changed, 38 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/wvstreams/files/0001-Fixed-missing-heade=
r-includes.patch
>
> diff --git a/recipes/wvstreams/files/0001-Fixed-missing-header-includes.p=
atch b/recipes/wvstreams/files/0001-Fixed-missing-header-includes.patch
> new file mode 100644
> index 0000000..f6d99f0
> --- /dev/null
> +++ b/recipes/wvstreams/files/0001-Fixed-missing-header-includes.patch
> @@ -0,0 +1,37 @@
> +From d76ec92a9e09fefa3083250f4aa588d0e94fe20c Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?S=3DC3=3DB8ren=3D20Holm?=3D <sh@mikrofyn.com>
> +Date: Wed, 20 Apr 2011 09:41:22 +0200
> +Subject: [PATCH] Fixed missing header includes.
> +
> +---
> + ipstreams/wvunixdgsocket.cc | =C2=A0 =C2=A02 +-
> + streams/wvatomicfile.cc =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/ipstreams/wvunixdgsocket.cc b/ipstreams/wvunixdgsocket.cc
> +index 41d2911..6dc12fc 100644
> +--- a/ipstreams/wvunixdgsocket.cc
> ++++ b/ipstreams/wvunixdgsocket.cc
> +@@ -1,5 +1,5 @@
> + #include "wvunixdgsocket.h"
> +-#ifdef MACOS
> ++#if defined(MACOS) || defined(__GNUC__)
> + #include <sys/types.h>
> + #include <sys/stat.h>
> + #endif
> +diff --git a/streams/wvatomicfile.cc b/streams/wvatomicfile.cc
> +index 65ae202..0a58069 100644
> +--- a/streams/wvatomicfile.cc
> ++++ b/streams/wvatomicfile.cc
> +@@ -11,7 +11,7 @@
> + #include "wvfileutils.h"
> + #include "wvstrutils.h"
> +
> +-#ifdef MACOS
> ++#if defined(MACOS) || defined(__GNUC__)
> + #include <sys/stat.h>
> + #endif
> +
> +--
> +1.7.4.1
> +
> diff --git a/recipes/wvstreams/wvstreams_4.6.bb b/recipes/wvstreams/wvstr=
eams_4.6.bb
> index 1c11268..0eb0198 100644
> --- a/recipes/wvstreams/wvstreams_4.6.bb
> +++ b/recipes/wvstreams/wvstreams_4.6.bb
> @@ -6,6 +6,7 @@ DEPENDS =3D "zlib openssl (>=3D 0.9.8)"
> =C2=A0PR =3D "r1"
>
> =C2=A0SRC_URI =3D "http://wvstreams.googlecode.com/files/${PN}-${PV}.tar.=
gz \
> + =C2=A0 =C2=A0 =C2=A0 file://0001-Fixed-missing-header-includes.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0"
>
> =C2=A0inherit autotools pkgconfig
> --
> 1.7.4.4
>


