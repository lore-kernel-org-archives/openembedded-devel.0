Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0480C3DA61
	for <webhook@archiver.kernel.org>; Sun, 21 Jul 2024 18:43:39 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.2189.1721587416923644163
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Jul 2024 11:43:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U4EToXEZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-663dd13c0bbso34870317b3.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 21 Jul 2024 11:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721587416; x=1722192216; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zrp2PYCMz70jdix1/fV8U02bIPL8vJczsYRU4nKLvgg=;
        b=U4EToXEZ0Fpoy9ax+868RTLQHv5HEIFx//Ui7PWsN+H3+tGE8vkDbKFCHOeWlMjyzr
         cjKxT1qKPGmY2sSW9En/VzTOWxCWIxRn6WFBvCaKBmNwaE5JVg7ejBlFWex/Kvy74sqa
         Ur7mAclUoEtx9cQ7QId2F10KXxBc/l4mnK+2QM/lRpukuOfidSoX3lLeC/5H6oRBuWXK
         oggBkuOXzL0f2yp+ewSdOvq0p6gkwYmS1LBB0Qnxnn0n2TNNmkqhsOLgdmhLw/PgTt6J
         6b+ojE/Ic+VkxYhKvWHDbgyA6FBmdI/Bs7GJx93Mv/vsRKxvg1jQ4INal4IUmo1MmH0/
         ISBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721587416; x=1722192216;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zrp2PYCMz70jdix1/fV8U02bIPL8vJczsYRU4nKLvgg=;
        b=RVGflZm0NI2m3yKGdGlQ7C95w8jO6bRmBpoLTiEXMH7jbzy+rdvevxD6wK3MggIE+V
         jyd0goUcK0Cwgkol2e8gkCvMjT8YFUK7A3/lMAj/kORDTHmlshSoLXwTu5SWZIzSzR9R
         Fye5khySar+mL5WpFr7j4wHFX3dboTAC+YXKyVCCRFQCYqbbaeFrjcd4JRmbGIhYUm9s
         Ao0V9p0iA/AUXCEqk+IILjAtrVJdQfcnn1+S3iPbtIlz1wpdydI7wIWFVTcDlDDBYLuv
         W8hS8nDsqpUzyMnLKCpxQVb2acNlFBtYmccjG0xTEqACi3yxWq/75I3oXo9uixTddgRL
         nBxw==
X-Forwarded-Encrypted: i=1; AJvYcCU0yzWrTQieXnWqwn1NSK14sSKGEiMA5n7QJXn60WtrdOt+ZflncqfIJ6/0UpEd0aQpRCZAJxsWIFWHO9MQxE+nzK5UZyKSwwbwkRk2wskovMTQTcUKL2HysA==
X-Gm-Message-State: AOJu0YzDr6bTWZQviUuDwhUFPr8DQcWdRcPRLs+e5dbcUjw3Awk/A1AQ
	TdoncTjkGraNzHsH7LRXaZWL4+BqM76MUqcyx0GsuuVHveKZSzMH
X-Google-Smtp-Source: AGHT+IHOpjNiKkZKElhMggjp5PcFqXtwYtigOdx8NxAxB0RVYWpNzzWxQdt4q//UjUL4A1rUXpvJ4g==
X-Received: by 2002:a05:690c:23c9:b0:619:da17:87be with SMTP id 00721157ae682-66a6a812d36mr46519917b3.42.1721587416007;
        Sun, 21 Jul 2024 11:43:36 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000::29? ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-66a8b03622esm7324607b3.104.2024.07.21.11.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jul 2024 11:43:35 -0700 (PDT)
Message-ID: <f022bce3-ae11-41d6-9f74-954192be0a98@gmail.com>
Date: Sun, 21 Jul 2024 14:43:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: July 21st
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 21 Jul 2024 18:43:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111422

The following changes since commit 6ff0748a4741517519a281985fc3cd95dadb633e:

   php: Upgrade to 8.1.29 (2024-06-27 11:32:38 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to 4052c97dc83d0c88fc277d6fc1815e0699020daa:

   xfce4-panel-profiles:fix tar error (2024-07-17 20:10:27 -0400)

----------------------------------------------------------------
Jasper Orschulko (1):
       nginx-1.20.1: Drop reference to removed patch

Kai Kang (1):
       xfce4-panel-profiles:fix tar error

Martin Jansa (1):
       giflib: fix build with gold and avoid imagemagick-native dependency

Siddharth Doshi (1):
       apache2: Upgrade 2.4.59 -> 2.4.60

Vijay Anusuri (1):
       krb5: Fix for CVE-2024-37370 and CVE-2024-37371

  .../krb5/krb5/CVE-2024-37370_37371-pre1.patch                   | 168 
+++++++++
  .../recipes-connectivity/krb5/krb5/CVE-2024-37370_37371.patch   | 538 
++++++++++++++++++++++++++++
  meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb                | 2 +
  .../files/add_suffix_to_convert_binary_used_in_Makefile.patch   | 42 ---
  .../giflib/0001-Makefile-fix-typo-in-soname-argument.patch      | 34 ++
  meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb                 | 8 +-
  .../apache2/{apache2_2.4.59.bb => apache2_2.4.60.bb} |   2 +-
  meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb              | 1 -
  .../0001-Makefile.in.in-Pass-arguments-to-tar.patch             | 30 ++
  .../xfce4-panel-profiles/xfce4-panel-profiles_1.0.13.bb         | 1 +
  10 files changed, 779 insertions(+), 47 deletions(-)
  create mode 100644 
meta-oe/recipes-connectivity/krb5/krb5/CVE-2024-37370_37371-pre1.patch
  create mode 100644 
meta-oe/recipes-connectivity/krb5/krb5/CVE-2024-37370_37371.patch
  delete mode 100644 
meta-oe/recipes-devtools/giflib/files/add_suffix_to_convert_binary_used_in_Makefile.patch
  create mode 100644 
meta-oe/recipes-devtools/giflib/giflib/0001-Makefile-fix-typo-in-soname-argument.patch
  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.59.bb => 
apache2_2.4.60.bb} (99%)
  create mode 100644 
meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/0001-Makefile.in.in-Pass-arguments-to-tar.patch


