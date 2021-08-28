Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web09.3892.1630159810276710141
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Aug 2021 07:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bpHXESeP;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id m6so633491pfh.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Aug 2021 07:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=76l4MePghktVhAyOcL4WhHr7qwDBo5GcMtsWGySo2Y4=;
        b=bpHXESePMtiU4811+9qH1K7bYyNz+DlzHAXuaH2tSMJ2Ov75V3g1sOoARk1GUzjei7
         ZLjRNATUuDg8V3h6QTSu5M1Nkm86suh/tDSTRDFqnz+FGH5oiKB2yIwYEea4SB8gaNOV
         lVmTfxKPH0/JtV2rU/DU/DKhRB6ygBI1ofSXQIJOzKqlZxYv3gWlTK54w1ds2lv5YZBL
         FB6mrML4wIkPVElQ7sS0lDPnrrV6/dHI79wUeUWXPAJHYSPsnssqYpjyNMNz2QzqsoYi
         XhNKhiPwjYCCugI0P5j5mELnTNTrbnM03jF59P0VDUIcRbXKLcvr31JI5Re4InVUcKXn
         x26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=76l4MePghktVhAyOcL4WhHr7qwDBo5GcMtsWGySo2Y4=;
        b=kWhpbd+/gO34ymfVFrmq0cdCS2CED5rk5ODIm8caZ0LeqqZCn1ApsisPMbTiKw1nk9
         +BQAQKyCy+pyPGPots6Qwk07Ffh2eOlkJRo7VI3aXmJOaRx/i0wgowE+/zzgnoxWPJ3K
         zy++a9r1k7d7LavbNrE9Nz5iKgmoWmAaUpGdlwhlrXU+QKQWeG4Er4TTavHAgGIwq9G5
         9VTUGbliVl7gxswHgdEbaC3rHK4VoiHQO30UcJfeVkeLY8iwJYz9P062P60TQH+hhrCS
         b8sMS1PzdwfiD2WmyXwZMpcThAMwp00fECJ0dQDZ4pzU4bm5qPa0J8s90GADusw1puHR
         9GNA==
X-Gm-Message-State: AOAM531y4rbInxV14oqtgviOcES9Wvj6mXj+uLsLkhCsSFFgLF/H6AjW
	DHZ0oYLut/CPEM0ULxKq0lk=
X-Google-Smtp-Source: ABdhPJzRcio1icUdsEc/plGKKykmAhAP/gdsy1wAccNuLPG9+fRTqdtZU75wbbo93FjkL7nXTX0l8A==
X-Received: by 2002:a63:e116:: with SMTP id z22mr12546060pgh.361.1630159809554;
        Sat, 28 Aug 2021 07:10:09 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPV6:2601:646:9200:a0f0:718a:f86b:7e24:3a01? ([2601:646:9200:a0f0:718a:f86b:7e24:3a01])
        by smtp.gmail.com with ESMTPSA id n79sm9049810pfd.167.2021.08.28.07.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Aug 2021 07:10:09 -0700 (PDT)
Message-ID: <b2d65f89-f307-71cc-8ac1-b99bd7ac3e60@gmail.com>
Date: Sat, 28 Aug 2021 07:10:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.0.3
Subject: Re: hardknott merge request Aug 28th
To: akuster808 <akuster808@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <1e504e7a-4245-967b-74fb-29859377f19e@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <1e504e7a-4245-967b-74fb-29859377f19e@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 8/28/21 6:27 AM, akuster808 wrote:
> The following changes since commit d323115ecd437e397bd504758ba52988900f4747:
> 
>    fvwm: Fix build time paths in target perl/python scripts (2021-08-15
> 07:09:56 -0700)
> 
> are available in the Git repository at:
> 
>    https://git.openembedded.org/meta-openembedded hardknott-next
> 
> for you to fetch changes up to 5741b949a875b07335d4920aefa6defd13ed45c6:
> 
>    gd: fix CVE-2021-38115 (2021-08-26 19:18:35 -0700)
> 
> ----------------------------------------------------------------
> Changqing Li (1):
>        linuxptp: upgrade 3.1 -> 3.1.1
> 
> Mingli Yu (1):
>        polkit: fix CVE-2021-3560
> 
> Roland Hieber (2):
>        curlpp: fix override syntax
>        ldns: fix override syntax
> 
> Sakib Sajal (1):
>        gd: fix CVE-2021-38115
> 


merged thanks

>   meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb          |  2 +-
>   .../linuxptp/{linuxptp_3.1.bb => linuxptp_3.1.1.bb}             |  6 +++---
>   meta-oe/recipes-devtools/ldns/ldns_1.7.1.bb                     |  2 +-
>   meta-oe/recipes-extended/polkit/polkit/CVE-2021-3560.patch      | 31
> +++++++++++++++++++++++++++
>   meta-oe/recipes-extended/polkit/polkit_0.116.bb                 |  1 +
>   .../0001-fix-read-out-of-bands-in-reading-tga-header-file.patch | 33
> +++++++++++++++++++++++++++++
>   meta-oe/recipes-support/gd/gd_2.3.2.bb                          |  1 +
>   7 files changed, 71 insertions(+), 5 deletions(-)
>   rename meta-oe/recipes-connectivity/linuxptp/{linuxptp_3.1.bb =>
> linuxptp_3.1.1.bb} (73%)
>   create mode 100644
> meta-oe/recipes-extended/polkit/polkit/CVE-2021-3560.patch
>   create mode 100644
> meta-oe/recipes-support/gd/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch
> 
