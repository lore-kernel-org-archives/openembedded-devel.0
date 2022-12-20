Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA04C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 15:08:03 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.52231.1671548875490288384
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 07:07:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JbSnnvA5;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-381662c78a9so172626017b3.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 07:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nKzM28bNq+FJxRNiylk2knv4TtjwNhFdpz7ZPLigdn8=;
        b=JbSnnvA5iKsUEp9n0Ggrk2DCThfQYwrIJAXuBFA7JsCANhufSKsv7o1TrRAps1Cctd
         p+wjlNzAXfdfTBxvFPSifv8QJzzMW132TMR0tF9NFtI9Rxso6vaTGGiIrI/dSGcQmDbs
         uIrhEwW/zpUKLoBChmnFcXClPj36IjflohUNmSzL5CBfx3UyZUR8HY5YG6hEAd+y422c
         TqM7X+2J7y0sZ7ryH1PkeFZr5nScypr3f67a6rjlUEegRpeU6c5Cw49D4ykgQgd7ahOk
         PIoRsjI+elL/Jj/9l6awgQo2UDtUufiZrk87mttX8p7LOsXj1dGAjSR0FsxHUhe8FYfx
         gQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nKzM28bNq+FJxRNiylk2knv4TtjwNhFdpz7ZPLigdn8=;
        b=FDAkXhcDr+N0IK29y5go6oFNwnRHnEW6ew4LbY+9sCez2IT0aQmJFcAvArGH0VPdx0
         o1EKbHby8CoZimlhas0iMWcZ2Ki6y1hDJgjFsLW2f3ykQcTYhfibzDTf9RkuJjzLEICj
         kVmugqlGcTBAjehqmSPtCbaxY+e483QN8NVH2/V8G7wZqxU86lWUA9oTARtkD+IZ2vgG
         H+OzsD7cslXHevwfGZa+nKFZz7VfT3NlPNuwHY0ufxsEhZM77NSOQivMzk3tS83LXRFl
         t/BCD/xM6H43hYgV/LiaoAu6C/l1a+ad5RNEVNp2uBrdjRdQVs/utBets0oBY4K0HZdR
         +GRg==
X-Gm-Message-State: ANoB5plqIJHNJPmnQDUubQ6XEzGmY8qqVIKdV0kGbxLlg1bqMC2TA0Nz
	jO61Dvlaz/cXEIcRstY1qK0=
X-Google-Smtp-Source: AA0mqf6zu76QzRZErkkpw0WOcokfdbLa6FKDNyoVYmWuju7UdlY6DoCy+cSuBmQcpSISgXl9sP76cw==
X-Received: by 2002:a05:7500:5e05:b0:e4:a7eb:d994 with SMTP id fe5-20020a0575005e0500b000e4a7ebd994mr4232984gab.23.1671548874431;
        Tue, 20 Dec 2022 07:07:54 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:9fde:e2bd:d2b4:8a4b? ([2600:1700:9190:ba10:9fde:e2bd:d2b4:8a4b])
        by smtp.gmail.com with ESMTPSA id h4-20020a05620a284400b006fef61300fesm9150130qkp.16.2022.12.20.07.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 07:07:53 -0800 (PST)
Message-ID: <ae0b1740-e9d5-cd17-2cd3-2ddfd15eea23@gmail.com>
Date: Tue, 20 Dec 2022 10:07:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-oe][dunfell][PATCH] yaml-cpp: dunfell backport
Content-Language: en-US
To: Roger Knecht <roger@norberthealth.com>,
 openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, Justin Bronder <jsbronder@cold-front.org>
References: <20221213132244.22529-1-roger@norberthealth.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20221213132244.22529-1-roger@norberthealth.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 15:08:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100155



On 12/13/22 8:22 AM, Roger Knecht wrote:
> Backport yaml-cpp 0.7.0 to Dunfell
>
> Signed-off-by: Roger Knecht <roger@norberthealth.com>

What is this fixing in Dunfell?  Adding new packages is outside the 
scope of our stable branch maint process.

-armin
> ---
>   .../recipes-support/yaml-cpp/yaml-cpp_0.7.0.bb  | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>   create mode 100644 meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.7.0.bb
>
> diff --git a/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.7.0.bb b/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.7.0.bb
> new file mode 100644
> index 000000000..d3984abe8
> --- /dev/null
> +++ b/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.7.0.bb
> @@ -0,0 +1,17 @@
> +SUMMARY = "yaml-cpp parser and emitter library"
> +DESCRIPTION = "yaml-cpp is a YAML parser and emitter in C++ matching the YAML 1.2 spec."
> +HOMEPAGE = "https://github.com/jbeder/yaml-cpp"
> +SECTION = "devel"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=6a8aaf0595c2efc1a9c2e0913e9c1a2c"
> +
> +# yaml-cpp releases are stored as archive files in github.
> +# download the exact revision of release
> +SRC_URI = "git://github.com/jbeder/yaml-cpp.git;branch=master;protocol=https"
> +SRCREV = "0579ae3d976091d7d664aa9d2527e0d0cff25763"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE = "-DYAML_CPP_BUILD_TESTS=OFF -DYAML_BUILD_SHARED_LIBS=ON -DYAML_CPP_BUILD_TOOLS=OFF"


