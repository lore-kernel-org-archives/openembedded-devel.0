Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2003661133
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 23:04:04 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id b9so5529928pgk.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 15:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=pRfcKgEaniMjIZOWFdg4EjIKNpZ4CPo1nMdc4J+S0hc=;
	b=m0fKduBU9e6zgyTjFfl2kw6VED7sFD8YRK9Gx958vBid8q/5119YTkSQBVBjZDs4iR
	4v1EiTXeayv1V0gYfKzPyKl6Qlhdih+6i7U9AMz1BuVLhYMKfhRmJl3wil/5G41YeVvs
	AmOVJxSUV+RsIY5o8riduroO/pMKUsmS7oAfXdOBHAmaMq1RCx44SMgcBFyCG1w+H931
	IbZpZhaf+BIw0pbGRLa7x/xztoVUeWPYLMmnQWjDCciuPAJsYTXbLRaZiag8MDAJseGY
	wAaEdCbGBX9Om4wcO3Y8mOhs6LcOativ1eRGWc7XtwNSERMAW1XhYxK97Jb0SYSzprtE
	QTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=pRfcKgEaniMjIZOWFdg4EjIKNpZ4CPo1nMdc4J+S0hc=;
	b=IHgB/rSVatNL6G325k5gpovExN6ZtRbnOSmMgJt7L8N9PKjr/QXEMqxQrqb7tJNVNT
	/lEXW9vax25ud8WALULnPQehLH/TKX8Ia0AOVlLDO299El5fBqSrafhqrMxhj1xo57mT
	XGul9vPB4Fk9sYvYdgVJ01KR5a15nLkQfDRKDJM6tSRmk4jsZh4s5uoRWvmN8lmF/XsB
	++m22RAz8FWZFcDEJL5Fc3jtegj++nhpkgxdCxKHh7/kwArhQaQ3RQYMbgU8xvUaChye
	MadffQF9NSpBRAZDEovlO6fCSBopGV5eVbs0jtlGGvUB/uvr/MHVjY3737VQwVemkRqU
	cjRA==
X-Gm-Message-State: APjAAAXWamHz47w35vQ/K9dEjRA0FrYJWTZ1DsViNJeOb9LwIzH8K/tn
	R1VD1sZU3YVGf3aa2nNj7KwnHi0hUw4=
X-Google-Smtp-Source: APXvYqx0ABwQGMD9hbxdnHprJq1sTN3Nk8Rk6PBDC062+Kh3cLoj/QbG0pIvAyBfk1Qq7OiGDyx3Ag==
X-Received: by 2002:a63:691:: with SMTP id 139mr6141944pgg.325.1581721445547; 
	Fri, 14 Feb 2020 15:04:05 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:24fa:ebe1:e23c:267a?
	([2601:646:9200:4e0:24fa:ebe1:e23c:267a])
	by smtp.gmail.com with ESMTPSA id
	t28sm8267046pfq.122.2020.02.14.15.04.04
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 14 Feb 2020 15:04:05 -0800 (PST)
To: Tim Orling <ticotimo@gmail.com>
References: <20200213055519.1978873-1-raj.khem@gmail.com>
	<CANx9H-CONadAvBOw-HF+HqcMm+8+_aXaQKfz07A171PDW7mpGA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <94881089-5174-c0d0-55f5-bd3f93d00b12@gmail.com>
Date: Fri, 14 Feb 2020 15:04:04 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CANx9H-CONadAvBOw-HF+HqcMm+8+_aXaQKfz07A171PDW7mpGA@mail.gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python2][PATCH] python-grpcio: Upgrade to 1.27.1
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
X-List-Received-Date: Fri, 14 Feb 2020 23:04:05 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2/14/20 8:06 AM, Tim Orling wrote:
> Thank you. I've merged this, but noticed 1.27.2 was released to patch 
> python. Can you have a look?
> https://github.com/grpc/grpc/releases/tag/v1.27.2
> 

interesting timing. My intention was to get 64bit time_t fixes only.

> On Wed, Feb 12, 2020 at 9:55 PM Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
> 
>     Delete gettid patch, fixed differenty upstream
>     Add code to use cross compiler in setup.py
> 
>     Define GRPC_PYTHON_DISABLE_LIBC_COMPATIBILITY so it does not use
>     SYS_clock_gettime syscalls since it does not work when 64bit time_t is
>     used on 32bit arches
> 
>     Signed-off-by: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>     ---
>       ...-Do-not-mix-C-and-C-compiler-options.patch | 44 ++++++++++++++-----
>       .../python/python-grpcio/gettid.patch         | 26 -----------
>       .../python-grpcio/ppc-boringssl-support.patch |  2 +-
>       .../python-grpcio/riscv64_support.patch       |  2 +-
>       ...pcio_1.19.0.bb <http://pcio_1.19.0.bb> =>
>     python-grpcio_1.27.1.bb <http://python-grpcio_1.27.1.bb>} | 11 ++---
>       5 files changed, 40 insertions(+), 45 deletions(-)
>       delete mode 100644 recipes-devtools/python/python-grpcio/gettid.patch
>       rename recipes-devtools/python/{python-grpcio_1.19.0.bb
>     <http://python-grpcio_1.19.0.bb> => python-grpcio_1.27.1.bb
>     <http://python-grpcio_1.27.1.bb>} (74%)
> 
>     <snip>
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 


