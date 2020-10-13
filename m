Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web12.14189.1602601554438227113
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 08:05:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cyQYM+zy;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id m11so240668otk.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2020 08:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=W21RMF0SNbE67/zs1eSYRLu0xnJZZ+P/fFm2iVAuVP8=;
        b=cyQYM+zyDWiHLNUvZuclR+XBByyBT+7HpYhCckFRasvALxklFforM/Me93MVZKPG3v
         0Z7FhU7kSikh/e+5epDr4emmEZQaZFjs5hClQwV5qH8xkU9GHH2KXTIN3txrpXn7QVgf
         x5CFnvlofjWjvpFglqqw8DRYUu0y7ZGqU1lPwnsQdV7eIzPbPRpkdvLEVaVgD+TZ+cME
         Ug9AYF6a6NMjT2WSvTgh1lRkjjShUwM2zt+aahHZfKxd7x82kgE6JayC23A2Umvy1y2d
         R8561Rba8zyFtMCzerBXo8keUbAgVBdiqTB9trp+nCEzvCvqN+d04ndueSlppWeH+qhl
         iJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=W21RMF0SNbE67/zs1eSYRLu0xnJZZ+P/fFm2iVAuVP8=;
        b=XfRy9isyiOwEz0mWEFTIOM1j88zpXqTPXdzzkU3z/drIHDouj72yF81/lUXJzzQSYK
         UySHZmjTuFeBnIfTuRSj4XBZ+GG+ifvlIJ/lxW2jNUlk+93OxoWtGkdDhM+DMb9A3EZD
         GbP1WXy7YGejIRPwauL0KMW7nXe9YbuY3EomKBQ6COfXQeSl7n08+PHx866FpjCiDxqp
         x9bdx+dJr6MRb2pXVy+6NchjPcg9ZZBvqO12Pw/+At2lXSh2epgRH0hyCRr/j76ftf3L
         0P6CiKR3v+BpLpY66S8q2Ecufi4WJyH+Atw+L3Sn/tJSuSeZepncwykgQjWDNnyAzPK0
         e6CA==
X-Gm-Message-State: AOAM531xyp2lufVTZV7CPYTZXEsfwOhLKs4ZxaXD5q7TZm53GRwpo43f
	UprPAcCC5IQNuuAnFOyahcc=
X-Google-Smtp-Source: ABdhPJz6EiSVl0GZXLlstAbCFaHJa83IV88YB8Pb/Awp96pDnx4mmogNiEjlEQpqwzojnuWHRcNIyQ==
X-Received: by 2002:a05:6830:2ee:: with SMTP id r14mr85848ote.0.1602601553655;
        Tue, 13 Oct 2020 08:05:53 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:d58b:c80e:7cac:2737? ([2601:202:4180:a5c0:d58b:c80e:7cac:2737])
        by smtp.gmail.com with ESMTPSA id b16sm2863527oti.4.2020.10.13.08.05.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2020 08:05:52 -0700 (PDT)
Subject: Re: [oe] [dunfell 0/9] pull request
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
References: <163C5AC1761FD67D.15658@lists.openembedded.org>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <2de8951e-11bb-3027-957c-f47f4829191f@gmail.com>
Date: Tue, 13 Oct 2020 08:05:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <163C5AC1761FD67D.15658@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 10/9/20 7:55 AM, akuster via lists.openembedded.org wrote:
> Cover letter only
>
> please merge this to dunfell

ping

>
> The following changes since commit 144077083457ccb75700777d5e6b1da9aaff01aa:
>
>   iwd: Upgrade to 1.9 (2020-09-19 11:22:44 -0700)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/meta-openembedded dunfell-next
>   http://cgit.openembedded.org/meta-openembedded/log/?h=dunfell-next
>
> Andreas Müller (1):
>   gnome-settings-daemon: Remove wrong RDEPEND
>
> Hongxu Jia (1):
>   python3-pykwalify: fix missing comma
>
> Khem Raj (1):
>   ssmtp: Use update alternatives for conflicts with esmtp
>
> Martin Jansa (2):
>   netkit-rsh: inherit update-alternatives
>   ssmtp: adjust u-a
>
> Mingli Yu (2):
>   smartmontools: Remove obsolete setting regarding the Standard Output
>   strongswan: Remove obsolete setting regarding the Standard Output
>
> Pierre-Jean Texier (1):
>   haveged: upgrade 1.9.9 -> 1.9.13
>
> Robert Yang (1):
>   crda: rdepends on wireless-regdb-static
>
>  .../gnome-settings-daemon_3.34.2.bb           |  2 --
>  .../recipes-connectivity/crda/crda_3.18.bb    |  2 +-
>  .../netkit-rsh/netkit-rsh_0.17.bb             |  2 +-
>  .../recipes-support/ssmtp/ssmtp_2.64.bb       |  9 ++++-
>  ...setting-regarding-the-Standard-Outpu.patch | 34 +++++++++++++++++++
>  .../strongswan/strongswan_5.8.4.bb            |  1 +
>  .../{haveged_1.9.9.bb => haveged_1.9.13.bb}   |  2 +-
>  .../smartmontools/files/smartd.service        |  1 -
>  .../0001-rule.py-fix-missing-comma.patch      | 34 +++++++++++++++++++
>  .../python/python3-pykwalify_1.7.0.bb         |  2 ++
>  10 files changed, 82 insertions(+), 7 deletions(-)
>  create mode 100644 meta-networking/recipes-support/strongswan/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
>  rename meta-oe/recipes-extended/haveged/{haveged_1.9.9.bb => haveged_1.9.13.bb} (97%)
>  create mode 100644 meta-python/recipes-devtools/python/python3-pykwalify/0001-rule.py-fix-missing-comma.patch
>
>
> 
>

