Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f43.google.com (mail-pg0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8C86A7841F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 18:27:12 +0000 (UTC)
Received: by mail-pg0-f43.google.com with SMTP id b8so3008261pgn.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 11:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Iw4mvbqhb7iBfDKG1yorkzD95dHW5gN8aaL95vtCdTg=;
	b=jklx98yeQU5jAtD6SplqXFy6uMlhvO+Ez6zvEDgahExfqAlucWQEi+Yo9ISpf2PDba
	VCiEBGOTVU6kA9hfFzTShq3C83oNioUR1HYnu0JXUTzamkqT9rHVd6n9UvZI+D5kgLgT
	4iFgO6lZKUaul7MOb/Wsy/UNHoOFqrPEK8ncFIlA33Kf5+QDIRUTkppulqj8SS1Jg/lH
	/z9DN0Nbs/5wMfVhnmfx8aSQHuWWJiuIFqjki+I0mV6CQUEFIFZKBlH7F9PGwvZKSTJJ
	zLdYukbzfk9d7v/1ZRax5w2RsJigvSXrYx1Fgq/agAZA1P3bGl8cw8uFhRWIGRLF8o5M
	oM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Iw4mvbqhb7iBfDKG1yorkzD95dHW5gN8aaL95vtCdTg=;
	b=Ge4Rg7sFH1yn2LbiavG5pfuP0dFTByCGI2WYyoz1mx7pCJWXdDx936CYqyOlZY9sec
	zaN7j2ty11VdyTo9eFk614whpO8sq3KZWKVDgN/yEH2oGLdP5ZeyG5Z2n0fuZjdVkNMO
	9BPx68aRIUEnbckSmWNYk+sTkyW4w0Q3mmpLXs2piU3q/TDc5LFAZH9GvvmExy0+Rgs/
	qxohXEam7KH3aq+kwg8BLkhjP1SaeZFaceH7vVsFeUvqPR5cKvsXVD+t2gm7bYrI+sl0
	CIJkbhV/6lUn+FF9mSoiJ09ny0DhuCxGQ00MyzdUf/K/xFyWOdVzFk5ADTqne2qKh9cu
	YeVg==
X-Gm-Message-State: AHYfb5gU5lGCRvuqVpMnwoiZ/2h/vHFRaBCTReoYt891bOyB54h65OQ/
	jxg3vrEHsKesBgs6MmTgN46a/ROaRw==
X-Received: by 10.84.133.14 with SMTP id 14mr11638127plf.440.1503685633705;
	Fri, 25 Aug 2017 11:27:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Fri, 25 Aug 2017 11:26:43 -0700 (PDT)
In-Reply-To: <CA+chaQfyYC4M0B4YZx8qfGQSqHem=3JsKoeMYfGCgUZcGtuYGw@mail.gmail.com>
References: <20170821210259.20276-1-Martin.Jansa@gmail.com>
	<20170821210259.20276-5-Martin.Jansa@gmail.com>
	<CAMKF1sor29cpSkBMq4wm_OECGZvMLK5J1QWNu6Smqf9KqPBetA@mail.gmail.com>
	<CA+chaQdw5eRR40rkOsq8VMkLVyvG_mf=3jGgppeZ8SCQ0jxy=Q@mail.gmail.com>
	<CAMKF1srQvTMq5Z5B=4gE62LRPMQi+1Azc5dZyn2+hiT1nSdCXQ@mail.gmail.com>
	<CA+chaQfyYC4M0B4YZx8qfGQSqHem=3JsKoeMYfGCgUZcGtuYGw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Aug 2017 11:26:43 -0700
Message-ID: <CAMKF1sq-EZVXY_r65RBRVesDU40wONB_xcYHbvuKXbbMBvzZzQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCHv2 5/7] qt: upgrade to latest revision in 5.9 branch
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
X-List-Received-Date: Fri, 25 Aug 2017 18:27:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 25, 2017 at 11:22 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> It's here on ML or in jansa/master-5.9-rebase branch
>
> On Fri, Aug 25, 2017 at 8:14 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Fri, Aug 25, 2017 at 10:28 AM, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>> > It looks like you're building 5.9.0 not 5.9.2 from the patch where
>> > you're
>> > replying, can you try if you can reproduce it with 5.9.2 as well? Maybe
>> > it
>> > was already fixed upstream.
>>
>> is 5.9.2 in master-next ? if yes then I am on master-next as of today
>

OK. Thanks I will switch to this branch

>

