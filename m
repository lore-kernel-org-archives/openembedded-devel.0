Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD59DC001B0
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 14:55:40 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web10.13366.1690383335294319016
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jul 2023 07:55:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=RXdeqDrI;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-565db4666d7so4258912eaf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jul 2023 07:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690383334; x=1690988134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0OCQ0X55iG2WiLyjCgwBTbgFSJKnjT+peWDGP8u/6d4=;
        b=RXdeqDrIle3r1ZMot1/SfNzeZmRj7uvwsrE/hiFTcYpO3HPE6KQbE5c00Uxo3NuxZb
         Di3IKIPZdTBLXaZjyjVC/ZNBD8sJn6lok+0uNgnYXfj0BTXv7DdyiK2DXLYQElYmJDpc
         Piplgil0ljh7RPXiiGrHNI2/AgxUsFe7oq37V0WTotDurqlxzfS+xjk6x+QFORPsx0nA
         ok+3om60w+mLAIclylM1L9Idu8hQ3ohnIPL4VdwRqJMJo6/qhhaRQtayQ8EMaXFK1DRX
         ups4fbipcgm0VO04N+VQrNdKnAdTTvRC+EB+cGqBab5IHRI0inY+OJ4IuPlzCOwKfvkb
         0iVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690383334; x=1690988134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0OCQ0X55iG2WiLyjCgwBTbgFSJKnjT+peWDGP8u/6d4=;
        b=dzN7mKsz3TieEXQZZvMLQdb209xh2ezVOiaokm6xsX6RpcqggJp0insVZ3OVAvo9Fo
         /h8F6NS+QRIWZBb0VtR/Lsay99f9uEjLL06Wn0DVu+j373R3BkhaCmTsK3PqVHodk4D5
         seWz4XWZNsR6AgE97InIxniTVkBSH9IuDH80MDMqCOz5d+GG/QWn0QcSrL+8Qnd0ukQo
         xhXmZwJbQTZMkU5li3sEaz2mrIcDZ5Vxv3ZpWPxGnfFwgGUXWRibY8b5VnlRn0Jz+JHf
         GV6e71JXTMLA/Cm7UPjJEUFsbyIU62E8YAvon0wLagZt7NE7qe0qXQG65kjBF0xmONap
         0ZHg==
X-Gm-Message-State: ABy/qLaPeQqmsfp5rNG+PoQ+QmtBMcXGoYRinaetLrN5mBMThZ5IU/SO
	IwflS5Ww5NEqcd9Au70tHa2vP2hhYXy+FPpraa94tDa/9kJtVw==
X-Google-Smtp-Source: APBJJlECy+iLRNrZG+5JthB76N0b9K0Vf7CPthwZCKq3AAhhU89L6PZcfGgrzsDcHd8Q8RqnKxkGeVpVpRXg9UsiqLo=
X-Received: by 2002:a4a:2751:0:b0:563:649b:c958 with SMTP id
 w17-20020a4a2751000000b00563649bc958mr1527049oow.8.1690383334212; Wed, 26 Jul
 2023 07:55:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230725190947.660933-1-tgamblin@baylibre.com> <20230725190947.660933-5-tgamblin@baylibre.com>
In-Reply-To: <20230725190947.660933-5-tgamblin@baylibre.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Jul 2023 07:55:08 -0700
Message-ID: <CAMKF1spVXq_P1Y-VsmMR+MvYXobHQZO1OMnoda9hR4mPomrpTQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 5/7] python3-pyaudio: upgrade 0.2.11 -> 0.2.13
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jul 2023 14:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104036

its failing for me

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2933/step=
s/14/logs/stdio

If there is a quick fix that will be good, since its already escaped
into master, I will have to revert it otherwise.

On Tue, Jul 25, 2023 at 12:09=E2=80=AFPM Trevor Gamblin <tgamblin@baylibre.=
com> wrote:
>
> License-Update: Move to LICENSE.txt
>
> Changelog:
>
> 2022-12-26  Hubert Pham  <hubert@mit.edu>
>
>   PyAudio 0.2.13
>
>   * Move pyaudio.Stream to pyaudio.PyAudio.Stream.
>     The pyaudio.Stream class is now pyaudio.PyAudio.Stream, nested under =
the
>     existing pyaudio.PyAudio class. This should not affect existing code,=
 as
>     directly accessing the module-level pyaudio.Stream class has always b=
een
>     unsupported (use PyAudio.open instead). Accessing pyaudio.Stream
>     directly is deprecated and will raise a DeprecationWarning.
>
>   * Deprecate PaMacCoreStreamInfo's get_channel_map() and get_flags() met=
hods.
>     Use the channel_map and flags properties, respectively, instead. Also
>     deprecates internal method _get_host_api_stream_object. Calling
>     deprecated methods will raise a DeprecationWarning.
>
>   * Package PyAudio as an actual package (directory).
>     Previously, the library deployed a single pyaudio.py file and a C
>     extension module to the root of site-packages. Now, the library deplo=
ys
>     a Python package.
>
>   * Add default shared library path for Homebrew installations on Apple S=
ilicon.
>
>   * Refactor and cleanup.
>     - Refactor C extension for better maintainability.
>     - Add more unit tests.
>     - Update and modernize examples directory.
>     - Improve C and python style conformance, plus many cosmetic updates.
>
> 2022-07-18  Hubert Pham  <hubert@mit.edu>
>
>   PyAudio 0.2.12
>
>   - Modernize build process for Microsoft Windows, using the native toolc=
hain.
>
>     Setuptool setup.py and INSTALL instructions are more streamlined.
>     Building from Cygwin/MinGW is no longer supported nor tested.
>
>     Thanks to Sean Zimmermann for the patches and general help!
>
>   - Change default frames per buffer size to paFramesPerBufferUnspecified=
.
>
>     Previously, pyaudio.py set a default frames per buffer size of 1024,
>     which can lead to dropped frames on some systems.  Now, by default,
>     PortAudio selects the buffer size based on host and latency
>     requirements.
>
>     Thanks to Jason Hihn for the suggestion!
>
>   - Minor fixes and refactoring for compatibility with Python 3.7+.
>
>     Updates include:
>     * Remove call to deprecated PyEval_InitThreads() for Python 3.7+
>     * Use Py_ssize_t types in appropriate places (for Python 3.10+).
>     * Remove the min macro to ease compilation for Windows.
>
>   - Use the locale's preferred encoding to decode device names.
>
>     Thanks to Eiichi Takamori for the patch!
>
>   - Unit tests: add skipIf decorators to skip tests that require hardware=
.
>
>     Set the PYAUDIO_SKIP_HW_TESTS environment variable to disable tests t=
hat
>     require sound hardware, useful for (automated) test environments with=
out
>     access to audio devices.
>
>     Thanks to Mat=C4=9Bj Cepl for the suggestion and patch!
>
>   - Documentation, examples, and unit tests: various fixes.
>     * Add more unit tests and repair a few that test the GIL on macOS.
>     * Remove examples/error.py, which is redundant with tests/error_tests=
.py.
>     * Fix type documentation of return value types in docstrings.
>
>     Thanks to Vasily Zakharov for pointing out the return-value type erro=
rs!
>
>   - Modernize packaging: add LICENSE.txt, pyproject.toml, and classifiers=
.
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  ...{python3-pyaudio_0.2.11.bb =3D> python3-pyaudio_0.2.13.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-pyaudio_0.2.11.bb =
=3D> python3-pyaudio_0.2.13.bb} (53%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyaudio_0.2.11.b=
b b/meta-python/recipes-devtools/python/python3-pyaudio_0.2.13.bb
> similarity index 53%
> rename from meta-python/recipes-devtools/python/python3-pyaudio_0.2.11.bb
> rename to meta-python/recipes-devtools/python/python3-pyaudio_0.2.13.bb
> index 802ca35100..dbeed9c2d8 100644
> --- a/meta-python/recipes-devtools/python/python3-pyaudio_0.2.11.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyaudio_0.2.13.bb
> @@ -1,12 +1,12 @@
>  SUMMARY =3D "PyAudio provides Python bindings for PortAudio, the cross-p=
latform audio I/O library"
>  SECTION =3D "devel/python"
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://README;md5=3D288793c2b9b05bd67abbd2a8f5d144=
f7"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D7c3152b432b96d6dc4a1cb353=
97da9ec"
>
>  PYPI_PACKAGE =3D "PyAudio"
>
> -SRC_URI[md5sum] =3D "7e4c88139284033f67b4336c74eda3b8"
> -SRC_URI[sha256sum] =3D "93bfde30e0b64e63a46f2fd77e85c41fd51182a4a3413d9e=
dfaf9ffaa26efb74"
> +SRC_URI[md5sum] =3D "41199ffd2abbdaf1ce6b88cf8af48cc5"
> +SRC_URI[sha256sum] =3D "26bccc81e4243d1c0ff5487e6b481de6329fcd65c79365c2=
67cef38f363a2b56"
>
>  inherit pypi setuptools3
>
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104022): https://lists.openembedded.org/g/openembedde=
d-devel/message/104022
> Mute This Topic: https://lists.openembedded.org/mt/100356782/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

