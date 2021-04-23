Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.556.1619199954447631585
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Apr 2021 10:45:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PeNB0n9n;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id g16so21245086pfq.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Apr 2021 10:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WIkcpUjEiq/KY4ymwFlS8kuTm8MyCLCrnyoIxesHwbU=;
        b=PeNB0n9nugBX9x9upCkH5FeW0E5IXXzj+Za9P3TQA/iVoNSsnXgLc0Usmgi2E0M5T6
         QHej9UsJiyeWsxV3IOG1o0UjLOAZtu3vUWgXuX20XoGnEVxO6khH1z0ZtbBp3ossbtRq
         X5Yp4kaz1rWbBCiIyfi3IDN71OcIYe3tSQwiYm53WlfWIEvS99PV3Vs+Eje9+QCCY09m
         iwzuYQ7Yb1mgcvXv14K4+gg7VNRsa1ylQP78A6zBuQdRf3sH9p8mWqK03J2K6WZjAIxr
         YJ6gZbvWqUGoQPsz6sAqZLsJ5TPnmmP0IuoJhtq9dHoDv3Oz2KZOjpwM1++e1KMRfMt3
         CksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=WIkcpUjEiq/KY4ymwFlS8kuTm8MyCLCrnyoIxesHwbU=;
        b=tiUz9YhYAD92aeDAA/57nisIevzbS1yo2XSOrYBUFjgS3+U48rY+tHHwS/pWL32/eo
         O1BvHCV5U8qEZkUXTtRK+TQ2lcjjYRB8j1ljuJpP3qSs3Wc2O93i0Z+6CgI1aFYlSCds
         o/7X4U2RbKVhtAuDvWH61YBnjW3BkRijVH+EdANN1XOkBj89IdwoyQVUbogmmPU9G/91
         kdisdFNUVFSR/9kBxmmleID3+qX/wGLww+Y7+PDCA9jopzN0haWjDWtJ/YWDc5crY8EB
         AsAsl7F01YC1cKHuzMqTHnpTSyX1zUgRGT4V0mpvzpMJ5zd2vWKc+/wCD7blvVOAeBni
         iYYw==
X-Gm-Message-State: AOAM530cjKRD5rvDlmMqIdhGAOfn+eWQPYnHOzIP6jeQxLAje67T5C1y
	5YPwRO3eI1Nl9g+3LRNU8USLnAa/Eu1usg==
X-Google-Smtp-Source: ABdhPJwQZ9zL+fGViCQe5o8SEf8yahimYc3g0Uw98ve5VlHD/iu0n64EcQRgI8kjBwSL4KeFambwbw==
X-Received: by 2002:a62:ee09:0:b029:211:1113:2e7c with SMTP id e9-20020a62ee090000b029021111132e7cmr4874106pfi.49.1619199953749;
        Fri, 23 Apr 2021 10:45:53 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:11fe:f444:6c85:56b? ([2601:646:9200:a0f0:11fe:f444:6c85:56b])
        by smtp.gmail.com with ESMTPSA id m2sm5436292pgv.87.2021.04.23.10.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Apr 2021 10:45:53 -0700 (PDT)
Subject: Re: Gatesgarth merge request - April 23
To: akuster808 <akuster808@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <7aa614e7-a401-08e6-cd4f-bcf5c11f7958@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <23c346b0-3e1d-189f-b481-f31e8706039d@gmail.com>
Date: Fri, 23 Apr 2021 10:45:52 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <7aa614e7-a401-08e6-cd4f-bcf5c11f7958@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 4/23/21 7:45 AM, akuster808 wrote:
> The following changes since commit c9815c86bfd63b2d9479915045197e7d315ef709:
> 
>    telepathy-glib: respect GI_DATA_ENABLED when enabling vala-bindings
> (2021-04-10 07:37:44 -0700)
> 
> are available in the Git repository at:
> 
>    https://git.openembedded.org/meta-openembedded gatesgarth-next
> 
> for you to fetch changes up to 29ca52c7826ad3044b53ccb5224016bd73abdb5c:
> 
>    gpsd: backport d-bus message time patch from upstream (2021-04-18
> 20:03:23 -0700)
> 
> ----------------------------------------------------------------
> Hermes Zhang (1):
>        gpsd: backport d-bus message time patch from upstream
> 
> Khem Raj (1):
>        mariadb: Fix build on musl/ppc
> 
> Stefan Ghinea (1):
>        hostapd: fix CVE-2021-30004
> 
> wangmy (1):
>        mariadb: upgrade 10.5.8 -> 10.5.9
> 

this is now merged. Thanks

>   .../hostapd/hostapd/CVE-2021-30004.patch           | 123
> +++++++++++++++++++++
>   .../recipes-connectivity/hostapd/hostapd_2.9.bb    |   1 +
>   ...b-native_10.5.8.bb => mariadb-native_10.5.9.bb} |   0
>   meta-oe/recipes-dbs/mysql/mariadb.inc              |   5 +-
>   ...-stacktrace-t.c-make-the-test-conditional.patch |  38 -------
>   .../recipes-dbs/mysql/mariadb/c11_atomics.patch    |  16 +--
>   .../mysql/mariadb/ppc-remove-glibc-dep.patch       |  50 +++++++++
>   .../mysql/{mariadb_10.5.8.bb => mariadb_10.5.9.bb} |   0
>   ...busexport.c-Fix-broken-d-bus-message-time.patch |  36 ++++++
>   meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb       |   1 +
>   10 files changed, 222 insertions(+), 48 deletions(-)
>   create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-30004.patch
>   rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.8.bb =>
> mariadb-native_10.5.9.bb} (100%)
>   delete mode 100644
> meta-oe/recipes-dbs/mysql/mariadb/0001-stacktrace-t.c-make-the-test-conditional.patch
>   create mode 100644
> meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
>   rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.8.bb =>
> mariadb_10.5.9.bb} (100%)
>   create mode 100644
> meta-oe/recipes-navigation/gpsd/gpsd/0001-gpsd-dbusexport.c-Fix-broken-d-bus-message-time.patch
> 
