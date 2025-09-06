Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA209CA1012
	for <webhook@archiver.kernel.org>; Sat,  6 Sep 2025 17:22:22 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.2835.1757179335466856463
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Sep 2025 10:22:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L1qhceqI;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: jan.vermaete@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-71d6059f490so29349747b3.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Sep 2025 10:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757179334; x=1757784134; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6s92ZuW6ZNv51OcTwYGMmEudSjjImDBZwnIWS69aK4=;
        b=L1qhceqIPI9CEmEUZHkFFIaEuGTyjvDfee/Rdp9JpedLQtnC8AiiTQEAEQEWLFyuW6
         sD2OVE/jE6DdijIiPcASCfSVTPPRKIprbLzwf0VzrRxH2N0NOPDswDcX3+Rssb8FbpqA
         fZlq33WGu5mMp3qhcmJ7dNe6FWq+C0hVRwU7wy0MC+9CyJCtyWB/eEGQWjPsyB2wili6
         0EbuvHw1/p/OT3FlJJK3WKYkuUTS+WWuShD88sISmrRkboqu8Y0gp5dx+Q6RPvbdqz1/
         0Kl+JfeIC8mIkvb77pVh4bK0XbRGEDKju2SpPDNzzsAg/M2k7lCmM3tookRMJ9qsAVUV
         bphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757179334; x=1757784134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6s92ZuW6ZNv51OcTwYGMmEudSjjImDBZwnIWS69aK4=;
        b=lVcTOrt58kD1GMsI7PXq73y3/Sx9hs3Em6EuU8TSAmw/VPgGOrzv0muLSVLHiVtGVk
         n7ahD3WHnHE/KIfQtWhnRyak8E8zldmnPOV8m39t5dVuxDsLOk7lj1wR5KUCgGewZr8j
         cr2ythRi1l4wKe9IsR+B/Elm+lQmyPlE28g4PzqRxt/Ys80BrdKLEY0MTnZMDW4XIFvy
         ssg4u/PA4Vftxer5P30CyhfJuFXCsl8IBs4Ss5vTjPV3MFwnH3V0wCUfzu6gKJtNggmE
         VyP+Xdsb0zlQ0nz7PBeXa6ghyrMwHGByE065rereJzn8snNfQ7OMXn6hh+dUUcSGvAN5
         feag==
X-Gm-Message-State: AOJu0Yzktr45LMapmrZoa6zrQluae7VuQB0c05VMzOOcUsGBh0FMmuJD
	h9JvM7hq+L0eT9fZm4IjFp3AuzteF6M9R+fwwiNrGKguiKaODSz2pOA9E98zBr9OJalGEIMbtP8
	z53I8EGr8fxCcUjGHWi3sLXln5qfzTG4=
X-Gm-Gg: ASbGncuUp8YombfDT3atSxAZynj0ssAaRiyimklOB2IMwuFEl6wy5UK5s9k3ih+yHWw
	Vxz9J5FgsxnkMjjcTd+/b+Mib9/FMij2c4xLq4G3HKmShVDyvcjYW2E1/ftjbSNsEIqESAwJk0Q
	pEChImso5kactLnwFMG/jm1Ig32aQgp5CAd/zDdJVUQpCIY1cqxYntf9+8z12Xkw80H/EmDjQsq
	nI4yx37OH5GDrMlbzdA6VfUbdrV6AK0/QFYdEApHShANz79HsE=
X-Google-Smtp-Source: AGHT+IGKfZbu/XrUoG7tuuLXJ3B+UeJY92Z4LkQhNYZajx0HRlqyi1/z+PVTV9LduL7Y/m12QDf3QBlySEbJeFsggPM=
X-Received: by 2002:a05:690c:6087:b0:719:4cff:16db with SMTP id
 00721157ae682-727f652d11bmr24007217b3.25.1757179334427; Sat, 06 Sep 2025
 10:22:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250904221139.3131569-1-peter.marko@siemens.com> <20250904221139.3131569-9-peter.marko@siemens.com>
In-Reply-To: <20250904221139.3131569-9-peter.marko@siemens.com>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Sat, 6 Sep 2025 19:22:03 +0200
X-Gm-Features: Ac12FXxedeAgMly2ev-1k3sB-M6biokpwJwJ5woadV15b222wpjeqJ88Qv5K-p8
Message-ID: <CABF_=yi6KqviCqT4MFTKwbLFuBSCNjB0g+ucy+HvvYM0Xp36qw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 09/10] utf8proc: add new recipe with ptest
To: peter.marko@siemens.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Sep 2025 17:22:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119325

If I'm not mistaken the usage of a tag in the fetcher does require
network access.
What's not always the case.
This does break the parsing by bitbake when no network/Internet is availabl=
e.

On Fri, Sep 5, 2025 at 12:13=E2=80=AFAM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> It is needed for poco 1.14+
> Ptest runs for less than a second.
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../include/ptest-packagelists-meta-oe.inc    |  1 +
>  .../utf8proc/utf8proc/run-ptest               | 15 +++++++++
>  .../utf8proc/utf8proc_2.10.0.bb               | 33 +++++++++++++++++++
>  3 files changed, 49 insertions(+)
>  create mode 100644 meta-oe/recipes-support/utf8proc/utf8proc/run-ptest
>  create mode 100644 meta-oe/recipes-support/utf8proc/utf8proc_2.10.0.bb
>
> diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-o=
e/conf/include/ptest-packagelists-meta-oe.inc
> index d77b97d576..18324ff0d3 100644
> --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> @@ -44,6 +44,7 @@ PTESTS_FAST_META_OE =3D "\
>      pv \
>      sdbus-c++ \
>      tomlplusplus \
> +    utf8proc \
>      uthash \
>      xmlsec1 \
>      zeromq \
> diff --git a/meta-oe/recipes-support/utf8proc/utf8proc/run-ptest b/meta-o=
e/recipes-support/utf8proc/utf8proc/run-ptest
> new file mode 100644
> index 0000000000..349e496d68
> --- /dev/null
> +++ b/meta-oe/recipes-support/utf8proc/utf8proc/run-ptest
> @@ -0,0 +1,15 @@
> +#!/bin/sh
> +
> +execute_test() {
> +    eval "./$1" && echo "PASS: $1" || echo "FAIL: $1"
> +}
> +
> +execute_test "case"
> +execute_test "custom"
> +execute_test "iterate"
> +execute_test "misc"
> +execute_test "printproperty"
> +execute_test "valid"
> +execute_test "charwidth"
> +execute_test "graphemetest data/GraphemeBreakTest.txt"
> +execute_test "normtest data/NormalizationTest.txt"
> diff --git a/meta-oe/recipes-support/utf8proc/utf8proc_2.10.0.bb b/meta-o=
e/recipes-support/utf8proc/utf8proc_2.10.0.bb
> new file mode 100644
> index 0000000000..e42d16b8b7
> --- /dev/null
> +++ b/meta-oe/recipes-support/utf8proc/utf8proc_2.10.0.bb
> @@ -0,0 +1,33 @@
> +SUMMARY =3D "library that provides operations for data in the UTF-8 enco=
ding"
> +DESCRIPTION =3D "utf8proc is a small, clean C library that provides Unic=
ode \
> +normalization, case-folding, and other operations for data in the UTF-8 =
\
> +encoding, supporting Unicode version 16.0"
> +HOMEPAGE =3D "https://juliastrings.github.io/utf8proc/"
> +SECTION =3D "libs"
> +
> +LICENSE =3D "MIT & Unicode-3.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D96d5a3ba306e0f24fb289427af=
484408"
> +
> +SRC_URI =3D "\
> +    git://github.com/JuliaStrings/utf8proc;protocol=3Dhttps;branch=3Dmas=
ter;tag=3Dv${PV} \
> +    file://run-ptest \
> +"
> +
> +inherit cmake ptest
> +
> +EXTRA_OECMAKE =3D "\
> +    -DBUILD_SHARED_LIBS=3DON \
> +    ${@bb.utils.contains('PTEST_ENABLED', '1', '-DBUILD_TESTING=3DON -DU=
TF8PROC_ENABLE_TESTING=3DON ', '', d)} \
> +"
> +
> +do_install_ptest() {
> +    # this list and run-ptest needs to be updated on upgrade (the projec=
t uses add_test feature)
> +    for t in "case" custom iterate misc printproperty valid charwidth gr=
aphemetest normtest; do
> +        install -m 0755 ${B}/$t ${D}${PTEST_PATH}/
> +    done
> +    install -d ${D}${PTEST_PATH}/data
> +    install -m 0644 ${B}/data/GraphemeBreakTest.txt ${D}${PTEST_PATH}/da=
ta/
> +    install -m 0644 ${B}/data/NormalizationTest.txt ${D}${PTEST_PATH}/da=
ta/
> +}
> +
> +BBCLASSEXTEND =3D "native"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119306): https://lists.openembedded.org/g/openembedde=
d-devel/message/119306
> Mute This Topic: https://lists.openembedded.org/mt/115073156/2167232
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [j=
an.vermaete@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

