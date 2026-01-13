Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87633D29DEE
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 08:45:30 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54711.1768293922457625997
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 00:45:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QW4Y7O2N;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42fbc305552so5362841f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 00:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768293921; x=1768898721; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dHQzvOA0c8sFzvr9Kd03LB+P2XUIZQeA1Q4YvMVC3XY=;
        b=QW4Y7O2NAuHLeJum0JgNif1hS3wVNJ2ENRqPSkxmUUoylhVmdXET5UHNqaj0v+HXsx
         VbDeBl93G2zawDVA9S/EPlJ2kY5uR4H5BrlmapKU65CejWyO1F93cVbsCv96/gxU9n/S
         UNzFvx+jQu+vh+CVpRXVG501GwabUbtQWxOuin8bt5ms/Vn65H1JIbmQGvhVOVlSR2qg
         BMV3j1aryudShrzRkNWjfWFB5twjlABRbFGJlslceOTR9cKXdEAk5KutCwAgCHoZo6/h
         G7G1YQnZjxabDFLWgWiw1SMDuR54VdS3Caf/DWLYqkUBHy72urHKWskQ/f7+yK+cKB6F
         SmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768293921; x=1768898721;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dHQzvOA0c8sFzvr9Kd03LB+P2XUIZQeA1Q4YvMVC3XY=;
        b=ufWXD/pxVVdJ10lDIGIEjdVBzUZB/9vqrr0RUBC2+AnRaEMDw4ncjwKYOCW+h4VnsE
         +omXbnNrSTsXIttgZVyXHAkAJLu8zK+MU4mQTGs4uuj7WUNALWlm8xHB2Knprekp17E+
         k6Qpl/k8aL4LVthbwbaXFv+qOxWwA/ivLccbfVBfM1rd/dsPZXTDZEgq6h3386m9WVHU
         ob+wi1yeCQPPTeHRTyPUH3Bq2m5nljDGro0lynyAib5/8zKRxkvO0M9Y+YHKOTkk93qP
         grp9Vl88zyR+VMt9IhVFWNoZmUvKGSBTA2PPIJf5CAH8JOxw31HJReR6H9ZxRB2NJquS
         SLrA==
X-Gm-Message-State: AOJu0YzewD1izM2PHBLjsJoocj/3cQU5R5V0pufwvILs5/j2HZKkP3ZA
	E690rQ+PIrHQBE+/Aagi7zsQhPAfVIj95KRkmbyTEEr0kYiIN18WnxTe
X-Gm-Gg: AY/fxX4Sj3WgSnmuIWxnoqm2BGVya3JDpwVapG+RT9pyndyHCREI53+V3Rpc7w/I89M
	QCOyqQtXuxpR/2a9ShlbZxH+dRa3s6MEziCL6YMi8onbi623bUbWo8ChvTmCMARX/SDnBq7yBsn
	Tz5vjlX+kG24pIEU2TvNqCQ9PB2hot4GfPbRapMxTaeyKgXjXmYeKQqdx7xTpWOPeJ8p2p4ULmj
	ybtdrgY2ep2RHmKE9wAdwsTQftaLVcMNO4lpP/2YX6jI3RfSp/L2l5dnGBCKhIlqbRtiNoRrUqo
	sLdxz7sLllgoi9HfnVpgiI+p9MbadHSilbsY+b7BAOXrOqLJTzdbNDxPFHIZm2/N+M4fd5b7uLv
	rD+SKfOlCegoFXRyjJ/AyjtIv8vhLoZOfr+npznBIdqVF6eLeAn0juM9GeGqve6bannZ84QznzF
	9e41YZz93GvHpiXikSfoA14orcS6FT+w==
X-Google-Smtp-Source: AGHT+IF7wUqYzF6200f2wysz7An4IOlQK6fa9uTbD3jPJddso6wtsDxJWzFZNKio7HTjYTAZKa+wog==
X-Received: by 2002:a05:6000:4287:b0:430:f65d:c0df with SMTP id ffacd0b85a97d-432c37a2f8fmr26226612f8f.56.1768293920461;
        Tue, 13 Jan 2026 00:45:20 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5fe67csm42884524f8f.40.2026.01.13.00.45.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 00:45:19 -0800 (PST)
Message-ID: <28fa70bd-9218-4e07-953f-47287912edb0@gmail.com>
Date: Tue, 13 Jan 2026 09:45:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH 00/30] Whinlatter pull request
To: raj.khem@gmail.com, Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
References: <cover.1767765802.git.anuj.mittal@oss.qualcomm.com>
 <CAMKF1spBMrhRuBanPsZC8EBiRX_jRUUCMUerFOsDJ=SjYsEmqw@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1spBMrhRuBanPsZC8EBiRX_jRUUCMUerFOsDJ=SjYsEmqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 08:45:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123401

Khem,

Was the merge successful? I still see a 4 weeks old commit as Whinlatter
HEAD in both github and https://git.openembedded.org/meta-openembedded
Could you please take a look at that?

Thanks

On 1/9/26 08:19, Khem Raj via lists.openembedded.org wrote:
> Looks good. Merged now, thanks Anuj
>
> On Wed, Jan 7, 2026 at 6:11 PM Anuj Mittal
> <anuj.mittal@oss.qualcomm.com> wrote:
>
>     Please merge these changes in whinlatter. Tested on AB and locally.
>
>     https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1225
>
>     The following changes since commit
>     a4e768dcfae181dd99e39c4286fa0729ca7f4e47:
>
>       bpftool-native: Empty DEBUG_PREFIX_MAP_EXTRA (2025-12-17
>     16:54:28 +0530)
>
>     are available in the Git repository at:
>
>       https://git.openembedded.org/meta-openembedded-contrib
>     stable/whinlatter-next
>      
>     https://git.openembedded.org/meta-openembedded-contrib/log/?h=stable/whinlatter-next
>
>     Ankur Tyagi (1):
>       fetchmail: patch CVE-2025-61962
>
>     Gyorgy Sarvari (26):
>       fex: ignore unrelated CVEs
>       accountsservice: ignore CVE-2023-3297
>       minio: ignore irrelevant CVEs
>       cifs-utils: patch CVE-2025-2312
>       cups-filters: patch CVE-2025-64524
>       dovecot: patch CVE-2025-30189
>       fio: ignore CVE-2025-10824
>       tigervnc: fix typo in CVE_STATUS
>       tigervnc: sync xserver code with oe-core
>       tigervnc: ignore CVE-2023-6377
>       tigervnc: ignore CVE-2023-6478
>       tigervnc: ignore CVE-2025-26594...26601
>       civetweb: ignore CVE-2025-9648
>       freerdp3: ignore CVE-2025-68118
>       gimp: patch CVE-2025-14422
>       gimp: patch CVE-2025-14423
>       gimp: patch CVE-2025-14424
>       gimp: patch CVE-2025-14425
>       imagemagick: upgrade 7.1.2-8 -> 7.1.2-12
>       libcoap: ignore CVE-2025-50518
>       openvpn: upgrade 2.6.16 -> 2.6.17
>       php: upgrade 8.4.15 -> 8.4.16
>       postgresql: upgrade 17.6 -> 17.7
>       python3-configobj: ignore CVE-2023-26112
>       python3-django: upgrade 4.2.26 -> 4.2.27
>       python3-django: upgrade 5.2.8 -> 5.2.9
>
>     Hugo SIMELIERE (2):
>       libwebsockets: fix CVE-2025-11677
>       libwebsockets: fix CVE-2025-11678
>
>     Jason Schonberg (1):
>       c-ares: upgrade 1.34.5 -> 1.34.6
>
>      .../gimp/gimp/CVE-2025-14422.patch            |  66 +++++++
>      .../gimp/gimp/CVE-2025-14423.patch            | 106 ++++++++++++
>      .../gimp/gimp/CVE-2025-14424.patch            |  34 ++++
>      .../gimp/gimp/CVE-2025-14425.patch            |  79 +++++++++
>      meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb
>     <http://gimp_3.0.6.bb>    |  15 +-
>      .../accountsservice_23.13.9.bb
>     <http://accountsservice_23.13.9.bb>                |   2 +
>      .../civetweb/civetweb_1.16.bb <http://civetweb_1.16.bb>         
>            |   3 +-
>      .../libcoap/libcoap_4.3.5a.bb <http://libcoap_4.3.5a.bb>         
>            |   2 +
>      .../cifs/cifs-utils/CVE-2025-2312.patch       | 135 +++++++++++++++
>      .../recipes-support/cifs/cifs-utils_7.0.bb
>     <http://cifs-utils_7.0.bb>    |   4 +-
>      .../dovecot/dovecot/CVE-2025-30189-1.patch    | 128 ++++++++++++++
>      .../dovecot/dovecot/CVE-2025-30189-2.patch    |  51 ++++++
>      .../dovecot/dovecot/CVE-2025-30189-3.patch    |  36 ++++
>      .../dovecot/dovecot/CVE-2025-30189-4.patch    |  72 ++++++++
>      .../dovecot/dovecot/CVE-2025-30189-5.patch    |  31 ++++
>      .../dovecot/dovecot/CVE-2025-30189-6.patch    |  88 ++++++++++
>      .../dovecot/dovecot/CVE-2025-30189-7.patch    |  76 +++++++++
>      .../dovecot/dovecot_2.4.1-4.bb <http://dovecot_2.4.1-4.bb>       
>             |   7 +
>      .../fetchmail/fetchmail/CVE-2025-61962.patch  |  51 ++++++
>      .../fetchmail/fetchmail_6.5.2.bb <http://fetchmail_6.5.2.bb>     
>             |   1 +
>      .../{openvpn_2.6.16.bb <http://openvpn_2.6.16.bb> =>
>     openvpn_2.6.17.bb <http://openvpn_2.6.17.bb>}  |   2 +-
>      meta-oe/recipes-benchmark/fio/fio_3.39.bb <http://fio_3.39.bb>   
>      |   2 +
>      .../libwebsockets/CVE-2025-11677.patch        | 161
>     ++++++++++++++++++
>      .../libwebsockets/CVE-2025-11678.patch        | 128 ++++++++++++++
>      .../libwebsockets/libwebsockets_4.3.5.bb
>     <http://libwebsockets_4.3.5.bb>      |   2 +
>      ...c-bypass-autoconf-2.69-version-check.patch |   2 +-
>      ...{postgresql_17.6.bb <http://postgresql_17.6.bb> =>
>     postgresql_17.7.bb <http://postgresql_17.7.bb>} |   4 +-
>      meta-oe/recipes-devtools/fex/fex_2511.bb <http://fex_2511.bb>   
>       |   6 +
>      .../php/{php_8.4.15.bb <http://php_8.4.15.bb> => php_8.4.16.bb
>     <http://php_8.4.16.bb>}      |   2 +-
>      meta-oe/recipes-extended/minio/minio_git.bb
>     <http://minio_git.bb>   |   6 +
>      .../tigervnc/tigervnc_1.15.0.bb <http://tigervnc_1.15.0.bb>     
>              |  16 +-
>      .../cups/cups-filters/CVE-2025-64524.patch    |  82 +++++++++
>      .../cups/cups-filters_2.0.1.bb <http://cups-filters_2.0.1.bb>   
>                 |  10 +-
>      .../c-ares/0001-ares_uri-memory-leak.patch    |  21 ---
>      .../{c-ares_1.34.5.bb <http://c-ares_1.34.5.bb> =>
>     c-ares_1.34.6.bb <http://c-ares_1.34.6.bb>}    |   3 +-
>      .../freerdp/freerdp3_3.18.0.bb <http://freerdp3_3.18.0.bb>       
>             |   1 +
>      ...ick_7.1.2-8.bb <http://ick_7.1.2-8.bb> =>
>     imagemagick_7.1.2-12.bb <http://imagemagick_7.1.2-12.bb>} |   2 +-
>      .../python/python3-configobj_5.0.9.bb
>     <http://python3-configobj_5.0.9.bb>         |   2 +
>      ...ngo_4.2.26.bb <http://ngo_4.2.26.bb> =>
>     python3-django_4.2.27.bb <http://python3-django_4.2.27.bb>} |   2 +-
>      ...jango_5.2.8.bb <http://jango_5.2.8.bb> =>
>     python3-django_5.2.9.bb <http://python3-django_5.2.9.bb>} |   2 +-
>      40 files changed, 1397 insertions(+), 46 deletions(-)
>      create mode 100644
>     meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.patch
>      create mode 100644
>     meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14423.patch
>      create mode 100644
>     meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14424.patch
>      create mode 100644
>     meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14425.patch
>      create mode 100644
>     meta-networking/recipes-support/cifs/cifs-utils/CVE-2025-2312.patch
>      create mode 100644
>     meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-1.patch
>      create mode 100644
>     meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-2.patch
>      create mode 100644
>     meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-3.patch
>      create mode 100644
>     meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-4.patch
>      create mode 100644
>     meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-5.patch
>      create mode 100644
>     meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-6.patch
>      create mode 100644
>     meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-7.patch
>      create mode 100644
>     meta-networking/recipes-support/fetchmail/fetchmail/CVE-2025-61962.patch
>      rename meta-networking/recipes-support/openvpn/{openvpn_2.6.16.bb
>     <http://openvpn_2.6.16.bb> => openvpn_2.6.17.bb
>     <http://openvpn_2.6.17.bb>} (98%)
>      create mode 100644
>     meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2025-11677.patch
>      create mode 100644
>     meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2025-11678.patch
>      rename meta-oe/recipes-dbs/postgresql/{postgresql_17.6.bb
>     <http://postgresql_17.6.bb> => postgresql_17.7.bb
>     <http://postgresql_17.7.bb>} (69%)
>      rename meta-oe/recipes-devtools/php/{php_8.4.15.bb
>     <http://php_8.4.15.bb> => php_8.4.16.bb <http://php_8.4.16.bb>} (99%)
>      create mode 100644
>     meta-oe/recipes-printing/cups/cups-filters/CVE-2025-64524.patch
>      delete mode 100644
>     meta-oe/recipes-support/c-ares/c-ares/0001-ares_uri-memory-leak.patch
>      rename meta-oe/recipes-support/c-ares/{c-ares_1.34.5.bb
>     <http://c-ares_1.34.5.bb> => c-ares_1.34.6.bb
>     <http://c-ares_1.34.6.bb>} (87%)
>      rename
>     meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-8.bb
>     <http://imagemagick_7.1.2-8.bb> => imagemagick_7.1.2-12.bb
>     <http://imagemagick_7.1.2-12.bb>} (99%)
>      rename
>     meta-python/recipes-devtools/python/{python3-django_4.2.26.bb
>     <http://python3-django_4.2.26.bb> => python3-django_4.2.27.bb
>     <http://python3-django_4.2.27.bb>} (79%)
>      rename
>     meta-python/recipes-devtools/python/{python3-django_5.2.8.bb
>     <http://python3-django_5.2.8.bb> => python3-django_5.2.9.bb
>     <http://python3-django_5.2.9.bb>} (60%)
>
>     -- 
>     2.52.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123277): https://lists.openembedded.org/g/openembedded-devel/message/123277
> Mute This Topic: https://lists.openembedded.org/mt/117146356/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


