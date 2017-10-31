Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id D164A6AC00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 19:11:01 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id b85so1658pfj.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 12:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uc3SuwQ7q4UTXZFLJ0nWmJn077K6JfZGiG81itxu2/A=;
	b=mMH4Ao6pBe5MNVVGWCssmzaitsbfRH3mkH1AZz0efi8E9hEoeQoWsLWLA7HZLXag2L
	HhOxaL70mw0Q5KS/5X6VSZ8oTJPOT4W9FTRM4ZWTND7rapr9fCwdsYP1rF9FgScHYj0U
	fsDlMeyym00vmQ92GHNH4yDonY0FlGSaQKs4Py2A5jSpb2BTaEEYGpWqCXvT83PfiDdP
	Pyk0cDsdsDZpaYgs6CHTgd1lvxnrBqdiDL1rQA9MOAFdvgtC8VuJJFdAQEhsJslFX68v
	lxoYX/0v+zuq3RNTlOI+naOGwHe5O9EcSq/SfAmydh3HeeBxYfdL9zfhFBI+8uWOFu3p
	ARIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uc3SuwQ7q4UTXZFLJ0nWmJn077K6JfZGiG81itxu2/A=;
	b=rtjAyXZY4c0SzjphCAfNdPCQD5KdRKzEWDjlBVYr3fkE8mzqy5FtOaE6cxOQgeWwJv
	Bp2oN1OjnfUtCq1K8tGVP8RS07zZ16N+Ao7xp5IvTDDLVZBqpR/kq+M6YHkc9qKNaFzM
	6TEhfN/212b7w/0Nr/6UYuB6qXov0m+DkS0ovR11OReFc9f6lBn6EQ1YcW7OHHW8RoFc
	jtOLdozXQdpT5LEhK1TFlrKAChF7OSAswR58h1uCD7T86dja8mQx1ObpFN+BY3A9/8PE
	RtJYzF6c0P+yAPL3D8DJUT6Yan02gw+KynRyuFfJMPL5DfL+SBtBP3QdBFN0xE4qIJVE
	uzVg==
X-Gm-Message-State: AMCzsaW5QGTTSGzYXw2yX0h51w40kDrbgcLfO2VNAlwbGH+1z1D7kwfP
	smz/0xZUr8hp9kVBkZyskHqWrUVF15tl48osDqQ=
X-Google-Smtp-Source: ABhQp+QJgPGI6XrLDTMdCNnF8BHNbGAbarFMNgQBghm13r5UZSwpebxxQ6HgsiTx8NC6oXouZPJTMjjk9Uh8bn3ldGE=
X-Received: by 10.98.58.157 with SMTP id v29mr3065722pfj.294.1509477062939;
	Tue, 31 Oct 2017 12:11:02 -0700 (PDT)
MIME-Version: 1.0
References: <1509387073-21934-1-git-send-email-joe_macdonald@mentor.com>
	<1509387073-21934-3-git-send-email-joe_macdonald@mentor.com>
	<CAMKF1sqR75pr0HCO93hmyzRffDPJcDUECvvQLSUih0AUbsh1SA@mail.gmail.com>
	<20171031132943.pidvmprs575jemse@mentor.com>
In-Reply-To: <20171031132943.pidvmprs575jemse@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 31 Oct 2017 19:10:52 +0000
Message-ID: <CAMKF1sqpwSbcFy0dXPnp8C26yeN+uAZoXa1A3R=9nCbWvRCe=g@mail.gmail.com>
To: Joe MacDonald <Joe_MacDonald@mentor.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 2/6] lksctp-tools: update and remove from blacklist
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
X-List-Received-Date: Tue, 31 Oct 2017 19:11:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 31, 2017 at 6:29 AM Joe MacDonald <Joe_MacDonald@mentor.com>
wrote:

> [Re: [oe] [meta-networking][PATCH 2/6] lksctp-tools: update and remove
> from blacklist] On 17.10.30 (Mon 16:21) Khem Raj wrote:
>
> > On Mon, Oct 30, 2017 at 11:11 AM, Joe MacDonald
> > <joe_macdonald@mentor.com> wrote:
> > > Switching lksctp-tools to build from the upstream git repository rath=
er
> > > than a source tarball.  At the same time we'll un-blacklist it since =
it
> > > appears the gold-as-ld issue has been resolved underneath us, probabl=
y
> > > related to a Debian bug of the same form that was also resolved with =
a
> > > binutils update.
> > >
> > > Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> > > ---
> > >  .../recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb  | 16
> +++++-----------
> > >  1 file changed, 5 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/meta-networking/recipes-support/lksctp-tools/
> lksctp-tools_1.0.17.bb b/meta-networking/recipes-support/lksctp-tools/
> lksctp-tools_1.0.17.bb
> > > index 11c43ff..9166aa5 100644
> > > --- a/meta-networking/recipes-support/lksctp-tools/
> lksctp-tools_1.0.17.bb
> > > +++ b/meta-networking/recipes-support/lksctp-tools/
> lksctp-tools_1.0.17.bb
> > > @@ -8,22 +8,16 @@ LIC_FILES_CHKSUM =3D " \
> > >      file://COPYING;md5=3D0c56db0143f4f80c369ee3af7425af6e \
> > >  "
> > >
> > > -SRC_URI =3D "${SOURCEFORGE_MIRROR}/lksctp/${BP}.tar.gz \
> > > +SRCREV =3D "736b91d340e3f2519714f2930ed63b164d363511"
> > > +
> >
> > perhaps we need to reflect it in PV as well.
> >
> > PV .=3D "+git${SRCPV}"
>
> I was less inclined to decorate the PV with the git hash since the
> SRCREV points at the release tag for 1.0.17, but I suppose if upstream
> chose to move the tag then this would be out of sync, so it's worth it.
>

I know they don=E2=80=99t look pretty but the information is useful

>
> -J.
>
> >
> > > +SRC_URI =3D " \
> > > +    git://github.com/sctp/lksctp-tools.git \
> > >      file://run-ptest \
> > >      file://v4test.sh \
> > >      file://v6test.sh \
> > >  "
> > >
> > > -SRC_URI[md5sum] =3D "68e9b8fa4d4e331029b247b72d46d7a5"
> > > -SRC_URI[sha256sum] =3D
> "1aeb204cdb2befc94d9eb3037d1609c9d1d2cd5379d6dd2c0a8ca9b10533aa15"
> > > -
> > > -#| arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-gcc
> -march=3Darmv5te -marm -mthumb-interwork
> --sysroot=3D/home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemuarm
> -shared  -fPIC -DPIC  .libs/bindx.o .libs/connectx.o .libs/peeloff.o
> .libs/opt_info.o .libs/addrs.o .libs/sendmsg.o .libs/recvmsg.o
> -march=3Darmv5te -marm -mthumb-interwork
> --sysroot=3D/home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemuarm -=
O2
> -Wl,--version-script=3D/home/jenkins/oe/world/shr-core/tmp-eglibc/work/ar=
mv5te-oe-linux-gnueabi/lksctp-tools/1.0.16-r0/lksctp-tools-1.0.16/src/lib/V=
ersions.map
> -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed   -Wl,-soname -Wl,libsctp.=
so.1
> -o .libs/libsctp.so.1.0.16
> > > -#|
> /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libe=
xec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.0/ld:
> error: symbol sctp_connectx has undefined version
> > > -#| collect2: error: ld returned 1 exit status
> > > -#| make[4]: *** [libsctp.la] Error 1
> > > -PNBLACKLIST[lksctp-tools] ?=3D "${@bb.utils.contains('DISTRO_FEATURE=
S',
> 'ld-is-gold', "BROKEN: fails to link against sctp_connectx symbol", '', d=
)}"
> > > -
> > > -S =3D "${WORKDIR}/${BP}"
> > > +S =3D "${WORKDIR}/git"
> > >
> > >  BBCLASSEXTEND =3D "native"
> > >
> > > --
> > > 2.7.4
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> -Joe MacDonald.
> :wq
>

