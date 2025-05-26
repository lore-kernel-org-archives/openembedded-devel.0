Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE1F1C54FB3
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 18:47:43 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.35143.1748285256438536828
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 May 2025 11:47:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nPsYAXwH;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2da73158006so1623674fac.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 May 2025 11:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748285256; x=1748890056; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6mKO6MTjN87MQyrneZ5BqRD1MJTLgYawcNJX9FA+Q0=;
        b=nPsYAXwHEGsgTWBbDqKoU18y0CTB+5tXyeUwx8yfPbzBtNKjg7N+JVTsg4fWFiqYxz
         /PEsU+xY9Eg+YbgCogC/I8JlvSJ5cjJ7WpKWf7Eug9QAndUIcg4BJDrcSYYuTy3rKF0A
         WIHjQAG0875qFpVh9B3bJn04jCpea9sLThk7WBZeux9A9NmTdVUvu2FKDQ1vCYhXnt3W
         2wuxzetaNNubjlyYgV0I4mMU/oIOUI6fZKILAAgRKrrfmWH0X48tbwg6m1087FKZNdQ3
         QqRntcayzUIXt6nbZiqN0e98bDLqPGx/QJih8/pjhnhSSd/Sw3ouZPyrLgUjcC0jps0H
         CJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748285256; x=1748890056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k6mKO6MTjN87MQyrneZ5BqRD1MJTLgYawcNJX9FA+Q0=;
        b=gSS4ZhWrGsfxIbZPFKqwRNeuOE31vk+dH5ykbP2Lu7JC8ciMA4YDsUZuBDra07t0GH
         W7ksl7ThRsY0gWIZqUoU2cjlHFUe72zIDISYi7WloOlrbHiJ0COKthSqMAIyEOcU6aBI
         LJEIbKOZLMoxKvtBtvAPKEp8gmuF+iNFy3NwH8pTFBfuMxcLb9nIHw+cVm+QNaSF6Uc5
         w4v/vUdxD7IilEwqoZ7StffaaIo+iY1PmDYQ5aeYUz56BpFMh+aTJ9e3Z6xO8HLJuhQs
         ObCpwZuhoKoTaU35G/Mgw+AaOK2DLR/K6WSeETbKQ26CtYycJWfbcJ7IZK08Brv/mcz2
         udOw==
X-Gm-Message-State: AOJu0YyhxegEyifG/EC8dhSpbFGknvrO1+b+CB5fdIhpd4vcYFxnFuTH
	2oTT6G/LlXQqqQtjFF88dSw6+F5zmZWxSP7PzMBAt1YjLp5wkAfNxfFKSYXeGUCVDUGiUsT0dYw
	d/vf3aov8Zk5iU5e/3M41etNuJb9oVWQ=
X-Gm-Gg: ASbGnctEIDyc00vS5fBCr6p+IbKqWU3KbJSkUQuSc+9iJxyNocUOY/1SDMsSxg+DS4I
	mmruMzStLIuq4M1XyELYmyrpn7oCF2/KunKF+kaNN7C7SyTBZ5tAmbltJmWT7gQAXldOGhC/rfv
	khKYiOauGqfmw7G0q6xhhMY8eMLUrmw1U=
X-Google-Smtp-Source: AGHT+IH7msyz6Go3O1Rs9QuvM83a2Z49B+biIO43ozll884mNHLu9mabVEy0pnWEOXdFc+TwDNkQYXeh8Rt/6Mgxnzw=
X-Received: by 2002:a05:6871:8015:b0:2c6:7f82:d38c with SMTP id
 586e51a60fabf-2e8620ccb91mr5475508fac.31.1748285255506; Mon, 26 May 2025
 11:47:35 -0700 (PDT)
MIME-Version: 1.0
References: <1d52301c-768d-47b9-91d6-b48a4d0d7296@gmail.com>
In-Reply-To: <1d52301c-768d-47b9-91d6-b48a4d0d7296@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 May 2025 11:47:09 -0700
X-Gm-Features: AX0GCFsm9M-XoU957DaCm8FRugzNwGZfz9QcFHvY0LR9YodfRBQfbuUI7YTAd4U
Message-ID: <CAMKF1so63cae6k5C+AqQur1UWjrLHjnxqCKoWfUrKZaaN3iddg@mail.gmail.com>
Subject: Re: scarthgap merge request: May 25th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 May 2025 18:47:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117630

merged. Thanks Armin

On Sun, May 25, 2025 at 11:27=E2=80=AFAM akuster808 <akuster808@gmail.com> =
wrote:
>
> The following changes since commit e92d0173a80ea7592c866618ef5293203c5054=
4c:
>
>    lmsensors: Clean stale files for sensord to avoid incorrect GCC
> header dependencies (2025-04-16 20:33:56 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded scarthgap-next
>
> for you to fetch changes up to 491671faee11ea131feab5a3a451d1a01deb2ab1:
>
>    proftpd: Fix CVE-2024-57392 (2025-05-21 09:17:27 -0400)
>
> ----------------------------------------------------------------
> Archana Polampalli (1):
>        tftpy: fix CVE-2023-46566
>
> Ariel D'Alessandro (1):
>        pipewire: Install missing ALSA config files
>
> Jeroen Hofstee (3):
>        nodejs: backport a patch to prevent brotli crashing nodejs
>        can-utils: fix printing / reading timestamps
>        can-utils: handle CAN_ERR_CNT correctly
>
> Khem Raj (1):
>        python3-posix-ipc: switch to PEP-517 build backend
>
> Martin Jansa (1):
>        python3-posix-ipc: improve build_support
>
> Peter Marko (1):
>        libmodbus: ignore CVE-2023-26793 and CVE-2024-34244
>
> Soumya Sambu (1):
>        iniparser: Fix CVE-2025-0633
>
> Vijay Anusuri (1):
>        proftpd: Fix CVE-2024-57392
>
> Wang Mingyu (1):
>        python3-posix-ipc: upgrade 1.1.1 -> 1.2.0
>
> Yogita Urade (4):
>        poppler: fix CVE-2025-32364
>        poppler: fix CVE-2025-32365
>        poppler: fix CVE-2025-43903
>        syslog-ng: fix CVE-2024-47619
>
> Zhang Peng (1):
>        iperf3: upgrade 3.16 -> 3.18
>
>   meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.9.bb   | 10 +
>   .../recipes-daemons/proftpd/files/CVE-2024-57392.patch          | 42 ++=
+
>   meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb       | 1 +
>   .../iperf3/iperf3/do-not-listen-to-old-udp-prot-listener.patch  | 30 --
>   .../recipes-benchmark/iperf3/{iperf3_3.16.bb =3D> iperf3_3.18.bb} |   7=
 +-
>   .../nodejs/nodejs/zlib-fix-pointer-alignment.patch              | 64 ++=
+++
>   meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb               | 1 +
>   meta-oe/recipes-extended/libmodbus/libmodbus_3.1.10.bb          | 3 +
>   ...1-lib-snprintf_can_error_frame-don-t-bail-out-if-CAN_E.patch | 70 ++=
+++
>   ...1-timestamp-formatting-always-use-64-bit-for-timestamp.patch | 422
> ++++++++++++++++++++++++++++
>   meta-oe/recipes-extended/socketcan/can-utils_2023.03.bb         | 5 +-
>   meta-oe/recipes-support/iniparser/iniparser/CVE-2025-0633.patch | 37 ++=
+
>   meta-oe/recipes-support/iniparser/iniparser_4.1.bb              | 1 +
>   meta-oe/recipes-support/poppler/poppler/CVE-2025-32364.patch    | 28 ++
>   meta-oe/recipes-support/poppler/poppler/CVE-2025-32365.patch    | 41 ++=
+
>   .../recipes-support/poppler/poppler/CVE-2025-43903-0001.patch   | 75 ++=
+++
>   .../recipes-support/poppler/poppler/CVE-2025-43903-0002.patch   | 49 ++=
++
>   meta-oe/recipes-support/poppler/poppler_23.04.0.bb              | 4 +
>   meta-oe/recipes-support/syslog-ng/files/CVE-2024-47619.patch    | 292
> +++++++++++++++++++
>   meta-oe/recipes-support/syslog-ng/syslog-ng_4.6.0.bb            | 1 +
>   ...1-build_support-use-source-filename-instead-of-foo-for.patch | 50 ++=
++
>   ...2-build_support-handle-empty-max_priority-value-as-Non.patch | 49 ++=
++
>   ...3-build_support-use-does_build_succeed-in-compile_and_.patch | 62 ++=
++
>   meta-python/recipes-devtools/python/python3-posix-ipc_1.1.1.bb  | 11 -
>   meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb  | 16 ++
>   meta-python/recipes-devtools/python/tftpy/CVE-2023-46566.patch  | 26 ++
>   meta-python/recipes-devtools/python/tftpy_0.8.2.bb              | 2 +
>   27 files changed, 1353 insertions(+), 46 deletions(-)
>   create mode 100644
> meta-networking/recipes-daemons/proftpd/files/CVE-2024-57392.patch
>   delete mode 100644
> meta-oe/recipes-benchmark/iperf3/iperf3/do-not-listen-to-old-udp-prot-lis=
tener.patch
>   rename meta-oe/recipes-benchmark/iperf3/{iperf3_3.16.bb =3D>
> iperf3_3.18.bb} (82%)
>   create mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/zlib-fix-pointer-alignment.patch
>   create mode 100644
> meta-oe/recipes-extended/socketcan/can-utils/0001-lib-snprintf_can_error_=
frame-don-t-bail-out-if-CAN_E.patch
>   create mode 100644
> meta-oe/recipes-extended/socketcan/can-utils/0001-timestamp-formatting-al=
ways-use-64-bit-for-timestamp.patch
>   create mode 100644
> meta-oe/recipes-support/iniparser/iniparser/CVE-2025-0633.patch
>   create mode 100644
> meta-oe/recipes-support/poppler/poppler/CVE-2025-32364.patch
>   create mode 100644
> meta-oe/recipes-support/poppler/poppler/CVE-2025-32365.patch
>   create mode 100644
> meta-oe/recipes-support/poppler/poppler/CVE-2025-43903-0001.patch
>   create mode 100644
> meta-oe/recipes-support/poppler/poppler/CVE-2025-43903-0002.patch
>   create mode 100644
> meta-oe/recipes-support/syslog-ng/files/CVE-2024-47619.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-posix-ipc/0001-build_support-=
use-source-filename-instead-of-foo-for.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-posix-ipc/0002-build_support-=
handle-empty-max_priority-value-as-Non.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-posix-ipc/0003-build_support-=
use-does_build_succeed-in-compile_and_.patch
>   delete mode 100644
> meta-python/recipes-devtools/python/python3-posix-ipc_1.1.1.bb
>   create mode 100644
> meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
>   create mode 100644
> meta-python/recipes-devtools/python/tftpy/CVE-2023-46566.patch
>

