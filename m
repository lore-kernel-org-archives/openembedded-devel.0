Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37ECEC02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 12:11:59 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.86177.1738584709003173340
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Feb 2025 04:11:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UGU4yMFA;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4361815b96cso29326715e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Feb 2025 04:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738584707; x=1739189507; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2j1oI8XuWAjnerqBmMdKtQ47DaS9bot1fXwfEcURARc=;
        b=UGU4yMFAJF8hQL90R+YIUigIu9a1fPOwiD7ZvNfPC3tf/h3jJsToEMz7VG1ZL5bo8H
         RZ9viuPuW5SUOXppBe8glunxZt0fEfwSk0ugpv3Zzofl24RjUVsxG4McoOqLyWSTPWI+
         jxA1jLGpfhyXlpsRACuMIt01ZQDLZ0rk1FbNuN7K5n1Biz5QmyHqP05JlSRpukERLZaj
         JOyUuu1uF33uzbct16kIdJrwVXPUG9CyHAzQTwtvOPn/0LDpEHk5Kh83lhiZFbnO5HHo
         HtQ6QGeuPnfFqqzZWcQ/Il+6d/JOxj5eNKJ+eVXi5N/dJoq4zXbU6lEavll4PqnJY8oG
         QUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738584707; x=1739189507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2j1oI8XuWAjnerqBmMdKtQ47DaS9bot1fXwfEcURARc=;
        b=JnyUGLypP0XQXLQqXA2DPMKzQrgbq4yoGqK7kj41/9TVwKnBd0af+sD47uGCmOcyh7
         CtwYENraWnEav2puaAhdMnWCwRb2juLwf/7WMhsdVvpkDa/WH6cnZsdPA3ZETsq0mgwg
         Wv639pmEPM37YLDhK01p2NMOi9D5js8+LYtGv1Fj3BMtlDRBOBsWY17YXCkfcc1Igyqh
         uZOCrFPFh6YnEAc2xqkcPIlSwS8keZ52e0DNPo/ggfio048wfkSAyREKS1oKJIKqZot2
         Xf/ccn3QLaZ8HwPiU7RITTqm5Ar7ywkp6YYNaD3Rj1oAaZKZGSeGUCLzqaeOs3iGy2z7
         DiLg==
X-Gm-Message-State: AOJu0YzCi3xW4gRW/CZO4er3Atwa2KqTlzVL1HM5GU70OGcn7q0Gt7oR
	xBiZtUJEykkaHkZchlOmhtQ0sHJLhLBic8fMqrLGQSsi+hWQnqyOKennGhSw
X-Gm-Gg: ASbGncuphPlNWkukWJl7qiHbGSLyINcT1DjXu4mUwHMtOuuaXrmtfRu0iLTmxy/jeOH
	H+mGUgniE1ij9XmuMjIRQ79vLSbGuBxo/WG2yNLfqIrKFgzNV58ouLzA0UbIBhwGlQS86rla2DC
	5+xOKxHtvqkP4RE8LkisvN/Y8tdWfIxsvWuWAxjb4WSwtoXydABXdgMbhYj9MEN9gAzYjvckw/s
	UNaEB/OD5Ig+uSHaxDHwzjmXaH+nYOEhrBY/Vo1EMZUkvw2VHvxe5xPH7ek3J2pJ81Y0PMmAKpA
	ure9gYEC6VZmrGsvOvoeUrc=
X-Google-Smtp-Source: AGHT+IGy6x/75CZw0AEs6BL2iCGMQXlH/uhnd1Cl9knwbvUGdyYP9WyBbLgQNLf09j1rYzcRUeSWdA==
X-Received: by 2002:a7b:cb41:0:b0:434:ff9d:a370 with SMTP id 5b1f17b1804b1-438e62f98dfmr141404835e9.0.1738584707156;
        Mon, 03 Feb 2025 04:11:47 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec7aasm12516673f8f.5.2025.02.03.04.11.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 04:11:46 -0800 (PST)
Message-ID: <b74c1960-4f13-4758-8a80-22f025577c79@gmail.com>
Date: Mon, 3 Feb 2025 13:11:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v2] capnproto: remove binaries from
 target-build, add bbclass
To: openembedded-devel@lists.openembedded.org
References: <1820B183AA0ABC96.15786@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <1820B183AA0ABC96.15786@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Feb 2025 12:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115239

While looking into Ross' feedback about the first version, I realized 
that my
sed regex didn't only have superficial problems (namely being an 
eyesore, and
likely brittle), but it also only solved a part of the problem - it 
allowed to
link to the cross-compiled libs, but code-generation during class-target
compilation from capnproto definitions was still broken.

This patch supposed to remediate this too.

If you think that having a new class is overcomplicating the issue, I 
can be easily
convinced about it (but please leave an alternative suggestion also).

There is 1 known caveat however: if someone would want to install the 
binaries
from ${bindir} on the target machine, that won't work after this change. 
(Can't
really think of any reasons however, why would one do that - this is not 
a user-application.)

Let me know if there's anything you'd like to change in this patch.


