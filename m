Return-Path: <andre.draszik@gmail.com>
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com
	[209.85.219.196])
	by mail.openembedded.org (Postfix) with ESMTP id 300066BDC8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Feb 2019 13:38:12 +0000 (UTC)
Received: by mail-yb1-f196.google.com with SMTP id x9so2454634ybj.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Feb 2019 05:38:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=yQ8+KkBxY4e6cQMB7nixZu3cd9m+cMCyTy7eqNUw86c=;
	b=gSfEEGHgiaR84WQQZtlgRjOF5rlblWvhrnV1zTzsTpy8PSS4hqL99+8Q5tB24Gcv1s
	Ef3Q8x9dtRklQbAihkhBok8Sb6eWgBmZ09B5/7uHZKVa+EAtaFXtKxKv9rtEG7PaIDpz
	hKNzszopP0jsSFx0u7NeFKCqDCspfBhoDgpJkT2LopwDhQ2nTNBWU1xEt8cQ5/JI/XRl
	iOJgHtCvlkUfpnN2qTToOCBkb+bDpGIg2fgOQXllvFDmbqragHAU4uwyhhanGEaQsHJm
	L/dF1xQ/7txo6tK0QJGFnOvD1ktOOyy3VCz/pMqdm6OH0Pr+feRUFe2GHrmXgZ0iNwve
	S2rw==
X-Gm-Message-State: AHQUAubyzzVicoJe6AfpbUvTFO0gJCPZy5VsN6ToAU26tr8DZ9kVmkKH
	TH7WyP39rq2FBdYRrBjlUF7hhxlB
X-Google-Smtp-Source: AHgI3IZPOJaKm7A0+AopCOaGHR/kKcneAPsN2oIE4VbheSKWUkgOd8oJ0gSTITQ2F1J1SHbYpNdA6A==
X-Received: by 2002:a25:e09:: with SMTP id 9mr8259456ybo.226.1549460292737;
	Wed, 06 Feb 2019 05:38:12 -0800 (PST)
Received: from bluvision ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id v74sm400950ywv.83.2019.02.06.05.38.11
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 06 Feb 2019 05:38:11 -0800 (PST)
Message-ID: <90ad3a48bf6811135ebf4893757d3254c95b44e0.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 06 Feb 2019 13:38:09 +0000
In-Reply-To: <20190205155325.7493-1-bkylerussell@gmail.com>
References: <20190205155325.7493-1-bkylerussell@gmail.com>
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] RFC: Support building Java recipes with openjdk-8-native
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
X-List-Received-Date: Wed, 06 Feb 2019 13:38:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

First, I agree the current state isn't great at all.

It does appear to me though that Java world seems to be a bit different, in
that even today there are big Java projects out there that still only
compile using Java 8, which others do compile fine using more recent
versions.

With your suggested approach it becomes impossible to properly support that,
you still have to pick the lowest denominator globally.

Other distributions, Debian based ones in particular are taking a different
approach:
Each Java compiler/runtime provides virtual properties, and recipes can
depend on the required version easily, something like e.g.
virtual/java8-sdk virtual/java9-sdk virtual/java10-sdk etc.

I'had posted a patch series trying to mimic that before, but not really had
time to work on that any more:
http://lists.openembedded.org/pipermail/openembedded-devel/2018-July/195641.html
http://lists.openembedded.org/pipermail/openembedded-devel/2018-July/195642.html
http://lists.openembedded.org/pipermail/openembedded-devel/2018-July/195643.html
http://lists.openembedded.org/pipermail/openembedded-devel/2018-July/195644.html
http://lists.openembedded.org/pipermail/openembedded-devel/2018-July/195645.html
http://lists.openembedded.org/pipermail/openembedded-devel/2018-July/195646.html
http://lists.openembedded.org/pipermail/openembedded-devel/2018-July/195647.html

What do you think?

Cheers,
Andre'

On Tue, 2019-02-05 at 10:53 -0500, Kyle Russell wrote:
> This series spun out of a request on the mailing list last October on
> configuring meta-java for using openjdk-8-native to compile other Java
> recipes that might require modern API features not provided by the
> bootstrap VM classes.
> 
> http://lists.openembedded.org/pipermail/openembedded-devel/2018-October/197186.html
> [oe] meta-java configuration
> 
> I've been running with this series on sumo, but I wanted to send it out
> to get other thoughts on the approach.
> 
> It seems like there's already precedent for this format with perlnative
> and pythonnative.  That was more or less how I expected java-native to
> behave initially until I understood more about the bootstrap process.
> 
> If I've missed a valid use case of java-native and this change would
> cause breakage to someone else's layer, I'd be fine with introducing
> javanative.bbclass as a new class that provides the same functionality
> as the following patch to java-native.bbclass.  (Its name would be more
> closely aligned to perlnative and pythonnative without the dash.)
> However, it appeared that java-native was essentially unused, and I
> thought having both a java-native and javanative class would be
> confusing.
> 
> Kyle Russell (2):
>   Add support for building Java recipes using java-native
>   ant-native: only use classpath tools if no JDK
> 
>  README                                          |  7 +++++++
>  classes/java-native.bbclass                     | 17 ++++++++++-------
>  .../ant-contrib/ant-contrib-native_1.0b3.bb     |  2 +-
>  recipes-core/ant/ant-native_1.8.1.bb            |  4 ++--
>  recipes-core/ant/files/ant                      |  9 +++++++++
>  recipes-core/openjdk/openjdk-8-native.inc       |  2 ++
>  6 files changed, 31 insertions(+), 10 deletions(-)
> 
> -- 
> 2.20.1
> 


