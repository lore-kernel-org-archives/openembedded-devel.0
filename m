Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B36C54E67
	for <webhook@archiver.kernel.org>; Sun, 17 Mar 2024 16:22:47 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.22153.1710692560861557747
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Mar 2024 09:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=PRJJNAfg;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 3D3B287D7C;
	Sun, 17 Mar 2024 17:22:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710692558;
	bh=ySzQSinTOjeFzGRrMRY1eOD9j1DOeUaEclo7TD4Ibf0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PRJJNAfgAn2/x8H9VQwy8fkT1i/f0jMpWepwdkbJELIN/C8CkYNfTa7wvUVqyDzvt
	 Pc2516WmKAv6BFD+z7w4vre+usWuVOYkCXxnUspyrZO/MZ0bFdBx87+8hpENZjJljn
	 Zpd3UAzlGN/9C/Pnd55s0Ng9ZDAnbcBg2wF3VB3LPvasJu1CWy9tKq5FDkj1UAknID
	 4m1YXQQVh6O0LEmZEYtMa/dK+GlaPjkNc6728tmQo58cJZDNRpW8nNqd2K7J38nGsF
	 A2ueUNNsSMrRo+L9ddzf7a7GkvvH9louK3ujGZosss4AeJKSlzaiqQKyQZCQnXCCbL
	 /OtVTZcDvISNQ==
Message-ID: <cbb4d19a-48de-46cc-993b-794ab2c2a583@denx.de>
Date: Sun, 17 Mar 2024 17:02:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v4 6/7] lvgl: fix libdrm include
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Christophe Chapuis <chris.chapuis@gmail.com>,
 openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
 Fabio Estevam <festevam@denx.de>
References: <20240316100056.409758-1-chris.chapuis@gmail.com>
 <20240316100056.409758-6-chris.chapuis@gmail.com>
 <6a591af2-3a00-468d-b9d7-1ff0368b5065@denx.de>
 <CACA7eUS-t+wCoW2Pv8P4CFAhp3LzZnRNU7ytQAGN7=xuTwmAxg@mail.gmail.com>
 <0bd7c695-e03d-4845-9172-54a574630705@denx.de>
 <CA+chaQdg+Qz2RVBS3jc16=WhNPBzRGEcV2RURzOcuFJTuTfjJw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CA+chaQdg+Qz2RVBS3jc16=WhNPBzRGEcV2RURzOcuFJTuTfjJw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Mar 2024 16:22:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109378

On 3/17/24 8:46 AM, Martin Jansa wrote:
> The extra -I flag won't harm even when libdrm isn't there.
> 
> lvgl-demo-fb also doesn't do it conditionally based on drm PACKAGECONFIG.
> 
> If someone want's to fix this properly then should also use pkg-config
> (and tests/FindLibDRM.cmake in the lvgl repo), but lets not block this
> fix based on that.

The CMake fix is already being worked on upstream.

For completeness:

Reviewed-by: Marek Vasut <marex@denx.de>

