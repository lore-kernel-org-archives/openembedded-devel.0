Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE36DCCD18E
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 21:15:26 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.822.1760476518892898393
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 14:15:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mcdHWKqU;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e6ba26c50so37041975e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 14:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760476517; x=1761081317; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fcnj2laNrlR7kiOIr0jo61NQAgIQ7YqxW9oBXjxT9to=;
        b=mcdHWKqU3voC9w8qt29iM5BgbnoChb3DKBNs+4NK8YX2yTytqPr7tyDlpNxHvkLs4d
         sC/cLrkimzuxJvBD47pu+K1rd3ybHkL8ft0zR1eyZIDGLRSG1MpxhJtmg6mQMauLoBOK
         lPUZm1UD7M1U8ZWd7/7D1tcqxwCEbQUoWWSLLeE3Zk43VP757gTDlk2TnCHc/HCYRFWu
         V6pQmfnczc1Crh63kda+ZgPxC88Eub20VExzKNzjE4cjnLSBeph9RLXIeis435QOHFtE
         4cRGE6icbb8Gq7+VUIMSBRWjEXCviWH87lQxwqXzCyUHrWvWbdinDjflc+j9SdA5QYRe
         ZlHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760476517; x=1761081317;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fcnj2laNrlR7kiOIr0jo61NQAgIQ7YqxW9oBXjxT9to=;
        b=jtzeZgJJnGO16NHSU7sGTjkowwKCm7zZhwrosdSFMsI5+zFJReIJUHoRkjwEgpS0Ep
         BupZh1zqa2rGKnmOEU1Ak4wi8BTYNPHnvvL3qJJhur4i7l//cbv+9SvqY6aIL4hg3byr
         0x2dnDpNOm2YVPJZ9gmNLqrgV6aIFAdvJVYGahwbd1gaOTW7JHF7aaTM3YhTyZMXbUyH
         wcClkpXAAQchgmijuvlYhDu5u3kFX0Crmk9WqRCjTJEuyR4QIciqkCvHZyqwQxI3YP3Y
         Gpa5BSETP3JHzQw/yfJSFGT1p7XKYR1jIQV9n612CkfY6eSB51h1dt5m6aOELJMNkEFX
         qPiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBbU8Qvnd5n8Oagdh1KzRAtrokyXsoffop7dQHwTvP8fzQol7eqYVmXqAT8QFlx9O3cGVe/28ImGbiRQM13/LM7lc=@lists.openembedded.org
X-Gm-Message-State: AOJu0YylECZogS1IqzlujmYsBrvky7vkM8NpgWRsPY/QUR0B3y0W2JLq
	w0npaiPGgtFa/TeTWvT8yWIfYstu1HRKqvxkA6/kzeubiMEem0k85pux/E4pgQ==
X-Gm-Gg: ASbGncspPB6wTE8BI2b3EQH9X3Yd29a6TD0Cc55dRuFMC7xZWPMpLwSq7NMl9R1DziW
	m2M/K4VjZpqShDczfl0p4a6hjRLiF5IExp9nJ4qWBwk0tRaYXiHiXMNle+3ue19m9EDVxPBQHG8
	1vl4CW0LuVPV6QKZ7j6dsIWdBGv4pta9Q0NdObuLG3yeenG2zXlW4DaY46lTnCGwaNuuSm3Plsn
	zlge3tKKFZlswOgzenN9s70KJJiB/w9KDVCziWdlJ4mgYwlNSUvHfYjsGJWdg5npNZYP1WcLaCP
	qTlpjNE6EF1DN6NGUXX40lcF8DMkBb1qDMNETIx5GVL2QGDq8SEO0med9Y3OqaAqPQ7ZwONA3VW
	jSFZimMPqvENjakXhiTRHjTsL74kmGEw87YrQwcirVksDMxZaJCOI0TzjXih8
X-Google-Smtp-Source: AGHT+IHATPidhTSdHocj8QPB6R8o7/zNPJEc1L3S4UcKcNVeXGMZ7kQmiZJNUhAAEO2SAT+2JkPYkQ==
X-Received: by 2002:a05:600d:42f2:b0:46e:4341:7302 with SMTP id 5b1f17b1804b1-46fb15396d6mr130886215e9.34.1760476516993;
        Tue, 14 Oct 2025 14:15:16 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab3cc939sm164562255e9.1.2025.10.14.14.15.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 14:15:16 -0700 (PDT)
Message-ID: <5c327785-0d51-494a-94e5-9f5c97d95e72@gmail.com>
Date: Tue, 14 Oct 2025 23:15:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][scarthgap][PATCH 16/18] influxdb: Do not remove
 non-existing files
To: ankur.tyagi85@gmail.com, openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
References: <20251014205402.1487867-1-ankur.tyagi85@gmail.com>
 <20251014205402.1487867-16-ankur.tyagi85@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251014205402.1487867-16-ankur.tyagi85@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 21:15:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120656


On 10/14/25 22:53, Ankur Tyagi via lists.openembedded.org wrote:
> From: Khem Raj <raj.khem@gmail.com>
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit cd6e2d8f53b45108ae9aa7b2a2988452dff4a2eb)
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
> index 5301071516..9506d0e55d 100644
> --- a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
> +++ b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
> @@ -38,19 +38,20 @@ USERADD_PACKAGES = "${PN}"
>  USERADD_PARAM:${PN} = "--system -d /var/lib/influxdb -m -s /bin/nologin influxdb"
>  
>  do_install:prepend() {
> -    rm ${B}/src/${GO_IMPORT}/build.py
> -    rm ${B}/src/${GO_IMPORT}/build.sh
> -    rm ${B}/src/${GO_IMPORT}/Dockerfile*
> +    test -e ${B}/src/${GO_IMPORT}/build.py && rm ${B}/src/${GO_IMPORT}/build.py 
> +    test -e ${B}/src/${GO_IMPORT}/build.sh && rm ${B}/src/${GO_IMPORT}/build.sh
> +    rm -rf ${B}/src/${GO_IMPORT}/Dockerfile*
> +
>      sed -i -e "s#usr/bin/sh#bin/sh#g" ${B}/src/${GO_IMPORT}/scripts/ci/run_perftest.sh
>  }
>  
>  do_install:append() {
>      install -d ${D}${sysconfdir}/influxdb
> -    install -m 0644 ${WORKDIR}/influxdb.conf ${D}${sysconfdir}/influxdb
> +    install -m 0644 ${UNPACKDIR}/influxdb.conf ${D}${sysconfdir}/influxdb

Careful: ${UNPACKDIR} wasn't a thing in Scarthgap

>      chown -R root:influxdb ${D}${sysconfdir}/influxdb
>  
>      install -d ${D}${sysconfdir}/init.d
> -    install -m 0755 ${WORKDIR}/influxdb ${D}${sysconfdir}/init.d/influxdb
> +    install -m 0755 ${UNPACKDIR}/influxdb ${D}${sysconfdir}/init.d/influxdb
>  
>      if [ "${@bb.utils.filter('DISTRO_FEATURES', 'sysvinit', d)}" ] ; then
>          install -d ${D}${sysconfdir}/logrotate.d
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120649): https://lists.openembedded.org/g/openembedded-devel/message/120649
> Mute This Topic: https://lists.openembedded.org/mt/115760530/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


