Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 662DF60168
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2015 09:18:54 +0000 (UTC)
Received: by qkgw4 with SMTP id w4so27478074qkg.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2015 02:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=IysAQGflziG+JU4G7dB1rLxQsLQChE1fF+dQXuhZcBU=;
	b=BnlRMix3upSHKhLS/i5Ikrs5WCZ86qbv+fMP+K0rwlPBCINkK2TmXPJc1VB4lCR1+R
	s1DT8s58xuVmbNn17FNUd7rVeOEUb49C0Fqi4JOSuTGnNkwWB38EZLmx4vUqoT5hSgdT
	LuVbL4Sa57j0a/FgGEEX4pODvacRXVG/GmDrJjRyVyKFPYSo2SzfRirEr6LRl4YeLyNy
	XqaNWvpDLwz6QGHjxbVaSnPBbN2uIfqtX4QMo5NyECtZIUsNoHQS08PWXotywtfJ/UsB
	PORl4JCzmcuLVkQqNE4Ofno4FlbNEbuGlKN0NGqHj/i6Z26hq0Nnv/HJNoseJmJuWhVJ
	odrA==
X-Gm-Message-State: ALoCoQkuNSi4ahIYsFwib+vqfhG2FoMKc74X7E5dunmXWBMIp1YEE0KYX/AUzmeibQXPeF0uHzG6
X-Received: by 10.140.133.199 with SMTP id 190mr21444243qhf.17.1432113535091; 
	Wed, 20 May 2015 02:18:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 20 May 2015 02:18:34 -0700 (PDT)
In-Reply-To: <555B9872.50301@gmail.com>
References: <555B59D4.80304@linux.intel.com> <555B9872.50301@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 May 2015 10:18:34 +0100
Message-ID: <CAJTo0Lbn8OnaONPtHSm+cxOwQBgefJyAR+yPP1Q2ubmudUAMCA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-ruby] proposal: moving ruby to oe-core
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
X-List-Received-Date: Wed, 20 May 2015 09:18:54 -0000
Content-Type: text/plain; charset=UTF-8

On 19 May 2015 at 21:09, akuster808 <akuster808@gmail.com> wrote:

> I don't have an issue with that. Do you need both Ruby and bundler? I
> believe there is value in having additional ruby packages outside core,
> like python is structured.
>

Agreed, meta-ruby should continue to exist for anything outside of the core
Ruby runtime, exactly like meta-python and meta-cpan.

Ross

