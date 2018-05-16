Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 314B26093B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 19:37:17 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id q22-v6so855002pff.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 12:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=wAeo0POBtXv62NEC5HCoTeVNrOJxLkdAfBgx5TDiCOI=;
	b=EEBSxuqOLvFfWsVaIIqjHmZdQxmLkt6P46R6LEHxxjLABB7euU+x6HW3yu8DwcFRw2
	1/RXNl/ryh4yEFLEPH4PNKyoFbMCmb0pCEe8RVMx6ELv6OvDu6d4LVN6eWMdvUwy58cq
	ooKLyS78Hu70SoffQm/S6I13jLVzRh1PF2FXMCmgVgcUaXrY+2gRTGG0Pw8AAGjZrg/9
	Th4juX/ziR0tihhVrNcheB68IoHpEsGMM6OHDlvOZI4PIuKiq0HN29ioYEkaSmvGGuIZ
	SDpFTB5fJixdlrq2wvDXUGgaogU1U++fE6S3AkMMheLr/HRcZtTELkgdX/s7RUvv78Db
	YEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=wAeo0POBtXv62NEC5HCoTeVNrOJxLkdAfBgx5TDiCOI=;
	b=k8R35ucbtE85VUs1G1scFbCdEN7zwljmJd09xSjYdltQe/MTT1DnsdSZyCGC3FaBiu
	CSd45oqsAJ7W9KqNAbi1+fsyzYtW5NuJU4pMa9mpMX77KAVWWvzbn41Jut8Xh0rfgHSS
	ZUxaC9q8eiN5O/FPhZxR/6GTPD+8BMtJ8LXhz6I5xtIJz9t/Qh92+xAtPwnB8Iq+eC++
	qabcwohHtChwHfKHDogcqPefWVOE6dZLaav3RIMVQQw0JcpCsNxY+/3biwX05OAjwLlc
	dBDPTee3w0aSCl7213z2LkWzZAOI1+xg0V3v+3bQG4SzupYXLuScc96Xu8tGixFEJHyw
	9i2Q==
X-Gm-Message-State: ALKqPwck9rHe4/MWDZZmHc7HAB0jjSR150G78pnufc1jeNDW+h7gOuxV
	MYq7gPbMYvassUUHXuW6zAalkA==
X-Google-Smtp-Source: AB8JxZrTeHgPZSkR8xJMcFZxl2/eeeu+AMtVi2+/UJbYEcgEEUam1Wogc9+QJ1cltpbs9fyDlXCh/g==
X-Received: by 2002:a62:dfcd:: with SMTP id
	d74-v6mr2297040pfl.114.1526499438619; 
	Wed, 16 May 2018 12:37:18 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:fc4a:d9da:dd5c:80ff?
	([2601:202:4000:1184:fc4a:d9da:dd5c:80ff])
	by smtp.gmail.com with ESMTPSA id
	q64-v6sm4958214pfg.180.2018.05.16.12.37.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 May 2018 12:37:17 -0700 (PDT)
To: Trevor Woerner <twoerner@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20180516171948.18406-1-twoerner@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <8f704304-6617-740c-6caa-6758f6b70241@gmail.com>
Date: Wed, 16 May 2018 12:37:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180516171948.18406-1-twoerner@gmail.com>
Subject: Re: [meta-oe][PATCH] grpc: switch away from github archive
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
X-List-Received-Date: Wed, 16 May 2018 19:37:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 05/16/2018 10:19 AM, Trevor Woerner wrote:
> Since we know that github archives which are automatically generated have a
> tendency to change their checksums[1], switch to using a git clone.
>
> [1] http://lists.openembedded.org/pipermail/openembedded-devel/2017-September/114916.html

This recipe is in the middle of moving to meta-networking ie in
master-next not yet merged to master.

either the meta-networking maintainer will integrate or maybe a rebase
on master-next would be helpful??

thanks for the patch.
Armin
>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  meta-oe/recipes-devtools/grpc/grpc_1.8.5.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.8.5.bb b/meta-oe/recipes-devtools/grpc/grpc_1.8.5.bb
> index 0883ec176b..a0c943d114 100644
> --- a/meta-oe/recipes-devtools/grpc/grpc_1.8.5.bb
> +++ b/meta-oe/recipes-devtools/grpc/grpc_1.8.5.bb
> @@ -10,13 +10,13 @@ DEPENDS_append_class-target = " gtest grpc-native "
>  
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>  
> -SRC_URI = "https://github.com/grpc/grpc/archive/v${PV}.tar.gz \
> +S = "${WORKDIR}/git"
> +SRCREV = "db68cb3652cc7697647e9934b5316d98a6ba04d1"
> +BRANCH = "v1.8.x"
> +SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;branch=${BRANCH} \
>             file://0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch \
>             file://0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch \
>             "
> -SRC_URI[md5sum] = "b565fa6787e42f4969395870c2ad436e"
> -SRC_URI[sha256sum] = "df9168da760fd2ee970c74c9d1b63377e0024be248deaa844e784d0df47599de"
> -
>  SRC_URI_append_class-target = " file://0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch"
>  
>  inherit cmake


