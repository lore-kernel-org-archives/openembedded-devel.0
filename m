Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE6FFC3064D
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 15:37:09 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web10.176943.1719329827788468472
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 08:37:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nq40vbgc;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5bb36de2171so2786548eaf.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719329827; x=1719934627; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYB5LwBmH4XL+SPneHzsk692GafwrfySNxdHhdaJAp8=;
        b=nq40vbgc7070cIkPM8cFR3M3wqpOxbYxIxy/LVYXejqt2ljBqbuV9wriP/FeQVz4y6
         cud0UDXvp2g6DBhVH6fpKvw8HlOKCMTDqnJheQOdi4bUGxPvriWP8YkZ82FkPCIXlEd7
         Tss56RG3Mh93cVXt+4B5HaQIL6LJ4pIE+YTsQGxkPAKzbtikc2qPh8d3WucOqRIDk2pe
         K6cJ65Ap9x4wseJZv/aS2EgFwK0eB18VzOUfu3I6O0qST4+nWP9HzIRq+F0lsHysI1Of
         SSJQKsTkv/n9B2L0YMKbyDov1vWTAJzkd1iagupts35rwB9KulauBKm/P76Mppdi6Ixc
         wZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719329827; x=1719934627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OYB5LwBmH4XL+SPneHzsk692GafwrfySNxdHhdaJAp8=;
        b=w/ETwHgESEisDBJKJ1QFitLS9/VxVd+0sTqxhduuz0O0Oa5I4C2RXck/Z0t35HBfbC
         UWyr+OKQDkWKwQYYW7His07QYMoCV5bMy43UeCXGTcLp6RMPmMGS1GIVWxCwsmWnJiCw
         jLSO5vrRkUW54RZ+Um+Ur9zBA1YMcZhUCpDVwodB1zvDT4yx6kvw5n8Nvm5qEhj+U2aQ
         iJ0yEqd8prmeQw+ZxsARsQqbci2b/vjLYP1oArbRebI/I8exZbZqNUccMrLatxJfxM6u
         Qmpcdy5xFaquIQWiU7zE/ayUQPVcYDTFvPad9N3mlJ2MpGIsaZRUFZoikE7CNq8yUNtf
         wi1Q==
X-Gm-Message-State: AOJu0YxZ4NaK2qb1fnT9aP8G2rXNbifkQ5qdIs2gp66JQTVcmpWLb+7H
	Ef98kzmQWn/EKlqOMTQtUDVNSdobInU7e6FdsG/4cHDmQemv6hJ9ELVZPprh1SZtsE2my5Pa+dD
	Gt7nLpHARMvbtOMVgYy7fiwoN2hs=
X-Google-Smtp-Source: AGHT+IGFdoOU/ZU7fnNH+aO2hDVonsvAjXSHI95XygdBbaTdb8JfqXaAlan6DbzbKb0oZEq3YtKcguMhzczTccpNq8I=
X-Received: by 2002:a05:6870:2245:b0:254:a8d3:6fbb with SMTP id
 586e51a60fabf-25d06c123c9mr5016601fac.24.1719329826967; Tue, 25 Jun 2024
 08:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240625081259.1785605-1-peter.marko@siemens.com>
In-Reply-To: <20240625081259.1785605-1-peter.marko@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Jun 2024 08:36:40 -0700
Message-ID: <CAMKF1sqAuENdwTOSwSwCM7uCkAjAKmC5eCbPzdu9GT71UFJEMw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][master][scarthgap][PATCH] cjson: fix buildpath warnings
To: peter.marko@siemens.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 15:37:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111073

It does not appy on master btw. I have to manually transplant it.
Please look into the one in master-next

On Tue, Jun 25, 2024 at 1:14=E2=80=AFAM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> Following warning occurs when building with ptests enabled:
> WARNING: cjson-1.7.17-r0 do_package_qa: QA Issue: File /usr/lib/cjson/pte=
st/CTestTestfile.cmake in package cjson-ptest contains reference to TMPDIR
> File /usr/lib/cjson/ptest/tests/CTestTestfile.cmake in package cjson-ptes=
t contains reference to TMPDIR
> File /usr/lib/cjson/ptest/fuzzing/CTestTestfile.cmake in package cjson-pt=
est contains reference to TMPDIR [buildpaths]
>
> The cmake files also contain full paths to original CMakeLists.txt file
> in _BACKTRACE_TRIPLES property;
> These are not needed for successful ptests as we don't install the
> CMakeLists.txt files anyway.
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta-oe/recipes-devtools/cjson/cjson_1.7.17.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta-oe/recipes-devtools/cjson/cjson_1.7.17.bb b/meta-oe/rec=
ipes-devtools/cjson/cjson_1.7.17.bb
> index 6c8934b342..ea74f1d680 100644
> --- a/meta-oe/recipes-devtools/cjson/cjson_1.7.17.bb
> +++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.17.bb
> @@ -24,6 +24,11 @@ do_install_ptest() {
>          sed s#${B}#${PTEST_PATH}# ${B}/CTestTestfile.cmake > ${D}${PTEST=
_PATH}/CTestTestfile.cmake
>          sed s#${B}#${PTEST_PATH}# ${B}/tests/CTestTestfile.cmake > ${D}$=
{PTEST_PATH}/tests/CTestTestfile.cmake
>          sed s#${B}#${PTEST_PATH}# ${B}/fuzzing/CTestTestfile.cmake > ${D=
}${PTEST_PATH}/fuzzing/CTestTestfile.cmake
> +        # The cmake files also contain full paths to original CMakeLists=
.txt file in _BACKTRACE_TRIPLES property;
> +        # these are not needed for successful ptests as we don't install=
 the CMakeLists.txt files anyway.
> +        sed -i s#${S}#${PTEST_PATH}#g ${D}${PTEST_PATH}/CTestTestfile.cm=
ake
> +        sed -i s#${S}#${PTEST_PATH}#g ${D}${PTEST_PATH}/tests/CTestTestf=
ile.cmake
> +        sed -i s#${S}#${PTEST_PATH}#g ${D}${PTEST_PATH}/fuzzing/CTestTes=
tfile.cmake
>          # install test artifacts
>          install ${B}/cJSON_test ${D}${PTEST_PATH}
>          install ${B}/tests/cjson_add ${B}/tests/*_tests ${B}/tests/parse=
_*  ${B}/tests/print_*  ${B}/tests/readme_examples ${D}${PTEST_PATH}/tests/
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111013): https://lists.openembedded.org/g/openembedde=
d-devel/message/111013
> Mute This Topic: https://lists.openembedded.org/mt/106866076/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

