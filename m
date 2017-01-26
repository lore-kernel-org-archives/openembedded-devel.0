Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4131671ADD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2017 22:41:26 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 3so5600458pgj.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2017 14:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=4vaqlcFvHk6ne8boLFr55HhkZKWH68sNPC8LpPR3rKY=;
	b=rNBWj5+v1d+u5815KC7tJGeUrZ95fSv7yzc34Y/V3tGhbCBbY3T6Vn5gNsYX1b5SVd
	dvPUNq8qiDhC4isg/AdUIlxLUh+e8a0uL4zqoB9bUAoCfcRLiU0b2oXh7/vBuXly8CtN
	yRPqcIF9kkUrb6MNUKPe7OmN1sfyachYsTJHnYTDkDtSucVZURjTWK88wWe9NOGA2GGk
	dquoilhEjJtAgdjem2ng+ke7wjlsGZjdoLwDauk4htaKD4uKad/UXgBL8RGe8c7W+DV3
	0mbWKmPTWquTa3+BvtK/7yWbdwnK1wYQsnMae5UW71bFZPmD9mEFcnj0qc74nXARTCsh
	XnoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=4vaqlcFvHk6ne8boLFr55HhkZKWH68sNPC8LpPR3rKY=;
	b=s5rTyAlVrAHPAL7uNqfSMFEuIv2Mbj82HqwLu5YMN18YttT1ls9GS9P3XPfCsjSpW1
	H9K4MQ/WQ0mYg6Pl4PWIrtsJuiPyJu35pl07xkCCNatQ85TdpUixWTBv7MZ0mMzKLUI8
	RDAJbBJB+i0DPb9ZZreU2zfXuBqrNWQ21JnqoB0YzRUcoErh5Wd2xvkkJTiloPgXfwx5
	y0onWoGBmrJjLqqBLne9FWG+whrT5Ggq6U5IHEXz0+n2GObkv1nN0850mmZoW5ssQy9B
	s5xa6ZxlLWDwJiPSLYhXxybx/ckBd5rCsxQA+iuPp64Pp3eVVQtiDOquqsQ/TOOPMTJD
	nzJA==
X-Gm-Message-State: AIkVDXKivJPhS2U7tA+xlRQ8tvWK3UX2ZbN4+TQODWT/97+NEFay2v4vi2N213QAB7XBOQ==
X-Received: by 10.84.211.137 with SMTP id c9mr7462806pli.8.1485470486983;
	Thu, 26 Jan 2017 14:41:26 -0800 (PST)
Received: from CACSVMO-14452.local (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id x2sm5757351pfa.71.2017.01.26.14.41.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Jan 2017 14:41:26 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1485380601-6226-1-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <e981be87-9ea5-83df-6ee1-a52ffda3fb1e@gmail.com>
Date: Thu, 26 Jan 2017 14:41:24 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1485380601-6226-1-git-send-email-armccurdy@gmail.com>
Subject: Re: [meta-oe][PATCH] luajit: test SITEINFO_BITS instead of maintaining a list of 32bit targets
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
X-List-Received-Date: Thu, 26 Jan 2017 22:41:27 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 1/25/17 1:43 PM, Andre McCurdy wrote:
> When cross compiling, the word size of the compiler set via HOST_CC
> must match the word size of the target. That's achieved by appending
> "-m32" to BUILD_CC_ARCH if the target word size is known to be 32bits.
> 
> Unfortunately the current list of over-rides (powerpc, x86 and arm)
> does not cover all cases (e.g. it ignores MIPS). Using SITEINFO_BITS
> is a more generic solution.
> 
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
> index 964dc1d..430279f 100644
> --- a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
> +++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
> @@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "620fa4eb12375021bef6e4f237cbd2dd5d49e56beb414bee052c746bee
>  
>  S = "${WORKDIR}/LuaJIT-${PV}"
>  
> -inherit pkgconfig binconfig
> +inherit pkgconfig binconfig siteinfo
>  
>  BBCLASSEXTEND = "native"
>  
> @@ -21,9 +21,7 @@ BBCLASSEXTEND = "native"
>  # you need to install the multilib development package (e.g.
>  # libc6-dev-i386 on Debian/Ubuntu) and build a 32 bit host part
>  # (HOST_CC="gcc -m32").
> -BUILD_CC_ARCH_append_powerpc = ' -m32'
> -BUILD_CC_ARCH_append_x86 = ' -m32'
> -BUILD_CC_ARCH_append_arm = ' -m32'
> +BUILD_CC_ARCH_append = " ${@['-m32',''][d.getVar('SITEINFO_BITS') != '32']}"
>  

not related but
This makes me think about another issue, will it work on non-x86 build
machines, currently we do have aarch64 based boxes

>  # The lua makefiles expect the TARGET_SYS to be from uname -s
>  # Values: Windows, Linux, Darwin, iOS, SunOS, PS3, GNU/kFreeBSD
> 

