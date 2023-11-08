Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D2FEC4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 15:50:58 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.17388.1699458652765757340
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 07:50:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K8zX4UiT;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1e993765c1bso4381029fac.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 07:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699458652; x=1700063452; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zrOkTdGjUteRw4ai1FphtWI49EIQMdT82dl4lrsdlB4=;
        b=K8zX4UiTUX+TL6x1hGS/IWx1QR8/LT1rkRgxl5t9mzajpp8QgnVSE+4kqqq0F/5Lsi
         ZRP1m/RxU3Cw9OeP9W7hrVHzf1MTTsAjhIEpkb2/hIpq3V+JVSwmyoqlkc4Esn+8dHH6
         0ISnn7Ce5J+8nm0WVTD9dpJUYjWYtyIePyEZdFO4O/uGn4TQ5LIuB27tTkoa+c0dm93u
         C2GTuq+MZo1+YO0Ws76UzNfKEoG1d+VkkUiQ8wpr6JQjqzhyuCTw0QkDOtQYOfnDREVJ
         y/3wOc94pPCtxrsmuhytAifCCFGurXzk6Fn5FnRA+LyQKOeAETzqa64rPw005VF6+04x
         uh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699458652; x=1700063452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zrOkTdGjUteRw4ai1FphtWI49EIQMdT82dl4lrsdlB4=;
        b=lqfksjpRa6jcoz9ykJLgdBQCYE5K881onGr3DsG+KxiEAK/D6SP3HJzwBYKj0hGh2t
         DLAktYAQ5Rkdn0TynOP12SWlaNe+qINXhuzkQBlYe6VJs2ECIPwjnq3LPTl38Q+RNRBw
         HLJTxSiIlA8Ap0e3sZxc0uKasjHzA9+y62Nifv/D6Emd4fMHk5EI1lzld2QZBTucvVom
         Vhaggqv5DmFsuwnv+D7wVELJkN4P9L+rJqkjtgbpt6CpP0XPQyWh6xtlETnmLCqDh4mb
         xkn5Aj1SMQyn3Ndo7slOj25db6Or2y3UmIAgOBuedZFROHcHQ+0rZof3XVhloNa0/kuV
         PvYA==
X-Gm-Message-State: AOJu0Yx9v7JW44oZbm7nvg9SG1i4cNH1usUPFl52ZoGOdt7sP8jvZ00g
	CSAWxYpJ1zyp01uPYt+SYb+ruqHhWMhNa25Gq8s=
X-Google-Smtp-Source: AGHT+IGyhjv5yUq0AP29DJHo9cROtkuHZnuqBvWc6xISwaJUjwV5dg7gv5fdvr2yhClrW3GsgPf5oIH88EiEBAS37Zg=
X-Received: by 2002:a05:6871:3483:b0:1ef:d51b:5f50 with SMTP id
 ni3-20020a056871348300b001efd51b5f50mr1789712oac.22.1699458651796; Wed, 08
 Nov 2023 07:50:51 -0800 (PST)
MIME-Version: 1.0
References: <20231107152239.2219002-1-leon.anavi@konsulko.com>
 <20231107152239.2219002-2-leon.anavi@konsulko.com> <CAMKF1sqvRNDFV7gi9Z1N_EeOJHX6MQJLxQYHpQ_DkV5b6D+c-A@mail.gmail.com>
 <e028935a-e1e5-4724-9839-140cee0adf67@konsulko.com>
In-Reply-To: <e028935a-e1e5-4724-9839-140cee0adf67@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Nov 2023 07:50:25 -0800
Message-ID: <CAMKF1sq7cXZU7XKKWGJ9u3iW4jS+EmWmbc-OD0bZF3QSUQcLdQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/3] qpdf: Update 10.6.3 -> 11.6.3
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 15:50:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106481

On Wed, Nov 8, 2023 at 2:53=E2=80=AFAM Leon Anavi <leon.anavi@konsulko.com>=
 wrote:
>
> Hi Khem,
>
> Thank you for the feedback.
>
> On 8.11.23 =D0=B3. 9:08 =D1=87., Khem Raj wrote:
>
> seeing this error
>
> WARNING: qpdf-11.6.3-r0 do_package_qa: QA Issue: File
> /usr/lib/cmake/qpdf/libqpdfTargets.cmake in package qpdf-dev contains
> reference to TMPDIR [bu
> ildpaths]
>
>
> The sed command in do_install:append should fix this warning. I also insp=
ected to /usr/lib/cmake/qpdf/libqpdfTargets.cmake on the booted target devi=
ce and the paths look OK. I am wondering why does this warning appear on yo=
ur build setup?

the CI in this case uses usermerge distro feature and clang+lld to link.

>
> ERROR: qpdf-11.6.3-r0 do_package_qa: QA Issue:
> /usr/lib/libqpdf.so.29.6.3 contained in package libqpdf requires
> libgnutls.so.30(GNUTLS_3_4)(64bit),
>  but no providers found in RDEPENDS:libqpdf? [file-rdeps]
> ERROR: qpdf-11.6.3-r0 do_package_qa: QA Issue:
> /usr/lib/libqpdf.so.29.6.3 contained in package libqpdf requires
> libgnutls.so.30()(64bit), but no pr
> oviders found in RDEPENDS:libqpdf? [file-rdeps]
>
>
> I can't reproduce these errors on my side. Could you please provide any h=
ints how to reproduce them?
>
> Best regards,
> Leon
>
> ERROR: qpdf-11.6.3-r0 do_package_qa: Fatal QA errors were found, failing =
task.
> ERROR: Logfile of failure stored in:
> /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/qpdf/11.6.3/temp/log.=
do_package_qa.3501227
>
> On Tue, Nov 7, 2023 at 7:22=E2=80=AFAM Leon Anavi <leon.anavi@konsulko.co=
m> wrote:
>
> Update to version 11.6.3:
>
> - Fix a bug in which qpdf could potentially discard a character
>   in a binary string if that character was preceded by an octal
>   escaped string with fewer than three digits. This bug was
>   introduced in the 11.0.0 release. The bug would not apply to
>   content streams with default settings.
> - The linearization specification precludes linearized files that
>   require offets past the 4 GB mark. A bug in qpdf was preventing
>   it from working when offsets had to pass the 2 GB mark. This has
>   been corrected.
>
> Switch to cmake. Use /dev/random to perform encryption securely.
> Change the fully defined path on the target to about buildpaths
> QA issues with libqpdfTargets.cmake.
>
> This work was sponsored by GOVCERT.LU.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../qpdf/{qpdf_10.6.3.bb =3D> qpdf_11.6.3.bb}         | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-printing/qpdf/{qpdf_10.6.3.bb =3D> qpdf_11.6.3.bb=
} (67%)
>
> diff --git a/meta-oe/recipes-printing/qpdf/qpdf_10.6.3.bb b/meta-oe/recip=
es-printing/qpdf/qpdf_11.6.3.bb
> similarity index 67%
> rename from meta-oe/recipes-printing/qpdf/qpdf_10.6.3.bb
> rename to meta-oe/recipes-printing/qpdf/qpdf_11.6.3.bb
> index fa33daf52..17a65acc6 100644
> --- a/meta-oe/recipes-printing/qpdf/qpdf_10.6.3.bb
> +++ b/meta-oe/recipes-printing/qpdf/qpdf_11.6.3.bb
> @@ -2,14 +2,14 @@ DESCRIPTION =3D "PDF transformation/inspection software=
"
>  HOMEPAGE =3D "http://qpdf.sourceforge.net"
>  LICENSE =3D "Artistic-2.0"
>  SECTION =3D "libs"
> -DEPENDS =3D "libpcre zlib libjpeg-turbo"
> +DEPENDS =3D "libpcre zlib libjpeg-turbo openssl"
>
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/qpdf/qpdf-${PV}.tar.gz"
> -SRC_URI[sha256sum] =3D "e8fc23b2a584ea68c963a897515d3eb3129186741dd19d13=
c86d31fa33493811"
> +SRC_URI[sha256sum] =3D "c394b1b0cff4cd9d13b0f5e16bdf3cf54da424dc434f9d40=
264b7fe67acd90bc"
>
>  LIC_FILES_CHKSUM =3D "file://Artistic-2.0;md5=3D7806296b9fae874361e6fb10=
072b7ee3"
>
> -inherit autotools-brokensep gettext
> +inherit cmake gettext
>
>  # disable random file detection for cross-compile
>  EXTRA_OECONF =3D "--without-random \
> @@ -17,11 +17,18 @@ EXTRA_OECONF =3D "--without-random \
>                  --disable-check-autofiles \
>                  "
>
> +EXTRA_OECMAKE =3D '-DRANDOM_DEVICE=3D"/dev/random"'
> +
>  LDFLAGS:append:mipsarch =3D " -latomic"
>  LDFLAGS:append:riscv32 =3D " -latomic"
>
>  S=3D"${WORKDIR}/${BPN}-${PV}"
>
> +do_install:append() {
> +    # Change the fully defined path on the target
> +    sed -i -e 's|${STAGING_LIBDIR}|${libdir}|g' ${D}${libdir}/cmake/${BP=
N}/libqpdfTargets.cmake
> +}
> +
>  # avoid Makefile returning error on 'make clean' before configure was ru=
n
>  CLEANBROKEN =3D "1"
>
> --
> 2.39.2
>
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106465): https://lists.openembedded.org/g/openembedde=
d-devel/message/106465
> Mute This Topic: https://lists.openembedded.org/mt/102444518/2167311
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [l=
eon.anavi@konsulko.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

