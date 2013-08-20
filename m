Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f179.google.com (mail-vc0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 93D736065F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Aug 2013 08:37:19 +0000 (UTC)
Received: by mail-vc0-f179.google.com with SMTP id ht10so70807vcb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Aug 2013 01:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=ywZhG6p32z0CmknbzI/E8qAHe/bNGBl1AAgX3x9FvCo=;
	b=iOPLZqUb5qd1PrzzJ0W0BCn2+2femU4kQRmnczD4i/TJqP5y/M6/6OGl3HY8Vaukw4
	0pRqSK71R5Ku1dOkl4KA7GWMRxC+rrsS+HDo9PuOg5bJi4UgM5TLBrjA9Hxc19rH+ZaB
	HfekpQhc99dGVm0hxUKCIsOZza7OzYOJz5dp1y1uekPUJWG2rXMvNPpkWjHq0MPOZiHi
	9mIdGdl+UhJs/OQcFPqNQFPYqpmLEbxjDA+88alXFKY8xhxv2GVUpV5dW+uL9VhMkIWP
	pTNAjHrCrvJ41R7zHaoT4jx8YceIBbY+98l7pcdxQzdp+wwdJvKvHb2nJflF7dUQ7lid
	rBLQ==
X-Gm-Message-State: ALoCoQkUUk2E6U35gtWtEJvqHypzXqEtka4NB44DoqMerAFUoJcLjpT4OPg+z5VffTUaNW1vtgyH
X-Received: by 10.58.237.105 with SMTP id vb9mr174865vec.2.1376987839583; Tue,
	20 Aug 2013 01:37:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 20 Aug 2013 01:36:59 -0700 (PDT)
In-Reply-To: <5211762A.3020201@windriver.com>
References: <cover.1376461413.git.hongxu.jia@windriver.com>
	<a4c39e85485f80316e6cefa9b6ad79d0838c83a2.1376461413.git.hongxu.jia@windriver.com>
	<CAGNsrLDyg3Rq0Gk+sG8Vp4y0i+=me2eTjadW2tt4dyU_qU0_cw@mail.gmail.com>
	<5211762A.3020201@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Aug 2013 09:36:59 +0100
Message-ID: <CAJTo0LYFNSGhEjjMLTO4zTSTMXQC+vnxada0nb+EaVWWnn9Rxw@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [RFC PATCH 01/13] meta-filesystems creation
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
X-List-Received-Date: Tue, 20 Aug 2013 08:37:19 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

On 19 August 2013 02:34, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> gitpkgv.bbclass is in meta-oe.
>

Is this the only part of meta-oe that meta-filesystems needs?  If it's
genuinely useful should we this be considered for oe-core?

(layers that depend on meta-oe bother me, especially when they depend on
just a tiny fraction of it)

Ross

