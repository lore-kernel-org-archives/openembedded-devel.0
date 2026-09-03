Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E68AC61DD3
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 20:25:51 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.346.1788467148225241823
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 13:25:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=O4w5gIuZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8588583a7c3so3778047b3.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 13:25:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788467147; cv=none;
        d=google.com; s=arc-20260327;
        b=CP5L+HCtUdPk6yApJwq9UU4u2L1vD4tm8MQkK+RwGoZuzpX5AwP/fkSlOZsymgxKky
         euJTKOU9Ieuy1hn12oe60OoWel7lRF+O4Zu0NtXFUpPWwRnCwF1/2KgwqaS/oh4beZoH
         YCew50g73qkg8LEupdOFdGvbjD5tjHinYMQ0z76Cfqcaohh8zeEKatFqsUpe6jn2Y0NN
         WWyoWXyWQn7LCI6ptIRl8fDzNUs7FQiFc0uayMjyghAri6jHdmamIqykeHKo1VjYkb5D
         YfB3MCCJRZkGLemm2zZ/3O28RSHyBuqnL8baBxqwCaQj2Ddc7wTb07KtsztYIMVSQ09A
         0wLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OdCXZkdi8It0a9ouqFjA5WzrfnDI7+8VaowebZ2bS+c=;
        fh=XOI6TtVZPT4M4+St2buSvvvpyffvGrE/xpgLSZrQNok=;
        b=cBmbXLaILEzzVzkZJTa+gu644QZgrfxb6brhkutj+7OStgfclG4b0VBbz85uRZXGDj
         4cSC4Q8mY9OBq3v61EkR6VwD8xGRF3QEWwpwFq13ftMNVEm7UgBqWjo5LWbyX6pqMCYp
         x0gZepDjswIrO/5Er3E8tRvmEqoY8aPaah9+a5nsbskvCUGioTaNN0mbo0ShOPofLnFk
         YDxc5BtnKe4Cc/nJPeyXsk99EV987qilp/H/QRH1oPc42pyDq5UpRzNGZ+5nbutydPOW
         iEsXigt+XjJTWVAaT+kHo16uf5UaqHGdronpmWBCf1oWzki1llk4HiMV0DsWmo3QIXG/
         lMyw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788467147; x=1789071947; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OdCXZkdi8It0a9ouqFjA5WzrfnDI7+8VaowebZ2bS+c=;
        b=O4w5gIuZYe2fA5uvUbST4DfzQnsyYhe5Hw0RFXyxKxGSdyPpNyI41bl1dMGKAwFz5i
         NfFjhUw7dtiAyMhO30PN1fCWy5SiGbH0XXdL4LIDlcPThCChX7XjXdPwbO7M5vbgAaO4
         Th5Yz0uqRj7ZtXvVu768LGEPD81f8Ht79KFWdM5zEe95l2Mao+4WoIGyrpofV2VwQONP
         P3EbbA8kSxJ48cHieaVALflE7phG4H16GldvfIoSrguA3gY1MoaF+MTngCdgS7ZHpdiI
         tZUwW46oeQcr9usBqVf5caTIKPnXZ0AeePzXFpNYZ+HKtMzGgtLS7QY3d7HQsMxSmA7a
         xg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788467147; x=1789071947;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OdCXZkdi8It0a9ouqFjA5WzrfnDI7+8VaowebZ2bS+c=;
        b=S42WB4Ozpwui9gXI1Br4EcC1Do7MSdPo8OuPAfF8Xlk6C4fjH6oFN8YqfxPVYuw+LB
         PQDpQJLwGgV+B3E6QyruVKavxfk6sy7FrWEiMeQpsW+FL0eAh+ygTtOqdCvefCFYrQbg
         Ev5448ZSv8BQa2riCkaTuRwjM8HO/fquan8c7ThHlL0bTWSRVjPv/jyZhPZpm4rEsflR
         zZ0W0grHd86EB5uizsY4q54TMuaWYi8ul6TPwpbgJ7MWkB3ZA162BUErCYMUFeRu8ued
         ym0Z4BvWXjlGDFauBpbOKKpvxkAu/4Dan1bgqHtZ+h1+eF3hQpIvUdAZTZ66wsnkO9w1
         rakA==
X-Gm-Message-State: AFuF++n6lqE0QUGWJfGJk51bogcsAgANyfBPVBHCmy9WKV7kEUnjUf6J
	0Fp7wbLYIAGjDHlk4vwcaUR3nsCAuiQtvPexf9VQu+qwQ7ajlyrmExhCv99mK6D4WNnWMZainsK
	uvOwmwAlt9LvnyPfblWAzarDTAjdt16is3w==
X-Gm-Gg: AYBFou1wA4evghb2bZbDQzNbOC6hWX0IQJXOWerKwEbU2MDe5SZxSGKR9Vr+uxwJDJJ
	zKzcAt7ue3+0deBxpO9alQN121H6/Hq6VDI/YVMVUzkZwPLms2OZFi/RXtxdMCHBDiqFHHExubk
	bLzrRjYUEf7oTb5xtpvZdPDM98W865MbLN5E3I0HutBqyI07bgC7fHV0WSq85C7jFQcgVKk9I0c
	0ryBM0Lad7wcQ4xY04314MNSbxDDo/esyZl4ZP5ueM+nYWA2Du/Lojd1sABHNJqBaP6pseOJNtk
	wmZUDS5czmjGIp4FAxarFhBLdBtD+lTkLoYW6W4kcGWPT6UZZE/gM2at7yK54GAcg3q20y1ZHmt
	wCXGLQjGFrvaxnH2D+aufaHuBM27bb4FmDdDzKaqKGnz5CFC7Gk8CXE5BuOeMFRpAbHVevYYFMd
	ViP0IDKub3PChBEwKatxIHdU+a6y96GBccdZ1iB0eBkApZB5H/U1wyHlX8SvZTrMqDX/QumS0dZ
	L9kIqfLCWOfGy9faygSUe8zoNF8
X-Received: by 2002:a05:690c:5806:b0:86f:b460:1d34 with SMTP id
 00721157ae682-8712800f98emr7043807b3.28.1788467146405; Thu, 03 Sep 2026
 13:25:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260903164454.152372-1-ross.burton@arm.com>
In-Reply-To: <20260903164454.152372-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Sep 2026 13:25:18 -0700
X-Gm-Features: AcwNN1U_chhPvxl70hiTeA4p1IgkD-EIfUU3O5WrOGkce8c1C9cISvIcyYgOUII
Message-ID: <CAMKF1spKxZGKHzJrmTaLo7Y-vwMKF7UPXdheZLa4XMyUX7EmcQ@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/3] meta-python: remove redundant UPSTREAM_CHECK_PYPI_PACKAGE
To: ross.burton@arm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f43bea065a99f47a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 20:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129748

--000000000000f43bea065a99f47a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ross

Good stuff, but can you rebase it on latest master/master-next and resend
the set

On Thu, Sep 3, 2026 at 9:45=E2=80=AFAM Ross Burton via lists.openembedded.o=
rg
<ross.burton=3Darm.com@lists.openembedded.org> wrote:

> Remove redundant UPSTREAM_CHECK_PYPI_PACKAGE assignments of PYPI_PACKAGE,
> which is the default value.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../recipes-connectivity/python-pyro5/python3-pyro5_5.17.bb     | 1 -
>  .../recipes-devtools/python/python3-annotated-doc_0.0.5.bb      | 2 --
>  .../recipes-devtools/python/python3-annotated-types_0.8.0.bb    | 2 --
>  .../recipes-devtools/python/python3-apply-defaults_0.1.6.bb     | 1 -
>  meta-python/recipes-devtools/python/python3-arpeggio_2.0.3.bb   | 1 -
>  meta-python/recipes-devtools/python/python3-brotli_1.2.0.bb     | 1 -
>  .../recipes-devtools/python/python3-cached-property_2.0.1.bb    | 1 -
>  meta-python/recipes-devtools/python/python3-can_4.6.1.bb        | 1 -
>  meta-python/recipes-devtools/python/python3-cerberus_1.3.8.bb   | 2 --
>  .../recipes-devtools/python/python3-charset-normalizer_3.4.9.bb | 1 -
>  .../recipes-devtools/python/python3-cheetah_3.2.6.post1.bb      | 1 -
>  .../recipes-devtools/python/python3-configargparse_1.7.5.bb     | 1 -
>  .../recipes-devtools/python/python3-custom-inherit_2.4.1.bb     | 1 -
>  meta-python/recipes-devtools/python/python3-dbus-fast_4.0.0.bb  | 1 -
>  meta-python/recipes-devtools/python/python3-dbus-next_0.2.3.bb  | 1 -
>  .../recipes-devtools/python/python3-dirty-equals_0.11.bb        | 1 -
>  .../recipes-devtools/python/python3-django-south_1.0.2.bb       | 1 -
>  meta-python/recipes-devtools/python/python3-django.inc          | 1 -
>  .../recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb   | 1 -
>  .../recipes-devtools/python/python3-email-validator_2.3.0.bb    | 1 -
>  meta-python/recipes-devtools/python/python3-et-xmlfile_2.0.0.bb | 1 -
>  meta-python/recipes-devtools/python/python3-eth-abi_5.2.0.bb    | 1 -
>  meta-python/recipes-devtools/python/python3-eth-utils_6.0.0.bb  | 1 -
>  .../recipes-devtools/python/python3-fastapi-cli_0.0.27.bb       | 2 --
>  .../recipes-devtools/python/python3-flask-babel_4.0.0.bb        | 1 -
>  .../recipes-devtools/python/python3-flask-bootstrap_3.3.7.1.bb  | 1 -
>  meta-python/recipes-devtools/python/python3-flask-cors_6.0.2.bb | 1 -
>  .../recipes-devtools/python/python3-flask-httpauth_4.8.0.bb     | 1 -
>  .../recipes-devtools/python/python3-flask-jsonpify_1.5.0.bb     | 1 -
>  .../recipes-devtools/python/python3-flask-jwt-extended_4.7.4.bb | 1 -
>  meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.bb  | 1 -
>  .../recipes-devtools/python/python3-flask-limiter_4.1.1.bb      | 1 -
>  .../recipes-devtools/python/python3-flask-login_0.6.3.bb        | 1 -
>  .../recipes-devtools/python/python3-flask-mail_0.10.0.bb        | 1 -
>  .../recipes-devtools/python/python3-flask-marshmallow_1.5.0.bb  | 1 -
>  .../recipes-devtools/python/python3-flask-migrate_4.1.0.bb      | 1 -
>  .../recipes-devtools/python/python3-flask-pymongo_3.0.1.bb      | 1 -
>  .../recipes-devtools/python/python3-flask-restful_0.3.10.bb     | 1 -
>  .../recipes-devtools/python/python3-flask-sijax_0.4.1.bb        | 1 -
>  .../recipes-devtools/python/python3-flask-socketio_5.6.1.bb     | 1 -
>  .../recipes-devtools/python/python3-flask-sqlalchemy_3.1.1.bb   | 1 -
>  .../recipes-devtools/python/python3-flask-uploads_0.2.1.bb      | 1 -
>  .../recipes-devtools/python/python3-flask-user_0.6.19.bb        | 1 -
>  .../python/python3-flask-versioned_0.9.4-20101221.bb            | 1 -
>  meta-python/recipes-devtools/python/python3-flask-wtf_1.3.0.bb  | 1 -
>  .../recipes-devtools/python/python3-flask-xstatic_0.0.1.bb      | 1 -
>  .../recipes-devtools/python/python3-google-auth_2.56.3.bb       | 1 -
>  .../recipes-devtools/python/python3-grpcio-channelz_1.76.0.bb   | 1 -
>  .../recipes-devtools/python/python3-grpcio-reflection_1.76.0.bb | 1 -
>  .../recipes-devtools/python/python3-grpcio-tools_1.76.0.bb      | 1 -
>  .../python/python3-hatch-requirements-txt_0.4.1.bb              | 1 -
>  meta-python/recipes-devtools/python/python3-icu_2.16.2.bb       | 1 -
>  meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb   | 1 -
>  .../recipes-devtools/python/python3-importlib-metadata_9.0.0.bb | 1 -
>  .../recipes-devtools/python/python3-inline-snapshot_0.35.4.bb   | 1 -
>  meta-python/recipes-devtools/python/python3-inotify_0.2.12.bb   | 1 -
>  meta-python/recipes-devtools/python/python3-ipy_1.01.bb         | 1 -
>  .../recipes-devtools/python/python3-ipython-genutils_0.2.0.bb   | 1 -
>  .../python/python3-keras-preprocessing_1.1.2.bb                 | 1 -
>  .../recipes-devtools/python/python3-lazy-object-proxy_1.12.0.bb | 1 -
>  meta-python/recipes-devtools/python/python3-luma-core_2.4.2.bb  | 1 -
>  meta-python/recipes-devtools/python/python3-luma-oled_3.15.0.bb | 1 -
>  .../recipes-devtools/python/python3-matplotlib-inline_0.2.2.bb  | 1 -
>  .../recipes-devtools/python/python3-mypy-extensions_1.1.0.bb    | 1 -
>  .../recipes-devtools/python/python3-ninja-syntax_1.7.2.bb       | 1 -
>  meta-python/recipes-devtools/python/python3-parse-type_0.6.6.bb | 1 -
>  .../recipes-devtools/python/python3-pastedeploy_3.1.0.bb        | 1 -
>  meta-python/recipes-devtools/python/python3-posix-ipc_1.3.2.bb  | 1 -
>  meta-python/recipes-devtools/python/python3-pure-eval_0.2.3.bb  | 1 -
>  .../recipes-devtools/python/python3-pyasn1-modules_0.4.2.bb     | 1 -
>  meta-python/recipes-devtools/python/python3-pyaudio_0.2.14.bb   | 1 -
>  meta-python/recipes-devtools/python/python3-pybluez_0.23.bb     | 1 -
>  .../recipes-devtools/python/python3-pydantic-core_2.46.4.bb     | 1 -
>  meta-python/recipes-devtools/python/python3-pyfirmata_1.1.0.bb  | 1 -
>  meta-python/recipes-devtools/python/python3-pylyrics_1.1.0.bb   | 1 -
>  meta-python/recipes-devtools/python/python3-pymysql_1.2.0.bb    | 1 -
>  meta-python/recipes-devtools/python/python3-pynacl_1.6.2.bb     | 1 -
>  .../recipes-devtools/python/python3-pyproject-api_1.11.0.bb     | 1 -
>  .../recipes-devtools/python/python3-pytest-asyncio_1.4.0.bb     | 1 -
>  .../recipes-devtools/python/python3-pytest-codspeed_5.0.3.bb    | 1 -
>  meta-python/recipes-devtools/python/python3-pytest-cov_7.1.0.bb | 1 -
>  meta-python/recipes-devtools/python/python3-pytest-env_1.7.0.bb | 1 -
>  .../recipes-devtools/python/python3-pytest-freezer_0.4.9.bb     | 1 -
>  .../recipes-devtools/python/python3-pytest-html_4.2.0.bb        | 1 -
>  .../recipes-devtools/python/python3-pytest-httpx_0.36.2.bb      | 1 -
>  .../python/python3-pytest-lazy-fixtures_1.1.4.bb                | 1 -
>  .../recipes-devtools/python/python3-pytest-mock_3.15.1.bb       | 1 -
>  .../recipes-devtools/python/python3-pytest-picked_0.5.1.bb      | 1 -
>  .../recipes-devtools/python/python3-pytest-socket_0.7.0.bb      | 1 -
>  .../recipes-devtools/python/python3-pytest-timeout_2.5.0.bb     | 1 -
>  .../recipes-devtools/python/python3-pytest-xdist_3.8.0.bb       | 1 -
>  .../recipes-devtools/python/python3-python-dotenv_1.2.1.bb      | 1 -
>  .../recipes-devtools/python/python3-python-multipart_0.0.32.bb  | 1 -
>  .../recipes-devtools/python/python3-requests-file_3.0.1.bb      | 1 -
>  .../recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb  | 1 -
>  .../recipes-devtools/python/python3-rich-argparse_1.8.0.bb      | 1 -
>  .../recipes-devtools/python/python3-scikit-build-core_1.0.3.bb  | 1 -
>  .../recipes-devtools/python/python3-scikit-build_0.19.1.bb      | 1 -
>  .../recipes-devtools/python/python3-service-identity_26.1.0.bb  | 1 -
>  meta-python/recipes-devtools/python/python3-sijax_0.3.2.bb      | 1 -
>  meta-python/recipes-devtools/python/python3-stack-data_0.6.3.bb | 1 -
>  meta-python/recipes-devtools/python/python3-strenum_0.4.15.bb   | 1 -
>  .../recipes-devtools/python/python3-time-machine_3.2.0.bb       | 1 -
>  .../recipes-devtools/python/python3-tokenize-rt_6.2.0.bb        | 1 -
>  .../python/python3-types-psutil_7.2.2.20260518.bb               | 1 -
>  meta-python/recipes-devtools/python/python3-wand_0.7.2.bb       | 1 -
>  .../recipes-devtools/python/python3-wheezy-template_3.2.5.bb    | 1 -
>  .../recipes-devtools/python/python3-wpa-supplicant_0.2.bb       | 1 -
>  meta-python/recipes-devtools/python/python3-xlsxwriter_3.2.1.bb | 1 -
>  .../python/python3-xstatic-font-awesome_6.2.1.2.bb              | 1 -
>  meta-python/recipes-devtools/python/python3-xstatic_1.0.3.bb    | 1 -
>  meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb    | 1 -
>  .../recipes-devtools/python/python3-zopeinterface_8.6.bb        | 1 -
>  .../python3-rouge-score/python3-rouge-score_0.1.2.bb            | 1 -
>  .../recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.5.bb     | 1 -
>  .../python3-gpt-image/python3-gpt-image_0.9.1.bb                | 1 -
>  .../recipes-extended/send2trash/python3-send2trash_2.1.0.bb     | 1 -
>  117 files changed, 121 deletions(-)
>
> diff --git a/meta-python/recipes-connectivity/python-pyro5/
> python3-pyro5_5.17.bb b/meta-python/recipes-connectivity/python-pyro5/
> python3-pyro5_5.17.bb
> index c16257beae..1be13146db 100644
> --- a/meta-python/recipes-connectivity/python-pyro5/python3-pyro5_5.17.bb
> +++ b/meta-python/recipes-connectivity/python-pyro5/python3-pyro5_5.17.bb
> @@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Dc1c9ccd5f4ca5d0f5057c0e690a0153d"
>  SRC_URI[sha256sum] =3D
> "cfac69638d80943aff9cc5f1466755dd0fef8aed0bb4bda41b5eb045818ce6fc"
>
>  PYPI_PACKAGE =3D "pyro5"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi setuptools3 ptest-python-pytest
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-annotated-doc_0.0.5.bb b/meta-python/recipes-devtools/python/
> python3-annotated-doc_0.0.5.bb
> index 28d05166f4..1f9164323f 100644
> --- a/meta-python/recipes-devtools/python/python3-annotated-doc_0.0.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-annotated-doc_0.0.5.bb
> @@ -5,8 +5,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3De36e91f278975b8bb76a769f32582892"
>
>  SRC_URI[sha256sum] =3D
> "c7e58ce09192557605d8bbd92836d7e1d520ac9580096042c0bfd197efacf1bb"
>
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
> -
>  inherit pypi python_pdm
>
>  PYPI_PACKAGE =3D "annotated_doc"
> diff --git a/meta-python/recipes-devtools/python/
> python3-annotated-types_0.8.0.bb b/meta-python/recipes-devtools/python/
> python3-annotated-types_0.8.0.bb
> index 3bc397ffa7..28941262b1 100644
> --- a/meta-python/recipes-devtools/python/python3-annotated-types_0.8.0.b=
b
> +++ b/meta-python/recipes-devtools/python/python3-annotated-types_0.8.0.b=
b
> @@ -9,8 +9,6 @@ SRC_URI[sha256sum] =3D
> "13b2beaad985e05e2d6407ee4c4f35590b11f8d693a258a561055cac8f
>  S =3D "${UNPACKDIR}/annotated_types-${PV}"
>  PYPI_PACKAGE =3D "annotated_types"
>
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
> -
>  inherit pypi python_hatchling
>
>  RDEPENDS:${PN} =3D "python3-typing-extensions"
> diff --git a/meta-python/recipes-devtools/python/
> python3-apply-defaults_0.1.6.bb b/meta-python/recipes-devtools/python/
> python3-apply-defaults_0.1.6.bb
> index 1be20f179a..6bf61cfcd3 100644
> --- a/meta-python/recipes-devtools/python/python3-apply-defaults_0.1.6.bb
> +++ b/meta-python/recipes-devtools/python/python3-apply-defaults_0.1.6.bb
> @@ -4,7 +4,6 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc89120516900f96f4c60d35fdc4c3=
f15"
>
>  PYPI_PACKAGE =3D "apply_defaults"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  SRC_URI[sha256sum] =3D
> "3773de3491b94c0fe44310f1a85888389cdc71e1544b343bce0d2bd6991acea5"
>
> diff --git a/meta-python/recipes-devtools/python/python3-arpeggio_2.0.3.b=
b
> b/meta-python/recipes-devtools/python/python3-arpeggio_2.0.3.bb
> index 4d4982dd37..01739adf86 100644
> --- a/meta-python/recipes-devtools/python/python3-arpeggio_2.0.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-arpeggio_2.0.3.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D33b8d1ba459a2fa4d801acfd1d1b7ceb"
>  SRC_URI[sha256sum] =3D
> "9e85ad35cfc6c938676817c7ae9a1000a7c72a34c71db0c687136c460d12b85e"
>
>  PYPI_PACKAGE =3D "Arpeggio"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi setuptools3
>
> diff --git a/meta-python/recipes-devtools/python/python3-brotli_1.2.0.bb
> b/meta-python/recipes-devtools/python/python3-brotli_1.2.0.bb
> index f4cdab65b6..643208264c 100644
> --- a/meta-python/recipes-devtools/python/python3-brotli_1.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-brotli_1.2.0.bb
> @@ -5,7 +5,6 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D941ee9cd1609382f946352712a319=
b4b"
>
>  PYPI_PACKAGE =3D "brotli"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  CVE_PRODUCT =3D "brotli"
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-cached-property_2.0.1.bb b/meta-python/recipes-devtools/python/
> python3-cached-property_2.0.1.bb
> index 5c88a4e69e..e1ead95cf1 100644
> --- a/meta-python/recipes-devtools/python/python3-cached-property_2.0.1.b=
b
> +++ b/meta-python/recipes-devtools/python/python3-cached-property_2.0.1.b=
b
> @@ -6,7 +6,6 @@ LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddb7ff60c4e14f58534201242803d8=
abc"
>
>  PYPI_PACKAGE =3D "cached_property"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  SRC_URI[sha256sum] =3D
> "484d617105e3ee0e4f1f58725e72a8ef9e93deee462222dbd51cd91230897641"
>
> diff --git a/meta-python/recipes-devtools/python/python3-can_4.6.1.bb
> b/meta-python/recipes-devtools/python/python3-can_4.6.1.bb
> index a2746511f8..4f7a8e9b0a 100644
> --- a/meta-python/recipes-devtools/python/python3-can_4.6.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-can_4.6.1.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3De6a600fd5e1d9cbde2d983680233ad02"
>  SRC_URI[sha256sum] =3D
> "290fea135d04b8504ebff33889cc6d301e2181a54099116609f940825ffe5005"
>
>  PYPI_PACKAGE =3D "python_can"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi python_setuptools_build_meta
>
> diff --git a/meta-python/recipes-devtools/python/python3-cerberus_1.3.8.b=
b
> b/meta-python/recipes-devtools/python/python3-cerberus_1.3.8.bb
> index 7b868fad5e..3175db905c 100644
> --- a/meta-python/recipes-devtools/python/python3-cerberus_1.3.8.bb
> +++ b/meta-python/recipes-devtools/python/python3-cerberus_1.3.8.bb
> @@ -4,8 +4,6 @@ SECTION =3D "devel/python"
>  LICENSE =3D "ISC"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D48f8e9432d0dac5e0e7a18211a0ba=
cdb"
>
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
> -
>  inherit pypi python_setuptools_build_meta
>
>  SRC_URI[sha256sum] =3D
> "579554887ffd189226774b87570f4a76db75cf0efcbaffcacd5e98b8ee877f61"
> diff --git a/meta-python/recipes-devtools/python/
> python3-charset-normalizer_3.4.9.bb b/meta-python/recipes-devtools/python=
/
> python3-charset-normalizer_3.4.9.bb
> index 6df52a23d4..ae93b43d5c 100644
> --- a/meta-python/recipes-devtools/python/
> python3-charset-normalizer_3.4.9.bb
> +++ b/meta-python/recipes-devtools/python/
> python3-charset-normalizer_3.4.9.bb
> @@ -11,7 +11,6 @@ DEPENDS +=3D "python3-setuptools-scm-native
> python3-mypy-native"
>  inherit pypi python_setuptools_build_meta ptest-python-pytest
>
>  PYPI_PACKAGE =3D "charset_normalizer"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  RDEPENDS:${PN} +=3D " \
>         python3-core \
> diff --git a/meta-python/recipes-devtools/python/
> python3-cheetah_3.2.6.post1.bb b/meta-python/recipes-devtools/python/
> python3-cheetah_3.2.6.post1.bb
> index e7b404cd8f..252ec4cd89 100644
> --- a/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.post1.bb
> +++ b/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.post1.bb
> @@ -4,7 +4,6 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D15e13a4ed0e5880e3e55ec88b0921=
181"
>
>  PYPI_PACKAGE =3D "Cheetah3"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi setuptools3
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-configargparse_1.7.5.bb b/meta-python/recipes-devtools/python/
> python3-configargparse_1.7.5.bb
> index 49df56d75b..0bf629dd91 100644
> --- a/meta-python/recipes-devtools/python/python3-configargparse_1.7.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-configargparse_1.7.5.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Dda746463714cc35999ed9a42339f2943"
>  SRC_URI[sha256sum] =3D
> "e3f9a7bb6be34d66b2e3c4a2f58e3045f8dfae47b0dc039f87bcfaa0f193fb0f"
>
>  PYPI_PACKAGE =3D "configargparse"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi python_setuptools_build_meta
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-custom-inherit_2.4.1.bb b/meta-python/recipes-devtools/python/
> python3-custom-inherit_2.4.1.bb
> index a8aad44943..e7409f77e6 100644
> --- a/meta-python/recipes-devtools/python/python3-custom-inherit_2.4.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-custom-inherit_2.4.1.bb
> @@ -4,7 +4,6 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D
> "file://LICENSE.md;md5=3Df910a85a4c3da51edf780f17a7608434"
>
>  PYPI_PACKAGE =3D "custom_inherit"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  SRC_URI +=3D "file://0001-versioneer.py-do-not-use-SafeConfigParser.patc=
h"
>  SRC_URI[sha256sum] =3D
> "7052eb337bcce83551815264391cc4efc2bf70b295a3c52aba64f1ab57c3a8a2"
> diff --git a/meta-python/recipes-devtools/python/
> python3-dbus-fast_4.0.0.bb b/meta-python/recipes-devtools/python/
> python3-dbus-fast_4.0.0.bb
> index a45a7fa920..c0c40b6b23 100644
> --- a/meta-python/recipes-devtools/python/python3-dbus-fast_4.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-dbus-fast_4.0.0.bb
> @@ -7,7 +7,6 @@ SRC_URI +=3D
> "file://0001-pyproject.toml-Remove-upper-version-constraint-for-C.pat
>  SRC_URI[sha256sum] =3D
> "e1d3ee49a4a81524d7caaa2d5a31fc71075a1c977b661df958cee24bef86b8fe"
>
>  PYPI_PACKAGE =3D "dbus_fast"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi python_poetry_core cython
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-dbus-next_0.2.3.bb b/meta-python/recipes-devtools/python/
> python3-dbus-next_0.2.3.bb
> index 10c1bfda04..9f6aa7ed7f 100644
> --- a/meta-python/recipes-devtools/python/python3-dbus-next_0.2.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-dbus-next_0.2.3.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D94e750c96e56788499b56c81de91431c"
>  SRC_URI[sha256sum] =3D
> "f4eae26909332ada528c0a3549dda8d4f088f9b365153952a408e28023a626a5"
>
>  PYPI_PACKAGE =3D "dbus_next"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi setuptools3
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-dirty-equals_0.11.bb b/meta-python/recipes-devtools/python/
> python3-dirty-equals_0.11.bb
> index 098c8ae0e6..daf8567f07 100644
> --- a/meta-python/recipes-devtools/python/python3-dirty-equals_0.11.bb
> +++ b/meta-python/recipes-devtools/python/python3-dirty-equals_0.11.bb
> @@ -17,7 +17,6 @@ S =3D "${UNPACKDIR}/dirty_equals-${PV}"
>  inherit pypi python_hatchling
>
>  PYPI_PACKAGE =3D "dirty_equals"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  RDEPENDS:${PN} +=3D " \
>      python3-pytz \
> diff --git a/meta-python/recipes-devtools/python/
> python3-django-south_1.0.2.bb b/meta-python/recipes-devtools/python/
> python3-django-south_1.0.2.bb
> index 5b0f6c6f3b..152e57f105 100644
> --- a/meta-python/recipes-devtools/python/python3-django-south_1.0.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-django-south_1.0.2.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D
> "file://PKG-INFO;beginline=3D17;endline=3D18;md5=3D2155d8ae21e7c231
>  SRC_URI[sha256sum] =3D
> "d360bd31898f9df59f6faa786551065bba45b35e7ee3c39b381b4fbfef7392f4"
>
>  PYPI_PACKAGE =3D "South"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi setuptools3
>
> diff --git a/meta-python/recipes-devtools/python/python3-django.inc
> b/meta-python/recipes-devtools/python/python3-django.inc
> index 4191d4384f..bbf7e564e8 100644
> --- a/meta-python/recipes-devtools/python/python3-django.inc
> +++ b/meta-python/recipes-devtools/python/python3-django.inc
> @@ -4,7 +4,6 @@ LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df09eb47206614a4954c51db8a9484=
0fa"
>
>  PYPI_PACKAGE =3D "django"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi ptest
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-dynamic-dispatch_1.0.3.bb b/meta-python/recipes-devtools/python/
> python3-dynamic-dispatch_1.0.3.bb
> index 227e97c46c..fa21531487 100644
> --- a/meta-python/recipes-devtools/python/
> python3-dynamic-dispatch_1.0.3.bb
> +++ b/meta-python/recipes-devtools/python/
> python3-dynamic-dispatch_1.0.3.bb
> @@ -8,7 +8,6 @@ inherit pypi setuptools3
>  SRC_URI[sha256sum] =3D
> "fbc676aaedc8ec542056c21e5e206b8b62b8d11c3f3c5cfb32b273936da89604"
>
>  PYPI_PACKAGE =3D "dynamic_dispatch"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  DEPENDS +=3D "python3-setuptools-scm-native"
>  RDEPENDS:${PN} +=3D "\
> diff --git a/meta-python/recipes-devtools/python/
> python3-email-validator_2.3.0.bb b/meta-python/recipes-devtools/python/
> python3-email-validator_2.3.0.bb
> index b745dfbba8..a9401ccf49 100644
> --- a/meta-python/recipes-devtools/python/python3-email-validator_2.3.0.b=
b
> +++ b/meta-python/recipes-devtools/python/python3-email-validator_2.3.0.b=
b
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D2890aee62bd2a4c3197e2059016a397e"
>  SRC_URI[sha256sum] =3D
> "9fc05c37f2f6cf439ff414f8fc46d917929974a82244c20eb10231ba60c54426"
>
>  PYPI_PACKAGE =3D "email_validator"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi setuptools3
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-et-xmlfile_2.0.0.bb b/meta-python/recipes-devtools/python/
> python3-et-xmlfile_2.0.0.bb
> index 9439deef0a..1f119c6bdf 100644
> --- a/meta-python/recipes-devtools/python/python3-et-xmlfile_2.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-et-xmlfile_2.0.0.bb
> @@ -21,4 +21,3 @@ RDEPENDS:${PN} +=3D " \
>  inherit setuptools3 pypi
>
>  PYPI_PACKAGE =3D "et_xmlfile"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
> diff --git a/meta-python/recipes-devtools/python/python3-eth-abi_5.2.0.bb
> b/meta-python/recipes-devtools/python/python3-eth-abi_5.2.0.bb
> index e1459653ea..340e69ee6b 100644
> --- a/meta-python/recipes-devtools/python/python3-eth-abi_5.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-eth-abi_5.2.0.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D2b6a85414b7d058ab1c58e11611c21b2"
>  SRC_URI[sha256sum] =3D
> "178703fa98c07d8eecd5ae569e7e8d159e493ebb6eeb534a8fe973fbc4e40ef0"
>
>  PYPI_PACKAGE =3D "eth_abi"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi setuptools3
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-eth-utils_6.0.0.bb b/meta-python/recipes-devtools/python/
> python3-eth-utils_6.0.0.bb
> index 36d787746e..0618814d52 100644
> --- a/meta-python/recipes-devtools/python/python3-eth-utils_6.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-eth-utils_6.0.0.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Dd3f53e7cc5bf80b16eff1f4a38c73182"
>  SRC_URI[sha256sum] =3D
> "eb54b2f82dd300d3142c49a89da195e823f5e5284d43203593f87c67bad92a96"
>
>  PYPI_PACKAGE =3D "eth_utils"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi setuptools3
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-fastapi-cli_0.0.27.bb b/meta-python/recipes-devtools/python/
> python3-fastapi-cli_0.0.27.bb
> index 218137e5f8..02750e67e1 100644
> --- a/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.27.bb
> +++ b/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.27.bb
> @@ -9,8 +9,6 @@ inherit pypi python_pdm
>
>  PYPI_PACKAGE =3D "fastapi_cli"
>
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
> -
>  RDEPENDS:${PN} +=3D "\
>      python3-difflib \
>      python3-pydantic \
> diff --git a/meta-python/recipes-devtools/python/
> python3-flask-babel_4.0.0.bb b/meta-python/recipes-devtools/python/
> python3-flask-babel_4.0.0.bb
> index 4923eb9d58..b445ec0e1c 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-babel_4.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-babel_4.0.0.bb
> @@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D51917f3e8e858f5ae295a7d0e2eb3cc9"
>  SRC_URI[sha256sum] =3D
> "dbeab4027a3f4a87678a11686496e98e1492eb793cbdd77ab50f4e9a2602a593"
>
>  PYPI_PACKAGE =3D "flask_babel"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi python_poetry_core
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-flask-bootstrap_3.3.7.1.bb b/meta-python/recipes-devtools/python/
> python3-flask-bootstrap_3.3.7.1.bb
> index 697c0b1850..e28e41c124 100644
> --- a/meta-python/recipes-devtools/python/
> python3-flask-bootstrap_3.3.7.1.bb
> +++ b/meta-python/recipes-devtools/python/
> python3-flask-bootstrap_3.3.7.1.bb
> @@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D
> "file://PKG-INFO;md5=3Da03749709f06118a17349deb5a210619"
>  SRC_URI[sha256sum] =3D
> "cb08ed940183f6343a64e465e83b3a3f13c53e1baabb8d72b5da4545ef123ac8"
>
>  PYPI_PACKAGE =3D "Flask-Bootstrap"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi setuptools3
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-flask-cors_6.0.2.bb b/meta-python/recipes-devtools/python/
> python3-flask-cors_6.0.2.bb
> index 6134b5ba10..b5a32faa6e 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-cors_6.0.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-cors_6.0.2.bb
> @@ -8,7 +8,6 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D
> "file://PKG-INFO;beginline=3D6;endline=3D6;md5=3D134f1026f0de92fd30e71976=
590a2868"
>
>  PYPI_PACKAGE =3D "flask_cors"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  CVE_PRODUCT =3D "flask-cors"
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-flask-httpauth_4.8.0.bb b/meta-python/recipes-devtools/python/
> python3-flask-httpauth_4.8.0.bb
> index f090f1d40f..cf0f73aef5 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-httpauth_4.8.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-httpauth_4.8.0.bb
> @@ -8,7 +8,6 @@ inherit pypi python_setuptools_build_meta
>  DEPENDS +=3D "python3-wheel-native"
>
>  PYPI_PACKAGE =3D "Flask-HTTPAuth"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  SRC_URI[sha256sum] =3D
> "66568a05bc73942c65f1e2201ae746295816dc009edd84b482c44c758d75097a"
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-flask-jsonpify_1.5.0.bb b/meta-python/recipes-devtools/python/
> python3-flask-jsonpify_1.5.0.bb
> index d653b8adbf..93ecf08453 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-jsonpify_1.5.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-jsonpify_1.5.0.bb
> @@ -5,7 +5,6 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D
> "file://README.rst;md5=3Dbd59445a234a0c8250b39178d42e3148"
>
>  PYPI_PACKAGE =3D "Flask-Jsonpify"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  SRC_URI[sha256sum] =3D
> "8ac4c732aa5b11d9f6c2de58065d3b669f139518ca8f529bce943817e2fedbfb"
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-flask-jwt-extended_4.7.4.bb b/meta-python/recipes-devtools/python=
/
> python3-flask-jwt-extended_4.7.4.bb
> index de6231ac31..5d7412f1e2 100644
> --- a/meta-python/recipes-devtools/python/
> python3-flask-jwt-extended_4.7.4.bb
> +++ b/meta-python/recipes-devtools/python/
> python3-flask-jwt-extended_4.7.4.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D9166295d7c482b9440bbb2b5c0fa43ac"
>  inherit pypi setuptools3
>
>  PYPI_PACKAGE =3D "flask_jwt_extended"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  SRC_URI[sha256sum] =3D
> "78fd0f460317facf3a0084a6457ffaf2f1dda9eefbd576f94cea35b0eadd5531"
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-flask-jwt_0.3.2.bb b/meta-python/recipes-devtools/python/
> python3-flask-jwt_0.3.2.bb
> index 462d065a0e..f7044b314f 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.bb
> @@ -5,7 +5,6 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dff00db41c47ec84b4567a8b3c246a=
959"
>
>  PYPI_PACKAGE =3D "Flask-JWT"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  SRC_URI[sha256sum] =3D
> "49c0672fbde0f1cd3374bd834918d28956e3c521c7e00089cdc5380d323bd0ad"
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-flask-limiter_4.1.1.bb b/meta-python/recipes-devtools/python/
> python3-flask-limiter_4.1.1.bb
> index 7c2e18ffba..884da17052 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-limiter_4.1.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-limiter_4.1.1.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D2455d5e574bc0fc489411ca45766ac78"
>  SRC_URI[sha256sum] =3D
> "ca11608fc7eec43dcea606964ca07c3bd4ec1ae89043a0f67f717899a4f48106"
>
>  PYPI_PACKAGE =3D "flask_limiter"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi python_hatchling
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-flask-login_0.6.3.bb b/meta-python/recipes-devtools/python/
> python3-flask-login_0.6.3.bb
> index a50f82abc4..df22ca112c 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-login_0.6.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-login_0.6.3.bb
> @@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D8aa87a1cd9fa41d969ad32cfdac2c596"
>  SRC_URI[sha256sum] =3D
> "5e23d14a607ef12806c699590b89d0f0e0d67baeec599d75947bf9c147330333"
>
>  PYPI_PACKAGE =3D "Flask-Login"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi setuptools3
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-flask-mail_0.10.0.bb b/meta-python/recipes-devtools/python/
> python3-flask-mail_0.10.0.bb
> index 53d3333b95..a91a231b95 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-mail_0.10.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-mail_0.10.0.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D201f2b80112efa61b78515bd54e9f138"
>  SRC_URI[sha256sum] =3D
> "44083e7b02bbcce792209c06252f8569dd5a325a7aaa76afe7330422bd97881d"
>
>  PYPI_PACKAGE =3D "flask_mail"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi python_flit_core
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-flask-marshmallow_1.5.0.bb b/meta-python/recipes-devtools/python/
> python3-flask-marshmallow_1.5.0.bb
> index a311730980..9739f31f6f 100644
> --- a/meta-python/recipes-devtools/python/
> python3-flask-marshmallow_1.5.0.bb
> +++ b/meta-python/recipes-devtools/python/
> python3-flask-marshmallow_1.5.0.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D27586b20700d7544c06933afe56f7df4"
>  inherit pypi python_flit_core
>
>  PYPI_PACKAGE =3D "flask_marshmallow"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  SRC_URI[sha256sum] =3D
> "7c06b56e41647eccdb3cd57c25b109f19191b4c62509362bd64920cdf601a066"
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-flask-migrate_4.1.0.bb b/meta-python/recipes-devtools/python/
> python3-flask-migrate_4.1.0.bb
> index 7cdada071f..fc64d03d38 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-migrate_4.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-migrate_4.1.0.bb
> @@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D3b69377f79f3f48c661701236d5a6a85"
>  SRC_URI[sha256sum] =3D
> "1a336b06eb2c3ace005f5f2ded8641d534c18798d64061f6ff11f79e1434126d"
>
>  PYPI_PACKAGE =3D "flask_migrate"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi python_setuptools_build_meta
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-flask-pymongo_3.0.1.bb b/meta-python/recipes-devtools/python/
> python3-flask-pymongo_3.0.1.bb
> index 7773e2830e..c760ee0219 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-pymongo_3.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-pymongo_3.0.1.bb
> @@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D
> "file://flask_pymongo/wrappers.py;beginline=3D1;endline=3D24;md5=3D
>  SRC_URI[sha256sum] =3D
> "d225b51c21ceca2e670e6cca79b5c584ad17b96252b48e84e3b423ddb73304cc"
>
>  PYPI_PACKAGE =3D "flask_pymongo"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi python_setuptools_build_meta python_hatchling
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-flask-restful_0.3.10.bb b/meta-python/recipes-devtools/python/
> python3-flask-restful_0.3.10.bb
> index 0f97fbc259..8ea455c633 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-restful_0.3.10.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-restful_0.3.10.bb
> @@ -11,6 +11,5 @@ SRC_URI[sha256sum] =3D
> "fe4af2ef0027df8f9b4f797aba20c5566801b6ade995ac63b588abf1a5
>  inherit pypi setuptools3
>
>  PYPI_PACKAGE =3D "Flask-RESTful"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  RDEPENDS:${PN} =3D "python3-flask"
> diff --git a/meta-python/recipes-devtools/python/
> python3-flask-sijax_0.4.1.bb b/meta-python/recipes-devtools/python/
> python3-flask-sijax_0.4.1.bb
> index e74f315c4a..d518a1877f 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-sijax_0.4.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-sijax_0.4.1.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D266adc7b911b7c84b837bf77196e1ba6"
>  SRC_URI[sha256sum] =3D
> "fb2bf2d4f75408185102195055d75549fee8d9c9e954dca2427186925cdc429f"
>
>  PYPI_PACKAGE =3D "Flask-Sijax"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi setuptools3
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-flask-socketio_5.6.1.bb b/meta-python/recipes-devtools/python/
> python3-flask-socketio_5.6.1.bb
> index 9e94d20748..edbe6eef08 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-socketio_5.6.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-socketio_5.6.1.bb
> @@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D38cc21254909604298ce763a6e4440a0"
>  inherit pypi python_setuptools_build_meta
>
>  PYPI_PACKAGE =3D "flask_socketio"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  SRC_URI[sha256sum] =3D
> "fe5bd995c3ed4da9a98f335d0d830fa1a19d84a64789f6265642a671fdacaeac"
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-flask-sqlalchemy_3.1.1.bb b/meta-python/recipes-devtools/python/
> python3-flask-sqlalchemy_3.1.1.bb
> index a3fd62228a..c300d0b388 100644
> --- a/meta-python/recipes-devtools/python/
> python3-flask-sqlalchemy_3.1.1.bb
> +++ b/meta-python/recipes-devtools/python/
> python3-flask-sqlalchemy_3.1.1.bb
> @@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE.rst;md5=3Dffeffa59c90c9c4a033c7574f8f3fb75"
>  SRC_URI[sha256sum] =3D
> "e4b68bb881802dda1a7d878b2fc84c06d1ee57fb40b874d3dc97dabfa36b8312"
>
>  PYPI_PACKAGE =3D "flask_sqlalchemy"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi python_flit_core
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-flask-uploads_0.2.1.bb b/meta-python/recipes-devtools/python/
> python3-flask-uploads_0.2.1.bb
> index fa2b321814..a51ead3c8a 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb
> @@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D
> "file://PKG-INFO;md5=3Db712ac634b39469660c9bdfb8d03421c"
>  SRC_URI[sha256sum] =3D
> "53ecbd6033667d50ae02b63adebbaa33c7fc56c09e5293025810cf9d841ecb02"
>
>  PYPI_PACKAGE =3D "Flask-Uploads"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi setuptools3
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-flask-user_0.6.19.bb b/meta-python/recipes-devtools/python/
> python3-flask-user_0.6.19.bb
> index 9ec9249339..951020dae9 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
> @@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D97de97cd9d6e23c88129d884588ce71a"
>  SRC_URI[sha256sum] =3D
> "601abcc0343dfbae0c56273d98362d5cdc266ac84d20b3f65a212e4a2c83b302"
>
>  PYPI_PACKAGE =3D "Flask-User"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  CVE_PRODUCT =3D "flask-user_project:flask-user"
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-flask-versioned_0.9.4-20101221.bb
> b/meta-python/recipes-devtools/python/
> python3-flask-versioned_0.9.4-20101221.bb
> index 4e2d5e6095..3492d5efc8 100644
> --- a/meta-python/recipes-devtools/python/
> python3-flask-versioned_0.9.4-20101221.bb
> +++ b/meta-python/recipes-devtools/python/
> python3-flask-versioned_0.9.4-20101221.bb
> @@ -4,7 +4,6 @@ LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D
> "file://flaskext/versioned/__init__.py;md5=3Ddcb7d97884bf08c256ff5795766b=
cd24"
>
>  PYPI_PACKAGE =3D "Flask-Versioned"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  SRC_URI[sha256sum] =3D
> "516694dc860a1bc4f22ab60b324a85083c0150522be109282a3bed681057fd34"
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-flask-wtf_1.3.0.bb b/meta-python/recipes-devtools/python/
> python3-flask-wtf_1.3.0.bb
> index 2c1f8af8e8..54c6c8904d 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-wtf_1.3.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-wtf_1.3.0.bb
> @@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE.rst;md5=3Dd98d089889e14b227732d45dac3aacc4"
>  SRC_URI[sha256sum] =3D
> "61d5dabc50c3df885c297dcbd80810443a5d632106c8a69cab8ce740f0cdd7cc"
>
>  PYPI_PACKAGE =3D "flask_wtf"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi python_hatchling
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-flask-xstatic_0.0.1.bb b/meta-python/recipes-devtools/python/
> python3-flask-xstatic_0.0.1.bb
> index b8d73c8170..c4cad466ad 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-xstatic_0.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-xstatic_0.0.1.bb
> @@ -7,7 +7,6 @@ SRC_URI[sha256sum] =3D
> "226ea8e97065a9488b59bfe5c94af4c6e2ea70a25052e301fb231a1381
>  SRC_URI +=3D "file://remove-pip-requires.patch"
>
>  PYPI_PACKAGE =3D "Flask-XStatic"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  RDEPENDS:${PN} +=3D "\
>      python3-flask \
> diff --git a/meta-python/recipes-devtools/python/
> python3-google-auth_2.56.3.bb b/meta-python/recipes-devtools/python/
> python3-google-auth_2.56.3.bb
> index c096c6ab36..c79f51f760 100644
> --- a/meta-python/recipes-devtools/python/python3-google-auth_2.56.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-google-auth_2.56.3.bb
> @@ -12,7 +12,6 @@ SRC_URI +=3D " \
>  SRC_URI[sha256sum] =3D
> "40e229fc901f0a305b553050e5fce562d509bee0435be053abfa91582b51b90c"
>
>  PYPI_PACKAGE =3D "google_auth"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  RDEPENDS:${PN}-ptest +=3D " \
>          python3-aioresponses \
> diff --git a/meta-python/recipes-devtools/python/
> python3-grpcio-channelz_1.76.0.bb b/meta-python/recipes-devtools/python/
> python3-grpcio-channelz_1.76.0.bb
> index 921a9a251a..0f75a7a084 100644
> --- a/meta-python/recipes-devtools/python/
> python3-grpcio-channelz_1.76.0.bb
> +++ b/meta-python/recipes-devtools/python/
> python3-grpcio-channelz_1.76.0.bb
> @@ -9,7 +9,6 @@ inherit pypi setuptools3
>
>  DEPENDS +=3D "python3-grpcio"
>  PYPI_PACKAGE =3D "grpcio_channelz"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  SRC_URI[sha256sum] =3D
> "2ab15ef7b2252a9ba31df500bbe295ce5310a8b01ea6f6d67a17172d914a41a8"
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-grpcio-reflection_1.76.0.bb b/meta-python/recipes-devtools/python=
/
> python3-grpcio-reflection_1.76.0.bb
> index e03fd3e818..910d795553 100644
> --- a/meta-python/recipes-devtools/python/
> python3-grpcio-reflection_1.76.0.bb
> +++ b/meta-python/recipes-devtools/python/
> python3-grpcio-reflection_1.76.0.bb
> @@ -9,7 +9,6 @@ inherit pypi setuptools3
>
>  DEPENDS +=3D "python3-grpcio"
>  PYPI_PACKAGE =3D "grpcio_reflection"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  SRC_URI[sha256sum] =3D
> "e0e7e49921c2ee951e5ddff0bdbacbd1ac1a70888beb61d567f3d01b799decb1"
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-grpcio-tools_1.76.0.bb b/meta-python/recipes-devtools/python/
> python3-grpcio-tools_1.76.0.bb
> index 29bf02f786..447ece8594 100644
> --- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.76.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.76.0.bb
> @@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D
> "file://PKG-INFO;beginline=3D8;endline=3D8;md5=3D7145f7cdd263359b62
>  inherit pypi setuptools3
>
>  PYPI_PACKAGE =3D "grpcio_tools"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  DEPENDS +=3D "python3-grpcio"
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-hatch-requirements-txt_0.4.1.bb
> b/meta-python/recipes-devtools/python/
> python3-hatch-requirements-txt_0.4.1.bb
> index d9026e4577..8b3218790e 100644
> --- a/meta-python/recipes-devtools/python/
> python3-hatch-requirements-txt_0.4.1.bb
> +++ b/meta-python/recipes-devtools/python/
> python3-hatch-requirements-txt_0.4.1.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D58206c261591d2c13b00ab61cec32abe"
>  SRC_URI[sha256sum] =3D
> "2c686e5758fd05bb55fa7d0c198fdd481f8d3aaa3c693260f5c0d74ce3547d20"
>
>  PYPI_PACKAGE =3D "hatch_requirements_txt"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi python_hatchling
>
> diff --git a/meta-python/recipes-devtools/python/python3-icu_2.16.2.bb
> b/meta-python/recipes-devtools/python/python3-icu_2.16.2.bb
> index 95e4aa79af..a2ebc40758 100644
> --- a/meta-python/recipes-devtools/python/python3-icu_2.16.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-icu_2.16.2.bb
> @@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D0724597863f1581ab01429e0423e779f"
>  DEPENDS +=3D "icu"
>
>  PYPI_PACKAGE =3D "pyicu"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  SRC_URI[sha256sum] =3D
> "006d51e24b5ec76df6ec2130f3dde269c51db8b8cfebb7d45a427dde0d10aa52"
>
> diff --git a/meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.b=
b
> b/meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb
> index 331dc0355c..37a3eea5d4 100644
> --- a/meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Da61b9c5aec8796b64a6bf15d42605073"
>  SRC_URI[sha256sum] =3D
> "a933e3bb13da54383f9e8f35dc4f9cb9eb9b3b78c6b36f311254d6d0d92c6c7c"
>
>  PYPI_PACKAGE =3D "idna-ssl"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi setuptools3
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-importlib-metadata_9.0.0.bb b/meta-python/recipes-devtools/python=
/
> python3-importlib-metadata_9.0.0.bb
> index 61f531a9c1..e1a7c1b590 100644
> --- a/meta-python/recipes-devtools/python/
> python3-importlib-metadata_9.0.0.bb
> +++ b/meta-python/recipes-devtools/python/
> python3-importlib-metadata_9.0.0.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Daffe5a7d8b988c3db245c01075b29e17"
>  inherit pypi python_setuptools_build_meta
>
>  PYPI_PACKAGE =3D "importlib_metadata"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  SRC_URI[sha256sum] =3D
> "a4f57ab599e6a2e3016d7595cfd72eb4661a5106e787a95bcc90c7105b831efc"
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-inline-snapshot_0.35.4.bb b/meta-python/recipes-devtools/python/
> python3-inline-snapshot_0.35.4.bb
> index c4af98c9e0..d9eea29c1f 100644
> --- a/meta-python/recipes-devtools/python/
> python3-inline-snapshot_0.35.4.bb
> +++ b/meta-python/recipes-devtools/python/
> python3-inline-snapshot_0.35.4.bb
> @@ -9,7 +9,6 @@ SRC_URI[sha256sum] =3D
> "82432a58b7ea77a172515f5024cd26fdea8dc0f873c7a4251e4e0471a9
>  inherit pypi python_hatchling
>
>  PYPI_PACKAGE =3D "inline_snapshot"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  RDEPENDS:${PN} =3D "python3-asttokens \
>                    python3-black \
> diff --git a/meta-python/recipes-devtools/python/python3-inotify_0.2.12.b=
b
> b/meta-python/recipes-devtools/python/python3-inotify_0.2.12.bb
> index f442d2faa6..28a679bc99 100644
> --- a/meta-python/recipes-devtools/python/python3-inotify_0.2.12.bb
> +++ b/meta-python/recipes-devtools/python/python3-inotify_0.2.12.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D8c16666ae6c159876a0ba63099614381"
>  SRC_URI[sha256sum] =3D
> "9aee407f92c7d51a2ce50f3b78291a9094e334e34bd68e82bf60020795fa2c94"
>
>  PYPI_PACKAGE =3D "inotify"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi python_setuptools_build_meta ptest-python-pytest
>
> diff --git a/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
> b/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
> index 6a35e12ffe..631354dece 100644
> --- a/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
> +++ b/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
> @@ -16,6 +16,5 @@ inherit pypi setuptools3_legacy ptest-python-pytest
>  PTEST_PYTEST_DIR =3D "test"
>
>  PYPI_PACKAGE =3D "IPy"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  BBCLASSEXTEND =3D "native"
> diff --git a/meta-python/recipes-devtools/python/
> python3-ipython-genutils_0.2.0.bb b/meta-python/recipes-devtools/python/
> python3-ipython-genutils_0.2.0.bb
> index b26a9ebd53..d880d88d2d 100644
> --- a/meta-python/recipes-devtools/python/
> python3-ipython-genutils_0.2.0.bb
> +++ b/meta-python/recipes-devtools/python/
> python3-ipython-genutils_0.2.0.bb
> @@ -4,7 +4,6 @@ LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D
> "file://COPYING.md;md5=3Df7c3032c3ac398265224533a0a333a35"
>
>  PYPI_PACKAGE =3D "ipython_genutils"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  SRC_URI[sha256sum] =3D
> "eb2e116e75ecef9d4d228fdc66af54269afa26ab4463042e33785b887c628ba8"
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-keras-preprocessing_1.1.2.bb
> b/meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1.2.b=
b
> index 8f382c99b4..f070d79d2b 100644
> --- a/meta-python/recipes-devtools/python/
> python3-keras-preprocessing_1.1.2.bb
> +++ b/meta-python/recipes-devtools/python/
> python3-keras-preprocessing_1.1.2.bb
> @@ -9,7 +9,6 @@ inherit pypi setuptools3
>  SRC_URI[sha256sum] =3D
> "add82567c50c8bc648c14195bf544a5ce7c1f76761536956c3d2978970179ef3"
>
>  PYPI_PACKAGE =3D "Keras_Preprocessing"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  BBCLASSEXTEND =3D "native"
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-lazy-object-proxy_1.12.0.bb b/meta-python/recipes-devtools/python=
/
> python3-lazy-object-proxy_1.12.0.bb
> index 9ba6ef8b15..acd84efd21 100644
> --- a/meta-python/recipes-devtools/python/
> python3-lazy-object-proxy_1.12.0.bb
> +++ b/meta-python/recipes-devtools/python/
> python3-lazy-object-proxy_1.12.0.bb
> @@ -9,7 +9,6 @@ DEPENDS +=3D "python3-setuptools-scm-native"
>  SRC_URI[sha256sum] =3D
> "1f5a462d92fd0cfb82f1fab28b51bfb209fabbe6aabf7f0d51472c0c124c0c61"
>
>  PYPI_PACKAGE =3D "lazy_object_proxy"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi python_setuptools_build_meta
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-luma-core_2.4.2.bb b/meta-python/recipes-devtools/python/
> python3-luma-core_2.4.2.bb
> index 1d37cd7187..e19ad56219 100644
> --- a/meta-python/recipes-devtools/python/python3-luma-core_2.4.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-luma-core_2.4.2.bb
> @@ -11,7 +11,6 @@ DEPENDS +=3D "python3-wheel-native"
>  SRC_URI[sha256sum] =3D
> "963c264164d4374f549d57db09599e0ca458cea1bd05e16939897619be4e6dbd"
>
>  PYPI_PACKAGE =3D "luma.core"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  RDEPENDS:${PN} +=3D " \
>         python3-pillow \
> diff --git a/meta-python/recipes-devtools/python/
> python3-luma-oled_3.15.0.bb b/meta-python/recipes-devtools/python/
> python3-luma-oled_3.15.0.bb
> index df30667775..2d0d88d7b9 100644
> --- a/meta-python/recipes-devtools/python/python3-luma-oled_3.15.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-luma-oled_3.15.0.bb
> @@ -13,7 +13,6 @@ DEPENDS +=3D "python3-wheel-native"
>  SRC_URI[sha256sum] =3D
> "16925fe668f484803df0683add800b19e5dd7316a1d64eb06ec2ae817473901e"
>
>  PYPI_PACKAGE =3D "luma_oled"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  RDEPENDS:${PN} +=3D " \
>         python3-luma-core \
> diff --git a/meta-python/recipes-devtools/python/
> python3-matplotlib-inline_0.2.2.bb b/meta-python/recipes-devtools/python/
> python3-matplotlib-inline_0.2.2.bb
> index b80fc10030..bc515c7b4a 100644
> --- a/meta-python/recipes-devtools/python/
> python3-matplotlib-inline_0.2.2.bb
> +++ b/meta-python/recipes-devtools/python/
> python3-matplotlib-inline_0.2.2.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Dd4692a0eb42ca54892399db2cb35e61e"
>  SRC_URI[sha256sum] =3D
> "72f3fe8fce36b70d4a5b612f899090cd0401deddc4ea90e1572b9f4bfb058c79"
>
>  PYPI_PACKAGE =3D "matplotlib_inline"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi python_flit_core
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-mypy-extensions_1.1.0.bb b/meta-python/recipes-devtools/python/
> python3-mypy-extensions_1.1.0.bb
> index baa76aa60c..33a1551e66 100644
> --- a/meta-python/recipes-devtools/python/python3-mypy-extensions_1.1.0.b=
b
> +++ b/meta-python/recipes-devtools/python/python3-mypy-extensions_1.1.0.b=
b
> @@ -4,7 +4,6 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0fe3219e2470a78c0d1837019b8b4=
26e"
>
>  PYPI_PACKAGE =3D "mypy_extensions"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi python_flit_core
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-ninja-syntax_1.7.2.bb b/meta-python/recipes-devtools/python/
> python3-ninja-syntax_1.7.2.bb
> index 7e389a5772..e483b98907 100644
> --- a/meta-python/recipes-devtools/python/python3-ninja-syntax_1.7.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-ninja-syntax_1.7.2.bb
> @@ -8,6 +8,5 @@ SRC_URI[sha256sum] =3D
> "342dc97b9e88a6495bae22953ee6063f91d2f03db6f727b62ba5c3092a
>  inherit pypi setuptools3
>
>  PYPI_PACKAGE =3D "ninja_syntax"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/
> python3-parse-type_0.6.6.bb b/meta-python/recipes-devtools/python/
> python3-parse-type_0.6.6.bb
> index 0cffff3e82..979e25b47b 100644
> --- a/meta-python/recipes-devtools/python/python3-parse-type_0.6.6.bb
> +++ b/meta-python/recipes-devtools/python/python3-parse-type_0.6.6.bb
> @@ -9,7 +9,6 @@ SRC_URI +=3D " \
>  "
>
>  PYPI_PACKAGE =3D "parse_type"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi ptest python_setuptools_build_meta
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-pastedeploy_3.1.0.bb b/meta-python/recipes-devtools/python/
> python3-pastedeploy_3.1.0.bb
> index 1f6b36bd2b..e3405939c7 100644
> --- a/meta-python/recipes-devtools/python/python3-pastedeploy_3.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pastedeploy_3.1.0.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D
> "file://license.txt;md5=3D1798f29d55080c60365e6283cb49779c"
>  inherit pypi python_setuptools_build_meta
>
>  PYPI_PACKAGE =3D "PasteDeploy"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  SRC_URI[sha256sum] =3D
> "9ddbaf152f8095438a9fe81f82c78a6714b92ae8e066bed418b6a7ff6a095a95"
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-posix-ipc_1.3.2.bb b/meta-python/recipes-devtools/python/
> python3-posix-ipc_1.3.2.bb
> index 3431e6c7aa..0660bb4ba8 100644
> --- a/meta-python/recipes-devtools/python/python3-posix-ipc_1.3.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-posix-ipc_1.3.2.bb
> @@ -5,7 +5,6 @@ LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De3d8df223c2614dbf1aabdc1ca23c=
c10"
>
>  PYPI_PACKAGE =3D "posix_ipc"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  SRC_URI[sha256sum] =3D
> "6923232111329954a8349f7d99f212b6e96b5206e77fbd39aaf1b3cb4a5e9260"
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-pure-eval_0.2.3.bb b/meta-python/recipes-devtools/python/
> python3-pure-eval_0.2.3.bb
> index 5dbc8b203a..27a6a34f00 100644
> --- a/meta-python/recipes-devtools/python/python3-pure-eval_0.2.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-pure-eval_0.2.3.bb
> @@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3Da3d6c15f7859ae235a78f2758e5a48cf"
>  DEPENDS =3D "python3-setuptools-scm-native"
>
>  PYPI_PACKAGE =3D "pure_eval"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi python_setuptools_build_meta
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-pyasn1-modules_0.4.2.bb b/meta-python/recipes-devtools/python/
> python3-pyasn1-modules_0.4.2.bb
> index e21bf4427f..3b3bc799a6 100644
> --- a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.2.bb
> @@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D190f79253908c986e6cacf380c3a5f6d"
>  SRC_URI[sha256sum] =3D
> "677091de870a80aae844b1ca6134f54652fa2c8c5a52aa396440ac3106e941e6"
>
>  PYPI_PACKAGE =3D "pyasn1_modules"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi ptest-python-pytest python_setuptools_build_meta
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyaudio_0.2.14.b=
b
> b/meta-python/recipes-devtools/python/python3-pyaudio_0.2.14.bb
> index 4a80f66fd8..80c04d63e5 100644
> --- a/meta-python/recipes-devtools/python/python3-pyaudio_0.2.14.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyaudio_0.2.14.bb
> @@ -4,7 +4,6 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D7c3152b432b96d6dc4a1cb35397da9ec"
>
>  PYPI_PACKAGE =3D "PyAudio"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  SRC_URI[sha256sum] =3D
> "78dfff3879b4994d1f4fc6485646a57755c6ee3c19647a491f790a0895bd2f87"
>
> diff --git a/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
> b/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
> index 8887ab27d2..188700be29 100644
> --- a/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
> +++ b/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
> @@ -12,7 +12,6 @@ SRC_URI +=3D
> "file://0001-Use-Py_ssize_t-when-parsing-buffer-length-fix-426-42.pat
>  SRC_URI[sha256sum] =3D
> "c8f04d2e78951eaa9de486b4d49381704e8943d0a6e6e58f55fcd7b8582e90de"
>
>  PYPI_PACKAGE =3D "PyBluez"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi setuptools3
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-pydantic-core_2.46.4.bb b/meta-python/recipes-devtools/python/
> python3-pydantic-core_2.46.4.bb
> index 9bfbb701e4..bc9f0e2ad3 100644
> --- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.46.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.46.4.bb
> @@ -123,7 +123,6 @@ DEPENDS =3D "python3-maturin-native
> python3-typing-extensions"
>  inherit pypi cargo-update-recipe-crates python_maturin ptest-python-pyte=
st
>
>  PYPI_PACKAGE =3D "pydantic_core"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  RDEPENDS:${PN} +=3D " \
>      python3-compression \
> diff --git a/meta-python/recipes-devtools/python/
> python3-pyfirmata_1.1.0.bb b/meta-python/recipes-devtools/python/
> python3-pyfirmata_1.1.0.bb
> index f57ea97fc5..7ec799e086 100644
> --- a/meta-python/recipes-devtools/python/python3-pyfirmata_1.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyfirmata_1.1.0.bb
> @@ -3,7 +3,6 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D84ddcef430b7c44caa22b2ff4b37a=
3df"
>
>  PYPI_PACKAGE =3D "pyFirmata"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  RDEPENDS:${PN} =3D "\
>      python3-pyserial \
> diff --git a/meta-python/recipes-devtools/python/python3-pylyrics_1.1.0.b=
b
> b/meta-python/recipes-devtools/python/python3-pylyrics_1.1.0.bb
> index 8c7b1c0f72..49f4f7da8b 100644
> --- a/meta-python/recipes-devtools/python/python3-pylyrics_1.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pylyrics_1.1.0.bb
> @@ -7,7 +7,6 @@ SRC_URI[sha256sum] =3D
> "c5f36e8ef0ed3b487a9242ce34c19f9684e418a5bbffd5d367dc1d1604
>
>  PYPI_PACKAGE =3D "PyLyrics"
>  PYPI_PACKAGE_EXT =3D "zip"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi setuptools3
>
> diff --git a/meta-python/recipes-devtools/python/python3-pymysql_1.2.0.bb
> b/meta-python/recipes-devtools/python/python3-pymysql_1.2.0.bb
> index 190c80d88f..d062ebe561 100644
> --- a/meta-python/recipes-devtools/python/python3-pymysql_1.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pymysql_1.2.0.bb
> @@ -11,7 +11,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D528175c84163bb800d23ad835c7fa0fc"
>  SRC_URI[sha256sum] =3D
> "6c7b17ca686988104d7426c27895b455cdeea3e9d3ceb1270f0c3704fead8c33"
>
>  PYPI_PACKAGE =3D "pymysql"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi python_setuptools_build_meta
>
> diff --git a/meta-python/recipes-devtools/python/python3-pynacl_1.6.2.bb
> b/meta-python/recipes-devtools/python/python3-pynacl_1.6.2.bb
> index d72d2be2f1..cc945666a1 100644
> --- a/meta-python/recipes-devtools/python/python3-pynacl_1.6.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-pynacl_1.6.2.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D8cc789b082b3d97e1ccc5261f8594d3f"
>  SRC_URI[sha256sum] =3D
> "018494d6d696ae03c7e656e5e74cdfd8ea1326962cc401bcf018f1ed8436811c"
>
>  PYPI_PACKAGE =3D "pynacl"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi python_setuptools_build_meta
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-pyproject-api_1.11.0.bb b/meta-python/recipes-devtools/python/
> python3-pyproject-api_1.11.0.bb
> index 4df56aa8df..d0e3c90ac8 100644
> --- a/meta-python/recipes-devtools/python/python3-pyproject-api_1.11.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyproject-api_1.11.0.bb
> @@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D11610a9d8fd95649cf8159be12b98cb7"
>  SRC_URI[sha256sum] =3D
> "b8807d85a293e6c9f133e6575946fed45f1d42b22d58c780b33aa2421a799549"
>
>  PYPI_PACKAGE =3D "pyproject_api"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  BBCLASSEXTEND =3D "native nativesdk"
>  inherit pypi python_hatchling
> diff --git a/meta-python/recipes-devtools/python/
> python3-pytest-asyncio_1.4.0.bb b/meta-python/recipes-devtools/python/
> python3-pytest-asyncio_1.4.0.bb
> index 7f237932a7..ad3b2e2d2b 100644
> --- a/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.4.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.4.0.bb
> @@ -8,7 +8,6 @@ SRC_URI[sha256sum] =3D
> "c6c0d2259945122819f171a32ecea2c349ead889ee28176caaf4921434
>  inherit pypi python_setuptools_build_meta
>
>  PYPI_PACKAGE =3D "pytest_asyncio"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  DEPENDS +=3D "python3-setuptools-scm-native"
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-pytest-codspeed_5.0.3.bb b/meta-python/recipes-devtools/python/
> python3-pytest-codspeed_5.0.3.bb
> index a1691024ad..9ed6659a77 100644
> --- a/meta-python/recipes-devtools/python/python3-pytest-codspeed_5.0.3.b=
b
> +++ b/meta-python/recipes-devtools/python/python3-pytest-codspeed_5.0.3.b=
b
> @@ -9,6 +9,5 @@ SRC_URI[sha256sum] =3D
> "91afef90e6a96b013495e4702ef5d6358614a449e71008cdc194ef6687
>  inherit pypi python_setuptools_build_meta
>
>  PYPI_PACKAGE =3D "pytest_codspeed"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  RDEPENDS:${PN} =3D "python3-cffi python3-filelock python3-pytest
> python3-rich python3-statistics"
> diff --git a/meta-python/recipes-devtools/python/
> python3-pytest-cov_7.1.0.bb b/meta-python/recipes-devtools/python/
> python3-pytest-cov_7.1.0.bb
> index 5e76726909..7673a8c569 100644
> --- a/meta-python/recipes-devtools/python/python3-pytest-cov_7.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pytest-cov_7.1.0.bb
> @@ -13,6 +13,5 @@ DEPENDS +=3D "python3-setuptools-scm-native
> python3-hatch-fancy-pypi-readme-native
>  RDEPENDS:${PN} +=3D "python3-coverage python3-pytest python3-pluggy"
>
>  PYPI_PACKAGE =3D "pytest_cov"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/
> python3-pytest-env_1.7.0.bb b/meta-python/recipes-devtools/python/
> python3-pytest-env_1.7.0.bb
> index 3ffe73b864..86fd2c9418 100644
> --- a/meta-python/recipes-devtools/python/python3-pytest-env_1.7.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pytest-env_1.7.0.bb
> @@ -10,7 +10,6 @@ SRC_URI[sha256sum] =3D
> "0c1dc1101fb8d3ab3611e8f8d657ba06c3c0c167fc85c90457e5b27f25
>  inherit pypi python_hatchling ptest-python-pytest
>
>  PYPI_PACKAGE =3D "pytest_env"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  RDEPENDS:${PN} =3D "python3-pytest python3-tomli"
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-pytest-freezer_0.4.9.bb b/meta-python/recipes-devtools/python/
> python3-pytest-freezer_0.4.9.bb
> index 212be0ef8b..cd09a5c325 100644
> --- a/meta-python/recipes-devtools/python/python3-pytest-freezer_0.4.9.bb
> +++ b/meta-python/recipes-devtools/python/python3-pytest-freezer_0.4.9.bb
> @@ -13,4 +13,3 @@ RDEPENDS:${PN} =3D "\
>  "
>
>  PYPI_PACKAGE =3D "pytest_freezer"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
> diff --git a/meta-python/recipes-devtools/python/
> python3-pytest-html_4.2.0.bb b/meta-python/recipes-devtools/python/
> python3-pytest-html_4.2.0.bb
> index ea760ff29a..0889417ad0 100644
> --- a/meta-python/recipes-devtools/python/python3-pytest-html_4.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pytest-html_4.2.0.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D5d425c8f3157dbf212db2ec53d9e5132"
>  SRC_URI[sha256sum] =3D
> "b6a88cba507500d8709959201e2e757d3941e859fd17cfd4ed87b16fc0c67912"
>
>  PYPI_PACKAGE =3D "pytest_html"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi python_hatchling
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-pytest-httpx_0.36.2.bb b/meta-python/recipes-devtools/python/
> python3-pytest-httpx_0.36.2.bb
> index ac1a53d224..2309a96fa5 100644
> --- a/meta-python/recipes-devtools/python/python3-pytest-httpx_0.36.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-pytest-httpx_0.36.2.bb
> @@ -21,4 +21,3 @@ RDEPENDS:${PN}-ptest +=3D "\
>  "
>
>  PYPI_PACKAGE =3D "pytest_httpx"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
> diff --git a/meta-python/recipes-devtools/python/
> python3-pytest-lazy-fixtures_1.1.4.bb
> b/meta-python/recipes-devtools/python/
> python3-pytest-lazy-fixtures_1.1.4.bb
> index 83b8321df2..64aa5d3ce1 100644
> --- a/meta-python/recipes-devtools/python/
> python3-pytest-lazy-fixtures_1.1.4.bb
> +++ b/meta-python/recipes-devtools/python/
> python3-pytest-lazy-fixtures_1.1.4.bb
> @@ -17,6 +17,5 @@ SRC_URI[sha256sum] =3D
> "c494b52d798890033d64b28687a4d52807c8b0f606d56316e139df0cbe
>  inherit pypi python_poetry_core
>
>  PYPI_PACKAGE =3D "pytest_lazy_fixtures"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  RDEPENDS:${PN} =3D "python3-pytest"
> diff --git a/meta-python/recipes-devtools/python/
> python3-pytest-mock_3.15.1.bb b/meta-python/recipes-devtools/python/
> python3-pytest-mock_3.15.1.bb
> index 835ff0ab3a..5ed97e436d 100644
> --- a/meta-python/recipes-devtools/python/python3-pytest-mock_3.15.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pytest-mock_3.15.1.bb
> @@ -13,7 +13,6 @@ SRC_URI[sha256sum] =3D
> "1849a238f6f396da19762269de72cb1814ab44416fa73a8686deac10b0
>  inherit pypi python_setuptools_build_meta ptest
>
>  PYPI_PACKAGE =3D "pytest_mock"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  DEPENDS +=3D "python3-setuptools-scm-native"
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-pytest-picked_0.5.1.bb b/meta-python/recipes-devtools/python/
> python3-pytest-picked_0.5.1.bb
> index c7c2183337..449af2623e 100644
> --- a/meta-python/recipes-devtools/python/python3-pytest-picked_0.5.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pytest-picked_0.5.1.bb
> @@ -17,4 +17,3 @@ RDEPENDS:${PN} +=3D "\
>  "
>
>  PYPI_PACKAGE =3D "pytest_picked"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
> diff --git a/meta-python/recipes-devtools/python/
> python3-pytest-socket_0.7.0.bb b/meta-python/recipes-devtools/python/
> python3-pytest-socket_0.7.0.bb
> index feb2f6fbb5..86b03724a0 100644
> --- a/meta-python/recipes-devtools/python/python3-pytest-socket_0.7.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pytest-socket_0.7.0.bb
> @@ -12,4 +12,3 @@ RDEPENDS:${PN} =3D "python3-pytest"
>  BBCLASSEXTEND =3D "native nativesdk"
>
>  PYPI_PACKAGE =3D "pytest_socket"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
> diff --git a/meta-python/recipes-devtools/python/
> python3-pytest-timeout_2.5.0.bb b/meta-python/recipes-devtools/python/
> python3-pytest-timeout_2.5.0.bb
> index 40c0a2085a..8990e29bba 100644
> --- a/meta-python/recipes-devtools/python/python3-pytest-timeout_2.5.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pytest-timeout_2.5.0.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Dd8048cd156eda3df2e7f111b0ae9ceff"
>  SRC_URI[sha256sum] =3D
> "68c9d82dfe95fa65712e107010c9344e7d8b4afe8c975a7be0d273d939583a93"
>
>  PYPI_PACKAGE =3D "pytest_timeout"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi python_setuptools_build_meta
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-pytest-xdist_3.8.0.bb b/meta-python/recipes-devtools/python/
> python3-pytest-xdist_3.8.0.bb
> index 3527539f6f..7b340e8920 100644
> --- a/meta-python/recipes-devtools/python/python3-pytest-xdist_3.8.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pytest-xdist_3.8.0.bb
> @@ -15,4 +15,3 @@ RDEPENDS:${PN} +=3D " \
>  "
>
>  PYPI_PACKAGE =3D "pytest_xdist"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
> diff --git a/meta-python/recipes-devtools/python/
> python3-python-dotenv_1.2.1.bb b/meta-python/recipes-devtools/python/
> python3-python-dotenv_1.2.1.bb
> index 22b976dd9c..b16d3c766b 100644
> --- a/meta-python/recipes-devtools/python/python3-python-dotenv_1.2.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-python-dotenv_1.2.1.bb
> @@ -16,7 +16,6 @@ PACKAGECONFIG:append =3D
> "${@bb.utils.contains('PTEST_ENABLED', '1', ' cli', '', d
>  PACKAGECONFIG[cli] =3D ",,,python3-click"
>
>  PYPI_PACKAGE =3D "python_dotenv"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  RDEPENDS:${PN}-ptest +=3D "\
>      coreutils \
> diff --git a/meta-python/recipes-devtools/python/
> python3-python-multipart_0.0.32.bb b/meta-python/recipes-devtools/python/
> python3-python-multipart_0.0.32.bb
> index 9b73b9470d..db1a9e0415 100644
> --- a/meta-python/recipes-devtools/python/
> python3-python-multipart_0.0.32.bb
> +++ b/meta-python/recipes-devtools/python/
> python3-python-multipart_0.0.32.bb
> @@ -7,7 +7,6 @@ SRC_URI[sha256sum] =3D
> "be54b7f3fa167bb83e4fcd936b887b708f4e57fe75911c02aebf53efaf
>  inherit pypi python_hatchling ptest-python-pytest
>
>  PYPI_PACKAGE =3D "python_multipart"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>  CVE_PRODUCT =3D "python-multipart"
>
>  RDEPENDS:${PN}-ptest +=3D " \
> diff --git a/meta-python/recipes-devtools/python/
> python3-requests-file_3.0.1.bb b/meta-python/recipes-devtools/python/
> python3-requests-file_3.0.1.bb
> index f796c8ef78..16f04a4cad 100644
> --- a/meta-python/recipes-devtools/python/python3-requests-file_3.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-requests-file_3.0.1.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D9cc728d6087e43796227b0a31422de6b"
>  SRC_URI[sha256sum] =3D
> "f14243d7796c588f3521bd423c5dea2ee4cc730e54a3cac9574d78aca1272576"
>
>  PYPI_PACKAGE =3D "requests_file"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi python_setuptools_build_meta ptest-python-pytest
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-rfc3986-validator_0.1.1.bb b/meta-python/recipes-devtools/python/
> python3-rfc3986-validator_0.1.1.bb
> index 9ebc34eabc..28904ef18d 100644
> --- a/meta-python/recipes-devtools/python/
> python3-rfc3986-validator_0.1.1.bb
> +++ b/meta-python/recipes-devtools/python/
> python3-rfc3986-validator_0.1.1.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Da21b13b5a996f08f7e0b088aa38ce9c6"
>  SRC_URI[sha256sum] =3D
> "3d44bde7921b3b9ec3ae4e3adca370438eccebc676456449b145d533b240d055"
>
>  PYPI_PACKAGE =3D "rfc3986_validator"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi setuptools3
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-rich-argparse_1.8.0.bb b/meta-python/recipes-devtools/python/
> python3-rich-argparse_1.8.0.bb
> index 2da95ab053..fa9761b72b 100644
> --- a/meta-python/recipes-devtools/python/python3-rich-argparse_1.8.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-rich-argparse_1.8.0.bb
> @@ -4,7 +4,6 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D06f5c372171ce02f7e6a18f5f57f0=
b69"
>
>  PYPI_PACKAGE =3D "rich_argparse"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  SRC_URI[sha256sum] =3D
> "679df3d832fa94ad6e4bdb07ded088cd7ea2dddc58ae9b2b46346a40b06cbc0c"
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-scikit-build-core_1.0.3.bb b/meta-python/recipes-devtools/python/
> python3-scikit-build-core_1.0.3.bb
> index 4a28b119b4..ff5e4c0da0 100644
> --- a/meta-python/recipes-devtools/python/
> python3-scikit-build-core_1.0.3.bb
> +++ b/meta-python/recipes-devtools/python/
> python3-scikit-build-core_1.0.3.bb
> @@ -3,7 +3,6 @@ LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b4e748e5f102e31c9390dcd6fa66=
f09"
>
>  PYPI_PACKAGE =3D "scikit_build_core"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  DEPENDS =3D "python3-hatch-vcs-native"
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-scikit-build_0.19.1.bb b/meta-python/recipes-devtools/python/
> python3-scikit-build_0.19.1.bb
> index aff4ba4b68..f10e27a049 100644
> --- a/meta-python/recipes-devtools/python/python3-scikit-build_0.19.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-scikit-build_0.19.1.bb
> @@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D7c96d2b08b3cec6d3c67fb864d1fd8cc"
>  DEPENDS =3D "python3-hatch-vcs-native
> python3-hatch-fancy-pypi-readme-native"
>
>  PYPI_PACKAGE =3D "scikit_build"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi python_hatchling
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-service-identity_26.1.0.bb b/meta-python/recipes-devtools/python/
> python3-service-identity_26.1.0.bb
> index ed855c4027..a603cb247b 100644
> --- a/meta-python/recipes-devtools/python/
> python3-service-identity_26.1.0.bb
> +++ b/meta-python/recipes-devtools/python/
> python3-service-identity_26.1.0.bb
> @@ -9,7 +9,6 @@ SRC_URI[sha256sum] =3D
> "6358c52882c96e66ac4a55eb3a72c7dd4a70763f8cc6fa4e70abde2656
>  inherit pypi python_hatchling ptest-python-pytest
>
>  PYPI_PACKAGE =3D "service_identity"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  DEPENDS +=3D "python3-hatch-vcs-native
> python3-hatch-fancy-pypi-readme-native"
>
> diff --git a/meta-python/recipes-devtools/python/python3-sijax_0.3.2.bb
> b/meta-python/recipes-devtools/python/python3-sijax_0.3.2.bb
> index 4d21650059..dcb9e64d61 100644
> --- a/meta-python/recipes-devtools/python/python3-sijax_0.3.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-sijax_0.3.2.bb
> @@ -7,6 +7,5 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D16e213d75641a392478df50cf0841903"
>  SRC_URI[sha256sum] =3D
> "11b062f4a8b2aad95c87e7c09e5daf5a6b0d0f08abf9efe5f91a0075c6be7c0d"
>
>  PYPI_PACKAGE =3D "Sijax"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi setuptools3
> diff --git a/meta-python/recipes-devtools/python/
> python3-stack-data_0.6.3.bb b/meta-python/recipes-devtools/python/
> python3-stack-data_0.6.3.bb
> index 8adba7e8a4..c5667d34b7 100644
> --- a/meta-python/recipes-devtools/python/python3-stack-data_0.6.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-stack-data_0.6.3.bb
> @@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3Da3d6c15f7859ae235a78f2758e5a48cf"
>  DEPENDS =3D "python3-setuptools-scm-native"
>
>  PYPI_PACKAGE =3D "stack_data"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi python_setuptools_build_meta
>
> diff --git a/meta-python/recipes-devtools/python/python3-strenum_0.4.15.b=
b
> b/meta-python/recipes-devtools/python/python3-strenum_0.4.15.bb
> index abe5c03d8e..cbe7fcc215 100644
> --- a/meta-python/recipes-devtools/python/python3-strenum_0.4.15.bb
> +++ b/meta-python/recipes-devtools/python/python3-strenum_0.4.15.bb
> @@ -10,6 +10,5 @@ DEPENDS =3D "python3-pytest-runner-native"
>  SRC_URI[sha256sum] =3D
> "878fb5ab705442070e4dd1929bb5e2249511c0bcf2b0eeacf3bcd80875c82eff"
>
>  PYPI_PACKAGE =3D "StrEnum"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi python_setuptools_build_meta
> diff --git a/meta-python/recipes-devtools/python/
> python3-time-machine_3.2.0.bb b/meta-python/recipes-devtools/python/
> python3-time-machine_3.2.0.bb
> index e898a43f99..450214a7a4 100644
> --- a/meta-python/recipes-devtools/python/python3-time-machine_3.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-time-machine_3.2.0.bb
> @@ -9,7 +9,6 @@ PYPI_SRC_URI =3D "git://
> github.com/adamchainz/time-machine;protocol=3Dhttps;branch=3Dm
>  inherit pypi python_setuptools_build_meta ptest-python-pytest
>
>  PYPI_PACKAGE =3D "time_machine"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  RDEPENDS:${PN} +=3D "\
>      python3-tzdata \
> diff --git a/meta-python/recipes-devtools/python/
> python3-tokenize-rt_6.2.0.bb b/meta-python/recipes-devtools/python/
> python3-tokenize-rt_6.2.0.bb
> index 0f5a1b34d3..ec80ef8ed6 100644
> --- a/meta-python/recipes-devtools/python/python3-tokenize-rt_6.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-tokenize-rt_6.2.0.bb
> @@ -11,7 +11,6 @@ inherit pypi setuptools3 ptest-python-pytest
>  RDEPENDS:${PN} +=3D "python3-core"
>
>  PYPI_PACKAGE =3D "tokenize_rt"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  do_install_ptest:append() {
>      install -d ${D}${PTEST_PATH}/testing/resources
> diff --git a/meta-python/recipes-devtools/python/
> python3-types-psutil_7.2.2.20260518.bb
> b/meta-python/recipes-devtools/python/
> python3-types-psutil_7.2.2.20260518.bb
> index ba8051ce5c..f7f3f8e758 100644
> --- a/meta-python/recipes-devtools/python/
> python3-types-psutil_7.2.2.20260518.bb
> +++ b/meta-python/recipes-devtools/python/
> python3-types-psutil_7.2.2.20260518.bb
> @@ -4,7 +4,6 @@ LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dec038232ab86edd7354b091c54e19=
0e2"
>
>  PYPI_PACKAGE =3D "types_psutil"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi python_setuptools_build_meta
>
> diff --git a/meta-python/recipes-devtools/python/python3-wand_0.7.2.bb
> b/meta-python/recipes-devtools/python/python3-wand_0.7.2.bb
> index 305aeaeb11..2eeb2cb9f9 100644
> --- a/meta-python/recipes-devtools/python/python3-wand_0.7.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-wand_0.7.2.bb
> @@ -11,7 +11,6 @@ SRC_URI[sha256sum] =3D
> "0387fd08848d00cadd1d885fcb19a17dd4250df2029e5338b6b668b7fe
>  inherit pypi python_setuptools_build_meta ptest
>
>  PYPI_PACKAGE =3D "wand"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  FILES:${PN}-doc +=3D "${datadir}/README.rst"
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-wheezy-template_3.2.5.bb b/meta-python/recipes-devtools/python/
> python3-wheezy-template_3.2.5.bb
> index 612b3ff106..fab0d5106a 100644
> --- a/meta-python/recipes-devtools/python/python3-wheezy-template_3.2.5.b=
b
> +++ b/meta-python/recipes-devtools/python/python3-wheezy-template_3.2.5.b=
b
> @@ -4,7 +4,6 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfa10554c46b94944529c6a886cf85=
631"
>
>  PYPI_PACKAGE =3D "wheezy_template"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  SRC_URI[sha256sum] =3D
> "c7c0bf85af0f70ca2ef4b6ea9a74ef372f73392aa17bea0d885dcba7356d0867"
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-wpa-supplicant_0.2.bb b/meta-python/recipes-devtools/python/
> python3-wpa-supplicant_0.2.bb
> index 68ff6c1863..17149bbadb 100644
> --- a/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb
> @@ -9,7 +9,6 @@ SRC_URI[sha256sum] =3D
> "3ad0f40a696763bb0f4d4dec5b51f6b53ccfeb7c16ebb5897349303045
>  SRC_URI +=3D
> "file://0001-cli-drop-the-second-argument-from-click.argument-dec.patch"
>
>  PYPI_PACKAGE =3D "wpa_supplicant"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi setuptools3
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-xlsxwriter_3.2.1.bb b/meta-python/recipes-devtools/python/
> python3-xlsxwriter_3.2.1.bb
> index a1fd09af49..eccdc83ca2 100644
> --- a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.2.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.2.1.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3Da4bab8df34a9a138b4e0ca56b8559a05"
>  inherit pypi setuptools3
>
>  PYPI_PACKAGE =3D "XlsxWriter"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  RDEPENDS:${PN} +=3D " \
>         python3-crypt \
> diff --git a/meta-python/recipes-devtools/python/
> python3-xstatic-font-awesome_6.2.1.2.bb
> b/meta-python/recipes-devtools/python/
> python3-xstatic-font-awesome_6.2.1.2.bb
> index b8c02dc40b..97e6dcd66f 100644
> --- a/meta-python/recipes-devtools/python/
> python3-xstatic-font-awesome_6.2.1.2.bb
> +++ b/meta-python/recipes-devtools/python/
> python3-xstatic-font-awesome_6.2.1.2.bb
> @@ -5,7 +5,6 @@ LICENSE =3D "CC-BY-4.0 AND MIT AND OFL-1.0"
>  LIC_FILES_CHKSUM =3D
> "file://xstatic/pkg/font_awesome/data/LICENSE.txt;md5=3D57f9201afe70f8779=
88912a7b233de47"
>
>  PYPI_PACKAGE =3D "xstatic_font_awesome"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  SRC_URI[sha256sum] =3D
> "9f3cb2f038fad7d352722375d3f25af346da9ee093ed9dc2c8c46bd911ab1971"
>
> diff --git a/meta-python/recipes-devtools/python/python3-xstatic_1.0.3.bb
> b/meta-python/recipes-devtools/python/python3-xstatic_1.0.3.bb
> index bf542aba5a..ed73aa48b0 100644
> --- a/meta-python/recipes-devtools/python/python3-xstatic_1.0.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-xstatic_1.0.3.bb
> @@ -5,7 +5,6 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D
> "file://README.txt;md5=3D1418684272f85f400cebf1b1a255c5cd"
>
>  PYPI_PACKAGE =3D "XStatic"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  SRC_URI +=3D "file://0001-remove-pkg_resources-import.patch"
>  SRC_URI[sha256sum] =3D
> "402544cc9e179489441054f09c807804e115ea246907de87c0355fb4f5a31268"
> diff --git a/meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb
> b/meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb
> index f03ab22d24..4d914c63e9 100644
> --- a/meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb
> @@ -6,6 +6,5 @@ LIC_FILES_CHKSUM =3D
> "file://PKG-INFO;beginline=3D8;endline=3D8;md5=3D72092419572155ddc2
>  SRC_URI[sha256sum] =3D
> "bac440d8d9891b4068e2b5a2c5e2c9765a9df762944bda6955f96bb9b91e67cd"
>
>  PYPI_PACKAGE =3D "zope.event"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi setuptools3
> diff --git a/meta-python/recipes-devtools/python/
> python3-zopeinterface_8.6.bb b/meta-python/recipes-devtools/python/
> python3-zopeinterface_8.6.bb
> index f79444c7ba..370e07889f 100644
> --- a/meta-python/recipes-devtools/python/python3-zopeinterface_8.6.bb
> +++ b/meta-python/recipes-devtools/python/python3-zopeinterface_8.6.bb
> @@ -3,7 +3,6 @@ LICENSE =3D "ZPL-2.1"
>  LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D78ccb3640dc841e1baecb3e27a6966b2"
>
>  PYPI_PACKAGE =3D "zope_interface"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  inherit pypi python_setuptools_build_meta
>
> diff --git a/meta-python/recipes-devtools/python3-rouge-score/
> python3-rouge-score_0.1.2.bb
> b/meta-python/recipes-devtools/python3-rouge-score/
> python3-rouge-score_0.1.2.bb
> index 6d07f5451f..722956a8e2 100644
> --- a/meta-python/recipes-devtools/python3-rouge-score/
> python3-rouge-score_0.1.2.bb
> +++ b/meta-python/recipes-devtools/python3-rouge-score/
> python3-rouge-score_0.1.2.bb
> @@ -15,6 +15,5 @@ RDEPENDS:${PN} =3D "\
>  inherit setuptools3 pypi
>
>  PYPI_PACKAGE =3D "rouge_score"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  SRC_URI[sha256sum] =3D
> "c7d4da2683e68c9abf0135ef915d63a46643666f848e558a1b9f7ead17ff0f04"
> diff --git a/meta-python/recipes-devtools/python3-wxgtk4/
> python3-wxgtk4_4.2.5.bb b/meta-python/recipes-devtools/python3-wxgtk4/
> python3-wxgtk4_4.2.5.bb
> index e1d8ed06e1..5305093b2f 100644
> --- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.5.bb
> +++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.5.bb
> @@ -9,7 +9,6 @@ DEPENDS =3D "python3-attrdict3-native python3-six-native
> wxwidgets-native \
>             "
>
>  PYPI_PACKAGE =3D "wxpython"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  SRC_URI +=3D "file://add-back-option-build-base.patch \
>             file://wxgtk-fixup-build-scripts.patch \
> diff --git a/meta-python/recipes-extended/python3-gpt-image/
> python3-gpt-image_0.9.1.bb
> b/meta-python/recipes-extended/python3-gpt-image/
> python3-gpt-image_0.9.1.bb
> index 4255de4199..b3c89e5588 100644
> --- a/meta-python/recipes-extended/python3-gpt-image/
> python3-gpt-image_0.9.1.bb
> +++ b/meta-python/recipes-extended/python3-gpt-image/
> python3-gpt-image_0.9.1.bb
> @@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Dd91d608dc8f12334a889700389229b7b"
>  DEPENDS +=3D "python3-pip"
>
>  PYPI_PACKAGE =3D "gpt_image"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  SRC_URI[sha256sum] =3D
> "07363562ec1cf5b50319ad0389486b576ed43c4682a16a8286822af9fd1f4594"
>
> diff --git a/meta-python/recipes-extended/send2trash/
> python3-send2trash_2.1.0.bb b/meta-python/recipes-extended/send2trash/
> python3-send2trash_2.1.0.bb
> index 147603a45b..746a41b2c4 100644
> --- a/meta-python/recipes-extended/send2trash/python3-send2trash_2.1.0.bb
> +++ b/meta-python/recipes-extended/send2trash/python3-send2trash_2.1.0.bb
> @@ -8,7 +8,6 @@ SRC_URI +=3D "file://run-ptest"
>  SRC_URI[sha256sum] =3D
> "1c72b39f09457db3c05ce1d19158c2cbef4c32b8bedd02c155e49282b7ea7459"
>
>  PYPI_PACKAGE =3D "send2trash"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  RDEPENDS:${PN} +=3D "\
>      python3-io \
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#129744):
> https://lists.openembedded.org/g/openembedded-devel/message/129744
> Mute This Topic: https://lists.openembedded.org/mt/121072317/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f43bea065a99f47a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ross<div><br></div><div>Good stuff, but can you rebase =
it on latest master/master-next and resend the set</div></div><br><div clas=
s=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_att=
r">On Thu, Sep 3, 2026 at 9:45=E2=80=AFAM Ross Burton via <a href=3D"http:/=
/lists.openembedded.org">lists.openembedded.org</a> &lt;ross.burton=3D<a hr=
ef=3D"mailto:arm.com@lists.openembedded.org">arm.com@lists.openembedded.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Remove redundant UPSTREAM_CHECK_PYPI_PACKAGE assignments of PYPI_PACKAGE,<b=
r>
which is the default value.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-connectivity/python-pyro5/<a href=3D"http://python3-pyro5=
_5.17.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyro5_5.17.bb</a>=C2=
=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-annotated-doc_0=
.0.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-annotated-doc_0.0.5.b=
b</a>=C2=A0 =C2=A0 =C2=A0 | 2 --<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-annotated-types=
_0.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-annotated-types_0.8=
.0.bb</a>=C2=A0 =C2=A0 | 2 --<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-apply-defaults_=
0.1.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-apply-defaults_0.1.6=
.bb</a>=C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-arpeggi=
o_2.0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-arpeggio_2.0.3.bb<=
/a>=C2=A0 =C2=A0| 1 -<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-brotli_=
1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-brotli_1.2.0.bb</a>=
=C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-cached-property=
_2.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-cached-property_2.0=
.1.bb</a>=C2=A0 =C2=A0 | 1 -<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-can_4.6=
.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-can_4.6.1.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-cerberu=
s_1.3.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-cerberus_1.3.8.bb<=
/a>=C2=A0 =C2=A0| 2 --<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-charset-normali=
zer_3.4.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-charset-normaliz=
er_3.4.9.bb</a> | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-cheetah_3.2.6.p=
ost1.bb" rel=3D"noreferrer" target=3D"_blank">python3-cheetah_3.2.6.post1.b=
b</a>=C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-configargparse_=
1.7.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-configargparse_1.7.5=
.bb</a>=C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-custom-inherit_=
2.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-custom-inherit_2.4.1=
.bb</a>=C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-dbus-fa=
st_4.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-dbus-fast_4.0.0.b=
b</a>=C2=A0 | 1 -<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-dbus-ne=
xt_0.2.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-dbus-next_0.2.3.b=
b</a>=C2=A0 | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-dirty-equals_0.=
11.bb" rel=3D"noreferrer" target=3D"_blank">python3-dirty-equals_0.11.bb</a=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-django-south_1.=
0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-django-south_1.0.2.bb<=
/a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0meta-python/recipes-devtools/python/python3-django.inc=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-dynamic-dispatc=
h_1.0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-dynamic-dispatch_1=
.0.3.bb</a>=C2=A0 =C2=A0| 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-email-validator=
_2.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-email-validator_2.3=
.0.bb</a>=C2=A0 =C2=A0 | 1 -<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-et-xmlf=
ile_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-et-xmlfile_2.0.0=
.bb</a> | 1 -<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-eth-abi=
_5.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-eth-abi_5.2.0.bb</a=
>=C2=A0 =C2=A0 | 1 -<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-eth-uti=
ls_6.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-eth-utils_6.0.0.b=
b</a>=C2=A0 | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-fastapi-cli_0.0=
.27.bb" rel=3D"noreferrer" target=3D"_blank">python3-fastapi-cli_0.0.27.bb<=
/a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 --<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-flask-babel_4.0=
.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-babel_4.0.0.bb</a=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-flask-bootstrap=
_3.3.7.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-bootstrap_3=
.3.7.1.bb</a>=C2=A0 | 1 -<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-c=
ors_6.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-cors_6.0.2=
.bb</a> | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-flask-httpauth_=
4.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-httpauth_4.8.0=
.bb</a>=C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-flask-jsonpify_=
1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-jsonpify_1.5.0=
.bb</a>=C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-flask-jwt-exten=
ded_4.7.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-jwt-extend=
ed_4.7.4.bb</a> | 1 -<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-j=
wt_0.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-jwt_0.3.2.b=
b</a>=C2=A0 | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-flask-limiter_4=
.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-limiter_4.1.1.b=
b</a>=C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-flask-login_0.6=
.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-login_0.6.3.bb</a=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-flask-mail_0.10=
.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-mail_0.10.0.bb</a=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-flask-marshmall=
ow_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-marshmallow=
_1.5.0.bb</a>=C2=A0 | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-flask-migrate_4=
.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-migrate_4.1.0.b=
b</a>=C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-flask-pymongo_3=
.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-pymongo_3.0.1.b=
b</a>=C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-flask-restful_0=
.3.10.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-restful_0.3.10=
.bb</a>=C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-flask-sijax_0.4=
.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-sijax_0.4.1.bb</a=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-flask-socketio_=
5.6.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-socketio_5.6.1=
.bb</a>=C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-flask-sqlalchem=
y_3.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-sqlalchemy_3=
.1.1.bb</a>=C2=A0 =C2=A0| 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-flask-uploads_0=
.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-uploads_0.2.1.b=
b</a>=C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-flask-user_0.6.=
19.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-user_0.6.19.bb</a=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0.../python/<a href=3D"http://python3-flask-versioned_0.9.4-20101221.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-flask-versioned_0.9.4-20101=
221.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-w=
tf_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-wtf_1.3.0.b=
b</a>=C2=A0 | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-flask-xstatic_0=
.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-xstatic_0.0.1.b=
b</a>=C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-google-auth_2.5=
6.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-google-auth_2.56.3.bb<=
/a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-grpcio-channelz=
_1.76.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-grpcio-channelz_1.=
76.0.bb</a>=C2=A0 =C2=A0| 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-grpcio-reflecti=
on_1.76.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-grpcio-reflectio=
n_1.76.0.bb</a> | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-grpcio-tools_1.=
76.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-grpcio-tools_1.76.0.b=
b</a>=C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0.../python/<a href=3D"http://python3-hatch-requirements-txt_0.4.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-hatch-requirements-txt_0.4.1.=
bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-icu_2.1=
6.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-icu_2.16.2.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-idna-ss=
l_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-idna-ssl_1.1.0.bb<=
/a>=C2=A0 =C2=A0| 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-importlib-metad=
ata_9.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-importlib-metada=
ta_9.0.0.bb</a> | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-inline-snapshot=
_0.35.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-inline-snapshot_0.=
35.4.bb</a>=C2=A0 =C2=A0| 1 -<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-inotify=
_0.2.12.bb" rel=3D"noreferrer" target=3D"_blank">python3-inotify_0.2.12.bb<=
/a>=C2=A0 =C2=A0| 1 -<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-ipy_1.0=
1.bb" rel=3D"noreferrer" target=3D"_blank">python3-ipy_1.01.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-ipython-genutil=
s_0.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-ipython-genutils_0=
.2.0.bb</a>=C2=A0 =C2=A0| 1 -<br>
=C2=A0.../python/<a href=3D"http://python3-keras-preprocessing_1.1.2.bb" re=
l=3D"noreferrer" target=3D"_blank">python3-keras-preprocessing_1.1.2.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-lazy-object-pro=
xy_1.12.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-lazy-object-prox=
y_1.12.0.bb</a> | 1 -<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-luma-co=
re_2.4.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-luma-core_2.4.2.b=
b</a>=C2=A0 | 1 -<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-luma-ol=
ed_3.15.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-luma-oled_3.15.0=
.bb</a> | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-matplotlib-inli=
ne_0.2.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-matplotlib-inline=
_0.2.2.bb</a>=C2=A0 | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-mypy-extensions=
_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-mypy-extensions_1.1=
.0.bb</a>=C2=A0 =C2=A0 | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-ninja-syntax_1.=
7.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-ninja-syntax_1.7.2.bb<=
/a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-parse-t=
ype_0.6.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-parse-type_0.6.6=
.bb</a> | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-pastedeploy_3.1=
.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pastedeploy_3.1.0.bb</a=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-posix-i=
pc_1.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-posix-ipc_1.3.2.b=
b</a>=C2=A0 | 1 -<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-pure-ev=
al_0.2.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pure-eval_0.2.3.b=
b</a>=C2=A0 | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-pyasn1-modules_=
0.4.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyasn1-modules_0.4.2=
.bb</a>=C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-pyaudio=
_0.2.14.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyaudio_0.2.14.bb<=
/a>=C2=A0 =C2=A0| 1 -<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-pybluez=
_0.23.bb" rel=3D"noreferrer" target=3D"_blank">python3-pybluez_0.23.bb</a>=
=C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-pydantic-core_2=
.46.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic-core_2.46.4=
.bb</a>=C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-pyfirma=
ta_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyfirmata_1.1.0.b=
b</a>=C2=A0 | 1 -<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-pylyric=
s_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pylyrics_1.1.0.bb<=
/a>=C2=A0 =C2=A0| 1 -<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-pymysql=
_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pymysql_1.2.0.bb</a=
>=C2=A0 =C2=A0 | 1 -<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-pynacl_=
1.6.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pynacl_1.6.2.bb</a>=
=C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-pyproject-api_1=
.11.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyproject-api_1.11.0=
.bb</a>=C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-pytest-asyncio_=
1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-asyncio_1.4.0=
.bb</a>=C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-pytest-codspeed=
_5.0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-codspeed_5.0=
.3.bb</a>=C2=A0 =C2=A0 | 1 -<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
cov_7.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-cov_7.1.0=
.bb</a> | 1 -<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
env_1.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-env_1.7.0=
.bb</a> | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-pytest-freezer_=
0.4.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-freezer_0.4.9=
.bb</a>=C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-pytest-html_4.2=
.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-html_4.2.0.bb</a=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-pytest-httpx_0.=
36.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-httpx_0.36.2.b=
b</a>=C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0.../python/<a href=3D"http://python3-pytest-lazy-fixtures_1.1.4.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-pytest-lazy-fixtures_1.1.4.bb</=
a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-pytest-mock_3.1=
5.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-mock_3.15.1.bb<=
/a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-pytest-picked_0=
.5.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-picked_0.5.1.b=
b</a>=C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-pytest-socket_0=
.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-socket_0.7.0.b=
b</a>=C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-pytest-timeout_=
2.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-timeout_2.5.0=
.bb</a>=C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-pytest-xdist_3.=
8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-xdist_3.8.0.bb<=
/a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-python-dotenv_1=
.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-python-dotenv_1.2.1.b=
b</a>=C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-python-multipar=
t_0.0.32.bb" rel=3D"noreferrer" target=3D"_blank">python3-python-multipart_=
0.0.32.bb</a>=C2=A0 | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-requests-file_3=
.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-requests-file_3.0.1.b=
b</a>=C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-rfc3986-validat=
or_0.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-rfc3986-validator=
_0.1.1.bb</a>=C2=A0 | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-rich-argparse_1=
.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-rich-argparse_1.8.0.b=
b</a>=C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-scikit-build-co=
re_1.0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-scikit-build-core=
_1.0.3.bb</a>=C2=A0 | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-scikit-build_0.=
19.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-scikit-build_0.19.1.b=
b</a>=C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-service-identit=
y_26.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-service-identity_=
26.1.0.bb</a>=C2=A0 | 1 -<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-sijax_0=
.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-sijax_0.3.2.bb</a>=C2=
=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-stack-d=
ata_0.6.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-stack-data_0.6.3=
.bb</a> | 1 -<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-strenum=
_0.4.15.bb" rel=3D"noreferrer" target=3D"_blank">python3-strenum_0.4.15.bb<=
/a>=C2=A0 =C2=A0| 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-time-machine_3.=
2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-time-machine_3.2.0.bb<=
/a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-tokenize-rt_6.2=
.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-tokenize-rt_6.2.0.bb</a=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0.../python/<a href=3D"http://python3-types-psutil_7.2.2.20260518.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-types-psutil_7.2.2.20260518.bb=
</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-wand_0.=
7.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-wand_0.7.2.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-wheezy-template=
_3.2.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-wheezy-template_3.2=
.5.bb</a>=C2=A0 =C2=A0 | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-wpa-supplicant_=
0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-wpa-supplicant_0.2.bb<=
/a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-xlsxwri=
ter_3.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-xlsxwriter_3.2.1=
.bb</a> | 1 -<br>
=C2=A0.../python/<a href=3D"http://python3-xstatic-font-awesome_6.2.1.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-xstatic-font-awesome_6.2.1.2.=
bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-xstatic=
_1.0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-xstatic_1.0.3.bb</a=
>=C2=A0 =C2=A0 | 1 -<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-zopeeve=
nt_5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-zopeevent_5.0.bb</a=
>=C2=A0 =C2=A0 | 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-zopeinterface_8=
.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-zopeinterface_8.6.bb</a=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0.../python3-rouge-score/<a href=3D"http://python3-rouge-score_0.1.2.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-rouge-score_0.1.2.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0.../recipes-devtools/python3-wxgtk4/<a href=3D"http://python3-wxgtk4_=
4.2.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-wxgtk4_4.2.5.bb</a>=
=C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0.../python3-gpt-image/<a href=3D"http://python3-gpt-image_0.9.1.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-gpt-image_0.9.1.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0.../recipes-extended/send2trash/<a href=3D"http://python3-send2trash_=
2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-send2trash_2.1.0.bb<=
/a>=C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0117 files changed, 121 deletions(-)<br>
<br>
diff --git a/meta-python/recipes-connectivity/python-pyro5/<a href=3D"http:=
//python3-pyro5_5.17.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyro5=
_5.17.bb</a> b/meta-python/recipes-connectivity/python-pyro5/<a href=3D"htt=
p://python3-pyro5_5.17.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyr=
o5_5.17.bb</a><br>
index c16257beae..1be13146db 100644<br>
--- a/meta-python/recipes-connectivity/python-pyro5/<a href=3D"http://pytho=
n3-pyro5_5.17.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyro5_5.17.b=
b</a><br>
+++ b/meta-python/recipes-connectivity/python-pyro5/<a href=3D"http://pytho=
n3-pyro5_5.17.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyro5_5.17.b=
b</a><br>
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dc1c9ccd5f4c=
a5d0f5057c0e690a0153d&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;cfac69638d80943aff9cc5f1466755dd0fef8aed=
0bb4bda41b5eb045818ce6fc&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;pyro5&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi setuptools3 ptest-python-pytest<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
annotated-doc_0.0.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-annota=
ted-doc_0.0.5.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-annotated-doc_0.0.5.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-annotated-doc_0.0.5.bb</a><br>
index 28d05166f4..1f9164323f 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-annotat=
ed-doc_0.0.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-annotated-doc=
_0.0.5.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-annotat=
ed-doc_0.0.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-annotated-doc=
_0.0.5.bb</a><br>
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3De36e91f2789=
75b8bb76a769f32582892&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;c7e58ce09192557605d8bbd92836d7e1d520ac95=
80096042c0bfd197efacf1bb&quot;<br>
<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
-<br>
=C2=A0inherit pypi python_pdm<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;annotated_doc&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
annotated-types_0.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-anno=
tated-types_0.8.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"h=
ttp://python3-annotated-types_0.8.0.bb" rel=3D"noreferrer" target=3D"_blank=
">python3-annotated-types_0.8.0.bb</a><br>
index 3bc397ffa7..28941262b1 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-annotat=
ed-types_0.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-annotated-t=
ypes_0.8.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-annotat=
ed-types_0.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-annotated-t=
ypes_0.8.0.bb</a><br>
@@ -9,8 +9,6 @@ SRC_URI[sha256sum] =3D &quot;13b2beaad985e05e2d6407ee4c4f35=
590b11f8d693a258a561055cac8f<br>
=C2=A0S =3D &quot;${UNPACKDIR}/annotated_types-${PV}&quot;<br>
=C2=A0PYPI_PACKAGE =3D &quot;annotated_types&quot;<br>
<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
-<br>
=C2=A0inherit pypi python_hatchling<br>
<br>
=C2=A0RDEPENDS:${PN} =3D &quot;python3-typing-extensions&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
apply-defaults_0.1.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-apply=
-defaults_0.1.6.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-apply-defaults_0.1.6.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-apply-defaults_0.1.6.bb</a><br>
index 1be20f179a..6bf61cfcd3 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-apply-d=
efaults_0.1.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-apply-defaul=
ts_0.1.6.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-apply-d=
efaults_0.1.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-apply-defaul=
ts_0.1.6.bb</a><br>
@@ -4,7 +4,6 @@ LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dc89120516900f96f4c60d=
35fdc4c3f15&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;apply_defaults&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;3773de3491b94c0fe44310f1a85888389cdc71e1=
544b343bce0d2bd6991acea5&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
arpeggio_2.0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-arpeggio_2.=
0.3.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
arpeggio_2.0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-arpeggio_2.=
0.3.bb</a><br>
index 4d4982dd37..01739adf86 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-arpeggi=
o_2.0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-arpeggio_2.0.3.bb<=
/a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-arpeggi=
o_2.0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-arpeggio_2.0.3.bb<=
/a><br>
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D33b8d1ba459=
a2fa4d801acfd1d1b7ceb&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;9e85ad35cfc6c938676817c7ae9a1000a7c72a34=
c71db0c687136c460d12b85e&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;Arpeggio&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
brotli_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-brotli_1.2.0.=
bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-brot=
li_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-brotli_1.2.0.bb</=
a><br>
index f4cdab65b6..643208264c 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-brotli_=
1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-brotli_1.2.0.bb</a><=
br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-brotli_=
1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-brotli_1.2.0.bb</a><=
br>
@@ -5,7 +5,6 @@ LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D941ee9cd1609382f94635=
2712a319b4b&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;brotli&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;brotli&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
cached-property_2.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-cach=
ed-property_2.0.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"h=
ttp://python3-cached-property_2.0.1.bb" rel=3D"noreferrer" target=3D"_blank=
">python3-cached-property_2.0.1.bb</a><br>
index 5c88a4e69e..e1ead95cf1 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-cached-=
property_2.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-cached-prop=
erty_2.0.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-cached-=
property_2.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-cached-prop=
erty_2.0.1.bb</a><br>
@@ -6,7 +6,6 @@ LICENSE =3D &quot;BSD-3-Clause&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Ddb7ff60c4e14f58534201=
242803d8abc&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;cached_property&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;484d617105e3ee0e4f1f58725e72a8ef9e93deee=
462222dbd51cd91230897641&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
can_4.6.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-can_4.6.1.bb</a>=
 b/meta-python/recipes-devtools/python/<a href=3D"http://python3-can_4.6.1.=
bb" rel=3D"noreferrer" target=3D"_blank">python3-can_4.6.1.bb</a><br>
index a2746511f8..4f7a8e9b0a 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-can_4.6=
.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-can_4.6.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-can_4.6=
.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-can_4.6.1.bb</a><br>
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3De6a600f=
d5e1d9cbde2d983680233ad02&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;290fea135d04b8504ebff33889cc6d301e2181a5=
4099116609f940825ffe5005&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;python_can&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
cerberus_1.3.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-cerberus_1.=
3.8.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
cerberus_1.3.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-cerberus_1.=
3.8.bb</a><br>
index 7b868fad5e..3175db905c 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-cerberu=
s_1.3.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-cerberus_1.3.8.bb<=
/a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-cerberu=
s_1.3.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-cerberus_1.3.8.bb<=
/a><br>
@@ -4,8 +4,6 @@ SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;ISC&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D48f8e9432d0dac5e0e7a1=
8211a0bacdb&quot;<br>
<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
-<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;579554887ffd189226774b87570f4a76db75cf0e=
fcbaffcacd5e98b8ee877f61&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
charset-normalizer_3.4.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-c=
harset-normalizer_3.4.9.bb</a> b/meta-python/recipes-devtools/python/<a hre=
f=3D"http://python3-charset-normalizer_3.4.9.bb" rel=3D"noreferrer" target=
=3D"_blank">python3-charset-normalizer_3.4.9.bb</a><br>
index 6df52a23d4..ae93b43d5c 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-charset=
-normalizer_3.4.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-charset-=
normalizer_3.4.9.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-charset=
-normalizer_3.4.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-charset-=
normalizer_3.4.9.bb</a><br>
@@ -11,7 +11,6 @@ DEPENDS +=3D &quot;python3-setuptools-scm-native python3-=
mypy-native&quot;<br>
=C2=A0inherit pypi python_setuptools_build_meta ptest-python-pytest<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;charset_normalizer&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-core \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
cheetah_3.2.6.post1.bb" rel=3D"noreferrer" target=3D"_blank">python3-cheeta=
h_3.2.6.post1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-cheetah_3.2.6.post1.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-cheetah_3.2.6.post1.bb</a><br>
index e7b404cd8f..252ec4cd89 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-cheetah=
_3.2.6.post1.bb" rel=3D"noreferrer" target=3D"_blank">python3-cheetah_3.2.6=
.post1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-cheetah=
_3.2.6.post1.bb" rel=3D"noreferrer" target=3D"_blank">python3-cheetah_3.2.6=
.post1.bb</a><br>
@@ -4,7 +4,6 @@ LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D15e13a4ed0e5880e3e55e=
c88b0921181&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;Cheetah3&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
configargparse_1.7.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-confi=
gargparse_1.7.5.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-configargparse_1.7.5.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-configargparse_1.7.5.bb</a><br>
index 49df56d75b..0bf629dd91 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-configa=
rgparse_1.7.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-configargpar=
se_1.7.5.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-configa=
rgparse_1.7.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-configargpar=
se_1.7.5.bb</a><br>
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dda746463714=
cc35999ed9a42339f2943&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;e3f9a7bb6be34d66b2e3c4a2f58e3045f8dfae47=
b0dc039f87bcfaa0f193fb0f&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;configargparse&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
custom-inherit_2.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-custo=
m-inherit_2.4.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-custom-inherit_2.4.1.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-custom-inherit_2.4.1.bb</a><br>
index a8aad44943..e7409f77e6 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-custom-=
inherit_2.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-custom-inher=
it_2.4.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-custom-=
inherit_2.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-custom-inher=
it_2.4.1.bb</a><br>
@@ -4,7 +4,6 @@ LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.md;md5=3Df910a85a4c3da51edf=
780f17a7608434&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;custom_inherit&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://0001-versioneer.py-do-not-use-SafeConfigPar=
ser.patch&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;7052eb337bcce83551815264391cc4efc2bf70b2=
95a3c52aba64f1ab57c3a8a2&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
dbus-fast_4.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-dbus-fast_=
4.0.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-dbus-fast_4.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-dbus-fas=
t_4.0.0.bb</a><br>
index a45a7fa920..c0c40b6b23 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-dbus-fa=
st_4.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-dbus-fast_4.0.0.b=
b</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-dbus-fa=
st_4.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-dbus-fast_4.0.0.b=
b</a><br>
@@ -7,7 +7,6 @@ SRC_URI +=3D &quot;file://0001-pyproject.toml-Remove-upper-=
version-constraint-for-C.pat<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;e1d3ee49a4a81524d7caaa2d5a31fc71075a1c97=
7b661df958cee24bef86b8fe&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;dbus_fast&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi python_poetry_core cython<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
dbus-next_0.2.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-dbus-next_=
0.2.3.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-dbus-next_0.2.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-dbus-nex=
t_0.2.3.bb</a><br>
index 10c1bfda04..9f6aa7ed7f 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-dbus-ne=
xt_0.2.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-dbus-next_0.2.3.b=
b</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-dbus-ne=
xt_0.2.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-dbus-next_0.2.3.b=
b</a><br>
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D94e750c96e5=
6788499b56c81de91431c&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;f4eae26909332ada528c0a3549dda8d4f088f9b3=
65153952a408e28023a626a5&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;dbus_next&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
dirty-equals_0.11.bb" rel=3D"noreferrer" target=3D"_blank">python3-dirty-eq=
uals_0.11.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://py=
thon3-dirty-equals_0.11.bb" rel=3D"noreferrer" target=3D"_blank">python3-di=
rty-equals_0.11.bb</a><br>
index 098c8ae0e6..daf8567f07 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-dirty-e=
quals_0.11.bb" rel=3D"noreferrer" target=3D"_blank">python3-dirty-equals_0.=
11.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-dirty-e=
quals_0.11.bb" rel=3D"noreferrer" target=3D"_blank">python3-dirty-equals_0.=
11.bb</a><br>
@@ -17,7 +17,6 @@ S =3D &quot;${UNPACKDIR}/dirty_equals-${PV}&quot;<br>
=C2=A0inherit pypi python_hatchling<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;dirty_equals&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0python3-pytz \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
django-south_1.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-django-=
south_1.0.2.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://=
python3-django-south_1.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-django-south_1.0.2.bb</a><br>
index 5b0f6c6f3b..152e57f105 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-django-=
south_1.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-django-south_1=
.0.2.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-django-=
south_1.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-django-south_1=
.0.2.bb</a><br>
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D &quot;file://PKG-INFO;beginline=3D17;e=
ndline=3D18;md5=3D2155d8ae21e7c231<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;d360bd31898f9df59f6faa786551065bba45b35e=
7ee3c39b381b4fbfef7392f4&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;South&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-django.inc b/meta-=
python/recipes-devtools/python/python3-django.inc<br>
index 4191d4384f..bbf7e564e8 100644<br>
--- a/meta-python/recipes-devtools/python/python3-django.inc<br>
+++ b/meta-python/recipes-devtools/python/python3-django.inc<br>
@@ -4,7 +4,6 @@ LICENSE =3D &quot;BSD-3-Clause&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Df09eb47206614a4954c51=
db8a94840fa&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;django&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi ptest<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
dynamic-dispatch_1.0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-dyn=
amic-dispatch_1.0.3.bb</a> b/meta-python/recipes-devtools/python/<a href=3D=
"http://python3-dynamic-dispatch_1.0.3.bb" rel=3D"noreferrer" target=3D"_bl=
ank">python3-dynamic-dispatch_1.0.3.bb</a><br>
index 227e97c46c..fa21531487 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-dynamic=
-dispatch_1.0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-dynamic-di=
spatch_1.0.3.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-dynamic=
-dispatch_1.0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-dynamic-di=
spatch_1.0.3.bb</a><br>
@@ -8,7 +8,6 @@ inherit pypi setuptools3<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;fbc676aaedc8ec542056c21e5e206b8b62b8d11c=
3f3c5cfb32b273936da89604&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;dynamic_dispatch&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;python3-setuptools-scm-native&quot;<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;\<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
email-validator_2.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-emai=
l-validator_2.3.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"h=
ttp://python3-email-validator_2.3.0.bb" rel=3D"noreferrer" target=3D"_blank=
">python3-email-validator_2.3.0.bb</a><br>
index b745dfbba8..a9401ccf49 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-email-v=
alidator_2.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-email-valid=
ator_2.3.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-email-v=
alidator_2.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-email-valid=
ator_2.3.0.bb</a><br>
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D2890aee62bd=
2a4c3197e2059016a397e&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;9fc05c37f2f6cf439ff414f8fc46d917929974a8=
2244c20eb10231ba60c54426&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;email_validator&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
et-xmlfile_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-et-xmlfil=
e_2.0.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-et-xmlfile_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-et-xm=
lfile_2.0.0.bb</a><br>
index 9439deef0a..1f119c6bdf 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-et-xmlf=
ile_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-et-xmlfile_2.0.0=
.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-et-xmlf=
ile_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-et-xmlfile_2.0.0=
.bb</a><br>
@@ -21,4 +21,3 @@ RDEPENDS:${PN} +=3D &quot; \<br>
=C2=A0inherit setuptools3 pypi<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;et_xmlfile&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
eth-abi_5.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-eth-abi_5.2.=
0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-et=
h-abi_5.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-eth-abi_5.2.0.=
bb</a><br>
index e1459653ea..340e69ee6b 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-eth-abi=
_5.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-eth-abi_5.2.0.bb</a=
><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-eth-abi=
_5.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-eth-abi_5.2.0.bb</a=
><br>
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D2b6a85414b7=
d058ab1c58e11611c21b2&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;178703fa98c07d8eecd5ae569e7e8d159e493ebb=
6eeb534a8fe973fbc4e40ef0&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;eth_abi&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
eth-utils_6.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-eth-utils_=
6.0.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-eth-utils_6.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-eth-util=
s_6.0.0.bb</a><br>
index 36d787746e..0618814d52 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-eth-uti=
ls_6.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-eth-utils_6.0.0.b=
b</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-eth-uti=
ls_6.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-eth-utils_6.0.0.b=
b</a><br>
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dd3f53e7cc5b=
f80b16eff1f4a38c73182&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;eb54b2f82dd300d3142c49a89da195e823f5e528=
4d43203593f87c67bad92a96&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;eth_utils&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
fastapi-cli_0.0.27.bb" rel=3D"noreferrer" target=3D"_blank">python3-fastapi=
-cli_0.0.27.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://=
python3-fastapi-cli_0.0.27.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-fastapi-cli_0.0.27.bb</a><br>
index 218137e5f8..02750e67e1 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-fastapi=
-cli_0.0.27.bb" rel=3D"noreferrer" target=3D"_blank">python3-fastapi-cli_0.=
0.27.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-fastapi=
-cli_0.0.27.bb" rel=3D"noreferrer" target=3D"_blank">python3-fastapi-cli_0.=
0.27.bb</a><br>
@@ -9,8 +9,6 @@ inherit pypi python_pdm<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;fastapi_cli&quot;<br>
<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
-<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-difflib \<br>
=C2=A0 =C2=A0 =C2=A0python3-pydantic \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
flask-babel_4.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-ba=
bel_4.0.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://py=
thon3-flask-babel_4.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-fl=
ask-babel_4.0.0.bb</a><br>
index 4923eb9d58..b445ec0e1c 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-b=
abel_4.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-babel_4.0=
.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-b=
abel_4.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-babel_4.0=
.0.bb</a><br>
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D51917f3e8e8=
58f5ae295a7d0e2eb3cc9&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;dbeab4027a3f4a87678a11686496e98e1492eb79=
3cbdd77ab50f4e9a2602a593&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;flask_babel&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi python_poetry_core<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
flask-bootstrap_3.3.7.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-fl=
ask-bootstrap_3.3.7.1.bb</a> b/meta-python/recipes-devtools/python/<a href=
=3D"http://python3-flask-bootstrap_3.3.7.1.bb" rel=3D"noreferrer" target=3D=
"_blank">python3-flask-bootstrap_3.3.7.1.bb</a><br>
index 697c0b1850..e28e41c124 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-b=
ootstrap_3.3.7.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-boo=
tstrap_3.3.7.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-b=
ootstrap_3.3.7.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-boo=
tstrap_3.3.7.1.bb</a><br>
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D &quot;file://PKG-INFO;md5=3Da03749709f=
06118a17349deb5a210619&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;cb08ed940183f6343a64e465e83b3a3f13c53e1b=
aabb8d72b5da4545ef123ac8&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;Flask-Bootstrap&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
flask-cors_6.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-cor=
s_6.0.2.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-flask-cors_6.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask=
-cors_6.0.2.bb</a><br>
index 6134b5ba10..b5a32faa6e 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-c=
ors_6.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-cors_6.0.2=
.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-c=
ors_6.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-cors_6.0.2=
.bb</a><br>
@@ -8,7 +8,6 @@ LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://PKG-INFO;beginline=3D6;endline=3D6;=
md5=3D134f1026f0de92fd30e71976590a2868&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;flask_cors&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;flask-cors&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
flask-httpauth_4.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask=
-httpauth_4.8.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-flask-httpauth_4.8.0.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-flask-httpauth_4.8.0.bb</a><br>
index f090f1d40f..cf0f73aef5 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-h=
ttpauth_4.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-httpau=
th_4.8.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-h=
ttpauth_4.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-httpau=
th_4.8.0.bb</a><br>
@@ -8,7 +8,6 @@ inherit pypi python_setuptools_build_meta<br>
=C2=A0DEPENDS +=3D &quot;python3-wheel-native&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;Flask-HTTPAuth&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;66568a05bc73942c65f1e2201ae746295816dc00=
9edd84b482c44c758d75097a&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
flask-jsonpify_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask=
-jsonpify_1.5.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-flask-jsonpify_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-flask-jsonpify_1.5.0.bb</a><br>
index d653b8adbf..93ecf08453 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-j=
sonpify_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-jsonpi=
fy_1.5.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-j=
sonpify_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-jsonpi=
fy_1.5.0.bb</a><br>
@@ -5,7 +5,6 @@ LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://README.rst;md5=3Dbd59445a234a0c8250=
b39178d42e3148&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;Flask-Jsonpify&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;8ac4c732aa5b11d9f6c2de58065d3b669f139518=
ca8f529bce943817e2fedbfb&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
flask-jwt-extended_4.7.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-f=
lask-jwt-extended_4.7.4.bb</a> b/meta-python/recipes-devtools/python/<a hre=
f=3D"http://python3-flask-jwt-extended_4.7.4.bb" rel=3D"noreferrer" target=
=3D"_blank">python3-flask-jwt-extended_4.7.4.bb</a><br>
index de6231ac31..5d7412f1e2 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-j=
wt-extended_4.7.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-jw=
t-extended_4.7.4.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-j=
wt-extended_4.7.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-jw=
t-extended_4.7.4.bb</a><br>
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D9166295d7c4=
82b9440bbb2b5c0fa43ac&quot;<br>
=C2=A0inherit pypi setuptools3<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;flask_jwt_extended&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;78fd0f460317facf3a0084a6457ffaf2f1dda9ee=
fbd576f94cea35b0eadd5531&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
flask-jwt_0.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-jwt_=
0.3.2.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-flask-jwt_0.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-jw=
t_0.3.2.bb</a><br>
index 462d065a0e..f7044b314f 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-j=
wt_0.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-jwt_0.3.2.b=
b</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-j=
wt_0.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-jwt_0.3.2.b=
b</a><br>
@@ -5,7 +5,6 @@ LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dff00db41c47ec84b4567a=
8b3c246a959&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;Flask-JWT&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;49c0672fbde0f1cd3374bd834918d28956e3c521=
c7e00089cdc5380d323bd0ad&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
flask-limiter_4.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-=
limiter_4.1.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-flask-limiter_4.1.1.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-flask-limiter_4.1.1.bb</a><br>
index 7c2e18ffba..884da17052 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-l=
imiter_4.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-limiter=
_4.1.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-l=
imiter_4.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-limiter=
_4.1.1.bb</a><br>
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D2455d5e=
574bc0fc489411ca45766ac78&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;ca11608fc7eec43dcea606964ca07c3bd4ec1ae8=
9043a0f67f717899a4f48106&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;flask_limiter&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi python_hatchling<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
flask-login_0.6.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-lo=
gin_0.6.3.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://py=
thon3-flask-login_0.6.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-fl=
ask-login_0.6.3.bb</a><br>
index a50f82abc4..df22ca112c 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-l=
ogin_0.6.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-login_0.6=
.3.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-l=
ogin_0.6.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-login_0.6=
.3.bb</a><br>
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D8aa87a1cd9f=
a41d969ad32cfdac2c596&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;5e23d14a607ef12806c699590b89d0f0e0d67bae=
ec599d75947bf9c147330333&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;Flask-Login&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
flask-mail_0.10.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-ma=
il_0.10.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://py=
thon3-flask-mail_0.10.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-fl=
ask-mail_0.10.0.bb</a><br>
index 53d3333b95..a91a231b95 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-m=
ail_0.10.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-mail_0.10=
.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-m=
ail_0.10.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-mail_0.10=
.0.bb</a><br>
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D201f2b8=
0112efa61b78515bd54e9f138&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;44083e7b02bbcce792209c06252f8569dd5a325a=
7aaa76afe7330422bd97881d&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;flask_mail&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi python_flit_core<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
flask-marshmallow_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-fl=
ask-marshmallow_1.5.0.bb</a> b/meta-python/recipes-devtools/python/<a href=
=3D"http://python3-flask-marshmallow_1.5.0.bb" rel=3D"noreferrer" target=3D=
"_blank">python3-flask-marshmallow_1.5.0.bb</a><br>
index a311730980..9739f31f6f 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-m=
arshmallow_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-mar=
shmallow_1.5.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-m=
arshmallow_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-mar=
shmallow_1.5.0.bb</a><br>
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D27586b20700=
d7544c06933afe56f7df4&quot;<br>
=C2=A0inherit pypi python_flit_core<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;flask_marshmallow&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;7c06b56e41647eccdb3cd57c25b109f19191b4c6=
2509362bd64920cdf601a066&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
flask-migrate_4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-=
migrate_4.1.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-flask-migrate_4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-flask-migrate_4.1.0.bb</a><br>
index 7cdada071f..fc64d03d38 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-m=
igrate_4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-migrate=
_4.1.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-m=
igrate_4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-migrate=
_4.1.0.bb</a><br>
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D3b69377f79f=
3f48c661701236d5a6a85&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;1a336b06eb2c3ace005f5f2ded8641d534c18798=
d64061f6ff11f79e1434126d&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;flask_migrate&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
flask-pymongo_3.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-=
pymongo_3.0.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-flask-pymongo_3.0.1.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-flask-pymongo_3.0.1.bb</a><br>
index 7773e2830e..c760ee0219 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-p=
ymongo_3.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-pymongo=
_3.0.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-p=
ymongo_3.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-pymongo=
_3.0.1.bb</a><br>
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D &quot;file://flask_pymongo/wrappers.py=
;beginline=3D1;endline=3D24;md5=3D<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;d225b51c21ceca2e670e6cca79b5c584ad17b962=
52b48e84e3b423ddb73304cc&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;flask_pymongo&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi python_setuptools_build_meta python_hatchling<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
flask-restful_0.3.10.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask=
-restful_0.3.10.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-flask-restful_0.3.10.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-flask-restful_0.3.10.bb</a><br>
index 0f97fbc259..8ea455c633 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-r=
estful_0.3.10.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-restfu=
l_0.3.10.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-r=
estful_0.3.10.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-restfu=
l_0.3.10.bb</a><br>
@@ -11,6 +11,5 @@ SRC_URI[sha256sum] =3D &quot;fe4af2ef0027df8f9b4f797aba20=
c5566801b6ade995ac63b588abf1a5<br>
=C2=A0inherit pypi setuptools3<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;Flask-RESTful&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} =3D &quot;python3-flask&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
flask-sijax_0.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-si=
jax_0.4.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://py=
thon3-flask-sijax_0.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-fl=
ask-sijax_0.4.1.bb</a><br>
index e74f315c4a..d518a1877f 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-s=
ijax_0.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-sijax_0.4=
.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-s=
ijax_0.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-sijax_0.4=
.1.bb</a><br>
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D266adc7=
b911b7c84b837bf77196e1ba6&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;fb2bf2d4f75408185102195055d75549fee8d9c9=
e954dca2427186925cdc429f&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;Flask-Sijax&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
flask-socketio_5.6.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask=
-socketio_5.6.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-flask-socketio_5.6.1.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-flask-socketio_5.6.1.bb</a><br>
index 9e94d20748..edbe6eef08 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-s=
ocketio_5.6.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-socket=
io_5.6.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-s=
ocketio_5.6.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-socket=
io_5.6.1.bb</a><br>
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D38cc2125490=
9604298ce763a6e4440a0&quot;<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;flask_socketio&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;fe5bd995c3ed4da9a98f335d0d830fa1a19d84a6=
4789f6265642a671fdacaeac&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
flask-sqlalchemy_3.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-fla=
sk-sqlalchemy_3.1.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D=
"http://python3-flask-sqlalchemy_3.1.1.bb" rel=3D"noreferrer" target=3D"_bl=
ank">python3-flask-sqlalchemy_3.1.1.bb</a><br>
index a3fd62228a..c300d0b388 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-s=
qlalchemy_3.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-sqla=
lchemy_3.1.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-s=
qlalchemy_3.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-sqla=
lchemy_3.1.1.bb</a><br>
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE.rst;md5=3Dffeffa5=
9c90c9c4a033c7574f8f3fb75&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;e4b68bb881802dda1a7d878b2fc84c06d1ee57fb=
40b874d3dc97dabfa36b8312&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;flask_sqlalchemy&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi python_flit_core<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
flask-uploads_0.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-=
uploads_0.2.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-flask-uploads_0.2.1.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-flask-uploads_0.2.1.bb</a><br>
index fa2b321814..a51ead3c8a 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-u=
ploads_0.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-uploads=
_0.2.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-u=
ploads_0.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-uploads=
_0.2.1.bb</a><br>
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D &quot;file://PKG-INFO;md5=3Db712ac634b=
39469660c9bdfb8d03421c&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;53ecbd6033667d50ae02b63adebbaa33c7fc56c0=
9e5293025810cf9d841ecb02&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;Flask-Uploads&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
flask-user_0.6.19.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-us=
er_0.6.19.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://py=
thon3-flask-user_0.6.19.bb" rel=3D"noreferrer" target=3D"_blank">python3-fl=
ask-user_0.6.19.bb</a><br>
index 9ec9249339..951020dae9 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-u=
ser_0.6.19.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-user_0.6.=
19.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-u=
ser_0.6.19.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-user_0.6.=
19.bb</a><br>
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D97de97c=
d9d6e23c88129d884588ce71a&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;601abcc0343dfbae0c56273d98362d5cdc266ac8=
4d20b3f65a212e4a2c83b302&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;Flask-User&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;flask-user_project:flask-user&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
flask-versioned_0.9.4-20101221.bb" rel=3D"noreferrer" target=3D"_blank">pyt=
hon3-flask-versioned_0.9.4-20101221.bb</a> b/meta-python/recipes-devtools/p=
ython/<a href=3D"http://python3-flask-versioned_0.9.4-20101221.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-flask-versioned_0.9.4-20101221.bb</a><=
br>
index 4e2d5e6095..3492d5efc8 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-v=
ersioned_0.9.4-20101221.bb" rel=3D"noreferrer" target=3D"_blank">python3-fl=
ask-versioned_0.9.4-20101221.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-v=
ersioned_0.9.4-20101221.bb" rel=3D"noreferrer" target=3D"_blank">python3-fl=
ask-versioned_0.9.4-20101221.bb</a><br>
@@ -4,7 +4,6 @@ LICENSE =3D &quot;BSD-3-Clause&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://flaskext/versioned/__init__.py;md5=
=3Ddcb7d97884bf08c256ff5795766bcd24&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;Flask-Versioned&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;516694dc860a1bc4f22ab60b324a85083c015052=
2be109282a3bed681057fd34&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
flask-wtf_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-wtf_=
1.3.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-flask-wtf_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-wt=
f_1.3.0.bb</a><br>
index 2c1f8af8e8..54c6c8904d 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-w=
tf_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-wtf_1.3.0.b=
b</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-w=
tf_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-wtf_1.3.0.b=
b</a><br>
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE.rst;md5=3Dd98d089=
889e14b227732d45dac3aacc4&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;61d5dabc50c3df885c297dcbd80810443a5d6321=
06c8a69cab8ce740f0cdd7cc&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;flask_wtf&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi python_hatchling<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
flask-xstatic_0.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-=
xstatic_0.0.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-flask-xstatic_0.0.1.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-flask-xstatic_0.0.1.bb</a><br>
index b8d73c8170..c4cad466ad 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-x=
static_0.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-xstatic=
_0.0.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-x=
static_0.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-xstatic=
_0.0.1.bb</a><br>
@@ -7,7 +7,6 @@ SRC_URI[sha256sum] =3D &quot;226ea8e97065a9488b59bfe5c94af4=
c6e2ea70a25052e301fb231a1381<br>
=C2=A0SRC_URI +=3D &quot;file://remove-pip-requires.patch&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;Flask-XStatic&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-flask \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
google-auth_2.56.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-google-=
auth_2.56.3.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://=
python3-google-auth_2.56.3.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-google-auth_2.56.3.bb</a><br>
index c096c6ab36..c79f51f760 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-google-=
auth_2.56.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-google-auth_2.=
56.3.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-google-=
auth_2.56.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-google-auth_2.=
56.3.bb</a><br>
@@ -12,7 +12,6 @@ SRC_URI +=3D &quot; \<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;40e229fc901f0a305b553050e5fce562d509bee0=
435be053abfa91582b51b90c&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;google_auth&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0RDEPENDS:${PN}-ptest +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python3-aioresponses \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
grpcio-channelz_1.76.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-grp=
cio-channelz_1.76.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D=
"http://python3-grpcio-channelz_1.76.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">python3-grpcio-channelz_1.76.0.bb</a><br>
index 921a9a251a..0f75a7a084 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-grpcio-=
channelz_1.76.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-grpcio-cha=
nnelz_1.76.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-grpcio-=
channelz_1.76.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-grpcio-cha=
nnelz_1.76.0.bb</a><br>
@@ -9,7 +9,6 @@ inherit pypi setuptools3<br>
<br>
=C2=A0DEPENDS +=3D &quot;python3-grpcio&quot;<br>
=C2=A0PYPI_PACKAGE =3D &quot;grpcio_channelz&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;2ab15ef7b2252a9ba31df500bbe295ce5310a8b0=
1ea6f6d67a17172d914a41a8&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
grpcio-reflection_1.76.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-g=
rpcio-reflection_1.76.0.bb</a> b/meta-python/recipes-devtools/python/<a hre=
f=3D"http://python3-grpcio-reflection_1.76.0.bb" rel=3D"noreferrer" target=
=3D"_blank">python3-grpcio-reflection_1.76.0.bb</a><br>
index e03fd3e818..910d795553 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-grpcio-=
reflection_1.76.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-grpcio-r=
eflection_1.76.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-grpcio-=
reflection_1.76.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-grpcio-r=
eflection_1.76.0.bb</a><br>
@@ -9,7 +9,6 @@ inherit pypi setuptools3<br>
<br>
=C2=A0DEPENDS +=3D &quot;python3-grpcio&quot;<br>
=C2=A0PYPI_PACKAGE =3D &quot;grpcio_reflection&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;e0e7e49921c2ee951e5ddff0bdbacbd1ac1a7088=
8beb61d567f3d01b799decb1&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
grpcio-tools_1.76.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-grpcio=
-tools_1.76.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-grpcio-tools_1.76.0.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-grpcio-tools_1.76.0.bb</a><br>
index 29bf02f786..447ece8594 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-grpcio-=
tools_1.76.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-grpcio-tools_=
1.76.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-grpcio-=
tools_1.76.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-grpcio-tools_=
1.76.0.bb</a><br>
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D &quot;file://PKG-INFO;beginline=3D8;en=
dline=3D8;md5=3D7145f7cdd263359b62<br>
=C2=A0inherit pypi setuptools3<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;grpcio_tools&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;python3-grpcio&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
hatch-requirements-txt_0.4.1.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n3-hatch-requirements-txt_0.4.1.bb</a> b/meta-python/recipes-devtools/pytho=
n/<a href=3D"http://python3-hatch-requirements-txt_0.4.1.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-hatch-requirements-txt_0.4.1.bb</a><br>
index d9026e4577..8b3218790e 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-hatch-r=
equirements-txt_0.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-hatc=
h-requirements-txt_0.4.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-hatch-r=
equirements-txt_0.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-hatc=
h-requirements-txt_0.4.1.bb</a><br>
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D58206c26159=
1d2c13b00ab61cec32abe&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;2c686e5758fd05bb55fa7d0c198fdd481f8d3aaa=
3c693260f5c0d74ce3547d20&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;hatch_requirements_txt&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi python_hatchling<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
icu_2.16.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-icu_2.16.2.bb</=
a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-icu_2.16=
.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-icu_2.16.2.bb</a><br>
index 95e4aa79af..a2ebc40758 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-icu_2.1=
6.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-icu_2.16.2.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-icu_2.1=
6.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-icu_2.16.2.bb</a><br>
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D0724597863f=
1581ab01429e0423e779f&quot;<br>
=C2=A0DEPENDS +=3D &quot;icu&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;pyicu&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;006d51e24b5ec76df6ec2130f3dde269c51db8b8=
cfebb7d45a427dde0d10aa52&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
idna-ssl_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-idna-ssl_1.=
1.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
idna-ssl_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-idna-ssl_1.=
1.0.bb</a><br>
index 331dc0355c..37a3eea5d4 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-idna-ss=
l_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-idna-ssl_1.1.0.bb<=
/a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-idna-ss=
l_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-idna-ssl_1.1.0.bb<=
/a><br>
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Da61b9c5aec8=
796b64a6bf15d42605073&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;a933e3bb13da54383f9e8f35dc4f9cb9eb9b3b78=
c6b36f311254d6d0d92c6c7c&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;idna-ssl&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
importlib-metadata_9.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-i=
mportlib-metadata_9.0.0.bb</a> b/meta-python/recipes-devtools/python/<a hre=
f=3D"http://python3-importlib-metadata_9.0.0.bb" rel=3D"noreferrer" target=
=3D"_blank">python3-importlib-metadata_9.0.0.bb</a><br>
index 61f531a9c1..e1a7c1b590 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-importl=
ib-metadata_9.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-importli=
b-metadata_9.0.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-importl=
ib-metadata_9.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-importli=
b-metadata_9.0.0.bb</a><br>
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Daffe5a7d8b9=
88c3db245c01075b29e17&quot;<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;importlib_metadata&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;a4f57ab599e6a2e3016d7595cfd72eb4661a5106=
e787a95bcc90c7105b831efc&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
inline-snapshot_0.35.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-inl=
ine-snapshot_0.35.4.bb</a> b/meta-python/recipes-devtools/python/<a href=3D=
"http://python3-inline-snapshot_0.35.4.bb" rel=3D"noreferrer" target=3D"_bl=
ank">python3-inline-snapshot_0.35.4.bb</a><br>
index c4af98c9e0..d9eea29c1f 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-inline-=
snapshot_0.35.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-inline-sna=
pshot_0.35.4.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-inline-=
snapshot_0.35.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-inline-sna=
pshot_0.35.4.bb</a><br>
@@ -9,7 +9,6 @@ SRC_URI[sha256sum] =3D &quot;82432a58b7ea77a172515f5024cd26=
fdea8dc0f873c7a4251e4e0471a9<br>
=C2=A0inherit pypi python_hatchling<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;inline_snapshot&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} =3D &quot;python3-asttokens \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python=
3-black \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
inotify_0.2.12.bb" rel=3D"noreferrer" target=3D"_blank">python3-inotify_0.2=
.12.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
inotify_0.2.12.bb" rel=3D"noreferrer" target=3D"_blank">python3-inotify_0.2=
.12.bb</a><br>
index f442d2faa6..28a679bc99 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-inotify=
_0.2.12.bb" rel=3D"noreferrer" target=3D"_blank">python3-inotify_0.2.12.bb<=
/a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-inotify=
_0.2.12.bb" rel=3D"noreferrer" target=3D"_blank">python3-inotify_0.2.12.bb<=
/a><br>
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D8c16666ae6c=
159876a0ba63099614381&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;9aee407f92c7d51a2ce50f3b78291a9094e334e3=
4bd68e82bf60020795fa2c94&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;inotify&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi python_setuptools_build_meta ptest-python-pytest<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
ipy_1.01.bb" rel=3D"noreferrer" target=3D"_blank">python3-ipy_1.01.bb</a> b=
/meta-python/recipes-devtools/python/<a href=3D"http://python3-ipy_1.01.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-ipy_1.01.bb</a><br>
index 6a35e12ffe..631354dece 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-ipy_1.0=
1.bb" rel=3D"noreferrer" target=3D"_blank">python3-ipy_1.01.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-ipy_1.0=
1.bb" rel=3D"noreferrer" target=3D"_blank">python3-ipy_1.01.bb</a><br>
@@ -16,6 +16,5 @@ inherit pypi setuptools3_legacy ptest-python-pytest<br>
=C2=A0PTEST_PYTEST_DIR =3D &quot;test&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;IPy&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
ipython-genutils_0.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-ipy=
thon-genutils_0.2.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D=
"http://python3-ipython-genutils_0.2.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">python3-ipython-genutils_0.2.0.bb</a><br>
index b26a9ebd53..d880d88d2d 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-ipython=
-genutils_0.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-ipython-ge=
nutils_0.2.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-ipython=
-genutils_0.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-ipython-ge=
nutils_0.2.0.bb</a><br>
@@ -4,7 +4,6 @@ LICENSE =3D &quot;BSD-3-Clause&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING.md;md5=3Df7c3032c3ac3982652=
24533a0a333a35&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;ipython_genutils&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;eb2e116e75ecef9d4d228fdc66af54269afa26ab=
4463042e33785b887c628ba8&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
keras-preprocessing_1.1.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
keras-preprocessing_1.1.2.bb</a> b/meta-python/recipes-devtools/python/<a h=
ref=3D"http://python3-keras-preprocessing_1.1.2.bb" rel=3D"noreferrer" targ=
et=3D"_blank">python3-keras-preprocessing_1.1.2.bb</a><br>
index 8f382c99b4..f070d79d2b 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-keras-p=
reprocessing_1.1.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-keras-p=
reprocessing_1.1.2.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-keras-p=
reprocessing_1.1.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-keras-p=
reprocessing_1.1.2.bb</a><br>
@@ -9,7 +9,6 @@ inherit pypi setuptools3<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;add82567c50c8bc648c14195bf544a5ce7c1f767=
61536956c3d2978970179ef3&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;Keras_Preprocessing&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
lazy-object-proxy_1.12.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-l=
azy-object-proxy_1.12.0.bb</a> b/meta-python/recipes-devtools/python/<a hre=
f=3D"http://python3-lazy-object-proxy_1.12.0.bb" rel=3D"noreferrer" target=
=3D"_blank">python3-lazy-object-proxy_1.12.0.bb</a><br>
index 9ba6ef8b15..acd84efd21 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-lazy-ob=
ject-proxy_1.12.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-lazy-obj=
ect-proxy_1.12.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-lazy-ob=
ject-proxy_1.12.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-lazy-obj=
ect-proxy_1.12.0.bb</a><br>
@@ -9,7 +9,6 @@ DEPENDS +=3D &quot;python3-setuptools-scm-native&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;1f5a462d92fd0cfb82f1fab28b51bfb209fabbe6=
aabf7f0d51472c0c124c0c61&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;lazy_object_proxy&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
luma-core_2.4.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-luma-core_=
2.4.2.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-luma-core_2.4.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-luma-cor=
e_2.4.2.bb</a><br>
index 1d37cd7187..e19ad56219 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-luma-co=
re_2.4.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-luma-core_2.4.2.b=
b</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-luma-co=
re_2.4.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-luma-core_2.4.2.b=
b</a><br>
@@ -11,7 +11,6 @@ DEPENDS +=3D &quot;python3-wheel-native&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;963c264164d4374f549d57db09599e0ca458cea1=
bd05e16939897619be4e6dbd&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;luma.core&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-pillow \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
luma-oled_3.15.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-luma-oled=
_3.15.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-luma-oled_3.15.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-luma-=
oled_3.15.0.bb</a><br>
index df30667775..2d0d88d7b9 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-luma-ol=
ed_3.15.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-luma-oled_3.15.0=
.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-luma-ol=
ed_3.15.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-luma-oled_3.15.0=
.bb</a><br>
@@ -13,7 +13,6 @@ DEPENDS +=3D &quot;python3-wheel-native&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;16925fe668f484803df0683add800b19e5dd7316=
a1d64eb06ec2ae817473901e&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;luma_oled&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-luma-core \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
matplotlib-inline_0.2.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-ma=
tplotlib-inline_0.2.2.bb</a> b/meta-python/recipes-devtools/python/<a href=
=3D"http://python3-matplotlib-inline_0.2.2.bb" rel=3D"noreferrer" target=3D=
"_blank">python3-matplotlib-inline_0.2.2.bb</a><br>
index b80fc10030..bc515c7b4a 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-matplot=
lib-inline_0.2.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-matplotli=
b-inline_0.2.2.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-matplot=
lib-inline_0.2.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-matplotli=
b-inline_0.2.2.bb</a><br>
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dd4692a0eb42=
ca54892399db2cb35e61e&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;72f3fe8fce36b70d4a5b612f899090cd0401dedd=
c4ea90e1572b9f4bfb058c79&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;matplotlib_inline&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi python_flit_core<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
mypy-extensions_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-mypy=
-extensions_1.1.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"h=
ttp://python3-mypy-extensions_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank=
">python3-mypy-extensions_1.1.0.bb</a><br>
index baa76aa60c..33a1551e66 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-mypy-ex=
tensions_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-mypy-extens=
ions_1.1.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-mypy-ex=
tensions_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-mypy-extens=
ions_1.1.0.bb</a><br>
@@ -4,7 +4,6 @@ LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D0fe3219e2470a78c0d183=
7019b8b426e&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;mypy_extensions&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi python_flit_core<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
ninja-syntax_1.7.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-ninja-s=
yntax_1.7.2.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://=
python3-ninja-syntax_1.7.2.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-ninja-syntax_1.7.2.bb</a><br>
index 7e389a5772..e483b98907 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-ninja-s=
yntax_1.7.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-ninja-syntax_1=
.7.2.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-ninja-s=
yntax_1.7.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-ninja-syntax_1=
.7.2.bb</a><br>
@@ -8,6 +8,5 @@ SRC_URI[sha256sum] =3D &quot;342dc97b9e88a6495bae22953ee606=
3f91d2f03db6f727b62ba5c3092a<br>
=C2=A0inherit pypi setuptools3<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;ninja_syntax&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
parse-type_0.6.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-parse-typ=
e_0.6.6.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-parse-type_0.6.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-parse=
-type_0.6.6.bb</a><br>
index 0cffff3e82..979e25b47b 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-parse-t=
ype_0.6.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-parse-type_0.6.6=
.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-parse-t=
ype_0.6.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-parse-type_0.6.6=
.bb</a><br>
@@ -9,7 +9,6 @@ SRC_URI +=3D &quot; \<br>
=C2=A0&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;parse_type&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi ptest python_setuptools_build_meta<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pastedeploy_3.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pastedep=
loy_3.1.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://py=
thon3-pastedeploy_3.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pa=
stedeploy_3.1.0.bb</a><br>
index 1f6b36bd2b..e3405939c7 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pastede=
ploy_3.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pastedeploy_3.1=
.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pastede=
ploy_3.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pastedeploy_3.1=
.0.bb</a><br>
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D &quot;file://license.txt;md5=3D1798f29=
d55080c60365e6283cb49779c&quot;<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;PasteDeploy&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;9ddbaf152f8095438a9fe81f82c78a6714b92ae8=
e066bed418b6a7ff6a095a95&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
posix-ipc_1.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-posix-ipc_=
1.3.2.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-posix-ipc_1.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-posix-ip=
c_1.3.2.bb</a><br>
index 3431e6c7aa..0660bb4ba8 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-posix-i=
pc_1.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-posix-ipc_1.3.2.b=
b</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-posix-i=
pc_1.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-posix-ipc_1.3.2.b=
b</a><br>
@@ -5,7 +5,6 @@ LICENSE =3D &quot;BSD-3-Clause&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3De3d8df223c2614dbf1aab=
dc1ca23cc10&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;posix_ipc&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;6923232111329954a8349f7d99f212b6e96b5206=
e77fbd39aaf1b3cb4a5e9260&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pure-eval_0.2.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pure-eval_=
0.2.3.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-pure-eval_0.2.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pure-eva=
l_0.2.3.bb</a><br>
index 5dbc8b203a..27a6a34f00 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pure-ev=
al_0.2.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pure-eval_0.2.3.b=
b</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pure-ev=
al_0.2.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pure-eval_0.2.3.b=
b</a><br>
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3Da3d6c15=
f7859ae235a78f2758e5a48cf&quot;<br>
=C2=A0DEPENDS =3D &quot;python3-setuptools-scm-native&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;pure_eval&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pyasn1-modules_0.4.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyasn=
1-modules_0.4.2.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-pyasn1-modules_0.4.2.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-pyasn1-modules_0.4.2.bb</a><br>
index e21bf4427f..3b3bc799a6 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pyasn1-=
modules_0.4.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyasn1-modul=
es_0.4.2.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pyasn1-=
modules_0.4.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyasn1-modul=
es_0.4.2.bb</a><br>
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D190f792=
53908c986e6cacf380c3a5f6d&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;677091de870a80aae844b1ca6134f54652fa2c8c=
5a52aa396440ac3106e941e6&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;pyasn1_modules&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi ptest-python-pytest python_setuptools_build_meta<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pyaudio_0.2.14.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyaudio_0.2=
.14.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pyaudio_0.2.14.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyaudio_0.2=
.14.bb</a><br>
index 4a80f66fd8..80c04d63e5 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pyaudio=
_0.2.14.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyaudio_0.2.14.bb<=
/a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pyaudio=
_0.2.14.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyaudio_0.2.14.bb<=
/a><br>
@@ -4,7 +4,6 @@ LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D7c3152b432b96d6dc=
4a1cb35397da9ec&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;PyAudio&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;78dfff3879b4994d1f4fc6485646a57755c6ee3c=
19647a491f790a0895bd2f87&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pybluez_0.23.bb" rel=3D"noreferrer" target=3D"_blank">python3-pybluez_0.23.=
bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pybl=
uez_0.23.bb" rel=3D"noreferrer" target=3D"_blank">python3-pybluez_0.23.bb</=
a><br>
index 8887ab27d2..188700be29 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pybluez=
_0.23.bb" rel=3D"noreferrer" target=3D"_blank">python3-pybluez_0.23.bb</a><=
br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pybluez=
_0.23.bb" rel=3D"noreferrer" target=3D"_blank">python3-pybluez_0.23.bb</a><=
br>
@@ -12,7 +12,6 @@ SRC_URI +=3D &quot;file://0001-Use-Py_ssize_t-when-parsin=
g-buffer-length-fix-426-42.pat<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;c8f04d2e78951eaa9de486b4d49381704e8943d0=
a6e6e58f55fcd7b8582e90de&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;PyBluez&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pydantic-core_2.46.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydan=
tic-core_2.46.4.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-pydantic-core_2.46.4.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-pydantic-core_2.46.4.bb</a><br>
index 9bfbb701e4..bc9f0e2ad3 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pydanti=
c-core_2.46.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic-cor=
e_2.46.4.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pydanti=
c-core_2.46.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic-cor=
e_2.46.4.bb</a><br>
@@ -123,7 +123,6 @@ DEPENDS =3D &quot;python3-maturin-native python3-typing=
-extensions&quot;<br>
=C2=A0inherit pypi cargo-update-recipe-crates python_maturin ptest-python-p=
ytest<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;pydantic_core&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0python3-compression \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pyfirmata_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyfirmata_=
1.1.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-pyfirmata_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyfirmat=
a_1.1.0.bb</a><br>
index f57ea97fc5..7ec799e086 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pyfirma=
ta_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyfirmata_1.1.0.b=
b</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pyfirma=
ta_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyfirmata_1.1.0.b=
b</a><br>
@@ -3,7 +3,6 @@ LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D84ddcef430b7c44caa22b=
2ff4b37a3df&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;pyFirmata&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-pyserial \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pylyrics_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pylyrics_1.=
1.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pylyrics_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pylyrics_1.=
1.0.bb</a><br>
index 8c7b1c0f72..49f4f7da8b 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pylyric=
s_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pylyrics_1.1.0.bb<=
/a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pylyric=
s_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pylyrics_1.1.0.bb<=
/a><br>
@@ -7,7 +7,6 @@ SRC_URI[sha256sum] =3D &quot;c5f36e8ef0ed3b487a9242ce34c19f=
9684e418a5bbffd5d367dc1d1604<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;PyLyrics&quot;<br>
=C2=A0PYPI_PACKAGE_EXT =3D &quot;zip&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pymysql_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pymysql_1.2.=
0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-py=
mysql_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pymysql_1.2.0.=
bb</a><br>
index 190c80d88f..d062ebe561 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pymysql=
_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pymysql_1.2.0.bb</a=
><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pymysql=
_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pymysql_1.2.0.bb</a=
><br>
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D528175c84=
163bb800d23ad835c7fa0fc&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;6c7b17ca686988104d7426c27895b455cdeea3e9=
d3ceb1270f0c3704fead8c33&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;pymysql&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pynacl_1.6.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pynacl_1.6.2.=
bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pyna=
cl_1.6.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pynacl_1.6.2.bb</=
a><br>
index d72d2be2f1..cc945666a1 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pynacl_=
1.6.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pynacl_1.6.2.bb</a><=
br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pynacl_=
1.6.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pynacl_1.6.2.bb</a><=
br>
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D8cc789b082b=
3d97e1ccc5261f8594d3f&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;018494d6d696ae03c7e656e5e74cdfd8ea132696=
2cc401bcf018f1ed8436811c&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;pynacl&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pyproject-api_1.11.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pypro=
ject-api_1.11.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-pyproject-api_1.11.0.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-pyproject-api_1.11.0.bb</a><br>
index 4df56aa8df..d0e3c90ac8 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pyproje=
ct-api_1.11.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyproject-ap=
i_1.11.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pyproje=
ct-api_1.11.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyproject-ap=
i_1.11.0.bb</a><br>
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D11610a9d8fd=
95649cf8159be12b98cb7&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;b8807d85a293e6c9f133e6575946fed45f1d42b2=
2d58c780b33aa2421a799549&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;pyproject_api&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
=C2=A0inherit pypi python_hatchling<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pytest-asyncio_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytes=
t-asyncio_1.4.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-pytest-asyncio_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-pytest-asyncio_1.4.0.bb</a><br>
index 7f237932a7..ad3b2e2d2b 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
asyncio_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-async=
io_1.4.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
asyncio_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-async=
io_1.4.0.bb</a><br>
@@ -8,7 +8,6 @@ SRC_URI[sha256sum] =3D &quot;c6c0d2259945122819f171a32ecea2=
c349ead889ee28176caaf4921434<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;pytest_asyncio&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;python3-setuptools-scm-native&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pytest-codspeed_5.0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyte=
st-codspeed_5.0.3.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"h=
ttp://python3-pytest-codspeed_5.0.3.bb" rel=3D"noreferrer" target=3D"_blank=
">python3-pytest-codspeed_5.0.3.bb</a><br>
index a1691024ad..9ed6659a77 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
codspeed_5.0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-cods=
peed_5.0.3.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
codspeed_5.0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-cods=
peed_5.0.3.bb</a><br>
@@ -9,6 +9,5 @@ SRC_URI[sha256sum] =3D &quot;91afef90e6a96b013495e4702ef5d6=
358614a449e71008cdc194ef6687<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;pytest_codspeed&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} =3D &quot;python3-cffi python3-filelock python3-pytest=
 python3-rich python3-statistics&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pytest-cov_7.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-co=
v_7.1.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-pytest-cov_7.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytes=
t-cov_7.1.0.bb</a><br>
index 5e76726909..7673a8c569 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
cov_7.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-cov_7.1.0=
.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
cov_7.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-cov_7.1.0=
.bb</a><br>
@@ -13,6 +13,5 @@ DEPENDS +=3D &quot;python3-setuptools-scm-native python3-=
hatch-fancy-pypi-readme-native<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;python3-coverage python3-pytest python3-plu=
ggy&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;pytest_cov&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pytest-env_1.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-en=
v_1.7.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-pytest-env_1.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytes=
t-env_1.7.0.bb</a><br>
index 3ffe73b864..86fd2c9418 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
env_1.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-env_1.7.0=
.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
env_1.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-env_1.7.0=
.bb</a><br>
@@ -10,7 +10,6 @@ SRC_URI[sha256sum] =3D &quot;0c1dc1101fb8d3ab3611e8f8d657=
ba06c3c0c167fc85c90457e5b27f25<br>
=C2=A0inherit pypi python_hatchling ptest-python-pytest<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;pytest_env&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} =3D &quot;python3-pytest python3-tomli&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pytest-freezer_0.4.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytes=
t-freezer_0.4.9.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-pytest-freezer_0.4.9.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-pytest-freezer_0.4.9.bb</a><br>
index 212be0ef8b..cd09a5c325 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
freezer_0.4.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-freez=
er_0.4.9.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
freezer_0.4.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-freez=
er_0.4.9.bb</a><br>
@@ -13,4 +13,3 @@ RDEPENDS:${PN} =3D &quot;\<br>
=C2=A0&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;pytest_freezer&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pytest-html_4.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-h=
tml_4.2.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://py=
thon3-pytest-html_4.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-py=
test-html_4.2.0.bb</a><br>
index ea760ff29a..0889417ad0 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
html_4.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-html_4.2=
.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
html_4.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-html_4.2=
.0.bb</a><br>
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D5d425c8f315=
7dbf212db2ec53d9e5132&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;b6a88cba507500d8709959201e2e757d3941e859=
fd17cfd4ed87b16fc0c67912&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;pytest_html&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi python_hatchling<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pytest-httpx_0.36.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest=
-httpx_0.36.2.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-pytest-httpx_0.36.2.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-pytest-httpx_0.36.2.bb</a><br>
index ac1a53d224..2309a96fa5 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
httpx_0.36.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-httpx_=
0.36.2.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
httpx_0.36.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-httpx_=
0.36.2.bb</a><br>
@@ -21,4 +21,3 @@ RDEPENDS:${PN}-ptest +=3D &quot;\<br>
=C2=A0&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;pytest_httpx&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pytest-lazy-fixtures_1.1.4.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-pytest-lazy-fixtures_1.1.4.bb</a> b/meta-python/recipes-devtools/python/<a=
 href=3D"http://python3-pytest-lazy-fixtures_1.1.4.bb" rel=3D"noreferrer" t=
arget=3D"_blank">python3-pytest-lazy-fixtures_1.1.4.bb</a><br>
index 83b8321df2..64aa5d3ce1 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
lazy-fixtures_1.1.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest=
-lazy-fixtures_1.1.4.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
lazy-fixtures_1.1.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest=
-lazy-fixtures_1.1.4.bb</a><br>
@@ -17,6 +17,5 @@ SRC_URI[sha256sum] =3D &quot;c494b52d798890033d64b28687a4=
d52807c8b0f606d56316e139df0cbe<br>
=C2=A0inherit pypi python_poetry_core<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;pytest_lazy_fixtures&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} =3D &quot;python3-pytest&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pytest-mock_3.15.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-=
mock_3.15.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://=
python3-pytest-mock_3.15.1.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-pytest-mock_3.15.1.bb</a><br>
index 835ff0ab3a..5ed97e436d 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
mock_3.15.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-mock_3.=
15.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
mock_3.15.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-mock_3.=
15.1.bb</a><br>
@@ -13,7 +13,6 @@ SRC_URI[sha256sum] =3D &quot;1849a238f6f396da19762269de72=
cb1814ab44416fa73a8686deac10b0<br>
=C2=A0inherit pypi python_setuptools_build_meta ptest<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;pytest_mock&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;python3-setuptools-scm-native&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pytest-picked_0.5.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest=
-picked_0.5.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-pytest-picked_0.5.1.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-pytest-picked_0.5.1.bb</a><br>
index c7c2183337..449af2623e 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
picked_0.5.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-picked=
_0.5.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
picked_0.5.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-picked=
_0.5.1.bb</a><br>
@@ -17,4 +17,3 @@ RDEPENDS:${PN} +=3D &quot;\<br>
=C2=A0&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;pytest_picked&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pytest-socket_0.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest=
-socket_0.7.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-pytest-socket_0.7.0.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-pytest-socket_0.7.0.bb</a><br>
index feb2f6fbb5..86b03724a0 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
socket_0.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-socket=
_0.7.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
socket_0.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-socket=
_0.7.0.bb</a><br>
@@ -12,4 +12,3 @@ RDEPENDS:${PN} =3D &quot;python3-pytest&quot;<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;pytest_socket&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pytest-timeout_2.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytes=
t-timeout_2.5.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-pytest-timeout_2.5.0.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-pytest-timeout_2.5.0.bb</a><br>
index 40c0a2085a..8990e29bba 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
timeout_2.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-timeo=
ut_2.5.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
timeout_2.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-timeo=
ut_2.5.0.bb</a><br>
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dd8048cd156e=
da3df2e7f111b0ae9ceff&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;68c9d82dfe95fa65712e107010c9344e7d8b4afe=
8c975a7be0d273d939583a93&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;pytest_timeout&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pytest-xdist_3.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-=
xdist_3.8.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://=
python3-pytest-xdist_3.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-pytest-xdist_3.8.0.bb</a><br>
index 3527539f6f..7b340e8920 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
xdist_3.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-xdist_3=
.8.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
xdist_3.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-xdist_3=
.8.0.bb</a><br>
@@ -15,4 +15,3 @@ RDEPENDS:${PN} +=3D &quot; \<br>
=C2=A0&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;pytest_xdist&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
python-dotenv_1.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-python=
-dotenv_1.2.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-python-dotenv_1.2.1.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-python-dotenv_1.2.1.bb</a><br>
index 22b976dd9c..b16d3c766b 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-python-=
dotenv_1.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-python-dotenv=
_1.2.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-python-=
dotenv_1.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-python-dotenv=
_1.2.1.bb</a><br>
@@ -16,7 +16,6 @@ PACKAGECONFIG:append =3D &quot;${@bb.utils.contains(&#39;=
PTEST_ENABLED&#39;, &#39;1&#39;, &#39; cli&#39;, &#39;&#39;, d<br>
=C2=A0PACKAGECONFIG[cli] =3D &quot;,,,python3-click&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;python_dotenv&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0RDEPENDS:${PN}-ptest +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0coreutils \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
python-multipart_0.0.32.bb" rel=3D"noreferrer" target=3D"_blank">python3-py=
thon-multipart_0.0.32.bb</a> b/meta-python/recipes-devtools/python/<a href=
=3D"http://python3-python-multipart_0.0.32.bb" rel=3D"noreferrer" target=3D=
"_blank">python3-python-multipart_0.0.32.bb</a><br>
index 9b73b9470d..db1a9e0415 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-python-=
multipart_0.0.32.bb" rel=3D"noreferrer" target=3D"_blank">python3-python-mu=
ltipart_0.0.32.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-python-=
multipart_0.0.32.bb" rel=3D"noreferrer" target=3D"_blank">python3-python-mu=
ltipart_0.0.32.bb</a><br>
@@ -7,7 +7,6 @@ SRC_URI[sha256sum] =3D &quot;be54b7f3fa167bb83e4fcd936b887b=
708f4e57fe75911c02aebf53efaf<br>
=C2=A0inherit pypi python_hatchling ptest-python-pytest<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;python_multipart&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
=C2=A0CVE_PRODUCT =3D &quot;python-multipart&quot;<br>
<br>
=C2=A0RDEPENDS:${PN}-ptest +=3D &quot; \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
requests-file_3.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-reques=
ts-file_3.0.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-requests-file_3.0.1.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-requests-file_3.0.1.bb</a><br>
index f796c8ef78..16f04a4cad 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-request=
s-file_3.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-requests-file=
_3.0.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-request=
s-file_3.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-requests-file=
_3.0.1.bb</a><br>
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D9cc728d6087=
e43796227b0a31422de6b&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;f14243d7796c588f3521bd423c5dea2ee4cc730e=
54a3cac9574d78aca1272576&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;requests_file&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi python_setuptools_build_meta ptest-python-pytest<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
rfc3986-validator_0.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-rf=
c3986-validator_0.1.1.bb</a> b/meta-python/recipes-devtools/python/<a href=
=3D"http://python3-rfc3986-validator_0.1.1.bb" rel=3D"noreferrer" target=3D=
"_blank">python3-rfc3986-validator_0.1.1.bb</a><br>
index 9ebc34eabc..28904ef18d 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-rfc3986=
-validator_0.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-rfc3986-v=
alidator_0.1.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-rfc3986=
-validator_0.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-rfc3986-v=
alidator_0.1.1.bb</a><br>
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Da21b13b5a99=
6f08f7e0b088aa38ce9c6&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;3d44bde7921b3b9ec3ae4e3adca370438eccebc6=
76456449b145d533b240d055&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;rfc3986_validator&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
rich-argparse_1.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-rich-a=
rgparse_1.8.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-rich-argparse_1.8.0.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-rich-argparse_1.8.0.bb</a><br>
index 2da95ab053..fa9761b72b 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-rich-ar=
gparse_1.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-rich-argparse=
_1.8.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-rich-ar=
gparse_1.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-rich-argparse=
_1.8.0.bb</a><br>
@@ -4,7 +4,6 @@ LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D06f5c372171ce02f7e6a1=
8f5f57f0b69&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;rich_argparse&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;679df3d832fa94ad6e4bdb07ded088cd7ea2dddc=
58ae9b2b46346a40b06cbc0c&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
scikit-build-core_1.0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-sc=
ikit-build-core_1.0.3.bb</a> b/meta-python/recipes-devtools/python/<a href=
=3D"http://python3-scikit-build-core_1.0.3.bb" rel=3D"noreferrer" target=3D=
"_blank">python3-scikit-build-core_1.0.3.bb</a><br>
index 4a28b119b4..ff5e4c0da0 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-scikit-=
build-core_1.0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-scikit-bu=
ild-core_1.0.3.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-scikit-=
build-core_1.0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-scikit-bu=
ild-core_1.0.3.bb</a><br>
@@ -3,7 +3,6 @@ LICENSE =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D3b4e748e5f102e31c9390=
dcd6fa66f09&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;scikit_build_core&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;python3-hatch-vcs-native&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
scikit-build_0.19.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-scikit=
-build_0.19.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-scikit-build_0.19.1.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-scikit-build_0.19.1.bb</a><br>
index aff4ba4b68..f10e27a049 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-scikit-=
build_0.19.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-scikit-build_=
0.19.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-scikit-=
build_0.19.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-scikit-build_=
0.19.1.bb</a><br>
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D7c96d2b08b3=
cec6d3c67fb864d1fd8cc&quot;<br>
=C2=A0DEPENDS =3D &quot;python3-hatch-vcs-native python3-hatch-fancy-pypi-r=
eadme-native&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;scikit_build&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi python_hatchling<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
service-identity_26.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-se=
rvice-identity_26.1.0.bb</a> b/meta-python/recipes-devtools/python/<a href=
=3D"http://python3-service-identity_26.1.0.bb" rel=3D"noreferrer" target=3D=
"_blank">python3-service-identity_26.1.0.bb</a><br>
index ed855c4027..a603cb247b 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-service=
-identity_26.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-service-i=
dentity_26.1.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-service=
-identity_26.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-service-i=
dentity_26.1.0.bb</a><br>
@@ -9,7 +9,6 @@ SRC_URI[sha256sum] =3D &quot;6358c52882c96e66ac4a55eb3a72c7=
dd4a70763f8cc6fa4e70abde2656<br>
=C2=A0inherit pypi python_hatchling ptest-python-pytest<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;service_identity&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;python3-hatch-vcs-native python3-hatch-fancy-pypi-=
readme-native&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
sijax_0.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-sijax_0.3.2.bb=
</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-sijax_=
0.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-sijax_0.3.2.bb</a><b=
r>
index 4d21650059..dcb9e64d61 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-sijax_0=
.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-sijax_0.3.2.bb</a><br=
>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-sijax_0=
.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-sijax_0.3.2.bb</a><br=
>
@@ -7,6 +7,5 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D16e213d=
75641a392478df50cf0841903&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;11b062f4a8b2aad95c87e7c09e5daf5a6b0d0f08=
abf9efe5f91a0075c6be7c0d&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;Sijax&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
stack-data_0.6.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-stack-dat=
a_0.6.3.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-stack-data_0.6.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-stack=
-data_0.6.3.bb</a><br>
index 8adba7e8a4..c5667d34b7 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-stack-d=
ata_0.6.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-stack-data_0.6.3=
.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-stack-d=
ata_0.6.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-stack-data_0.6.3=
.bb</a><br>
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3Da3d6c15=
f7859ae235a78f2758e5a48cf&quot;<br>
=C2=A0DEPENDS =3D &quot;python3-setuptools-scm-native&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;stack_data&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
strenum_0.4.15.bb" rel=3D"noreferrer" target=3D"_blank">python3-strenum_0.4=
.15.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
strenum_0.4.15.bb" rel=3D"noreferrer" target=3D"_blank">python3-strenum_0.4=
.15.bb</a><br>
index abe5c03d8e..cbe7fcc215 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-strenum=
_0.4.15.bb" rel=3D"noreferrer" target=3D"_blank">python3-strenum_0.4.15.bb<=
/a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-strenum=
_0.4.15.bb" rel=3D"noreferrer" target=3D"_blank">python3-strenum_0.4.15.bb<=
/a><br>
@@ -10,6 +10,5 @@ DEPENDS =3D &quot;python3-pytest-runner-native&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;878fb5ab705442070e4dd1929bb5e2249511c0bc=
f2b0eeacf3bcd80875c82eff&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;StrEnum&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
time-machine_3.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-time-ma=
chine_3.2.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://=
python3-time-machine_3.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-time-machine_3.2.0.bb</a><br>
index e898a43f99..450214a7a4 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-time-ma=
chine_3.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-time-machine_3=
.2.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-time-ma=
chine_3.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-time-machine_3=
.2.0.bb</a><br>
@@ -9,7 +9,6 @@ PYPI_SRC_URI =3D &quot;git://<a href=3D"http://github.com/a=
damchainz/time-machine;protocol=3Dhttps;branch=3Dm" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/adamchainz/time-machine;protocol=3Dhttps;branch=3D=
m</a><br>
=C2=A0inherit pypi python_setuptools_build_meta ptest-python-pytest<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;time_machine&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-tzdata \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
tokenize-rt_6.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-tokenize=
-rt_6.2.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://py=
thon3-tokenize-rt_6.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-to=
kenize-rt_6.2.0.bb</a><br>
index 0f5a1b34d3..ec80ef8ed6 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-tokeniz=
e-rt_6.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-tokenize-rt_6.2=
.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-tokeniz=
e-rt_6.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-tokenize-rt_6.2=
.0.bb</a><br>
@@ -11,7 +11,6 @@ inherit pypi setuptools3 ptest-python-pytest<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;python3-core&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;tokenize_rt&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0do_install_ptest:append() {<br>
=C2=A0 =C2=A0 =C2=A0install -d ${D}${PTEST_PATH}/testing/resources<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
types-psutil_7.2.2.20260518.bb" rel=3D"noreferrer" target=3D"_blank">python=
3-types-psutil_7.2.2.20260518.bb</a> b/meta-python/recipes-devtools/python/=
<a href=3D"http://python3-types-psutil_7.2.2.20260518.bb" rel=3D"noreferrer=
" target=3D"_blank">python3-types-psutil_7.2.2.20260518.bb</a><br>
index ba8051ce5c..f7f3f8e758 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-types-p=
sutil_7.2.2.20260518.bb" rel=3D"noreferrer" target=3D"_blank">python3-types=
-psutil_7.2.2.20260518.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-types-p=
sutil_7.2.2.20260518.bb" rel=3D"noreferrer" target=3D"_blank">python3-types=
-psutil_7.2.2.20260518.bb</a><br>
@@ -4,7 +4,6 @@ LICENSE =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dec038232ab86edd7354b0=
91c54e190e2&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;types_psutil&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
wand_0.7.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-wand_0.7.2.bb</=
a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-wand_0.7=
.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-wand_0.7.2.bb</a><br>
index 305aeaeb11..2eeb2cb9f9 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-wand_0.=
7.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-wand_0.7.2.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-wand_0.=
7.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-wand_0.7.2.bb</a><br>
@@ -11,7 +11,6 @@ SRC_URI[sha256sum] =3D &quot;0387fd08848d00cadd1d885fcb19=
a17dd4250df2029e5338b6b668b7fe<br>
=C2=A0inherit pypi python_setuptools_build_meta ptest<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;wand&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0FILES:${PN}-doc +=3D &quot;${datadir}/README.rst&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
wheezy-template_3.2.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-whee=
zy-template_3.2.5.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"h=
ttp://python3-wheezy-template_3.2.5.bb" rel=3D"noreferrer" target=3D"_blank=
">python3-wheezy-template_3.2.5.bb</a><br>
index 612b3ff106..fab0d5106a 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-wheezy-=
template_3.2.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-wheezy-temp=
late_3.2.5.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-wheezy-=
template_3.2.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-wheezy-temp=
late_3.2.5.bb</a><br>
@@ -4,7 +4,6 @@ LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dfa10554c46b94944529c6=
a886cf85631&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;wheezy_template&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;c7c0bf85af0f70ca2ef4b6ea9a74ef372f73392a=
a17bea0d885dcba7356d0867&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
wpa-supplicant_0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-wpa-sup=
plicant_0.2.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://=
python3-wpa-supplicant_0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-wpa-supplicant_0.2.bb</a><br>
index 68ff6c1863..17149bbadb 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-wpa-sup=
plicant_0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-wpa-supplicant=
_0.2.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-wpa-sup=
plicant_0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-wpa-supplicant=
_0.2.bb</a><br>
@@ -9,7 +9,6 @@ SRC_URI[sha256sum] =3D &quot;3ad0f40a696763bb0f4d4dec5b51f6=
b53ccfeb7c16ebb5897349303045<br>
=C2=A0SRC_URI +=3D &quot;file://0001-cli-drop-the-second-argument-from-clic=
k.argument-dec.patch&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;wpa_supplicant&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
xlsxwriter_3.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-xlsxwrite=
r_3.2.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-xlsxwriter_3.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-xlsxw=
riter_3.2.1.bb</a><br>
index a1fd09af49..eccdc83ca2 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-xlsxwri=
ter_3.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-xlsxwriter_3.2.1=
.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-xlsxwri=
ter_3.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-xlsxwriter_3.2.1=
.bb</a><br>
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3Da4bab8d=
f34a9a138b4e0ca56b8559a05&quot;<br>
=C2=A0inherit pypi setuptools3<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;XlsxWriter&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-crypt \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
xstatic-font-awesome_6.2.1.2.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n3-xstatic-font-awesome_6.2.1.2.bb</a> b/meta-python/recipes-devtools/pytho=
n/<a href=3D"http://python3-xstatic-font-awesome_6.2.1.2.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-xstatic-font-awesome_6.2.1.2.bb</a><br>
index b8c02dc40b..97e6dcd66f 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-xstatic=
-font-awesome_6.2.1.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-xsta=
tic-font-awesome_6.2.1.2.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-xstatic=
-font-awesome_6.2.1.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-xsta=
tic-font-awesome_6.2.1.2.bb</a><br>
@@ -5,7 +5,6 @@ LICENSE =3D &quot;CC-BY-4.0 AND MIT AND OFL-1.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://xstatic/pkg/font_awesome/data/LICEN=
SE.txt;md5=3D57f9201afe70f877988912a7b233de47&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;xstatic_font_awesome&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;9f3cb2f038fad7d352722375d3f25af346da9ee0=
93ed9dc2c8c46bd911ab1971&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
xstatic_1.0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-xstatic_1.0.=
3.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-xs=
tatic_1.0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-xstatic_1.0.3.=
bb</a><br>
index bf542aba5a..ed73aa48b0 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-xstatic=
_1.0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-xstatic_1.0.3.bb</a=
><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-xstatic=
_1.0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-xstatic_1.0.3.bb</a=
><br>
@@ -5,7 +5,6 @@ LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://README.txt;md5=3D1418684272f85f400c=
ebf1b1a255c5cd&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;XStatic&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://0001-remove-pkg_resources-import.patch&quot=
;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;402544cc9e179489441054f09c807804e115ea24=
6907de87c0355fb4f5a31268&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
zopeevent_5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-zopeevent_5.=
0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-zo=
peevent_5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-zopeevent_5.0.=
bb</a><br>
index f03ab22d24..4d914c63e9 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-zopeeve=
nt_5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-zopeevent_5.0.bb</a=
><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-zopeeve=
nt_5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-zopeevent_5.0.bb</a=
><br>
@@ -6,6 +6,5 @@ LIC_FILES_CHKSUM =3D &quot;file://PKG-INFO;beginline=3D8;en=
dline=3D8;md5=3D72092419572155ddc2<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;bac440d8d9891b4068e2b5a2c5e2c9765a9df762=
944bda6955f96bb9b91e67cd&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;zope.event&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
zopeinterface_8.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-zopeinte=
rface_8.6.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://py=
thon3-zopeinterface_8.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-zo=
peinterface_8.6.bb</a><br>
index f79444c7ba..370e07889f 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-zopeint=
erface_8.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-zopeinterface_8=
.6.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-zopeint=
erface_8.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-zopeinterface_8=
.6.bb</a><br>
@@ -3,7 +3,6 @@ LICENSE =3D &quot;ZPL-2.1&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D78ccb3640dc841e1b=
aecb3e27a6966b2&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;zope_interface&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
<br>
diff --git a/meta-python/recipes-devtools/python3-rouge-score/<a href=3D"ht=
tp://python3-rouge-score_0.1.2.bb" rel=3D"noreferrer" target=3D"_blank">pyt=
hon3-rouge-score_0.1.2.bb</a> b/meta-python/recipes-devtools/python3-rouge-=
score/<a href=3D"http://python3-rouge-score_0.1.2.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">python3-rouge-score_0.1.2.bb</a><br>
index 6d07f5451f..722956a8e2 100644<br>
--- a/meta-python/recipes-devtools/python3-rouge-score/<a href=3D"http://py=
thon3-rouge-score_0.1.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-ro=
uge-score_0.1.2.bb</a><br>
+++ b/meta-python/recipes-devtools/python3-rouge-score/<a href=3D"http://py=
thon3-rouge-score_0.1.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-ro=
uge-score_0.1.2.bb</a><br>
@@ -15,6 +15,5 @@ RDEPENDS:${PN} =3D &quot;\<br>
=C2=A0inherit setuptools3 pypi<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;rouge_score&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;c7d4da2683e68c9abf0135ef915d63a46643666f=
848e558a1b9f7ead17ff0f04&quot;<br>
diff --git a/meta-python/recipes-devtools/python3-wxgtk4/<a href=3D"http://=
python3-wxgtk4_4.2.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-wxgtk=
4_4.2.5.bb</a> b/meta-python/recipes-devtools/python3-wxgtk4/<a href=3D"htt=
p://python3-wxgtk4_4.2.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-w=
xgtk4_4.2.5.bb</a><br>
index e1d8ed06e1..5305093b2f 100644<br>
--- a/meta-python/recipes-devtools/python3-wxgtk4/<a href=3D"http://python3=
-wxgtk4_4.2.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-wxgtk4_4.2.5=
.bb</a><br>
+++ b/meta-python/recipes-devtools/python3-wxgtk4/<a href=3D"http://python3=
-wxgtk4_4.2.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-wxgtk4_4.2.5=
.bb</a><br>
@@ -9,7 +9,6 @@ DEPENDS =3D &quot;python3-attrdict3-native python3-six-nati=
ve wxwidgets-native \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;wxpython&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://add-back-option-build-base.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://wxgtk-fixup-build-scripts.=
patch \<br>
diff --git a/meta-python/recipes-extended/python3-gpt-image/<a href=3D"http=
://python3-gpt-image_0.9.1.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-gpt-image_0.9.1.bb</a> b/meta-python/recipes-extended/python3-gpt-image/<a=
 href=3D"http://python3-gpt-image_0.9.1.bb" rel=3D"noreferrer" target=3D"_b=
lank">python3-gpt-image_0.9.1.bb</a><br>
index 4255de4199..b3c89e5588 100644<br>
--- a/meta-python/recipes-extended/python3-gpt-image/<a href=3D"http://pyth=
on3-gpt-image_0.9.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-gpt-im=
age_0.9.1.bb</a><br>
+++ b/meta-python/recipes-extended/python3-gpt-image/<a href=3D"http://pyth=
on3-gpt-image_0.9.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-gpt-im=
age_0.9.1.bb</a><br>
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dd91d608dc8f=
12334a889700389229b7b&quot;<br>
=C2=A0DEPENDS +=3D &quot;python3-pip&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;gpt_image&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;07363562ec1cf5b50319ad0389486b576ed43c46=
82a16a8286822af9fd1f4594&quot;<br>
<br>
diff --git a/meta-python/recipes-extended/send2trash/<a href=3D"http://pyth=
on3-send2trash_2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-send2=
trash_2.1.0.bb</a> b/meta-python/recipes-extended/send2trash/<a href=3D"htt=
p://python3-send2trash_2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n3-send2trash_2.1.0.bb</a><br>
index 147603a45b..746a41b2c4 100644<br>
--- a/meta-python/recipes-extended/send2trash/<a href=3D"http://python3-sen=
d2trash_2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-send2trash_2=
.1.0.bb</a><br>
+++ b/meta-python/recipes-extended/send2trash/<a href=3D"http://python3-sen=
d2trash_2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-send2trash_2=
.1.0.bb</a><br>
@@ -8,7 +8,6 @@ SRC_URI +=3D &quot;file://run-ptest&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;1c72b39f09457db3c05ce1d19158c2cbef4c32b8=
bedd02c155e49282b7ea7459&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;send2trash&quot;<br>
-UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-io \<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#129744): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/129744" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/129744</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121072317/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121072317/1997914</a><br>
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

--000000000000f43bea065a99f47a--

