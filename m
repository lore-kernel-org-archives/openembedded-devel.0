Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F183C83F1A
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 13:42:43 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.21157.1752846155098928031
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Jul 2025 06:42:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X+TD0WWm;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aec5a714ae9so219803166b.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Jul 2025 06:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752846153; x=1753450953; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3X7SK1Isyb1O2neQTO8Au4Sn/GXFE0U1EB4JVYPLVVA=;
        b=X+TD0WWmKSWftYjVMk/9WQNmC3mpMOdZ60xbRTNG5IKWJ13cNlprGmj4OdFMAc6mP+
         m4lxJFQR4DEh6c6asLs0vJoHqVQ317p2ZnDQBNmpDmWD1/o487UFQExXz6B0VeGslmLh
         xBj7KsfDGmcykGLuhfMd4P5Yk7egxQH8jGi8Yv28IcJDO620z4gEk0RcHudnwQzMYe6T
         IuCdNoAX24ijXATTIuChPCMnapsmS/XXt15MLSZ6hkpWuPOMdU6e9sb9R8RcAxkjwSWN
         eZEq7ou0ebimOBWMfrutWfJYXu+se32j5cwYVTQYpWVMxc1j0kSqy7C12Lt5KSyN5xkf
         SXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752846153; x=1753450953;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3X7SK1Isyb1O2neQTO8Au4Sn/GXFE0U1EB4JVYPLVVA=;
        b=N8dP602lVAGi2k8XbV5NrymoqsLU9DNoj3/mIHdO41mtaRmGSaeMBV+m2zWRDQvWMx
         Y+pVz4JAJLA/61ox5kmJZ+A3vePiZ4YVZKBjVgEB2yesOBYMjTQCeVt2ZseoxHjcl647
         Cllb6qB0pwub5PZ0rI17frlayXXjv9faMA5hZz74Jgjgs2RQnUgz73aXWO9oS5zjflzc
         JhgzkCY5hSfYLtsGqTYKaREZK/itprCRN/cWDCQyp1f+3O9EFnFXj5MkC7B/BuoYzx+1
         vV4FXY5ESLbPk4GSLg0w3KZHhSIda9qH8LjiPS29Y2te6rs3OrhBcAR+/6/Uq8+DUNnb
         150g==
X-Forwarded-Encrypted: i=1; AJvYcCUa96FV3j8tNt0a/4oLaorj0RK4JESd/J3CkZQ0ts3PgF/rgEyAzqPjGvpyA2uxC5Um5+s2EFsfrVX1++iBdpBCbZg=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyEUIm36R6Y6vPp5DkfRiiGctrN8oZxdhm5hM5ecDcO4pOyjUSW
	I7T+2QH/jmj5b8kYVhCAb/voDy7UTPw9t78yo4IcDnCjZFBRVjC7g49u
X-Gm-Gg: ASbGnct4N1ZYcgnj0IQ9ipSekEac5UjDJTh5A9df4448sgon3xeeM9/p5SfUxKsLpTo
	+RtYtovFqYlM48f9fOkJzvBWK33HeVdZGuyhkY4GcaosWdddlANAHt23exwF/xdiJOtu86UY/Mn
	ykKzq7bqXobfGJ+ya2XYnnlMu13GtOGJthTD9QysBuAERrULmtZTSlT3JuVQUac2uU5OlszUN2u
	HDoUyBCwGhicaQb0XQc//FzL6BOXdjtfi/HT43szYGn6InhIqMhDq9xRf10hJqVQ1v4R5SrPhrB
	0M32QUuH0HOdOzBCa5sJQWeVNxZDHrM94sPe669grmTD8ZyYoRfRxHVXbJPNEO01Cy+Ve6ld/yV
	MRfFEvLusqXkJS0xX1wEDjlzKfcw5ajE3H6YIq99O
X-Google-Smtp-Source: AGHT+IGJR5KEGha0hDTnEF1UCYgZKZ89sSUiA5Wf7nRYD4sweoLh3ZgX7yjZJqfGK6GFvdSt8Wz88w==
X-Received: by 2002:a17:907:cc98:b0:ae6:d47a:105d with SMTP id a640c23a62f3a-ae9c9b5a263mr752418966b.55.1752846152424;
        Fri, 18 Jul 2025 06:42:32 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7d475fsm125777366b.43.2025.07.18.06.42.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 06:42:31 -0700 (PDT)
Message-ID: <7b701fcc-5b24-41dd-a0f0-4bab2843e162@gmail.com>
Date: Fri, 18 Jul 2025 15:42:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][scarthgap][PATCH 1/1] mariadb: upgrade 10.11.9 ->
 10.11.12
To: Yogita.Urade@windriver.com, openembedded-devel@lists.openembedded.org
References: <20250718122620.2501365-1-yogita.urade@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250718122620.2501365-1-yogita.urade@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Jul 2025 13:42:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118625

On 7/18/25 14:26, Urade, Yogita via lists.openembedded.org wrote:
> From: Yogita Urade <yogita.urade@windriver.com>
>
> This upgrade includes fix for CVE-2023-52969, CVE-2023-52970
> and CVE-2023-52971
>
> Changelog:
> https://mariadb.com/kb/en/mariadb-10-11-12-changelog/
>
> refresh 0001-Add-missing-includes-cstdint-and-cstdio.patch and
> ppc-remove-glibc-dep.patch
>
>
I think that ppc-remove-glibc-dep.patch can be removed altogether. It
looks like it was fixed in
https://github.com/MariaDB/server/commit/dff354e7df2fa774ce4da77202a17e2cae99ac59
which is also present in this new version.

(Unless I'm mis-seeing something)


