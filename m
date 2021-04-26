Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web11.10409.1619457255501009103
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Apr 2021 10:14:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NjG4pdRO;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: akuster808@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id p8so4046740iol.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Apr 2021 10:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:autocrypt:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=P7CwZiCo+qpozNOfC/tifCXxPMDEYbJ1CAM8MGt3/Hw=;
        b=NjG4pdROVj3GCrq029t+6rIvAc/8KbcKxyGE3aikBfKCGkkNCKM25Q7G/CGXtqyLqi
         NhjTzC+Xzj+6gwDmK29EeEKVwXLk+0/mJq5j1zbDaUZXPLPacI75B8SpNaEiERoZwRvm
         yhL0h7s5izFyKj8H47koBKqWQO5ggBvfXGTn0Fb6f/CLfgdsbfUm259DitlOvsWdaytB
         vmMJKzzH5HKzOGuq65+32xKYCd2Tu2aHnifLS8KHefbDmSesOeSi6eUGfFdWjdAbBI7r
         8x5AH5txwHsMwP+uyJZR1RqUznez/VJuvHk7DZMmAsrVmpr+WsWAV2AE4hBvEButwxOP
         nNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:autocrypt:message-id:date
         :user-agent:mime-version:content-transfer-encoding:content-language;
        bh=P7CwZiCo+qpozNOfC/tifCXxPMDEYbJ1CAM8MGt3/Hw=;
        b=aAteXH0phKwhFG2SzlxuecktNnbjelKcavkTnsNjwtHK/oBBvrnEDxTjonBLfF8LA6
         9hyJI9uLMNldATSo2XDGXmzaKhdpN7jbeDoEe/jpihdsw5JGBeaFIHHoSEFOJ8IlUQE4
         IjM1eAwrD2OjNh4M2ahAYXqnpzXZR/2J4SBT4QBuDSArHsb3Sfa47P6pQv4fm7nyi9ny
         /umO3BNJ/4+57qyafaJBMfrbbAVv1YPbqqwZqQKUoCUDkBJlxoLfi3Xpha3ZXpfKa2c/
         5yVB0Vs8oaqrmYQZKArDR2wHwFXNQlguzwgYLYtSpPTpYGYludVON/iUhvkW5oz3e+1B
         DvOw==
X-Gm-Message-State: AOAM5309JiG4aQ3vdF74wLWerFqSPFgIXDL1T0rbJmYS1YPAKBgy43kl
	G98njdPGUji8PudrMH0fwPyzX2MEpyH+Nw==
X-Google-Smtp-Source: ABdhPJyRvuvnv0NxT6wJcPhBRhWrS8s8unonGuky9Sj3TNXrBx7iXinQJTGKjdoTv2948z4qctgF/w==
X-Received: by 2002:a05:6638:381e:: with SMTP id i30mr5832840jav.61.1619457254281;
        Mon, 26 Apr 2021 10:14:14 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:1c81:c15:4155:b74d? ([2601:202:4180:a5c0:1c81:c15:4155:b74d])
        by smtp.gmail.com with ESMTPSA id w4sm210719ilj.12.2021.04.26.10.14.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Apr 2021 10:14:13 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: "Armin Kuster" <akuster808@gmail.com>
Subject: nostromo fetch error on master/hardknott
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <3d3b4f06-859a-86cd-e0ed-0934c673e76e@gmail.com>
Date: Mon, 26 Apr 2021 10:14:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hello,

I just notice new fetch errors for nostromo
<https://git.openembedded.org/meta-openembedded/tree/meta-webserver/recip=
es-httpd/nostromo/nostromo_1.9.9.bb>
in meta-webservers.

The hosting site is not responding. https://www.nazgul.ch/

My limited search for an alt source is coming up empty.=C2=A0 Is anyone u=
sing
this app?

-armin

