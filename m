Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web09.6683.1619384198735776427
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Apr 2021 13:56:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Co8DJxV3;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id s20so11998345plr.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Apr 2021 13:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Xc0Ye+o2ojiPJs9n0imrT/FV0EimUAOp4ZbKcALcdyo=;
        b=Co8DJxV3ZD4nsEPkkjFUf/GphWamIR71RgGhGM0kaALt/baPYZWO4/AF+3hyffUL7e
         Az1+FPyW/jMwuOvOCu46w9p0jyYqL4mWB+3lfuzaPjzT63d6u2mc+i7uM1pU5UHTPTCf
         oFVhWP0qo1eaY6BC5M/sHyG/UqurSC3x2zBQicqxvXWdoYblwkV+0cbSReyIMvy0gQjU
         KWRXGd4gthWiB23hbiFL6OGkz/x5JtXAKPmvDOlajkes+I+qbsJ8LEf9Qol9TNgRVWkq
         rlpGkCliydF3Vrb1G7CC50VTZdI+f9RJoWfHrbx6JztAYT9NbS/IL5nC/C4OfomnXaEL
         d9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=Xc0Ye+o2ojiPJs9n0imrT/FV0EimUAOp4ZbKcALcdyo=;
        b=iaff35cJGuRQCCZk4denCbhMAP6mJ2dl7su5uVF4Q6cUyI05J/S/gO5mCxD9WbwXR3
         wOWJVdI5S4QVcPqonw7+3dYGqixETDOOSXWef+/3DMu3qgOTGBSnOVaYUogblJa+LQoV
         n+FdXAIzVFiAD9wZpMQudkmp0Q1Jt9O9c8mHi0noA/bhk8ahGwzaQXBoo6cOUcHIYyj1
         GwKaucMYof+es7b2MriU5+njIApgW4x77uh7d+4V0r84YDaBxgd5r3Xu6NFo+xLaeBho
         YZ5/fvsozrSCse8qyWONvH609aN/xodzMxRCPnIySCycPYaFYkrIgeIGROAdrCSLQAdz
         ZDgQ==
X-Gm-Message-State: AOAM531j1GJRSHv7Cd+c8OwbZsKSKkMhK0Um4gVJ5k0KK+NCuhag00Gr
	5gjzZPo6om+v3cfYsj7uI0xibv4JtYo93g==
X-Google-Smtp-Source: ABdhPJzqTIVotTsLw/8mzZBm1MgJsdhMri9nq/acWTxjHVl0ut5p+XyHk4+kLtGX2mVj3gfEL21hJA==
X-Received: by 2002:a17:90a:a613:: with SMTP id c19mr18630591pjq.117.1619384198117;
        Sun, 25 Apr 2021 13:56:38 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:880e:6a48:f6c3:8404? ([2601:202:4180:a5c0:880e:6a48:f6c3:8404])
        by smtp.gmail.com with ESMTPSA id e6sm9270716pgh.17.2021.04.25.13.56.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Apr 2021 13:56:37 -0700 (PDT)
Subject: Re: [oe] [hardknott 0/6] Patch review April 24th
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <cover.1619258978.git.akuster808@gmail.com>
 <CA+chaQeSzuwXe2YRgc68xek+ZygZ7D16Q3jj=jBrTico5TvCEA@mail.gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <87d755d5-1068-dd5a-58e1-7ffbec9310b7@gmail.com>
Date: Sun, 25 Apr 2021 13:56:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQeSzuwXe2YRgc68xek+ZygZ7D16Q3jj=jBrTico5TvCEA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 4/24/21 3:36 AM, Martin Jansa wrote:
> Please take
> https://git.openembedded.org/meta-openembedded/commit/?id=b5ad9c011db2581cc84e5daa139acf73a0f6f5c0
> as well to fix
> https://git.openembedded.org/meta-openembedded/commit/?h=hardknott&id=98a26903f770aa8698770817bdaf6175367917e1
> merged in previous PR.

Hardknott already has that commit. Was this meant for Gatesgarth?

-armin
>
> On Sat, Apr 24, 2021 at 3:12 AM Armin Kuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     These have been sent to the list already so shorter review cycle.
>     Please have feedback by Sunday.
>
>     The following changes since commit
>     2297d4ee04b47bc574f8879732d9e213ab7bf685:
>
>       wireguard: update to v1.0.20210219 +1 (2021-04-18 13:49:13 -0700)
>
>     are available in the Git repository at:
>
>       git://git.openembedded.org/meta-openembedded-contrib
>     <http://git.openembedded.org/meta-openembedded-contrib>
>     stable/hardknott-nut
>      
>     http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/hardknott-nut
>
>     Chen Qi (2):
>       tigervnc: upgrade to 1.11.0
>       python3-django: upgrade to 2.2.20
>
>     Mingli Yu (2):
>       php: Upgrade to 7.4.16
>       python3-cryptography: Upgrade to 3.3.2
>
>     Stefan Ghinea (1):
>       python3-django: fix CVE-2021-28658
>
>     Ulrich Ölmann (1):
>       v4l-utils: fix reproducibility
>
>      .../php/php/CVE-2020-7069.patch               | 158
>     ------------------
>      .../php/php/CVE-2020-7070.patch               |  24 ---
>      .../php/{php_7.4.9.bb <http://php_7.4.9.bb> => php_7.4.16.bb
>     <http://php_7.4.16.bb>}       |   7 +-
>      ...002-do-not-build-tests-sub-directory.patch |  21 +--
>      ...vnc-add-fPIC-option-to-COMPILE_FLAGS.patch |  36 ++--
>      ...{tigervnc_1.10.1.bb <http://tigervnc_1.10.1.bb> =>
>     tigervnc_1.11.0.bb <http://tigervnc_1.11.0.bb>} |  13 +-
>      ...c-autodetect-availability-of-systemd.patch |  47 ++++++
>      ...ct-installation-of-50-rc_keymap.conf.patch |  40 +++++
>      .../v4l2apps/v4l-utils_1.20.0.bb <http://v4l-utils_1.20.0.bb>   
>               |  11 +-
>      ...3.3.1.bb <http://3.3.1.bb> => python3-cryptography_3.3.2.bb
>     <http://python3-cryptography_3.3.2.bb>} |   2 +-
>      ...ngo_2.2.16.bb <http://ngo_2.2.16.bb> =>
>     python3-django_2.2.20.bb <http://python3-django_2.2.20.bb>} |   4 +-
>      11 files changed, 130 insertions(+), 233 deletions(-)
>      delete mode 100644
>     meta-oe/recipes-devtools/php/php/CVE-2020-7069.patch
>      delete mode 100644
>     meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch
>      rename meta-oe/recipes-devtools/php/{php_7.4.9.bb
>     <http://php_7.4.9.bb> => php_7.4.16.bb <http://php_7.4.16.bb>} (97%)
>      rename meta-oe/recipes-graphics/tigervnc/{tigervnc_1.10.1.bb
>     <http://tigervnc_1.10.1.bb> => tigervnc_1.11.0.bb
>     <http://tigervnc_1.11.0.bb>} (89%)
>      create mode 100644
>     meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0008-configure.ac-autodetect-availability-of-systemd.patch
>      create mode 100644
>     meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0009-keytable-restrict-installation-of-50-rc_keymap.conf.patch
>      rename
>     meta-python/recipes-devtools/python/{python3-cryptography_3.3.1.bb
>     <http://python3-cryptography_3.3.1.bb> =>
>     python3-cryptography_3.3.2.bb
>     <http://python3-cryptography_3.3.2.bb>} (94%)
>      rename
>     meta-python/recipes-devtools/python/{python3-django_2.2.16.bb
>     <http://python3-django_2.2.16.bb> => python3-django_2.2.20.bb
>     <http://python3-django_2.2.20.bb>} (41%)
>
>     -- 
>     2.17.1
>
>
>     
>

