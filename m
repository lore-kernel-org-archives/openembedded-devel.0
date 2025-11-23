Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C12ACFC26D
	for <webhook@archiver.kernel.org>; Sun, 23 Nov 2025 08:09:27 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10374.1763885358155040995
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Nov 2025 00:09:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m6Ydz1Ze;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-787e84ceaf7so33833237b3.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Nov 2025 00:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763885357; x=1764490157; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MyH3PUaMG0v5G17gqJlA26/89lLfod5byKWNzUMyBY0=;
        b=m6Ydz1Ze6gyenJzsH8iPjA6m1d3nqNcLyuXpBKB9Rt9tzGmu+951NtsMjKVnOkXIB5
         kiy8Ui6W8OYTxlcT8PSwYYeEEdqO+OkP1VWD9dAVOrEdwvNu0YkjylSQBRDQR9WEov/r
         kKV4TgGAej1yl/OlfIx+iZWD7mBLnvOUlf/7qQ6/lIaDX+GunmlCR9ieMXJOyZXbwFNG
         OqNh2ZRcaRk/PoB0SCtJUVzRbPvP2nZkShg9LwUasR3WJDNp49kblnD9swANk3YefHFG
         evrBu6BVgydYIrxfM+9T95Fo6Ys57gfj4Ppv2AwpUoLQpr8XyN/9gl6tlPbSNBM2IiGL
         fUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763885357; x=1764490157;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MyH3PUaMG0v5G17gqJlA26/89lLfod5byKWNzUMyBY0=;
        b=Q0MJGtYxIupTtFguzJ6gwklU0bb92tTATL8PhIk74PTS0hPtwSgP7VrwGYCeFzMJJw
         qqk1uUPZY9Vgqyl/btvslSSeJw9z3XgMpehFw3dtqITQg8FX0LqI+YeSQtnNxS8VVYm3
         ciK+95HX1ujmTciorHUVpR/ijvYp/i96Uy0qMar3HIgaflPboH9s3QWzhRBnEk8fNAwE
         AewbfyLmfEwNb4TYqCxyBIdFpy+SZj39jmZ4rPoPlU7TmzJdGvEBLSlWsNhgdqDuYOne
         ajuy76STXbAYaU+4V27l0pr+eqijGbRqXf8aVfjUgY21p6NsMT5mlnPS6Lbvx4VQmMwY
         WRMA==
X-Gm-Message-State: AOJu0YwxnibXXDbCfmzo2axoDd6gMmw/CGJkKCVEtxawr48D+gEnp5A9
	LuYE7H2LbEPBuj77qpxtA/EwC1Xvzst58fuBhA4qkQ+8MuoWAgbaxIFMdq1WOPshfjKNsUftepi
	pc5kKUuvIej1nFapiWHXKz6s6SwJAiO4=
X-Gm-Gg: ASbGncuVKvmGEai2sJ8z8fHEgZ8fED/3KReUQSeYGk4ArZVIIJ5n3COUrNXE2KOIUer
	ihL6faQSs6YCbp0Ik6elsHzwakmTExAMR8O4xlGPHw76dcgk3B9oZACkaEQfngfqwjFbpLsP1hW
	WmFU/j8zlpxIwddTG/3y4aTOkRDgOC8FT7Z59xpArjvFLoGvhqbJCmxDGtnbH453rSOjfMkQTif
	YwcZzFRYdyEuhHu2sNjAtxERGfOSoMbmMcr6aJ99BOqDRlRydeSxhxzCIC1osdrSN70Fi1XE87g
	Y0PNukwTVvCXiZRQz8tECoJZdhlaDd6xYGyNCZ7D/ZWI1bBGmrz9ZYZ025NyQHTnK9UgZbRwQk0
	XPunwa4KpECWnv2DqJpscep6FW9dQmLEDm9k3vEfO4ZKQyg==
X-Google-Smtp-Source: AGHT+IGrvEUuymFp8tw5OL0KhII4V7vpccb0HBJAD6+OMMCOLAnkLLalvYMPDz7Q3Yn3mOOowEO8IC2hOIXCwciXcGA=
X-Received: by 2002:a05:690c:905:b0:786:5ebb:4837 with SMTP id
 00721157ae682-78a8b50c0f9mr77179647b3.33.1763885357174; Sun, 23 Nov 2025
 00:09:17 -0800 (PST)
MIME-Version: 1.0
References: <20251122132159.1774324-2-t.f.g.geelen@gmail.com> <20251122132159.1774324-4-t.f.g.geelen@gmail.com>
In-Reply-To: <20251122132159.1774324-4-t.f.g.geelen@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 23 Nov 2025 00:08:50 -0800
X-Gm-Features: AWmQ_bmmp441Fvwjnm21f_5bfWiSasxnTClWd52foAmzV7Vu-7h3UVrBC_eRyS0
Message-ID: <CAMKF1spiWnS9HC1D9O7v0d0+t6vKc3wABv3Sv69MxC+JSCnRVg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 3/5] new recipe: python3-pytest-retry
To: t.f.g.geelen@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000023941206443e902c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Nov 2025 08:09:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121990

--00000000000023941206443e902c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ptests are failing for qemuarm64

{'python3-pytest-retry':
['tests/test_retry_plugin.py:test_no_retry_on_pass',

'tests/test_retry_plugin.py:test_no_retry_on_fail_without_plugin',

'tests/test_retry_plugin.py:test_no_retry_on_skip_mark',

'tests/test_retry_plugin.py:test_no_retry_on_skip_call',

'tests/test_retry_plugin.py:test_no_retry_on_xfail_mark',

'tests/test_retry_plugin.py:test_no_retry_on_xpass',

'tests/test_retry_plugin.py:test_no_retry_on_strict_xpass',

'tests/test_retry_plugin.py:test_retry_fails_after_consistent_setup_failure=
',

'tests/test_retry_plugin.py:test_retry_exits_immediately_on_teardown_failur=
e',

'tests/test_retry_plugin.py:test_retry_fails_after_consistent_test_failure'=
,

'tests/test_retry_plugin.py:test_retry_passes_after_temporary_test_failure'=
,

'tests/test_retry_plugin.py:test_custom_retry_outcome_for_reporting_compati=
bility',

'tests/test_retry_plugin.py:test_retry_passes_after_temporary_test_failure_=
with_flaky_mark',

'tests/test_retry_plugin.py:test_retries_if_flaky_mark_is_applied_without_o=
ptions',

'tests/test_retry_plugin.py:test_fixtures_are_retried_with_test',

'tests/test_retry_plugin.py:test_retry_executes_class_scoped_fixture',

'tests/test_retry_plugin.py:test_retry_executes_module_scoped_fixture',

'tests/test_retry_plugin.py:test_retry_fails_if_temporary_failures_exceed_r=
etry_limit',

'tests/test_retry_plugin.py:test_retry_delay_from_mark_between_attempts',

'tests/test_retry_plugin.py:test_retry_delay_from_command_line_between_atte=
mpts',

'tests/test_retry_plugin.py:test_passing_outcome_is_available_from_item_sta=
sh',

'tests/test_retry_plugin.py:test_failed_outcome_is_available_from_item_stas=
h',

'tests/test_retry_plugin.py:test_skipped_outcome_is_available_from_item_sta=
sh',

'tests/test_retry_plugin.py:test_duration_is_available_from_item_stash',

'tests/test_retry_plugin.py:test_failed_outcome_after_successful_teardown',

'tests/test_retry_plugin.py:test_failed_outcome_after_unsuccessful_setup',

'tests/test_retry_plugin.py:test_failed_outcome_after_unsuccessful_teardown=
',

'tests/test_retry_plugin.py:test_attempts_are_always_available_from_item_st=
ash',

'tests/test_retry_plugin.py:test_global_filtered_exception_is_retried',

'tests/test_retry_plugin.py:test_temporary_filtered_exception_fails_when_at=
tempts_exceeded',

'tests/test_retry_plugin.py:test_temporary_exception_is_not_retried_if_filt=
er_not_matched',

'tests/test_retry_plugin.py:test_temporary_exception_is_retried_if_not_glob=
ally_excluded',

'tests/test_retry_plugin.py:test_temporary_exception_fails_if_not_excluded_=
and_attempts_exceeded',

'tests/test_retry_plugin.py:test_temporary_exception_is_not_retried_if_excl=
uded',

'tests/test_retry_plugin.py:test_flaky_mark_exception_filter_param_override=
s_global_filter',

'tests/test_retry_plugin.py:test_attempt_count_is_correct',

'tests/test_retry_plugin.py:test_flaky_mark_overrides_command_line_options'=
,

'tests/test_retry_plugin.py:test_configuration_by_ini_file',

'tests/test_retry_plugin.py:test_configuration_by_pyproject_toml_file',

'tests/test_retry_plugin.py:test_duration_in_overwrite_timings_mode',

'tests/test_retry_plugin.py:test_duration_in_cumulative_timings_mode',

'tests/test_retry_plugin.py:test_conditional_flaky_marks_evaluate_correctly=
',

'tests/test_retry_plugin.py:test_stack_trace_depth_uses_verbosity_count[vv]=
',

'tests/test_retry_plugin.py:test_stack_trace_depth_uses_verbosity_count[vvv=
]',

'tests/test_retry_plugin.py:test_stack_trace_depth_uses_verbosity_count[vvv=
v]']}

On Sat, Nov 22, 2025 at 5:22=E2=80=AFAM Tom Geelen via lists.openembedded.o=
rg
<t.f.g.geelen=3Dgmail.com@lists.openembedded.org> wrote:

> Description: Adds the ability to retry flaky tests in CI environments
> Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
> ---
>  .../include/ptest-packagelists-meta-python.inc   |  1 +
>  .../packagegroups/packagegroup-meta-python.bb    |  1 +
>  .../python/python3-pytest-retry_1.7.0.bb         | 16 ++++++++++++++++
>  3 files changed, 18 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-pytest-retry_1.7.0.bb
>
> diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> index 1cb419a721..d2794d5df1 100644
> --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> @@ -77,6 +77,7 @@ PTESTS_FAST_META_PYTHON =3D "\
>      python3-pytest-httpx \
>      python3-pytest-mock \
>      python3-pytest-picked \
> +    python3-pytest-retry \
>      python3-pytest-sugar \
>      python3-pytoml \
>      python3-pyyaml-include \
> diff --git a/meta-python/recipes-core/packagegroups/
> packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/
> packagegroup-meta-python.bb
> index d3abc0761f..dfc35f946f 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -352,6 +352,7 @@ RDEPENDS:packagegroup-meta-python3 =3D "\
>      python3-pytest-lazy-fixtures \
>      python3-pytest-metadata \
>      python3-pytest-picked\
> +    python3-pytest-retry \
>      python3-pytest-tempdir \
>      python3-pytest-timeout \
>      python3-pytest-xdist \
> diff --git a/meta-python/recipes-devtools/python/
> python3-pytest-retry_1.7.0.bb b/meta-python/recipes-devtools/python/
> python3-pytest-retry_1.7.0.bb
> new file mode 100644
> index 0000000000..e92122aa63
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pytest-retry_1.7.0.bb
> @@ -0,0 +1,16 @@
> +SUMMARY =3D "Adds the ability to retry flaky tests in CI environments"
> +HOMEPAGE =3D "https://github.com/str0zzapreti/pytest-retry"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc25bd3d1db774af27b10acd6f80bf=
939"
> +RECIPE_MAINTAINER =3D "Tom Geelen <t.f.g.geelen@gmail.com>"
> +
> +SRC_URI[sha256sum] =3D
> "f8d52339f01e949df47c11ba9ee8d5b362f5824dff580d3870ec9ae0057df80f"
> +
> +inherit pypi python_setuptools_build_meta ptest-python-pytest
> +
> +RDEPENDS:${PN} +=3D "\
> +    python3-pytest (>=3D7.0.0) \
> +"
> +
> +PYPI_PACKAGE =3D "pytest_retry"
> +UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121975):
> https://lists.openembedded.org/g/openembedded-devel/message/121975
> Mute This Topic: https://lists.openembedded.org/mt/116422739/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000023941206443e902c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ptests are failing for qemuarm64<div><br></div><div>{&#39;=
python3-pytest-retry&#39;: [&#39;tests/test_retry_plugin.py:test_no_retry_o=
n_pass&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tests/test_retry_plugin.py:test_no_ret=
ry_on_fail_without_plugin&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tests/test_retry_=
plugin.py:test_no_retry_on_skip_mark&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tests/t=
est_retry_plugin.py:test_no_retry_on_skip_call&#39;,<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
#39;tests/test_retry_plugin.py:test_no_retry_on_xfail_mark&#39;,<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;tests/test_retry_plugin.py:test_no_retry_on_xpass&#39;,<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;tests/test_retry_plugin.py:test_no_retry_on_strict_x=
pass&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tests/test_retry_plugin.py:test_retry_=
fails_after_consistent_setup_failure&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tests/t=
est_retry_plugin.py:test_retry_exits_immediately_on_teardown_failure&#39;,<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;tests/test_retry_plugin.py:test_retry_fails_after=
_consistent_test_failure&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tests/test_retry_plu=
gin.py:test_retry_passes_after_temporary_test_failure&#39;,<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &#39;tests/test_retry_plugin.py:test_custom_retry_outcome_for_report=
ing_compatibility&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tests/test_retry_plugin.py:=
test_retry_passes_after_temporary_test_failure_with_flaky_mark&#39;,<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &#39;tests/test_retry_plugin.py:test_retries_if_flaky_mark_is=
_applied_without_options&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tests/test_retry_plu=
gin.py:test_fixtures_are_retried_with_test&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;=
tests/test_retry_plugin.py:test_retry_executes_class_scoped_fixture&#39;,<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;tests/test_retry_plugin.py:test_retry_executes_modul=
e_scoped_fixture&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tests/test_retry_plugin.py:t=
est_retry_fails_if_temporary_failures_exceed_retry_limit&#39;,<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;tests/test_retry_plugin.py:test_retry_delay_from_mark_betwe=
en_attempts&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tests/test_retry_plugin.py:test=
_retry_delay_from_command_line_between_attempts&#39;,<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
#39;tests/test_retry_plugin.py:test_passing_outcome_is_available_from_item_=
stash&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tests/test_retry_plugin.py:test_failed=
_outcome_is_available_from_item_stash&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tests/t=
est_retry_plugin.py:test_skipped_outcome_is_available_from_item_stash&#39;,=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;tests/test_retry_plugin.py:test_duration_is_avail=
able_from_item_stash&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tests/test_retry_plugin.=
py:test_failed_outcome_after_successful_teardown&#39;,<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
#39;tests/test_retry_plugin.py:test_failed_outcome_after_unsuccessful_setup=
&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tests/test_retry_plugin.py:test_failed_out=
come_after_unsuccessful_teardown&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tests/test=
_retry_plugin.py:test_attempts_are_always_available_from_item_stash&#39;,<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;tests/test_retry_plugin.py:test_global_filtered_exce=
ption_is_retried&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tests/test_retry_plugin.py:t=
est_temporary_filtered_exception_fails_when_attempts_exceeded&#39;,<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &#39;tests/test_retry_plugin.py:test_temporary_exception_is_n=
ot_retried_if_filter_not_matched&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tests/test=
_retry_plugin.py:test_temporary_exception_is_retried_if_not_globally_exclud=
ed&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tests/test_retry_plugin.py:test_temporary_=
exception_fails_if_not_excluded_and_attempts_exceeded&#39;,<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &#39;tests/test_retry_plugin.py:test_temporary_exception_is_not_retr=
ied_if_excluded&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tests/test_retry_plugin.py:t=
est_flaky_mark_exception_filter_param_overrides_global_filter&#39;,<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &#39;tests/test_retry_plugin.py:test_attempt_count_is_correct=
&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tests/test_retry_plugin.py:test_flaky_mark=
_overrides_command_line_options&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tests/test_re=
try_plugin.py:test_configuration_by_ini_file&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;=
tests/test_retry_plugin.py:test_configuration_by_pyproject_toml_file&#39;,<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;tests/test_retry_plugin.py:test_duration_in_overw=
rite_timings_mode&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tests/test_retry_plugin.py:=
test_duration_in_cumulative_timings_mode&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tes=
ts/test_retry_plugin.py:test_conditional_flaky_marks_evaluate_correctly&#39=
;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &#39;tests/test_retry_plugin.py:test_stack_trace_dept=
h_uses_verbosity_count[vv]&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tests/test_retry_=
plugin.py:test_stack_trace_depth_uses_verbosity_count[vvv]&#39;,<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;tests/test_retry_plugin.py:test_stack_trace_depth_uses_verb=
osity_count[vvvv]&#39;]}<br></div></div><br><div class=3D"gmail_quote gmail=
_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Nov 22, 202=
5 at 5:22=E2=80=AFAM Tom Geelen via <a href=3D"http://lists.openembedded.or=
g">lists.openembedded.org</a> &lt;t.f.g.geelen=3D<a href=3D"mailto:gmail.co=
m@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Description: Adds=
 the ability to retry flaky tests in CI environments<br>
Signed-off-by: Tom Geelen &lt;<a href=3D"mailto:t.f.g.geelen@gmail.com" tar=
get=3D"_blank">t.f.g.geelen@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../include/ptest-packagelists-meta-python.inc=C2=A0 =C2=A0|=C2=A0 1 =
+<br>
=C2=A0.../packagegroups/<a href=3D"http://packagegroup-meta-python.bb" rel=
=3D"noreferrer" target=3D"_blank">packagegroup-meta-python.bb</a>=C2=A0 =C2=
=A0 |=C2=A0 1 +<br>
=C2=A0.../python/<a href=3D"http://python3-pytest-retry_1.7.0.bb" rel=3D"no=
referrer" target=3D"_blank">python3-pytest-retry_1.7.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 16 ++++++++++++++++<br>
=C2=A03 files changed, 18 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-pytest-retry_1.7.0.bb" rel=3D"noreferrer" target=3D"_blank">pyt=
hon3-pytest-retry_1.7.0.bb</a><br>
<br>
diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/=
meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
index 1cb419a721..d2794d5df1 100644<br>
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
@@ -77,6 +77,7 @@ PTESTS_FAST_META_PYTHON =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-pytest-httpx \<br>
=C2=A0 =C2=A0 =C2=A0python3-pytest-mock \<br>
=C2=A0 =C2=A0 =C2=A0python3-pytest-picked \<br>
+=C2=A0 =C2=A0 python3-pytest-retry \<br>
=C2=A0 =C2=A0 =C2=A0python3-pytest-sugar \<br>
=C2=A0 =C2=A0 =C2=A0python3-pytoml \<br>
=C2=A0 =C2=A0 =C2=A0python3-pyyaml-include \<br>
diff --git a/meta-python/recipes-core/packagegroups/<a href=3D"http://packa=
gegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-m=
eta-python.bb</a> b/meta-python/recipes-core/packagegroups/<a href=3D"http:=
//packagegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">package=
group-meta-python.bb</a><br>
index d3abc0761f..dfc35f946f 100644<br>
--- a/meta-python/recipes-core/packagegroups/<a href=3D"http://packagegroup=
-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-pyt=
hon.bb</a><br>
+++ b/meta-python/recipes-core/packagegroups/<a href=3D"http://packagegroup=
-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-pyt=
hon.bb</a><br>
@@ -352,6 +352,7 @@ RDEPENDS:packagegroup-meta-python3 =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-pytest-lazy-fixtures \<br>
=C2=A0 =C2=A0 =C2=A0python3-pytest-metadata \<br>
=C2=A0 =C2=A0 =C2=A0python3-pytest-picked\<br>
+=C2=A0 =C2=A0 python3-pytest-retry \<br>
=C2=A0 =C2=A0 =C2=A0python3-pytest-tempdir \<br>
=C2=A0 =C2=A0 =C2=A0python3-pytest-timeout \<br>
=C2=A0 =C2=A0 =C2=A0python3-pytest-xdist \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pytest-retry_1.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-=
retry_1.7.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://=
python3-pytest-retry_1.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-pytest-retry_1.7.0.bb</a><br>
new file mode 100644<br>
index 0000000000..e92122aa63<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
retry_1.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-retry_1=
.7.0.bb</a><br>
@@ -0,0 +1,16 @@<br>
+SUMMARY =3D &quot;Adds the ability to retry flaky tests in CI environments=
&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/str0zzapreti/pytest-retry=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/str0zzapreti/pyte=
st-retry</a>&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dc25bd3d1db774af27b10acd6f8=
0bf939&quot;<br>
+RECIPE_MAINTAINER =3D &quot;Tom Geelen &lt;<a href=3D"mailto:t.f.g.geelen@=
gmail.com" target=3D"_blank">t.f.g.geelen@gmail.com</a>&gt;&quot;<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;f8d52339f01e949df47c11ba9ee8d5b362f5824dff580=
d3870ec9ae0057df80f&quot;<br>
+<br>
+inherit pypi python_setuptools_build_meta ptest-python-pytest<br>
+<br>
+RDEPENDS:${PN} +=3D &quot;\<br>
+=C2=A0 =C2=A0 python3-pytest (&gt;=3D7.0.0) \<br>
+&quot;<br>
+<br>
+PYPI_PACKAGE =3D &quot;pytest_retry&quot;<br>
+UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#121975): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/121975" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/121975</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116422739/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116422739/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000023941206443e902c--

