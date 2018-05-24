Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9053D7459C
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 02:59:18 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id r66-v6so124141qkr.7
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2018 19:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2vNYXVxQiefwcsNuAweov+4aBw8qk1OzIX0/JOVI17k=;
	b=UruARoVi/nYCuvBp6DQ6Oa2yn7kRfrssl4GsiLm7aSkcglLGYWM55wOKKVCLdriPw6
	1fShCqTi1PK2LPBWWnE+evGp/vCLnXuQ3KxC6AaSuiwzeF8HIiD/aqcJSXI+yrbGMtMw
	Rj3vBXCJuBqP7du2rMyt4PoNDl2O43PTfyd9LeaXkhNTXqwliEj2edZMSjF9fVftbTX1
	qn8zPhJuhfSZx3yJyuYLYEYktGYszjeIQPIoxeoLWDuGZ3QF9YrUk4MiAAxULYZBVGKt
	CGVcQZHggzlwRK+GvSOWpoqYQjKwoL0XpFvqlj1b+nAYR3EJrxriJouoBtlCXxzzMARH
	vMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2vNYXVxQiefwcsNuAweov+4aBw8qk1OzIX0/JOVI17k=;
	b=e0dwyDEYsU7rBZLt0MIcJYsTJkWI90AXnJxtRWTGKDZy55GhZ6anyjJs5NuHCd2L5b
	GlLIMa0ipm+dyPvJ0S4/81ULeZbJPfUVx9sa96TndvenMkyi/uWaMQ8xA84VMlkzQsAQ
	RZSqEqxQpr4j84WrwmqooijFCTFys7F8ysogC4QyRRx7TbGQ/+AIS7h8m+xsUSrnVdez
	Annl1a2ED7tEfLl0XtOIbXfBQQgFxg86ER/5ztdCS506nhSjaKqsCCO0s9PADoifknc5
	hKrUTsNsi57QaNNFnwYNOkF0XzwdVgPFrv9wxGANnd1QWFia8Aam+HDs/ArsxkGeTIVR
	CoDQ==
X-Gm-Message-State: ALKqPwcPcSe4HZSrYG8ycMp1m+oohLt9FRu3uqugAoH8o/B+FV2ZrLvS
	7kpE6fsIvIyEkr+ILanuz0dIz6X4rOk72s05+aQ=
X-Google-Smtp-Source: AB8JxZpeVUD65XxZlYOtByoYdt+oxGBmTLwQFvHHWgWkj2BBJ8Uejdzo7ocZdBFXvRnIQAZGPL2cm4+JA+Z5U9ugArc=
X-Received: by 2002:a37:fe9:: with SMTP id
	102-v6mr4504631qkp.406.1527130758784; 
	Wed, 23 May 2018 19:59:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:9a0f:0:0:0:0:0 with HTTP; Wed, 23 May 2018 19:58:48
	-0700 (PDT)
In-Reply-To: <CAJ86T=XXUE=Thv1Gpq9aC1bJq13qcSmKMt6-RRu3BZ=gsiSxnQ@mail.gmail.com>
References: <CAMKF1spo+S9+NF7W6dkEnBBLDxWQfvrg3L93Rz1jdZ68UL182g@mail.gmail.com>
	<CAJ86T=XXUE=Thv1Gpq9aC1bJq13qcSmKMt6-RRu3BZ=gsiSxnQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 May 2018 22:58:48 -0400
Message-ID: <CAMKF1srrPL4jBCaxWXz1Wq6KwKPxyHCL5vDjrx-fGLdnKCx9bw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: meta-openembedded patch flow
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
X-List-Received-Date: Thu, 24 May 2018 02:59:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 23, 2018 at 9:26 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Tue, May 22, 2018 at 4:20 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> Hi All,
>>
>> I am writing this to just paraphrase the patch flight process that is
>> in place more or less
>> and I am going to follow.
>>
>> We have patchwork instance where all patches from mailing list are captured
>>
>> https://patchwork.openembedded.org/project/oe/patches/
>>
>> I am going to watch this and cherry pick patches from patchwork into
>> master-next branch
>
> New patches currently seem to be going into
> meta-openembedded-contrib/kraj/master.
>

Yes, currently, I am trying to get the jenkins builds going, and until
then I have been
staging them into contrib kraj/master, so it can be run though my home
based CI loop.

> Is that the branch you mean when you say "master-next"?
>

Once I get the jenkins job straightened out, then it will start using
this branch

>> master-next then will be run through CI loop on my own system as well as on
>>
>> http://jenkins.nas-admin.org/
>>
>> tasks - oe_world_qemuarm oe_world_qemuarm64 oe_world_qemux86 oe_world_qemux86-64
>>
>> For layer maintainers
>>
>> Please review and provide your ACK/NACK based upon your own testing
>> and judgement. If
>> you want to rely on the jenkins jobs above thats fine too. If you want
>> to test your bundle separately
>> and send a separate approved patchlist via a pull thats fine too.
>> Usually we do not give explicit
>> ACKs and provide feedback if a patch needs to be changed. It would be
>> good if you start providing
>> ACKs if you think patch is good to signal. If a patch is not
>> ACKED/NACKED and its passing the
>> jenkins builds, I will assume you are OK with the patch for master.
>>
>> Submitters, please watch the patchwork for progress on your submission
>> Hopefully patchwork will reflect the current state
>> more accurately, if its stuck in same state for a long time (1+ weeks
>> ) send the pings to maintainers.
>> you can also check master-next branch if its still there and not
>> dropped then its in queue for merge
>>
>> Since we all have limited resources and time, I would invite all of
>> you to test master-next for machines/distros you are interested in
>> (keep in mind master-next will get rebased) and provide
>> feedback/review so we can include it in decision
>> to accept the patch, any help will be appreciated.
>>
>> If you have suggestions, feel free to share here
>>
>> Thanks
>> -Khem
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

