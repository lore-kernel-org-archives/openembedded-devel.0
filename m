Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3058C83F0A
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 18:40:26 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.4617.1752086417887405127
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 11:40:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E92F9LrP;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6070293103cso185894a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 11:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752086416; x=1752691216; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IGaTFOW8kMzDfZ21YoS8JUOAYhMXEFWQVUlRO078LoY=;
        b=E92F9LrPFMlkT9xseSQAqo8pcsET6kWXOC52eaetN1tdRYusG6tqTCLm4L0x07VYg2
         1/A6bqzWKbWao5M7NWw/3Xx/HiDxLFVfwn7HTKoDPnz51JJGMB+5BhCWYc3glloC2t2o
         TdUQGdKh/MDGYtMss+9RC64Q2iYegy6tzHy6jSW98RtgoEDYLKHmZema1ekvTlSQp08f
         jgRfWFeOKy27ZppSJEgpPjTpAsl/Zb5TSfFo1BWZA4yLgAnxG5RH/3Gpq+T/gPTzJTDk
         7oaDtOvjqXFApLuZRziWAkSEZSWi2lRFkjygIm0jmxp5G8+vhKHZ4CEiv3z6Rhz9HTd6
         nIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752086416; x=1752691216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IGaTFOW8kMzDfZ21YoS8JUOAYhMXEFWQVUlRO078LoY=;
        b=f8SK6zrNbaAZRuA/FlAx6cpqMi2X4OqaZfrmize0Gu2SaHz/Hk4/ah834ZB3R8iWSb
         hqMWWj8iigOrhxz0beFEU0kInf7jPJVe1sXFk+pXNJ6iOVbr+HNQmpNOLv1+fYLQddp4
         pXDPuiHITtaafcZZn0rZBURN8XrbMpg992KJZtivJDtSqa0trODJno3L4xApCAJhWGux
         mZMUGMnWhL8/qfJMMOD8k77hBdYWGPEzWOkWRMh2c0xEUdWhXMVenTV7NrT/+dFVCAuC
         ARm/Fe0E8Nl/ipW3KRiEYpyUjo8A6C5G3LaDxqWCv+RxEZoPg++0CiE/3lTvhnw5qItm
         VF1A==
X-Forwarded-Encrypted: i=1; AJvYcCUhH+jgH6yzEopNa5pSLcRMDlDXzwh1GhzBwzgz5IJB0W8eMmnSioyayEAievaH3FWLf/Iy3ZyFkwflHXDF2HdbP4Y=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwbWxV7nsOfPfC09zOY/8qDi3QYEViAanGL07bhnMvmT9zbAm7+
	ySXAtvzlNvEHmgbO+P34cxsht7Hz0iRPZEe9ZSYbYyQW19thef0IBDrx
X-Gm-Gg: ASbGncush6HMyum1RoNzqiJ+UkyQz4TtnJKFpAw3xHbunQoGi+jb/gzCZC/olHhP0m1
	H7aFvWZOxyVHJHd9HR3Nk3nF/HU3vCuisArQ4U9TP7cYwh0w4re2OH9TvYVImXsr/na2hZdTuOi
	+Gjh4Gmsvz0BPNL8SkcJaumY9T1iD6R/YD8oHOq4VwNdSh2WB7sEpupLGSijBo4ZqvaOFh5Ybxu
	JverX7ooQhbEeqNW0VnhVMOorgeemjSlKbbECV0mthAErGh/pGDOSRg+cIo6JZs3KIwwZWBOXiK
	Y4Zs8fmphnrid2ML25AwNMH4B5Gmk1SGigKIHxYF2pVsKhXROutdld5qgEaV93Dm+e86fBFZz0X
	QyQyB
X-Google-Smtp-Source: AGHT+IE1aoXFhXGSr0fxWZOxvgbUutyOn32Kf3yRMCceyqpvdkYuk4flRjEZv9acbwrkRIVLke6kqw==
X-Received: by 2002:aa7:c1c6:0:b0:60c:62f5:cd28 with SMTP id 4fb4d7f45d1cf-611c1671925mr532446a12.20.1752086415956;
        Wed, 09 Jul 2025 11:40:15 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fca66410bsm9124147a12.1.2025.07.09.11.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 11:40:15 -0700 (PDT)
Message-ID: <30257974-3016-4a87-9682-6528c153650d@gmail.com>
Date: Wed, 9 Jul 2025 20:40:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-openembedded][PATCH 06/20] p8platform: Add patch for
 CMake 4+ compatibility
To: alperyasinak1@gmail.com, openembedded-devel@lists.openembedded.org
References: <20250709173054.605430-1-alperyasinak1@gmail.com>
 <20250709173054.605430-6-alperyasinak1@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250709173054.605430-6-alperyasinak1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 18:40:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118378

On 7/9/25 19:30, Alper Ak via lists.openembedded.org wrote:
> --- a/meta-oe/recipes-extended/p8platform/p8platform_git.bb
> +++ b/meta-oe/recipes-extended/p8platform/p8platform_git.bb
> @@ -6,9 +6,10 @@ LIC_FILES_CHKSUM = "file://src/os.h;md5=752555fa94e82005d45fd201fee5bd33"
>  
>  PV = "2.1.0.1+git"
>  
> -SRC_URI = "git://github.com/Pulse-Eight/platform.git;branch=master;protocol=https"
> -SRCREV = "a7cd0d5780ed80a4e70480d1650749f29e8a1fb2"
> +SRC_URI = "git://github.com/Pulse-Eight/platform.git;branch=master;protocol=https \
> +        file://0001-allow-build-with-cmake-4.patch"
>  
> +SRCREV = "a7cd0d5780ed80a4e70480d1650749f29e8a1fb2"
>  
>
This is also 5 years old revision - but this project seems to be fairly
slowly moving nowadays. There weren't too many commits since - maybe it
could be just bumped to the latest revision instead of a patch?

