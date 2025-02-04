Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B9CAC02196
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 04:36:05 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.108586.1738643758597666889
 for <Openembedded-devel@lists.openembedded.org>;
 Mon, 03 Feb 2025 20:35:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WH1r5APm;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-2b5acf00c5bso93209fac.0
        for <Openembedded-devel@lists.openembedded.org>; Mon, 03 Feb 2025 20:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738643758; x=1739248558; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lwNcYIiZD5INao3eglO/zj5JUxIZoTGPSniCMqdrZTA=;
        b=WH1r5APmUE8tBnBWIZqkBGo7auE/Z+er1yFWFBPYHwQlKVFk/ovXghpTyHq5/ppQQx
         cBJ8p7GlNJVPI5h9RWDz5AooiFv3idmqpHAgkFh1fuLOU5YkEO/6Yt94RIGIWCqTG6WE
         wFjxBYqoLFqICyjcCMNWcZ9HKn3iU/TuJGnbUnxqLZf9W5211AP7+h/vsOV1dt9z0Gk4
         w/nBoF94QNdS4it14P6tbjmk+5KVYTFrLQkO1Yk852BNXPgRMV9GYHwji85bH7Jj1bbj
         2Y4eqJ6QYqSZgDV8B1a6ZNclYYE71CBF0bf/hFvoAx7/CgVV9I54oF53XhmQECrQPTV+
         PpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738643758; x=1739248558;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lwNcYIiZD5INao3eglO/zj5JUxIZoTGPSniCMqdrZTA=;
        b=KbdX93hk9JajHcsbX8vzxrQI9U/KAoTNPg3EI3x57bTa+8E3BV+2tZtylb62muIYwq
         512RRA1WH0feQAkie6FRNflnv80HLaovkz817GaXwTaMj7btPDObsy/HZG3s3EgNjyuh
         JqWbgFgTNX6fcbKcGfoYrfxNOAQ5N+QW72IxYT/qe52eYbwRff+QoJR8s2m8x5KPEYj5
         gmPSCs5tXD/LWWX0Vx766i+JU5qvn+mhH/kHJitDiSEwinBUKCZto7gf/UDbErORgied
         M1roAHpbliGAjEXzWYvttUjO32ZbckM0+Ghfs3lIjo9WIF2y+gFd94ZipZTM7LD/mQqJ
         x7aw==
X-Forwarded-Encrypted: i=1; AJvYcCVzPNBiRvN9FIuazF4awM1HFsIdzOn1FM+/JxuBiFsFR3zdN5Mluew7aC8xTtLpqY6tynvmjntpvWkxeFUVmVfD0SI=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx9IBOjxrAVFYsr1h2AuPgKx0eG1PjX0vAH8gSGwGPn0EzMbCVG
	RA6oIqsOdsJC+rFc5cdGqmIJ9cit4NNZ3OhcR3WghhNm0R+4TtlqBeLhku3qNegA/9+51ADtk21
	sjrt3A46anL+4jDTbirpJUE9qkSs=
X-Gm-Gg: ASbGnct/c9yAwjIrGVQ3ThdAm84sQJLFMbrvVS3sp4oIvm7f2n7RF4Khqoy5nZnDWyi
	oZBpV8/RvI7zT69IDX+qmYCEJ9IQ1kz/sQcKH1MyxGkJxeq2m+Sq7mlqmuMko1ubNgJMWmE4v
X-Google-Smtp-Source: AGHT+IGXTpHJBUBZmOAC8Vtez/RCGq1e87UPKNqFlAGG/LD9tUusH1Cq3zG18gqZIELHZfXtGX0mre7XuVupLEaFYKo=
X-Received: by 2002:a05:6871:64cc:b0:29e:5dfd:1e17 with SMTP id
 586e51a60fabf-2b32f089891mr13586209fac.23.1738643757808; Mon, 03 Feb 2025
 20:35:57 -0800 (PST)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Feb 2025 20:35:32 -0800
X-Gm-Features: AWEUYZmJRFP9bXCdBmfgpG_3lZp5t-Xzwk-rxzcAfHFrGdBh9dpVMrR6iATxTcY
Message-ID: <CAMKF1soU+KeFrAxhanq=ysnHkg5v8ZBCGY8i6AenE52dD8jeaw@mail.gmail.com>
Subject: python3-gpiod ptest failures
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Feb 2025 04:36:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115264

Hi Bartosz

I have been observing ptest failing on qemux86-64 lately. Here is log output

https://0x0.st/8K2Y.out

enable ptest in distro features and then for MACHINE=qemux86-64
bitbake meta-python-image-ptest-python3-gpiod

will show the problem.

Do you have some insights into this?

Thanks
-Khem

