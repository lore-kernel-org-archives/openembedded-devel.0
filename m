Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D37C433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 12:51:32 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.5670.1642596689470054640
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jan 2022 04:51:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=vXO+29sX;
 spf=pass (domain: burtonini.com, ip: 209.85.128.47,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f47.google.com with SMTP id w26so5366423wmi.0
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jan 2022 04:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vSPVRMk6WCRWzA07+viTOHloYjMDCG/U92A4QQA3hzA=;
        b=vXO+29sXtypr9axBHBJgx3g/aESBkYRaeVe3NS18/g5DEn4yE0VBdRNtYWYMXCkEgT
         mi8IAB4dOILIrDJ40O02qru27W+k4mCpBMqf1588N7FJMU2a3vfV4EBnoUJx/I0l19op
         Sees2/xEdVe7UwjmSnxYR9OuVlMnvSo4QVBCX5CCkDK/91MEwrYiLW7V06H6xqZHmvv6
         m4hdI1MjRMjAefHB472xv4UTjRyKpF+nSuUTekuGb466mfPBxZ9S7NWbB7b2JYJek3lT
         4gyEBaJNJDA6cTpEjXZACvVQTC9g5yx/1NgIHetAdb1+gAJetZNwvDdI3efrFg5Emo3d
         g/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vSPVRMk6WCRWzA07+viTOHloYjMDCG/U92A4QQA3hzA=;
        b=Un3REu/u+sfxLzvIwYzgwIvT1Jk2spOn4eq9AAdpDDLsfq0irMVUp2tUS9wiSc5o1E
         +b5473JcQC8PiotQpmecdakWQE5TMPVLZeON8UDfpK6qlRI6C9uuQw6EUM1XMujGpdG6
         /bQ3enw1soV2Z6u06y7KaoYSLNow8XrRqnC7fRxJQeqDDDpwbDDtNak21kL+n9mF2dI6
         XiyWGWLjWKHVCBds0fum+jCbJ77yzCOUOQr1gk0iE6/6lER0IA/xYvv1fzUTpzF61dwr
         myC8xEzYYZObSeNDIvV0ll8UqMEw7kdFBZoKcO9+ZScRplQn9dj3yCkotU0rgbxZ25vC
         I74w==
X-Gm-Message-State: AOAM530qMBtr88bMeTcXAPp6f8Jpravb4jt5YEyyr1z1cVNP/BMOo1c2
	pwrcdP9kfHL9raiv8b4BVDcCEsAiheJDwNhKSify9Q==
X-Google-Smtp-Source: 
 ABdhPJyy7KX00StHhvlLr9p93AajWaLPivV4ota4jbZSD0jNlGHBDz5+lfliaiRH0D6uP6dvnVuiBiiENeuBWMXJqZI=
X-Received: by 2002:a05:6000:1146:: with SMTP id
 d6mr27475808wrx.497.1642596687649;
 Wed, 19 Jan 2022 04:51:27 -0800 (PST)
MIME-Version: 1.0
References: <cover.1642309436.git.tim.orling@konsulko.com>
 <ae71fe15c5d6cb132ec20b3be0009b8146a37029.1642309436.git.tim.orling@konsulko.com>
In-Reply-To: 
 <ae71fe15c5d6cb132ec20b3be0009b8146a37029.1642309436.git.tim.orling@konsulko.com>
From: Ross Burton <ross@burtonini.com>
Date: Wed, 19 Jan 2022 12:51:16 +0000
Message-ID: 
 <CAAnfSTuAczyV69S-PuUuEBXcJiCAsd4i=0sbvzq-mQFh-_y+aQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 7/7] python3-cryptography: upgrade 3.3.2
 -> 36.0.1
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jan 2022 12:51:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94946

This results in a broken python3-cryptography-native:

$ bitbake trusted-firmware-m -c devshell
$ nativepython3
>>> import cryptography.hazmat.backends.openssl.backend
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/yocto/ross/build/tmp/work/musca_b1-poky-eabi/trusted-firmware-m/1.5.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/backends/openssl/__init__.py",
line 6, in <module>
    from cryptography.hazmat.backends.openssl.backend import backend
  File "/yocto/ross/build/tmp/work/musca_b1-poky-eabi/trusted-firmware-m/1.5.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/backends/openssl/backend.py",
line 64, in <module>
    from cryptography.hazmat.bindings.openssl import binding
  File "/yocto/ross/build/tmp/work/musca_b1-poky-eabi/trusted-firmware-m/1.5.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/bindings/openssl/binding.py",
line 205, in <module>
    Binding.init_static_locks()
  File "/yocto/ross/build/tmp/work/musca_b1-poky-eabi/trusted-firmware-m/1.5.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/bindings/openssl/binding.py",
line 179, in init_static_locks
    cls._ensure_ffi_initialized()
  File "/yocto/ross/build/tmp/work/musca_b1-poky-eabi/trusted-firmware-m/1.5.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/bindings/openssl/binding.py",
line 167, in _ensure_ffi_initialized
    _openssl_assert(
  File "/yocto/ross/build/tmp/work/musca_b1-poky-eabi/trusted-firmware-m/1.5.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/bindings/openssl/binding.py",
line 77, in _openssl_assert
    raise InternalError(
cryptography.exceptions.InternalError: Unknown OpenSSL error. This
error is commonly encountered when another library is not cleaning up
the OpenSSL error stack. If you are using cryptography with another
library that uses OpenSSL try disabling it before reporting a bug.
Otherwise please file an issue at
https://github.com/pyca/cryptography/issues with information on how to
reproduce this. ([_OpenSSLErrorWithText(code=310378599, lib=37,
reason=103, reason_text=b'error:12800067:DSO support routines::could
not load the shared library'), _OpenSSLErrorWithText(code=310378599,
lib=37, reason=103, reason_text=b'error:12800067:DSO support
routines::could not load the shared library'),
_OpenSSLErrorWithText(code=126615813, lib=15, reason=786693,
reason_text=b'error:078C0105:common libcrypto routines::init fail')])

Initial hunch is that python3-native is linking to the host libssl but
crypto is linking to our libssl.

Ross

