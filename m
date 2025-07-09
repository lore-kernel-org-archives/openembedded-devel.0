Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB4AAC83F03
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 18:22:06 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.4203.1752085319767099078
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 11:22:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TMz56Z/7;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae0d7b32322so18140366b.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 11:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752085318; x=1752690118; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ipq3/qURNySMn6XMd9U390DVtXuGhzSJClaiwkEdm8M=;
        b=TMz56Z/700rtnMyBXJGWgkmZy7GlC4JBayWZRhkrhpcv2tOhoL9Tq1c97z7Vn2EoZt
         Tfv/6Y3wg7t4TUahRULO915LNOlbYdKlaCaPIojHR5dSUtqu/RbizuLmYy7q8ZRQkDoi
         l63PLffHIQCGDIxd3Y8Xi1s8CR1UtygpQkDd6T/0NF6tpZfuM9D1gc+iWaLQACpF3axt
         TYUJLuhz9fKvEkpMv+mZQMB2s/5X0/ObA+2JV77c4L2J8wWjHDFjyTHeGQdCGIwytiP7
         mqeOY2+INBz9b7OUTb8ak808qQCFUBP2iUlLiOcnDC/lQsBryOJ8rM9avfJJP0Y09V95
         GpCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752085318; x=1752690118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ipq3/qURNySMn6XMd9U390DVtXuGhzSJClaiwkEdm8M=;
        b=D10eKrfNS7VnrijgQdddpag2dsOr8mxbZegw3ylBvzcX4VITcsPkf09H5w9TWSNDe+
         5ffZ/J+RUcso94K9vx/4AU6fV8E721XKbmDkGQD5Fdyr3j+34ZaKCRra733qFSIGuFwY
         WWYKStwBG5Ce4hh7zlhscUAUWcGyQWoe7kUbfSyjuyjzjFACPi4K2t3y41tOBWswlwJV
         YNMrcfbIucSUMdYQ4oVngzC1aMgGOzjba73SWdDoh0QEoWsv5z2OylwbE5b0mrdOYFYy
         KcSgnlpMVMAXgrDFipOUyuqXoJn2FGgFWcMvq35zSFJVgWFhAOqRkiyEIVlkyy7FjqcN
         M1Gw==
X-Forwarded-Encrypted: i=1; AJvYcCViFEqgMhyi50m4gbHgjbvWcor+nJPu1cbBL1QyqPctPFiTc5S5OTv6Szcccz/658AKXhYMqdqITGmG/GsaxZJxN+M=@lists.openembedded.org
X-Gm-Message-State: AOJu0YySu1NibQHs3i4b6y+mPziLZYNlU+SeZMxISKdufAQgD5l43HBm
	DXjmi7YTeG5nkLZAi66ek6whmgbtgW76ccM6Gs7s7rObCrhlL0psLzfK
X-Gm-Gg: ASbGncvdlq6jjoaoFc4CUw/UyIN74NZD3yx7SIVrnwB5LwZKT3fSMZYBDPDDOT61v7s
	SyKANichLc6dwj+4rvtF3kHycUyFqeG4RcAS98Ik8AOuipZVAVPC+MyaNa5JPvU4Kqk/hdw7r+p
	tJQlntWZ954OO55pcdD/N3J04cR/5xUmsNSLykReHGr8A/If3QlPYGYX9fABFMYDfBnyooqDFuj
	mH/RgcpHNdDYVd+d1SeT3n7ZSHElcvdU4yvLnzZOb93STifqXIMFiYp83bXBN9FCmrcGPWj1XRj
	OLRlxKp2yd2p5qWiNiuH/FH8g6rO8wrH7vJED8D33aljNbFIOfoQEsH/To1wVSdaw2U1+7UGZnG
	V7wqM
X-Google-Smtp-Source: AGHT+IHrATS7fQA0UIA5fpT+L1FPF2jJBGQkRIOCbqNIVIuaYGvULlHoVKxXkn4Sw9PzGN/XW1F6wQ==
X-Received: by 2002:a17:907:7fa5:b0:ae0:afb7:6060 with SMTP id a640c23a62f3a-ae6cf5c9665mr461000366b.19.1752085317656;
        Wed, 09 Jul 2025 11:21:57 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d93ffsm1145404166b.36.2025.07.09.11.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 11:21:57 -0700 (PDT)
Message-ID: <d9678565-9f1a-4fc3-a501-ee534b087fb1@gmail.com>
Date: Wed, 9 Jul 2025 20:21:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-openembedded][PATCH 16/20] cpputest: Add patch for
 CMake 4+ compatibility
To: alperyasinak1@gmail.com, openembedded-devel@lists.openembedded.org
References: <20250709173054.605430-1-alperyasinak1@gmail.com>
 <20250709173054.605430-16-alperyasinak1@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250709173054.605430-16-alperyasinak1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 18:22:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118376

On 7/9/25 19:30, Alper Ak via lists.openembedded.org wrote:
> --- a/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
> +++ b/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
> @@ -5,9 +5,10 @@ SECTION = "devel"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=ce5d5f1fe02bcd1343ced64a06fd4177"
>  
> -SRC_URI = "git://github.com/cpputest/cpputest.git;protocol=https;branch=master"
> -SRCREV = "67d2dfd41e13f09ff218aa08e2d35f1c32f032a1"
> +SRC_URI = "git://github.com/cpputest/cpputest.git;protocol=https;branch=master \
> +        file://0001-allow-build-with-cmake-4.patch"
>  
> +SRCREV = "67d2dfd41e13f09ff218aa08e2d35f1c32f032a1"
>  

Apparently this, 4.0 is the last tagged release of this application -
which is now over 5 years old. However it seems to be actively developed
ever since. Would it worth trying to switch to the latest git revision
(which has the cmake fix also), instead of patching? The developer
claims in https://github.com/cpputest/cpputest/issues/1651 that is the
revision survives their CI build, than it is considered "pretty stable",
just like the latest tag.

(If you are busy, that's fine, I can give it a test also later)

