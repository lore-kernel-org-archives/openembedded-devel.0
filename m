Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD341CA6004
	for <webhook@archiver.kernel.org>; Sat, 10 Oct 2026 05:20:28 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1006.1791591339779418396
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2026 17:15:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=I9x/q0WL;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: joel.winarske@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8ac4806e210so1523317b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 17:15:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791591339; cv=none;
        d=google.com; s=arc-20260327;
        b=Re+jGmAjPM9qgY8Gfyi129gmQh4d1mghlyY9J+vtYh57yjvpmVolxkNr7stuaVYdpK
         NYxlxSRBogIfRmsFinP+gGVXHLwHbwCiP7dzmb4L6kt3NJpRi+eC30XQllKptfZKpyhC
         qIljJncA1Jv/zvHnBjTTrORBm159NyZIfW12Xyj7sO8I7VEgBrw4XuulvXfjyeas4u7U
         dWs6/dEoQU4QfrgGoPTdsBt1F/guNimdd7nYEQpI7FH7aBdbHDIAyHnd8GBfX1VYS5wv
         R8eVP0NpwjAGCNl0Fc8dSGVl1cbyK29op/FAGZNCFccFp61Qmmm5FqLD3vzJrH9KdE+Q
         V/OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fWQy8SJpkMxPJVqQmnyxFIFYtNUp4m5MhU/e9DFmGvo=;
        fh=kqtH9RvdTS8z4R7bH+N1q4tJTvX5kZFkdgAseXKYH84=;
        b=VdWQHlX2DYVxPDrKcLUrQ/QbTiCMPEJDtZn+9EV+CJMR/BchgijZfrWl7S3oKqesJL
         mbA5jZVSWyQLixhMv1DxO18EyzACS0JeL4B/LKPiV1IWDDtEhTQXC2Zg9sQtozAv16vj
         uNNuy6lZNy+4/zQwpxsXsSOPwTsDpNQmyj/GmNOJ3fnr/g6SeyhSv/ipb70HSYtWa5Mm
         NaA3mK2BgPrY20xCLW1lTLiutiiLX2pcn5jHUklk3ymDri+laVSBh1BTcdLEoOuN/Y/R
         bE+gzFUwKK5gyn40YvaiBEZdmxT+KQ69nBKYc69kJwWbBlyLX/HJTfXPAHrPRqP6npPx
         O3cg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791591339; x=1792196139; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fWQy8SJpkMxPJVqQmnyxFIFYtNUp4m5MhU/e9DFmGvo=;
        b=I9x/q0WLe7RdCvikjq6Xe52A+Y2WK4TvZC528ZsJkto8Eu31i/O6cH9YTjTtj7epcV
         gs1YqUg3PB0uxvDpAegDv4gFJP623+LRsmsFH2bZTOxodVYETFaqCSzFBv+km2TtPbWR
         5idEyj13+HH8gPHD44CRAWI+CxlDVs0pIy2h4YkdsLaVDdYNLpN7j27GJV3qmTIqjw7U
         rqlf7hfWkiRsRJsrphQqqzBFvMJbcvEQPLxQ/6qJaaW1DlCzGm34M00+BHEv1pX+8SM7
         1AAej7LKURSJS7LI6YhLncPA5Uu/SlRfDmQMvTu285Om9hW0HdYYHH10zwREUHtHWSl7
         VSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791591339; x=1792196139;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fWQy8SJpkMxPJVqQmnyxFIFYtNUp4m5MhU/e9DFmGvo=;
        b=Dy4O3Vis5F4g2CVXbaJfkOi8wlxdyX0KRePNI3ZJvl/hlK4Lvyz0uJyHpAEER/js/R
         m5GOAQV1KGWh1GSUJaxgFgDTa3jfS2B20K2XmsOAI2T/zjPt3Bm8OHa55AQxUM2+3i+6
         iFuhlQKpA+LjjsVd43bJwIJe7wbcsM/1cgSJJ7l/5Q9VdQ6WsVrxqDjwzGmGwkfEdw3h
         PcfddPCuoBdl09iGZ6GH7MjINGpyDzMj7IGxa8JGHJ+sTWH3xZITT570MM+jII7B9DST
         1iCTghBXp1FPnefZ/Fsm0jI+9baprMvoXcYhaaU2aJKPkn3ozNHSEtImxvTR5ioHqs2X
         2v6Q==
X-Gm-Message-State: AFq9FYIEcgm/Ld/zLsV06ZAr3WsKeCFASChjRr2LSfUzipwJjk8BmPF2
	LkB5z6CIc3KTI6UCKtER5d9dH3a8FzCCI4jrrwPhEZlJ/EGUzhuTWmIZaM5moI58NcqwbKUkGQ6
	tg2yA4pFltXUEEL0tGKZsdNkkq9dfXCY=
X-Gm-Gg: AYBFou3rSFPICTswaTBfrL1/cJY9mTlNx2SjpYifZIVG+GHCGKa3sLyaa9Mua7+Ha6p
	SiyHQucG3YOqti1UisX7RMkbdtxwLwvRiejg7csyYAhCYV/CmdqdnxEnoxStBABs9jH+qk9VmdJ
	VMOLx8tU022nfS1T2qSfPC3yHDUQ0I+VdIf3wLBpaodg8FVvbeuVG0dFoLYP02lmuPtmbo7KPh6
	0sD/StxLst1w1rXTVzxCy3gfpJpYLqUHtQNveI9lRercm6yyNYUd9hgPee7230bxSYn06LYfspg
	Cvwh0fS03WQDiWsXNUdhgOKZlnVmBouj0dtDxgNAe8JctMQ7RmF3QBB5zkWRC4NpBa+55IIGoa2
	uUH9AOvP4y1YfFE8JnA+Ms9MBmqqskVrPYlZ37Dxi3b3qpc2LktMRqYwv2YLxxr1HWg==
X-Received: by 2002:a05:690e:4403:b0:677:c8f6:8d6b with SMTP id
 956f58d0204a3-6793628268fmr817242d50.50.1791591335541; Fri, 09 Oct 2026
 17:15:35 -0700 (PDT)
MIME-Version: 1.0
References: <20261009163214.3203833-1-joel.winarske@linux.com> <CAMKF1sp5esBT6qFJp984JZT3UO6ivVtxo6f=PQGJ6fGxGxj9Aw@mail.gmail.com>
In-Reply-To: <CAMKF1sp5esBT6qFJp984JZT3UO6ivVtxo6f=PQGJ6fGxGxj9Aw@mail.gmail.com>
From: "Joel Winarske" <joel.winarske@gmail.com>
Date: Fri, 9 Oct 2026 17:15:23 -0700
X-Gm-Features: AclHuK-ghc4uqtzVHiTLX2HcZZG-pp31I0403wPsSE37AzWL5sX76sa-vF4e9CY
Message-ID: <CABKMkPLeqKHY=Vvp_hkN=5ey-pdnrOAmizjJR-_qBnWQi4Mfig@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-*: set PYPI_PACKAGE_SDIST for non-normalized sdists
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004e3f47065d715dda"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Oct 2026 05:20:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130713

--0000000000004e3f47065d715dda
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Rebased on master-next at 4d617d1b20. Nothing is left to fix, so I am
dropping the sweep.

0a583b3502 on master covers 218 files, and master-next adds the rest. Of
the 668 recipes inheriting pypi on master-next, 130 ask for an
underscored sdist, and all 130 match what PyPI actually has. All 61 recipes
my sweep touched now carry PYPI_PACKAGE_SDIST, and every one
fetches against master-next with an empty DL_DIR.

The python3-pytz recipe in master-next also closes the RDEPENDS gap I
mentioned.

Thanks for sorting it out.

On Fri, Oct 9, 2026 at 2:36=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:

>
> Please rebase on top of latest master-next and see whats needed.
>
> On Fri, Oct 9, 2026 at 11:58=E2=80=AFAM Joel Winarske via lists.openembed=
ded.org
> <joel.winarske=3Dgmail.com@lists.openembedded.org> wrote:
>
>> From: Joel Winarske <joel.winarske@gmail.com>
>>
>> oe-core 98049bf86 redefined PYPI_PACKAGE as the normalized project name
>> and
>> derives the sdist name from it by replacing - with _. 264698b8a migrated
>> oe-core's own recipes. These were not, so each builds a URL that does no=
t
>> exist: the sdists predate PEP 625 and are still hyphenated.
>>
>>   ERROR: python3-absl-native-2.1.0-r0 do_fetch: Fetcher failure: Fetch
>> command
>>   ['wget', ..., '.../source/a/absl_py/absl_py-2.1.0.tar.gz'] failed with
>> exit
>>   code 8
>>
>> 64 recipes, 42 taking the derived default and 22 setting PYPI_PACKAGE. 5=
4
>> can
>> use ${PYPI_PACKAGE} as Martin's patches do. The other 10 cannot:
>> normalizing
>> lowercases the name while the sdist keeps its case, as in flask-restful
>> against Flask-RESTful, so those name the sdist directly.
>>
>> No PYPI_PACKAGE is removed. Dropping a non-redundant one repoints
>> HOMEPAGE,
>> UPSTREAM_CHECK_URI and the SPDX purl at the name BPN derives, which is n=
ot
>> always the project.
>>
>> Checksums are unaffected, only the URLs.
>>
>> python3-async-timeout, python3-google-api-core,
>> python3-google-api-python-client, python3-googleapis-common-protos and
>> python3-requests-toolbelt are left out, already covered by Martin's
>> patches.
>> python3-tomli-w is already tomli_w-1.2.0.tar.gz and needs nothing.
>>
>> Verified against oe-core master with an empty DL_DIR: all 64 fail do_fet=
ch
>> before and fetch after, checksums validated.
>>
>> Signed-off-by: Joel Winarske <joel.winarske@gmail.com>
>> ---
>>  .../recipes-connectivity/python3-pytun/python3-pytun_2.4.1.bb  | 1 +
>>  meta-python/recipes-devtools/python/python3-absl_2.1.0.bb      | 1 +
>>  .../recipes-devtools/python/python3-aiohttp-jinja2_1.6.bb      | 2 ++
>>  .../recipes-devtools/python/python3-antlr4-runtime_4.13.1.bb   | 1 +
>>  .../recipes-devtools/python/python3-asyncio-glib_0.1.bb        | 2 ++
>>  .../recipes-devtools/python/python3-asyncio-throttle_1.0.2.bb  | 2 ++
>>  .../recipes-devtools/python/python3-click-repl_0.3.0.bb        | 2 ++
>>  .../recipes-devtools/python/python3-click-spinner_0.1.10.bb    | 2 ++
>>  meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb  | 1 +
>>  .../recipes-devtools/python/python3-dbus-deviation_0.6.1.bb    | 2 ++
>>  meta-python/recipes-devtools/python/python3-decouple_3.8.bb    | 1 +
>>  meta-python/recipes-devtools/python/python3-editor_1.0.4.bb    | 1 +
>>  .../recipes-devtools/python/python3-eth-keyfile_0.8.0.bb       | 2 ++
>>  meta-python/recipes-devtools/python/python3-eth-keys_0.5.0.bb  | 2 ++
>>  meta-python/recipes-devtools/python/python3-eth-rlp_2.1.0.bb   | 2 ++
>>  .../recipes-devtools/python/python3-file-magic_0.4.1.bb        | 2 ++
>>  .../recipes-devtools/python/python3-flask-bootstrap_3.3.7.1.bb | 3 ++-
>>  .../recipes-devtools/python/python3-flask-jsonpify_1.5.0.bb    | 3 ++-
>>  meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.bb | 3 ++-
>>  .../recipes-devtools/python/python3-flask-login_0.6.3.bb       | 3 ++-
>>  meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb   | 2 ++
>>  .../recipes-devtools/python/python3-flask-restful_0.3.10.bb    | 3 ++-
>>  .../recipes-devtools/python/python3-flask-restx_1.3.2.bb       | 2 ++
>>  .../recipes-devtools/python/python3-flask-sijax_0.4.1.bb       | 3 ++-
>>  .../recipes-devtools/python/python3-flask-uploads_0.2.1.bb     | 3 ++-
>>  .../recipes-devtools/python/python3-flask-user_0.6.19.bb       | 3 ++-
>>  .../python/python3-flask-versioned_0.9.4-20101221.bb           | 3 ++-
>>  .../recipes-devtools/python/python3-flask-xstatic_0.0.1.bb     | 3 ++-
>>  meta-python/recipes-devtools/python/python3-gpsd-py3_0.3.0.bb  | 2 ++
>>  meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb  | 2 ++
>>  .../recipes-devtools/python/python3-javaobj-py3_0.4.4.bb       | 2 ++
>>  .../recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb       | 2 ++
>>  meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb  | 2 ++
>>  meta-python/recipes-devtools/python/python3-nmap_1.9.1.bb      | 1 +
>>  .../recipes-devtools/python/python3-ordered-set_4.1.0.bb       | 2 ++
>>  meta-python/recipes-devtools/python/python3-pkcs11_0.7.0.bb    | 1 +
>>  .../recipes-devtools/python/python3-precise-runner_0.3.1.bb    | 2 ++
>>  .../recipes-devtools/python/python3-process-tests_3.0.0.bb     | 2 ++
>>  .../recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb        | 2 ++
>>  .../recipes-devtools/python/python3-py-ubjson_0.16.1.bb        | 2 ++
>>  .../recipes-devtools/python/python3-pyserial-asyncio_0.6.bb    | 2 ++
>>  .../recipes-devtools/python/python3-pytest-benchmark_5.1.0.bb  | 2 ++
>>  .../recipes-devtools/python/python3-pytest-forked_1.6.0.bb     | 2 ++
>>  .../python/python3-pytest-helpers-namespace_2021.12.29.bb      | 2 ++
>>  .../python/python3-pytest-json-report_1.5.0.bb                 | 2 ++
>>  .../python/python3-pytest-localserver_0.8.1.bb                 | 2 ++
>>  .../recipes-devtools/python/python3-pytest-relaxed_2.0.2.bb    | 2 ++
>>  .../recipes-devtools/python/python3-pytest-runner_6.0.1.bb     | 2 ++
>>  .../recipes-devtools/python/python3-pytest-sugar_1.1.1.bb      | 2 ++
>>  .../python/python3-pytest-tempdir_2019.10.12.bb                | 2 ++
>>  meta-python/recipes-devtools/python/python3-rapidjson_1.19.bb  | 1 +
>>  .../recipes-devtools/python/python3-requests-ftp_0.3.1.bb      | 2 ++
>>  .../recipes-devtools/python/python3-requests-mock_1.12.1.bb    | 2 ++
>>  .../recipes-devtools/python/python3-requests-oauthlib_2.0.0.bb | 2 ++
>>  .../python/python3-robotframework-seriallibrary_0.4.3.bb       | 2 ++
>>  .../python3-setuptools-declarative-requirements_1.3.0.bb       | 2 ++
>>  meta-python/recipes-devtools/python/python3-snappy_0.6.1.bb    | 1 +
>>  .../recipes-devtools/python/python3-speedtest-cli_2.1.3.bb     | 2 ++
>>  meta-python/recipes-devtools/python/python3-systemd_235.bb     | 1 +
>>  .../recipes-devtools/python/python3-trafaret-config_2.0.2.bb   | 2 ++
>>  .../python/python3-types-python-dateutil_2.9.0.20241003.bb     | 2 ++
>>  .../python/python3-types-setuptools_75.5.0.20241120.bb         | 2 ++
>>  .../recipes-devtools/python/python3-u-msgpack-python_2.8.0.bb  | 2 ++
>>  meta-python/recipes-devtools/python/python3-uinput_1.0.1.bb    | 1 +
>>  64 files changed, 116 insertions(+), 10 deletions(-)
>>
>> diff --git a/meta-python/recipes-connectivity/python3-pytun/
>> python3-pytun_2.4.1.bb b/meta-python/recipes-connectivity/python3-pytun/
>> python3-pytun_2.4.1.bb
>> index 08ec2cf670..f496bb0705 100644
>> --- a/meta-python/recipes-connectivity/python3-pytun/
>> python3-pytun_2.4.1.bb
>> +++ b/meta-python/recipes-connectivity/python3-pytun/
>> python3-pytun_2.4.1.bb
>> @@ -5,5 +5,6 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3D13f7629e8e4989b66b4a913ab05a91de"
>>  SRC_URI[sha256sum] =3D
>> "20b53ea7a09dfe173c00ec0a00eea508b05e959f5dc4b4bb698aa52252192f8f"
>>
>>  PYPI_PACKAGE =3D "python-pytun"
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>>
>>  inherit pypi setuptools3
>> diff --git a/meta-python/recipes-devtools/python/python3-absl_2.1.0.bb
>> b/meta-python/recipes-devtools/python/python3-absl_2.1.0.bb
>> index 5bdb83175d..210bfeeff9 100644
>> --- a/meta-python/recipes-devtools/python/python3-absl_2.1.0.bb
>> +++ b/meta-python/recipes-devtools/python/python3-absl_2.1.0.bb
>> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57"
>>  SRC_URI[sha256sum] =3D
>> "7820790efbb316739cde8b4e19357243fc3608a152024288513dd968d7d959ff"
>>
>>  PYPI_PACKAGE =3D "absl-py"
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>>
>>  inherit pypi setuptools3
>>
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-aiohttp-jinja2_1.6.bb b/meta-python/recipes-devtools/python/
>> python3-aiohttp-jinja2_1.6.bb
>> index df4a0adcaf..c82ad89c9f 100644
>> --- a/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.6.bb
>> +++ b/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.6.bb
>> @@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3D29dca541e03964615590ca7b50392d97"
>>
>>  SRC_URI[sha256sum] =3D
>> "a3a7ff5264e5bca52e8ae547bbfd0761b72495230d438d05b6c0915be619b0e2"
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi setuptools3
>>
>>  RDEPENDS:${PN} +=3D " \
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-antlr4-runtime_4.13.1.bb b/meta-python/recipes-devtools/python/
>> python3-antlr4-runtime_4.13.1.bb
>> index 431d37c7d7..260d16d358 100644
>> --- a/meta-python/recipes-devtools/python/
>> python3-antlr4-runtime_4.13.1.bb
>> +++ b/meta-python/recipes-devtools/python/
>> python3-antlr4-runtime_4.13.1.bb
>> @@ -5,6 +5,7 @@ LIC_FILES_CHKSUM =3D
>> "file://PKG-INFO;md5=3D4b18e4a9f93178eaa50a9a37f26da7f7"
>>  SRC_URI[sha256sum] =3D
>> "3cd282f5ea7cfb841537fe01f143350fdb1c0b1ce7981443a2fa8513fddb6d1a"
>>
>>  PYPI_PACKAGE =3D "antlr4-python3-runtime"
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>>
>>  inherit pypi python_setuptools_build_meta
>>
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-asyncio-glib_0.1.bb b/meta-python/recipes-devtools/python/
>> python3-asyncio-glib_0.1.bb
>> index d73e83de54..602bcca715 100644
>> --- a/meta-python/recipes-devtools/python/python3-asyncio-glib_0.1.bb
>> +++ b/meta-python/recipes-devtools/python/python3-asyncio-glib_0.1.bb
>> @@ -2,6 +2,8 @@ SUMMARY =3D "An implementation of the Python 3 asyncio
>> event loop on top of GLib"
>>  LICENSE =3D "LGPL-2.1-only"
>>  LIC_FILES_CHKSUM =3D
>> "file://COPYING.LGPL;md5=3D4fbd65380cdd255951079008b364516c"
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit setuptools3 pypi features_check
>>
>>  REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-asyncio-throttle_1.0.2.bb b/meta-python/recipes-devtools/python/
>> python3-asyncio-throttle_1.0.2.bb
>> index 040e70940b..e04372af59 100644
>> --- a/meta-python/recipes-devtools/python/
>> python3-asyncio-throttle_1.0.2.bb
>> +++ b/meta-python/recipes-devtools/python/
>> python3-asyncio-throttle_1.0.2.bb
>> @@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3Dc7906e56b70808e1ade6ca05e0bb48d5"
>>
>>  SRC_URI[sha256sum] =3D
>> "2675282e99d9129ecc446f917e174bc205c65e36c602aa18603b4948567fcbd4"
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi setuptools3
>>
>>  RDEPENDS:${PN} +=3D "python3-asyncio"
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-click-repl_0.3.0.bb b/meta-python/recipes-devtools/python/
>> python3-click-repl_0.3.0.bb
>> index b0844ed5a2..4e0d145a83 100644
>> --- a/meta-python/recipes-devtools/python/python3-click-repl_0.3.0.bb
>> +++ b/meta-python/recipes-devtools/python/python3-click-repl_0.3.0.bb
>> @@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3D580facc4832cac548fad94845542da44"
>>
>>  SRC_URI[sha256sum] =3D
>> "17849c23dba3d667247dc4defe1757fff98694e90fe37474f3feebb69ced26a9"
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi python_setuptools_build_meta
>>
>>  DEPENDS +=3D "python3-wheel-native"
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-click-spinner_0.1.10.bb b/meta-python/recipes-devtools/python/
>> python3-click-spinner_0.1.10.bb
>> index 7f19cc3458..0d09fbdbdf 100644
>> --- a/meta-python/recipes-devtools/python/python3-click-spinner_0.1.10.b=
b
>> +++ b/meta-python/recipes-devtools/python/python3-click-spinner_0.1.10.b=
b
>> @@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D
>> "file://PKG-INFO;beginline=3D8;endline=3D8;md5=3D8227180126797a0148
>>  SRC_URI +=3D "file://0001-Update-Versioneer-to-0.22.patch"
>>  SRC_URI[sha256sum] =3D
>> "87eacf9d7298973a25d7615ef57d4782aebf913a532bba4b28a37e366e975daf"
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi setuptools3
>>
>>  RDEPENDS:${PN} +=3D "python3-json"
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-dateutil_2.9.0.bb b/meta-python/recipes-devtools/python/
>> python3-dateutil_2.9.0.bb
>> index dd3f55edf9..e66e4f32b7 100644
>> --- a/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb
>> +++ b/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb
>> @@ -8,6 +8,7 @@ SRC_URI +=3D "file://0001-drop-the-six-dependency.patch"
>>  SRC_URI[sha256sum] =3D
>> "78e73e19c63f5b20ffa567001531680d939dc042bf7850431877645523c66709"
>>
>>  PYPI_PACKAGE =3D "python-dateutil"
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>>  inherit pypi python_setuptools_build_meta
>>
>>  DEPENDS +=3D "python3-wheel-native"
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-dbus-deviation_0.6.1.bb b/meta-python/recipes-devtools/python/
>> python3-dbus-deviation_0.6.1.bb
>> index e969e85465..70066d548b 100644
>> --- a/meta-python/recipes-devtools/python/python3-dbus-deviation_0.6.1.b=
b
>> +++ b/meta-python/recipes-devtools/python/python3-dbus-deviation_0.6.1.b=
b
>> @@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D
>> "file://COPYING;md5=3D90263a49bc1d9a204656fec4d5616c66"
>>
>>  SRC_URI[sha256sum] =3D
>> "e06b88efe223885d2725df51cf7c9b7b463d1c6f04ea49d4690874318d0eb7a3"
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi setuptools3
>>
>>  SRC_URI +=3D
>> "file://0001-Prevent-trying-to-donwload-requierment-which-will-ca.patch"
>> diff --git a/meta-python/recipes-devtools/python/python3-decouple_3.8.bb
>> b/meta-python/recipes-devtools/python/python3-decouple_3.8.bb
>> index 20d614a423..b0076dd504 100644
>> --- a/meta-python/recipes-devtools/python/python3-decouple_3.8.bb
>> +++ b/meta-python/recipes-devtools/python/python3-decouple_3.8.bb
>> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3Da46375b26bb7d7603565d829a2a51782"
>>  SRC_URI[sha256sum] =3D
>> "ba6e2657d4f376ecc46f77a3a615e058d93ba5e465c01bbe57289bfb7cce680f"
>>
>>  PYPI_PACKAGE =3D "python-decouple"
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>>
>>  inherit pypi setuptools3
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb
>> b/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb
>> index 6ec72d02aa..de00edad99 100644
>> --- a/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb
>> +++ b/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb
>> @@ -5,6 +5,7 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3Dd2794c0df5b907fdace235a619d80314"
>>  SRC_URI[sha256sum] =3D
>> "51fda6bcc5ddbbb7063b2af7509e43bd84bfc32a4ff71349ec7847713882327b"
>>
>>  PYPI_PACKAGE =3D "python-editor"
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>>
>>  inherit pypi setuptools3
>>
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-eth-keyfile_0.8.0.bb b/meta-python/recipes-devtools/python/
>> python3-eth-keyfile_0.8.0.bb
>> index 741db5ced0..2b4c27e36b 100644
>> --- a/meta-python/recipes-devtools/python/python3-eth-keyfile_0.8.0.bb
>> +++ b/meta-python/recipes-devtools/python/python3-eth-keyfile_0.8.0.bb
>> @@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3D6749008d847c14b9718949c2e24d5c0a"
>>
>>  SRC_URI[sha256sum] =3D
>> "02e3c2e564c7403b92db3fef8ecae3d21123b15787daecd5b643a57369c530f9"
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi setuptools3
>>
>>  RDEPENDS:${PN} +=3D " \
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-eth-keys_0.5.0.bb b/meta-python/recipes-devtools/python/
>> python3-eth-keys_0.5.0.bb
>> index aabfff1b1d..4d1f3d9652 100644
>> --- a/meta-python/recipes-devtools/python/python3-eth-keys_0.5.0.bb
>> +++ b/meta-python/recipes-devtools/python/python3-eth-keys_0.5.0.bb
>> @@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3D6749008d847c14b9718949c2e24d5c0a"
>>
>>  SRC_URI[sha256sum] =3D
>> "a0abccb83f3d84322591a2c047a1e3aa52ea86b185fa3e82ce311d120ca2791e"
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi setuptools3
>>
>>  RDEPENDS:${PN} +=3D "python3-eth-utils"
>> diff --git a/meta-python/recipes-devtools/python/python3-eth-rlp_2.1.0.b=
b
>> b/meta-python/recipes-devtools/python/python3-eth-rlp_2.1.0.bb
>> index 4bdc0c8873..a66ec21086 100644
>> --- a/meta-python/recipes-devtools/python/python3-eth-rlp_2.1.0.bb
>> +++ b/meta-python/recipes-devtools/python/python3-eth-rlp_2.1.0.bb
>> @@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3D3d7bdfe69b1ffbde073ca6e96f5c53f7"
>>
>>  SRC_URI[sha256sum] =3D
>> "d5b408a8cd20ed496e8e66d0559560d29bc21cee482f893936a1f05d0dddc4a0"
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi setuptools3
>>
>>  RDEPENDS:${PN} =3D " \
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-file-magic_0.4.1.bb b/meta-python/recipes-devtools/python/
>> python3-file-magic_0.4.1.bb
>> index cf0296b018..faf081097f 100644
>> --- a/meta-python/recipes-devtools/python/python3-file-magic_0.4.1.bb
>> +++ b/meta-python/recipes-devtools/python/python3-file-magic_0.4.1.bb
>> @@ -7,6 +7,8 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3D0e949c0b3fb4fd86232f00c6ee0bdef3"
>>
>>  SRC_URI[sha256sum] =3D
>> "a91d1483117f7ed48cd0238ad9be36b04824d57e9c38ea7523113989e81b9c53"
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi python_setuptools_build_meta
>>
>>  DEPENDS +=3D "python3-wheel-native"
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-flask-bootstrap_3.3.7.1.bb b/meta-python/recipes-devtools/python=
/
>> python3-flask-bootstrap_3.3.7.1.bb
>> index e28e41c124..239b97ea51 100644
>> --- a/meta-python/recipes-devtools/python/
>> python3-flask-bootstrap_3.3.7.1.bb
>> +++ b/meta-python/recipes-devtools/python/
>> python3-flask-bootstrap_3.3.7.1.bb
>> @@ -4,7 +4,8 @@ LIC_FILES_CHKSUM =3D
>> "file://PKG-INFO;md5=3Da03749709f06118a17349deb5a210619"
>>
>>  SRC_URI[sha256sum] =3D
>> "cb08ed940183f6343a64e465e83b3a3f13c53e1baabb8d72b5da4545ef123ac8"
>>
>> -PYPI_PACKAGE =3D "Flask-Bootstrap"
>> +PYPI_PACKAGE =3D "flask-bootstrap"
>> +PYPI_PACKAGE_SDIST =3D "Flask-Bootstrap"
>>
>>  inherit pypi setuptools3
>>
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-flask-jsonpify_1.5.0.bb b/meta-python/recipes-devtools/python/
>> python3-flask-jsonpify_1.5.0.bb
>> index 93ecf08453..3ecd75f104 100644
>> --- a/meta-python/recipes-devtools/python/python3-flask-jsonpify_1.5.0.b=
b
>> +++ b/meta-python/recipes-devtools/python/python3-flask-jsonpify_1.5.0.b=
b
>> @@ -4,7 +4,8 @@ SECTION =3D "devel/python"
>>  LICENSE =3D "MIT"
>>  LIC_FILES_CHKSUM =3D
>> "file://README.rst;md5=3Dbd59445a234a0c8250b39178d42e3148"
>>
>> -PYPI_PACKAGE =3D "Flask-Jsonpify"
>> +PYPI_PACKAGE =3D "flask-jsonpify"
>> +PYPI_PACKAGE_SDIST =3D "Flask-Jsonpify"
>>
>>  SRC_URI[sha256sum] =3D
>> "8ac4c732aa5b11d9f6c2de58065d3b669f139518ca8f529bce943817e2fedbfb"
>>
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-flask-jwt_0.3.2.bb b/meta-python/recipes-devtools/python/
>> python3-flask-jwt_0.3.2.bb
>> index f7044b314f..d4ce779eb4 100644
>> --- a/meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.bb
>> +++ b/meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.bb
>> @@ -4,7 +4,8 @@ SECTION =3D "devel/python"
>>  LICENSE =3D "MIT"
>>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dff00db41c47ec84b4567a8b3c246=
a959"
>>
>> -PYPI_PACKAGE =3D "Flask-JWT"
>> +PYPI_PACKAGE =3D "flask-jwt"
>> +PYPI_PACKAGE_SDIST =3D "Flask-JWT"
>>
>>  SRC_URI[sha256sum] =3D
>> "49c0672fbde0f1cd3374bd834918d28956e3c521c7e00089cdc5380d323bd0ad"
>>
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-flask-login_0.6.3.bb b/meta-python/recipes-devtools/python/
>> python3-flask-login_0.6.3.bb
>> index df22ca112c..3382124acd 100644
>> --- a/meta-python/recipes-devtools/python/python3-flask-login_0.6.3.bb
>> +++ b/meta-python/recipes-devtools/python/python3-flask-login_0.6.3.bb
>> @@ -8,7 +8,8 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3D8aa87a1cd9fa41d969ad32cfdac2c596"
>>
>>  SRC_URI[sha256sum] =3D
>> "5e23d14a607ef12806c699590b89d0f0e0d67baeec599d75947bf9c147330333"
>>
>> -PYPI_PACKAGE =3D "Flask-Login"
>> +PYPI_PACKAGE =3D "flask-login"
>> +PYPI_PACKAGE_SDIST =3D "Flask-Login"
>>
>>  inherit pypi setuptools3
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-flask-nav_0.6.b=
b
>> b/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
>> index 16afb1d1ce..9e74a112fd 100644
>> --- a/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
>> +++ b/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
>> @@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D
>> "file://PKG-INFO;md5=3D2729ee82259d601d90d28b0574d12416"
>>  SRC_URI[sha256sum] =3D
>> "44e40b755380a1e68ab521a2f9174de259a2c94ddcdaabf36b3aca2e110a33f4"
>>
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi setuptools3
>>
>>  RDEPENDS:${PN} +=3D "\
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-flask-restful_0.3.10.bb b/meta-python/recipes-devtools/python/
>> python3-flask-restful_0.3.10.bb
>> index 8ea455c633..89afc42cb2 100644
>> --- a/meta-python/recipes-devtools/python/python3-flask-restful_0.3.10.b=
b
>> +++ b/meta-python/recipes-devtools/python/python3-flask-restful_0.3.10.b=
b
>> @@ -10,6 +10,7 @@ SRC_URI[sha256sum] =3D
>> "fe4af2ef0027df8f9b4f797aba20c5566801b6ade995ac63b588abf1a5
>>
>>  inherit pypi setuptools3
>>
>> -PYPI_PACKAGE =3D "Flask-RESTful"
>> +PYPI_PACKAGE =3D "flask-restful"
>> +PYPI_PACKAGE_SDIST =3D "Flask-RESTful"
>>
>>  RDEPENDS:${PN} =3D "python3-flask"
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-flask-restx_1.3.2.bb b/meta-python/recipes-devtools/python/
>> python3-flask-restx_1.3.2.bb
>> index bf0f3b374a..917f4fa506 100644
>> --- a/meta-python/recipes-devtools/python/python3-flask-restx_1.3.2.bb
>> +++ b/meta-python/recipes-devtools/python/python3-flask-restx_1.3.2.bb
>> @@ -6,6 +6,8 @@ SRC_URI[sha256sum] =3D
>> "0ae13d77e7d7e4dce513970cfa9db45364aef210e99022de26d2b73eb4
>>
>>  CVE_PRODUCT =3D "flask-restx"
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi setuptools3
>>
>>  RDEPENDS:${PN} +=3D " \
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-flask-sijax_0.4.1.bb b/meta-python/recipes-devtools/python/
>> python3-flask-sijax_0.4.1.bb
>> index d518a1877f..60dd5bdd93 100644
>> --- a/meta-python/recipes-devtools/python/python3-flask-sijax_0.4.1.bb
>> +++ b/meta-python/recipes-devtools/python/python3-flask-sijax_0.4.1.bb
>> @@ -6,7 +6,8 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE.txt;md5=3D266adc7b911b7c84b837bf77196e1ba6"
>>
>>  SRC_URI[sha256sum] =3D
>> "fb2bf2d4f75408185102195055d75549fee8d9c9e954dca2427186925cdc429f"
>>
>> -PYPI_PACKAGE =3D "Flask-Sijax"
>> +PYPI_PACKAGE =3D "flask-sijax"
>> +PYPI_PACKAGE_SDIST =3D "Flask-Sijax"
>>
>>  inherit pypi setuptools3
>>
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-flask-uploads_0.2.1.bb b/meta-python/recipes-devtools/python/
>> python3-flask-uploads_0.2.1.bb
>> index a51ead3c8a..a04f5c0dc5 100644
>> --- a/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb
>> +++ b/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb
>> @@ -4,7 +4,8 @@ LIC_FILES_CHKSUM =3D
>> "file://PKG-INFO;md5=3Db712ac634b39469660c9bdfb8d03421c"
>>
>>  SRC_URI[sha256sum] =3D
>> "53ecbd6033667d50ae02b63adebbaa33c7fc56c09e5293025810cf9d841ecb02"
>>
>> -PYPI_PACKAGE =3D "Flask-Uploads"
>> +PYPI_PACKAGE =3D "flask-uploads"
>> +PYPI_PACKAGE_SDIST =3D "Flask-Uploads"
>>
>>  inherit pypi setuptools3
>>
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-flask-user_0.6.19.bb b/meta-python/recipes-devtools/python/
>> python3-flask-user_0.6.19.bb
>> index 951020dae9..cfa485c4cd 100644
>> --- a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
>> +++ b/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
>> @@ -8,7 +8,8 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE.txt;md5=3D97de97cd9d6e23c88129d884588ce71a"
>>
>>  SRC_URI[sha256sum] =3D
>> "601abcc0343dfbae0c56273d98362d5cdc266ac84d20b3f65a212e4a2c83b302"
>>
>> -PYPI_PACKAGE =3D "Flask-User"
>> +PYPI_PACKAGE =3D "flask-user"
>> +PYPI_PACKAGE_SDIST =3D "Flask-User"
>>
>>  CVE_PRODUCT =3D "flask-user_project:flask-user"
>>
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-flask-versioned_0.9.4-20101221.bb
>> b/meta-python/recipes-devtools/python/
>> python3-flask-versioned_0.9.4-20101221.bb
>> index 3492d5efc8..68cbc44a44 100644
>> --- a/meta-python/recipes-devtools/python/
>> python3-flask-versioned_0.9.4-20101221.bb
>> +++ b/meta-python/recipes-devtools/python/
>> python3-flask-versioned_0.9.4-20101221.bb
>> @@ -3,7 +3,8 @@ SECTION =3D "devel/python"
>>  LICENSE =3D "BSD-3-Clause"
>>  LIC_FILES_CHKSUM =3D
>> "file://flaskext/versioned/__init__.py;md5=3Ddcb7d97884bf08c256ff5795766=
bcd24"
>>
>> -PYPI_PACKAGE =3D "Flask-Versioned"
>> +PYPI_PACKAGE =3D "flask-versioned"
>> +PYPI_PACKAGE_SDIST =3D "Flask-Versioned"
>>
>>  SRC_URI[sha256sum] =3D
>> "516694dc860a1bc4f22ab60b324a85083c0150522be109282a3bed681057fd34"
>>
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-flask-xstatic_0.0.1.bb b/meta-python/recipes-devtools/python/
>> python3-flask-xstatic_0.0.1.bb
>> index c4cad466ad..8a52ab0086 100644
>> --- a/meta-python/recipes-devtools/python/python3-flask-xstatic_0.0.1.bb
>> +++ b/meta-python/recipes-devtools/python/python3-flask-xstatic_0.0.1.bb
>> @@ -6,7 +6,8 @@ SRC_URI[sha256sum] =3D
>> "226ea8e97065a9488b59bfe5c94af4c6e2ea70a25052e301fb231a1381
>>
>>  SRC_URI +=3D "file://remove-pip-requires.patch"
>>
>> -PYPI_PACKAGE =3D "Flask-XStatic"
>> +PYPI_PACKAGE =3D "flask-xstatic"
>> +PYPI_PACKAGE_SDIST =3D "Flask-XStatic"
>>
>>  RDEPENDS:${PN} +=3D "\
>>      python3-flask \
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-gpsd-py3_0.3.0.bb b/meta-python/recipes-devtools/python/
>> python3-gpsd-py3_0.3.0.bb
>> index d2cfbf46a0..dff21c4b9a 100644
>> --- a/meta-python/recipes-devtools/python/python3-gpsd-py3_0.3.0.bb
>> +++ b/meta-python/recipes-devtools/python/python3-gpsd-py3_0.3.0.bb
>> @@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D
>> "file://setup.py;beginline=3D10;endline=3D10;md5=3Dc2d9994c57f0444e
>>  SRC_URI[sha256sum] =3D
>> "2908d3bd78dfb6720ecfe22f97e139b5a4a198f38df3a77215cf644a33513192"
>>
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi setuptools3
>>
>>  CLEANBROKEN =3D "1"
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-idna-ssl_1.1.0.bb b/meta-python/recipes-devtools/python/
>> python3-idna-ssl_1.1.0.bb
>> index cc431b33bd..3ff8a0cae8 100644
>> --- a/meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb
>> +++ b/meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb
>> @@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3Da61b9c5aec8796b64a6bf15d42605073"
>>  SRC_URI[sha256sum] =3D
>> "a933e3bb13da54383f9e8f35dc4f9cb9eb9b3b78c6b36f311254d6d0d92c6c7c"
>>
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi setuptools3
>>
>>  RDEPENDS:${PN} +=3D " \
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-javaobj-py3_0.4.4.bb b/meta-python/recipes-devtools/python/
>> python3-javaobj-py3_0.4.4.bb
>> index d71101ee2c..3e5b6c0f48 100644
>> --- a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.4.bb
>> +++ b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.4.bb
>> @@ -9,6 +9,8 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3Dd273d63619c9aeaf15cdaf76422c4f87"
>>
>>  SRC_URI[sha256sum] =3D
>> "e4e3257ef2cf81a3339787a4d5cf924e54c91f095a723f6d2584dae61d4396ed"
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi setuptools3
>>
>>  BBCLASSEXTEND =3D "native nativesdk"
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-jsonpath-rw_1.4.0.bb b/meta-python/recipes-devtools/python/
>> python3-jsonpath-rw_1.4.0.bb
>> index 8d846ab720..2e89d5dd94 100644
>> --- a/meta-python/recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb
>> +++ b/meta-python/recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb
>> @@ -7,6 +7,8 @@ LIC_FILES_CHKSUM =3D
>> "file://README.rst;beginline=3D198;endline=3D215;md5=3D2866908485c1
>>  SRC_URI +=3D "file://0001-drop-the-six-dependency.patch"
>>  SRC_URI[sha256sum] =3D
>> "05c471281c45ae113f6103d1268ec7a4831a2e96aa80de45edc89b11fac4fbec"
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi setuptools3
>>
>>  RDEPENDS:${PN} +=3D " \
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-lru-dict_1.3.0.bb b/meta-python/recipes-devtools/python/
>> python3-lru-dict_1.3.0.bb
>> index d136dcb005..4f9072d2be 100644
>> --- a/meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb
>> +++ b/meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb
>> @@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3D9d10a486ee04034fdef5162fd791f153"
>>
>>  SRC_URI[sha256sum] =3D
>> "54fd1966d6bd1fcde781596cb86068214edeebff1db13a2cea11079e3fd07b6b"
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi python_setuptools_build_meta
>>
>>  DEPENDS +=3D "python3-wheel-native"
>> diff --git a/meta-python/recipes-devtools/python/python3-nmap_1.9.1.bb
>> b/meta-python/recipes-devtools/python/python3-nmap_1.9.1.bb
>> index 25e382088b..29b1e5ce0b 100644
>> --- a/meta-python/recipes-devtools/python/python3-nmap_1.9.1.bb
>> +++ b/meta-python/recipes-devtools/python/python3-nmap_1.9.1.bb
>> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3D1ebbd3e34237af26da5dc08a4e440464"
>>  DEPENDS +=3D "python3-wheel-native"
>>
>>  PYPI_PACKAGE =3D "python3-nmap"
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>>
>>  SRC_URI[sha256sum] =3D
>> "8465cfb013f5cdfa8a1050c40cdae600b581ee32f1864ec404927aee49b4262c"
>>
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-ordered-set_4.1.0.bb b/meta-python/recipes-devtools/python/
>> python3-ordered-set_4.1.0.bb
>> index 6dbc9d6538..a9494d0f90 100644
>> --- a/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb
>> +++ b/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb
>> @@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D
>> "file://MIT-LICENSE;md5=3D3bf5e1ad64c0d99032c3143361fa234e"
>>
>>  SRC_URI[sha256sum] =3D
>> "694a8e44c87657c59292ede72891eb91d34131f6531463aab3009191c77364a8"
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi python_flit_core ptest-python-pytest
>>
>>  PTEST_PYTEST_DIR =3D "test"
>> diff --git a/meta-python/recipes-devtools/python/python3-pkcs11_0.7.0.bb
>> b/meta-python/recipes-devtools/python/python3-pkcs11_0.7.0.bb
>> index 84bc17959a..5414e720c1 100644
>> --- a/meta-python/recipes-devtools/python/python3-pkcs11_0.7.0.bb
>> +++ b/meta-python/recipes-devtools/python/python3-pkcs11_0.7.0.bb
>> @@ -8,6 +8,7 @@ LIC_FILES_CHKSUM =3D
>> "file://README.rst;beginline=3D337;endline=3D358;md5=3Df68bda54505b
>>  SRC_URI[sha256sum] =3D
>> "9737e0c24cabb8bc9d48bf8c57c3df2a70f8cdd96b70c50290803286f9e46bf7"
>>
>>  PYPI_PACKAGE =3D "python-pkcs11"
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>>
>>  inherit pypi setuptools3 cython
>>
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-precise-runner_0.3.1.bb b/meta-python/recipes-devtools/python/
>> python3-precise-runner_0.3.1.bb
>> index 53fc31ab83..991e3b9a98 100644
>> --- a/meta-python/recipes-devtools/python/python3-precise-runner_0.3.1.b=
b
>> +++ b/meta-python/recipes-devtools/python/python3-precise-runner_0.3.1.b=
b
>> @@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D
>> "file://README.md;md5=3D2ad29e930f3107d52d2a55728bf62116"
>>
>>  SRC_URI[sha256sum] =3D
>> "1a464209fb4bf0a3f5d5a428310cb2a70487a01a6bc3a960d1dda90af896b80d"
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi setuptools3 ptest-python-pytest
>>
>>  PTEST_PYTEST_DIR =3D "test"
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-process-tests_3.0.0.bb b/meta-python/recipes-devtools/python/
>> python3-process-tests_3.0.0.bb
>> index a16497b984..4c113f8d7b 100644
>> --- a/meta-python/recipes-devtools/python/python3-process-tests_3.0.0.bb
>> +++ b/meta-python/recipes-devtools/python/python3-process-tests_3.0.0.bb
>> @@ -8,6 +8,8 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3Daea36d49429f53e06868d87cd9d62349"
>>
>>  SRC_URI[sha256sum] =3D
>> "e5d57dea7161251e91cadb84bf3ecc85275fb121fd478e579f800777b1d424bd"
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi setuptools3
>>
>>  RDEPENDS:${PN} +=3D "python3-core"
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-py-cpuinfo_9.0.0.bb b/meta-python/recipes-devtools/python/
>> python3-py-cpuinfo_9.0.0.bb
>> index db0e2a96d8..17bfccc768 100644
>> --- a/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
>> +++ b/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
>> @@ -8,6 +8,8 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3Dd2379ecb0d7a8299101b1e4c160cd1f7"
>>
>>  SRC_URI[sha256sum] =3D
>> "3cdbbf3fac90dc6f118bfd64384f309edeadd902d7c8fb17f02ffa1fc3f49690"
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit ptest-python-pytest pypi python_setuptools_build_meta
>>
>>  DEPENDS +=3D "python3-wheel-native"
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-py-ubjson_0.16.1.bb b/meta-python/recipes-devtools/python/
>> python3-py-ubjson_0.16.1.bb
>> index 0db9d65fd3..3fa07f3e3d 100644
>> --- a/meta-python/recipes-devtools/python/python3-py-ubjson_0.16.1.bb
>> +++ b/meta-python/recipes-devtools/python/python3-py-ubjson_0.16.1.bb
>> @@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3D383b9e6c3f9d1386a4eea17792291d91"
>>
>>  SRC_URI[sha256sum] =3D
>> "b9bfb8695a1c7e3632e800fb83c943bf67ed45ddd87cd0344851610c69a5a482"
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi setuptools3
>>
>>  RDEPENDS:${PN} +=3D " \
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-pyserial-asyncio_0.6.bb b/meta-python/recipes-devtools/python/
>> python3-pyserial-asyncio_0.6.bb
>> index 30ff62a7ed..1ba02b04b1 100644
>> --- a/meta-python/recipes-devtools/python/python3-pyserial-asyncio_0.6.b=
b
>> +++ b/meta-python/recipes-devtools/python/python3-pyserial-asyncio_0.6.b=
b
>> @@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE.txt;md5=3D9a79418f241689e78034391d51162d24"
>>
>>  SRC_URI[sha256sum] =3D
>> "b6032923e05e9d75ec17a5af9a98429c46d2839adfaf80604d52e0faacd7a32f"
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi setuptools3
>>
>>  RDEPENDS:${PN} +=3D "python3-asyncio python3-core python3-pyserial"
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-pytest-benchmark_5.1.0.bb b/meta-python/recipes-devtools/python/
>> python3-pytest-benchmark_5.1.0.bb
>> index ae4b12c210..442bda09f6 100644
>> --- a/meta-python/recipes-devtools/python/
>> python3-pytest-benchmark_5.1.0.bb
>> +++ b/meta-python/recipes-devtools/python/
>> python3-pytest-benchmark_5.1.0.bb
>> @@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3Dd606e94f56c21c8e0cdde0b622dcdf57"
>>
>>  SRC_URI[sha256sum] =3D
>> "9ea661cdc292e8231f7cd4c10b0319e56a2118e2c09d9f50e1b3d150d2aca105"
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi setuptools3
>>
>>  RDEPENDS:${PN} +=3D "python3-core python3-py-cpuinfo python3-pytest
>> python3-aspectlib"
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-pytest-forked_1.6.0.bb b/meta-python/recipes-devtools/python/
>> python3-pytest-forked_1.6.0.bb
>> index f573bf0523..62893c741c 100644
>> --- a/meta-python/recipes-devtools/python/python3-pytest-forked_1.6.0.bb
>> +++ b/meta-python/recipes-devtools/python/python3-pytest-forked_1.6.0.bb
>> @@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3D772fcdaca14b378878d05c7d857e6c3e"
>>
>>  SRC_URI[sha256sum] =3D
>> "4dafd46a9a600f65d822b8f605133ecf5b3e1941ebb3588e943b4e3eb71a5a3f"
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi python_setuptools_build_meta
>>
>>  PEP517_BUILD_OPTS =3D "--skip-dependency-check"
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-pytest-helpers-namespace_2021.12.29.bb
>> b/meta-python/recipes-devtools/python/
>> python3-pytest-helpers-namespace_2021.12.29.bb
>> index 6698b6dde3..3bdc479340 100644
>> --- a/meta-python/recipes-devtools/python/
>> python3-pytest-helpers-namespace_2021.12.29.bb
>> +++ b/meta-python/recipes-devtools/python/
>> python3-pytest-helpers-namespace_2021.12.29.bb
>> @@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3D440a4cdb311cd7ad181efb4cba06d562"
>>
>>  SRC_URI[sha256sum] =3D
>> "792038247e0021beb966a7ea6e3a70ff5fcfba77eb72c6ec8fd6287af871c35b"
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi python_setuptools_build_meta
>>
>>  DEPENDS +=3D "python3-setuptools-scm-native
>> python3-setuptools-declarative-requirements-native"
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-pytest-json-report_1.5.0.bb
>> b/meta-python/recipes-devtools/python/python3-pytest-json-report_1.5.0.b=
b
>> index 8834a6b586..374d30df69 100644
>> --- a/meta-python/recipes-devtools/python/
>> python3-pytest-json-report_1.5.0.bb
>> +++ b/meta-python/recipes-devtools/python/
>> python3-pytest-json-report_1.5.0.bb
>> @@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3D8b4ca2f2ad5aaaebd8eb24f262f8fe60"
>>  SRC_URI[sha256sum] =3D
>> "2dde3c647851a19b5f3700729e8310a6e66efb2077d674f27ddea3d34dc615de"
>>
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi setuptools3
>>
>>  DEPENDS +=3D "python3-setuptools-scm-native"
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-pytest-localserver_0.8.1.bb
>> b/meta-python/recipes-devtools/python/python3-pytest-localserver_0.8.1.b=
b
>> index e9500bd3db..5c644b88f5 100644
>> --- a/meta-python/recipes-devtools/python/
>> python3-pytest-localserver_0.8.1.bb
>> +++ b/meta-python/recipes-devtools/python/
>> python3-pytest-localserver_0.8.1.bb
>> @@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3Db8da7a541d738b054dcbf70c31530432"
>>
>>  DEPENDS +=3D "python3-setuptools-scm-native"
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi python_setuptools_build_meta ptest-python-pytest
>>
>>  SRC_URI[sha256sum] =3D
>> "66569c34fef31a5750b16effd1cd1288a7a90b59155d005e7f916accd3dee4f1"
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-pytest-relaxed_2.0.2.bb b/meta-python/recipes-devtools/python/
>> python3-pytest-relaxed_2.0.2.bb
>> index 6e56d20b8d..46679d4ae7 100644
>> --- a/meta-python/recipes-devtools/python/python3-pytest-relaxed_2.0.2.b=
b
>> +++ b/meta-python/recipes-devtools/python/python3-pytest-relaxed_2.0.2.b=
b
>> @@ -7,6 +7,8 @@ SRC_URI +=3D
>> "file://0001-pytest_relaxed-plugin.py-Handle-terminalreporter.patch"
>>
>>  SRC_URI[sha256sum] =3D
>> "956ea028ec30dbbfb680dd8e7b4a7fb8f80a239595e88bace018bf2c0d718248"
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi setuptools3
>>
>>  RDEPENDS:${PN} +=3D " \
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-pytest-runner_6.0.1.bb b/meta-python/recipes-devtools/python/
>> python3-pytest-runner_6.0.1.bb
>> index dd3a8d0234..31dce85176 100644
>> --- a/meta-python/recipes-devtools/python/python3-pytest-runner_6.0.1.bb
>> +++ b/meta-python/recipes-devtools/python/python3-pytest-runner_6.0.1.bb
>> @@ -9,6 +9,8 @@ SRC_URI +=3D " \
>>
>> file://0001-Not-use-functions-from-pkg_resources-any-more.patch \
>>             "
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi python_setuptools_build_meta
>>
>>  DEPENDS +=3D " \
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-pytest-sugar_1.1.1.bb b/meta-python/recipes-devtools/python/
>> python3-pytest-sugar_1.1.1.bb
>> index 22eb3d52ff..765a869e64 100644
>> --- a/meta-python/recipes-devtools/python/python3-pytest-sugar_1.1.1.bb
>> +++ b/meta-python/recipes-devtools/python/python3-pytest-sugar_1.1.1.bb
>> @@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3De485b36215d1a038821b3e51bd189197"
>>  SRC_URI +=3D "file://run-ptest"
>>  SRC_URI[sha256sum] =3D
>> "73b8b65163ebf10f9f671efab9eed3d56f20d2ca68bda83fa64740a92c08f65d"
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi python_poetry_core ptest-python-pytest
>>
>>  DEPENDS +=3D "python3-wheel-native"
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-pytest-tempdir_2019.10.12.bb
>> b/meta-python/recipes-devtools/python/
>> python3-pytest-tempdir_2019.10.12.bb
>> index b161b016bc..104c658317 100644
>> --- a/meta-python/recipes-devtools/python/
>> python3-pytest-tempdir_2019.10.12.bb
>> +++ b/meta-python/recipes-devtools/python/
>> python3-pytest-tempdir_2019.10.12.bb
>> @@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D
>> "file://PKG-INFO;md5=3D9872c3a37cc9baf79a464cd168282be5"
>>
>>  SRC_URI[sha256sum] =3D
>> "e7d91813a9aa991db87dacdef8cfd3f1657632d731d56d06238c5ffb63ab36d8"
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi setuptools3
>>
>>  RDEPENDS:${PN} +=3D " \
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-rapidjson_1.19.bb b/meta-python/recipes-devtools/python/
>> python3-rapidjson_1.19.bb
>> index 761676d2ce..48e8ff31e5 100644
>> --- a/meta-python/recipes-devtools/python/python3-rapidjson_1.19.bb
>> +++ b/meta-python/recipes-devtools/python/python3-rapidjson_1.19.bb
>> @@ -10,6 +10,7 @@ SRC_URI[sha256sum] =3D
>> "81e7260f6297cad564389b700783c0a33de71310b9eb01fd013faec5e7
>>  inherit setuptools3 pypi ptest-python-pytest
>>
>>  PYPI_PACKAGE =3D "python-rapidjson"
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>>
>>  SETUPTOOLS_BUILD_ARGS +=3D "
>> --rj-include-dir=3D${RECIPE_SYSROOT}${includedir}"
>>
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-requests-ftp_0.3.1.bb b/meta-python/recipes-devtools/python/
>> python3-requests-ftp_0.3.1.bb
>> index db7c5fee0b..5acb7d73fd 100644
>> --- a/meta-python/recipes-devtools/python/python3-requests-ftp_0.3.1.bb
>> +++ b/meta-python/recipes-devtools/python/python3-requests-ftp_0.3.1.bb
>> @@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3D6683a23c9968b97709441dc884d46df6"
>>  SRC_URI +=3D "file://0001-Remove-use-of-the-cgi-module.patch"
>>  SRC_URI[sha256sum] =3D
>> "7504ceb5cba8a5c0135ed738596820a78c5f2be92d79b29f96ba99b183d8057a"
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi setuptools3
>>
>>  RDEPENDS:${PN} +=3D " \
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-requests-mock_1.12.1.bb b/meta-python/recipes-devtools/python/
>> python3-requests-mock_1.12.1.bb
>> index 248526b00b..8cfc05a713 100644
>> --- a/meta-python/recipes-devtools/python/python3-requests-mock_1.12.1.b=
b
>> +++ b/meta-python/recipes-devtools/python/python3-requests-mock_1.12.1.b=
b
>> @@ -6,4 +6,6 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3D3b2eea41aec0f2973a45e1e45f28aa32"
>>  DEPENDS =3D "python3-setuptools-scm-native"
>>  SRC_URI[sha256sum] =3D
>> "e9e12e333b525156e82a3c852f22016b9158220d2f47454de9cae8a77d371401"
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi python_setuptools_build_meta
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-requests-oauthlib_2.0.0.bb b/meta-python/recipes-devtools/python=
/
>> python3-requests-oauthlib_2.0.0.bb
>> index 71cafb513d..5fa86e35e5 100644
>> --- a/meta-python/recipes-devtools/python/
>> python3-requests-oauthlib_2.0.0.bb
>> +++ b/meta-python/recipes-devtools/python/
>> python3-requests-oauthlib_2.0.0.bb
>> @@ -3,6 +3,8 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3D22d117a849df10d047ed9b792838e863"
>>
>>  SRC_URI[sha256sum] =3D
>> "b3dffaebd884d8cd778494369603a9e7b58d29111bf6b41bdc2dcd87203af4e9"
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi setuptools3
>>
>>  RDEPENDS:${PN} +=3D "python3-requests python3-oauthlib"
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-robotframework-seriallibrary_0.4.3.bb
>> b/meta-python/recipes-devtools/python/
>> python3-robotframework-seriallibrary_0.4.3.bb
>> index 4a8fcde41b..6de6537021 100644
>> --- a/meta-python/recipes-devtools/python/
>> python3-robotframework-seriallibrary_0.4.3.bb
>> +++ b/meta-python/recipes-devtools/python/
>> python3-robotframework-seriallibrary_0.4.3.bb
>> @@ -7,6 +7,8 @@ SRC_URI +=3D
>> "file://0001-pyproject.toml-Replace-install_requires.patch"
>>  SRC_URI[sha256sum] =3D
>> "f20befe5c1106dd8ddca9f60a2f18bf5ec7d5f06f6f09a03fa66bae54777e6bb"
>>
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi python_poetry_core
>>
>>  RDEPENDS:${PN} +=3D " \
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-setuptools-declarative-requirements_1.3.0.bb
>> b/meta-python/recipes-devtools/python/
>> python3-setuptools-declarative-requirements_1.3.0.bb
>> index 44a51b42fb..525eb6a6ed 100644
>> --- a/meta-python/recipes-devtools/python/
>> python3-setuptools-declarative-requirements_1.3.0.bb
>> +++ b/meta-python/recipes-devtools/python/
>> python3-setuptools-declarative-requirements_1.3.0.bb
>> @@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327"
>>
>>  SRC_URI[sha256sum] =3D
>> "57a5b9bb9ad350c278e8aa6be4cdebbcd925b9ba71d6a712a178a618cfb898f7"
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi python_setuptools_build_meta
>>
>>  DEPENDS +=3D "python3-wheel-native"
>> diff --git a/meta-python/recipes-devtools/python/python3-snappy_0.6.1.bb
>> b/meta-python/recipes-devtools/python/python3-snappy_0.6.1.bb
>> index bd0979d0b4..e7a05ca7b7 100644
>> --- a/meta-python/recipes-devtools/python/python3-snappy_0.6.1.bb
>> +++ b/meta-python/recipes-devtools/python/python3-snappy_0.6.1.bb
>> @@ -9,5 +9,6 @@ SRC_URI[sha256sum] =3D
>> "b6a107ab06206acc5359d4c5632bd9b22d448702a79b3169b0c62e0fb8
>>  inherit pypi setuptools3
>>
>>  PYPI_PACKAGE =3D "python-snappy"
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>>
>>  RDEPENDS:${PN} +=3D "snappy"
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-speedtest-cli_2.1.3.bb b/meta-python/recipes-devtools/python/
>> python3-speedtest-cli_2.1.3.bb
>> index 472113b059..faf481690d 100644
>> --- a/meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.3.bb
>> +++ b/meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.3.bb
>> @@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57"
>>
>>  SRC_URI[sha256sum] =3D
>> "5e2773233cedb5fa3d8120eb7f97bcc4974b5221b254d33ff16e2f1d413d90f0"
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi setuptools3
>>
>>  RDEPENDS:${PN} +=3D " \
>> diff --git a/meta-python/recipes-devtools/python/python3-systemd_235.bb
>> b/meta-python/recipes-devtools/python/python3-systemd_235.bb
>> index 269e175cc5..58dbf02c6d 100644
>> --- a/meta-python/recipes-devtools/python/python3-systemd_235.bb
>> +++ b/meta-python/recipes-devtools/python/python3-systemd_235.bb
>> @@ -5,6 +5,7 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE.txt;md5=3D4fbd65380cdd255951079008b364516c"
>>
>>
>>  PYPI_PACKAGE =3D "systemd-python"
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>>  SRC_URI:append:libc-musl =3D "
>> file://0001-Provide-implementation-of-strndupa-for-musl.patch"
>>  SRC_URI[sha256sum] =3D
>> "4e57f39797fd5d9e2d22b8806a252d7c0106c936039d1e71c8c6b8008e695c0a"
>>
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-trafaret-config_2.0.2.bb b/meta-python/recipes-devtools/python/
>> python3-trafaret-config_2.0.2.bb
>> index d7a987aa3b..19de00961c 100644
>> --- a/meta-python/recipes-devtools/python/
>> python3-trafaret-config_2.0.2.bb
>> +++ b/meta-python/recipes-devtools/python/
>> python3-trafaret-config_2.0.2.bb
>> @@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D
>> "file://README.rst;beginline=3D98;endline=3D106;md5=3Da15308789c3b7
>>
>>  SRC_URI[sha256sum] =3D
>> "440b6b49e5e975f9a640a2519abb2feddd96eb2aeb1715f87f947a7a079f20be"
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi setuptools3
>>
>>  RDEPENDS:${PN} +=3D " \
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-types-python-dateutil_2.9.0.20241003.bb
>> b/meta-python/recipes-devtools/python/
>> python3-types-python-dateutil_2.9.0.20241003.bb
>> index 09d919dd82..db856b42a2 100644
>> --- a/meta-python/recipes-devtools/python/
>> python3-types-python-dateutil_2.9.0.20241003.bb
>> +++ b/meta-python/recipes-devtools/python/
>> python3-types-python-dateutil_2.9.0.20241003.bb
>> @@ -5,4 +5,6 @@ LIC_FILES_CHKSUM =3D
>> "file://PKG-INFO;beginline=3D6;endline=3D6;md5=3Dc2d9643b4523fdf462
>>
>>  SRC_URI[sha256sum] =3D
>> "58cb85449b2a56d6684e41aeefb4c4280631246a0da1a719bdbe6f3fb0317446"
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi setuptools3
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-types-setuptools_75.5.0.20241120.bb
>> b/meta-python/recipes-devtools/python/
>> python3-types-setuptools_75.5.0.20241120.bb
>> index b9f35406bd..73c6f64e0b 100644
>> --- a/meta-python/recipes-devtools/python/
>> python3-types-setuptools_75.5.0.20241120.bb
>> +++ b/meta-python/recipes-devtools/python/
>> python3-types-setuptools_75.5.0.20241120.bb
>> @@ -3,6 +3,8 @@ HOMEPAGE =3D "https://github.com/python/typeshed"
>>  LICENSE =3D "Apache-2.0"
>>  LIC_FILES_CHKSUM =3D
>> "file://PKG-INFO;beginline=3D6;endline=3D6;md5=3Dc2d9643b4523fdf462545ae=
b1356ad23"
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi setuptools3
>>
>>  SRC_URI[sha256sum] =3D
>> "d3c7e95b0598bf87fede29b3b57b19f5cdcd62a85b9298a7b30f8343f6f21c4f"
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-u-msgpack-python_2.8.0.bb b/meta-python/recipes-devtools/python/
>> python3-u-msgpack-python_2.8.0.bb
>> index e95e4bbfb0..cb6da2e78d 100644
>> --- a/meta-python/recipes-devtools/python/
>> python3-u-msgpack-python_2.8.0.bb
>> +++ b/meta-python/recipes-devtools/python/
>> python3-u-msgpack-python_2.8.0.bb
>> @@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3D17df11353545c53a2df0ce7655859306"
>>
>>  SRC_URI[sha256sum] =3D
>> "b801a83d6ed75e6df41e44518b4f2a9c221dc2da4bcd5380e3a0feda520bc61a"
>>
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>> +
>>  inherit pypi setuptools3 ptest-python-pytest
>>
>>  do_install_ptest:append() {
>> diff --git a/meta-python/recipes-devtools/python/python3-uinput_1.0.1.bb
>> b/meta-python/recipes-devtools/python/python3-uinput_1.0.1.bb
>> index f63cbf22fc..7fa6db560a 100644
>> --- a/meta-python/recipes-devtools/python/python3-uinput_1.0.1.bb
>> +++ b/meta-python/recipes-devtools/python/python3-uinput_1.0.1.bb
>> @@ -7,6 +7,7 @@ SRC_URI +=3D
>> "file://0001-Deal-with-64bit-time_t-default-on-32bit-architecture.pat
>>  SRC_URI[sha256sum] =3D
>> "853697344b64df5537d4ae32ba6fbcf0515d51a9010910f5d5019959038b6eba"
>>
>>  PYPI_PACKAGE =3D "python-uinput"
>> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>>
>>  inherit pypi python_setuptools_build_meta ptest-python-pytest
>>
>> --
>> 2.56.0
>>
>>
>>=20
>>
>>

--0000000000004e3f47065d715dda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Rebased on master-next at 4d617d1b20. Nothing is left to f=
ix, so I am dropping the sweep.<br><br>0a583b3502 on master covers 218 file=
s, and master-next adds the rest. Of the 668 recipes inheriting pypi on mas=
ter-next, 130 ask for an<br>underscored sdist, and all 130 match what PyPI =
actually has. All 61 recipes my sweep touched now carry PYPI_PACKAGE_SDIST,=
 and every one<br>fetches against master-next with an empty DL_DIR.<br><br>=
The python3-pytz recipe in master-next also closes the RDEPENDS gap I menti=
oned.<br><br>Thanks for sorting it out.</div><br><div class=3D"gmail_quote =
gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 9,=
 2026 at 2:36=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
>raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><br><div>Please rebase on top of latest=
 master-next and see whats needed.</div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 9, 2026 at 11:58=E2=80=
=AFAM Joel Winarske via <a href=3D"http://lists.openembedded.org" target=3D=
"_blank">lists.openembedded.org</a> &lt;joel.winarske=3D<a href=3D"mailto:g=
mail.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembe=
dded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">From: Joel Winarske &lt;<a href=3D"mailto:joel.winarske@gmail.com" =
target=3D"_blank">joel.winarske@gmail.com</a>&gt;<br>
<br>
oe-core 98049bf86 redefined PYPI_PACKAGE as the normalized project name and=
<br>
derives the sdist name from it by replacing - with _. 264698b8a migrated<br=
>
oe-core&#39;s own recipes. These were not, so each builds a URL that does n=
ot<br>
exist: the sdists predate PEP 625 and are still hyphenated.<br>
<br>
=C2=A0 ERROR: python3-absl-native-2.1.0-r0 do_fetch: Fetcher failure: Fetch=
 command<br>
=C2=A0 [&#39;wget&#39;, ..., &#39;.../source/a/absl_py/absl_py-2.1.0.tar.gz=
&#39;] failed with exit<br>
=C2=A0 code 8<br>
<br>
64 recipes, 42 taking the derived default and 22 setting PYPI_PACKAGE. 54 c=
an<br>
use ${PYPI_PACKAGE} as Martin&#39;s patches do. The other 10 cannot: normal=
izing<br>
lowercases the name while the sdist keeps its case, as in flask-restful<br>
against Flask-RESTful, so those name the sdist directly.<br>
<br>
No PYPI_PACKAGE is removed. Dropping a non-redundant one repoints HOMEPAGE,=
<br>
UPSTREAM_CHECK_URI and the SPDX purl at the name BPN derives, which is not<=
br>
always the project.<br>
<br>
Checksums are unaffected, only the URLs.<br>
<br>
python3-async-timeout, python3-google-api-core,<br>
python3-google-api-python-client, python3-googleapis-common-protos and<br>
python3-requests-toolbelt are left out, already covered by Martin&#39;s pat=
ches.<br>
python3-tomli-w is already tomli_w-1.2.0.tar.gz and needs nothing.<br>
<br>
Verified against oe-core master with an empty DL_DIR: all 64 fail do_fetch<=
br>
before and fetch after, checksums validated.<br>
<br>
Signed-off-by: Joel Winarske &lt;<a href=3D"mailto:joel.winarske@gmail.com"=
 target=3D"_blank">joel.winarske@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-connectivity/python3-pytun/<a href=3D"http://python3-pytu=
n_2.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytun_2.4.1.bb</a>=
=C2=A0 | 1 +<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-absl_2.=
1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-absl_2.1.0.bb</a>=C2=
=A0 =C2=A0 =C2=A0 | 1 +<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-aiohttp-jinja2_=
1.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-aiohttp-jinja2_1.6.bb<=
/a>=C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-antlr4-runtime_=
4.13.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-antlr4-runtime_4.13=
.1.bb</a>=C2=A0 =C2=A0| 1 +<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-asyncio-glib_0.=
1.bb" rel=3D"noreferrer" target=3D"_blank">python3-asyncio-glib_0.1.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-asyncio-throttl=
e_1.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-asyncio-throttle_1=
.0.2.bb</a>=C2=A0 | 2 ++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-click-repl_0.3.=
0.bb" rel=3D"noreferrer" target=3D"_blank">python3-click-repl_0.3.0.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-click-spinner_0=
.1.10.bb" rel=3D"noreferrer" target=3D"_blank">python3-click-spinner_0.1.10=
.bb</a>=C2=A0 =C2=A0 | 2 ++<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-dateuti=
l_2.9.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-dateutil_2.9.0.bb<=
/a>=C2=A0 | 1 +<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-dbus-deviation_=
0.6.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-dbus-deviation_0.6.1=
.bb</a>=C2=A0 =C2=A0 | 2 ++<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-decoupl=
e_3.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-decouple_3.8.bb</a>=
=C2=A0 =C2=A0 | 1 +<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-editor_=
1.0.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-editor_1.0.4.bb</a>=
=C2=A0 =C2=A0 | 1 +<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-eth-keyfile_0.8=
.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-eth-keyfile_0.8.0.bb</a=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-eth-key=
s_0.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-eth-keys_0.5.0.bb<=
/a>=C2=A0 | 2 ++<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-eth-rlp=
_2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-eth-rlp_2.1.0.bb</a=
>=C2=A0 =C2=A0| 2 ++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-file-magic_0.4.=
1.bb" rel=3D"noreferrer" target=3D"_blank">python3-file-magic_0.4.1.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-flask-bootstrap=
_3.3.7.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-bootstrap_3=
.3.7.1.bb</a> | 3 ++-<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-flask-jsonpify_=
1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-jsonpify_1.5.0=
.bb</a>=C2=A0 =C2=A0 | 3 ++-<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-j=
wt_0.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-jwt_0.3.2.b=
b</a> | 3 ++-<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-flask-login_0.6=
.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-login_0.6.3.bb</a=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 ++-<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-n=
av_0.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-nav_0.6.bb</a=
>=C2=A0 =C2=A0| 2 ++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-flask-restful_0=
.3.10.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-restful_0.3.10=
.bb</a>=C2=A0 =C2=A0 | 3 ++-<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-flask-restx_1.3=
.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-restx_1.3.2.bb</a=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-flask-sijax_0.4=
.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-sijax_0.4.1.bb</a=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 ++-<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-flask-uploads_0=
.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-uploads_0.2.1.b=
b</a>=C2=A0 =C2=A0 =C2=A0| 3 ++-<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-flask-user_0.6.=
19.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-user_0.6.19.bb</a=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 ++-<br>
=C2=A0.../python/<a href=3D"http://python3-flask-versioned_0.9.4-20101221.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-flask-versioned_0.9.4-20101=
221.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 ++-<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-flask-xstatic_0=
.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-xstatic_0.0.1.b=
b</a>=C2=A0 =C2=A0 =C2=A0| 3 ++-<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-gpsd-py=
3_0.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-gpsd-py3_0.3.0.bb<=
/a>=C2=A0 | 2 ++<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-idna-ss=
l_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-idna-ssl_1.1.0.bb<=
/a>=C2=A0 | 2 ++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-javaobj-py3_0.4=
.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-javaobj-py3_0.4.4.bb</a=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-jsonpath-rw_1.4=
.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonpath-rw_1.4.0.bb</a=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-lru-dic=
t_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-lru-dict_1.3.0.bb<=
/a>=C2=A0 | 2 ++<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-nmap_1.=
9.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-nmap_1.9.1.bb</a>=C2=
=A0 =C2=A0 =C2=A0 | 1 +<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-ordered-set_4.1=
.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-ordered-set_4.1.0.bb</a=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-pkcs11_=
0.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pkcs11_0.7.0.bb</a>=
=C2=A0 =C2=A0 | 1 +<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-precise-runner_=
0.3.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-precise-runner_0.3.1=
.bb</a>=C2=A0 =C2=A0 | 2 ++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-process-tests_3=
.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-process-tests_3.0.0.b=
b</a>=C2=A0 =C2=A0 =C2=A0| 2 ++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-py-cpuinfo_9.0.=
0.bb" rel=3D"noreferrer" target=3D"_blank">python3-py-cpuinfo_9.0.0.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-py-ubjson_0.16.=
1.bb" rel=3D"noreferrer" target=3D"_blank">python3-py-ubjson_0.16.1.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-pyserial-asynci=
o_0.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyserial-asyncio_0.6=
.bb</a>=C2=A0 =C2=A0 | 2 ++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-pytest-benchmar=
k_5.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-benchmark_5=
.1.0.bb</a>=C2=A0 | 2 ++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-pytest-forked_1=
.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-forked_1.6.0.b=
b</a>=C2=A0 =C2=A0 =C2=A0| 2 ++<br>
=C2=A0.../python/<a href=3D"http://python3-pytest-helpers-namespace_2021.12=
.29.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-helpers-namespa=
ce_2021.12.29.bb</a>=C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
=C2=A0.../python/<a href=3D"http://python3-pytest-json-report_1.5.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-pytest-json-report_1.5.0.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
=C2=A0.../python/<a href=3D"http://python3-pytest-localserver_0.8.1.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-pytest-localserver_0.8.1.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-pytest-relaxed_=
2.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-relaxed_2.0.2=
.bb</a>=C2=A0 =C2=A0 | 2 ++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-pytest-runner_6=
.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-runner_6.0.1.b=
b</a>=C2=A0 =C2=A0 =C2=A0| 2 ++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-pytest-sugar_1.=
1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-sugar_1.1.1.bb<=
/a>=C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
=C2=A0.../python/<a href=3D"http://python3-pytest-tempdir_2019.10.12.bb" re=
l=3D"noreferrer" target=3D"_blank">python3-pytest-tempdir_2019.10.12.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-rapidjs=
on_1.19.bb" rel=3D"noreferrer" target=3D"_blank">python3-rapidjson_1.19.bb<=
/a>=C2=A0 | 1 +<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-requests-ftp_0.=
3.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-requests-ftp_0.3.1.bb<=
/a>=C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-requests-mock_1=
.12.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-requests-mock_1.12.1=
.bb</a>=C2=A0 =C2=A0 | 2 ++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-requests-oauthl=
ib_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-requests-oauthlib=
_2.0.0.bb</a> | 2 ++<br>
=C2=A0.../python/<a href=3D"http://python3-robotframework-seriallibrary_0.4=
.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-robotframework-serialli=
brary_0.4.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
=C2=A0.../<a href=3D"http://python3-setuptools-declarative-requirements_1.3=
.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-setuptools-declarative-=
requirements_1.3.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-snappy_=
0.6.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-snappy_0.6.1.bb</a>=
=C2=A0 =C2=A0 | 1 +<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-speedtest-cli_2=
.1.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-speedtest-cli_2.1.3.b=
b</a>=C2=A0 =C2=A0 =C2=A0| 2 ++<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-systemd=
_235.bb" rel=3D"noreferrer" target=3D"_blank">python3-systemd_235.bb</a>=C2=
=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-trafaret-config=
_2.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-trafaret-config_2.0=
.2.bb</a>=C2=A0 =C2=A0| 2 ++<br>
=C2=A0.../python/<a href=3D"http://python3-types-python-dateutil_2.9.0.2024=
1003.bb" rel=3D"noreferrer" target=3D"_blank">python3-types-python-dateutil=
_2.9.0.20241003.bb</a>=C2=A0 =C2=A0 =C2=A0| 2 ++<br>
=C2=A0.../python/<a href=3D"http://python3-types-setuptools_75.5.0.20241120=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-types-setuptools_75.5.0.2=
0241120.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-u-msgpack-pytho=
n_2.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-u-msgpack-python_2=
.8.0.bb</a>=C2=A0 | 2 ++<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-uinput_=
1.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-uinput_1.0.1.bb</a>=
=C2=A0 =C2=A0 | 1 +<br>
=C2=A064 files changed, 116 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/meta-python/recipes-connectivity/python3-pytun/<a href=3D"http=
://python3-pytun_2.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyt=
un_2.4.1.bb</a> b/meta-python/recipes-connectivity/python3-pytun/<a href=3D=
"http://python3-pytun_2.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python=
3-pytun_2.4.1.bb</a><br>
index 08ec2cf670..f496bb0705 100644<br>
--- a/meta-python/recipes-connectivity/python3-pytun/<a href=3D"http://pyth=
on3-pytun_2.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytun_2.4.=
1.bb</a><br>
+++ b/meta-python/recipes-connectivity/python3-pytun/<a href=3D"http://pyth=
on3-pytun_2.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytun_2.4.=
1.bb</a><br>
@@ -5,5 +5,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D13f7629e8e4=
989b66b4a913ab05a91de&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;20b53ea7a09dfe173c00ec0a00eea508b05e959f=
5dc4b4bb698aa52252192f8f&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;python-pytun&quot;<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
absl_2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-absl_2.1.0.bb</=
a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-absl_2.1=
.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-absl_2.1.0.bb</a><br>
index 5bdb83175d..210bfeeff9 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-absl_2.=
1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-absl_2.1.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-absl_2.=
1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-absl_2.1.0.bb</a><br>
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D3b83ef96387=
f14655fc854ddc3c6bd57&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;7820790efbb316739cde8b4e19357243fc3608a1=
52024288513dd968d7d959ff&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;absl-py&quot;<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
aiohttp-jinja2_1.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-aiohttp=
-jinja2_1.6.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://=
python3-aiohttp-jinja2_1.6.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-aiohttp-jinja2_1.6.bb</a><br>
index df4a0adcaf..c82ad89c9f 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-aiohttp=
-jinja2_1.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-aiohttp-jinja2=
_1.6.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-aiohttp=
-jinja2_1.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-aiohttp-jinja2=
_1.6.bb</a><br>
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D29dca541e03=
964615590ca7b50392d97&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;a3a7ff5264e5bca52e8ae547bbfd0761b7249523=
0d438d05b6c0915be619b0e2&quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi setuptools3<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot; \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
antlr4-runtime_4.13.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-antl=
r4-runtime_4.13.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"h=
ttp://python3-antlr4-runtime_4.13.1.bb" rel=3D"noreferrer" target=3D"_blank=
">python3-antlr4-runtime_4.13.1.bb</a><br>
index 431d37c7d7..260d16d358 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-antlr4-=
runtime_4.13.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-antlr4-runt=
ime_4.13.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-antlr4-=
runtime_4.13.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-antlr4-runt=
ime_4.13.1.bb</a><br>
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM =3D &quot;file://PKG-INFO;md5=3D4b18e4a9f9=
3178eaa50a9a37f26da7f7&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;3cd282f5ea7cfb841537fe01f143350fdb1c0b1c=
e7981443a2fa8513fddb6d1a&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;antlr4-python3-runtime&quot;<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
asyncio-glib_0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-asyncio-g=
lib_0.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-asyncio-glib_0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-async=
io-glib_0.1.bb</a><br>
index d73e83de54..602bcca715 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-asyncio=
-glib_0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-asyncio-glib_0.1=
.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-asyncio=
-glib_0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-asyncio-glib_0.1=
.bb</a><br>
@@ -2,6 +2,8 @@ SUMMARY =3D &quot;An implementation of the Python 3 asyncio=
 event loop on top of GLib&quot;<br>
=C2=A0LICENSE =3D &quot;LGPL-2.1-only&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING.LGPL;md5=3D4fbd65380cdd2559=
51079008b364516c&quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit setuptools3 pypi features_check<br>
<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;gobject-introspection-data&quot;<b=
r>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
asyncio-throttle_1.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-asy=
ncio-throttle_1.0.2.bb</a> b/meta-python/recipes-devtools/python/<a href=3D=
"http://python3-asyncio-throttle_1.0.2.bb" rel=3D"noreferrer" target=3D"_bl=
ank">python3-asyncio-throttle_1.0.2.bb</a><br>
index 040e70940b..e04372af59 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-asyncio=
-throttle_1.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-asyncio-th=
rottle_1.0.2.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-asyncio=
-throttle_1.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-asyncio-th=
rottle_1.0.2.bb</a><br>
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dc7906e56b70=
808e1ade6ca05e0bb48d5&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;2675282e99d9129ecc446f917e174bc205c65e36=
c602aa18603b4948567fcbd4&quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi setuptools3<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;python3-asyncio&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
click-repl_0.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-click-rep=
l_0.3.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-click-repl_0.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-click=
-repl_0.3.0.bb</a><br>
index b0844ed5a2..4e0d145a83 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-click-r=
epl_0.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-click-repl_0.3.0=
.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-click-r=
epl_0.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-click-repl_0.3.0=
.bb</a><br>
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D580facc4832=
cac548fad94845542da44&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;17849c23dba3d667247dc4defe1757fff98694e9=
0fe37474f3feebb69ced26a9&quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
<br>
=C2=A0DEPENDS +=3D &quot;python3-wheel-native&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
click-spinner_0.1.10.bb" rel=3D"noreferrer" target=3D"_blank">python3-click=
-spinner_0.1.10.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-click-spinner_0.1.10.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-click-spinner_0.1.10.bb</a><br>
index 7f19cc3458..0d09fbdbdf 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-click-s=
pinner_0.1.10.bb" rel=3D"noreferrer" target=3D"_blank">python3-click-spinne=
r_0.1.10.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-click-s=
pinner_0.1.10.bb" rel=3D"noreferrer" target=3D"_blank">python3-click-spinne=
r_0.1.10.bb</a><br>
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D &quot;file://PKG-INFO;beginline=3D8;en=
dline=3D8;md5=3D8227180126797a0148<br>
=C2=A0SRC_URI +=3D &quot;file://0001-Update-Versioneer-to-0.22.patch&quot;<=
br>
=C2=A0SRC_URI[sha256sum] =3D &quot;87eacf9d7298973a25d7615ef57d4782aebf913a=
532bba4b28a37e366e975daf&quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi setuptools3<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;python3-json&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
dateutil_2.9.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-dateutil_2.=
9.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
dateutil_2.9.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-dateutil_2.=
9.0.bb</a><br>
index dd3f55edf9..e66e4f32b7 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-dateuti=
l_2.9.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-dateutil_2.9.0.bb<=
/a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-dateuti=
l_2.9.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-dateutil_2.9.0.bb<=
/a><br>
@@ -8,6 +8,7 @@ SRC_URI +=3D &quot;file://0001-drop-the-six-dependency.patc=
h&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;78e73e19c63f5b20ffa567001531680d939dc042=
bf7850431877645523c66709&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;python-dateutil&quot;<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
<br>
=C2=A0DEPENDS +=3D &quot;python3-wheel-native&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
dbus-deviation_0.6.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-dbus-=
deviation_0.6.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-dbus-deviation_0.6.1.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-dbus-deviation_0.6.1.bb</a><br>
index e969e85465..70066d548b 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-dbus-de=
viation_0.6.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-dbus-deviati=
on_0.6.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-dbus-de=
viation_0.6.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-dbus-deviati=
on_0.6.1.bb</a><br>
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D90263a49bc1=
d9a204656fec4d5616c66&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;e06b88efe223885d2725df51cf7c9b7b463d1c6f=
04ea49d4690874318d0eb7a3&quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi setuptools3<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://0001-Prevent-trying-to-donwload-requierment=
-which-will-ca.patch&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
decouple_3.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-decouple_3.8.=
bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-deco=
uple_3.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-decouple_3.8.bb</=
a><br>
index 20d614a423..b0076dd504 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-decoupl=
e_3.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-decouple_3.8.bb</a><=
br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-decoupl=
e_3.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-decouple_3.8.bb</a><=
br>
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Da46375b26bb=
7d7603565d829a2a51782&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;ba6e2657d4f376ecc46f77a3a615e058d93ba5e4=
65c01bbe57289bfb7cce680f&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;python-decouple&quot;<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
editor_1.0.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-editor_1.0.4.=
bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-edit=
or_1.0.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-editor_1.0.4.bb</=
a><br>
index 6ec72d02aa..de00edad99 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-editor_=
1.0.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-editor_1.0.4.bb</a><=
br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-editor_=
1.0.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-editor_1.0.4.bb</a><=
br>
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dd2794c0df5b=
907fdace235a619d80314&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;51fda6bcc5ddbbb7063b2af7509e43bd84bfc32a=
4ff71349ec7847713882327b&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;python-editor&quot;<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
eth-keyfile_0.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-eth-keyf=
ile_0.8.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://py=
thon3-eth-keyfile_0.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-et=
h-keyfile_0.8.0.bb</a><br>
index 741db5ced0..2b4c27e36b 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-eth-key=
file_0.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-eth-keyfile_0.8=
.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-eth-key=
file_0.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-eth-keyfile_0.8=
.0.bb</a><br>
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D6749008d847=
c14b9718949c2e24d5c0a&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;02e3c2e564c7403b92db3fef8ecae3d21123b157=
87daecd5b643a57369c530f9&quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi setuptools3<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot; \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
eth-keys_0.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-eth-keys_0.=
5.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
eth-keys_0.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-eth-keys_0.=
5.0.bb</a><br>
index aabfff1b1d..4d1f3d9652 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-eth-key=
s_0.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-eth-keys_0.5.0.bb<=
/a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-eth-key=
s_0.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-eth-keys_0.5.0.bb<=
/a><br>
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D6749008d847=
c14b9718949c2e24d5c0a&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;a0abccb83f3d84322591a2c047a1e3aa52ea86b1=
85fa3e82ce311d120ca2791e&quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi setuptools3<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;python3-eth-utils&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
eth-rlp_2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-eth-rlp_2.1.=
0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-et=
h-rlp_2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-eth-rlp_2.1.0.=
bb</a><br>
index 4bdc0c8873..a66ec21086 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-eth-rlp=
_2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-eth-rlp_2.1.0.bb</a=
><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-eth-rlp=
_2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-eth-rlp_2.1.0.bb</a=
><br>
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D3d7bdfe69b1=
ffbde073ca6e96f5c53f7&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;d5b408a8cd20ed496e8e66d0559560d29bc21cee=
482f893936a1f05d0dddc4a0&quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi setuptools3<br>
<br>
=C2=A0RDEPENDS:${PN} =3D &quot; \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
file-magic_0.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-file-magi=
c_0.4.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-file-magic_0.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-file-=
magic_0.4.1.bb</a><br>
index cf0296b018..faf081097f 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-file-ma=
gic_0.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-file-magic_0.4.1=
.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-file-ma=
gic_0.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-file-magic_0.4.1=
.bb</a><br>
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D0e949c0b3fb=
4fd86232f00c6ee0bdef3&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;a91d1483117f7ed48cd0238ad9be36b04824d57e=
9c38ea7523113989e81b9c53&quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
<br>
=C2=A0DEPENDS +=3D &quot;python3-wheel-native&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
flask-bootstrap_3.3.7.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-fl=
ask-bootstrap_3.3.7.1.bb</a> b/meta-python/recipes-devtools/python/<a href=
=3D"http://python3-flask-bootstrap_3.3.7.1.bb" rel=3D"noreferrer" target=3D=
"_blank">python3-flask-bootstrap_3.3.7.1.bb</a><br>
index e28e41c124..239b97ea51 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-b=
ootstrap_3.3.7.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-boo=
tstrap_3.3.7.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-b=
ootstrap_3.3.7.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-boo=
tstrap_3.3.7.1.bb</a><br>
@@ -4,7 +4,8 @@ LIC_FILES_CHKSUM =3D &quot;file://PKG-INFO;md5=3Da03749709f=
06118a17349deb5a210619&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;cb08ed940183f6343a64e465e83b3a3f13c53e1b=
aabb8d72b5da4545ef123ac8&quot;<br>
<br>
-PYPI_PACKAGE =3D &quot;Flask-Bootstrap&quot;<br>
+PYPI_PACKAGE =3D &quot;flask-bootstrap&quot;<br>
+PYPI_PACKAGE_SDIST =3D &quot;Flask-Bootstrap&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
flask-jsonpify_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask=
-jsonpify_1.5.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-flask-jsonpify_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-flask-jsonpify_1.5.0.bb</a><br>
index 93ecf08453..3ecd75f104 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-j=
sonpify_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-jsonpi=
fy_1.5.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-j=
sonpify_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-jsonpi=
fy_1.5.0.bb</a><br>
@@ -4,7 +4,8 @@ SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://README.rst;md5=3Dbd59445a234a0c8250=
b39178d42e3148&quot;<br>
<br>
-PYPI_PACKAGE =3D &quot;Flask-Jsonpify&quot;<br>
+PYPI_PACKAGE =3D &quot;flask-jsonpify&quot;<br>
+PYPI_PACKAGE_SDIST =3D &quot;Flask-Jsonpify&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;8ac4c732aa5b11d9f6c2de58065d3b669f139518=
ca8f529bce943817e2fedbfb&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
flask-jwt_0.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-jwt_=
0.3.2.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-flask-jwt_0.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-jw=
t_0.3.2.bb</a><br>
index f7044b314f..d4ce779eb4 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-j=
wt_0.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-jwt_0.3.2.b=
b</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-j=
wt_0.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-jwt_0.3.2.b=
b</a><br>
@@ -4,7 +4,8 @@ SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dff00db41c47ec84b4567a=
8b3c246a959&quot;<br>
<br>
-PYPI_PACKAGE =3D &quot;Flask-JWT&quot;<br>
+PYPI_PACKAGE =3D &quot;flask-jwt&quot;<br>
+PYPI_PACKAGE_SDIST =3D &quot;Flask-JWT&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;49c0672fbde0f1cd3374bd834918d28956e3c521=
c7e00089cdc5380d323bd0ad&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
flask-login_0.6.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-lo=
gin_0.6.3.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://py=
thon3-flask-login_0.6.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-fl=
ask-login_0.6.3.bb</a><br>
index df22ca112c..3382124acd 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-l=
ogin_0.6.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-login_0.6=
.3.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-l=
ogin_0.6.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-login_0.6=
.3.bb</a><br>
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D8aa87a1cd9f=
a41d969ad32cfdac2c596&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;5e23d14a607ef12806c699590b89d0f0e0d67bae=
ec599d75947bf9c147330333&quot;<br>
<br>
-PYPI_PACKAGE =3D &quot;Flask-Login&quot;<br>
+PYPI_PACKAGE =3D &quot;flask-login&quot;<br>
+PYPI_PACKAGE_SDIST =3D &quot;Flask-Login&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
flask-nav_0.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-nav_0.=
6.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-fl=
ask-nav_0.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-nav_0.6.=
bb</a><br>
index 16afb1d1ce..9e74a112fd 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-n=
av_0.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-nav_0.6.bb</a=
><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-n=
av_0.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-nav_0.6.bb</a=
><br>
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D &quot;file://PKG-INFO;md5=3D2729ee8225=
9d601d90d28b0574d12416&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;44e40b755380a1e68ab521a2f9174de259a2c94d=
dcdaabf36b3aca2e110a33f4&quot;<br>
<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi setuptools3<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;\<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
flask-restful_0.3.10.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask=
-restful_0.3.10.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-flask-restful_0.3.10.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-flask-restful_0.3.10.bb</a><br>
index 8ea455c633..89afc42cb2 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-r=
estful_0.3.10.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-restfu=
l_0.3.10.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-r=
estful_0.3.10.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-restfu=
l_0.3.10.bb</a><br>
@@ -10,6 +10,7 @@ SRC_URI[sha256sum] =3D &quot;fe4af2ef0027df8f9b4f797aba20=
c5566801b6ade995ac63b588abf1a5<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
-PYPI_PACKAGE =3D &quot;Flask-RESTful&quot;<br>
+PYPI_PACKAGE =3D &quot;flask-restful&quot;<br>
+PYPI_PACKAGE_SDIST =3D &quot;Flask-RESTful&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} =3D &quot;python3-flask&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
flask-restx_1.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-re=
stx_1.3.2.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://py=
thon3-flask-restx_1.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-fl=
ask-restx_1.3.2.bb</a><br>
index bf0f3b374a..917f4fa506 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-r=
estx_1.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-restx_1.3=
.2.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-r=
estx_1.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-restx_1.3=
.2.bb</a><br>
@@ -6,6 +6,8 @@ SRC_URI[sha256sum] =3D &quot;0ae13d77e7d7e4dce513970cfa9db4=
5364aef210e99022de26d2b73eb4<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;flask-restx&quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi setuptools3<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot; \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
flask-sijax_0.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-si=
jax_0.4.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://py=
thon3-flask-sijax_0.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-fl=
ask-sijax_0.4.1.bb</a><br>
index d518a1877f..60dd5bdd93 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-s=
ijax_0.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-sijax_0.4=
.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-s=
ijax_0.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-sijax_0.4=
.1.bb</a><br>
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D266adc7=
b911b7c84b837bf77196e1ba6&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;fb2bf2d4f75408185102195055d75549fee8d9c9=
e954dca2427186925cdc429f&quot;<br>
<br>
-PYPI_PACKAGE =3D &quot;Flask-Sijax&quot;<br>
+PYPI_PACKAGE =3D &quot;flask-sijax&quot;<br>
+PYPI_PACKAGE_SDIST =3D &quot;Flask-Sijax&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
flask-uploads_0.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-=
uploads_0.2.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-flask-uploads_0.2.1.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-flask-uploads_0.2.1.bb</a><br>
index a51ead3c8a..a04f5c0dc5 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-u=
ploads_0.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-uploads=
_0.2.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-u=
ploads_0.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-uploads=
_0.2.1.bb</a><br>
@@ -4,7 +4,8 @@ LIC_FILES_CHKSUM =3D &quot;file://PKG-INFO;md5=3Db712ac634b=
39469660c9bdfb8d03421c&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;53ecbd6033667d50ae02b63adebbaa33c7fc56c0=
9e5293025810cf9d841ecb02&quot;<br>
<br>
-PYPI_PACKAGE =3D &quot;Flask-Uploads&quot;<br>
+PYPI_PACKAGE =3D &quot;flask-uploads&quot;<br>
+PYPI_PACKAGE_SDIST =3D &quot;Flask-Uploads&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
flask-user_0.6.19.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-us=
er_0.6.19.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://py=
thon3-flask-user_0.6.19.bb" rel=3D"noreferrer" target=3D"_blank">python3-fl=
ask-user_0.6.19.bb</a><br>
index 951020dae9..cfa485c4cd 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-u=
ser_0.6.19.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-user_0.6.=
19.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-u=
ser_0.6.19.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-user_0.6.=
19.bb</a><br>
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D97de97c=
d9d6e23c88129d884588ce71a&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;601abcc0343dfbae0c56273d98362d5cdc266ac8=
4d20b3f65a212e4a2c83b302&quot;<br>
<br>
-PYPI_PACKAGE =3D &quot;Flask-User&quot;<br>
+PYPI_PACKAGE =3D &quot;flask-user&quot;<br>
+PYPI_PACKAGE_SDIST =3D &quot;Flask-User&quot;<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;flask-user_project:flask-user&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
flask-versioned_0.9.4-20101221.bb" rel=3D"noreferrer" target=3D"_blank">pyt=
hon3-flask-versioned_0.9.4-20101221.bb</a> b/meta-python/recipes-devtools/p=
ython/<a href=3D"http://python3-flask-versioned_0.9.4-20101221.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-flask-versioned_0.9.4-20101221.bb</a><=
br>
index 3492d5efc8..68cbc44a44 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-v=
ersioned_0.9.4-20101221.bb" rel=3D"noreferrer" target=3D"_blank">python3-fl=
ask-versioned_0.9.4-20101221.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-v=
ersioned_0.9.4-20101221.bb" rel=3D"noreferrer" target=3D"_blank">python3-fl=
ask-versioned_0.9.4-20101221.bb</a><br>
@@ -3,7 +3,8 @@ SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;BSD-3-Clause&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://flaskext/versioned/__init__.py;md5=
=3Ddcb7d97884bf08c256ff5795766bcd24&quot;<br>
<br>
-PYPI_PACKAGE =3D &quot;Flask-Versioned&quot;<br>
+PYPI_PACKAGE =3D &quot;flask-versioned&quot;<br>
+PYPI_PACKAGE_SDIST =3D &quot;Flask-Versioned&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;516694dc860a1bc4f22ab60b324a85083c015052=
2be109282a3bed681057fd34&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
flask-xstatic_0.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-=
xstatic_0.0.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-flask-xstatic_0.0.1.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-flask-xstatic_0.0.1.bb</a><br>
index c4cad466ad..8a52ab0086 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-x=
static_0.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-xstatic=
_0.0.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-x=
static_0.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-xstatic=
_0.0.1.bb</a><br>
@@ -6,7 +6,8 @@ SRC_URI[sha256sum] =3D &quot;226ea8e97065a9488b59bfe5c94af4=
c6e2ea70a25052e301fb231a1381<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://remove-pip-requires.patch&quot;<br>
<br>
-PYPI_PACKAGE =3D &quot;Flask-XStatic&quot;<br>
+PYPI_PACKAGE =3D &quot;flask-xstatic&quot;<br>
+PYPI_PACKAGE_SDIST =3D &quot;Flask-XStatic&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-flask \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
gpsd-py3_0.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-gpsd-py3_0.=
3.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
gpsd-py3_0.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-gpsd-py3_0.=
3.0.bb</a><br>
index d2cfbf46a0..dff21c4b9a 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-gpsd-py=
3_0.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-gpsd-py3_0.3.0.bb<=
/a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-gpsd-py=
3_0.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-gpsd-py3_0.3.0.bb<=
/a><br>
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D &quot;file://setup.py;beginline=3D10;e=
ndline=3D10;md5=3Dc2d9994c57f0444e<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;2908d3bd78dfb6720ecfe22f97e139b5a4a198f3=
8df3a77215cf644a33513192&quot;<br>
<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi setuptools3<br>
<br>
=C2=A0CLEANBROKEN =3D &quot;1&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
idna-ssl_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-idna-ssl_1.=
1.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
idna-ssl_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-idna-ssl_1.=
1.0.bb</a><br>
index cc431b33bd..3ff8a0cae8 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-idna-ss=
l_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-idna-ssl_1.1.0.bb<=
/a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-idna-ss=
l_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-idna-ssl_1.1.0.bb<=
/a><br>
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Da61b9c5aec8=
796b64a6bf15d42605073&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;a933e3bb13da54383f9e8f35dc4f9cb9eb9b3b78=
c6b36f311254d6d0d92c6c7c&quot;<br>
<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi setuptools3<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot; \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
javaobj-py3_0.4.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-javaobj-=
py3_0.4.4.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://py=
thon3-javaobj-py3_0.4.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-ja=
vaobj-py3_0.4.4.bb</a><br>
index d71101ee2c..3e5b6c0f48 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-javaobj=
-py3_0.4.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-javaobj-py3_0.4=
.4.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-javaobj=
-py3_0.4.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-javaobj-py3_0.4=
.4.bb</a><br>
@@ -9,6 +9,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dd273d63619c=
9aeaf15cdaf76422c4f87&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;e4e3257ef2cf81a3339787a4d5cf924e54c91f09=
5a723f6d2584dae61d4396ed&quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi setuptools3<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
jsonpath-rw_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonpath=
-rw_1.4.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://py=
thon3-jsonpath-rw_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-js=
onpath-rw_1.4.0.bb</a><br>
index 8d846ab720..2e89d5dd94 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-jsonpat=
h-rw_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonpath-rw_1.4=
.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-jsonpat=
h-rw_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonpath-rw_1.4=
.0.bb</a><br>
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM =3D &quot;file://README.rst;beginline=3D19=
8;endline=3D215;md5=3D2866908485c1<br>
=C2=A0SRC_URI +=3D &quot;file://0001-drop-the-six-dependency.patch&quot;<br=
>
=C2=A0SRC_URI[sha256sum] =3D &quot;05c471281c45ae113f6103d1268ec7a4831a2e96=
aa80de45edc89b11fac4fbec&quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi setuptools3<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot; \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
lru-dict_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-lru-dict_1.=
3.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
lru-dict_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-lru-dict_1.=
3.0.bb</a><br>
index d136dcb005..4f9072d2be 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-lru-dic=
t_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-lru-dict_1.3.0.bb<=
/a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-lru-dic=
t_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-lru-dict_1.3.0.bb<=
/a><br>
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D9d10a486ee0=
4034fdef5162fd791f153&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;54fd1966d6bd1fcde781596cb86068214edeebff=
1db13a2cea11079e3fd07b6b&quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
<br>
=C2=A0DEPENDS +=3D &quot;python3-wheel-native&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
nmap_1.9.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-nmap_1.9.1.bb</=
a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-nmap_1.9=
.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-nmap_1.9.1.bb</a><br>
index 25e382088b..29b1e5ce0b 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-nmap_1.=
9.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-nmap_1.9.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-nmap_1.=
9.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-nmap_1.9.1.bb</a><br>
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D1ebbd3e3423=
7af26da5dc08a4e440464&quot;<br>
=C2=A0DEPENDS +=3D &quot;python3-wheel-native&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;python3-nmap&quot;<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;8465cfb013f5cdfa8a1050c40cdae600b581ee32=
f1864ec404927aee49b4262c&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
ordered-set_4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-ordered-=
set_4.1.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://py=
thon3-ordered-set_4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-or=
dered-set_4.1.0.bb</a><br>
index 6dbc9d6538..a9494d0f90 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-ordered=
-set_4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-ordered-set_4.1=
.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-ordered=
-set_4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-ordered-set_4.1=
.0.bb</a><br>
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D &quot;file://MIT-LICENSE;md5=3D3bf5e1a=
d64c0d99032c3143361fa234e&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;694a8e44c87657c59292ede72891eb91d34131f6=
531463aab3009191c77364a8&quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi python_flit_core ptest-python-pytest<br>
<br>
=C2=A0PTEST_PYTEST_DIR =3D &quot;test&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pkcs11_0.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pkcs11_0.7.0.=
bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pkcs=
11_0.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pkcs11_0.7.0.bb</=
a><br>
index 84bc17959a..5414e720c1 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pkcs11_=
0.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pkcs11_0.7.0.bb</a><=
br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pkcs11_=
0.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pkcs11_0.7.0.bb</a><=
br>
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM =3D &quot;file://README.rst;beginline=3D33=
7;endline=3D358;md5=3Df68bda54505b<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;9737e0c24cabb8bc9d48bf8c57c3df2a70f8cdd9=
6b70c50290803286f9e46bf7&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;python-pkcs11&quot;<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi setuptools3 cython<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
precise-runner_0.3.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-preci=
se-runner_0.3.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-precise-runner_0.3.1.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-precise-runner_0.3.1.bb</a><br>
index 53fc31ab83..991e3b9a98 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-precise=
-runner_0.3.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-precise-runn=
er_0.3.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-precise=
-runner_0.3.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-precise-runn=
er_0.3.1.bb</a><br>
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D &quot;file://README.md;md5=3D2ad29e930=
f3107d52d2a55728bf62116&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;1a464209fb4bf0a3f5d5a428310cb2a70487a01a=
6bc3a960d1dda90af896b80d&quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi setuptools3 ptest-python-pytest<br>
<br>
=C2=A0PTEST_PYTEST_DIR =3D &quot;test&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
process-tests_3.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-proces=
s-tests_3.0.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-process-tests_3.0.0.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-process-tests_3.0.0.bb</a><br>
index a16497b984..4c113f8d7b 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-process=
-tests_3.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-process-tests=
_3.0.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-process=
-tests_3.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-process-tests=
_3.0.0.bb</a><br>
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Daea36d49429=
f53e06868d87cd9d62349&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;e5d57dea7161251e91cadb84bf3ecc85275fb121=
fd478e579f800777b1d424bd&quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi setuptools3<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;python3-core&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
py-cpuinfo_9.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-py-cpuinf=
o_9.0.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-py-cpuinfo_9.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-py-cp=
uinfo_9.0.0.bb</a><br>
index db0e2a96d8..17bfccc768 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-py-cpui=
nfo_9.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-py-cpuinfo_9.0.0=
.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-py-cpui=
nfo_9.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-py-cpuinfo_9.0.0=
.bb</a><br>
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dd2379ecb0d7=
a8299101b1e4c160cd1f7&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;3cdbbf3fac90dc6f118bfd64384f309edeadd902=
d7c8fb17f02ffa1fc3f49690&quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit ptest-python-pytest pypi python_setuptools_build_meta<br>
<br>
=C2=A0DEPENDS +=3D &quot;python3-wheel-native&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
py-ubjson_0.16.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-py-ubjson=
_0.16.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-py-ubjson_0.16.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-py-ub=
json_0.16.1.bb</a><br>
index 0db9d65fd3..3fa07f3e3d 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-py-ubjs=
on_0.16.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-py-ubjson_0.16.1=
.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-py-ubjs=
on_0.16.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-py-ubjson_0.16.1=
.bb</a><br>
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D383b9e6c3f9=
d1386a4eea17792291d91&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;b9bfb8695a1c7e3632e800fb83c943bf67ed45dd=
d87cd0344851610c69a5a482&quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi setuptools3<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot; \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pyserial-asyncio_0.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyser=
ial-asyncio_0.6.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-pyserial-asyncio_0.6.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-pyserial-asyncio_0.6.bb</a><br>
index 30ff62a7ed..1ba02b04b1 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pyseria=
l-asyncio_0.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyserial-asy=
ncio_0.6.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pyseria=
l-asyncio_0.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyserial-asy=
ncio_0.6.bb</a><br>
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D9a79418=
f241689e78034391d51162d24&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;b6032923e05e9d75ec17a5af9a98429c46d2839a=
dfaf80604d52e0faacd7a32f&quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi setuptools3<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;python3-asyncio python3-core python3-pyseri=
al&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pytest-benchmark_5.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyt=
est-benchmark_5.1.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D=
"http://python3-pytest-benchmark_5.1.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">python3-pytest-benchmark_5.1.0.bb</a><br>
index ae4b12c210..442bda09f6 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
benchmark_5.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-ben=
chmark_5.1.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
benchmark_5.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-ben=
chmark_5.1.0.bb</a><br>
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dd606e94f56c=
21c8e0cdde0b622dcdf57&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;9ea661cdc292e8231f7cd4c10b0319e56a2118e2=
c09d9f50e1b3d150d2aca105&quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi setuptools3<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;python3-core python3-py-cpuinfo python3-pyt=
est python3-aspectlib&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pytest-forked_1.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest=
-forked_1.6.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-pytest-forked_1.6.0.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-pytest-forked_1.6.0.bb</a><br>
index f573bf0523..62893c741c 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
forked_1.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-forked=
_1.6.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
forked_1.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-forked=
_1.6.0.bb</a><br>
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D772fcdaca14=
b378878d05c7d857e6c3e&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;4dafd46a9a600f65d822b8f605133ecf5b3e1941=
ebb3588e943b4e3eb71a5a3f&quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
<br>
=C2=A0PEP517_BUILD_OPTS =3D &quot;--skip-dependency-check&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pytest-helpers-namespace_2021.12.29.bb" rel=3D"noreferrer" target=3D"_blank=
">python3-pytest-helpers-namespace_2021.12.29.bb</a> b/meta-python/recipes-=
devtools/python/<a href=3D"http://python3-pytest-helpers-namespace_2021.12.=
29.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-helpers-namespac=
e_2021.12.29.bb</a><br>
index 6698b6dde3..3bdc479340 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
helpers-namespace_2021.12.29.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n3-pytest-helpers-namespace_2021.12.29.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
helpers-namespace_2021.12.29.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n3-pytest-helpers-namespace_2021.12.29.bb</a><br>
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D440a4cdb311=
cd7ad181efb4cba06d562&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;792038247e0021beb966a7ea6e3a70ff5fcfba77=
eb72c6ec8fd6287af871c35b&quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
<br>
=C2=A0DEPENDS +=3D &quot;python3-setuptools-scm-native python3-setuptools-d=
eclarative-requirements-native&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pytest-json-report_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-p=
ytest-json-report_1.5.0.bb</a> b/meta-python/recipes-devtools/python/<a hre=
f=3D"http://python3-pytest-json-report_1.5.0.bb" rel=3D"noreferrer" target=
=3D"_blank">python3-pytest-json-report_1.5.0.bb</a><br>
index 8834a6b586..374d30df69 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
json-report_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-j=
son-report_1.5.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
json-report_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-j=
son-report_1.5.0.bb</a><br>
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D8b4ca2f2ad5=
aaaebd8eb24f262f8fe60&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;2dde3c647851a19b5f3700729e8310a6e66efb20=
77d674f27ddea3d34dc615de&quot;<br>
<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi setuptools3<br>
<br>
=C2=A0DEPENDS +=3D &quot;python3-setuptools-scm-native&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pytest-localserver_0.8.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-p=
ytest-localserver_0.8.1.bb</a> b/meta-python/recipes-devtools/python/<a hre=
f=3D"http://python3-pytest-localserver_0.8.1.bb" rel=3D"noreferrer" target=
=3D"_blank">python3-pytest-localserver_0.8.1.bb</a><br>
index e9500bd3db..5c644b88f5 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
localserver_0.8.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-l=
ocalserver_0.8.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
localserver_0.8.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-l=
ocalserver_0.8.1.bb</a><br>
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Db8da7a541d7=
38b054dcbf70c31530432&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;python3-setuptools-scm-native&quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi python_setuptools_build_meta ptest-python-pytest<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;66569c34fef31a5750b16effd1cd1288a7a90b59=
155d005e7f916accd3dee4f1&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pytest-relaxed_2.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytes=
t-relaxed_2.0.2.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-pytest-relaxed_2.0.2.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-pytest-relaxed_2.0.2.bb</a><br>
index 6e56d20b8d..46679d4ae7 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
relaxed_2.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-relax=
ed_2.0.2.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
relaxed_2.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-relax=
ed_2.0.2.bb</a><br>
@@ -7,6 +7,8 @@ SRC_URI +=3D &quot;file://0001-pytest_relaxed-plugin.py-Han=
dle-terminalreporter.patch&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;956ea028ec30dbbfb680dd8e7b4a7fb8f80a2395=
95e88bace018bf2c0d718248&quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi setuptools3<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot; \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pytest-runner_6.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest=
-runner_6.0.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-pytest-runner_6.0.1.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-pytest-runner_6.0.1.bb</a><br>
index dd3a8d0234..31dce85176 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
runner_6.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-runner=
_6.0.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
runner_6.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-runner=
_6.0.1.bb</a><br>
@@ -9,6 +9,8 @@ SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Not-use-functions-fro=
m-pkg_resources-any-more.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
<br>
=C2=A0DEPENDS +=3D &quot; \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pytest-sugar_1.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-=
sugar_1.1.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://=
python3-pytest-sugar_1.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-pytest-sugar_1.1.1.bb</a><br>
index 22eb3d52ff..765a869e64 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
sugar_1.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-sugar_1=
.1.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
sugar_1.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-sugar_1=
.1.1.bb</a><br>
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3De485b36215d=
1a038821b3e51bd189197&quot;<br>
=C2=A0SRC_URI +=3D &quot;file://run-ptest&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;73b8b65163ebf10f9f671efab9eed3d56f20d2ca=
68bda83fa64740a92c08f65d&quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi python_poetry_core ptest-python-pytest<br>
<br>
=C2=A0DEPENDS +=3D &quot;python3-wheel-native&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pytest-tempdir_2019.10.12.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
pytest-tempdir_2019.10.12.bb</a> b/meta-python/recipes-devtools/python/<a h=
ref=3D"http://python3-pytest-tempdir_2019.10.12.bb" rel=3D"noreferrer" targ=
et=3D"_blank">python3-pytest-tempdir_2019.10.12.bb</a><br>
index b161b016bc..104c658317 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
tempdir_2019.10.12.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-=
tempdir_2019.10.12.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
tempdir_2019.10.12.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-=
tempdir_2019.10.12.bb</a><br>
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D &quot;file://PKG-INFO;md5=3D9872c3a37c=
c9baf79a464cd168282be5&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;e7d91813a9aa991db87dacdef8cfd3f1657632d7=
31d56d06238c5ffb63ab36d8&quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi setuptools3<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot; \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
rapidjson_1.19.bb" rel=3D"noreferrer" target=3D"_blank">python3-rapidjson_1=
.19.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
rapidjson_1.19.bb" rel=3D"noreferrer" target=3D"_blank">python3-rapidjson_1=
.19.bb</a><br>
index 761676d2ce..48e8ff31e5 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-rapidjs=
on_1.19.bb" rel=3D"noreferrer" target=3D"_blank">python3-rapidjson_1.19.bb<=
/a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-rapidjs=
on_1.19.bb" rel=3D"noreferrer" target=3D"_blank">python3-rapidjson_1.19.bb<=
/a><br>
@@ -10,6 +10,7 @@ SRC_URI[sha256sum] =3D &quot;81e7260f6297cad564389b700783=
c0a33de71310b9eb01fd013faec5e7<br>
=C2=A0inherit setuptools3 pypi ptest-python-pytest<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;python-rapidjson&quot;<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0SETUPTOOLS_BUILD_ARGS +=3D &quot; --rj-include-dir=3D${RECIPE_SYSROOT=
}${includedir}&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
requests-ftp_0.3.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-request=
s-ftp_0.3.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://=
python3-requests-ftp_0.3.1.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-requests-ftp_0.3.1.bb</a><br>
index db7c5fee0b..5acb7d73fd 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-request=
s-ftp_0.3.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-requests-ftp_0=
.3.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-request=
s-ftp_0.3.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-requests-ftp_0=
.3.1.bb</a><br>
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D6683a23c996=
8b97709441dc884d46df6&quot;<br>
=C2=A0SRC_URI +=3D &quot;file://0001-Remove-use-of-the-cgi-module.patch&quo=
t;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;7504ceb5cba8a5c0135ed738596820a78c5f2be9=
2d79b29f96ba99b183d8057a&quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi setuptools3<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot; \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
requests-mock_1.12.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-reque=
sts-mock_1.12.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-requests-mock_1.12.1.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-requests-mock_1.12.1.bb</a><br>
index 248526b00b..8cfc05a713 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-request=
s-mock_1.12.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-requests-moc=
k_1.12.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-request=
s-mock_1.12.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-requests-moc=
k_1.12.1.bb</a><br>
@@ -6,4 +6,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D3b2eea41aec=
0f2973a45e1e45f28aa32&quot;<br>
=C2=A0DEPENDS =3D &quot;python3-setuptools-scm-native&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;e9e12e333b525156e82a3c852f22016b9158220d=
2f47454de9cae8a77d371401&quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
requests-oauthlib_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-re=
quests-oauthlib_2.0.0.bb</a> b/meta-python/recipes-devtools/python/<a href=
=3D"http://python3-requests-oauthlib_2.0.0.bb" rel=3D"noreferrer" target=3D=
"_blank">python3-requests-oauthlib_2.0.0.bb</a><br>
index 71cafb513d..5fa86e35e5 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-request=
s-oauthlib_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-requests-=
oauthlib_2.0.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-request=
s-oauthlib_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-requests-=
oauthlib_2.0.0.bb</a><br>
@@ -3,6 +3,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D22d117a849d=
f10d047ed9b792838e863&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;b3dffaebd884d8cd778494369603a9e7b58d2911=
1bf6b41bdc2dcd87203af4e9&quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi setuptools3<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;python3-requests python3-oauthlib&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
robotframework-seriallibrary_0.4.3.bb" rel=3D"noreferrer" target=3D"_blank"=
>python3-robotframework-seriallibrary_0.4.3.bb</a> b/meta-python/recipes-de=
vtools/python/<a href=3D"http://python3-robotframework-seriallibrary_0.4.3.=
bb" rel=3D"noreferrer" target=3D"_blank">python3-robotframework-seriallibra=
ry_0.4.3.bb</a><br>
index 4a8fcde41b..6de6537021 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-robotfr=
amework-seriallibrary_0.4.3.bb" rel=3D"noreferrer" target=3D"_blank">python=
3-robotframework-seriallibrary_0.4.3.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-robotfr=
amework-seriallibrary_0.4.3.bb" rel=3D"noreferrer" target=3D"_blank">python=
3-robotframework-seriallibrary_0.4.3.bb</a><br>
@@ -7,6 +7,8 @@ SRC_URI +=3D &quot;file://0001-pyproject.toml-Replace-insta=
ll_requires.patch&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;f20befe5c1106dd8ddca9f60a2f18bf5ec7d5f06=
f6f09a03fa66bae54777e6bb&quot;<br>
<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi python_poetry_core<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot; \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
setuptools-declarative-requirements_1.3.0.bb" rel=3D"noreferrer" target=3D"=
_blank">python3-setuptools-declarative-requirements_1.3.0.bb</a> b/meta-pyt=
hon/recipes-devtools/python/<a href=3D"http://python3-setuptools-declarativ=
e-requirements_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-setup=
tools-declarative-requirements_1.3.0.bb</a><br>
index 44a51b42fb..525eb6a6ed 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-setupto=
ols-declarative-requirements_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank"=
>python3-setuptools-declarative-requirements_1.3.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-setupto=
ols-declarative-requirements_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank"=
>python3-setuptools-declarative-requirements_1.3.0.bb</a><br>
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D86d3f3a95c3=
24c9479bd8986968f4327&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;57a5b9bb9ad350c278e8aa6be4cdebbcd925b9ba=
71d6a712a178a618cfb898f7&quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
<br>
=C2=A0DEPENDS +=3D &quot;python3-wheel-native&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
snappy_0.6.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-snappy_0.6.1.=
bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-snap=
py_0.6.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-snappy_0.6.1.bb</=
a><br>
index bd0979d0b4..e7a05ca7b7 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-snappy_=
0.6.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-snappy_0.6.1.bb</a><=
br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-snappy_=
0.6.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-snappy_0.6.1.bb</a><=
br>
@@ -9,5 +9,6 @@ SRC_URI[sha256sum] =3D &quot;b6a107ab06206acc5359d4c5632bd9=
b22d448702a79b3169b0c62e0fb8<br>
=C2=A0inherit pypi setuptools3<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;python-snappy&quot;<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;snappy&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
speedtest-cli_2.1.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-speedt=
est-cli_2.1.3.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-speedtest-cli_2.1.3.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-speedtest-cli_2.1.3.bb</a><br>
index 472113b059..faf481690d 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-speedte=
st-cli_2.1.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-speedtest-cli=
_2.1.3.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-speedte=
st-cli_2.1.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-speedtest-cli=
_2.1.3.bb</a><br>
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D3b83ef96387=
f14655fc854ddc3c6bd57&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;5e2773233cedb5fa3d8120eb7f97bcc4974b5221=
b254d33ff16e2f1d413d90f0&quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi setuptools3<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot; \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
systemd_235.bb" rel=3D"noreferrer" target=3D"_blank">python3-systemd_235.bb=
</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-system=
d_235.bb" rel=3D"noreferrer" target=3D"_blank">python3-systemd_235.bb</a><b=
r>
index 269e175cc5..58dbf02c6d 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-systemd=
_235.bb" rel=3D"noreferrer" target=3D"_blank">python3-systemd_235.bb</a><br=
>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-systemd=
_235.bb" rel=3D"noreferrer" target=3D"_blank">python3-systemd_235.bb</a><br=
>
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D4fbd653=
80cdd255951079008b364516c&quot;<br>
<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;systemd-python&quot;<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
=C2=A0SRC_URI:append:libc-musl =3D &quot; file://0001-Provide-implementatio=
n-of-strndupa-for-musl.patch&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;4e57f39797fd5d9e2d22b8806a252d7c0106c936=
039d1e71c8c6b8008e695c0a&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
trafaret-config_2.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-traf=
aret-config_2.0.2.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"h=
ttp://python3-trafaret-config_2.0.2.bb" rel=3D"noreferrer" target=3D"_blank=
">python3-trafaret-config_2.0.2.bb</a><br>
index d7a987aa3b..19de00961c 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-trafare=
t-config_2.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-trafaret-co=
nfig_2.0.2.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-trafare=
t-config_2.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-trafaret-co=
nfig_2.0.2.bb</a><br>
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D &quot;file://README.rst;beginline=3D98=
;endline=3D106;md5=3Da15308789c3b7<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;440b6b49e5e975f9a640a2519abb2feddd96eb2a=
eb1715f87f947a7a079f20be&quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi setuptools3<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot; \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
types-python-dateutil_2.9.0.20241003.bb" rel=3D"noreferrer" target=3D"_blan=
k">python3-types-python-dateutil_2.9.0.20241003.bb</a> b/meta-python/recipe=
s-devtools/python/<a href=3D"http://python3-types-python-dateutil_2.9.0.202=
41003.bb" rel=3D"noreferrer" target=3D"_blank">python3-types-python-dateuti=
l_2.9.0.20241003.bb</a><br>
index 09d919dd82..db856b42a2 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-types-p=
ython-dateutil_2.9.0.20241003.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-types-python-dateutil_2.9.0.20241003.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-types-p=
ython-dateutil_2.9.0.20241003.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-types-python-dateutil_2.9.0.20241003.bb</a><br>
@@ -5,4 +5,6 @@ LIC_FILES_CHKSUM =3D &quot;file://PKG-INFO;beginline=3D6;en=
dline=3D6;md5=3Dc2d9643b4523fdf462<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;58cb85449b2a56d6684e41aeefb4c4280631246a=
0da1a719bdbe6f3fb0317446&quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi setuptools3<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
types-setuptools_75.5.0.20241120.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-types-setuptools_75.5.0.20241120.bb</a> b/meta-python/recipes-devtoo=
ls/python/<a href=3D"http://python3-types-setuptools_75.5.0.20241120.bb" re=
l=3D"noreferrer" target=3D"_blank">python3-types-setuptools_75.5.0.20241120=
.bb</a><br>
index b9f35406bd..73c6f64e0b 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-types-s=
etuptools_75.5.0.20241120.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
types-setuptools_75.5.0.20241120.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-types-s=
etuptools_75.5.0.20241120.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
types-setuptools_75.5.0.20241120.bb</a><br>
@@ -3,6 +3,8 @@ HOMEPAGE =3D &quot;<a href=3D"https://github.com/python/typ=
eshed" rel=3D"noreferrer" target=3D"_blank">https://github.com/python/types=
hed</a>&quot;<br>
=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://PKG-INFO;beginline=3D6;endline=3D6;=
md5=3Dc2d9643b4523fdf462545aeb1356ad23&quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi setuptools3<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;d3c7e95b0598bf87fede29b3b57b19f5cdcd62a8=
5b9298a7b30f8343f6f21c4f&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
u-msgpack-python_2.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-u-m=
sgpack-python_2.8.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D=
"http://python3-u-msgpack-python_2.8.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">python3-u-msgpack-python_2.8.0.bb</a><br>
index e95e4bbfb0..cb6da2e78d 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-u-msgpa=
ck-python_2.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-u-msgpack-=
python_2.8.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-u-msgpa=
ck-python_2.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-u-msgpack-=
python_2.8.0.bb</a><br>
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D17df1135354=
5c53a2df0ce7655859306&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;b801a83d6ed75e6df41e44518b4f2a9c221dc2da=
4bcd5380e3a0feda520bc61a&quot;<br>
<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
+<br>
=C2=A0inherit pypi setuptools3 ptest-python-pytest<br>
<br>
=C2=A0do_install_ptest:append() {<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
uinput_1.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-uinput_1.0.1.=
bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-uinp=
ut_1.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-uinput_1.0.1.bb</=
a><br>
index f63cbf22fc..7fa6db560a 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-uinput_=
1.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-uinput_1.0.1.bb</a><=
br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-uinput_=
1.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-uinput_1.0.1.bb</a><=
br>
@@ -7,6 +7,7 @@ SRC_URI +=3D &quot;file://0001-Deal-with-64bit-time_t-defau=
lt-on-32bit-architecture.pat<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;853697344b64df5537d4ae32ba6fbcf0515d51a9=
010910f5d5019959038b6eba&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;python-uinput&quot;<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi python_setuptools_build_meta ptest-python-pytest<br>
<br>
-- <br>
2.56.0<br>
<br>
<br>
<br>
<br>
</blockquote></div>
</blockquote></div>

--0000000000004e3f47065d715dda--

