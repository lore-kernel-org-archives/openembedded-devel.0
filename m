Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web09.4719.1620967391320748168
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 May 2021 21:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qXlzn5Et;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id t21so15646737plo.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 May 2021 21:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=gfd8AGlbG1bil1yr1g45pi2q6zxvFxYTf+85xeuZy4Q=;
        b=qXlzn5EtUlLHADoKqX7uS0iqjlmPnSKbDaKqZZrxE4nG77qxd9ndn246V0GCyACTw1
         67Y+uSZVGt1DAk8o5dvgrhb4lTWVH1Mi0jZLM9SmUjGHJg+9a+uIY6S1+kvec2dVMTfw
         n9jUFABFn8djvRUUbxZ1RsM//ey2MeBva9E7YxWYMwl1kTZLII0dnDgHiGBzzaF30X3B
         8wOQdPJ/SREmzCcspBrG/3EfjtewmWbTnRShD3Yf+/fJaEIlN0p2uT7GMA3HMPLxtXsX
         MayxBOLKcwaJSWTKp23JYiDhzPx+3UPQGNBg0INpgMnvSjqDPh3RZqLXyoSyDzQ4Meva
         NGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=gfd8AGlbG1bil1yr1g45pi2q6zxvFxYTf+85xeuZy4Q=;
        b=i3cYxA6iVEo/XrqGYpFXwFo5TLgHgZzlS67hgNNplLj52qSduPlGGGJUwkuoiii191
         7/zSKw/URMYVRECeMD/m8G9+r0WKiNWhGEBdUKV9vSsbmKlq7WVCICtqPXX8qVg6lXKM
         A1CrfCngAQMQlqSp4oMADnFa2g5pYDDL07FwIpvx3fq3fWVTHdIruq25helF7HAl1Pqe
         MMrpcmjvogClDGYytlaMHcJ1fosK31sF2snbKBfVezHDHaxv3tjM1PUVbSr1H/qsZhPl
         yf3OJ/jp6h17Zi/icFH3ujHDVkm3LmoHB1FDCcSjQ2pOd8IdW3Uw2H07ID1w/SWdPFNj
         FgDA==
X-Gm-Message-State: AOAM5318eFcaOmdSagxDnMAX9Kb+YSPmQ26LVPDay5N8tGfvGzQQK7JF
	6e0zOoE8w0A54f3tNfrZuvU=
X-Google-Smtp-Source: ABdhPJxwmIylIgsBC1pDh+ZDsEFZF7iRSt5ZGBeYrIgSoNNRpcsWbZzDpCaANYIVboMPM3Xt4cOEaA==
X-Received: by 2002:a17:90a:d195:: with SMTP id fu21mr9045391pjb.208.1620967390571;
        Thu, 13 May 2021 21:43:10 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:e2:8f3f:6fa1:8a8b? ([2601:202:4180:a5c0:e2:8f3f:6fa1:8a8b])
        by smtp.gmail.com with ESMTPSA id z5sm592021pfa.172.2021.05.13.21.43.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 May 2021 21:43:10 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Khem Raj <raj.khem@gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Subject: hardknott merge request May13th
Message-ID: <53093edd-6ade-5b29-5972-179c1491fcec@gmail.com>
Date: Thu, 13 May 2021 21:43:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit c3a36263f91e42302ad7c347e051cf1cd83e39f6:

  packagegroup-meta-webserver: remove nostromo from pkg grp (2021-04-29
18:57:25 -0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded hardknott-next

for you to fetch changes up to bbe3855ec7d7e1417a42e9d7a4d1d3d338812088:

  ostree: switch from default master branch to main to fix do_fetch
failure (2021-05-13 21:37:32 -0700)

----------------------------------------------------------------
Martin Jansa (1):
      ostree: switch from default master branch to main to fix do_fetch
failure

 meta-oe/recipes-extended/ostree/ostree_2021.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

