Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B09C0218B
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 03:57:29 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.4215.1737691035841702370
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jan 2025 19:57:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K2SCvVfL;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2a0206590a7so1021857fac.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jan 2025 19:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737691035; x=1738295835; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZgAaAPSPFRQRJkL+K9vCl9eMo0gvQsYUa063DX655U=;
        b=K2SCvVfL1Te8Jf5HZ5SFATaogPilacFZo81l0vJeppc/IUsHtJA29XBLQXvvgljAbq
         N1xa/yeP9mP+JH550XQGYTlkZTotCHM7WnSBMBdkiJ5uYXxrhTII0iIj5mc2k7mkhlKw
         4WEV9k2boW1iaC+i12h6KRlviLbFv9Y7EaS7C6sHxrrD33vGAiUPjlOwcwsShVkdTNXo
         6Sqqy/oFZ1K62VhHETaaEc0plpPDvwe9IisuJ1mRsWUvjMayMzwvmXlklv30TAhpHF+9
         AnDEVhOcX/fMLjAC0uUwqRY9vAxCeFQ65ZKm+n9d8A24lR9JUw/2/y4/bRqFGnZNMq7E
         bxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737691035; x=1738295835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZgAaAPSPFRQRJkL+K9vCl9eMo0gvQsYUa063DX655U=;
        b=Y3tK4fpDdqn6ckDt2fm8EMNkLDgnNKH/HNfZEgxFgMbc3iVNV3HjLdQitAAw9Wbcbj
         oSA1HJQrk2EHZWf/YwZY8/dv9zAfLFoayxz00gs4WnvQttUccv6ms6/LLwidTjNOapCm
         T5/3kvC9ulp8N1tqOQZ4Sm/5SZeawNsY7i054luOPFw/2rEuTjkOTX5D3EJ7r2ziOXQp
         acjVnjZruUTQgTKpKiuwOSL+8lZJdNfoUn9aCyeIIfqM5V1olUB+4rGY47WPH5VAqECO
         SGP3UkTw09yaW1aCc5r2sZx9QeVFTljF3Q7o4j/fkYxenvQ0bJlkwQtu1jK9d1+TbyeG
         RnUw==
X-Gm-Message-State: AOJu0YxJ0JGab6/dimw/MiOfiNHlCXdyul4LkY3+xICWKjcg1hRCRZxP
	1D7jeJ+7bwwhqXpxyrW4nw3qDPWZ71XG9AH2zwuMXGqhTmsL7UHCZ8vc2Eb8cgLVmF0hWf+JJRh
	kcAGSYYHGcgcGY08QpHQtSkpfWAA=
X-Gm-Gg: ASbGncv/HUJu0mNJuVpOczys6O1EvpM+/sF1VE73bZAsQiXLhgi7fa5uOe93R43iXEi
	CXhOuxvE018lQhuDyytifO0G5vTl6vI8emFZHfzacl+NHuGqGq/1pydX5JIA+d3YC5a2f1VoeJX
	XL
X-Google-Smtp-Source: AGHT+IHY3/CCYtfuPAJasBXE6mN6VnwKST5ZKWPCsQEKeSsYLI4yUEazDBwgqVYHirxrEvbVc+8HQHPfFhnFag1KkmM=
X-Received: by 2002:a05:6871:5317:b0:29e:d36:6e39 with SMTP id
 586e51a60fabf-2b1c08c6401mr18950511fac.10.1737691035032; Thu, 23 Jan 2025
 19:57:15 -0800 (PST)
MIME-Version: 1.0
References: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com> <1737360846-4824-26-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1737360846-4824-26-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Jan 2025 19:56:49 -0800
X-Gm-Features: AWEUYZl5LzI4J3IPaSBZUj5eEe8M677jrtKCeSyORSlrk9BucOUnCqUm2xDPiYk
Message-ID: <CAMKF1soSF+zmrhhmZMXgUE883P=YROM3Gbw0iXe4-pC7bhLoPg@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH 26/32] python3-semver: upgrade 3.0.2 -> 3.0.3
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 03:57:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115047

ptests fails with this version

file /usr/lib/python3-semver/ptest/tests/test_semver.py, line 27
  def test_should_versioninfo_to_dict(version):
E       fixture 'version' not found
>       available fixtures: cache, capfd, capfdbinary, caplog, capsys, caps=
ysbinary, doctest_namespace, monkeypatch, pytestconfig, record_property, re=
cord_testsuite_property, record_xml_attribute, recwarn, tmp_path, tmp_path_=
factory, tmpdir, tmpdir_factory
>       use 'pytest --fixtures [testpath]' for help on them.

/usr/lib/python3-semver/ptest/tests/test_semver.py:27
ERROR: tests/test_semver.py:test_should_versioninfo_to_dict

file /usr/lib/python3-semver/ptest/tests/test_semver.py, line 33
  def test_should_versioninfo_to_tuple(version):
E       fixture 'version' not found
>       available fixtures: cache, capfd, capfdbinary, caplog, capsys, caps=
ysbinary, doctest_namespace, monkeypatch, pytestconfig, record_property, re=
cord_testsuite_property, record_xml_attribute, recwarn, tmp_path, tmp_path_=
factory, tmpdir, tmpdir_factory
>       use 'pytest --fixtures [testpath]' for help on them.

/usr/lib/python3-semver/ptest/tests/test_semver.py:33
ERROR: tests/test_semver.py:test_should_versioninfo_to_tuple

file /usr/lib/python3-semver/ptest/tests/test_semver.py, line 39
  def test_version_info_should_be_iterable(version):
E       fixture 'version' not found
>       available fixtures: cache, capfd, capfdbinary, caplog, capsys, caps=
ysbinary, doctest_namespace, monkeypatch, pytestconfig, record_property, re=
cord_testsuite_property, record_xml_attribute, recwarn, tmp_path, tmp_path_=
factory, tmpdir, tmpdir_factory
>       use 'pytest --fixtures [testpath]' for help on them.

/usr/lib/python3-semver/ptest/tests/test_semver.py:39
ERROR: tests/test_semver.py:test_version_info_should_be_iterable

On Mon, Jan 20, 2025 at 12:14=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> License-Update: Replace organization placeholder
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - Use meta directive for SEO
> - Move search box more at the top
> - Update workflow file
> - Improve type hints to fix TODOs
> - Gha add python313
> - Improve private _nat_cmp() method
> - Modernize project configs with pyproject.toml
> - Turn our Markdown issue templates into YAML
> - Fix comparison with subclasses
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{python3-semver_3.0.2.bb =3D> python3-semver_3.0.3.bb}      | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-semver_3.0.2.bb =3D>=
 python3-semver_3.0.3.bb} (67%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-semver_3.0.2.bb =
b/meta-python/recipes-devtools/python/python3-semver_3.0.3.bb
> similarity index 67%
> rename from meta-python/recipes-devtools/python/python3-semver_3.0.2.bb
> rename to meta-python/recipes-devtools/python/python3-semver_3.0.3.bb
> index b329d65e1f..6767c70da2 100644
> --- a/meta-python/recipes-devtools/python/python3-semver_3.0.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-semver_3.0.3.bb
> @@ -2,9 +2,9 @@ DESCRIPTION =3D "Python module for Semantic Versioning"
>  HOMEPAGE =3D "https://github.com/python-semver/python-semver"
>  BUGTRACKER =3D "https://github.com/python-semver/python-semver"
>  LICENSE =3D "BSD-3-Clause"
> -LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dd9da679db3bdce30a1b4328d5=
c474f98"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D3ce011bad2c5218ddd4973952=
a6db93a"
>
> -SRC_URI[sha256sum] =3D "6253adb39c70f6e51afed2fa7152bcd414c411286088fb4b=
9effb133885ab4cc"
> +SRC_URI[sha256sum] =3D "8769a03a93507fecdf19b6eefb08d5e95b462504871a61e2=
9e09798822888c94"
>
>  inherit pypi python_setuptools_build_meta ptest-python-pytest
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114988): https://lists.openembedded.org/g/openembedde=
d-devel/message/114988
> Mute This Topic: https://lists.openembedded.org/mt/110711751/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

