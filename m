Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3609C71157
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 19:41:25 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.13815.1750534877718122654
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jun 2025 12:41:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AvU6qSWF;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-adb5cb6d8f1so453850666b.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 12:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750534876; x=1751139676; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MaJ+HMLlhEz1qdyr1HV+avoh/XA28QVaryYDxHnCUTY=;
        b=AvU6qSWFnw0zYN/+NhE3NYIjp0Uu9kCv/o8gMY0esyFcqtDGgXrm8TlWwCB1O3WnLk
         JpL4PKTV9LwgpLeSiNmjbwL9CA07q7DlK7vPB4x0XdCUEyLQBpxkm/e4dNt3O+Mb8ni9
         7fDaTtPDf6zKlyuPnnRxhmwKUZjNKVbagxs0LWD6n35ywKzI8bSHkLeRyUJR2RZF8sc1
         dldQjyIbiw41NvQOTuJDUpdvqJ8WU19en4Cc0Y5mV6guSZx7FOwRP4bruwxyXpJJc41S
         6ybwR7uVewD/0IsWaaM531AI0QQfFUSCz5gPKabJ8ikFDfzWz77HIujmqhxAsHnCJe7l
         bRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750534876; x=1751139676;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MaJ+HMLlhEz1qdyr1HV+avoh/XA28QVaryYDxHnCUTY=;
        b=CHkXPhu8uic2aUBJ2scrwAiYq1zuHoe+U0Xw3BjvfOywR5TqlwKbdHi1/6mCO2wi3y
         Q1sYQ3wQlFvMyQ2piSRlTue0NF/5/ltA87O+qLU3QFRHa28/W9y0O0SyzS+CNtRkPHUz
         uIDjQ6+HAAOS4Y298mBcLVqENG5yVHr2tCcL4PprTPS9lltYk9yBhEx7BXw/01/biOM6
         ncJLJikAsfBxtoR41KOUFg4/lemZroleF60LOxwJxL7ywih8y+dFpXkHOZINKm08ZvHA
         kcGnvjxCdca9htCMkpg3oCvyFMWntlQkbXh3Y6e/ul7xcTX3eqvK/l8JoOp4pMS2Q9/z
         rqvQ==
X-Gm-Message-State: AOJu0YxNZVQow57weDdBUMlUb+Fw2W2TKyIdJ25IVfgQ34EOrObW5Gv4
	zZ4JKOJzIWRJLWjApbDV+RIapXtbuQlrl7HIshynk4qLAiAvWhQ+HcwVZuzlpA==
X-Gm-Gg: ASbGncuBD4n5AE5r7TeFVS5MNFnbFLobcKd00ik/dCeB0dk1Mki22ry0DQFUgfKdsOV
	5OU7MnkW3wOBOo1jv+fXzL0/1BJ77yxev3EVs/8oYMyryPgEQgQe4aPSgFS7R2ikAjPIR/u3pWT
	nG1MZSWM/8fs4uemtzAyxoZJ026Xg2GTpsBU1sVU7CViB9WGdEibk31DFnO8CyK/mM5grKjFjKS
	b5EK42QwmO5wxoK8P8OVC+vf9AtRItMNlc+SPIja2YA5IcoNwhWoEi6aEWJhRmDADTllQK0VFkv
	gYiGEVS9gBLoTXlC/XVJ4icUKHB5hmceO+jk2gB6WyGseGlqrCJ/VJ/0pF4w0KENKdsTTQ==
X-Google-Smtp-Source: AGHT+IHcUlfxpuGJcycVdzcUfFAcCqhRt2/Czl50u+oilNB1Y9SCcXnw2EL9dYDPtqOtOyKM1HEcRw==
X-Received: by 2002:a17:907:3cc1:b0:ad8:8529:4f8f with SMTP id a640c23a62f3a-ae057bd016amr685486266b.45.1750534875924;
        Sat, 21 Jun 2025 12:41:15 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209a93sm413449266b.166.2025.06.21.12.41.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 12:41:15 -0700 (PDT)
Message-ID: <aa7dd813-5bfc-4ed5-9d02-11c62577bb26@gmail.com>
Date: Sat, 21 Jun 2025 21:41:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] nodejs: ignore QEMU_OPTIONS for native
 signature generation
To: openembedded-devel@lists.openembedded.org
References: <184B26232F1A96E9.12316@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <184B26232F1A96E9.12316@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 19:41:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118012

This is of course an RFC too, just very small.

I noticed that every time I switch target machine, nodejs-native is
being rebuilt (starting with Scarthgap), which sometimes means
recompiling it 4 times, on all Yocto versions.

Looking at the recipe I believe that qemu is really only used when the
target and build CPU has different bitness, but I'm not that familiar
with the internals of nodejs build process - if someone more familiar
with it could share their opinion on this proposal, that would be helpful.

