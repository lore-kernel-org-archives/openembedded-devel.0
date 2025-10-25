Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 370B1CCF9E3
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 14:41:56 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.6881.1761403306455378362
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Oct 2025 07:41:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hzJy2LMo;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42420c7de22so1521550f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 07:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761403305; x=1762008105; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wc75b/W0ETwgs4vhP44u8qZhc7C17rhSoRgbMe5wtzY=;
        b=hzJy2LMoOlNGUqNdhXFAygfN204J773qulEPkZGb8W+XgKF4ALdtKx60NrB3VWYWds
         MyEEdZjum/WG+YkoEzhz6SC39eXQTxpE52EJcsu99pylxlVxlJbvgobhpCdNlz3XqLg/
         mTLrQG9rhtRWQicMEqBvVqH+xO+LsdOx1tNRHb7gblVkn9/oxQrLfbgwBbaH4fj3W1h+
         Eg0wAYlCNAWcKxWjNyj+VGYCuBt/2buwccIRnxH4EZ5wetTDlL19avlXrCqHWjosqfB8
         pvyoid+TdhSLWZUJM81qFxXuzlmrQsQLq7v5BbF21qPCX091gwrd2BgbQnfGASFTD7Iv
         Z36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761403305; x=1762008105;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wc75b/W0ETwgs4vhP44u8qZhc7C17rhSoRgbMe5wtzY=;
        b=U5gzL8OLgd6E5cHaCd3xxDuKP8aEvAC3FNrcqWRQ9vHHBCESBCGfw23NGJ8mT1hN1e
         bO4mBsYkszjkfQgh54lsiQ68OUFts80Jo/do/rtR86JDEfAdhPVOhOVIosiEphyKxu/c
         JguxtQPfNTk+irc8ZOOB6LAtw6zn+A2ySt7UqirEXzrUbhBQ2VEXiEZnSNDORbsJwxDD
         2R1b72Wa6SzRWPcA5gSkBj2kJ/EW2JyewUWPtlD0tpw/5cfZ5a9HQLDWis4g60eDzfau
         kS/c37pAhRgUu3tMg5KgrubTUL9deggWJUFAg9Xq72iofnqzWpPJKqeLf9ME30eVAcfK
         8ozw==
X-Gm-Message-State: AOJu0Yy6ZfBWQQW4qo3P7+MBdmFN6g8Wux0IRzqVa8mVsZNH7KntpdGU
	PetsOrRnLsPi/QO27oqfD/0T3WsTIOUtDhUVRxHr/TcTpCESBdXz0SYnnfpSMQ==
X-Gm-Gg: ASbGnctc5XZ6sWMijdvkwi+UbU0i5pEK1K7nidx1VAxY5RvMjaTGaR1NtuQ22U0Z2jE
	NgXMtx1561dliwXG4xhT+NL4xLx/VZfY8Xt0jGzJaEUbbGFxD9L+pMWgGonu7OHlEPDFi+NeOPU
	goeKOLEDR4wqfxdiqLFugPgJEEw243XwGy2AaAbXgEnqDz5WXjE9soyqbl3wB9/vf+ckYOJTY9a
	Qq/uwlYUfGtUsfAwGnHhx31oGf7TbeBE+7LZxQg5I82Lu1qAsQxwES3adKfvr7fwUqoudZB0LTs
	osWpdDyVflfLf1H3u/Jq/7rPJDfyXeulwI6RvzbDj0h55b6IjOfUkAuS7LoOBsx7JTaMjH295X1
	0+lxWq+Ua1Le/4Mqo2IOlY5VAobK8YZfmOhzOQogJ2SRinS69jUfMR/8BQzt8j7gXoAUnMhnLz2
	F08V5H75oeZk2Q+oNwQQs=
X-Google-Smtp-Source: AGHT+IHpAux/kB3MUfneTJ97yg6jw+s8vCaJHsntyj9Uix/p156SKtDMvBeSD3A/dkMhLlzWoPI/hQ==
X-Received: by 2002:a05:6000:2507:b0:427:370:20a3 with SMTP id ffacd0b85a97d-42704d96174mr25208328f8f.38.1761403304595;
        Sat, 25 Oct 2025 07:41:44 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952ca569sm4006397f8f.12.2025.10.25.07.41.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Oct 2025 07:41:44 -0700 (PDT)
Message-ID: <6a90839e-0fe3-4b13-809f-1ec40f34c26a@gmail.com>
Date: Sat, 25 Oct 2025 16:41:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-perl][PATCH 1/5] libnet-dns-perl: upgrade 1.52 -> 1.53
To: openembedded-devel@lists.openembedded.org
References: <1871C22319F83E53.22537@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <1871C22319F83E53.22537@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 14:41:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121006

After this series there are 3 recipes remain the on the PTESTS_PROBLEMS
list in the meta-perl layer, which I don't intend to touch at this time:

libunix-statgrab: this doesn't compile on my machine (!?)

libhtml-parser-perl: I think this can be made working, but it requires
HTTP::Headers module, which in turn requires Clone module which in turn
requires B-COW module which in turn requires... and none of this is in
the standard layers. Eventually this should be fixed, because some of
the missing modules are also requirements of the main package.

libxml-libxml-perl: This is a problematic one: the module is not
compatible with the latest libxml[1], there haven't been any activity
for over a year, and the maintainer wants to give up the project,
looking for someone to take it over[2]. Possibly it should be removed or
disabled... the test failures are real for this recipe (after adding the
missing dependencies), and fixing doesn't look like a small patch.

Khem (and everyone rally, who wants to run some tests), if you could
check when you have time if the fixed tests work for you too, that would
be helpful. (Otherwise will check and try to fix)

[1]: https://github.com/shlomif/perl-XML-LibXML/issues/84
[2]: https://github.com/shlomif/perl-XML-LibXML/issues/91

