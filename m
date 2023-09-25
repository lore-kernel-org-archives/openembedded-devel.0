Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C3DCE7A95
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 10:13:50 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.57519.1695636822627111485
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Sep 2023 03:13:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f5xJ0/sj;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-523100882f2so7063103a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Sep 2023 03:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695636821; x=1696241621; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kh3YjkHm58ESb/b/u0qf+mgoviFAhTp1nKWri3TBMN0=;
        b=f5xJ0/sjCJr4YJzXbakiSWbmvHS6Nqes0Sm2paJJGes6zvHiaAcObze0OPXGgQbJvE
         tbrKI+oT3Ka8aD+HWYbEGSmxnsm8Q/+9D/nNMeW0HmTKWrlNgA7Jrhr/axxkbHc7iO6J
         mtA7Er3eACHVZH/EOik8D/wSQmrz7mGTT7XxVexiw98kGxH3XFTDPoJzW99RBn4cdgNt
         ofRO1RoilsfsomEaxfY3oVSClP4ZlY9cjILZrazBHT40vbqYfSs76BalBPVIcZggxVsT
         gcfnGJreBCzKDiBGZGA1hw/g8J48vih1pPl0laGyGeZMyAzOWOdv/EfcEgTGlZmfD3KD
         E16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695636821; x=1696241621;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kh3YjkHm58ESb/b/u0qf+mgoviFAhTp1nKWri3TBMN0=;
        b=XPuSDzsfdVLrMJm28Yvqure700UGtHd88xWa0T0YPUSqRGR+IRnc6FJ9oWm1i678Ua
         837UGXhxKKdqCCrKqx2fEDDRewLLAO7XOjJGXA6L2fZlYL5mr17AlULTYG4pRrQTWLWp
         MOs1lJp3txg4NkG6+hNpcpLKRL0HXM0K5qa0y04L/2MUlz51JREO5D0OE22gya3szLD6
         R7DMshVe5ZDG6ntUdV6/jKoX7mVWc8aNo4YOnlvl/D+ulueAHIezvGhMXRIhSMjM2Wnq
         bk/rjieSV9f5BTRXBa3tVNWJwKx18t8nf75Qg+abD0deOcPi0c/2XJYHo5WjJ6oXiQc1
         j8YA==
X-Gm-Message-State: AOJu0Yxx0rZzZUjrf1Gu1O1dQut3YAf6rFazL9hVYj7U9TpAVWj/nnzY
	fls466dzgnaRgtY37yTG4G0DbYh2Rvo=
X-Google-Smtp-Source: AGHT+IFoLKmvxua79d117ufdiMyGFo5LcwtPbh6bu/Y5w//TvI65Yi5TM1D2wzSTBJ/9lxbsJgAEeQ==
X-Received: by 2002:a50:ed02:0:b0:523:47b0:9077 with SMTP id j2-20020a50ed02000000b0052347b09077mr5241426eds.38.1695636820500;
        Mon, 25 Sep 2023 03:13:40 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id q3-20020aa7d443000000b0052576969ef8sm5262653edr.14.2023.09.25.03.13.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 03:13:40 -0700 (PDT)
Message-ID: <b90bc6ae-bd4c-2631-9b11-abbb2f53641e@gmail.com>
Date: Mon, 25 Sep 2023 12:13:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: openembedded-devel@lists.openembedded.org
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Subject: meta-java question
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Sep 2023 10:13:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105120

Hi,

When will something newer than openjdk 8 be available in meta-java?

Thanks in advance.


