Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35381C61DA4
	for <webhook@archiver.kernel.org>; Mon,  6 Feb 2023 12:36:04 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.52050.1675686963787187859
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Feb 2023 04:36:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gG/U0D1E;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id k91-20020a9d19e4000000b0068bca1294aaso3144898otk.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Feb 2023 04:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZpfYPCZyeo/K6iQBpjYc5WjxK6z+Z730J0YXecfTM8=;
        b=gG/U0D1EgfuTA4Ck91EAm7YzWahu1Egm8uDeWpotaZjLitsYaxCpXyTSE7otL4K4R5
         jV8/3Xb/V+hEkaPXsAnyNUMehNaF6dHeEFiwMG5fxw5ARckP4AjMNo2nAjXZnzl4+itl
         3rgZtq1ir9lMrOmoH69YnqAcC3JWNxx62f+0vFGLABNo16s4T3a9UtXdBHazygt5uz+K
         nb9PFbefCr1jlbtyxxxikCBbZhjlnwX1I5CTRyaI1a6YZ0IGxuHYCLevALjyhRdzHb9W
         1YPG45hULZq46WlKeImxMcpnHowRS1t2ohvTwwGElUmR+svWOrPpcZgRQuLalpA4+jhK
         o0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GZpfYPCZyeo/K6iQBpjYc5WjxK6z+Z730J0YXecfTM8=;
        b=61SiyWdvFjEYF589N2bkPTvyZNErPiNzPYvThgMgFowk+01GkKPysF2wj2qjTqYc6T
         Mq4OcyCa43PQzycI/Fj0/mqKWnKtXbb4J0v/8UnNghLDF+6r1MrnPFyMEzPyPZs2sGzB
         chMjxD1MwJh0qFbI6FQU21OsvsLTO0q5+pJHKsSU00WIafPlugOOcnnHa9+fH6Hrihkz
         MiFImE9q9kISO3ZSfjJSJqr2MOyfAiynfrW24VWI/yQDb0w9rACeu2U912RdWOMuaAhm
         P06Ih/98jEtwXpmpRTSFkmhyXcmC5AZz/1qozY+FUZXvTECm3gOMjWFCLobmBQ3piahx
         HrJw==
X-Gm-Message-State: AO0yUKU2L9eerWC/A8FsoaYwjo/sRs7AKTEx1MgljWKmRfx+e0mDBpBm
	KgiSMwTRVC3uP0KeXN/nq0o=
X-Google-Smtp-Source: AK7set8nnPV3DX/WPPVsWpvk1U4417iiCaIW3BJ8JEA7ukI1cQdZIAY/dnBSY/fe9RO1OcgivBevQw==
X-Received: by 2002:a9d:7dd0:0:b0:686:56c6:34bd with SMTP id k16-20020a9d7dd0000000b0068656c634bdmr4459450otn.14.1675686963086;
        Mon, 06 Feb 2023 04:36:03 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:5da2:e19c:7aa7:41ee? ([2600:1700:9190:ba10:5da2:e19c:7aa7:41ee])
        by smtp.gmail.com with ESMTPSA id p11-20020a9d744b000000b00684c5211c58sm4798782otk.60.2023.02.06.04.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 04:36:02 -0800 (PST)
Message-ID: <63809d5c-a7fa-6616-0167-b64a98862c79@gmail.com>
Date: Mon, 6 Feb 2023 07:36:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: langdale merge request: Feb th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Feb 2023 12:36:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100941

The following changes since commit f8cb46d803190bb02085c8a7d20957a71d32f311:

   perfetto: Do not pass TUNE_CCARGS to native/host compiler (2023-01-23 
10:15:33 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded langdale-next

for you to fetch changes up to e7c754778edb25f35896137c8b174669392c492a:

   nodejs: upgrade 16.18.1 -> 16.19.0 (2023-02-04 12:16:04 -0500)

----------------------------------------------------------------
Tim Orling (1):
       nodejs: upgrade 16.18.1 -> 16.19.0

  .../nodejs/{nodejs-oe-cache-16.18 => 
nodejs-oe-cache-16.19}/oe-npm-cache                | 0
  .../nodejs/{nodejs-oe-cache-native_16.18.bb => 
nodejs-oe-cache-native_16.19.bb}         | 0
  meta-oe/recipes-devtools/nodejs/{nodejs_16.18.1.bb => 
nodejs_16.19.0.bb}                | 6 +++---
  3 files changed, 3 insertions(+), 3 deletions(-)
  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-16.18 => 
nodejs-oe-cache-16.19}/oe-npm-cache (100%)
  rename 
meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_16.18.bb => 
nodejs-oe-cache-native_16.19.bb} (100%)
  rename meta-oe/recipes-devtools/nodejs/{nodejs_16.18.1.bb => 
nodejs_16.19.0.bb} (97%)


