Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB27CCF9F8
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 10:43:19 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8558.1762512194617160335
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Nov 2025 02:43:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hE89MzJ5;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3f0ae439b56so374313f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Nov 2025 02:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762512193; x=1763116993; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8bEfVcfCRm4/zJhqilCAFF+fc0Ev4RDHuJQbR8N0hI=;
        b=hE89MzJ5FpAU2ZR0rTsZthrRR5MBuLsow3oDiLk2vBopOIYrt2gyso63ST8GDgPte4
         8bZ/L8Pc4MNhd+yfKAoHcI/PUHSUgvwEG6NbeuEn0cTa+XHxYe1KwzoxwBd17fHvBag6
         4KaaBHxxvLFF+h3q04hRXiyB8ab3iTfdOEvqY0dJV0ohpoQzI0fPKi0t5Yc292FYMrgO
         Rx8uC35V29fq8pPhgtQ2Z5AAUDaH8isGXBjYmwL5dkP4ER1Lki4V3CX+ZuT6J44b5IOi
         Gf7H0anvY1hhBG3iDHalt/xlAAw3vi5Gtorph+viQjePjHylvv/3NUEDXkZep+tK6j/F
         ECDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762512193; x=1763116993;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n8bEfVcfCRm4/zJhqilCAFF+fc0Ev4RDHuJQbR8N0hI=;
        b=Kh3aTU4kYjrTdv48XGYXkvUhdTSiIRihwqm3fSFOfoPgK7L0oowtBTY0Db2WW2su3Q
         nRMqS29pkBe90duqRagNzHrS4Xp76/dbptQa0QUOiL3fv/ZN3CZJM6bcL5n7CSAa8ZEw
         TeIfMf4O0Cf5CjgCCmPRLfiVdM0VRljnD5V8EznYNnlmeTqIEuGUbTVj8g0kKttc1oja
         dze4ohilCfOlS3CEZeLxITIFSVqzImN1JFl3E8+FmrCBI7HRmWSM/JNZSeAnxwloj9zX
         RVgHhYfFpFfQ/ZvEOoQXFmlAWemJIq5S2CM1w8JOo4TFr+B3Zy0dlFziYVqdkx2tW0nV
         eHjA==
X-Gm-Message-State: AOJu0YwQQP2sVHlj3VrJC7vlEP5+DgbD4UODD3Xl0IyHRUx/bu1l/I2l
	sz+hw7M4pzaHEivMgbWXC/3LGobW5ykiljQGg4ShYBGePBnJ45r8CDr6pyUBp8t7
X-Gm-Gg: ASbGncv+bglvfdEZOc9fZD54moMETIUoJqLej9BRAxMLiLgrwOFNsdRwGcFIF1cek/n
	etUi21CXNNyP6veLhTFfgs1Ze6gU0RP4cGtcPmR8eRBoP4t3dP9+J5Z9UGxy/L05lRWMYzJk4h8
	nOY0fQ+lyFIRHcmhCmv8oeGbrRb9HqN2oPmlw1q5RzmNry4n8XqoCu9JIrw+Z2f079klA/U0GaC
	zoiW3F9shlySJtZJWqUMpbc2fCQbQn2Q6Y4cfIHfEW/scGO/EE/R9+ciXJh56XgDsJmcKVgJFdo
	SoOgqczrwGoSvAAChyO11qCZOe7ZAl6CmrAbpBxa8AoYBLaFvVY5aTgJyCLL5JnKcf844o9lo5z
	l0WCdlPp+EsY+aD5mir/VhoUWH9hkmsKe3+bOGnPALWRbBQ6QEX5zyQ56NhWEchRe9JXblhd7nM
	hHOG2TjTd2
X-Google-Smtp-Source: AGHT+IHc7F9rhRdkF3aBoSgAP5U/2aLPE93VEDD4k1HdOaOFBwVQ4YZDBgPDmOAN3/IPWFgcBxTDWw==
X-Received: by 2002:a05:6000:4305:b0:428:5673:11e0 with SMTP id ffacd0b85a97d-42ae5ac38f5mr2049289f8f.40.1762512192642;
        Fri, 07 Nov 2025 02:43:12 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac679c5dcsm5231207f8f.44.2025.11.07.02.43.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 02:43:12 -0800 (PST)
Message-ID: <ca2ee105-a3a2-48dc-9ad5-77676a71d8d6@gmail.com>
Date: Fri, 7 Nov 2025 11:43:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
From: Gyorgy Sarvari <skandigraun@gmail.com>
Subject: Call for patches for next Kirkstone release
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Nov 2025 10:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121368

Hello,

The next Kirkstone PR for meta-openembedded is planned around the end of
next week-ish. Anything that arrives until the end of next Tuesday
(11/Nov, any timezone) will be considered for this PR. Anything that
arrives afterwards will be part of the next merge cycle.

To anyone's interested what's queued up so far, this is the staging repo
I use:
https://git.openembedded.org/meta-openembedded-contrib/log/?h=stable/kirkstone-nut

Thank you,
Gyorgy

