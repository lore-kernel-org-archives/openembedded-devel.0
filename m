Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7CCF37C74F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Mar 2019 01:46:27 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id i19so7165469pfd.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Mar 2019 17:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8VDIzCciEnQPz8W/m5/TcAmEV7sW840TxWoLn9Pr9OY=;
	b=dBV1qoT5vR8PKML/IHlP0TDqEd1Xd02+hGikeBddUpR7fXEiTV6kxPbsv3VCVCg1uS
	e3k7hxWrB/zC8oyYOjTG7jEHldkFEizWjQRvSn1lbhI2bRdWtGLK0+RnWmtt7zBlPD0U
	m1vKz4225p803x32WMzBZ5SsvdotmGXD3eZ63bE0gSddJh7EY992ewl3vCbDqtvgrBa5
	DaL7/6yHsOgWyWrEtvXJDUIU88OEUv/o1NAJnxxzsC/8TAbYVJVqOxnxOTDW0FcrJea6
	+BznmWL7uboMjGZunK4Nijih7f2WdUWgBtsGcgieCkGYigvaJW6+Txdd1rBBwQ6DzY9t
	58aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=8VDIzCciEnQPz8W/m5/TcAmEV7sW840TxWoLn9Pr9OY=;
	b=LYv53IAyqR5VKJ5PYT7623SoIdNF4DwlwKCBeirmTvwrcuNlVfzyGOXgAPkeYDmjuK
	ZPFdEbZhMjOY9Ik3DpoJQMqBiElvMH/1BVc4Qr+yHHmDaa9c8eJnNZD+wzF7SxJHoSmx
	NGNgFWBmTi4Q+nHqfxC8ePWZURaBW7M8vFfqqGIE6n1xVWI3pWkQNBzTZvMt4JdePZJN
	SlRx7lBSLR8PxXltWWoicwG3B0XLccKwwIezrVFnSpHs1aX9e25wjf9kPJbAkTVkrKkl
	W71HUbP0+ihxixEy85jNGvE7Y2lURz5qQZVfgTKvsFl1xAkXIumTxHYw9+Pgqi27Oyqw
	aebg==
X-Gm-Message-State: APjAAAXCWi+6fLI9y7O4TV+6JmaVNhi4yUwmGS9pk5dj3TtmIxz53BFq
	41CBwDLdvhPTJZq4ZtkbEHm7+pmT
X-Google-Smtp-Source: APXvYqyxGwbuRpIugzA9swjltiClyBk61mjqUE4KoKGPTRRJrZpd77BfZAgUQt3iszIB8R6hYVwYZw==
X-Received: by 2002:a65:5c07:: with SMTP id u7mr4088147pgr.320.1551836788105; 
	Tue, 05 Mar 2019 17:46:28 -0800 (PST)
Received: from hermes.local ([2601:646:8500:6bc6:e91a:c092:698a:a99])
	by smtp.gmail.com with ESMTPSA id p6sm249321pgd.69.2019.03.05.17.46.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Mar 2019 17:46:27 -0800 (PST)
To: kai.kang@windriver.com, joe.slater@windriver.com
References: <20190306013707.135575-1-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <6292df0f-57b6-753e-390e-cfb9d473f1f8@gmail.com>
Date: Tue, 5 Mar 2019 17:46:26 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:65.0)
	Gecko/20100101 Thunderbird/65.0
MIME-Version: 1.0
In-Reply-To: <20190306013707.135575-1-kai.kang@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] leveldb: fix compile error with default tune 'mips'
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
X-List-Received-Date: Wed, 06 Mar 2019 01:46:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/5/19 5:37 PM, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> When build leveldb with default tune 'mips', it fails to compile with
> errors:
> 
> | {standard input}: Assembler messages:
> | {standard input}:8004: Error: opcode not supported on this processor:
>    mips1 (mips1) `sync'
> | {standard input}:10296: Error: opcode not supported on this processor:
>    mips1 (mips1) `sync'
> | make: *** [out-shared/db/db_bench.o] Error 1
> 
> Add 'mips32' to TUNE_FEATURES which eventually add '-march=mips32' to
> CXX to fix the errors.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   meta-oe/recipes-dbs/leveldb/leveldb_git.bb | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/meta-oe/recipes-dbs/leveldb/leveldb_git.bb b/meta-oe/recipes-dbs/leveldb/leveldb_git.bb
> index 8fec89c6f..f0e434077 100644
> --- a/meta-oe/recipes-dbs/leveldb/leveldb_git.bb
> +++ b/meta-oe/recipes-dbs/leveldb/leveldb_git.bb
> @@ -17,6 +17,14 @@ S = "${WORKDIR}/git"
>   
>   inherit utils
>   
> +# leveldb fails to compile with default tune 'mips':
> +# | {standard input}:59226: Error: opcode not supported on this processor: mips1 (mips1) `sync'
> +# | make: *** [out-shared/db/db_impl.o] Error 1
> +python () {
> +    if 'o32' in d.getVar('TUNE_FEATURES') and d.getVar('DEFAULTTUNE') == 'mips':
> +        d.appendVar('TUNE_FEATURES', ' mips32')
> +}
> +

This does not seem to be correct, this patch is forcing a different arch 
for leveldb, which maybe wrong assumption.

>   do_compile() {
>       # do not use oe_runmake. oe_runmake pass to make compilation arguments and override
>       # leveldb makefile variable CFLAGS and broke leveldb build.
> 

