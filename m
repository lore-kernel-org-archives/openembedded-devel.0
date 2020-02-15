Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id C2F1B613DF;
	Sat, 15 Feb 2020 16:46:45 +0000 (UTC)
Received: from [192.168.1.17] (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr
	[193.250.66.88]) by koncepto.io (Postfix) with ESMTPSA id 0234060468;
	Sat, 15 Feb 2020 17:46:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1581785205;
	bh=AHXklK+nUsoFuq2FCL6YLKnrKkw+Yd/Y8GqPRNRgF28=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=e1vy2PMs+DGH9H4DLvWOc0QHNHQLy7KrVWu7ySROy8iVfKvCPZaqMNd83onC25DDn
	Xdfm4NN4OEu9bt2voEHAVV4QukKOwYNFBBjpJddMsvGfEcr+7x/vT+VwJ+m4CvUIqp
	GgSmdj8Fp8sDEtydbF39erNEjSPt5E7RkcO40nuVhKK1BLRSJ9acX0FSyPOdUo131H
	F086jnRDLFle9pR4cPxPov9IFBbTlgBN1KvMig6Sw5Tb3FePljSiqkBhEeoi829O7t
	dLnKyxZpVKXYrvlDUyvqa2E4RtfZFhFbCMDchw35MOE3AAM1Hqic+/LECRy9gta1FD
	WmWhGXuNlGgbg==
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <158176248670.31260.7654152103178704127@git.openembedded.org>
	<20200215102807.938B8232818@git.openembedded.org>
	<65fcf6fa-6f55-b082-52fb-6d8a8ce2ef3c@koncepto.io>
	<CA+chaQduoaTu7+dX13w2PbC_uf_CuSChyfRbF+DnhE23dkoTdA@mail.gmail.com>
From: Pierre-Jean Texier <pjtexier@koncepto.io>
Message-ID: <432947a2-e180-8799-c6dd-22aa89ba4e89@koncepto.io>
Date: Sat, 15 Feb 2020 17:46:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQduoaTu7+dX13w2PbC_uf_CuSChyfRbF+DnhE23dkoTdA@mail.gmail.com>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 11/18: busybox: Backport patches to support removal of __NR_clock_gettime
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
X-List-Received-Date: Sat, 15 Feb 2020 16:46:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Martin,

Le 15/02/2020 à 17:38, Martin Jansa a écrit :
> Isn't it caused by some other layer prepending some busybox patch causing
> this? Can you check with bitbake -e?
> 
> I'm not seeing this one in my builds (and I was just refreshing some of our
> webOS OSE patches to apply cleanly on 1.31.1)

You're indeed right :(, after a quick check, it seems the build failure
comes from the meta-riscv.

Thanks, and sorry for the noise.

Regards,
-- 
Pierre-Jean Texier
Embedded Linux Engineer
https://koncepto.io

