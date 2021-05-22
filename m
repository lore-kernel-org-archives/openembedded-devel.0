Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.4363.1621725609754020385
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 May 2021 16:20:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O3N6mAKL;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id gb21-20020a17090b0615b029015d1a863a91so9222921pjb.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 May 2021 16:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=CBl2fYI4qcFXgJHTYQEey8w2DP2566S0+qUXS+SAX0A=;
        b=O3N6mAKLAdc1qyr37ru7w12z9VLGV/EDsgts6LHNew0aLBnu7u8BNDSMLoqTv0qezu
         updmMjQuQkVlVSS+YnIinpK39idShC1bqsadAzdk7skZR0Zy6AGkN376X7wL7cP1LuPQ
         a4nfdNB09UIZMH1I5KcgacmOmHy+dLoSYM8JwVtXMbxQZ6CnvuqP794vR31d35YUAFqc
         nZmcAaTjegaO18yMlspJsEKiT/w9z3vBjQaWmeUind1cVCGD6j+ZYyAHkifUK5yaPHDF
         Ya7S37dMWH9pL3Vx+m3CAuSDIq3jElBzh69nruPGvdmLhrpxjnXSl5Q6d3VJ4ferTgLI
         q+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=CBl2fYI4qcFXgJHTYQEey8w2DP2566S0+qUXS+SAX0A=;
        b=cOGJ9nWF4gIQnkHxY7+9QV0Ge1D7ceI/f/QIRuLqNaNADE91y1iV28SfOwRzgCseNN
         +A2IevMPwYZa+lMqgnUh6NLnU87QfcOmxyHG1tjjxI5a5t4uAW5jYhiFbXuA7zMxQ8LX
         cwsJs5NHAQnUraClT3KhmaqTNkZpjPmsNJ736xOeen4Wdq5OC63HlHwftqs20EmlD+Qt
         bcHluc6n+d2QRwAMo31PP5ygl21skGew8TLjdSz3TU6xSDFqnuJoHAIN/mELXjh8YdGQ
         kPPvQMI4BCSCXb+Ss8fG2xFVze7etTg+seaDW46UHzQBUCI4x8dk3eja/z2dafRjPx7u
         aIbQ==
X-Gm-Message-State: AOAM530OfWnkMOAxNMTCLzcKVv5fDVD3QSnejmtoRmiFP0iXCptMbZ2f
	/bXoO2BXzouXqRiN7u1p3Ic=
X-Google-Smtp-Source: ABdhPJxMd0syPSXWWCz+GRr8YKdzAJabQeGAUp55WU9oVZwO/5aRYgfdYmSY1c1t5efASJsNs7O4pg==
X-Received: by 2002:a17:90b:194b:: with SMTP id nk11mr16742259pjb.42.1621725609353;
        Sat, 22 May 2021 16:20:09 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:2c86:80f7:821f:a12a? ([2601:202:4180:a5c0:2c86:80f7:821f:a12a])
        by smtp.gmail.com with ESMTPSA id 69sm7436198pfx.115.2021.05.22.16.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 May 2021 16:20:08 -0700 (PDT)
Subject: Re: [oe] Dunfell merge request May 22nd
To: Alexander Vickberg <wickbergster@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
References: <21dba787-e5dd-bdac-bcf0-1b0ec84e1e77@gmail.com>
 <CAAxSGfZztRjKVJ5xRSMLY2p1so-L_7tmFdsX1g-4o5hj3qH9-g@mail.gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <5fa692a2-d007-a109-2551-0203f2569b30@gmail.com>
Date: Sat, 22 May 2021 16:20:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAxSGfZztRjKVJ5xRSMLY2p1so-L_7tmFdsX1g-4o5hj3qH9-g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 5/22/21 12:43 PM, Alexander Vickberg wrote:
> Hi,
>
> It would be nice if hostapd
> fix d6ef4170747d6668fa940328334055eef3e1e1d6 from master could be
> included.
ah, right. just picked it up for hardknott and dunfell.

thanks for ponting it out.

-armin
>
> Best regards
> Alexander Vickberg
>
> Den lör 22 maj 2021 kl 21:06 skrev Armin Kuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>>:
>
>     The following changes since commit
>     2915810edbb6599051e30efb3b7f805665ddcc23:
>
>       ostree: switch from default master branch to main to fix do_fetch
>     failure (2021-05-13 21:52:34 -0700)
>
>     are available in the Git repository at:
>
>       https://git.openembedded.org/meta-openembedded dunfell-next
>
>     for you to fetch changes up to
>     11eae114522a6befa06c7f4021a83bc016133543:
>
>       linuxptp: Fix cross build (2021-05-14 10:03:51 -0700)
>
>     ----------------------------------------------------------------
>     Armin Kuster (2):
>           nostromo: Blacklist and exclude from world builds
>           packagegroup-meta-webserver: remove nostromo from pkg grp
>
>     Clément Péron (1):
>           nodejs: 12.20.2 -> 12.21.0
>
>     Khem Raj (1):
>           linuxptp: Fix cross build
>
>     Saloni Jain (1):
>           fuse: Whitelisted CVE-2019-14860
>
>     Sean Nyekjaer (1):
>           nodejs: 12.20.1 -> 12.20.2
>
>      meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
>     <http://fuse_2.9.9.bb>             |  5 +++++
>      .../linuxptp/linuxptp/Use-cross-cpp-in-incdefs.patch            | 26
>     ++++++++++++++++++++++++++
>      .../linuxptp/linuxptp/no-incdefs-using-host-headers.patch       | 29
>     -----------------------------
>      meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.bb
>     <http://linuxptp_2.0.bb>           |  7
>     ++++---
>      .../nodejs/{nodejs_12.20.1.bb <http://nodejs_12.20.1.bb> =>
>     nodejs_12.21.0.bb <http://nodejs_12.21.0.bb>}             |  2 +-
>      .../recipes-core/packagesgroups/packagegroup-meta-webserver.bb
>     <http://packagegroup-meta-webserver.bb>  |  2 +-
>      meta-webserver/recipes-httpd/nostromo/nostromo_1.9.7.bb
>     <http://nostromo_1.9.7.bb>         |  3 +++
>      7 files changed, 40 insertions(+), 34 deletions(-)
>      create mode 100644
>     meta-oe/recipes-connectivity/linuxptp/linuxptp/Use-cross-cpp-in-incdefs.patch
>      delete mode 100644
>     meta-oe/recipes-connectivity/linuxptp/linuxptp/no-incdefs-using-host-headers.patch
>      rename meta-oe/recipes-devtools/nodejs/{nodejs_12.20.1.bb
>     <http://nodejs_12.20.1.bb> =>
>     nodejs_12.21.0.bb <http://nodejs_12.21.0.bb>} (98%)
>
>
>     
>

