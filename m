Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id AA18A7D4F9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 20:43:09 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id h39so4596972qte.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MfhnVKHobBNuUa+FfA2nwE5f4LmOFo7ZDm5xYJ1L08U=;
	b=f6fMn8aDYpPWnYlu56PJoNAwGQOimiOlaEYDLzB0qVq/7w0EcZZ358VO/9B5HvUSKi
	AC1dMmkKfYi40AisN/NLt00ZKjuGJnEuh4lP7IG672YcmDYTQaX4YEgS2Ar43A0QQ9ZT
	mH9oYXSDgwWUj0skZY/ZXDeQ3rE1BUvUSte+AG4yH1y7WbShAVndRVLk9OKH9QWHTy0N
	J770dOJkI+8oYi9nisQHvFFEcGa31G67Up2Z/sWXtc+gIll9pyR/BoNI9rFHh5RILN7Z
	VavKvERwRV7FuhSP4NGb6vrHZL+TmSu0GslMh7XGXsK5p89mrW+BiA0Y74TaMmdyBHQX
	TFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MfhnVKHobBNuUa+FfA2nwE5f4LmOFo7ZDm5xYJ1L08U=;
	b=h0QAHsS/Qhu1bLZXv+nNGis/JyI6z3dbrtbPGny3ymn5awivRMSse4vV5eOQkMfN7a
	/et1KK4jTLmg5Zkfq2T38TWvb0oLWplP5kLjd/VHNHYhun7ZlN/JZcMCCY/dt2L10XmZ
	/5mWyy7mFKPE5FUtJJUpWK7uQ3c/eKz8ANz9hPl1cEXvwXQisigLKiqItgxPZJID9Mq1
	qQItAaMb9RwXQVpJzfnltAzdk18Rtg9jkX06m1TJSNpSy2+PzU8jmCVVPKVNkL17MEXF
	MTo30YoSNXgSDF36VMfI5Rfui78qIohyfd/5mCkw2D06Fz8mhanqQh0EGpA3RTrtdpLd
	wghg==
X-Gm-Message-State: APjAAAVCZVXozRU4PkARU+9165nsS9GgUxbHqOcFOOUG+mNkkf96LF5u
	TM7D3QrQ4fSRBaH0D8XiSQvseTqWq+WR8LWQ3Go=
X-Google-Smtp-Source: APXvYqzj8cuHRyQEJLY/i2nyebhdQOa+43Nw+o7p0UgqqNLczT9t/hT8sGrLkM5MLlA06Vi+WAC8IUCaXjHfb0Ic3oI=
X-Received: by 2002:a0c:81a9:: with SMTP id 38mr36269074qvd.208.1554928990330; 
	Wed, 10 Apr 2019 13:43:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAMSkS0hfFUKN4Z3hQvindomzUeTnTJpmQeNVmTMOSG2+jstr8Q@mail.gmail.com>
	<CAMKF1soBXtA5KpXprtEydJ-qC6tNSymvnNczFDLL1+eRzuDegA@mail.gmail.com>
	<CAMSkS0hUKA+W_9WmtVmVUb48EzoymqrYwcNK76idU2kPOVr5gA@mail.gmail.com>
In-Reply-To: <CAMSkS0hUKA+W_9WmtVmVUb48EzoymqrYwcNK76idU2kPOVr5gA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 Apr 2019 13:42:59 -0700
Message-ID: <CAMKF1soHkDpG0uM09QAL1PX=qMr-ZgY4xdkg0WHhuFGJxg7SHQ@mail.gmail.com>
To: Ram Subramanian <ram@meraki.com>
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
X-List-Received-Date: Wed, 10 Apr 2019 20:43:09 -0000
Content-Type: text/plain; charset="UTF-8"

If no regressions are found current master next will merge before warrior
is branched out

On Wed, Apr 10, 2019 at 1:12 PM Ram Subramanian <ram@meraki.com> wrote:

> Khem,
>
> Thank you for the confirming! I just noticed squid was bumped again to
> version 4.5, but in master-next branch. Will that also make warrior, or
> will it be saved for zeus?
>
> Ram
>
> On Wed, Apr 10, 2019 at 8:57 AM Khem Raj <raj.khem@gmail.com> wrote:
>
>> we have not yet branched warrior and it will be in warrior.
>>
>> On Tue, Apr 9, 2019 at 10:29 PM Ram Subramanian <ram@meraki.com> wrote:
>> >
>> > Hi oe-devel,
>> >
>> > I was wondering if the following commit that is currently on the master
>> > branch is slated to be cherry-picked to either the (upcoming) warrior or
>> > zeus branch(es) (or both)? I noticed that new branches aren't always
>> > created at the HEAD of origin/master.
>> >
>> > b42de097d - Pascal Bach - squid: upgrade 3.5.27 -> 3.5.28 (4 weeks ago)
>> >
>> > Currently neither of those branches exist in the upstream repo, and
>> knowing
>> > this information will make it easier to plan for it accordingly;
>> especially
>> > since we're close to the next release going by the yocto releases page.
>> >
>> > Thank you,
>> > Ram
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>

