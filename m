Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 5F3287C99C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2019 16:29:15 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gw8Gh-00074C-W6; Tue, 19 Feb 2019 17:29:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TMQafMKzrgg2UvgznZHmrXZjtvzFGdJ3yLAT+4X3p5E=;
	b=JwocxYEGdcd1O5MAENQ64tYvd3
	mxd8+4oPiyjsKMyz7AtYxXEWx+vqQwWoDuL0yUqemV13bfNOgrxZYSbR8CxAe5G8OtZh1fdGPSV7I
	yYnuBJD6+gi8t+96pWQUCQnF6BxDMdtxIoqOgRPmzR+kKXF6R1Vy8qZCfjZIV6LZuiBxs8Bp54iP3
	xBE1QHZnHdilism29kV2ljtlcLQ0x7nNX7YQ+nQLXMfSquM1/4P/jPTpXPRZQC6y3wAdz9QH4MVVj
	BCw1cYKb7/+LfxRfIke+emb46l8gaEMUeAfGWM4nDfuwhJdhYC4bdfxVGn+IbLCfTjAlq/OYtdIL8
	RA7R9OGw==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <zboszor@pr.hu>)
	id 1gw8Gd-0001TN-W9; Tue, 19 Feb 2019 17:29:13 +0100
To: Khem Raj <raj.khem@gmail.com>
References: <20190216170354.10645-1-zboszor@pr.hu>
	<20190218104704.14623-1-zboszor@pr.hu>
	<CAMKF1spwdGaXKr51oZM-g5Pmw8jNsUQLOs=DRsOfD3pYfAYRZg@mail.gmail.com>
	<363273c6-90b7-ac3d-779b-8a35ac7ebfc5@pr.hu>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Message-ID: <e7805411-1740-47f9-522a-f88fea06c31c@pr.hu>
Date: Tue, 19 Feb 2019 17:29:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <363273c6-90b7-ac3d-779b-8a35ac7ebfc5@pr.hu>
X-Spam-Score: -1.3 (-)
X-Scan-Signature: d715e2383c66dfab752a5ffb3bca881e
X-Spam-Tracer: backend.mail.pr.hu -1.3 20190219162913Z
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH 0/6 v2] Run dracut from rootfs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Feb 2019 16:29:15 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Ping.

2019. 02. 19. 9:16 keltezéssel, Böszörményi Zoltán via Openembedded-devel írta:
> 2019. 02. 19. 8:01 keltezéssel, Khem Raj írta:
>> https://errors.yoctoproject.org/Errors/Details/228793/
> 
> Since the log.do_rootfs is not too verbose, can you please share
> the contents of ${WORKDIR}/intercept_scripts*/execute_dracut ?
> 
> Or just grep for DRACUT_TMPDIR in that script.
> 
> This variable should be passed from dracut.bbclass and
> the same set of scripts do work under Yocto 2.5.
> 
> Thanks.
> 
>>
>> On Mon, Feb 18, 2019 at 2:47 AM Böszörményi Zoltán <zboszor@pr.hu> wrote:
>>>
>>> This patchset adds the necessary pieces to create the initramfs
>>> with dracut during do_rootfs.
>>>
>>> The 6th patch references a GitHub branch for which a pull request
>>> was made against dracut. See https://github.com/dracutdevs/dracut/pull/535
>>>
>>> Best regards,
>>> Zoltán Böszörményi
>>>
>>>
>>
> 


