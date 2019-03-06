Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1515F71984
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Mar 2019 01:50:26 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id n22so7169167pfa.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Mar 2019 17:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=gwkd3udu7lACJtyL9+m6Gmrn0G0TT13j1T2E5Y4n6E8=;
	b=ZZKNOAILEAJy/QREn9lrIU9HXDHPQ897W+ym4TEAMh9yaXSGDf18op/FYdWTMy37+S
	8A8uuTOdxe7YrIwdIEsIxBT8u3kZ+GTsmpE4IaucudOS646GJhQVGMb6fG9wRj1dtjVJ
	+N31R9z0v3d6oDNtD68I+kSyOQuAinGNaQbj3b6nD+rpWsdFf6SYecDvTw74XtGhRf69
	f9/iBI6MMXQrcE+HitAfeTe3BFVr42w88APRV/2NaL+9z7WCXxjTICTm+bti46Wm6RTo
	fPfZU3pnGf78grlu3YshilFecAZyH5eabOS9HWIuoSgELsg2qsx02XUFLZMn1r2KcxcK
	F4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=gwkd3udu7lACJtyL9+m6Gmrn0G0TT13j1T2E5Y4n6E8=;
	b=hB288hfDS/GR8yQUHAf7woN15ZYvskKhEINohKToJywhr3bj5x3XBodjZ1sg6kvMkH
	qZqwZjsweLEqTyrETnR5CdQ28NMSLZxGgXULkI7w52NHqN5vX36ID9RAY9a9CQKsZO8g
	Jq9nG77VsIaknMn/XIf1NBAOlSVTf8TKs1aDfQfWA2zw+2vpN82GWWhruFTvCKYrg7CH
	W4zDuOB+HmZtVJeRF3B1SE1mPodsyqKi1V8SbdbzUB8wtPgZsbKNVBHm9h2vxIiPgLw6
	70xIDRlujeTb3kEYC5nBxrXVs9Qd5V+YIH88K9V97GJDdtx0FPyoZEWfvEpB2A+qq7F/
	HlAw==
X-Gm-Message-State: APjAAAXLjUMMaKNrj829ldT3SAsljs8I9kD+S/04TluJYUKfzQgpin5I
	+8o+VOU7di+BX9uvf8FVIXfSH7s5
X-Google-Smtp-Source: APXvYqwWjG8nAgIy56bxTjk2Ja0INmP0h7P+w5q7ILlXZY9ZLfL9PWOCN5GQX/qoaJ2c48a7v2gFAg==
X-Received: by 2002:a63:ce4a:: with SMTP id r10mr3849320pgi.336.1551837026810; 
	Tue, 05 Mar 2019 17:50:26 -0800 (PST)
Received: from hermes.local ([2601:646:8500:6bc6:e91a:c092:698a:a99])
	by smtp.gmail.com with ESMTPSA id g6sm248922pgq.54.2019.03.05.17.50.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Mar 2019 17:50:25 -0800 (PST)
To: Maxime BORGES <maxime.borges@strataggem.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <20190225140010.19025-1-otavio@ossystems.com.br>
	<CAMKF1sr88He+DDgyaRWdabY8d0xuV5jM8faQgBSeYOCY0zpaYg@mail.gmail.com>
	<CAJTo0LZFz3mLSROPrV3y09L4ZTSZ5T+uO=8MRKmrReDoLLDf7w@mail.gmail.com>
	<CAP9ODKroyRVLaK640+UZv2idv3FnZ2NC8hgMqQDQU63f9-QQiA@mail.gmail.com>
	<CAMKF1sqbAFbXdeJTL=gtJU4QzdPwdwEW5R01gpnUx4OhB_YtjQ@mail.gmail.com>
	<CAMKF1sp61cfBXHTuPzMeQGfuK3SXv2h8kdDq5z1nAhC9_hUTLw@mail.gmail.com>
	<7351b76e423f4e2897e99b536e8c0efd@strataggem.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <edac37cd-bc5c-fffd-e818-57369eed244a@gmail.com>
Date: Tue, 5 Mar 2019 17:50:24 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:65.0)
	Gecko/20100101 Thunderbird/65.0
MIME-Version: 1.0
In-Reply-To: <7351b76e423f4e2897e99b536e8c0efd@strataggem.com>
Cc: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe PATCH 1/2] python-idna: Avoid removing '+x' from `.egg-info/` directory
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
X-List-Received-Date: Wed, 06 Mar 2019 01:50:26 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Maxime,

I think we need to understand it a bit better, eg. should we need to 
change the mode for directories or just files. I Think it deserves a new 
patch, I am going to apply Otavio's patch and then you can try if that
does not work then lets fix it by changing perms for files.

On 3/1/19 8:38 AM, Maxime BORGES wrote:
> For reference:
> 
> https://github.com/openembedded/meta-openembedded/pull/92#issue-216348464
> 
> ------------------------------------------------------------------------
> *De :* Khem Raj <raj.khem@gmail.com>
> *Envoyé :* vendredi 1 mars 2019 16:56:31
> *À :* Otavio Salvador; Maxime BORGES
> *Cc :* Burton, Ross; Otavio Salvador; Meta-OpenEmbedded Mailing listing
> *Objet :* Re: [oe] [meta-oe PATCH 1/2] python-idna: Avoid removing '+x' 
> from `.egg-info/` directory
> Otavio
> 
> Can you resend this patch series, its missing in patchwork, so
> hopefully, it will catch it this time.
> 
> On Mon, Feb 25, 2019 at 11:05 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Mon, Feb 25, 2019 at 10:38 AM Otavio Salvador
>> <otavio.salvador@ossystems.com.br> wrote:
>> >
>> > On Mon, Feb 25, 2019 at 2:03 PM Burton, Ross <ross.burton@intel.com> wrote:
>> > >
>> > > The original patch doesn't explain what it's doing and is clearly
>> > > going to remove executable bits from directories, which clearly isn't
>> > > right.
>> > >
>> > > I'd say remove it, and *then* if it breaks again fix properly.
>> >
>> > I am with Ross here. It is a really ugly patch and if need, we need a
>> > comment on the code and a proper reason to add it back.
>> >
>>
>> +Maxime for information on the original patch

