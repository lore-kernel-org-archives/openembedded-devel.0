Return-Path: <ram.subramanian@meraki.net>
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
	[209.85.166.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1DD0C7D79A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 20:50:43 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id v4so3415014ioj.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meraki.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6eeuUqM0H/Njkh9NnNU7zyYSxMArVfyC9/fVWmMQfWI=;
	b=Od2NOpOo8zMh2riDq3OK2bDj3ZbJK4/ZsD7VPOtL7eqqiI4yfUtzm59RoFNXBh5yws
	knPA7iBcBpGam7gerGWwzxQmSRnedgii06wvKjcDXOhCNJYMPS/mDi8Zd7n8ckNMQvSr
	YNV5nUkorj1bHcwTgY7uS4ElaMPUi15Y4D1iU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6eeuUqM0H/Njkh9NnNU7zyYSxMArVfyC9/fVWmMQfWI=;
	b=o2eSwTeo0/DIcrVIlAHiqMuyXxGQKzu/X+4DLbJ00NYWb2f32ZsSL2ynPt/w2Ag4Tr
	BP3oTENItrH0wPn2/zqMe+VDYLEsxRa7c4XPo8f3d3l/GOPPYNyVgjBU75MzydpNdI2I
	iXGJlTXhXKXRTJE8r8/fiBCduT+wwyKxlsLaKTGAZIvd9NDjAVzqIurCcvyA+RFnf6m2
	5bNOY4FrGnBYcH1CIbY0cpgat9WfTIk8kq2tzgJRpc1bGbjSsrUilm8db3CbjgzWHsXB
	p6TJ8jm/RrFsXEkWJaszsOfPqMwJwUK2tVR8bkDj8d59tqmMfRtLlzijlGG5LA5uZpbT
	p4Rg==
X-Gm-Message-State: APjAAAWh+t7QHa7CREDhhYBP0K81jOaJyXhv/v0alhX7drOpBHvxNAzn
	qjA30Bnmli1AHMp72tYsv98hS94D6ctXmfel76s5Lg==
X-Google-Smtp-Source: APXvYqy4IL1MMlYw2kvn8wdjFvzSxObaALBThFK2JeqFGG7IgzwqK86qwVqiI64mF2NV7q4AKzsF8+qUVsei5IKAmAY=
X-Received: by 2002:a5d:834e:: with SMTP id q14mr9986117ior.248.1554929444949; 
	Wed, 10 Apr 2019 13:50:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAMSkS0hfFUKN4Z3hQvindomzUeTnTJpmQeNVmTMOSG2+jstr8Q@mail.gmail.com>
	<CAMKF1soBXtA5KpXprtEydJ-qC6tNSymvnNczFDLL1+eRzuDegA@mail.gmail.com>
	<CAMSkS0hUKA+W_9WmtVmVUb48EzoymqrYwcNK76idU2kPOVr5gA@mail.gmail.com>
	<CAMKF1soHkDpG0uM09QAL1PX=qMr-ZgY4xdkg0WHhuFGJxg7SHQ@mail.gmail.com>
In-Reply-To: <CAMKF1soHkDpG0uM09QAL1PX=qMr-ZgY4xdkg0WHhuFGJxg7SHQ@mail.gmail.com>
From: Ram Subramanian <ram@meraki.com>
Date: Wed, 10 Apr 2019 13:50:34 -0700
Message-ID: <CAMSkS0jYLUuo57_pmCN=Y3XHrFEw71f1iZ3qAOS=D77u9gfFZw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Will a commit currently on master make it to a specific future release branch
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
X-List-Received-Date: Wed, 10 Apr 2019 20:50:44 -0000
Content-Type: text/plain; charset="UTF-8"

Got it, thanks once again!

On Wed, Apr 10, 2019 at 1:43 PM Khem Raj <raj.khem@gmail.com> wrote:

> If no regressions are found current master next will merge before warrior
> is branched out
>
> On Wed, Apr 10, 2019 at 1:12 PM Ram Subramanian <ram@meraki.com> wrote:
>
>> Khem,
>>
>> Thank you for the confirming! I just noticed squid was bumped again to
>> version 4.5, but in master-next branch. Will that also make warrior, or
>> will it be saved for zeus?
>>
>> Ram
>>
>> On Wed, Apr 10, 2019 at 8:57 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>>> we have not yet branched warrior and it will be in warrior.
>>>
>>> On Tue, Apr 9, 2019 at 10:29 PM Ram Subramanian <ram@meraki.com> wrote:
>>> >
>>> > Hi oe-devel,
>>> >
>>> > I was wondering if the following commit that is currently on the master
>>> > branch is slated to be cherry-picked to either the (upcoming) warrior
>>> or
>>> > zeus branch(es) (or both)? I noticed that new branches aren't always
>>> > created at the HEAD of origin/master.
>>> >
>>> > b42de097d - Pascal Bach - squid: upgrade 3.5.27 -> 3.5.28 (4 weeks ago)
>>> >
>>> > Currently neither of those branches exist in the upstream repo, and
>>> knowing
>>> > this information will make it easier to plan for it accordingly;
>>> especially
>>> > since we're close to the next release going by the yocto releases page.
>>> >
>>> > Thank you,
>>> > Ram
>>> > --
>>> > _______________________________________________
>>> > Openembedded-devel mailing list
>>> > Openembedded-devel@lists.openembedded.org
>>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>

