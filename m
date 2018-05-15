Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 662DB74863
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2018 14:45:19 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id 30-v6so178769pld.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2018 07:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=R2InSZxXHPUTOWgwnBwi+rIGmEPYdiddlVR3QFZ7Yiw=;
	b=V8xQFlE+wtvkLZtw39Hz68v0dZLzQ6PlTShfJsC+gO45IK2snKtULtuDgVxxVcgXgL
	6S3ZZGVMETupIWgDom/GXO4jupxHpDYNnVT8V8sR7uQh3zkjFD7bhuvnq16/euC1w08t
	gH37fd3eftH18tJNToHXm7vEK4spmYShx51+ENPu/mW02p7Z6St+r4OowRrOW3PGCEbI
	2ThxIJ10qK7lvgwpufphRWEEook7LSzq3LibMU4Jc+NdXUEtGnk2YB2FjWCdvnmMtoc0
	OaG2d+Iqg7HzN5r05eGrQBfRnlJu8eGqslaqQ8HTAQCpIyOHZCVjPHeXJChkNNjeob8K
	nFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=R2InSZxXHPUTOWgwnBwi+rIGmEPYdiddlVR3QFZ7Yiw=;
	b=Z88XWCwaZb0FXzswPKI0kP5oah020oAz3Q92uG6ni1gw4/mcGXV6H0LO7NHvBerw2d
	GW0D3MZgTw/uJRbflc3Y0r1ZOP7e55wsxoDoxk5UbT71G67jMyRJDFQJ7ZxHCF0bJz8X
	BEHQb0MVzZdyQgPjYMKdDDtGFIjQOHReHBxGI2NIVL00r7gqXjsp+pr6jXDeUPdXvTL1
	PbM+oNUxJp1CBbj4TZdp7BSAKN+qv86cqYeyOxfMsIiwwtbDVmv5R3WQnMP2eXbG2gV2
	w1i9zicJkh2y9ztD5mWExOnzQgjiO3OvesqbW4N7APb+ObfDhz1e4ySkrYwPvnZd5YAl
	7Arw==
X-Gm-Message-State: ALKqPwcthCHiPi5sIr6yJ7gTndgpklrqWR9mr3QrWyDKcYhUZtzJkqcd
	B5+lKPtVe0ZUG6rqXl844EbZbQ==
X-Google-Smtp-Source: AB8JxZpHj6Qf4Ks7jRtTPb/9/6w1iT4bB06fVw7yuUgi0knwE2pctcNSJvI8Sg6ePz9KHWekDqCwJQ==
X-Received: by 2002:a17:902:6bc1:: with SMTP id
	m1-v6mr14755813plt.91.1526395520777; 
	Tue, 15 May 2018 07:45:20 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:f52d:5b1:98c8:9439?
	([2601:202:4000:1184:f52d:5b1:98c8:9439])
	by smtp.gmail.com with ESMTPSA id
	h65-v6sm486975pfj.54.2018.05.15.07.45.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 May 2018 07:45:20 -0700 (PDT)
To: Trevor Woerner <twoerner@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20180510004908.26947-1-twoerner@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <2d40764a-ff2e-06c1-898b-1f4f99fbda29@gmail.com>
Date: Tue, 15 May 2018 07:45:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180510004908.26947-1-twoerner@gmail.com>
Subject: Re: [meta-multimedia][PATCH v2] openh264: switch away from github archive
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
X-List-Received-Date: Tue, 15 May 2018 14:45:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 05/09/2018 05:49 PM, Trevor Woerner wrote:
> Since we know that github archives which are automatically generated have a
> tendency to change their checksums[1], switch to using a git clone.
>
> [1] http://lists.openembedded.org/pipermail/openembedded-devel/2017-September/114916.html
>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>
> Changes since v1:
>  - replace the frankenstein local variable name OPENHBRANCH with simply BRANCH
>    to hold the name of the branch to use
This fails to build: please see
http://errors.yoctoproject.org/Errors/Details/178572/

>
> ---
>  .../recipes-multimedia/openh264/openh264_1.7.0.bb          | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb b/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
> index a7aaab3623..40bd493e6d 100644
> --- a/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
> +++ b/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
> @@ -11,9 +11,10 @@ LICENSE = "BSD-2-Clause"
>  LICENSE_FLAGS = "commercial"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=bb6d3771da6a07d33fd50d4d9aa73bcf"
>  
> -SRC_URI = "https://github.com/cisco/openh264/archive/v${PV}.tar.gz"
> -SRC_URI[md5sum] = "93da4e76cfda7ede8fd2df51b0021efd"
> -SRC_URI[sha256sum] = "9c07c38d7de00046c9c52b12c76a2af7648b70d05bd5460c8b67f6895738653f"
> +S = "${WORKDIR}/git"
> +SRCREV = "a180c9d4d6f1a4830ca9eed9d159d54996bd63cb"
> +BRANCH = "openh264v1.7"
> +SRC_URI = "git://github.com/cisco/openh264.git;protocol=https;branch=${BRANCH};"
>  
>  COMPATIBLE_MACHINE_armv7a = "(.*)"
>  COMPATIBLE_MACHINE_aarch64 = "(.*)"


