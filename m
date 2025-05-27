Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF890C5AE59
	for <webhook@archiver.kernel.org>; Sat, 31 May 2025 10:56:04 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.48807.1748341500934009903
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 May 2025 03:25:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@elfin.de header.s=google header.b=CWz3aZx+;
 spf=none, err=permanent DNS error (domain: elfin.de, ip: 209.85.128.48, mailfrom: marcel.behlau@elfin.de)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-442f4d40152so4104925e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 May 2025 03:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=elfin.de; s=google; t=1748341499; x=1748946299; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1XszylzekhCIFLcrJ24h4l/gPJlYIqnh2AX6rdDoyI=;
        b=CWz3aZx+KGBj2iW4QAyOelBobxuZwxIajk8C6qNebp0GC9ECJ+KTsZDTSAe5n+V4W7
         EGZ9XcP/LkmC2LP2euznlah4hDfHvZXhVnjbNPxK6np73lz5D3L/N0/nACJ3Z1i5gfKH
         RPJ6Z1uoAPoa8w0i57Xf5sTIEFZMLIPhxhZ4hpZyz3/3pfHLmFTKsVMs7pg/BFbo5RcE
         hf1hbWbFBQgU1bLL1xif5Mf5x6gA0glDAfcm1854AREnIO+YlWlg33UnjnjyAlTaSGC0
         qkzpvQ9W7wMyNvQjQr7H6feZ3/TVLu/Yd19VQ/Nxj0x73zyl/zHEK6ljNCcKCtOAvEtn
         PCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748341499; x=1748946299;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n1XszylzekhCIFLcrJ24h4l/gPJlYIqnh2AX6rdDoyI=;
        b=uaOPvP4kr8EqrgsjOdSte7dRyQtom5X0iL6Ga7IzSFWv39O4JEWG2+RoxMn2aEyEho
         61mF+kHxGFT5IkbnimJ3ZMFAxUVU0A48hZ+tLxyZmHa61FIkc+0o/8H03iIdqzs13wgm
         B1d7qW1h2ieO8bl+gLcGRUTD8EOsUhatFzfNBXhHZV+T3jN8NhOVmOPPY5A7AN5fCeJ9
         qu8Dd8Uq9XEQsvjYJ2ZMYhRfPELBPE7ZZP07v7lCGVUJAyNj5zT2+4NoHtDEbbaPK8ja
         1gsIegJAuYXIwAfpqr1GT0PlZX3O9UNd3eVbUCMTfqcJhwPCtgm/TE6m6a3pHGUkOJii
         ihDw==
X-Gm-Message-State: AOJu0Yx4qNKx5oh0kS+6GtBIDu0mbLVMZ88TNdel7xoQ1pgcpnqkAaiN
	YKKOfTfLaCYT3K8Iia0Wli+xmCg6SZp+or16vXp5n3jHwtxWtqEpYTiVghxW7rnrc1ihXqOtFn6
	Q4gHgjNA=
X-Gm-Gg: ASbGnctMoML1uJk+cszS/wz4v+qBdNybM87UMJfasBisN+yiGhR7Djv39cWIAF0RVjb
	wdC7cWbUqLOiABZb6odbtF6VrSeAd6dFkiE3gxBPUMpGDnziMlhj87VFH1dAwPL+00kt6lA66HV
	nuKiLMno2/NYiVQFey2i0meSiqOsJAQkYry55MeVAce3UFtNPl+Y24dS8JUatWUPItE+UHBUJgV
	MVLYlPFz4P/SReIVIJcHRD63oYzmTTskV3yekTWBhNahm6FdIQKe2lCiv0NHZPa8+jrkU+LuXix
	ny7cOvsSKD3HSPnbvsKu+MBoy1W1yBgiPTkblWCRgTy+YozPz9d0WBnm8KfpRhYNAAwy63WXL6m
	ACxGZVNWjHQ==
X-Google-Smtp-Source: AGHT+IG0SNM4qRlf1R6C+6lTSgLsElUs877cgRq4hWzJLwK+J6cPP5rVCKgu0ahjI5CFZgWzEEgF8A==
X-Received: by 2002:a05:600c:4f8e:b0:439:90f5:3919 with SMTP id 5b1f17b1804b1-44c934e611fmr41566545e9.4.1748341499084;
        Tue, 27 May 2025 03:24:59 -0700 (PDT)
Received: from [192.168.2.195] (static-87-78-131-86.nc.de. [87.78.131.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aef8asm273577975e9.29.2025.05.27.03.24.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 03:24:58 -0700 (PDT)
Message-ID: <d0d7fb88-0579-4391-85ea-bafded19823f@elfin.de>
Date: Tue, 27 May 2025 12:24:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Marcel Behlau" <marcel.behlau@elfin.de>
Subject: Broken access to openembedded repos
To: openembedded-devel@lists.openembedded.org
Content-Language: en-US-large
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 May 2025 10:56:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117676

Hi,

we observed problems while access openembedded repos. It seems, path has 
been changed, repos has been renamed or removed.

What we observed:

* https://git.openembedded.org/openembedded-core/ --> Clone now via 
https://git.openembedded.org/openembedded-core/git/0/
* https://git.openembedded.org/bitbake --> Clone now via 
https://git.openembedded.org/bitbake-devel/git/0/
* https://git.openembedded.org/meta-python2 --> Has been removed

Was this changes intended?

Thank you very much in advance and best regards,

Marcel




-- 
Marcel Behlau
(Soft- und Hardwareentwicklung)

ELFIN Technology GmbH
Im Zollhafen 22
50678 Köln

Germany

Tel: +49 (221) 6778932-0
Fax: +49 (221) 6778932-2
marcel.behlau@elfin.de

www.elfin.de

Unternehmenssitz: Im Zollhafen 22, 50678 Köln
Amtsgericht Köln,
HRB 101386 | Geschäftsführer: Jörg Hellmich


