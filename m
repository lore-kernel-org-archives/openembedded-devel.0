Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2793B77070
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 21:20:56 +0000 (UTC)
Received: by igxx6 with SMTP id x6so1059001igx.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:20:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=/am4GbQ77oxi5pyElgDcUUyeM+ot5u2ao1sAb8ORB4c=;
	b=Yt9TZrl3Kcw+KgglUEkxYqPa/UqVIp0vXFApnFHEVCT6Zegx7BvkDmJpGXfFQl6ZTC
	csoGwZ2mv17w0JpgjNbpuiyBSVwy2EuEKVCtgS4ulxq1StCVZxVHYsARBZ76vJFzYtRW
	M9urtfLN2ABl6DTjk3WdghFnhYABVRZDs5QlyRihp6/9R+HYYSYNfeXlFYT4lwMMqA6G
	BqKqD3cu7MKCw/WNzdFYrawJD960cByWBR2kBKxj50krmQq3A1bdL57iGA4FI+ZYftyP
	RYQSISkQUYwwMcppF/Md9+oSMxhWiZz1Mes3jqSxIPMzrzqvZGPet1JAEpLm7H717R/d
	V4Yw==
X-Gm-Message-State: ALoCoQloQWbpCu231nC2EEAuQ0dlEKwZAdKlAp2m9qKpX18LOhg3DwQd8OXdR/0BAQNFrIqpkMTU
X-Received: by 10.50.78.231 with SMTP id e7mr7804170igx.88.1443648056818;
	Wed, 30 Sep 2015 14:20:56 -0700 (PDT)
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com.
	[209.85.213.173]) by smtp.gmail.com with ESMTPSA id
	v10sm13764378igh.12.2015.09.30.14.20.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Sep 2015 14:20:55 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igbkq10 with SMTP id kq10so3553528igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:20:54 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.43.225 with SMTP id z1mr28363909igl.19.1443648054984;
	Wed, 30 Sep 2015 14:20:54 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Wed, 30 Sep 2015 14:20:54 -0700 (PDT)
In-Reply-To: <B399646F8CA055479BEC55F6B065A04A370ABB95@FMSMSX108.amr.corp.intel.com>
References: <1440032144-18482-1-git-send-email-vinay.k.awasthi@intel.com>
	<B399646F8CA055479BEC55F6B065A04A370ABB95@FMSMSX108.amr.corp.intel.com>
Date: Wed, 30 Sep 2015 18:20:54 -0300
Message-ID: <CAP9ODKrVXpZ-ZhZ=1SjAdqtrOpD=XO1DJaruGef4OyhT-uDd1w@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
	"mario@ossystems.com.br" <mario@ossystems.com.br>
Subject: Re: [meta-java][PATCH] OpenJDK-8: For x86 and ARM
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
X-List-Received-Date: Wed, 30 Sep 2015 21:21:01 -0000
Content-Type: text/plain; charset=UTF-8

Hello Vinay,

On Wed, Sep 30, 2015 at 6:15 PM, Awasthi, Vinay K
<vinay.k.awasthi@intel.com> wrote:
> Any update on when openjdk-8 is going to be part of meta-java? It has been over a month..

Jens has prepared the patches and it has the ARM side fixed as well.

Is it possible for you to take a look at his changes and see if those
work for you?

* https://github.com/rehsack/poky/tree/master
* https://github.com/rehsack/meta-openembedded/tree/master
* https://github.com/rehsack/meta-fsl-arm/tree/master
* https://github.com/rehsack/meta-java/tree/master

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

