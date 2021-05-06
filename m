Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web09.9178.1620307917684961419
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 May 2021 06:31:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LKL0JuPB;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id t2-20020a17090ae502b029015b0fbfbc50so3459345pjy.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 May 2021 06:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:autocrypt:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=LvOM4zeA9m9w/uZ7lscG3KiLty4rUqjDSkOfHzYiXBI=;
        b=LKL0JuPB12ikiWkvupGG6Qs4W86ktc5KrwnjPHk1R/0Ge+GgoLTfOTZsOG41btzZed
         7AM6js8X3L/jEe2KPdNy695lhRvZ/pD/bRaPbBsW26W5ibljkOIoweMiMsc4fE2qrmLC
         Z1+P93FwP+hgUoNBmpvfFPRgvnApCs8ZIQZo/GuDiqGULlEE4gWuG4EckSr6VuRr92pg
         6FWzn76XtOzWEIQNhvUoh5kx41iu2zosi3VD9IcSoH92J5yBKl33c7XTpobRvOKNG7Wo
         EVqlsz6Id5XWY1r6acaaqU8uspyyoVk/XqWQ+xk/oKHSWByon7pMpNvRxEU2ohTNYkxT
         zEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:autocrypt:message-id:date
         :user-agent:mime-version:content-transfer-encoding:content-language;
        bh=LvOM4zeA9m9w/uZ7lscG3KiLty4rUqjDSkOfHzYiXBI=;
        b=jC/ARG0UkD2tHQ1qG5mXtaHMNmU5ObO/cR6oQMziFz+JXwl09gJAgGiW99ddepZv3L
         GNfxmdMl2YQD4L7ZCwCzumrR7Zu0BH5o2DZUt9Ksky8JVSf4jOIMKM4htSauc7EaFgOM
         +VIQm4SZmOwerZwzVkDeuqRnFxhaNwz8FSqQroNEtpabzddEIv+E6dm6SAP1YuYwyR/b
         4aX1T9DC5b4xtoqWx0AIr+St4RCkre06Fn9PV+easWdsADyQQsszuu8DKjWsEdi1C3LE
         k9EPGmuSQ72QbhwNJhBSJdlCgeSEwmfQoGprGIpzaFFoMBiGFlBvN+zdF+s3IWxAkCMd
         yCOg==
X-Gm-Message-State: AOAM5328HqQoJcLqUMBNWkS4F0ohZqQVNJkpHZsPRJUn5LwWYQ4RjDcn
	mRwL+Z6JdWC/Ylk0zalIjCs=
X-Google-Smtp-Source: ABdhPJyqK7kBgpRV4qvrgwwtF7Ooli+RPgzdc0NqiDDaKGBC5YujreW9RPoTdHgGjvjJBU6zrLaYYA==
X-Received: by 2002:a17:90a:c7d4:: with SMTP id gf20mr4632775pjb.106.1620307917215;
        Thu, 06 May 2021 06:31:57 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:899e:2fa0:8320:d89b? ([2601:202:4180:a5c0:899e:2fa0:8320:d89b])
        by smtp.gmail.com with ESMTPSA id h9sm2338078pfv.14.2021.05.06.06.31.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 May 2021 06:31:56 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Subject: Gatesgarth-next merge request: May 6
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <1f41ca9d-1cd1-b4af-c107-5ca152360976@gmail.com>
Date: Thu, 6 May 2021 06:31:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit 29ca52c7826ad3044b53ccb5224016bd73abdb5c:

  gpsd: backport d-bus message time patch from upstream (2021-04-18
20:03:23 -0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded gatesgarth-next

for you to fetch changes up to 70ee7293017c4f38fee71ffdb60e4713fdc88bcf:

  nodejs: 12.20.2 -> 12.21.0 (2021-04-29 21:41:27 -0700)

----------------------------------------------------------------
Armin Kuster (2):
      nostromo: Blacklist and exclude from world builds
      packagegroup-meta-webserver: remove nostromo from pkg grp

Clément Péron (1):
      nodejs: 12.20.2 -> 12.21.0

Sean Nyekjaer (1):
      nodejs: 12.20.1 -> 12.20.2

 .../recipes-devtools/nodejs/{nodejs_12.20.1.bb => nodejs_12.21.0.bb}  
| 2 +-
 .../recipes-core/packagesgroups/packagegroup-meta-webserver.bb        
| 1 -
 meta-webserver/recipes-httpd/nostromo/nostromo_1.9.9.bb               
| 3 +++
 3 files changed, 4 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_12.20.1.bb =>
nodejs_12.21.0.bb} (98%)

