Return-Path: <leo.yan@linaro.org>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7FD7160ADF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 09:03:31 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id c23so576763plz.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 01:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=93BQgj+TbSC8qCxEWK958gvId2Ywq+9HAx/TKBuq4oo=;
	b=br5RlnQQgIyjbDQcKccEDRLzIzid+Iws9myEmOBKcxbcgL6CCsroAJ4C/tpgQZ7uKT
	yBTZkLN9nffpJmmjYG52R9AALE6rYZUlA/J1uOvaoHbeQX4QtTjjRVNJVil4mS4zpzdY
	m6aukyEma0h6yD0ooKT4w5mTx9eeMFuIxNJ2m118HzXOT1Bj6L+9uN4yfQbuJudgI4uL
	pN6jNnlpbAiU3ndTNwJx8owmuw4CZ4ih5YdL4CKeKzc24UwgBJYgTqze4hr8k9d/c0aJ
	dxwC0DxyKZug/aAS58xPx5WHTlKHkuMngis8xL4D58/T5HXC2x1Nk3Sz0kCzN1e8voM6
	pg6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=93BQgj+TbSC8qCxEWK958gvId2Ywq+9HAx/TKBuq4oo=;
	b=HbCX4Wl8W4+fNs11dgprjZ7l82OOGvfys7lq8gUdKPBJRS8kdJ2oII/fTznVRRtmFc
	2lDe1SU0cGfQZ3aK2kLWpp5Tf4XyrowCwNkdupNzLBibnNEJ8zsekIIQhNbSb1TsraVf
	ePiP7bu6JRaeBGAeGhibVbl92+2Kk9HrW9kJkA5CdPBF4VoEIdvyjgmZNG4fHmyQzaZa
	lOv36kP8264WtZ/5mnai3PJP1C2CIHvH6g5RsMXmngY4sAGGIziAZB2UImwX/Ow3k0wI
	sJOi0Zhr1sKbpveriYiTaHx/r4Nlt9+zKgpep4U2SVcJsG40up9u0FDSWlc36DiGkRnN
	HxCw==
X-Gm-Message-State: APjAAAXU002XA7EBCMb3XndOHrTbvaWXMRDvtwczrzr31jo01M0eecYT
	78kI7D38ZS82qZ/LMwg7ZeAjjw==
X-Google-Smtp-Source: APXvYqwJ90VyCULr7DhNSxo79JRk0VLo8Pk/UXB4btp5ld1sTSCK8h45VPBHkmnJPW9ipYyBEF0vuQ==
X-Received: by 2002:a17:90b:3c9:: with SMTP id go9mr1922628pjb.7.1582275812324;
	Fri, 21 Feb 2020 01:03:32 -0800 (PST)
Received: from leoy-ThinkPad-X240s ([2400:8904::f03c:91ff:fe8a:bbb8])
	by smtp.gmail.com with ESMTPSA id
	w17sm2050003pfi.56.2020.02.21.01.03.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 21 Feb 2020 01:03:31 -0800 (PST)
Date: Fri, 21 Feb 2020 17:03:20 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200221090320.GA13327@leoy-ThinkPad-X240s>
References: <20200218052544.9467-1-leo.yan@linaro.org>
	<20200218052544.9467-2-leo.yan@linaro.org>
	<CAMKF1sordwdPV8=vvtakN4vb=MugUqY0f4k9P3ewpyR_9x63ZA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sordwdPV8=vvtakN4vb=MugUqY0f4k9P3ewpyR_9x63ZA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v1 1/4] Ply: Add recipe for git version
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
X-List-Received-Date: Fri, 21 Feb 2020 09:03:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Khem,

On Thu, Feb 20, 2020 at 07:41:35AM -0800, Khem Raj wrote:
> fails to build fot x86/musl
> http://errors.yoctoproject.org/Errors/Details/391871/

Ply doesn't support x86 and it supports x86_64.  Will fix the dependency
issue in the new patch with adding two lines:

COMPATIBLE_HOST_i586 = 'null'
COMPATIBLE_HOST_i686 = 'null'

Thanks a lot for the testing; will send new patch with addressing your
comments and test on qemux86 and qemux86_64.

Thanks,
Leo

