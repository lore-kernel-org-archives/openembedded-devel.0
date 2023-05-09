Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F5F1C77B7F
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 02:14:49 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.4045.1683598487490419415
 for <Openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 19:14:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=vHnZhplN;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 1CF5685FA5;
	Tue,  9 May 2023 04:14:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1683598485;
	bh=QUmNiZBKccgfv33qhsYMdNG8HLJ0PvzvUDaGK/pKvoc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vHnZhplNa1im2z8Dxv4fZNhkkckV6HP+r3FAw6QBQleQakMT9X5jUI8xRxjxNzq7I
	 40lyFNYH1aRiJoU6Oqse8gfhjdaPY4Ww6+UXAS53dtl3v7N75CfleqaUqG/WBWPgBe
	 Iiy5eTKJsO/kDxH6yEyOy4vaBK2G4yBmZVnQWZDl1oDdh1q33j9rGi76mmv3NBYIKd
	 rW4pLayKReQIs7lWvJ/1ZQLy3ZQfsNWSsjzfHhMf2NW9oLGkCJZWPFgOrsxMFY4fa9
	 b2FUqSiiMAVLQj/CNDycsZbFqNj4llVYbBoPaE4IM751CcWGNLO0aotAXTeGJDGWJX
	 p6snQ9kZbgjdg==
Message-ID: <24de8e79-dae8-f0c1-3a18-26d85a12a904@denx.de>
Date: Tue, 9 May 2023 04:14:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [meta-oe][PATCH 2/3] lvgl: Reinstate git submodules in
 lvgl-demo-fb
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: Fabio Estevam <festevam@denx.de>, Martin Jansa <Martin.Jansa@gmail.com>,
 Openembedded-devel@lists.openembedded.org,
 Philippe Coval <philippe.coval@huawei.com>,
 Philippe Coval <philippe.coval.ext@huawei.com>
References: <20230509015915.77182-1-marex@denx.de>
 <20230509015915.77182-2-marex@denx.de>
 <CAMKF1srpymiiO36nnfAPgd-6J7ukysSfhqmBfgzd+wVTX9yQLQ@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMKF1srpymiiO36nnfAPgd-6J7ukysSfhqmBfgzd+wVTX9yQLQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 02:14:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102451

On 5/9/23 04:13, Khem Raj wrote:
> Are these patches on top of previous ones ?
> Or replacement ?

On top of previous ones.

Do you want a squashed V2 instead ?

