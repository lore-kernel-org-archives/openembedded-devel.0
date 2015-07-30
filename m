Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id D4B50763BF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jul 2015 11:31:12 +0000 (UTC)
Received: by pdbbh15 with SMTP id bh15so23035835pdb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jul 2015 04:31:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=quPUr0Aj6BxMnSkou77Vwb8KuhgqJwR2csbnjh/Yd0I=;
	b=Ir6bZ/2J1qUJQgVXzCQGFM0tMc64PfR10DVT43Wf4yE8UjtxV2jNszNpzZ0ejnh/eI
	qbPa9JT1X3N53aw887liElAbF4FcjvkVVGn2GakcW/cJjuTfpea/s7zbGkl856sHFnx6
	ldSFv1TzBixyfolKXHdY2PcYIQ/TVQYwA67fksYnm68T78cMhNufReGQfjtlpUR3AW7x
	d1XKonXJyVl1sAvxrnChPWJaF+ca2+rncafn1/QJ6XKrS5Bw0HhATHZCEA7wklsAwWkS
	S/97blffWchJcnTzKwqqPIbX+VSEbZFRm7RdFUH5Ip/ZHtx51n23LaCm0E0nauUZ5Qa/
	cIBQ==
X-Gm-Message-State: ALoCoQnAw6wRRPCCGpQ65Dshvcai/8M2ooHs6G2GmCk8MGN4duc+u8ndk7XUyjizeuOA7BnbV41m
X-Received: by 10.70.119.73 with SMTP id ks9mr106289758pdb.131.1438255872748; 
	Thu, 30 Jul 2015 04:31:12 -0700 (PDT)
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com.
	[209.85.220.43])
	by smtp.gmail.com with ESMTPSA id mk6sm1761848pab.9.2015.07.30.04.31.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jul 2015 04:31:12 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pacan13 with SMTP id an13so22680959pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jul 2015 04:31:09 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.101.9 with SMTP id fc9mr103998061pab.37.1438255869936;
	Thu, 30 Jul 2015 04:31:09 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Thu, 30 Jul 2015 04:31:09 -0700 (PDT)
In-Reply-To: <BN1PR0301MB069278CF0FD9001040934E9AF78B0@BN1PR0301MB0692.namprd03.prod.outlook.com>
References: <BN1PR0301MB069278CF0FD9001040934E9AF78B0@BN1PR0301MB0692.namprd03.prod.outlook.com>
Date: Thu, 30 Jul 2015 08:31:09 -0300
Message-ID: <CAP9ODKp_fYFw2dw0D45zTkjUdUx0b0HNnk6gwBbattePK+F09Q@mail.gmail.com>
To: Yu Zongchun <Zongchun.Yu@freescale.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: Require backport one patch to fido branch of meta-openembedded
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jul 2015 11:31:13 -0000
Content-Type: text/plain; charset=UTF-8

Hello Zongchun,

On Thu, Jul 30, 2015 at 6:54 AM, Yu Zongchun <Zongchun.Yu@freescale.com> wrote:
> Can you help to port the following patch to fido branch of
> meta-openembedded?
>
> http://cgit.openembedded.org/meta-openembedded/commit/meta-networking/recipes-support/netcat?id=05da3468b8df55cb0757e8191e42b461a4f706b7

Sure. It does makes sense to backport.

Martin please queue this for next commit; I can prepare a branch if you prefer.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

