Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4417F60745
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 14:20:58 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id 77so50227072pfv.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 07:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to; 
	bh=yDvSMt7aUreKhq7r+MLuUnikXr3F1WukdNU1MKzqPf0=;
	b=az4xs8Rqw3gpF2hUbu7sKAoJyoZkhpqDGjGudU8ZcCGYDlzCyEALan/CMKbt0EObRK
	MZGkinYyWuCqwLKO1uln6nqtF5IDdnVgj3Hu1aVYQm705CgFHPnbfLP1y+PGNVnF/y5y
	VJ6/DscGaSc4PfhDTruVb582LAJ7gnwUUKm3jFDwdVgp27+hUG8r5yNZLYN6B9RCxVnj
	e7gjyjPDZ84yMFoRg7YHjtcI1OiXOJqoCWAJc0MKKZRRZaDGmtkColwoKHW8Y41zlKC3
	mtGpmRbNfhsfq8NJsdI5coRjv51VQSFH2zMU52x6LLK48RFRQYmmPzyKzPnVOFBom/3+
	/tig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to;
	bh=yDvSMt7aUreKhq7r+MLuUnikXr3F1WukdNU1MKzqPf0=;
	b=fjQwX3TERmv8HV8xrguZ6v4F7e52AApYpHesQU9/yUTEaGFZHEFvsR6Or2bH6WYwEG
	yGf7buFVgjLGgzTWtrQ9Ai44g/B8Z1a08jNZXXxrKOZT6RgNZBgdsCZz0Le5EgW7gj4Z
	iBAyJhbJZAa86N24Prwuziewze0H8otkinqj/ocRGygJx5mQ4H+HU84BJjReVD4xXPu3
	kuIzVW6+jbXoTujaWjwhaRr4qTNzYig80v1LfpX6K4Rxl8yArTFfbjXqg54HuG9bfjRv
	JOedemJXLn0z6ga+sEUXWrBSCEgjDzzfys9JgBBCFjxmsDdkb1xBApQxgfD/XY+Wtgtt
	57zg==
X-Gm-Message-State: AOPr4FW0Vx/7MrahpfjlhYaseicsr8eWBfZtGX2OQGLthCAyrrmfFZCa/Rh3P8ZYI53PzA==
X-Received: by 10.98.44.72 with SMTP id s69mr29362703pfs.31.1462544459039;
	Fri, 06 May 2016 07:20:59 -0700 (PDT)
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com.
	[209.85.220.46]) by smtp.gmail.com with ESMTPSA id
	fn3sm21632664pab.20.2016.05.06.07.20.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 07:20:57 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f46.google.com with SMTP id iv1so48006486pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 07:20:57 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.67.14.7 with SMTP id fc7mr29107456pad.1.1462544456777; Fri,
	06 May 2016 07:20:56 -0700 (PDT)
Received: by 10.66.231.37 with HTTP; Fri, 6 May 2016 07:20:56 -0700 (PDT)
In-Reply-To: <20160506141621.GD2544@jama>
References: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
	<1462543259-7206-8-git-send-email-otavio@ossystems.com.br>
	<20160506141621.GD2544@jama>
Date: Fri, 6 May 2016 11:20:56 -0300
X-Gmail-Original-Message-ID: <CAP9ODKq_Jkd912c8TwBS7u1+M_hwHjM6DKxAM15TuUzBsrgvxg@mail.gmail.com>
Message-ID: <CAP9ODKq_Jkd912c8TwBS7u1+M_hwHjM6DKxAM15TuUzBsrgvxg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Fri, 06 May 2016 14:20:58 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 6, 2016 at 11:16 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, May 06, 2016 at 11:00:45AM -0300, Otavio Salvador wrote:
>> From: Li xin <lixin.fnst@cn.fujitsu.com>
>>
>> 1) The error is as following:
>>      root # ltrace ls
>>      __libc_start_main(0xb6fbc018, 1, 0xbed8fdc4, 0xb6fd0b88PTRACE_SINGLESTEP: Input/output error
>>      2747 couldn't continue when handling __libc_start_main (0xb6fbbde0) at 0xb6fbbde0
>>    The master branch fix it.
>>
>> 2) remove unused patch:
>>      --0001-ltrace-fix-gcc-5-logical-not-parentheses.patch
>>      --ltrace-0.7.2-unused-typedef.patch
>
> This still has issue reported here:
> http://lists.openembedded.org/pipermail/openembedded-devel/2016-April/107207.html
>
> I would prefer not to backport it to kergoth until it's fixed.

Sure; makes sense. Do you want me to resend the patches with this one
dropped or you drop it when queueing?


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

