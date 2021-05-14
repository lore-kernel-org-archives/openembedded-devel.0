Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web12.4868.1620968144916173570
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 May 2021 21:55:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WxbU7frj;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id s22so23330513pgk.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 May 2021 21:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=AxTnpm+Jrz3nbFx+B9MAmZVx0484VU/4+lJkpxU+pOg=;
        b=WxbU7frjWi+do3s5NgYDscDiivQIb0P2FqKfzKABczMfSLOaOC5khtTak5qX1fUvw7
         yLs6p5YeM+AyTkuhdB7TcuhGiF1m9krR/CcA9W+Gcf7UVprhSpGKvM6mWCX/smNu7lX8
         uh0/qXd/GNhIjZn77H65MHF/vl+5QShAKaRzgAB3RbOLxP7BSMS42fIwxS1ZRdve8V83
         8mwWrPWB8ydNy3uqOUxZkRzLzglvWCdHBiKJs/6xk0ULMiba3VgzRsHNgH8hFTKvk6YY
         5BiuHuwernJ6459eyZirN1nm5PrQMqtmtigpok9gMmVxpagxaQlF3oXsNKFLko98hplW
         HNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=AxTnpm+Jrz3nbFx+B9MAmZVx0484VU/4+lJkpxU+pOg=;
        b=lkJ28AXdzidq8jwzAlbfNrq5x9FoDxnjmPvtxNWJC8Yt2e2SQ73r7Zsqt7EnTb1JxI
         qMHR26Dfo88aln+Z+pbPIv4/e/AewhIdjp4fV0gO0nFwBb0a5ydwjrthxHUagEAQqfnx
         kAkdcwXuCKxTrnKt7EQVvY92MPg94lY1+98u8kH7PM8ja7ZdCTDtzsX1l6m6lPOd7b/o
         s2l78M8zhEp02LrqfM8n0MbR2ihPRKT3V8VlsURd+gVNcNb39j4LqGrfhjkJhQchA5pm
         afMPXCE7rt4spG2Cql3x9E93Tc5e5tQiMWY/7jJ28DNHgAPBrEmgvVXNMk3raRqFrGH4
         dycg==
X-Gm-Message-State: AOAM532gbi1j/wpaPTtouoPw7CmdUxNfprgpJQ11MsRPudJTaAXgI9ts
	AQKVsWIzsRIHDe6eBflPcQU=
X-Google-Smtp-Source: ABdhPJwFA6y9MShu6Sxy9A5KCsJbP3/k+XeikIYjj1exCG8hbep7zA0TYelebEFq9S+zEDYq/OkZMQ==
X-Received: by 2002:a63:4c66:: with SMTP id m38mr44532269pgl.157.1620968144416;
        Thu, 13 May 2021 21:55:44 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:e2:8f3f:6fa1:8a8b? ([2601:202:4180:a5c0:e2:8f3f:6fa1:8a8b])
        by smtp.gmail.com with ESMTPSA id t133sm3381631pgb.0.2021.05.13.21.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 May 2021 21:55:44 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Subject: dunfell merge request May 13th
Message-ID: <418378d1-ae13-c44f-6136-ed733f1dcf40@gmail.com>
Date: Thu, 13 May 2021 21:55:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit c1a50683225b0bf10f8d7a18280acefa7469ecc2:

  libupnp: Fix CVE-2020-13848 (2021-04-23 19:13:09 -0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded dunfell-next

for you to fetch changes up to 2915810edbb6599051e30efb3b7f805665ddcc23:

  ostree: switch from default master branch to main to fix do_fetch
failure (2021-05-13 21:52:34 -0700)

----------------------------------------------------------------
Martin Jansa (1):
      ostree: switch from default master branch to main to fix do_fetch
failure

 meta-oe/recipes-extended/ostree/ostree_2020.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

