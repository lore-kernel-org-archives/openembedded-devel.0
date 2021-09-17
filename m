Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web08.363.1631894199450244482
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Sep 2021 08:56:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lLaGScjZ;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id a66so18860322qkc.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Sep 2021 08:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wWds7rHQuBXALpP8Gm9sUcxWxxmV+DYcNZYaNzHtrNM=;
        b=lLaGScjZcQebSCDxgjmiS7VAB+0wlhQc15VLfB1/1gThrBcicZaNRmCWBawvzG7FVS
         0Y8Q9NQ8j4jQMTaY4tN5geQVKjBgJ+QDiKfhmh+vcaykXaGX50qq3HoHr/VfKKP+ps/e
         8T5Dxy7iJW9PBiHkj5JtAh/nEC8eoKfzkSuDZgi/BMQA4ehR7oT9Sfi5huI5KLF3OQ7n
         X9hjAEt/geBxPFFAONg6iSoJXRzr+Z3G4X8CdOGnPqenGQJx/gfAAbsD5/qLfewEQIRK
         dq6eGnuTxg7EXbzljGYtf5hQmofhM+oatjM4vrGfo6Z/4i3b3uiIVRvugL+7ROI2Ygpy
         ugEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wWds7rHQuBXALpP8Gm9sUcxWxxmV+DYcNZYaNzHtrNM=;
        b=MlCxZvJFpqcFPXe+HqMReqVTHXS9M6f/sIbwQHg3Dl7j9lrxB3bl4VVmoWxN0a4+vI
         AlMQM/mB2Sc4XvfWm0Z0/ZlLevs0DipeVQEwMjtdd1cKq4YUHeLvAE9mxOIpFJbQ7g3Y
         aXwCabveXR3iy1GitNzf8ofuHJM2gaJE+M35dXZftgqp1qf3k1v8nzqllt3NCa5uf1Nv
         TQNdH6IufPFgqgspPJdb06mX/uG6XgLoHi+L2oFUTXBjxbZniysdmsxtourY2/UcNUnw
         +TvAb/PB4SP28JmRE+mrRDkCIR6sZiN8wS0gotI7bakLzwGhBB0zjOm/fS2kCipdnMLn
         76Jg==
X-Gm-Message-State: AOAM532jbuHZKqpRqgZ706Afm/L5aO90roHNOccJOjbeAYHCa/HRVn7s
	J53PTFztPUE8a7NOrnJXNNy1y7tuIN6F5tAbJjI=
X-Google-Smtp-Source: ABdhPJx9/0CxAtHturqVwbk9Wv6x9JfYO4zz/1zRBnUqkGuFHUqmyOEg4uA4ZqjsfH7pha4Twn5lsfQjo9AGai6krb4=
X-Received: by 2002:a37:a554:: with SMTP id o81mr11095762qke.231.1631894198327;
 Fri, 17 Sep 2021 08:56:38 -0700 (PDT)
MIME-Version: 1.0
References: <f4770079-9ac5-cd6b-3251-0ed8647e796b@gmail.com>
In-Reply-To: <f4770079-9ac5-cd6b-3251-0ed8647e796b@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 17 Sep 2021 08:56:12 -0700
Message-ID: <CAMKF1spX10KHSvOWB0YR=ts7=v_M8Xtbg8Dt5fxB-0UP8W0g_w@mail.gmail.com>
Subject: Re: hardknott merge request Sept 17th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

merged thx

On Fri, Sep 17, 2021 at 7:42 AM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit 7bd7e1da9034e72ca4262dba55f70b2b23499aae:
>
>   dlt-daemon: update from 2.18.6 to 2.18.7 (2021-09-04 10:39:29 -0700)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded hardknott-next
>
> for you to fetch changes up to dc262c52b0b10625bf7a2330e1c4e0fe2d8db6aa:
>
>   c-ares: fix CVE-2021-3672 (2021-09-14 07:41:42 -0700)
>
> ----------------------------------------------------------------
> Changqing Li (1):
>       c-ares: fix CVE-2021-3672
>
> Joe Slater (1):
>       redis: fix CVE-2021-32761
>
> Khem Raj (1):
>       vboxguestdrivers: Remove __divmoddi4 patch
>
> Kristian Klausen (1):
>       cryptsetup: Add runtime dependency on lvm2-udevrules for udev
>
> Peter Kjellerstedt (1):
>       cryptsetup: Only recommend kernel modules when building for target
>
> Yi Zhao (1):
>       krb5: fix CVE-2021-36222
>
> wangmy (1):
>       cjson: upgrade 1.7.14 -> 1.7.15
>
> zangrc (1):
>       cryptsetup: upgrade 2.3.5 -> 2.3.6
>
> zhengruoqin (1):
>       wireshark: upgrade 3.4.7 -> 3.4.8
>
>  .../wireshark/{wireshark_3.4.7.bb => wireshark_3.4.8.bb}        |   2 +-
>  meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-36222.patch     | 121
> +++++++++++++
>  meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb                |   1 +
>  .../cryptsetup/{cryptsetup_2.3.5.bb => cryptsetup_2.3.6.bb}     |  31 ++--
>  .../recipes-devtools/cjson/{cjson_1.7.14.bb => cjson_1.7.15.bb} |   2 +-
>  meta-oe/recipes-extended/redis/redis/CVE-2021-32761.patch       | 257
> ++++++++++++++++++++++++++++
>  meta-oe/recipes-extended/redis/redis_6.2.2.bb                   |   1 +
>  meta-oe/recipes-support/c-ares/c-ares/0001-CVE-2021-3672.patch  |  91
> ++++++++++
>  meta-oe/recipes-support/c-ares/c-ares/0002-CVE-2021-3672.patch  | 104
> +++++++++++
>  meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb                 |   2 +
>  .../vboxguestdrivers/vboxguestdrivers/add__divmoddi4.patch      |  36 ----
>  .../recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.26.bb |   1 -
>  12 files changed, 595 insertions(+), 54 deletions(-)
>  rename meta-networking/recipes-support/wireshark/{wireshark_3.4.7.bb =>
> wireshark_3.4.8.bb} (97%)
>  create mode 100644
> meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-36222.patch
>  rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.3.5.bb =>
> cryptsetup_2.3.6.bb} (88%)
>  rename meta-oe/recipes-devtools/cjson/{cjson_1.7.14.bb =>
> cjson_1.7.15.bb} (90%)
>  create mode 100644
> meta-oe/recipes-extended/redis/redis/CVE-2021-32761.patch
>  create mode 100644
> meta-oe/recipes-support/c-ares/c-ares/0001-CVE-2021-3672.patch
>  create mode 100644
> meta-oe/recipes-support/c-ares/c-ares/0002-CVE-2021-3672.patch
>  delete mode 100644
> meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/add__divmoddi4.patch
>
