Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 276C3C4332F
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 20:32:37 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web12.29.1668025952158292481
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Nov 2022 12:32:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YCbjynyL;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id j4so27816011lfk.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Nov 2022 12:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odEfWisemxN4Pmkga/lHzXifwrHPXL3BBj7RU++ogDA=;
        b=YCbjynyLyZkYSYUMVkDvJ/WnNRZ0nDS9UV87xvukg9V5MMqr0VIxVb1ZIthzY3G8tN
         33frG0DOCwcm5JeGH+cPy2NrnNaA3MfQRc2IgCqPBcwctaJz4Dq4pOSE7X9nFk14LEvO
         syDb/obq+V4sfBJAnqyc/RfC7jDp8viXKgtNIQ35vNBC6X6CfhgiojpVCiah39mk3mc4
         vZxfuXeOoVksD+KXz5tnc9E1bGmTIAmyHv/HnHi1pvVv1Us3AhpCvwPje+1uhNzppuPe
         9V0FbPVrLHyQvIKRn7xg+tewTvpoOMn8KYmm5EjZPIqIJGQNNl+myAf6pEJDcZ/ELOgb
         37Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=odEfWisemxN4Pmkga/lHzXifwrHPXL3BBj7RU++ogDA=;
        b=6011IHsfKrMcIamW4n9J1ValBmdEYrJYG6EcTnDvvdyMcS0V6u7DaIlWRQ0rQs+3XT
         CXOKccOYpISqpNaGkqQJnVhDexZNupe4E25udYtpXbQTBTAbed/cc1i+VhKuB8Qmbb0L
         k+D0rM/mziP1a1K/MpgDpiOm29rjJma3VKsA/ECQxE9FPyWU2OuVGb592De3RGzinfMD
         wwntfmaSWOR+fiw9Hco6tEyZVqWebK5C74riV/VvR6eekkbat+dJf5fsECqSWTwy1OhJ
         RRvIxl+8hIXEmPxnhJ562RgVc9f3wV0Wx/8xF8CFSL/A5Qdj5lMhPTgKQ02zFq+xRMP1
         EgJw==
X-Gm-Message-State: ACrzQf0qUyLlcCqdout+rOV2MKH2yrHPNZVpdAhJhb56+L6Trf3ltqSf
	rZMpyXzWXJV06G7h3VvsJMFzoEuBXgJXJD/7j5A=
X-Google-Smtp-Source: AMsMyM7b51/n2XGS8nGSSHdL0o3WfmhymhmuP2BIMm54KVybUi5dSUG3tpgu8i+SlGE7stTPnAtA9ZfjPtrtRbRSltU=
X-Received: by 2002:a05:6512:4016:b0:4a4:6edb:8d6e with SMTP id
 br22-20020a056512401600b004a46edb8d6emr22930997lfb.393.1668025950250; Wed, 09
 Nov 2022 12:32:30 -0800 (PST)
MIME-Version: 1.0
References: <20221109200558.2034000-1-alex@linutronix.de> <20221109200558.2034000-2-alex@linutronix.de>
 <CA+chaQdcgf-CTZHQTNooWgYnM5HbJygXucGnizaKoqmbCcCvMw@mail.gmail.com>
In-Reply-To: <CA+chaQdcgf-CTZHQTNooWgYnM5HbJygXucGnizaKoqmbCcCvMw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 9 Nov 2022 21:32:18 +0100
Message-ID: <CANNYZj-HjY+JdC39wPLC1v+o0VWcErY8ivPf1+bTGto0Ns1_NQ@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/2] lirc: correctly use PYTHONPATH
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Nov 2022 20:32:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99511

This was re-set by devtool modify/devtool finish, I didn't
specifically adjust it.

The styleguide says either way is ok. I'd suggest we spend our time on
more important matters.

Alex

On Wed, 9 Nov 2022 at 21:16, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Please don't change SRC_URI indentation, meta-oe uses 4 spaces for indent=
ation with closing quote as the first character as described on https://www=
.openembedded.org/wiki/Styleguide
>
> On Wed, Nov 9, 2022 at 9:06 PM Alexander Kanavin <alex.kanavin@gmail.com>=
 wrote:
>>
>> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> ---
>>  ...ot-clobber-PYTHONPATH-from-build-env.patch | 55 +++++++++++++++++++
>>  .../recipes-connectivity/lirc/lirc_0.10.2.bb  | 21 +++----
>>  2 files changed, 66 insertions(+), 10 deletions(-)
>>  create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-connectiv=
ity/lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.pat=
ch
>>
>> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lir=
c/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch b/me=
ta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Makefi=
le.am-do-not-clobber-PYTHONPATH-from-build-env.patch
>> new file mode 100644
>> index 000000000..089ed23c7
>> --- /dev/null
>> +++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/=
0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch
>> @@ -0,0 +1,55 @@
>> +From 5e3b74927b4fef03d91518d235e9e3ba8cd7ab2e Mon Sep 17 00:00:00 2001
>> +From: Alexander Kanavin <alex@linutronix.de>
>> +Date: Wed, 9 Nov 2022 20:49:41 +0100
>> +Subject: [PATCH] Makefile.am: do not clobber PYTHONPATH from build envi=
ronment
>> +
>> +This environment variable has special significance for python,
>> +and so lirc's variable has to be named something else.
>> +
>> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> +---
>> + Makefile.am       | 2 +-
>> + pylint.mak        | 2 +-
>> + tools/Makefile.am | 2 +-
>> + 3 files changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/Makefile.am b/Makefile.am
>> +index 6718af1..fae423e 100644
>> +--- a/Makefile.am
>> ++++ b/Makefile.am
>> +@@ -128,7 +128,7 @@ endif
>> +
>> + pylint: .phony
>> +       $(MAKE) -C tools pylint
>> +-      -PYTHONPATH=3D$(PYTHONPATH) $(PYLINT) --rcfile=3Dpylint.conf \
>> ++      -PYTHONPATH=3D$(LIRCPYTHONPATH) $(PYLINT) --rcfile=3Dpylint.conf=
 \
>> +       --msg-template=3D'$(pylint_template)' $(py_PYTHON)
>> +
>> + pep8: $(py_PYTHON)
>> +diff --git a/pylint.mak b/pylint.mak
>> +index bf427ab..2692951 100644
>> +--- a/pylint.mak
>> ++++ b/pylint.mak
>> +@@ -1,5 +1,5 @@
>> + PYTHONPATH1      =3D $(abs_top_srcdir)/python-pkg/lirc:
>> + PYTHONPATH2      =3D $(abs_top_srcdir)/python-pkg/lirc/lib/.libs
>> +-PYTHONPATH       =3D $(PYTHONPATH1):$(PYTHONPATH2)
>> ++LIRCPYTHONPATH   =3D $(PYTHONPATH1):$(PYTHONPATH2)
>> + PYLINT           =3D python3-pylint
>> + pylint_template  =3D {path}:{line}: [{msg_id}({symbol}), {obj}] {msg}
>> +diff --git a/tools/Makefile.am b/tools/Makefile.am
>> +index 85d1fd0..96b17f8 100644
>> +--- a/tools/Makefile.am
>> ++++ b/tools/Makefile.am
>> +@@ -142,7 +142,7 @@ force-pylint: .phony
>> +
>> + pylint: .pylint-stamp
>> + .pylint-stamp: $(py_sources)
>> +-      -PYTHONPATH=3D$(PYTHONPATH) $(PYLINT) --rcfile=3D../pylint.conf =
\
>> ++      -PYTHONPATH=3D$(LIRCPYTHONPATH) $(PYLINT) --rcfile=3D../pylint.c=
onf \
>> +       --msg-template=3D'$(pylint_template)' $? && touch $@
>> +
>> + .phony:
>> +--
>> +2.30.2
>> +
>> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lir=
c/lirc_0.10.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/=
lirc/lirc_0.10.2.bb
>> index 234d347af..458d9d7cd 100644
>> --- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_=
0.10.2.bb
>> +++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_=
0.10.2.bb
>> @@ -11,16 +11,17 @@ DEPENDS =3D "libxslt-native alsa-lib libftdi libusb1=
 libusb-compat jack portaudio-
>>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a=
4263"
>>
>>  SRC_URI =3D "http://prdownloads.sourceforge.net/lirc/lirc-${PV}.tar.bz2=
 \
>> -    file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
>> -    file://fix_build_errors.patch \
>> -    file://0001-mplay-Fix-build-with-musl.patch \
>> -    file://lircd.service \
>> -    file://lircd.init \
>> -    file://lircexec.init \
>> -    file://lircd.conf \
>> -    file://lirc_options.conf \
>> -    file://lirc.tmpfiles \
>> -"
>> +           file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patc=
h \
>> +           file://fix_build_errors.patch \
>> +           file://0001-mplay-Fix-build-with-musl.patch \
>> +           file://lircd.service \
>> +           file://lircd.init \
>> +           file://lircexec.init \
>> +           file://lircd.conf \
>> +           file://lirc_options.conf \
>> +           file://lirc.tmpfiles \
>> +           file://0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build=
-env.patch \
>> +           "
>>  SRC_URI[sha256sum] =3D "3d44ec8274881cf262f160805641f0827ffcc20ade0d85e=
7e6f3b90e0d3d222a"
>>
>>  SYSTEMD_PACKAGES =3D "lirc lirc-exec"
>> --
>> 2.30.2
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#99509): https://lists.openembedded.org/g/openembedde=
d-devel/message/99509
>> Mute This Topic: https://lists.openembedded.org/mt/94921643/3617156
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
Martin.Jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

