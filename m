Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id CB1F571A3E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 03:04:05 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id y39so22533014wrd.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Oct 2017 20:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iS+OrgThSyhRntmj5xOusfkJCbHoGz9Clj5pCYH6mVM=;
	b=M5I9mOAL6f3Erwao1gwg5qXsFBKLM5FO4Ar/FhF7SlwQGiGkOWpYsfoyiBtC31bId9
	+yT4JtCsYJhj7dYvN4PkxDXkr9iLGCZe1yzwyxkz4pDJAJv8+iPYgpmJbXgH8dCg5CDC
	7Gt5uq2ZIR9FDvos/6j0SwZ5ODeeMrFgx6p6yyN2nZCnxq0R6UntZ1ECjIyDosx8LRg4
	chQMpwLRoo91FGrtvdG6Osmybtmy8IYU33cylDkHmx1HxtmA4dUbOZ0zuQyuNwp3h86s
	KOSjPe+wbK5LU/PViZ70bm7j48rDfSNtmpVycqBrJjIvzDrTLfOX7JtCrF1Eos7fKaor
	Ld/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iS+OrgThSyhRntmj5xOusfkJCbHoGz9Clj5pCYH6mVM=;
	b=a2OMWLjYQNKDY2yGTC6/9ksvR6Xbzpu0fzuKjBhPf3iqWhnFGE3smOUGWiOgfLnHgs
	89IdkjY4arwjvvp/eeIW4xkJNM5BnCAA19fq285DFwKinq+mBX28glvYCQyLsB9rft7J
	smCsFF0W2knIuCLEo9UyghP3iyXEvq+XwDbPuUpxp5Zm1b3s8BGovf8ZlUyTPkEFhk3f
	06vl1pDbqvJdBAWkV7NEhHe+GEwFZiRxuYBoeb86X8JNiekwVw92bLkMtooDFC3Tp20G
	fePVRh0AI+MqW4318AQ7VbYPM1f941XTDmS3WZ4QuwgIc3L9wBBn7pBtdHhUEX3WdpcC
	+AAQ==
X-Gm-Message-State: AMCzsaU1GBvIAP1MG4e95I+K8vNtVPJsxKHIBsQ841sVtTvr2VF/9JoQ
	tHM+gL562jCy7Gf9yUXqb1C2umIafkcM0dEGtRc=
X-Google-Smtp-Source: ABhQp+QHFSGlcnxiMjNi9zXI8/tgnm0Nu/lwOPM4zwfJ/4ZhgBkmr/nADo1nxy20RWIGN/zg0J+kCCL+2oaz4Pbbl0k=
X-Received: by 10.223.145.165 with SMTP id 34mr468162wri.140.1508900646565;
	Tue, 24 Oct 2017 20:04:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.166.19 with HTTP; Tue, 24 Oct 2017 20:04:05 -0700 (PDT)
In-Reply-To: <CAMKF1spgp2wy04B+7YXN047HUBJaD9G1JyEV8L_9RN2K6iXNvQ@mail.gmail.com>
References: <CABR-LLfMQQQvADAH6Z__-L+Pw0BEGnwn+-_E_C36XUwV+X9_8A@mail.gmail.com>
	<CAMKF1soLSiKO1kxSr0nt8HkYjzn_PpJdLmfRRWp6U6szML-YnA@mail.gmail.com>
	<CABR-LLfXBspMaoGXaJnT2iE=zAdyfMWE=zctbzarzfJbXFS1kg@mail.gmail.com>
	<CAMKF1spgp2wy04B+7YXN047HUBJaD9G1JyEV8L_9RN2K6iXNvQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 24 Oct 2017 20:04:05 -0700
Message-ID: <CAJ86T=WCjedqHjZ0Fr8hTYySUzJOV1SsHQTcUmRLCoXQympzxA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-webserver] [PATCH] fix nginx with large files support
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
X-List-Received-Date: Wed, 25 Oct 2017 03:04:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 24, 2017 at 7:55 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Oct 24, 2017 at 6:47 PM, Wangchong Zhou <fffonion@gmail.com> wrote:
>> Thanks! This should work.
>>
>> Signed-off-by: Wangchong Zhou <fffonion@gmail.com>
>> ---
>>  meta-webserver/recipes-httpd/nginx/nginx.inc | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc
>> b/meta-webserver/recipes-httpd/nginx/nginx.inc
>> index 4a97e2670..00ce132b3 100644
>> --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
>> +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
>> @@ -41,6 +41,12 @@ do_configure () {
>>      else
>>          PTRSIZE=4
>>      fi
>> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'largefile', 'true',
>> 'false', d)}; then
>> +        OFFTSIZE=8
>> +    else
>> +        OFFTSIZE=${PTRSIZE}
>> +    fi
>> +
>
> I was looking for something like
>
>  --with-off-t=${@bb.utils.contains('DISTRO_FEATURES','largefile','8','${PTRSIZE}',d)};

That won't work since PTRSIZE is a shell variable, not a bitbake variable.

