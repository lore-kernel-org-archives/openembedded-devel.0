Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38151CF9C6C
	for <webhook@archiver.kernel.org>; Sun, 22 Sep 2024 13:47:46 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web10.15151.1727012856337986395
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Sep 2024 06:47:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mk9jju0Y;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e1a74ee4c0cso3004636276.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Sep 2024 06:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727012855; x=1727617655; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEM8EyDA6jBg4r1oYzfPOgRqxXCQjysBjjSw0ZkCJag=;
        b=mk9jju0YnKbB5mDAB90X4kjbTXqo0z+O4Lf397GXbedhNa5MMt8+2hHnkmR22JL6U3
         3NTgPCen08ZGZNwpWFomlt8w36G8tZfZ/fLpKZsqJg53N7N1Kdf3PQaUG40X7ba1Xgz8
         zuVsR7rESzhoCl2cIWxiACU5wZ4dIO2bazlNGnGD8BdaUz55yo2qUpjrALFFltYipX+2
         fL4Y5humMVGaFqgTB5jjkh6Q5YuXda+X05IXQD0w9VMclVgCL6rDKCL5BauvwuXbF2VL
         1fOemJUyN1sV7cZNKLznIdskREdjNmr+3Mtwn5jxGyQ5WN3MnbjpwQy2cavS6GcDgo/P
         AbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727012855; x=1727617655;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EEM8EyDA6jBg4r1oYzfPOgRqxXCQjysBjjSw0ZkCJag=;
        b=iYWxPC4Jq6vFXrafhiKjqgA0zEz4asy+PjfcTB/My6+hfulx3Oh2EHetgX/ZBDDVYx
         48GOsc0Lp1UIoFf0HSJ+J7fyV44Hdfy2Ff/b8tdlgxtJERuBVINf/Obo0wO2D4ISxX5+
         kfNC6yKPqoh4idtkPTR1nDOFvxjBrjfTQYkudGYq/I82Z3Osq19fiz3FexGyYmeGcs6l
         Pq0857PYWmCO1TEgoI5onxujByvNKTw9fVFrf7p5lz6/Y7YZkFo78ik/ciVva8LOVfgo
         2EEEPmy0jwC+PKjLKtcBfSbAZIT1M4wrEhkQupG+X+iFhHU6RWYOhvvqkz1JSgpN7Q9V
         3maA==
X-Forwarded-Encrypted: i=1; AJvYcCWkqkHV11Meoipgjvph9m28zSUQWkJaXlzKu2lUpmK+PcyLGiwfC8ru8N8/wyNuGBoZvEF9C2jhSdwrAyh7qGJy13I=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx5I0WDPFdHQrGXOURRLf5th4CjbqjNhpyO1COs0f3mMVQNJUTt
	SadNc4sWTTMwbVoHW4bbpCOMo6ZiYA2fUdtlQzpu/P4k2zo93C00
X-Google-Smtp-Source: AGHT+IEcMWVt8PE4h1AIfLQoMwZkKj0VKFQmbc+8ZtBcUQNGY2EvHwPyucSP9aZ297uZdUJs1KsliA==
X-Received: by 2002:a05:6902:2311:b0:e13:eb67:6a62 with SMTP id 3f1490d57ef6-e2252f469bemr6266296276.26.1727012855349;
        Sun, 22 Sep 2024 06:47:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:6ae0:940e:cf09:2291? ([2600:1700:45dd:7000:6ae0:940e:cf09:2291])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e1dc112dc51sm3442211276.24.2024.09.22.06.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Sep 2024 06:47:35 -0700 (PDT)
Message-ID: <1b800883-a47b-404a-b07d-08f833fb4b48@gmail.com>
Date: Sun, 22 Sep 2024 09:47:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: scarthgap merge request: Sept 22
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Sep 2024 13:47:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112450

The following changes since commit 801849483137e3b24a8409f124aa24aba1af47f8:

   python3-libevdev: Fix LIC_FILES_CHKSUM (2024-09-09 19:19:20 -0400)

are available in the Git repository at:

   git://git.openembedded.org/meta-openembedded scarthgap-next

for you to fetch changes up to 735ae0310870ffce07ce0c55c4f87c20ac161ff9:

   postgresql: upgrade 16.3 -> 16.4 (2024-09-15 15:46:40 -0400)

----------------------------------------------------------------
Marc Ferland (1):
       polkit: update SRC_URI

Markus Volk (1):
       gnome-remote-desktop: update 46.1 -> 46.2

Martin Jansa (2):
       gpm: fix buildpaths QA issue
       xerces-c: fix buildpaths QA issue

Wang Mingyu (2):
       samba: upgrade 4.19.7 -> 4.19.8
       postgresql: upgrade 16.3 -> 16.4

Yi Zhao (1):
       samba: upgrade 4.19.6 -> 4.19.7

  .../{gnome-remote-desktop_46.1.bb => 
gnome-remote-desktop_46.2.bb}          |  16 +-
  .../recipes-connectivity/samba/{samba_4.19.6.bb => 
samba_4.19.8.bb}         |   2 +-
  .../files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch 
|   6 +-
  meta-oe/recipes-dbs/postgresql/files/CVE-2024-7348.patch | 583 
------------------------------------
  meta-oe/recipes-dbs/postgresql/{postgresql_16.3.bb => 
postgresql_16.4.bb}   |   3 +-
  .../0001-aclocal.m4-don-t-use-full-path-of-with_curl-in-xerce.patch |  
58 ++++
  meta-oe/recipes-devtools/xerces-c/xerces-c_3.2.5.bb |   8 +-
  meta-oe/recipes-extended/polkit/polkit_124.bb |   5 +-
  meta-oe/recipes-support/gpm/gpm_git.bb |   4 +
  9 files changed, 86 insertions(+), 599 deletions(-)
  rename 
meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-desktop/{gnome-remote-desktop_46.1.bb 
=> gnome-remote-desktop_46.2.bb} (64%)
  rename meta-networking/recipes-connectivity/samba/{samba_4.19.6.bb => 
samba_4.19.8.bb} (99%)
  delete mode 100644 
meta-oe/recipes-dbs/postgresql/files/CVE-2024-7348.patch
  rename meta-oe/recipes-dbs/postgresql/{postgresql_16.3.bb => 
postgresql_16.4.bb} (82%)
  create mode 100644 
meta-oe/recipes-devtools/xerces-c/xerces-c/0001-aclocal.m4-don-t-use-full-path-of-with_curl-in-xerce.patch 


