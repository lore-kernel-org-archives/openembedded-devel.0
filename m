Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52DEEC6FD1C
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 11:14:53 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.39990.1679483689318084375
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 04:14:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ks61nO8/;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id s12so22029934qtq.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Mar 2023 04:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679483688;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zESVxHO4u41tQvxQbzGYq+tLcfm9ZFt/eVMu49jY2IU=;
        b=ks61nO8/QPN+RyZyuNQvJy1ss5JNIgc+LBlJoA6brGRuGrPNbofEzQ6GMjjyNWyf7Y
         fsH9s5eQpxUyKRSHd3RQR+5qgra8Z+tgIojrMhnvaTzZn05GlEV90lTt7fSTs4e/i4AQ
         Y/XebAeTu2F7/MbMYZInEtDPGRF/CdbB7Ct98AV9VEBO6BYph5JDvv+Vl4inH0MkdP6r
         aULc2Ykdh7O7zljK6q4CY+xB6huSUJiBwqLgu0STKfgpSbU+jZzDwtKSy4rtayRsB3Aw
         kIeW7pucyoQLlxGoLeNtGBFvU7zoL6c8nKPt6SY+DgtclQ6cP9uLFesfO9+sNBgM4ITd
         I/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679483688;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zESVxHO4u41tQvxQbzGYq+tLcfm9ZFt/eVMu49jY2IU=;
        b=R8PUbUEtZisyXdXQfYZry/xRb5wGxJ4Hxn297DencyXHkaRqd3JPkQX4a1SXD+b/sH
         KxulzaafiYJx4gsUIAtE5SXEW17SFcvuz2o/0o3qmx9psvscFvv9ou54TH91yaFKQIZ4
         ZZu5YARSfjjy+Z0COJiUxcIp91O6ZUYCf1N3G+o9fe6Wt2UyNX0xngKG2WWs6Gm95dzj
         Pv+fnQHZwFAM6Ngb6pZrYdP3+iWuMW1o8FYDqzhD0NrO0OcJNQcmThsIv+LlmsSSeEOe
         YkvxO9ONzg5TFrEx48b6ylyw7fzAh5HB6Fe6yhbXMpUj4RK5qo46xAQ+nFVb/mIYql7k
         tO0w==
X-Gm-Message-State: AO0yUKXcFTH5agg0cCGfYORW5ZF3LWYrkEQJz8lom7Q3E+1sAb+QdMa/
	ZH1Sx0XUo2+LyWirTzn9HtE=
X-Google-Smtp-Source: AK7set9n9ioNjFVvXpPwvp69K464+yNNVsTLCMlVYlVWEzNFC29e6XMebqxxIc05lEk3UEJfqcTylw==
X-Received: by 2002:ac8:5906:0:b0:3d9:cb72:3655 with SMTP id 6-20020ac85906000000b003d9cb723655mr5628958qty.42.1679483688332;
        Wed, 22 Mar 2023 04:14:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:3ea:5110:ed2a:eb0c? ([2600:1700:9190:ba10:3ea:5110:ed2a:eb0c])
        by smtp.gmail.com with ESMTPSA id y5-20020ac87085000000b003e014845d9esm6177214qto.74.2023.03.22.04.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 04:14:48 -0700 (PDT)
Message-ID: <2a450f6e-42df-91ad-b69a-314473817ee0@gmail.com>
Date: Wed, 22 Mar 2023 07:14:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: langdale merge request: March 22nd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Mar 2023 11:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101633

The following changes since commit 613dc6e1076efcb8c0aadf7728433e5841e6a6aa:

   nodejs: Upgrade 16.19.0 -> 16.19.1 (2023-03-12 11:51:57 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded langdale-next

for you to fetch changes up to 3f9340a9241d497753b330d90d6a3d8332c1ba7f:

   mbedtls: upgrade to 2.28.2 to fix CVE-2022-46392, CVE-2022-46393 
(2023-03-21 14:37:51 -0400)

----------------------------------------------------------------
Peter Marko (1):
       ntp: whitelist CVE-2019-11331

Stefan Ghinea (1):
       mbedtls: upgrade to 2.28.2 to fix CVE-2022-46392, CVE-2022-46393

Wang Mingyu (1):
       apache2: upgrade 2.4.55 -> 2.4.56

Yi Zhao (1):
       apache2: use /run instead of /var/run for systemd volatile config

  meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.1.bb => 
mbedtls_2.28.2.bb} | 2 +-
  meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb | 2 ++
  meta-webserver/recipes-httpd/apache2/{apache2_2.4.55.bb => 
apache2_2.4.56.bb}         | 2 +-
  meta-webserver/recipes-httpd/apache2/files/apache2-volatile.conf | 2 +-
  4 files changed, 5 insertions(+), 3 deletions(-)
  rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.1.bb 
=> mbedtls_2.28.2.bb} (97%)
  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.55.bb => 
apache2_2.4.56.bb} (99%)


