Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web09.350.1612459062962349186
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 09:17:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D5KuqCxa;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id y10so2107402plk.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Feb 2021 09:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=YV0we83YOJ0BSyyheWAMvyF5Ybx86rIhjrCxkJLLqZE=;
        b=D5KuqCxaVDBaFv62vvm0j//vVWggL5mBOR7GCnBtafhUVKBo8ymb2rnHuoARXj84jT
         nDNZqz3SvmrucNKGHtI93QAkIrc5nRngr5yaCoH4VPj6UqN+uiZlBInZ4JIy76CGM9VO
         7jjbbo1p4b1iUD3LRltjJAM2/bOxEpPgmxIavlt+yDs0uXblSjPro+wzauhSMrJegjwm
         BcGYI2ED4z4C4FV6+O8sC4qWLjVXdIqUx4lAuNr+1u80Q3exH42LYAYk2eCleWRKbI6Y
         iGz/N2KoBY0KjTXhKPW1DoiBpgmBgNIRN3uG/kcn81mu4Qb30S4qnsISj2QX8yOagNmg
         dmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YV0we83YOJ0BSyyheWAMvyF5Ybx86rIhjrCxkJLLqZE=;
        b=mW4eViPQBs/K1KLbcuQA22b1gejp9co7SHFfjbcq6+DLGm/z6KR1wXRwiwx8ddreqf
         h1YYLeGxUuBT9tuTQJfg/uAcOx9JgYopYdMejMYYuvQHGI2XfUpUfN1dBlVPRJ25A4m8
         7YtMSY7MAVUzylSkOW2ayKfSJcPAmgXyfMRAhuThmvvCSrswy8fYVumlIcXVvTYdaikh
         ON3qWUA8krR8fBKvYURK+5ZM7bZ7t/z8gvjQ6MIk6qmrbTwNBYlNvUpyjUVq+eZ/ak4a
         B0cO7R0+ZMWpevBsPV2wP/vLQ8CyNido0A53vQZqBzHhLghFf0UiaXi2lMsvjXp0KdFC
         ERCA==
X-Gm-Message-State: AOAM5302TlxM93ow0Rje/A/pcjS7iB+MXMJFkMB9JkEAnL6ctSnZ30bH
	gQkvHlpv83+dRuJfLcSdgjvvMv35faia6A==
X-Google-Smtp-Source: ABdhPJwzONWs0Umy6UDKvvmtxQNyXnPVYTd+dTPPW63Rsb6yIX6l3xyhuySENjIn9r8Pti3vIFsXlQ==
X-Received: by 2002:a17:90a:4897:: with SMTP id b23mr463815pjh.193.1612459061695;
        Thu, 04 Feb 2021 09:17:41 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::2914? ([2601:646:9200:a0f0::2914])
        by smtp.gmail.com with ESMTPSA id g17sm6765726pfk.184.2021.02.04.09.17.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Feb 2021 09:17:41 -0800 (PST)
Subject: Re: Dunfell merge request Feb 3
To: akuster808 <akuster808@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <ed6f91cd-578c-dc4d-7d3d-b3764947d40d@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <17977f8d-74e7-1c8c-6d29-2bfd1a4dcc05@gmail.com>
Date: Thu, 4 Feb 2021 09:17:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <ed6f91cd-578c-dc4d-7d3d-b3764947d40d@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

applied thanks

On 2/3/21 8:34 PM, akuster808 wrote:
> The following changes since commit 5bba79488b7d393d2258d6e917f7bf7b0d7c4073:
> 
>    gupnp: Upgrade to 1.2.2 -> 1.2.4 (2021-01-18 08:40:15 -0800)
> 
> are available in the Git repository at:
> 
>    https://git.openembedded.org/meta-openembedded dunfell-next
> 
> for you to fetch changes up to de37512b25c1f8c6bb6ab2b3782ac0fe01443483:
> 
>    gpsd: mark CLEANBROKEN (2021-01-31 09:42:35 -0800)
> 
> ----------------------------------------------------------------
> Dan Murphy (1):
>        mariadb: Fix 64bit builds if pam is enabled
> 
> Dmitry Baryshkov (2):
>        xterm: install xterm and uxterm desktop files
>        xterm: provide virtual/x-terminal-emulator
> 
> Harpritkaur Bhandari (1):
>        rapidjson: Upgrade SRCREV to latest
> 
> Khem Raj (2):
>        iscsi-initiator-utils: Upgrade to _2.1.2
>        iscsi-initiator-utils: Silence a clang warning on 64bit systems
> 
> Leon Anavi (2):
>        sip3: Consolidate in a single file
>        sip3: Upgrade 4.19.19 -> 4.19.23
> 
> Martin Jansa (1):
>        networkd-dispatcher: use git fetcher
> 
> Mikko Rapeli (2):
>        flatbuffers: whitelist CVE-2020-35864
>        giflib: apply patch for CVE-2019-15133 and set CVE_PRODUCT
> 
> Sean Nyekjaer (1):
>        gpsd: mark CLEANBROKEN
> 
> Søren Andersen (1):
>        zram: fix sourcing of zram parameters
> 
> zangrc (1):
>        iscsi-initiator-utils: upgrade 2.1.2 -> 2.1.3
> 
>   .../files/0001-Makefile-Do-not-set-Werror.patch    | 31
> ++++++++++++++++++++++
>   ...ils_2.1.0.bb => iscsi-initiator-utils_2.1.3.bb} |  9 +++----
>   .../networkd-dispatcher_2.0.1.bb                   |  7 ++---
>   meta-oe/recipes-dbs/mysql/mariadb.inc              |  8 ++++--
>   .../flatbuffers/flatbuffers_1.12.0.bb              |  3 +++
>   .../giflib/files/CVE-2019-15133.patch              | 23 ++++++++++++++++
>   meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb    |  7 ++++-
>   .../recipes-devtools/rapidjson/rapidjson_git.bb    |  5 ++--
>   meta-oe/recipes-devtools/sip/sip3_4.19.19.bb       | 11 --------
>   .../sip/{sip.inc => sip3_4.19.23.bb}               | 17 +++++++++---
>   meta-oe/recipes-extended/zram/zram/zram-swap-init  |  2 +-
>   meta-oe/recipes-graphics/xorg-app/xterm_353.bb     | 16 +++++++++--
>   meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb       |  2 ++
>   13 files changed, 109 insertions(+), 32 deletions(-)
>   create mode 100644
> meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Makefile-Do-not-set-Werror.patch
>   rename
> meta-networking/recipes-daemons/iscsi-initiator-utils/{iscsi-initiator-utils_2.1.0.bb
> => iscsi-initiator-utils_2.1.3.bb} (96%)
>   create mode 100644
> meta-oe/recipes-devtools/giflib/files/CVE-2019-15133.patch
>   delete mode 100644 meta-oe/recipes-devtools/sip/sip3_4.19.19.bb
>   rename meta-oe/recipes-devtools/sip/{sip.inc => sip3_4.19.23.bb} (79%)
> 
