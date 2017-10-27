Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 97020719A4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 01:05:08 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id p75so637265wmg.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Oct 2017 18:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mF/eejQ7ejpqNmqujTUeGj2L/Gst9oXxlqEp4vJRpU0=;
	b=WR608l5yJyxomL8fz0hPHm/zVykpZeuFXrVtH07tWosl8Zx6vMicBOm+SlVOUdUnLh
	0UkV0B0TRNMNTy+i35dL4qA8CBzSLsbtDCBCnuwZ9IWnPR7zMt7bN1KzTV32DQTQo3go
	uUp+Ti2tRSfnLgdC7E/JXU4FlI5lIYWSCw3RekhXw1nAVJfxB4UPRMfMOiau0+H+yvDO
	jOSyxC3Sau6+xvLjJVa06J238fp+at3VZy7UTgGS/eDX+4ZOQkBGeNTKbKzFP91K26/q
	2J0ieXhMfl/qJPCT/HGyC6i84bBjLhoYwH4ux0zfkoXmRD9Ypdli+evcgftuXKdq2+qp
	Dmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mF/eejQ7ejpqNmqujTUeGj2L/Gst9oXxlqEp4vJRpU0=;
	b=cxezadNJc69YhFccHJXYYtLnJdRUqymcemZmhVev+/4JMx2F95MrYfHMfEjmfCo9PG
	E5ecGYkJtaph7dL8uxZKI7EY0e2aMhLdKvHxuGA2dHE+AMX9DxGFcFJ+NV1Nb6ZOo3gn
	uv4xyl+WDAF1OkW2UoawZxci59mALPw2yZdisAfgj3KRU2uT60swtN7SZzQQPNjG+cVM
	yPHFhwnat0//ifTFfjaCMWKcmzzlY0UegjL2NlKIkcmyw4RptuZLC9a5yUd5WDzUW+No
	7qKw+KZ90k20Vccg/ILJtL64mtlXPSBJoCpydPmr9ESmTboUPYQCgf7Zvf0XGBSdpqdQ
	0Ewg==
X-Gm-Message-State: AMCzsaVqNn/EzFVUNYMSF+1v5s35bhEryJds/WVzn8rYodsojYu9GSkT
	nuZkvzA2SBvQeaQZRWCj4l81ZCpzHbIWqqBtwEU=
X-Google-Smtp-Source: ABhQp+S9jMRSzYR3z0zb+07iQsXyUKUqdWbVPkPijCnpPJaIQY7Yvo2BskvAcWcXBBV1ly0ziR2hRownVb/oBxWIjwg=
X-Received: by 10.28.167.130 with SMTP id q124mr450486wme.136.1509066309227;
	Thu, 26 Oct 2017 18:05:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.166.19 with HTTP; Thu, 26 Oct 2017 18:05:08 -0700 (PDT)
In-Reply-To: <CABR-LLcV-gfq4Vix_FDaf4xrybW9MXP0mJecGnOUau8rpvFSLg@mail.gmail.com>
References: <CABR-LLfMQQQvADAH6Z__-L+Pw0BEGnwn+-_E_C36XUwV+X9_8A@mail.gmail.com>
	<CAMKF1soLSiKO1kxSr0nt8HkYjzn_PpJdLmfRRWp6U6szML-YnA@mail.gmail.com>
	<CABR-LLfXBspMaoGXaJnT2iE=zAdyfMWE=zctbzarzfJbXFS1kg@mail.gmail.com>
	<CAJ86T=U9L2-+xZ_1_8u3NJjHsWgh=Xhs4wGun06AizHyPThMuw@mail.gmail.com>
	<CABR-LLcV-gfq4Vix_FDaf4xrybW9MXP0mJecGnOUau8rpvFSLg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 26 Oct 2017 18:05:08 -0700
Message-ID: <CAJ86T=V_iz3794cAjC3BdEzWNa9=MDsJUzpTL2hq_Rs4Fi+QKA@mail.gmail.com>
To: Wangchong Zhou <fffonion@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-webserver] [PATCH] fix nginx with large files support
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
X-List-Received-Date: Fri, 27 Oct 2017 01:05:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 24, 2017 at 8:06 PM, Wangchong Zhou <fffonion@gmail.com> wrote:
> On Tue, Oct 24, 2017 at 11:01 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> Note that disabling the largefile distro feature isn't supported in
>> oe-core any more (the conditional tests have been removed, so all
>> recipes in oe-core build with LFS enabled even if you disable the
>> largefile distro feature).
>>
>> http://git.openembedded.org/openembedded-core/commit/?id=a75ccaea77c8aad8d46e87e8ed4af2e2e0ad5327
>>
>> It's perhaps not the right approach to be adding new conditional tests
>> now in meta-oe.
>
> So guess we are safe to hardcode off_t to be 8?

Yes, I think so.

