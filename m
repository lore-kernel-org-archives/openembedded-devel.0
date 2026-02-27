Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBDA7FD5322
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 09:42:09 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92002.1772185328298117013
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 01:42:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ij1hqcDi;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43767807cf3so1231354f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 01:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772185327; x=1772790127; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ngNIwXQuE6wgOuJ+oMnCFx2B8HPJs/ZDVOM84Hb0ff8=;
        b=ij1hqcDip5BpFWhd3Dxw4Gnb00cJ8de1e5pSL2PO27rnc9W61okXdf1qQHfVcqonzR
         3+q4zGcCYPAFvHOCHxJh7LtypS/R6l1wNHAmE806D1dnQI8Tj/5QpK42hQwSAnRe3vVp
         jPvBemst0JONtRoGOoQIMmIvvhTjHcQnm5rDb+/7uQ1O4qn9oJJA+uFookLtVy2dt3Xf
         EwGhhPfhW6N/iDGVsmf1savMetRecmZZZBjSZ++4+iy+i9pFR6OtdCT1Mlx647Tvs8jT
         qNHjHw0YxifVjsrAZ8HwxEsE29ApuPrTDPmGLapVmiUtfqo/LvMb54oxGwG/Fx2zmwUd
         B1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772185327; x=1772790127;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ngNIwXQuE6wgOuJ+oMnCFx2B8HPJs/ZDVOM84Hb0ff8=;
        b=Hn2f8ml8McwDWZFAOKJecztqA+lYUuN4wp0IXeDxQ9xv+ilVVymJtUbu30h+csnMOj
         cvHvapEiXkTY67BlWuwSDlHFPW94TnWk2a5jF5KJFsEnw1nqpjiE3cGZdbPy6BQHcOb1
         L04FOj9nw93Auh4tQHGPH1GAa/qzw1SxX3xXUhMntP6VF1MnbVhBDz2s4NjtYwsQkbBQ
         zXkjlLXKqRrx/zIHI0o4bOsksGnIsBqHpzFGz+4BQTpz8Upv7HnxVCWQnzA1FOh+Xm1t
         x52U/amuVr7YXnRB2nKiYLaaLxUVHxdQ/lly6+lVB27rC/EtMsW3a3XPZkIYYd6ktf/Q
         rkpw==
X-Forwarded-Encrypted: i=1; AJvYcCWMD+euNqucI1OosnQyYwpS1V29bxowNywPzGk+KmCu3cmpXuOz6jbaYrWQ6ivQulOdIUs23b+cA9aDaAMUp1lx1n8=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxhgCahhRWqMttMww8jedeXB09tcbV896HVI8gmHB/dS419ffJU
	bZow9p11kAh5JDWnmB5GFsCBm67raWYK2XYLvEQ5ZQuy/qmS5TuKbalI
X-Gm-Gg: ATEYQzyGI11Js7GrvJbiZB0xqt+ORhb5WcbFWPzJwoiozk8m976qe1K/ixEpjzfHStW
	Up+oZXbUebYmfFL/ElJucb6so+/zIiU5qSbPB29chG4LTjVHoNQ2n7PVnrNngFIceQKR7dmFdgb
	97WwTA4xYRtzGaavOL0/usHQh9EwugkkNoxCWljlRsRZtRy9McAZSaAbSVlszdTndfmdbSoDptJ
	B2vY+YaLvVfuSaZ4FvX2zV+uM21sVoOv5sXBaYRFtoaHOwS8JYIjA98mtLMSmPdnagnqGU01ChC
	9QoY1ykgx4HNLk+xk3TX6g+W4LLna+DlQwnGaO2HgvNIRsPgCmeFbAFXS9j54sTwGZdwVfNA+vZ
	Dsn78G5IZ4WA+WOOotmA/SbECCNOsbsOCLBtYlS3WcCDB4yxPY8T8xAA4F4jsv+2F7ZiBj37NIo
	lt+OTBjE3Kqdnt4ixpxUGUfTokGMqfBuo=
X-Received: by 2002:a05:6000:178a:b0:435:9e81:105a with SMTP id ffacd0b85a97d-4399ddf7b7fmr2916511f8f.20.1772185326329;
        Fri, 27 Feb 2026 01:42:06 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c70f8casm9976767f8f.14.2026.02.27.01.42.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 01:42:05 -0800 (PST)
Message-ID: <d7a38b94-3863-45e5-951d-47eaa33a18d3@gmail.com>
Date: Fri, 27 Feb 2026 10:42:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-filesystems][PATCH] btrfsmaintenance: upgrade 0.5 ->
 0.5.2
To: liuyd.fnst@fujitsu.com, openembedded-devel@lists.openembedded.org
References: <20260227092309.1381-1-liuyd.fnst@fujitsu.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260227092309.1381-1-liuyd.fnst@fujitsu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 09:42:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124698



On 2/27/26 10:23, Yiding Liu (Fujitsu) via lists.openembedded.org wrote:
> 1. Changelog:
>     fix syntax error in run_task, preventing jobs to start
>     start scrub jobs sequentially if RAID5 or RAID6 data profile is found
>     fix btrfsmaintenance-refresh.service description
>
> 2. Update 0001-change-sysconfig-path-to-etc-default.patch for 0.5.2
>
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  ...nance_0.5.bb => btrfsmaintenance_0.5.2.bb} |  4 +-
>  ...change-sysconfig-path-to-etc-default.patch | 39 ++++++++++---------
>  2 files changed, 23 insertions(+), 20 deletions(-)
>  rename meta-filesystems/recipes-utils/btrfsmaintenance/{btrfsmaintenance_0.5.bb => btrfsmaintenance_0.5.2.bb} (96%)
>
> diff --git a/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb b/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.2.bb
> similarity index 96%
> rename from meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb
> rename to meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.2.bb
> index 645e38ca49..6722b63c10 100644
> --- a/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb
> +++ b/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.2.bb
> @@ -9,11 +9,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a"
>  
>  SECTION = "base"
>  
> -SRC_URI = "git://github.com/kdave/${BPN};branch=master;protocol=https \
> +SRC_URI = "git://github.com/kdave/${BPN};branch=master;protocol=https;tag=v${PV} \
>      file://0001-change-sysconfig-path-to-etc-default.patch \
>      file://0002-add-WantedBy-directive-to-btrfsmaintenance-refresh.s.patch \
>  "
> -SRCREV = "be42cb6267055d125994abd6927cf3a26deab74c"
> +SRCREV = "beb9e2d166cbd856297fe8d28e89e8b36961a723"
>  
>  UPSTREAM_CHECK_URI = "https://github.com/kdave/${BPN}/tags"
>  UPSTREAM_CHECK_REGEX = "${BPN}/releases/tag/v(?P<pver>\d+(?:\.\d+)*)"
> diff --git a/meta-filesystems/recipes-utils/btrfsmaintenance/files/0001-change-sysconfig-path-to-etc-default.patch b/meta-filesystems/recipes-utils/btrfsmaintenance/files/0001-change-sysconfig-path-to-etc-default.patch
> index d425206f0e..eeb64b29b0 100644
> --- a/meta-filesystems/recipes-utils/btrfsmaintenance/files/0001-change-sysconfig-path-to-etc-default.patch
> +++ b/meta-filesystems/recipes-utils/btrfsmaintenance/files/0001-change-sysconfig-path-to-etc-default.patch
> @@ -1,7 +1,7 @@
> -From b49dbe17e0d9ae463e5a34e6991aa2d3c70d2fb1 Mon Sep 17 00:00:00 2001
> -From: Claudius Heine <ch@denx.de>
> -Date: Wed, 11 May 2022 14:33:13 +0200
> -Subject: [PATCH] change sysconfig path to /etc/default
> +From 5354785858fb990e1ba863c41786be5534ef869f Mon Sep 17 00:00:00 2001
> +From: Wang Mingyu <wangmy@fujitsu.com>
> +Date: Thu, 26 Feb 2026 10:15:33 +0000
> +Subject: [PATCH] [PATCH] change sysconfig path to /etc/default
>  
>  OE uses /etc/default for service configuration, not /etc/sysconfig which
>  is used by SUSE and RedHat based distributions.
> @@ -11,37 +11,40 @@ Change the files accordingly
>  Upstream-Status: Inappropriate [OE specific]
>  
>  Signed-off-by: Claudius Heine <ch@denx.de>
> +
> +Update for 0.5.2
> +Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
>  ---
> - btrfsmaintenance-refresh.path    | 4 ++--
> - btrfsmaintenance-refresh.service | 2 +-
> - 2 files changed, 3 insertions(+), 3 deletions(-)
> + btrfsmaintenance-refresh.path    | 2 ++
> + btrfsmaintenance-refresh.service | 1 +
> + 2 files changed, 3 insertions(+)
>  
>  diff --git a/btrfsmaintenance-refresh.path b/btrfsmaintenance-refresh.path
> -index d56ad11..f0b4132 100644
> +index d56ad11..8e4fa18 100644
>  --- a/btrfsmaintenance-refresh.path
>  +++ b/btrfsmaintenance-refresh.path
> -@@ -1,8 +1,8 @@
> +@@ -1,8 +1,10 @@
>   [Unit]
> --Description=Watch /etc/sysconfig/btrfsmaintenance
> + Description=Watch /etc/sysconfig/btrfsmaintenance
>  +Description=Watch /etc/default/btrfsmaintenance
>   
>   [Path]
> --PathChanged=/etc/sysconfig/btrfsmaintenance
> + PathChanged=/etc/sysconfig/btrfsmaintenance
>  +PathChanged=/etc/default/btrfsmaintenance
>   
>   [Install]
>   WantedBy=multi-user.target
>  diff --git a/btrfsmaintenance-refresh.service b/btrfsmaintenance-refresh.service
> -index 4ed1eb4..d6225a6 100644
> +index 19e51c0..e3984d7 100644
>  --- a/btrfsmaintenance-refresh.service
>  +++ b/btrfsmaintenance-refresh.service
> -@@ -1,5 +1,5 @@
> +@@ -1,5 +1,6 @@
>   [Unit]
> --Description=Update cron periods from /etc/sysconfig/btrfsmaintenance
> -+Description=Update cron periods from /etc/default/btrfsmaintenance
> + Description=Configure systemd timer schedule according to /etc/sysconfig/btrfsmaintenance
> ++Description=Configure systemd timer schedule according to /etc/default/btrfsmaintenance
> + Documentation="file:/usr/share/doc/btrfsmaintenance/README.man"
> + Documentation="file:/usr/share/doc/packages/btrfsmaintenance/README.man"
>   
> - [Service]
> - ExecStart=/usr/share/btrfsmaintenance/btrfsmaintenance-refresh-cron.sh systemd-timer
>  -- 
> -2.33.3
> +2.43.0
>  
>

Just for confirmation, does this patch change intended the way they
looks now?
Previously these patches changed existing lines. Now the original lines
stay in place, and the new lines added as extra - so for example the
"Description" is duplicated with the new version.


