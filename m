Return-Path: <andre.draszik@gmail.com>
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com
	[209.85.219.196])
	by mail.openembedded.org (Postfix) with ESMTP id D427879DE9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Nov 2018 11:18:27 +0000 (UTC)
Received: by mail-yb1-f196.google.com with SMTP id g9-v6so6662395ybh.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Nov 2018 03:18:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=jWI9sS6z8daIFKkl6lXeXUbru8EIPB43x1EAEaA3izw=;
	b=qmnJPGOB0Ap6U7ISKb2N+RUka+IFEtT0iIj3BFE1NBHkWzu4Orn3J9/toaR+qOizkx
	RA5o3vm6KOIARF26+vT6m3QTEsIJD2Vjvn6qAoj9yBJTJaf0S+oP6g8+2LnA1meufA7Y
	BDLmwqaJY2mbR51dcrV0UXfbHzSQIwoPJX+tL+yMS+xy0gclPJe4FNLUinbXCNFKRAz8
	OXyrGt4t4TTT24b9Csu5rftPWt/HWl3noJCpAHbh2cf1UbFLHgxGnOoKGOevUuR/HQy1
	9JrEzgbNCokEKyEx/RJvpcop5mB+kp5Fe5SEVprvgukBR0ld0jAlLsuJiXQYU5cIwwXD
	LDeQ==
X-Gm-Message-State: AGRZ1gLsYCU+D+uFnUFHTpeJvg3soU1Cr43r2Z7nRQeJQSk4c4v2ms3L
	w11EzS1BKgU/n9r5YpOdFN2qQBZG
X-Google-Smtp-Source: AJdET5dn4mMNn5uD6wmlhDbz9D4Zrvhn1xQKn8D3xa/PWFZhfRvK6G3K1pVShpYhPm0foHdoFb/8rg==
X-Received: by 2002:a5b:f4a:: with SMTP id
	y10-v6mr1065587ybr.292.1541589508537; 
	Wed, 07 Nov 2018 03:18:28 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	m16-v6sm89724ywh.18.2018.11.07.03.18.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 07 Nov 2018 03:18:27 -0800 (PST)
Message-ID: <0045d382bffd47b62629a38bcdad0105e6f230ad.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 07 Nov 2018 11:18:26 +0000
In-Reply-To: <CAFrQVPNLu4KJWK3hLWVC7yjq7aLmb9a1c066hTC5BHj_=qdZZg@mail.gmail.com>
References: <CAFrQVPNLu4KJWK3hLWVC7yjq7aLmb9a1c066hTC5BHj_=qdZZg@mail.gmail.com>
User-Agent: Evolution 3.30.1-1 
Mime-Version: 1.0
Subject: Re: meta-java configuration
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
X-List-Received-Date: Wed, 07 Nov 2018 11:18:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-10-24 at 17:15 -0400, Kyle Russell wrote:
> It looks like the only javac that meta-java exposes through its bbclasses
> comes from libecj-bootstrap-native 3.6.2.  A few years ago, it looked like
> there was an attempt to allow openjdk-8-native to provide
> virtual/javac-native, but it has since been reverted.
> 
> I think I understand libecj is needed as part of the bootstrap process to
> build openjdk, but if other layers want to build newer java code using
> javac from openjdk 8 once available after bootstrap, does meta-java
> provide
> support for using javac from openjdk-8-native, or is the expectation that
> other layers would depend directly on openjdk-8-native and setup
> EXTRANATIVEPATH as needed to reach its tools?
> 
> Maybe this is planned future work, but I wanted to make sure I was
> configuring the layer correctly and using it as intended.
> 
> Thanks!
> 
> Kyle

I've tried something here

http://lists.openembedded.org/pipermail/openembedded-devel/2018-July/119590.html
http://lists.openembedded.org/pipermail/openembedded-devel/2018-July/119591.html
http://lists.openembedded.org/pipermail/openembedded-devel/2018-July/119592.html
http://lists.openembedded.org/pipermail/openembedded-devel/2018-July/119593.html
http://lists.openembedded.org/pipermail/openembedded-devel/2018-July/119594.html
http://lists.openembedded.org/pipermail/openembedded-devel/2018-July/119595.html
http://lists.openembedded.org/pipermail/openembedded-devel/2018-July/119596.html

[oe] [meta-java][RFC][PATCH 1/7] openjdk-8-native: add meaningful (R)PROVIDES
[oe] [meta-java][RFC][PATCH 2/7] layer.conf: allow multiple Java SDKs & runtimes to co-exist
[oe] [meta-java][RFC][PATCH 3/7] openjdk-8: add meaningful (R)PROVIDES
[oe] [meta-java][RFC][PATCH 4/7] openjre-8: add meaningful (R)PROVIDES
[oe] [meta-java][RFC][PATCH 5/7] layer.conf: set defaults for Java JRE (R)PROVIDERS
[oe] [meta-java][RFC][PATCH 6/7] openjdk-7: (R)PROVIDE virtual Java [567] packages
[oe] [meta-java][RFC][PATCH 7/7] ca-certificates-java: switch to more generic / more correct JAVA (R)DEPENDS


the idea is to add virtual (R)PROVIDES that other recipes can depends on,
similar to e.g. Debian.

I'm using this locally, but I think there are some corner cases that aren't handled.


Cheers,
Andre'



