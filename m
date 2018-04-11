Return-Path: <andre.draszik@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5D5A37468E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2018 14:46:05 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id s78so2079484qkl.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2018 07:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZhzRGFXQ+ZFAzOnkmlpJgk2lCXAc1iJg2+XGLwxhJeM=;
	b=foDfvkD9g2AYx14u+JF9+zR682gfUymlhxTMgKwroby1GUM8OzWs+uBpmTQal45DCR
	du5brEcoSSlpxjHBkxw78LWa11XD2LjlD3UHOUJw/Ek0kn8C2CMjJbjeDcCCQPZTS5UI
	IgRIEc8Z6gAdC0XS3HGkzPTQaKWHADU+Vjo+5ofG5Dyg2xCUHf0GkE5e3Y2PMf6Ml9Xv
	34WSaI7CT7k/sva/OXYjQlU+cONS9pTmi0aT1icaO8C/Vw6FKP5e0+0+emFegah+Ch+t
	SPs8+04IUllOUCtT3BdcmFt4qCMZFN/bwZQ8E2xiGQ8+D6kyBiNfXpBFIblO7SEJWS4J
	lPPw==
X-Gm-Message-State: ALQs6tCn+d98DDvUi5TllWiN1+Hp9M03M4JC05H0MP52zDMnWcTiv9h0
	pE+4rPXac+aXupFHGe+ZK5jC8Iwm
X-Google-Smtp-Source: AIpwx4+x/no/ZPOn2rFYmUBFiT3YVez5hEUkL4eaIpBypJx/AETH98zL4Rqq+fMNP7yQjZr8DVoBrw==
X-Received: by 10.55.103.215 with SMTP id b206mr7448288qkc.121.1523457965864; 
	Wed, 11 Apr 2018 07:46:05 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 65sm647697qkd.96.2018.04.11.07.46.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 11 Apr 2018 07:46:04 -0700 (PDT)
Message-ID: <1523457962.28224.4.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Apr 2018 15:46:02 +0100
In-Reply-To: <a6679828db8c4b3c8e43e4d4ad842bea@assaabloy.com>
References: <a6679828db8c4b3c8e43e4d4ad842bea@assaabloy.com>
X-Mailer: Evolution 3.26.5-1 
Mime-Version: 1.0
Subject: Re: opnejdk from meta-java for aarm64 ?
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
X-List-Received-Date: Wed, 11 Apr 2018 14:46:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2018-04-09 at 08:22 +0000, Szczypta, Marek wrote:
> Hi ,
> 
> I tried to compile the openjdk from meta-java layer for ﻿aarm64  . The
> master branch claims that is should work for u161b15 . But after I set up
> the build it tries to build u162b12 for which it fail as there is no
> support for aarm64 . Do you know if this is working ? or how to set up it
> up correctly so I can use the u161b15 ? I found there is 162b12.bb file
> but no 161b15 only openjdk-8_16xbyy.bb ?

Are you sure you've checked out the correct commit? What commit (SHA1) are
you using?

Have a look here:

https://git.yoctoproject.org/cgit/cgit.cgi/meta-java/tree/recipes-core/openjdk

There is no 162b12.bb file, instead there are openjdk-8_16xbyy.bb and
openjre-8_16xbyy.bb. Inside each of these two recipes, PV is set based on
the architecture:

PV = "162b12"
PV_aarch64 = "161b15"

and the appropriate .inc file included.


Cheers,
Andre'


