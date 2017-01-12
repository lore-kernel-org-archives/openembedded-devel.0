Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 54C916B6EA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2017 19:08:06 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id c85so33196100wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2017 11:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=m5IxKBkSdB8TaXcR3BD9uqpvjVnKHV7pr/2FUgfBJas=;
	b=Ik46Y/68ehKBGoQmaCpA3q7Yh4PdnsUfz6/NVNxx/zg1MAWLzkZhVgFUHiSDQNaqzH
	K6+uyk5h/3w8+y2xd1BT4LBV3fkh5u7p16uT6jdcoihBrqvIveoHW7KmEZwSBfA9dk8f
	HibczTyGd6XXGdKhGnILSyPNOxosjDEUiqMiAx9ENJmVDe3Jpqf4ZXidTjqsrk04E3o3
	LK4xU5TcnyHwFBfUAaXAUXIyK25qMq6Ouh9yD3WqNpZWzZAimQEPIX2BfLWeoaPqKiNy
	9ygdGSs5ARmb3MDFRD+t0d8V1c0Sn6rid4fsfuzbpGl18BsjD5uhJ1sNFCKuSUdVYKoP
	NWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=m5IxKBkSdB8TaXcR3BD9uqpvjVnKHV7pr/2FUgfBJas=;
	b=KmL85AqGF4Qd+TXAnJ3YIbMcOeMtiWhYK5flStiDLIovbHCC8oF34/GYMIIxKeLkIV
	2C7cqdt0pihk7ewwe5txKkoc+g9URVpd0xs435UY5/DWDmEoxmw01iBssSDLXhjhQMtw
	zfxgZw986zXQ4YgQNUK8DOuyYfxFezBOrk6M2UG4agLSfK3HCA7Ju5IMDfzwxrcXVRqC
	VC5AvyJjGMZJVvIkKnCOqxVrbUDZjjLmQeB79GjxpA6DbYF9pgqy9a2Z0ToquRhoshV8
	qn7viU+u4hKcrQV7zHo1CC/beuEGzUwpdaAtcHzdFoCkmaZZBt2T1FyFcTrZviDHUwfY
	fUtA==
X-Gm-Message-State: AIkVDXLPOpg7pWyLbw7JBZRj/xxsFD46uy17NJhEPng4QlBjByXMjWaKnTn3tEKN9aDwSZ9tGNSf+wYwFRv6oA==
X-Received: by 10.28.184.133 with SMTP id i127mr157562wmf.49.1484248086727;
	Thu, 12 Jan 2017 11:08:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Thu, 12 Jan 2017 11:08:06 -0800 (PST)
In-Reply-To: <d4475f50-e24b-6326-6f4c-c7fd21155e6d@gmail.com>
References: <1481809716-24451-1-git-send-email-samuli.piippo@qt.io>
	<d4453d09-2112-0a1e-2812-0c63c932ca6a@gmail.com>
	<20161220143047.GF3275@jama>
	<2c948f51-9a0d-e74d-e5bc-1bf581530c4e@gmail.com>
	<20161220150507.GH3275@jama>
	<bc4be429-a64c-ba6d-163b-79c791fa7dfe@gmail.com>
	<20170102184751.GC3954@jama>
	<CABXoSoUXF7y7w76bH7pWZa6oPwXzOtcSKeyRhoy-dHWQqb+ikQ@mail.gmail.com>
	<d4475f50-e24b-6326-6f4c-c7fd21155e6d@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 12 Jan 2017 20:08:06 +0100
Message-ID: <CA+chaQfEh=VfEvF_1HAZJinRC+ddsvYHC+X=jf46J2_STd4VKg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][PATCH v4] Upgrade to Qt 5.8
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
X-List-Received-Date: Thu, 12 Jan 2017 19:08:08 -0000
Content-Type: text/plain; charset=UTF-8

v5 is fine, will you also include the fix for qtwebengine on qemux86?

Thanks

On Thu, Jan 12, 2017 at 12:20 PM, Samuli Piippo <samuli.piippo@gmail.com>
wrote:

> The release date for Qt 5.8.0 is fast approaching (current target 17th of
> January).
> Would you prefer a v5 patch of this one or a new patch on top of v4?
>
> -samuli
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

