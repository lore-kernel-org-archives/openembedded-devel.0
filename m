Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 81E037729C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Feb 2016 19:11:30 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id uo6so88308017pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Feb 2016 11:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=P2jSBfYkRTaTrR9LW8+UPSGikTJ8z4yK29r1MyJozz0=;
	b=iczmcn04HlYuZ97HwEaATlzI7SMzyQNoT76MIyA2jPU1DQsNx/rsJPehOywnIQc6Mi
	NoK1RrItithXBfh9eJ30cR05jnhsEM3gE5SsjM8vxu2exnrp99TiMJejUXVqRZvl32qD
	bKyKVgYTFi72YSAb1k3PsQJ6Au0MEHeEreMZaVulv2abzoTz076/44FOhRQOnpOHo52F
	WrB+I3SzvGd41YgfPMxv/3PXZCm5/vMERW0Vu0dIDX+25TT5C0mgku1KmLSyL+vBDQdj
	lHU8mPtvE3ra3U5ZLoh8KuVQDxUmmXf/Qje6nWlcK6GaEs148z2X8HmeV/ESwU/dAUYY
	qjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=P2jSBfYkRTaTrR9LW8+UPSGikTJ8z4yK29r1MyJozz0=;
	b=fH0SkfFFlLHm2/vHqnhsvn0gWYGMssAepjRNsYb+W3GDyL6XYmQ1U0PonK0u9AjFjE
	nlLZ31kFrL8Tvqwr/V1uA/R5jT77C6DbpuMcDkljUtdZmN+6Cx7y4CE6kYe8+0fNBDwc
	oNrxFJsd2pwfY6w3zZ3f9hhrQG+gFei+5gEmu+5+dAToPHQ+k4ixLRxgMdvbKQ+n4WDD
	vGDWqPJhsc3J3H/Ntec0262TC2O3PCfpRu0xps2Hs2T3G+56sFm9MXg2l8K1MH+3vmwo
	fiFX7dclSmiMgaeDVJeBzd2ydAQAPOMkfNGGCW7nyQcPieXdW6e7PQALKYaSkX39vOxD
	r0tw==
X-Gm-Message-State: AG10YOSyjSMi0BnTbvS2xCwaygtnpKGVXR5/zbpfcjYAnIKFB/lpZ7hT/To09+xPz1owUg==
X-Received: by 10.66.160.101 with SMTP id xj5mr15984922pab.153.1454353891992; 
	Mon, 01 Feb 2016 11:11:31 -0800 (PST)
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com.
	[209.85.192.175])
	by smtp.gmail.com with ESMTPSA id 20sm45031535pfa.5.2016.02.01.11.11.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Feb 2016 11:11:30 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f175.google.com with SMTP id n128so87865047pfn.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Feb 2016 11:11:30 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.67.149 with SMTP id l21mr40671451pfi.112.1454353890081;
	Mon, 01 Feb 2016 11:11:30 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Mon, 1 Feb 2016 11:11:30 -0800 (PST)
In-Reply-To: <1454350575-1028-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1454350575-1028-1-git-send-email-fabio.berton@ossystems.com.br>
Date: Mon, 1 Feb 2016 17:11:30 -0200
X-Gmail-Original-Message-ID: <CAP9ODKooA6wqEmGstiMnLP=0H-GU2Ys6oAbmMnjfpgMQWFtVXw@mail.gmail.com>
Message-ID: <CAP9ODKooA6wqEmGstiMnLP=0H-GU2Ys6oAbmMnjfpgMQWFtVXw@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Fabio Berton <fabio.berton@ossystems.com.br>
Subject: Re: [meta-python][PATCH] python-daemonize: Update to version 2.4.2
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
X-List-Received-Date: Mon, 01 Feb 2016 19:11:32 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 1, 2016 at 4:16 PM, Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>


Acked-by: Otavio Salvador <otavio@ossystems.com.br>



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

