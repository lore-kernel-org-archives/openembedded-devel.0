Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7588CA0FF2
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 10:49:11 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.9367.1756896549815578648
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 03:49:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CS1sgZqn;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3da4c14a5f9so509392f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 03:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756896548; x=1757501348; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uVYiF041dVwjGjvCnqzpVVmg5/SaTqXXt6ONEfN/vNI=;
        b=CS1sgZqnsD9EmeeMJ4wExJGIFVYLqgR424+8egKdL34AXP9DDhBRSvb5rJIuIpaneI
         BeCPJpTnETHlFXCMsvstntsi5k7BZ3/2lVXNiQDbmb6RKjBqIOixJpWRZyDnFQi3XE0i
         Zn9B6kd4zIRvVdxnVlaC+MtJphEyRlIR/UmZK3sV0gNbzyGzks4FlGBFKPMyfbmy0zxf
         mflQGyfaHgmhpNyIla8G1jLQ+j4lK0CPpKh2Oc2gidQfZvb5AQAgLqEFm1fU/GgNK3YS
         JPOEc9jw1pMGf0fIggnZ8Q7zJePhtdRFdIsyAzW1VGvyje53UAYwLvDjLvQl3AoAd9mv
         E8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756896548; x=1757501348;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uVYiF041dVwjGjvCnqzpVVmg5/SaTqXXt6ONEfN/vNI=;
        b=aLihhlctpdDFidlgzBLpNWxpFlJ7Ho9Hh402VUgS7/OIdiQvaBfQr0gwr0REhpTdkV
         sn1m9eQYpiBGi2ge4JHxW9hrMPkQZkv8K5gw7UkA/2J/l3agvhIvg+DzhxFc1spv1ipd
         upFKI9tbwVn693CzLUPSgFKhgxx6kAG4NG5VbcPo8tKdvPGYwyG0yd4W0Bg2vVPvMnx5
         fM/Cdy3YqtXMLHFko0zvUsLGEYIsge3QLfiAqC7/vTVXz5kpUL+LHUoqaEZSCtneNCO4
         a8jTMnonXBSlS9Gu9QhJ3QZp+Gl4AJYaGAoJ6zQoB4fPLOuvidV8rm3W8rn8BWqatppt
         kuJQ==
X-Gm-Message-State: AOJu0YzyMF7UVXztjrDmvWARa3fIhfr6/JuEEIwR6PPfJbNwb/UI167X
	ULQDd7tJadFp/DbZtl1vPNWig5i7WfU4Mt7ig/cn9n78JVFUVqFwVOPP
X-Gm-Gg: ASbGnctYz14Kc/8+wq4CcxWYeGaBvIsGECMHgIaUW/qkawBcW0Zp1IB52Mptzzm5f6y
	p0I02SqN72u2byLtq+rMYxWIfXSsD93t8CREMevxh9WlD9NIBNO1sBvLnGE4GWa2WXHln9pDjAZ
	Q5PfmMW9YSk4q21iEX8Kv8l71woDqVuBY+CTTL5+mApXfVzWXdJKZfvlRbYsa5t6Z1jIwxnlVe0
	NoVoehTBOkVvX+ep4t/Edr+oXpzH+J6lqZ7yuj59LPv+6bmWRW0LRweaTh40NX0Gbu33goRxTP6
	XMLO4yxOETJCNipM0PtU8jHA37XkjjIG5bdyBI9cD9mz+Ivl/g9CHsURntSJnFRYjMDVnL6JOyM
	CVqFWon5vDyY5I3bEP6eqpaZQ+T2idXo=
X-Google-Smtp-Source: AGHT+IFjk65xrX2mooRUyp8JEshR99J177foqEV7/pvXtXFUp3f3dOj7U4gwJqI9rEYyUe/3yNccMw==
X-Received: by 2002:a05:6000:290e:b0:3c7:e6d0:b1b6 with SMTP id ffacd0b85a97d-3d1dcb77f57mr12200373f8f.9.1756896547917;
        Wed, 03 Sep 2025 03:49:07 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d3a7492001sm18454688f8f.42.2025.09.03.03.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 03:49:07 -0700 (PDT)
Message-ID: <45bcc161-228d-4900-a384-7c3869b97ef7@gmail.com>
Date: Wed, 3 Sep 2025 12:49:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [yocto] No meta-openembedded/krikstone updates since 2025-07-13
To: yocto@lists.yoctoproject.org, joerg.sommer@navimatix.de
Cc: openembedded-devel@lists.openembedded.org
References: <mtcyc6sh3ncw36xq2ngxwfzqjo4jwakclrwsitncnjxeb3nke4@czy7r2g73dwr>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <mtcyc6sh3ncw36xq2ngxwfzqjo4jwakclrwsitncnjxeb3nke4@czy7r2g73dwr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 10:49:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119257

On 9/1/25 13:24, Jörg Sommer via lists.yoctoproject.org wrote:
> Hi,
>
> there are some patches for Kirkstone on the mailing list openembedded-devel,
> but no updates of the Git branch at
> https://git.openembedded.org/meta-openembedded/log/?h=kirkstone, since
> 7 weeks. Is a push missing?

I'm merely guessing - probably Armin (the maintainer of the branch) is
on holiday?

>
> Kind regards, Jörg
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#65809): https://lists.yoctoproject.org/g/yocto/message/65809
> Mute This Topic: https://lists.yoctoproject.org/mt/115004774/6084445
> Group Owner: yocto+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/yocto/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


