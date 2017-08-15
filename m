Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id A753B784B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 16:14:20 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 123so2102044pga.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 09:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=GsjoAGh0ieiGzWX57zDYdr/EvW0PYlrLPf+iF4WL1ho=;
	b=lPwY+fNs6do0CsvqanyNIH3uU9OyzYZq6telToS7S92T+4Fc4CoaD3P2A6vwoqc1U6
	Zsvrb81XjM1qVJndFJTEhV/5JOwt82NCro6ztj3zwFAScDrr3iv8KFQ4RdOL0frzpKxY
	oTAn1RHmrqmDi4Aitvhdwb8zOJHXft3xcUcPexM7l48Ne2/iG6Lkf8K4QnO4Y+XBlbob
	yJWoSNxuPUbUmQMdG4l7iLKn7L6Q+m4CkhbCH4qXD3oc1L9kR9RRqGmHHOCkrmCMbohI
	P2Tc3XPje0Ttzou+s21hYA84IBT/rbKRFCabeCDdQpUFzPtJ8bfHsSW/Xn3+9O+Synxv
	2JTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=GsjoAGh0ieiGzWX57zDYdr/EvW0PYlrLPf+iF4WL1ho=;
	b=nrX/qdEEP5xIVeXA3qjIz2IC+fOWui4XJ8WOmcTwvxpNgmL7PrdNvtTYhvUqgkLDwn
	hSo55EdWuHqbiScXfUAmKlzVTo6vRsw+W+N8/ethX+OVXz9S7Aj3mkCBCufLsDk/VChv
	JFNx4urmEPj8MwFJOsVJDPI4FfQME2WafP2wWVhOpquWSqP1Y3xHLZ5Y9f4PHJyMFYBg
	e+xPhbqHrp6ZjeIs2lOu8RIZ9f904XIVo8aOa5FUisdIe3sy4DD9IIxZHnYB3qPj3d/W
	oPe9iO3ed33tMB1DKFHutPzi/RHB6TQ38H7N5xUSsXzKxF+ruYqqUWAxOiENXbJWYMiw
	S9HA==
X-Gm-Message-State: AHYfb5jD2eNBc+A6opX2x3p26JQu3Y/mW+nQlVCBSUntlXIyYPi22cyP
	qHG6pPTbxm6y2VucMfg=
X-Received: by 10.84.178.4 with SMTP id y4mr31522009plb.135.1502813661868;
	Tue, 15 Aug 2017 09:14:21 -0700 (PDT)
Received: from Khems-MacBook-Pro.local
	([2601:646:8882:b8c:941a:4883:1e44:34f1])
	by smtp.gmail.com with ESMTPSA id
	u26sm17603834pfi.140.2017.08.15.09.14.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Aug 2017 09:14:21 -0700 (PDT)
To: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Trevor Woerner <twoerner@gmail.com>
References: <CALbNGRQWNNvf5kLxcWz7EvUK6CO5VMX43vMrPx28yOzCq5NV8g@mail.gmail.com>
	<CAHiDW_GuabOEPc6rgh-vV+f502A5dYi8wFVYhRzqcZBGYHzz9g@mail.gmail.com>
	<CAHiDW_HFgnLbvd64hR8yE107BLtkWcp3eb=mA8towH73pMbUZQ@mail.gmail.com>
	<CALbNGRQBRFeCuz5R10qhBHQGQ3hn7WO9i1SAZ5fV=4BqGepjrQ@mail.gmail.com>
	<CALbNGRT6v530xCdqLp3CRHKOtBZpg8JqYreOsUhFL5u-eV2O2A@mail.gmail.com>
	<CAP9ODKrwUkwdESj-qKrPjsKMN2=W-ZsYBb_+OYhbvrfgcoht2w@mail.gmail.com>
	<87wp65rnfk.fsf@rkubodac-desk.ger.corp.intel.com>
	<CAHUNapQ8zxvaEdn51D0kN5C7JVRpQJq34tCuqamMEM0fm20LRw@mail.gmail.com>
	<CAP9ODKorOG_0ks1BEWTiMSoadvPk7mnEdUffPys4COBcFwBWQg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <6b1dc332-f413-8571-fc5e-4c8a0a26083e@gmail.com>
Date: Tue, 15 Aug 2017 09:14:20 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:56.0)
	Gecko/20100101 Thunderbird/56.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKorOG_0ks1BEWTiMSoadvPk7mnEdUffPys4COBcFwBWQg@mail.gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: chromium detected as stripped
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
X-List-Received-Date: Tue, 15 Aug 2017 16:14:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 8/15/17 7:47 AM, Otavio Salvador wrote:
> On Tue, Aug 15, 2017 at 11:43 AM, Trevor Woerner <twoerner@gmail.com> wrote:
>>> My recipe is a lot less customizable, but OTOH that makes it
>>> quite easy to move to new Chromium milestones. If we're able to find a
>>> balance there, I definitely think we'd be able to get a lot more done
>>> together.
>>
>> I think it was a mistake for meta-browser to have recently added a
>> huge number of patches supporting musl. One commit alone added almost
>> 700 lines of diff for musl support (not to mention the subsequent
>> fixup patches)! Musl support should be kept and maintained in
>> meta-musl, isn't that the purpose of meta-musl? If users want musl
>> support they're going to need to add meta-musl anyway, so it's no
>> change from a user's point of view. But 700 lines of patches provides
>> a heavy burden for anyone trying to maintain or update meta-browser's
>> chromium, especially if they don't use or care about musl support.
> 
> I tend to agree and I also believe that upgrading much of this patch
> will die. Khem would you be open to reworking the support after we
> upgrade? So it'd remove the patch refresh from Raphael and Trevor's
> shoulders ;-)
> 
I dont think, we should take this approach, rather a collaborative
approach, if musl patches are non portable thats another story, we need
to address that, but forward porting the patches should be part of
upgrade. You could stage the patches and we can then look for helping
to fix them if needed.

