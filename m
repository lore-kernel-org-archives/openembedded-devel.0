Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1598C3ABBE
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 06:34:20 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.9355.1746686057624717155
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 May 2025 23:34:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=C3/+2aAP;
 spf=pass (domain: konsulko.com, ip: 209.85.218.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so103549166b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 May 2025 23:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1746686056; x=1747290856; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wlLJB4BWxx9n7jpmw+8RwvE8m4mfbTEznCRx4sOSN+8=;
        b=C3/+2aAPirx7dzTdleQjy6LrlE6zpMkEanoI9zHUp1PR2DmTHlNqTb5z/SPnEYIhF2
         8bkrVwUBqv29fnMV2yUmIxtHK986ASW54VpCRDGBsSlGm3JOE0xICq61PmSX2kCOgWKc
         2Pd06sc+uI5AoRAz1VpXyU+nIrWDWzrSzwFPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746686056; x=1747290856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wlLJB4BWxx9n7jpmw+8RwvE8m4mfbTEznCRx4sOSN+8=;
        b=qjTgWGKrOy8FvDTPjPXyXTGOvxC9MMiUr+YhYvwbbPIQpgvg3rC9kcIsRTOqKp7IsG
         eUA9ncIiOw287jeOqTDnbC6A89Q0H0tJtmAERFXgZl0+ziQFL/j9/es17UX2eCbolTBo
         JEksRQD1DVV/QaLXzemcyShSn6MTuP21jWpUYF50KqHqwO76plxLgjPTDU7PjHgRKWRL
         7mWn1gBL/Lvz7/uPeabKgwb/ieOlss18FmuV3DAyxUgjeeW/iT0zc2LmzkUzPlGX9cZO
         nBGhaC8r3mxcWCs7G1VKBFcwjD79lKKyYNiC+thzmBOpANK/q5W5WATCUVFtSkwC2xQD
         nQpw==
X-Gm-Message-State: AOJu0YyprlfFrxiogxspKtCBvUUILSchAfL5H1adw4kJVfVZm0efxSVg
	cR3pTTvPBVyc1x/8nIqnqKFdyRxdlR+V/rsqBz3/O7bA6lYpuTPRPSdQopXPnWRbACzVzGxcX81
	ZBAY=
X-Gm-Gg: ASbGnctxd1j4GZ8hhWf7Wu1KuJSNzlEPsht4+GZ3NLBo/HEo66K8fpayR/rEPa5XSTY
	Lx53eNaU9OFfasCmQ8ESV/wXWYByRiFyTmCsXg4lxzY9d84vQODoYdn8oM1bX37Ky0ndj0t0lCP
	w49HXGQ2OdGXpRLw/+djMw0thEk0gVXP7h1TDhjAxLNN7o9zx+9JdpO+BhGqAnLvLQwzkq4LKX6
	rKMAQGut0V2dP9mENHYRWTmf7vKv9iqttA8mB6FEj7Ale/T/DslVLdPim99CFaDsO/7tuOmttc5
	BjTtbjUys83snUIN6w3QoqMM5hf3NDXODpEz77YkKGnlTVzU
X-Google-Smtp-Source: AGHT+IEtPRTD8HaOJKXhXafzNZy+QjaJlQoBo5KAJq2aIysUOQgvLi72S+zy1KeTq14bYfnlxDFChQ==
X-Received: by 2002:a17:907:1c9e:b0:ac6:fe8c:e7bb with SMTP id a640c23a62f3a-ad1e8e2bd6cmr617791866b.55.1746686056053;
        Wed, 07 May 2025 23:34:16 -0700 (PDT)
Received: from [192.168.5.161] ([46.55.231.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a3f0fsm1043670066b.58.2025.05.07.23.34.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 23:34:15 -0700 (PDT)
Message-ID: <10e3ceb4-d8ca-403f-8feb-ab7ee86bcf32@konsulko.com>
Date: Thu, 8 May 2025 09:34:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH] python3-pillow-heif: Add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250507115001.3365087-1-leon.anavi@konsulko.com>
 <CAMKF1sorK4CiMo=re4z69aeknYofCTgbCOzN-QzMRbxBmMMA4g@mail.gmail.com>
Content-Language: en-US
From: Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <CAMKF1sorK4CiMo=re4z69aeknYofCTgbCOzN-QzMRbxBmMMA4g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 May 2025 06:34:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117362

Hi Khem,

On 7.05.25 г. 21:34 ч., Khem Raj wrote:
> libheif has a commercial license and I think we should reflect that
> here as well. Otherwise, it will be trying to build it
> but it will not if the user's distro does not enable this license.
Good point, thank you for the code review. I have just sent v2 of the patch.

Best regards, Leon

