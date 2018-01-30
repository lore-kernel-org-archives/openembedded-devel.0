Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9127078260
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2018 20:50:59 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 17so8816700pfw.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2018 12:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=BLmGix4LLUqqE/l4Nil8mTyJgh1dOYRgvoxVjX9WQAY=;
	b=gMVQEDY65GIBVQBYiye7Mi8sN4rRWsucOZD853IUCrXCX2BKNLSk0Rce6MOXp7QPOI
	PBsrvGdLm0vlT2YvSR1kKDJolKliYqWr8h6QE5LNJrNdLuMPYDJznag68hpcI9CcWy0r
	/RHcBzwth9paU1VHtRjFe7I0YpqbQxPkRPIA6FSlmcFFLHW5dYO2PGixQmJQ+9HeZ7FR
	dOXiV+Lki5mQpoXXmIhomVEuxjltuZ5ntOkP5DbwH9SpQ5BTfez4l7YVWWQY6h+UN2tr
	qVbfz37HIpEWVH59/BpGrvePLBXtzcAp5csxWkBzFgrZRp5SgYWmycrPEQ6p3FecpUXX
	FMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=BLmGix4LLUqqE/l4Nil8mTyJgh1dOYRgvoxVjX9WQAY=;
	b=L5OJjL9vF4jwPqZP12RKn3gn4JMldbTuXuFH+n3ft+WBG41N564h4b/4p7xEPdd/vD
	DjOd4UC6YnO1+boRlNVX3sOyq/5zgXiK/ZUIGTCB0Pu2fe3u8raErWpGvDJlZyClxpiU
	6tskhCNVQ0J92078I6aJiy1XsQfgFQPXAzAbuahgrGO6k1t3tSL+aFncB58keirLpLYX
	oHdQ2qE1cXBd1CB+KHs+0wd5U9xAF22ALuUuEWe/PWUl5/1gqY9iv5EfcKci53j0qvDb
	eZ2z9L2TMWHDOT3A++oFmAlJRKIwU4fToZYrArCgau0EjeEivPYs+3BgSI8qpXZYl4ve
	K3Cw==
X-Gm-Message-State: AKwxytfs2YThkgMIomElXRpOyk1bGZLruyzSPRDM3MsJlA6fCFWxhfJJ
	+0aYB+I8fYrL4OZF0OPr1zWsdY6o
X-Google-Smtp-Source: AH8x224Cnc/DKMVyUbQ5h1DXK46jxzlbocCLaXrtYatu1cviytftO7jU9XBs95QNoFSYBhEwWpBb7Q==
X-Received: by 2002:a17:902:988b:: with SMTP id
	s11-v6mr25077132plp.99.1517345460559; 
	Tue, 30 Jan 2018 12:51:00 -0800 (PST)
Received: from ?IPv6:2601:646:8880:466c:4c3e:ac59:6e73:b998?
	([2601:646:8880:466c:4c3e:ac59:6e73:b998])
	by smtp.gmail.com with ESMTPSA id
	v1sm21742692pfg.33.2018.01.30.12.50.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Jan 2018 12:50:59 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <20150818095451.0B5435036F@opal.openembedded.org>
	<CA+chaQeSwgn=YjGCifcokcB7eAe4Ygr-Y9c7_--urFd-2=3QVA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <cfa2831f-e6ee-6916-342f-d9f4a94ef1d3@gmail.com>
Date: Tue, 30 Jan 2018 12:50:59 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQeSwgn=YjGCifcokcB7eAe4Ygr-Y9c7_--urFd-2=3QVA@mail.gmail.com>
Subject: Re: [oe-commits] Li xin : tiptop: upgrade 2.2 -> 2.3
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
X-List-Received-Date: Tue, 30 Jan 2018 20:51:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/30/18 6:27 AM, Martin Jansa wrote:
> Anyone else seeing random failures with this one?
> 
> /usr/src/debug/tiptop/2.3-r0/tiptop-2.3/src/utils-expression.c:191: error:
> undefined reference to 'yyparse'
> /usr/src/debug/tiptop/2.3-r0/tiptop-2.3/src/calc.lex:75: error: undefined
> reference to 'yylval'
> /usr/src/debug/tiptop/2.3-r0/tiptop-2.3/src/calc.lex:75: error: undefined
> reference to 'yylval'
> /usr/src/debug/tiptop/2.3-r0/tiptop-2.3/src/calc.lex:65: error: undefined
> reference to 'yylval'
> /usr/src/debug/tiptop/2.3-r0/tiptop-2.3/src/calc.lex:65: error: undefined
> reference to 'yylval'
> collect2: error: ld returned 1 exit status
> make[1]: *** [tiptop] Error 1
> 

wonder if its missing dep on bison

> On Tue, Aug 18, 2015 at 11:54 AM, <git@git.openembedded.org> wrote:
> 
>> Module: meta-openembedded.git
>> Branch: master
>> Commit: 4638d7223aa48639238c35b019e1ca86151a0b65
>> URL:    http://git.openembedded.org/?p=meta-openembedded.git&a=commit;h=
>> 4638d7223aa48639238c35b019e1ca86151a0b65
>>
>> Author: Li xin <lixin.fnst@cn.fujitsu.com>
>> Date:   Wed Jul 29 17:54:11 2015 +0800
>>
>> tiptop: upgrade 2.2 -> 2.3
>>
>> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>
>> ---
>>
>>  meta-oe/recipes-extended/tiptop/{tiptop_2.2.bb => tiptop_2.3.bb} | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-oe/recipes-extended/tiptop/tiptop_2.2.bb
>> b/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb
>> similarity index 87%
>> rename from meta-oe/recipes-extended/tiptop/tiptop_2.2.bb
>> rename to meta-oe/recipes-extended/tiptop/tiptop_2.3.bb
>> index a803e26..5a98116 100644
>> --- a/meta-oe/recipes-extended/tiptop/tiptop_2.2.bb
>> +++ b/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb
>> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=
>> b234ee4d69f5fce4486a80fdaf4a4263"
>>  DEPENDS = "ncurses libxml2"
>>
>>  SRC_URI = "http://tiptop.gforge.inria.fr/releases/${BP}.tar.gz"
>> -SRC_URI[md5sum] = "74255a29acf44569db021b080ad3e3f7"
>> -SRC_URI[sha256sum] = "965cb99b16cb59df78363d83b62877
>> ce8501b0aac1116a86bed8a16aa96b171d"
>> +SRC_URI[md5sum] = "f1fba1e90465b0e5a3865b19133fa19d"
>> +SRC_URI[sha256sum] = "3f07e958b40acaeab98e9eb1326c9f
>> 91b0be0a782c1cc2bd7a9e18d31fab18ca"
>>
>>  inherit autotools-brokensep
>>  EXTRA_OECONF = "CFLAGS="$CFLAGS -I${STAGING_INCDIR}/libxml2""
>>
>> --
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>>


