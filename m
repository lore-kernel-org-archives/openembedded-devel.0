Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 37F7860290
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 15:52:01 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id zy2so12551182pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 08:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=SBv16qkziGW+hPgIVt9hnwayISos2MAqx++9siO3uBE=;
	b=S9GcnV8ruHGYFnseaYJqEbWBmYB37/3NrJHxqrIkm4PDPdKJ4btH4wtWZPuECVZH9c
	ZwP8hlfHWWY/nbUjtpnk1MbvFeygNId00rkLMoCfnNbLh66N7jJK9ohUD7SXlJG4ZjwX
	gXq9nD4KUzpViViRwzlo8DxSLad+GacfQk33DxgAWbFF0J5cM3wQGGFHvjCkllqAVwnA
	qPCYLOi1o5aRUKPzQvp+/qH9x5NhSV4HslxEG5Y4wfaPRSXwtNEXi6Y1as7fQjw5bSjt
	RuDFODbQ+kgHkJltTcpttfug2NMIE4hLcvuj867ga1PP85heECRQnI127dXY4+CtjgLl
	OVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=SBv16qkziGW+hPgIVt9hnwayISos2MAqx++9siO3uBE=;
	b=DJeODzGtm8TPGeqHH/g5vFfNmOO1zJ4c/8KIdvQouHE0oLvMerA+DoJ1VS40r5XenO
	hoxc1HRUA88cw6bTSiF75DxSj1EgrE05M0U88o+sx7n2ioiraxUTpZbVKs6JseGxdVdK
	1CyeVHV9nPJcmnln65ekbDPixbNmigE+NRHEjKsWt6X6Gy3cxYezu8lKh43xDVXsmzXZ
	0oxaPCpVf7q1RT9vgH91BuosWy4H22UTdK1QI/CrteTCFhJH2N+ah9I2bROQOeLT8+MQ
	eueGeS3BK7MzySyCnGb3ZMJK2yu8fey/1BDLEiDfg5dtwW5wn+fuD5FBXEpUOdLij5hN
	lk1Q==
X-Gm-Message-State: AOPr4FUaQttWEWp3FRrMmulG0MQ6InnrzGuwGQO6/dK0H7qk8LkWvbe0/GYX2NvVlSna1w==
X-Received: by 10.66.153.174 with SMTP id vh14mr30135463pab.131.1462549922950; 
	Fri, 06 May 2016 08:52:02 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:6856:c509:b9ca:c5c1?
	([2601:202:4000:1239:6856:c509:b9ca:c5c1])
	by smtp.googlemail.com with ESMTPSA id
	i6sm21985831pfc.65.2016.05.06.08.52.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 May 2016 08:52:01 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
	<1462543259-7206-8-git-send-email-otavio@ossystems.com.br>
	<20160506141621.GD2544@jama>
	<CAP9ODKq_Jkd912c8TwBS7u1+M_hwHjM6DKxAM15TuUzBsrgvxg@mail.gmail.com>
	<20160506143347.GF2544@jama>
From: akuster808 <akuster808@gmail.com>
Message-ID: <572CBDA1.4050608@gmail.com>
Date: Fri, 6 May 2016 08:52:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20160506143347.GF2544@jama>
Subject: Re: [meta-oe backport krogoth PATCH 08/22] ltrace: Error Fix for ARM
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
X-List-Received-Date: Fri, 06 May 2016 15:52:02 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 05/06/2016 07:33 AM, Martin Jansa wrote:
> On Fri, May 06, 2016 at 11:20:56AM -0300, Otavio Salvador wrote:
>> On Fri, May 6, 2016 at 11:16 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>> On Fri, May 06, 2016 at 11:00:45AM -0300, Otavio Salvador wrote:
>>>> From: Li xin <lixin.fnst@cn.fujitsu.com>
>>>>
>>>> 1) The error is as following:
>>>>      root # ltrace ls
>>>>      __libc_start_main(0xb6fbc018, 1, 0xbed8fdc4, 0xb6fd0b88PTRACE_SINGLESTEP: Input/output error
>>>>      2747 couldn't continue when handling __libc_start_main (0xb6fbbde0) at 0xb6fbbde0
>>>>    The master branch fix it.
>>>>
>>>> 2) remove unused patch:
>>>>      --0001-ltrace-fix-gcc-5-logical-not-parentheses.patch
>>>>      --ltrace-0.7.2-unused-typedef.patch
>>>
>>> This still has issue reported here:
>>> http://lists.openembedded.org/pipermail/openembedded-devel/2016-April/107207.html
>>>
>>> I would prefer not to backport it to kergoth until it's fixed.
>>
>> Sure; makes sense. Do you want me to resend the patches with this one
>> dropped or you drop it when queueing?

no need to resend. I will drop it when I pull them in.

- armin


> 
> I'll let Armin to consolidate pending changes and send pull-request
> after he tests them, so the question is for him not me :).
> 
> 
> 

