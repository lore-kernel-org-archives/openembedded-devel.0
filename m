Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web10.11789.1593403127952586758
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2020 20:58:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NEylFaKc;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id e12so11861168qtr.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2020 20:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FksZUH2QtnMyv4EDlpJG+NKeXeuwZrvTxQDfQN3c40Q=;
        b=NEylFaKcFkM8bpDIdj3Whlr61odg6pNN916D7f+6o3lLYcbTIyLSjjkzKbNLPZrUMv
         +2kBHhrZgVlmnN3xLBKXYSUXRu+gRorMuH89s3QNTdzNAk+GudkOyMLc3mukY83bfZb/
         H9Gvlk9akFraTQNis3KgEE9Lg5bNvgJ9P67JGNSmgtQlvPiX0yQambR1NhX7BIwwjxNX
         VMGlr1J3PeuEV81QbYHDUWQP6KYChm4TNYhOOIF6ds2OdY5YHEvljwtVMIR4z2Yv/c0A
         10rG1XpoETR6f1g6FTw1xfKUtk7BImLy0sl9q5wFGpCUyPeFv7JjYfXoT2qwgo0OIMuJ
         8kpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FksZUH2QtnMyv4EDlpJG+NKeXeuwZrvTxQDfQN3c40Q=;
        b=Ijz9KAxaXzSSXAfTbgWgnIdCd7L3EU2sxsR4HJLMuO3SelEeX79DAHwNJEfC2KDpqH
         o6DVUp9Thjs9c5nM/lzsPe06pfPjuqXSgf1eicrLOdCz2B9LpsMYB+vcjgdIw4vairCd
         +PW35w9w+gMCg05pYHlPVOmIlKKnVzonsyT5vXqFnxIbg6Hv7NrOjPtyuE5p/wnFwxdb
         SVGskORzyu/aPV6uzJ51q4qJIxqPBgodcVj2YcLhxJPXjP5MobwlHwTa5a5jj9g9EBE4
         vSyXxL11ny+gSnDvy994s0YB/zmrGSNDy8nwVLg0jVZFMv6BUAaG0zHTg9njz0HOwiUn
         0+AQ==
X-Gm-Message-State: AOAM532mR81wf+to0w5IETJr33iWKhGa93QPT6N5XzL4zenjFdsusRJ7
	5Kra16dbsX0L9t/ZWgOMXql9dVypTz0AZFCjVY8=
X-Google-Smtp-Source: ABdhPJw+QxhsRG9WmMso+/sn2VOCi90axZDufRxbhIIrBT4f6i8TbNpD8a8jsy3bWHctMwUtUsM7jhsX/ejRaH+iuSw=
X-Received: by 2002:aed:3b62:: with SMTP id q31mr13887821qte.293.1593403126991;
 Sun, 28 Jun 2020 20:58:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593141198.git.akuster808@gmail.com> <CAMKF1so4o6vsd3zyPKOu-w9CC=48ubfPSz9HYEEg6GWpFa3v=A@mail.gmail.com>
In-Reply-To: <CAMKF1so4o6vsd3zyPKOu-w9CC=48ubfPSz9HYEEg6GWpFa3v=A@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 28 Jun 2020 20:58:21 -0700
Message-ID: <CAMKF1sp2e56RsTkjQYC7jHYq7CnD9M5XPEjGTRGUNJPRdV-Ytg@mail.gmail.com>
Subject: Re: [oe] [zeus 0/6] Patch review
To: akuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

merged

Thanks Armin

On Thu, Jun 25, 2020 at 9:13 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On Thu, Jun 25, 2020 at 8:14 PM akuster <akuster808@gmail.com> wrote:
>>
>> Please have reviews back by Saturday
>>
>> The following changes since commit 9e60d30669a2ad0598e9abf0cd15ee06b523986b:
>>
>>   sanlock: Replace cp -a with cp -R --no-dereference (2020-03-15 13:30:34 -0700)
>>
>> are available in the Git repository at:
>>
>>   git://git.openembedded.org/meta-openembedded-contrib stable/zeus-nut
>>   http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/zeus-nut
>>
>> Armin Kuster (1):
>>   tremor: update SRC_URI as project moved to gitlab
>>
>> Haiqing Bai (2):
>>   gd: fix CVE-2017-6363
>>   python-urllib3/python3-urllib3: fix CVE-2020-7212
>>
>> Wang Mingyu (2):
>>   libssh2: CVE-2019-17498.patch
>>   opensc: CVE-2019-19479 CVE-2019-19480
>>
>> Wenlin Kang (1):
>>   ipmitool: fix CVE-2020-5208
>
>
> Lgtm
>
>
>>
>>
>>  .../tremor/tremor_20180319.bb                 |   2 +-
>>  ...-Fix-buffer-overflow-vulnerabilities.patch | 133 ++++++++++++++++
>>  ...uffer-overflow-in-ipmi_spd_print_fru.patch |  53 +++++++
>>  ...er-overflow-in-ipmi_get_session_info.patch |  53 +++++++
>>  .../0004-channel-Fix-buffer-overflow.patch    |  69 +++++++++
>>  ...er-overflows-in-get_lan_param_select.patch |  94 ++++++++++++
>>  ...u-sdr-Fix-id_string-buffer-overflows.patch | 142 ++++++++++++++++++
>>  .../ipmitool/ipmitool_1.8.18.bb               |   6 +
>>  .../recipes-support/gd/gd/CVE-2017-6363.patch |  35 +++++
>>  meta-oe/recipes-support/gd/gd_2.2.5.bb        |   1 +
>>  .../libssh2/libssh2/CVE-2019-17498.patch      | 131 ++++++++++++++++
>>  .../recipes-support/libssh2/libssh2_1.8.2.bb  |   1 +
>>  .../opensc/opensc/CVE-2019-19479.patch        |  30 ++++
>>  .../opensc/opensc/CVE-2019-19480.patch        |  34 +++++
>>  .../recipes-support/opensc/opensc_0.19.0.bb   |   2 +
>>  .../python/python-urllib3/CVE-2020-7212.patch |  54 +++++++
>>  .../python/python-urllib3_1.25.6.bb           |   2 +
>>  .../python3-urllib3/CVE-2020-7212.patch       |  54 +++++++
>>  .../python/python3-urllib3_1.25.6.bb          |   2 +
>>  19 files changed, 897 insertions(+), 1 deletion(-)
>>  create mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/0001-fru-Fix-buffer-overflow-vulnerabilities.patch
>>  create mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/0002-fru-Fix-buffer-overflow-in-ipmi_spd_print_fru.patch
>>  create mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/0003-session-Fix-buffer-overflow-in-ipmi_get_session_info.patch
>>  create mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/0004-channel-Fix-buffer-overflow.patch
>>  create mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/0005-lanp-Fix-buffer-overflows-in-get_lan_param_select.patch
>>  create mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/0006-fru-sdr-Fix-id_string-buffer-overflows.patch
>>  create mode 100644 meta-oe/recipes-support/gd/gd/CVE-2017-6363.patch
>>  create mode 100644 meta-oe/recipes-support/libssh2/libssh2/CVE-2019-17498.patch
>>  create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2019-19479.patch
>>  create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2019-19480.patch
>>  create mode 100644 meta-python/recipes-devtools/python/python-urllib3/CVE-2020-7212.patch
>>  create mode 100644 meta-python/recipes-devtools/python/python3-urllib3/CVE-2020-7212.patch
>>
>> --
>> 2.17.1
>>
>> 
