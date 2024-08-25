Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D86DC5320E
	for <webhook@archiver.kernel.org>; Sun, 25 Aug 2024 19:24:45 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web10.38004.1724613883074039281
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Aug 2024 12:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=et5sJ4Vi;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e0875f1e9edso3452667276.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Aug 2024 12:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724613882; x=1725218682; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iQesB+F2Op9wjawrjGj48A6mxy4oWffpMy45z8d8UlM=;
        b=et5sJ4VijQCTIRezMU9b5YgtZ0zPxfEuqjsuDShwPXAuqJpF8GKIQNzvx6z/PfGdsA
         A60letcaUZ8UFkMJdKGbmgmD212Bv0uK5YHXnqFN0w6dbl6JfA3mm5vVtGPCY0QR7bKD
         tgiJ20hnTp4/4hoB1vDL8rVQfeAcd03Hm3jHEwzRl0dMvC63cDZpxhu8/RebF8uzbrWf
         CMsW4m8QhkmimIadRwpFTwQLMQe5MtiDn9Hu3q4VxkKvGPxnFtswHrgasPXpzKeD61wV
         kLgKsQmMHl0KSdovH7A3j7bQYVDOT0a5jGUxCCJYioMzaAX1ctL0YDn44LFvMPP3zTbR
         6xQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724613882; x=1725218682;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iQesB+F2Op9wjawrjGj48A6mxy4oWffpMy45z8d8UlM=;
        b=EYHc92C24LU38szLW3EjXf+PPhdCsN5QjPuhyF7NeN9R52KdQtUIBUAlPHuaqVZJnJ
         U/wZCC6uuxoEKp+2fUNTbiiuA4ruDUaTcQakqMVvjnPQcaZ3yhMWr4L4J4WVkmkXYdNP
         5VF+NqEPIFDDPmYxOPiRYAolp9K7TXnjyDmFMHhV6IHX/QA8cFeBCC33Y9Z8Aa1JYlpU
         8c2qfK9VQncCoVMDxTW/VDxyykfkHbCqFGs+srkpymBXZLfxAVAQTwxFuvP0hPoMnZ48
         MIgwqlBYNS4yp15dGcRxBlmHHBz04oyMfwdcwIQ9OjdL4pNU3Ot5AI0DuZk1OJ/wDPXl
         nixA==
X-Forwarded-Encrypted: i=1; AJvYcCXWLKXLhZBlUKVWk1nCyk1T7i41RjKIWM1ifkJMK+jg8qDPSzkdf7EpQ0VtRR3iHhU9jWKya6XJvBONs65Uv5U186c=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxBegpPRO3xWevVQpHeBRxdqPNjI/JhWoAM3nz8pLLzuh4e+6Yy
	Z9LJbfEM6SVouZDYjPOjhOXlmsozMSeMQTiaw8jaJWHgfWCFetQZgBjlIw==
X-Google-Smtp-Source: AGHT+IH8poO9ksr65aDpqPwE/Lel5puheNbDniMc8tgpMQVAdMgmqCNEyr4lVfz1140zfFTc8/ik6g==
X-Received: by 2002:a05:6902:188a:b0:e13:e58b:1a32 with SMTP id 3f1490d57ef6-e17a83bfc45mr11173494276.2.1724613882079;
        Sun, 25 Aug 2024 12:24:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:b8b:c77f:717d:1c6? ([2600:1700:45dd:7000:b8b:c77f:717d:1c6])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e178e4636besm1698290276.16.2024.08.25.12.24.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Aug 2024 12:24:41 -0700 (PDT)
Message-ID: <b66d3acf-773b-4a8d-9f75-356cd1e3dded@gmail.com>
Date: Sun, 25 Aug 2024 15:24:41 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] mariadb: File conflicts for
 multilib
To: guocai.he.cn@windriver.com, openembedded-devel@lists.openembedded.org
References: <20240822015200.2788239-1-guocai.he.cn@windriver.com>
Content-Language: en-US
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
In-Reply-To: <20240822015200.2788239-1-guocai.he.cn@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Aug 2024 19:24:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111938



On 8/21/24 9:52 PM, guocai he via lists.openembedded.org wrote:
> From: Guocai He <guocai.he.cn@windriver.com>
>
> File conflicts between attempted installs of mariadb and lib32-mariadb

do these changes need to go into Master first?

- armin
>
> Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
> ---
>   meta-oe/recipes-dbs/mysql/mariadb.inc | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
> index 51dd4e8d4..32a6022ba 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -33,10 +33,12 @@ UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/tags"
>   
>   BINCONFIG_GLOB = "mysql_config"
>   
> -inherit cmake gettext binconfig update-rc.d systemd multilib_script pkgconfig
> +inherit cmake gettext binconfig update-rc.d systemd multilib_script multilib_header pkgconfig
>   
>   MULTILIB_SCRIPTS = "${PN}-server:${bindir}/mariadbd-safe \
> -                    ${PN}-setupdb:${bindir}/mariadb-install-db"
> +                    ${PN}-setupdb:${bindir}/mariadb-install-db \
> +                    libmysqlclient-dev:${bindir}/mysql_config \
> +                    "
>   
>   INITSCRIPT_PACKAGES = "${PN}-server ${PN}-setupdb"
>   INITSCRIPT_NAME:${PN}-server = "mysqld"
> @@ -160,6 +162,7 @@ mariadb_sysroot_preprocess () {
>   
>   do_install() {
>       oe_runmake 'DESTDIR=${D}' install
> +    oe_multilib_header mysql/mariadb_version.h mysql/server/my_config.h mysql/server/private/config.h
>   
>       install -d ${D}/${sysconfdir}/init.d
>       install -m 0644 ${UNPACKDIR}/my.cnf ${D}/${sysconfdir}/
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111898): https://lists.openembedded.org/g/openembedded-devel/message/111898
> Mute This Topic: https://lists.openembedded.org/mt/108031502/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


