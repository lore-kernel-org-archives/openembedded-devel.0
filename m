Return-Path: <mats.dev.list@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 66D2265CBC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Apr 2016 21:53:44 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id p64so21324444lfg.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Apr 2016 14:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:references:cc:to:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=SiTdDh/BdZE+ESCOxBFH4HKVFu4PzeAmPenUgbU6gKM=;
	b=pyA/E2hfeOSfIeru6t6JDJgcw3+XZXdGat3YAsgiBfp/pOMfIig08oEY3IXsHy3Lxo
	EOT+yUm54/cBSALtEU04PRHcFgcTrLOUC4HSYTUpH1o7AoJtMcnQ7212Cmf4xMVaK9KA
	k2wGW3d8w46HkTHTR1wPLtC8yKJekGcIkru4I2EeHOWWLn/+x1rwn7Xns1vWkkYtjsA0
	qQUOBp+CYMd6tLbMV9pK88c0QqAAcjqtJVRjiPjoAerzwaogxJ1YGZlmAvBbxYU0Zfht
	fwkl1eTkE9IX9VOiemMGP/+Y8e6ODTg2UMwgK/Mb/VnY7yiybT6dSwz4dYtDEl4rj67A
	+YoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:references:cc:to:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=SiTdDh/BdZE+ESCOxBFH4HKVFu4PzeAmPenUgbU6gKM=;
	b=GYozqU97/PzHT7kL0QIpryCWEo8LrMeqUt+bm6voLuTZuAC5qbIhRqwd3eDhCwZ6JI
	bnM6Du9igDfi/5/qgj26/a9TunL0Q77lG/dlQVl80eR0XwFRfArKkdXsbrEbfsvuu0fX
	4Ri4rKgfGiWBYtpHRtI2q67OnCaQYZWd84AvxbDC9t67W5BhFauqGRsTKTdnZUALmfLn
	O2BE6PMTxVi/ho3iKfrujzIR47Xq0sj1pVYG+S0kBU5HYu8cksJRVqAEML/ttGXe0IlK
	uw7VnCv5woBeeqVw4wnaopquFlqGu4LyCCZqlaz51v3fxXrCHNqU0oczV1temE6v+KXR
	pFgQ==
X-Gm-Message-State: AOPr4FXPPlINN2godlHxK9U0vlE+GWjrkKM25Xk4YXo/5HVSioI5JRGJzqEq9C7GlH22uw==
X-Received: by 10.25.205.146 with SMTP id d140mr12535494lfg.109.1460843624025; 
	Sat, 16 Apr 2016 14:53:44 -0700 (PDT)
Received: from [192.168.1.205] ([195.84.96.49])
	by smtp.gmail.com with ESMTPSA id k71sm972522lfi.43.2016.04.16.14.53.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 16 Apr 2016 14:53:43 -0700 (PDT)
References: <5712922E.2040102@gmail.com> <5712AC1A.3060901@gmail.com>
To: openembedded-devel@lists.openembedded.org
From: Mats Karrman <mats.dev.list@gmail.com>
Message-ID: <5712B461.1090001@gmail.com>
Date: Sat, 16 Apr 2016 23:53:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <5712AC1A.3060901@gmail.com>
Cc: akuster@mvista.com
Subject: Re: [meta-python] python-m2crypto: fix SSLv2 symbol issue
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
X-List-Received-Date: Sat, 16 Apr 2016 21:53:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi!

I haven't been on the list for a while so I'm sorry if the following is 
obsolete.
I found a thread in the archive from early march with the same subject.
I just run in to this problem and found it's not enough to

SWIG_FEATURES += "-DOPENSSL_NO_SSL2"

but I also must do

SWIG_FEATURES_x86-64 += "-DOPENSSL_NO_SSL2"

In my case, since the crda_3.18 build seems to be depending on the 
python-m2crypto-native.

My setup:

Build Configuration:
BB_VERSION        = "1.28.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "LinuxMint-2"
TARGET_SYS        = "arm-poky-linux-gnueabi"
MACHINE           = "rabbit"
DISTRO            = "poky"
DISTRO_VERSION    = "2.0.1"
TUNE_FEATURES     = "arm armv7a vfp thumb neon callconvention-hard 
cortexa9"
TARGET_FPU        = "vfp-neon"
meta
meta-yocto        = "jethro:1a52eceaa5df89914b6a711defdcf0046e74c7f6"
meta-oe
meta-networking
meta-python       = "jethro:c305ac5d2f5285d5eec8952a4ca7f3b4f89aed96"
meta-fsl-arm      = "jethro:8d22b44716fa624ff87383c36d222d9e28d0b267"
meta-fsl-arm-extra = "jethro:2fdd1f7729c11900126f6c73346b8ea89448e927"
meta-local        = "master:fd5bc78e9be96322c724f0353904c2d561156fc8"

BR,
Mats




