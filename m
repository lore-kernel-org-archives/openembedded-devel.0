Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B5BCDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 12:01:51 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.9392.1697112104385545566
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Oct 2023 05:01:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TphkB1K7;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: uvv.mail@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-991c786369cso141676666b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 05:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697112103; x=1697716903; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tVbc4mUdqgEy8DcOBNaNczK73V+EhvXMjraVzFUSgqE=;
        b=TphkB1K7REtBnnj+nlHc2rYxwVtaY2EdM5U1HA/lC9rIBpouMECHfcQy4y8V+9rAwU
         gu01eh+192fuPTrZa9pFRoH0x2Ev5rdsaC80e79fsMn590HJlUH4I1HXcF3SO6QFEijW
         XgP/kt/U9icfjrH8fFk9cWO4tqIDLmCJI3yjKSso9KQ3VdAGgjKz3x7Bd/lTTr6JYEpw
         ZZ5AW1/L4zsVg493KsTMLyO9TM8VUikqT+Evsbazn5cgeKJv2l3dGpdl4Ho/aXJ1LY9Y
         kPsaNX9MR1L/tWSHM4layFFbfKw6hFhI/YKk7VjKqp3ZzOIPz3RQOnjLYHf3kUJ/Cm+f
         Oftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697112103; x=1697716903;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tVbc4mUdqgEy8DcOBNaNczK73V+EhvXMjraVzFUSgqE=;
        b=FrGJC3VCgVudzX/XHPiWy2anBJcYxgj9g0UDLcBRfKnmlVzx/EMlpOd64YWTD96FWL
         1HIl5CSfLdggobludxvlRcjee8FdGfxTrvcaZ05gLGI6Anu+n8Ve39TwZmv9YQ76Mca5
         6nhGROWzsTyd3zS95MCt+dlC43AdGK2gkb+nPR66F1xQOCgbRfejHH5NgAon31kqglSp
         oC57W4yZMwyjd7jZMKpjBKw2ptg2/bcOWrFdBHpZLvKwpH+7m1IFERnRmoAyt0GSyLA5
         PqklRbTvFgSFLg81DfqaSkhHapXZsCsYjFLxTeVRAUpUWzJyX2plp2kCL/7Ke/HbnMj6
         wv4g==
X-Gm-Message-State: AOJu0YwQ1aGC36aYVjmCDf87lMLNJTDWQHDxKrYUJ2SK+HGylsZOUldh
	3qli2UwnN06HFjVq5158u+s=
X-Google-Smtp-Source: AGHT+IHoVspfvfXb+PhXEu5OfXrJiywKjBD43P9lFagkpO6sD9TRAvuCkfcml/7PwK+RQgibzDZoUA==
X-Received: by 2002:a17:907:1b11:b0:9ae:6ffd:bdf7 with SMTP id mp17-20020a1709071b1100b009ae6ffdbdf7mr26171664ejc.39.1697112102397;
        Thu, 12 Oct 2023 05:01:42 -0700 (PDT)
Received: from [10.134.47.38] ([89.249.73.140])
        by smtp.gmail.com with ESMTPSA id o12-20020a17090637cc00b0099bc80d5575sm10858339ejc.200.2023.10.12.05.01.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 05:01:41 -0700 (PDT)
Message-ID: <da8698d9-a595-4ec0-84f9-23ecceb22b9d@gmail.com>
Date: Thu, 12 Oct 2023 14:01:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-filesystems][PATCH 1/7] Add static-passwd and
 static-group files
Content-Language: en-US
To: Fabien Thomas <fabien.thomas@smile.fr>,
 openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
References: <20231010093940.75037-1-fabien.thomas@smile.fr>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <20231010093940.75037-1-fabien.thomas@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 12:01:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105449

Thanks for the patch.

Is there any way to ensure (have a QA?) this file is updated / not 
forgotten when somebody else adds new id in the recipe?

Slava

On 10.10.2023 11:39, Fabien Thomas wrote:
> In order to pass reproducible tests, recipes that use the
> useradd class must have static ids configured.
>
> Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
> Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>   meta-filesystems/files/static-passwd-meta-filesystems | 3 +++
>   1 file changed, 3 insertions(+)
>   create mode 100644 meta-filesystems/files/static-passwd-meta-filesystems
>
> diff --git a/meta-filesystems/files/static-passwd-meta-filesystems b/meta-filesystems/files/static-passwd-meta-filesystems
> new file mode 100644
> index 000000000..157697f3e
> --- /dev/null
> +++ b/meta-filesystems/files/static-passwd-meta-filesystems
> @@ -0,0 +1,3 @@
> +fsgqa:x:700:nogroup::/:/bin/nologin
> +123456-fsgqa:x:701:nogroup::/:/bin/nologin
> +fsgqa2:x:702:nogroup::/:/bin/nologin
> \ No newline at end of file


