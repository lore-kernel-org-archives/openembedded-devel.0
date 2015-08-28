Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id BC9CD71633
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2015 14:11:12 +0000 (UTC)
Received: by wiyy7 with SMTP id y7so157971wiy.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2015 07:11:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=IVq8OW//bx/qNDLPelNhkkQLeAiWsVHD8WqRcmF/PtQ=;
	b=g4coEn1O6OfkOySP8rXpXbXqkLra4+Y0BcqCjS91WKXc87Ae7Z4esDBosG0M+tHHH8
	W3mhoCyjWSU8qt/Ay2O+FcM3UbXQtZQny+Fs6lDzUJ7wuyR9MBAkDoV1B0isTJtUkPwV
	m3q9Uu1n2SR38n0cXsOOifVrb4Gqyl3aLx8fzJRUbkDuOz0N6U+dfFMOl7c0aCh1WFmq
	Igw2l4N5mq+cKhB6pzDubq8wvKpLBQhXafK1LqbY8i9vSBb182T1zONF8DQBJByuOebf
	87I9zDfmYD5KIKvZwW5EYTL5ELb0xOkpAK9vxGmTgeOXvwcumqLtTbMKAzWQLcKUGPzy
	1YUg==
X-Gm-Message-State: ALoCoQn6Y24inC0ZsZ03yslFHQ5iksDZLdDw98nCFCIuJjPnHXeEgTJwwVl6/E8fMI4Idgd509Ci
X-Received: by 10.180.39.229 with SMTP id s5mr4999372wik.58.1440771071920;
	Fri, 28 Aug 2015 07:11:11 -0700 (PDT)
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com.
	[209.85.212.182]) by smtp.gmail.com with ESMTPSA id
	gt10sm3976241wib.20.2015.08.28.07.11.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Aug 2015 07:11:11 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by wieo17 with SMTP id o17so17158501wie.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2015 07:11:11 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.180.186.41 with SMTP id fh9mr4818390wic.7.1440771071011;
	Fri, 28 Aug 2015 07:11:11 -0700 (PDT)
Received: by 10.28.135.72 with HTTP; Fri, 28 Aug 2015 07:11:10 -0700 (PDT)
In-Reply-To: <55E006B4.50103@skidata.com>
References: <1A315F32-74AE-4B3B-A5B7-65A33C5A6BC7@gmail.com>
	<CAP9ODKrwYHeeUdcLCLm6Bsw26V4ypZA-kNDYoX=fA4bx_MYQ0Q@mail.gmail.com>
	<55E006B4.50103@skidata.com>
Date: Fri, 28 Aug 2015 11:11:10 -0300
Message-ID: <CAP9ODKrJz7h9XpTrJZ-k+3nu-W=eFCb4W=91WH_JivZopb6fCg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: meta-java - recent commits break foreign (MY!) builds ...
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Aug 2015 14:11:18 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 28, 2015 at 3:59 AM, Richard Leitner
<richard.leitner@skidata.com> wrote:
> On 08/27/2015 03:28 PM, Otavio Salvador wrote:
>>
>> Yes, we need to fix it and to be honest I personally would kill
>> openjdk 7 once 8 is ready.
>>
> I think we should keep (and UPDATE!) openjdk 6 & 7 as long as they get
> support from RedHat and therefore IcedTea. There may be users relying on
> the old java version for their long-term-supported products (so do we)!
>
> IMHO we should start with openjdk 6: remove the old versions and add the
> latest (1.13.8)!
>
> What do you think? Any comments?

If you are willing to work on that, I have no problem.

The point is Java is complex and we have few people working on this so
I prefer one well maintained version than 3 oddly ones.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

