Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3AB617898A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 14:47:20 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id g8so2011264pgv.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 07:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=K5nGoqhtydiQopn7R11PsD1Io89zOmkCXx2LUYwvXKc=;
	b=emnEGl4StCAyLy3k0r8j3Xper5fisFBQuQ6w4JCyHOHS3VqNmsPw522U++SuPnwhZb
	ug3SerdAEOxfQI4sPaSqSdVfEzLRFs6w0XjnKuDLm515FZS4qaiWKMFpm0e9RHA4LI3A
	PW9llApIcC1cINfslg1mX+XSrUXLf3P//4SQOXuceI699MFCnq6M37eQjlop4i1BwFse
	olyvmrBdxZle80vfgEc7cOtqbYIYkzbhzjDXk5XNxC1kd5blVLJmj4jdaI/I9NBQoZT4
	7ZXxsPKNK95xEWDoSXXz8kGHNSf0GWa6xMqmqHXJFp8ahlQwzkvUic3i0e2PRocNq7xl
	Encg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=K5nGoqhtydiQopn7R11PsD1Io89zOmkCXx2LUYwvXKc=;
	b=tOFu1Xk0qKDNk7Sj4mEB+8rU63nT/FS1JYh6lgvoDtVUjzq8LuN6CHJwcqm/axBhvF
	fISOCJr9BETq4Jk0wKyYAomPzvp9owzmpWri4Z81IQgCKnQrqlTuF6ZVF1yUCf/gKti9
	5O80wbSWmtKNP+5FvKt6bTrqVNr0qPDeWsF70XNJwNYhqkxd1udFMMmjTUXasho6LrOB
	rMro42AGV2UTGLpIy+CdNb89VOWDADT6myNL7lJz+YKjZvZBGI2Zxl6EG+OxttVgLDiP
	ONz410oGmyF67OpWesskZkOazpKB4atZlkSDEhgy1pYIjnqjxOjDUAHX097jiBMGzvMU
	aPdA==
X-Gm-Message-State: AElRT7G3Jv5QKDVNRPfnOqnIVZ027AuREPjLkWNVmZ87Ueqe+9Skfks/
	7w0KYVDk/qpcIpWBJpiO9FfiQw==
X-Google-Smtp-Source: AG47ELsk8Mi6gDpErPaR4ZoPOXZQRa2zkgF2/WAKX9ZQCTMhfh6cEymBW2x7mIWyn7kS/fF/qQGNTg==
X-Received: by 10.98.135.202 with SMTP id i193mr1521668pfe.189.1521643641924; 
	Wed, 21 Mar 2018 07:47:21 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:a1c1:eb3f:f249:aed1?
	([2601:202:4000:1184:a1c1:eb3f:f249:aed1])
	by smtp.gmail.com with ESMTPSA id a5sm8601589pfn.66.2018.03.21.07.47.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Mar 2018 07:47:21 -0700 (PDT)
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>,
	openembedded-devel@lists.openembedded.org
References: <1521603377-34881-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<1521603377-34881-6-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <8af916ce-0d79-7be7-172f-07abb7540e30@gmail.com>
Date: Wed, 21 Mar 2018 07:47:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1521603377-34881-6-git-send-email-huangqy.fnst@cn.fujitsu.com>
Subject: Re: [meta-python][PATCH] python-cryptography: 2.1.4 -> 2.2
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
X-List-Received-Date: Wed, 21 Mar 2018 14:47:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 03/20/2018 08:36 PM, Huang Qiyu wrote:
> 1.Upgrade python-cryptography from 2.1.4 to 2.2.
> 2.Update the checksum of LIC_FILES_CHKSUM, but license remained the same.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>

I am seeing:
ERROR: python3-cryptography-2.1.4-r0 do_fetch: Checksum failure fetching
https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-2.1.4.tar.gz
ERROR: python3-cryptography-2.1.4-r0 do_fetch: Fetcher failure for URL:
'https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-2.1.4.tar.gz'.
Checksum mismatch!
File: '/home/akuster/OE/downloads/cryptography-2.1.4.tar.gz' has md5
checksum 9f39d4d8f2b05f295fa0ff52475ec4f2 when
c49c1ee145a900313a216fa2c788208c was expected
File: '/home/akuster/OE/downloads/cryptography-2.1.4.tar.gz' has sha256
checksum
e4d967371c5b6b2e67855066471d844c5d52d210c36c28d49a8507b96e2c5291 when
f5a0279e362c37e2150a32fe35ec20226e9237b6c9927fce8d53ef8e49e64f48 was
expected
If this change is expected (e.g. you have upgraded to a new version
without updating the checksums) then you can use these lines within the
recipe:
SRC_URI[md5sum] = "9f39d4d8f2b05f295fa0ff52475ec4f2"
SRC_URI[sha256sum] =
"e4d967371c5b6b2e67855066471d844c5d52d210c36c28d49a8507b96e2c5291"
Otherwise you should retry the download and/or check with upstream to
determine if the file has become corrupted or otherwise unexpectedly
modified.


please double check.
- armin
> ---
>  meta-python/recipes-devtools/python/python-cryptography.inc         | 6 +++---
>  .../{python-cryptography_2.1.4.bb => python-cryptography_2.2.bb}    | 0
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-cryptography_2.1.4.bb => python-cryptography_2.2.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-cryptography.inc b/meta-python/recipes-devtools/python/python-cryptography.inc
> index 4be7907..fcd5358 100644
> --- a/meta-python/recipes-devtools/python/python-cryptography.inc
> +++ b/meta-python/recipes-devtools/python/python-cryptography.inc
> @@ -1,7 +1,7 @@
>  SUMMARY = "Provides cryptographic recipes and primitives to python developers"
>  HOMEPAGE = "https://cryptography.io/"
>  LICENSE = "Apache-2.0 | BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=d5ede125ed08d4fd14ec44d334bdb388"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=097f805837700cfac572ac274cd38124"
>  
>  DEPENDS += " \
>      ${PYTHON_PN}-cffi \
> @@ -10,8 +10,8 @@ DEPENDS += " \
>      ${PYTHON_PN}-six \
>  "
>  
> -SRC_URI[md5sum] = "9f39d4d8f2b05f295fa0ff52475ec4f2"
> -SRC_URI[sha256sum] = "e4d967371c5b6b2e67855066471d844c5d52d210c36c28d49a8507b96e2c5291"
> +SRC_URI[md5sum] = "c49c1ee145a900313a216fa2c788208c"
> +SRC_URI[sha256sum] = "f5a0279e362c37e2150a32fe35ec20226e9237b6c9927fce8d53ef8e49e64f48"
>  
>  RDEPENDS_${PN} += " \
>      ${PYTHON_PN}-cffi \
> diff --git a/meta-python/recipes-devtools/python/python-cryptography_2.1.4.bb b/meta-python/recipes-devtools/python/python-cryptography_2.2.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-cryptography_2.1.4.bb
> rename to meta-python/recipes-devtools/python/python-cryptography_2.2.bb


