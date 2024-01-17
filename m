Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B75C47258
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 09:40:49 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.5820.1705484445650661886
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jan 2024 01:40:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dA/AEr6D;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a28cc85e6b5so1283111366b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 01:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705484443; x=1706089243; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A5bI2crG4aKD9ff13rufw1tsPXffGcxUBC4rHG/pMu4=;
        b=dA/AEr6DbWUVjwtMlpYRrkt0dxy0hWygphCZ5dlYFrNQjf8hD3Gl6wIk0Yz3yj2ygQ
         KhhFAKXSX5FXHPzLEfS9pfjB/Za21UBk8bMBFlTJY4JspDBKJNeeseirDuPUu3v4e6U/
         whhKrsA+hP89zQmJj+RVDfXbF/1C26hnwQyDMM54O01Sc75XFR5YQMwSCupbSqrUV1nT
         UV+vGjcSxCI/LDB6HFA3SrQb3VFycV4mC2ovy5j9pOXztKwDveBswMKBzHKdSnZ7oJga
         oK6ywJKnDpFu4GlKnsWOIGdMj27oibLf6Q0dbebK0puShWg6gK9MQC9tyuX8XUga1UEv
         liaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705484443; x=1706089243;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A5bI2crG4aKD9ff13rufw1tsPXffGcxUBC4rHG/pMu4=;
        b=RBrNELc2D+gPjUAQF8KaRuO7JbbPkrO5NNCOeW3TfrGuuUEpPioFqKCDsJD3YzTomM
         dRsrjoyeHTakvh/6JLU4PbXPqCy5P2F04SMmG32sBT36/rKpHDY4tidz633Qxu60bgyt
         JZFzXF228j3mZ6vRTyCPSw9B2SWiBjJ3YJ3nNIihUBgbVyu8hMTwlVeyNDaSSDM1RON/
         89v4rJBE4cw5n/Fk3FSkGUjUwKAweLymszXvaVRIsJki5vp0FB03MGQaAbxSNIS4ieId
         25XUOGlVj3NLNz2rFHdZMLEXSyfGQa+YydpoR7oz4spTga4nvWOjrZNiO0GnXFv9Ei1v
         4YnA==
X-Gm-Message-State: AOJu0YwQKYSAomsb83PJ9dT3WjL8t3F5oVZ6fvMUIXxx5k9IGhxsUeAH
	94vGalblm6o9Rhwk+QBh8pWGfvT2Q2g=
X-Google-Smtp-Source: AGHT+IE6gCVeka/bW6Wb7UubWTkntsALrXFCg+/Zs0dhj1Y+Auiy/5fBdEmt7wyrqwVEcFqKqA2aBA==
X-Received: by 2002:a17:907:60d6:b0:a29:3089:16c3 with SMTP id hv22-20020a17090760d600b00a29308916c3mr3179962ejc.8.1705484442834;
        Wed, 17 Jan 2024 01:40:42 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id cw8-20020a170907160800b00a2cd72af9cesm6349779ejd.146.2024.01.17.01.40.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jan 2024 01:40:42 -0800 (PST)
Message-ID: <415ef717-ab15-4bcf-a8d2-2e8d8fb37a25@gmail.com>
Date: Wed, 17 Jan 2024 10:40:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: openembedded-devel@lists.openembedded.org
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Subject: [ANNOUNCEMENT] New layer for parallel installable PHP versions and
 misc modules
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 09:40:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108326

Hi,

Yocto was sticking to a single PHP series for the lifetime of
one release, which may or may not be applicable to a
specific application.

Because of this, I have been maintaining multiple PHP versions
for a long time to satisfy such applications that we developed
in-house.

These recipes are prefixed with phpNN where NN is the PHP
major version without the dot.

These recipes are now public at https://github.com/zboszor/meta-parallel-php

These PHP builds are much closer to Red Hat / Fedora than the recipes
in Yocto, as in PHP modules are mostly built as shared modules.

Yocto versions 3.4 Honister and newer are supported.

PHP 7.0, 7.1, 7.2, 7.3 are only supported in the honister branch.
These old versions cannot be built in kirkstone or later,
mostly due to the "icu" changes in Yocto.

PHP 7.4, 8.0, 8.1, 8.2 and 8.3 are supported in all branches.

External module recipes are also available, in some cases :
phpNN-pecl-crack
phpNN-pecl-inotify
phpNN-pecl-mcrypt (for PHP 7.2 and up)
phpNN-nano
phpNN-pecl-ncurses
phpNN-pecl-pam
phpNN-posix-realtime
phpNN-screw
phpNN-pecl-sodium (for PHP 7.0 and 7.1 only, this module is in PHP 7.2+)
phpNN-pecl-ssh2
phpNN-pecl-timezonedb
phpNN-pecl-xdebug

These recipes use the parallel-php-module.bbclass to execute
phpizeNN ; ./configure ; make for the build.

To make one specific PHP series the default, i.e. to provide the
php, pear, etc. names, the phpNN-symlinks package can be installed.
These symlinks are using the alternatives symlinks with the NN number
used as priority.

php.ini and php-fpm configuration files are not included, similarly to
the Yocto php recipe.

Versioned recipes for composer are also available in both
native and target builds. Only one of the target builds may be
installed at a time, though.

Another class called parallel-php-native.bbclass is also
available that allows using phpNN-native and the
corresponding composer-phpNN-native during the build
of PHP apps that use "composer install".

Practically, it's a very small subset of what https://rpms.remirepo.net/
is doing.

Comments, issues and PRs on my github repo is welcome.

Best regards,
Zoltán Böszörményi


