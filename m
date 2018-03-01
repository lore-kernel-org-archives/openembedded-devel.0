Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f53.google.com (mail-pl0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0513B6FF84
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 14:49:31 +0000 (UTC)
Received: by mail-pl0-f53.google.com with SMTP id f23-v6so3752010plr.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2018 06:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=AVyN3mlobnfUVBOWskQef9s3oLrH44cMHO5K1mTrZyA=;
	b=OjcZbjrt7xjGY7LbCKtuzI7Qrbwh4fp6itt4otnjOnrfjx7gSqlbA5/QlIanWwrj1r
	IomOthc85P8FrIMwV79Ae6lLAu+7MaiE1+2kh0saLV+QDGmBMTSQt3zQbI8w2nkayvWd
	8Fbia0CoXqGtQzhDUqQvxq+OckS/z1No/pkbUyXBY245ylUleiz+Trhd+Fbej4dppypE
	ChiDCO4tLt5HmQ2I81PERE/8H4eaV+ygUZJ2C4Iq8hS7aGzoEigVo4WJGZFSn8jDmTYR
	m0otVBJPLRKJwszYJWUdY+VfJ0TguaJRnrIfUHTyQVxO8n5Brc5ZHR/OqLpqyJTrWEKJ
	jMmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=AVyN3mlobnfUVBOWskQef9s3oLrH44cMHO5K1mTrZyA=;
	b=J2zsIR0EEwrRYlh8We9Tpoc0zYwDfhsMKTX3G18lVc8fvPSgEjLfBlT0SodG2aqAn6
	YoRVC228YXIhnzG6/GEBiH+0uHpsoKHHOqxDaWYa4Lu6keBgi+sMlCB6NxY3g4NVX37a
	2+Ot226sLiSfGbEsEwM2jde6RTZSfeMaZhMhsXmyNXr/rBNuNjAFs/uFNWjFG+dqWewM
	6YU8ksmvy1wn/glg2twahhHFRNVEB3/XLUJ52f7jRnUhc4USrMSCeC9c1KsyhE2oDh7K
	oo/0fUDeOs6fi/W+7TEPSerXSv7VNqO3Z5IdYtrgEfQGJYnJg2OOys7eJKC1LJncJa5r
	2Wcw==
X-Gm-Message-State: APf1xPBZbpQFnWNo4hvnwJQolOKiBsC17xl2w3/mR4tInIasOi8rNjd3
	PVYcjjy2W+5bzFWtUlktJlRuWQ==
X-Google-Smtp-Source: AG47ELtAjpVI3e0ZGUiZ6t0xIh7BrrlHf0uKok7I3ucwrTIbewnwqTphiCDGxZae+WjkoQvJRp55LQ==
X-Received: by 2002:a17:902:8285:: with SMTP id
	y5-v6mr2196453pln.190.1519915772597; 
	Thu, 01 Mar 2018 06:49:32 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:b885:642e:b8e3:aa2c?
	([2601:202:4000:1184:b885:642e:b8e3:aa2c])
	by smtp.gmail.com with ESMTPSA id
	h69sm9411997pfe.97.2018.03.01.06.49.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 06:49:32 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>,
	Philip Balister <philip@balister.org>
References: <96413928-3e82-ef2d-d0ba-99666167ccb3@balister.org>
	<CA+chaQe6Wj5gz-ARk+CEBHB2ymWS2ccEvtSs6w05rtcmpN_izQ@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <d9cdb338-ceeb-88af-74f5-a69a4278afc2@gmail.com>
Date: Thu, 1 Mar 2018 06:49:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQe6Wj5gz-ARk+CEBHB2ymWS2ccEvtSs6w05rtcmpN_izQ@mail.gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: meta-python/rocko
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
X-List-Received-Date: Thu, 01 Mar 2018 14:49:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Check rocko-next.



On 03/01/2018 06:39 AM, Martin Jansa wrote:
> Read this thread:
> http://lists.openembedded.org/pipermail/openembedded-devel/2018-February/116622.html
>
> On Thu, Mar 1, 2018 at 3:22 PM, Philip Balister <philip@balister.org> wrote:
>
>> I'm trying to build some gnuradio related stuff and am running into
>> issues in meta-python with DEPENDS and missing recipes. Does anyone
>> understand what is going on and have a plan to fix it, or do I need to
>> dig further and figure out what needs doing?
>>
>> Philip
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>


