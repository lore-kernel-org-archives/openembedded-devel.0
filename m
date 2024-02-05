Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A8AC48295
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 14:30:47 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.64133.1707143445073053660
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Feb 2024 06:30:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QG2rgh/b;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-60410da20a2so42895107b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Feb 2024 06:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707143444; x=1707748244; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/xMuAJygdM7guKLTEBSujoYN/JGgC5q3EcXyWnR28dg=;
        b=QG2rgh/bWW1MVRUC8q44aiyp83Q8NWUkAE0CMy9sMwRrfxMoPjk/eJdeM5rLgivwcg
         7bzzM8C9idifumbkIcU0mQN7dc5XXLalcbLk8GOEVz/SWzlaFNlDyh/f8OJNFy5RaF3H
         j6SSjJCYKXLR+VzQKCv11x9jF1GFn2EGJSDJPgX19bPlFfKmjoSNW2f+rCQDwSw2EBQI
         oFvrRDMxp+IvHg1M8oMcET1LMzjVM+RiJHXqCM8NBFF12DB5E292XEZ6Nx3MpMKHemQb
         IOI6cy40SBQMNhORrFMVKPZw+BVwJ/3XzUdcIIi3LAf21C+8lmpzWnMSaFg6Z98zm5M/
         WnWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707143444; x=1707748244;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/xMuAJygdM7guKLTEBSujoYN/JGgC5q3EcXyWnR28dg=;
        b=hFhb7NhLsBPyagENO2NrOaIDbh54UW0sNxYtmYM9cZOVehU32VFkJx7z8JmHvkOfOg
         bYvzpvyRhcOHrJT3CIa5amJe7ORTe6YqlfgWAsNgOkS0TYvl7fKIr0tJ+1imhs/D5AEf
         NfcLA/yWYZUP7oKwBVLNhPEuzH94C+nLXZcbdFtnXy8sdJuQY2roYpW2BT2joF9CPEzf
         tg4RUZCwqlv/2om5gLFh0aABfjYIVWSAuErhW2h3CAWwhHKp1FBsPZLtVMHCYVKBJ1PX
         1lBYgrGS1Y/7cmHq5mifhmwkXzI2e5O+l3jmaz3Q0u6KvvJ3T8xrfTM52TQ7RzeMkC3p
         sOQw==
X-Gm-Message-State: AOJu0YwgzUbKM+t9tcLD5v1IP6qSXZKtF98FaDP4NOaQ6OeaaxcU/Qmy
	EC14uZ2Urqu0dg63YY+Erkehts/MkK+25OPYvfzWZ7joZyLymqmL
X-Google-Smtp-Source: AGHT+IEzNw/qW++jFOcTuEzksgyWvPHTQ9lIVFqf42oNyi/Ve+fMkR/kaeo7XCSTOPovL+ufuXKgkQ==
X-Received: by 2002:a81:7b04:0:b0:5ff:617e:6edf with SMTP id w4-20020a817b04000000b005ff617e6edfmr15312152ywc.34.1707143444173;
        Mon, 05 Feb 2024 06:30:44 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUhunRr4+YZhxtBq1Yt5UgDsk0dxa0JIxl+HAwjeI1iRrjU038sXQ2hkcWp2EDDUF9idDtjOcJGxEV5bI8FgJ0xFitgg8d4XXp9FfSnoDYyKEFzkYlBeE8EkA==
Received: from [192.168.18.244] (108-243-27-252.lightspeed.tukrga.sbcglobal.net. [108.243.27.252])
        by smtp.gmail.com with ESMTPSA id h1-20020a0dde01000000b0060403ece74asm1973860ywe.66.2024.02.05.06.30.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 06:30:43 -0800 (PST)
Message-ID: <5ac50428-8e1c-419a-9cfd-d444d3f3e85b@gmail.com>
Date: Mon, 5 Feb 2024 09:30:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: Feb 5th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Feb 2024 14:30:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108573

The following changes since commit 730e44900a0a86265bad93a16b5a5ff344a07266:

   proftpd: Fix CVE-2023-51713 Out-of-bounds buffer read (2024-01-12 
07:14:16 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to ce9c0d76171ce9d07e4bcb702b750416b265562a:

   strongswan: upgrade 5.9.12 -> 5.9.13 (2024-02-05 07:37:06 -0500)

----------------------------------------------------------------
Wang Mingyu (1):
       strongswan: upgrade 5.9.12 -> 5.9.13

  meta-networking/recipes-support/strongswan/{strongswan_5.9.12.bb => 
strongswan_5.9.13.bb} | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
  rename 
meta-networking/recipes-support/strongswan/{strongswan_5.9.12.bb => 
strongswan_5.9.13.bb} (99%)


