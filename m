Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web12.1394.1628606883083846057
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Aug 2021 07:48:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ebHi6fBd;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id a5so5643700plh.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Aug 2021 07:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=QUpDpwy6lfA2SS2Szjnrlq/1PNuNNMz+RHAFLOeoS8U=;
        b=ebHi6fBdyTJ0wydonQvFizGNA58seuDYQGa9pnI2Bj0JPjdtAGulYeCLDFbEqQ8EGw
         uCuNAQ/Kt9H41Z4FoYa7VzXUBDNWKvd9ZOdyxUiEyOzjGs2bgybXC/y3k+76CSwPZ08X
         gv9//yMqXpX0eRG+d0CmH4KRT8y7JQuVtkAxVCf6ykOaGF0ZRVSLL1WLZPUm9W46M6Of
         l/JP27WbwiBKPPRKiwFn2TwtDz22zZQ5j1IgYyTMvDfzSxxSr0FlC1tbHUSo/5szyF7i
         6qr0ZpI6DY/lZwDgbiDEPFIzfEGZeBvXtTDjrKP0NglLmrrV+wWip/LGqkwQ7s5BsNDJ
         uIVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=QUpDpwy6lfA2SS2Szjnrlq/1PNuNNMz+RHAFLOeoS8U=;
        b=G34a9LmKCSziRcFTersW9W0vengiqMu/fmV2OSzovb4wPqMaW5mI7GONnMo4Gsv6zM
         z1Hlf6sZee1BSPGQvkS64SwDlcZedgtyIS3N6oEhg3q4vJc3S8y4U0J7txovypqxUWAU
         L6CqZnNpj2DrXe0qT6rzp1W0uaSA8X3Y9FQXXTs4rZje+tERVmHiM+S/UVYgOl4QZdHY
         8trvd0HW4mPE/+4LzIT69mSXnr8KzPr2eEdJxEZSfsWjQ/usx4t7KhAmA0KJogYdaslG
         nLcnio17fEjUZg/u4X0xkPt3r3rnoyObWubKzIXuVGVbguyJaLUOTMYVMGtvVmKqdsfS
         A7Ig==
X-Gm-Message-State: AOAM531h+1TIeaImL8s2HbP/6jQkO8uWfMybFcvZ+cA5oEM2wBTaTh63
	yYM3CUtEfdr3C3V+IlB34XI=
X-Google-Smtp-Source: ABdhPJwGkCeQUKswED1XEAwqiQ70B5d6hRUtex7oKOKmVC0X+WpJAJlpdn4ry0V2R5aNisPAvoRnUg==
X-Received: by 2002:a17:90a:ad06:: with SMTP id r6mr5292032pjq.25.1628606882578;
        Tue, 10 Aug 2021 07:48:02 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:32d:5eba:f55b:c5d7? ([2601:202:4180:a5c0:32d:5eba:f55b:c5d7])
        by smtp.gmail.com with ESMTPSA id m17sm24017020pfh.133.2021.08.10.07.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Aug 2021 07:48:02 -0700 (PDT)
Subject: Re: [oe] [dunfell][meta-oe][PATCH 0/2] thrift upgrade
To: Andrej Valek <andrej.valek@siemens.com>,
 openembedded-devel@lists.openembedded.org
Cc: sakoman@gmail.com
References: <20210810135555.12946-1-andrej.valek@siemens.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <c2bc6f71-3c98-f24b-dddc-d5078f173449@gmail.com>
Date: Tue, 10 Aug 2021 07:48:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210810135555.12946-1-andrej.valek@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 8/10/21 6:55 AM, Andrej Valek wrote:
> Upgrade thrift to version 0.14.2 due to remote security
> vulnerability.
No specific security issues are mentioned in the other patches. This is
a big jump and from what I can decode from their release notes. They
deprecate many things between these two versions.

Unless I can be convinced otherwise, this update is deemed outside the
acceptable norms for a stable release.

I think backport the specific security issues may be  more appropriate.

thanks,
Armin

> Andrej Valek (2):
>   thrift: drop unsupported features
>   thrift: upgrade to 0.14.2
>
>  ...llationPaths.cmake-Define-libdir-in-terms.patch |  8 +++----
>  .../thrift/{thrift_0.13.0.bb => thrift_0.14.2.bb}  | 26 ++++++++++------------
>  2 files changed, 16 insertions(+), 18 deletions(-)
>  rename meta-oe/recipes-connectivity/thrift/{thrift_0.13.0.bb => thrift_0.14.2.bb} (72%)
>
>
> 
>

