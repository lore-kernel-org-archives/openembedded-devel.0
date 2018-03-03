Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7FB077867B
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Mar 2018 02:52:21 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id 9-v6so1241807ple.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Mar 2018 18:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=YtSTDQtZmSY6ZXg5QnRbP1NQA075DWlgaan/yCv2T7Q=;
	b=mErjvtsNrntKlPPuPDm7xRGrQ+0dF/7nuyfaXtNvJ8hnav8H+m2O0aBeXnvzN9KUTP
	4L+i/W1yWtp02ArqtCJSR5F9W2XrugFIvLfUlBcUkQcfFvOReGmQyuHGkHtYwB3v5j4S
	6tvK2rhQ1/4jOAuXlYTimCGRXbRsgxT3EViXAOC6gDASpyPWkuTUwdaDprm47LRweJSk
	3HWBXAmd0IG1YXUgHuj7EWFn/r91/0y96CkyU6r5LcCBPvM56ZBvHW77+d9XyBWZea3t
	kqf+5yHvZVOF0Tgm8Btt3/MlitlLfQLgZxqiEBUmsaohdzzj+b8/N//R25X39SqR3cHq
	tt9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=YtSTDQtZmSY6ZXg5QnRbP1NQA075DWlgaan/yCv2T7Q=;
	b=gwfS0L8aCAdY+byA2iofnJQOKSJyhWrZIhluVXMZYxYCnzA8d1Zc5qM6UnNXpIMzuC
	Yb7J7dQhAR7Lpv+X49I0mMBoorbxZAc50Ssu4f53jwQq0jpLKw6TssKaK4ZV+PZdGMDE
	OlChB4zrKIwkok5WJJ73Te0BWEgzYdSyOPnFhmwpm7C0BE/2kwahewSb5SQg7cDd00Zh
	ILUr957kALE59VFKKmE8IZRRqIObee/spen2tTNromycN4HITR/so6ldgpD10jDMfr/f
	2JH+4nL+yWkKtDc2vgzXVcFSi9wX1L8CVoITIJPHU1c6vtSbkX8ZMJUug4vBkmonYlxm
	RtEg==
X-Gm-Message-State: APf1xPAhKsHbquKnMRBnXzTzp+s+cXh00hqkALQ5DzQEpwXEIHA/lfRT
	QY5FjkFAIR/GxZu/pAXYvRxBmOzW
X-Google-Smtp-Source: AG47ELu0nTEDbo0iTEHFJVs5bCTU+uszzUNVAYzPR0reevkMZQL9+Rr+PQTtnyuKHs0AkM89JSzdnA==
X-Received: by 2002:a17:902:694c:: with SMTP id
	k12-v6mr6955681plt.133.1520045542360; 
	Fri, 02 Mar 2018 18:52:22 -0800 (PST)
Received: from ?IPv6:2601:646:8880:466c:a564:75fb:6e2a:d708?
	([2601:646:8880:466c:a564:75fb:6e2a:d708])
	by smtp.gmail.com with ESMTPSA id
	o82sm16550593pfj.163.2018.03.02.18.52.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Mar 2018 18:52:21 -0800 (PST)
To: Derek Straka <derek@asterius.io>, openembedded-devel@lists.openembedded.org
References: <1519999561-9599-1-git-send-email-derek@asterius.io>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <3f95e0a7-4663-cb73-6ab1-7eed4ab8927f@gmail.com>
Date: Fri, 2 Mar 2018 18:52:20 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <1519999561-9599-1-git-send-email-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python-sqlalchemy: update to version 1.1.17
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
X-List-Received-Date: Sat, 03 Mar 2018 02:52:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/2/18 6:06 AM, Derek Straka wrote:
> Update the license checksum and verify the terms remain the same
> 
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta-python/recipes-devtools/python/python-sqlalchemy.inc           | 6 +++---
>  .../{python-sqlalchemy_1.1.15.bb => python-sqlalchemy_1.1.17.bb}    | 0
>  .../{python3-sqlalchemy_1.1.15.bb => python3-sqlalchemy_1.1.17.bb}  | 0
>  3 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-sqlalchemy_1.1.15.bb => python-sqlalchemy_1.1.17.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.1.15.bb => python3-sqlalchemy_1.1.17.bb} (100%)
> 
> diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy.inc b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
> index 2683a6a..0c191ae 100644
> --- a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
> +++ b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
> @@ -2,13 +2,13 @@ DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
>  application developers the full power and flexibility of SQL"
>  HOMEPAGE = "http://www.sqlalchemy.org/"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=452f4b8adb0feba42e5be5f1fbfbf538"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b1c412c9d8d1ce018f7a9374407c22bb"
>  

what changed here ?


