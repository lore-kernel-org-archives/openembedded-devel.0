Return-Path: <leo.yan@linaro.org>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 45DE161602
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2020 12:54:36 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id 7so1462919pgr.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2020 04:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=SNboWGCS+d2DOeKaCrfvyrWY48JmTJXVy3H/aPfSYrE=;
	b=GuRXzy4Q4Hi0zUGXEUnB525Y23s91NnUvX2XMrMXdq134AHOH9D+CVi03MwSeYXbU5
	xptn5n7gVjRv8diC3bEmhPoKbs4dpDr5tS9GXz7bdgA7zcLGP/k0KnGIehZtSbzOyjc3
	OWG1mMPQkTykRvu6S1E2N5QBaUFG7nH9ZNTj7Os9AbXZsYrLtISpHy+Fyif4MPZOiB6k
	byiC34kyIX7nrkhWAXQry0eOqZdv5FQx8SNCuRf+M0H7KsOxlc/9mVaYLIbT167mBu2s
	IgKEhBIOnHmF0qDDt13QaCWqIl56tGHmB/MF/gNXUBulL2uf6MLQxbvgOqlVYbqrCjfJ
	0gdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=SNboWGCS+d2DOeKaCrfvyrWY48JmTJXVy3H/aPfSYrE=;
	b=Gb/q4tl3Mi8CAXgT5F0Qdqu1Ap+b6chxcIJgy/6FUSAbuJ67G+dXTCX3iltTfhyYyD
	oF9iFUGBCLjA9IxXOOe5fUxSMmFsOhGZuFepyLIneH9x7Ek3nvuGTruzc8O3L97Zb1B3
	TOlanbcGUP8hxiot8SLLK7i93Fq0pbzj/dHBinBhgXwkgSinWaXdmTvzn7C61ICSlPaL
	zouat3OTqDqcUdPbW3c6O+rjuRpK0wXoxONb5Jk4Fd4KvrW0Z3+LZabQ2dXJanH+8YNm
	jH8rkUh2Iu8zqNF0GkZcw4FhhWeVei0KSXrDq+by0dYPn6jSpV001YUUsOfGMLU8i0aE
	hNnQ==
X-Gm-Message-State: APjAAAWIFXZPQOxhlqBka6b32G4a3dSX018Ts2uXOw92q3WlqZzPS/Yx
	F5QsVrLk5bOdrGYosqEY/Z+i0w==
X-Google-Smtp-Source: APXvYqzJKvXYsqnYOrB2Jf68hQiBoJk+cYnDlrB7bglsq+IeFDTK9NVlVthoeMeW2dcXoxN6ECyiBw==
X-Received: by 2002:a62:7883:: with SMTP id
	t125mr48720050pfc.141.1582462477325; 
	Sun, 23 Feb 2020 04:54:37 -0800 (PST)
Received: from leoy-ThinkPad-X240s ([2400:8902::f03c:91ff:fe3f:32da])
	by smtp.gmail.com with ESMTPSA id
	c68sm9320026pfc.156.2020.02.23.04.54.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 23 Feb 2020 04:54:36 -0800 (PST)
Date: Sun, 23 Feb 2020 20:54:26 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200223125426.GB22823@leoy-ThinkPad-X240s>
References: <20200221104340.21294-1-leo.yan@linaro.org>
	<b9131d30-d9a2-a45c-726a-18be24be376e@gmail.com>
MIME-Version: 1.0
In-Reply-To: <b9131d30-d9a2-a45c-726a-18be24be376e@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] Ply: Add recipe for git version
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
X-List-Received-Date: Sun, 23 Feb 2020 12:54:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Khem,

On Fri, Feb 21, 2020 at 02:20:59PM -0800, Khem Raj wrote:
> Fails to build on mips
> 
> https://errors.yoctoproject.org/Errors/Details/392045/

Sorry for extra efforts introduced by my patch.  I changed to use
below line for arch compatible and tested with
x86-64/aarch64/mips/ppc:

COMPATIBLE_HOST = "(x86_64.*|aarch64.*|arm.*|powerpc.*)-linux"

Will send out new patch soon.

Thanks,
Leo

