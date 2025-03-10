Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16815C282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 06:07:35 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.31250.1741586847743827533
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Mar 2025 23:07:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RtpoOBjy;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so8103615e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Mar 2025 23:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741586846; x=1742191646; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=em4vmHDQgxZzhU7+K9ALrhmTC70teFgFNxvSV/2BU+U=;
        b=RtpoOBjyOAMNCn1phGZDKFJKTy3AB1ulFa7Fxl0DTZnARozhyGg++D+yOJ0jtW0/OJ
         J+sEe947uEAs4TVykDE9BLh6iTTXwN/fZYmNlR8NDAEFQNCr/1wQ596bdRvQNVeiLgbc
         9+XOepiu4bQ7Qtmg6eTydXn0W4g9w0guvObo+ZWLKbAVk4HaZnTZ3qdTUzDChIQrmEp+
         Y8MahYX2m+aIg3i3axJU1JKT0/LxsaayFd77h5XynspkTHxe9U46Y/dwZnibW9OOdHl9
         5oaeIjx0UsZoWV0JWZaTpU75Sy2oyhZggr+SYw+g9YElVsGT2NLelnQfzAWgcOWBvutm
         Dz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741586846; x=1742191646;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=em4vmHDQgxZzhU7+K9ALrhmTC70teFgFNxvSV/2BU+U=;
        b=tUkt3I163raS2VVbWpnCFr2CPs/QdYpGY4J2AutPpe+/FU735kQSU09Gwa58guu7Y4
         MFqJjRvJXCd4wKXdaD23dh+T9LfzapkOaUuySWbwpkfvygspbLv4U/kSf+zFvG+0NOay
         Iu7nYlW6IWg933t/7PfQKjlle2gsZUsO5xNIOs5SJvIyNDz4cPE9GVEP01M5SlQqfyP5
         RITSBKzWrDiRgd7u/2qM/eLlwjlqJVOizEgEVWsI8L6au254qtWVYmmCyaimK2Ze9imF
         MstAYS0pF+92ecY8XlSErQZzfKurxhUFl8cp9+4dwCmxk/cJwooIQCQ11+A956Ugnm10
         +amQ==
X-Forwarded-Encrypted: i=1; AJvYcCXd/s3l5BOEKXt1m/KrL71oDIlEs1DF1pwSP9FIYpoevdMu2dojdBwsXLgxvKtL0iuiQhjtnxVZp5dQ/ABWfzwZAGI=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwZqpexaD4DxpEQal/ovXzbdNwH2BRMsszzhaoE5Gumnoh1iI+x
	XV0lzh+c9QPQSjCBjw0IumBF8Ah5q2YL/KFsCXxLxrSOX4L7625M
X-Gm-Gg: ASbGncsrMkB6tvaq/kqYdrTf2Hrn/SixQdMU/2W1kx05XvdBPBuYpuCsWfDV6qonkXb
	Ei1Xe3O2mWYRxUAOsBz9PT7jPzQ6t6Z+puTeyrd5Kyi7mQV4rqpAxzgJZHHB0zXizHStqltMh7g
	8iGAWkSdOeygF4VKkngRuCauxPr9k3ehrS0mbMm48vZG6QkbsUbOaVIYZj5eW4zinKPDJUaddxX
	t7yenihtEHisv1Pvx0qLeU6Rxba8FFyFXsei+/Z43/5B6/gkzfuTYQdm/aXU/FiNxxv9txqkK7R
	ccY1ywdzQC4eCVyJhzwHo9e8Qq8dwt+GKqslMTHPMHVu2/JQWZu7kRidNtj9vj0v4Q5lMZRbH9N
	3rQ==
X-Google-Smtp-Source: AGHT+IGv3ALBh+WbRcfQXuc9+XKlnfunxJNE96hBh9DeI+mrt0HzLDFqXJNsxp29JxJGaa8F6+rpuw==
X-Received: by 2002:a5d:47c8:0:b0:391:2889:4ea4 with SMTP id ffacd0b85a97d-39132d06142mr7790566f8f.9.1741586845873;
        Sun, 09 Mar 2025 23:07:25 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ce48165c0sm80135835e9.26.2025.03.09.23.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Mar 2025 23:07:25 -0700 (PDT)
Message-ID: <c2743189-6b3d-4adc-b495-ff3d89ed4844@gmail.com>
Date: Mon, 10 Mar 2025 07:07:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python] python3-scipy
To: rob.woolleywr@gmail.com, openembedded-devel@lists.openembedded.org
References: <CAGAhMBz9zz0K8Fnj__NkEVvbsD8SibEs=BKR8YFE9mv+mG6tsw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CAGAhMBz9zz0K8Fnj__NkEVvbsD8SibEs=BKR8YFE9mv+mG6tsw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 06:07:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115818

2025. 03. 06. 21:07 keltezéssel, Rob Woolley via lists.openembedded.org írta:
> The meta-scipy layer was archived on Nov 30, 2023 
> (https://github.com/tuxable-ltd/meta-scipy)
>
> I need python3-scipy for some recipes in ROS 2 (notably pinocchio), so I patched it up 
> and got it building again: https://github.com/robwoolley/meta-scipy

I have merged meta-scipy and meta-scikit-learn which were both archived.
https://github.com/zboszor/meta-python-ai/

It has a newer scipy version than meta-scipy ever had.

The complete layer is not updated for walnascar yet
(I am postponing updating the pytorch recipe), but
python3-scipy and many others can be built from main.

The styhead branch may be usable.


