Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4891A7197B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2016 01:22:29 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id b186so641125vkb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 18:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=vjvPu4uvNAslzKdbKCfs1AoaELSp1bYBvtc3DiE/LkY=;
	b=MOIaSa+QDPnShsawJZQ5j14y+ZwOZJbcBLNmnTM3WTXOF5QFpHzw1acQWoFi3kPpxV
	a7DqYl9JBV+ISCJxUIo6M28mD0ZZQoZ8wwhCpz7x13PVVZjXVBoJ4uLzlbflDGDR3X6S
	1OvHmNNbOwvC1IaLMV8XRpRwVpYGLJ5aVvpfawYRLYZChcHmz9cniWJgX5yyDgBRGUYf
	Sl4MLzOdDEkOBoSKilIm/XAm2eVuwMKZ3HWS2XM9qrrYbP69YiaSnutpq/9BzBCNugtH
	/P87rzu8vOG3LC3Z0w2UVFU//rTlYQF/aIYyer0NmVxYg9XPkx78pbMzZ0G/rUCX0sYX
	sAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=vjvPu4uvNAslzKdbKCfs1AoaELSp1bYBvtc3DiE/LkY=;
	b=WPiKLTBIvPG2+Aa4tiBOtltI+hc2kAAojMRQlE++R2qktfgR8LbXDAJEyGbcncp9zZ
	g/VUW19DMMWVBvRWravdQTyYzUlwbI2OCtm4nw5//uLFJs9O/GvAFfl2fY+ZRJoS19WC
	VmdqFFD6lzQjsIos1xsjTnv9xnTsEIVooJpwCIKbLLf09hcmCrBi6H1hcC92F0KuAvpK
	XdxM5IsOMSdvltykgWMfJXFDMkuDdECSl7ip+Xmi53I6W8005EwLtUYH7+F0rLYMXDj8
	P8/HXq48BtaDAVk9yS2TcU0hXy0oTC6kApqwyiabNVUfQCe16dXCA3B51shzZA9XBKqA
	+sIw==
X-Gm-Message-State: AA6/9RlrFMhoygl+jPlSO8iW9gD0/axDqnYd8KkXmmdIfBUUk1BP+dxsRgx7Tyqkzgv+PTyYmvA/b6Mo0uGEjg==
X-Received: by 10.31.153.17 with SMTP id b17mr3572101vke.84.1476840149662;
	Tue, 18 Oct 2016 18:22:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.86.206 with HTTP; Tue, 18 Oct 2016 18:21:59 -0700 (PDT)
In-Reply-To: <20161018172329.GJ2494@denix.org>
References: <20160811034947.GW8521@denix.org> <20161018172329.GJ2494@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Oct 2016 18:21:59 -0700
Message-ID: <CAMKF1so1XtVq2nQ1Ue2v5FtPaTG4Qj0K+LAgSeDEybCPA-8=Kg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] Latest Qt5 5.6.1+ update breaks qtwayland?
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
X-List-Received-Date: Wed, 19 Oct 2016 01:22:32 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 18, 2016 at 10:23 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Wed, Aug 10, 2016 at 11:49:47PM -0400, Denys Dmytriyenko wrote:
>> Has anyone seen this:
>>
>> git/src/client/qwaylandintegration_p.h:91:29: error: 'QPlatformAccessibility* QtWaylandClient::QWaylandIntegration::accessibility() const' marked 'override', but does not override
>> |      QPlatformAccessibility *accessibility() const Q_DECL_OVERRIDE;
>>
>
> Ping on this one. Anyone else is seeing this? Is it C++11 specific? I'm using
> gcc-5.3 from Linaro...

are you using -std=c++11 to compile it ?

>
> --
> Denys
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

