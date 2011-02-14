Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PoyUQ-0006I5-5D
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 14:29:18 +0100
Received: by iwn8 with SMTP id 8so4728919iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 05:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=yW42MknEiMT0oN1S5gWERhmZycNhHzXyS4fUyd+s/ag=;
	b=p8jsAmFWOqd4CPYeFwZSLFtEcE+qjD3AlrZRq2A+gp37I7r4Z3sMUxr+qpeuaoVGvq
	Nss0Cm8/EXyp0Au0pO32IsUoyvTGn4L+gilar+3sk+o0K4Bozgz/DbGhOa135eFO4Cml
	/F3bICncsniyIFbFmw+TZjZ6aHpuF4VC/EVdY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=vRIsiP9wYLvw4UitkCh86v9LVh2yOmutTWtaI1+VM5Tvcg5wKo06HQ2SCKpWssdFZ6
	lpZq9RFHo7RtNgoYLn/uchgTI3e+rG8unfl+gJHqc4GTQDt1j4OUJq1croJlAfLgIvxZ
	sbi+BlfDuRKpqfE7U13zHqNUpnXhhM2pZsXso=
MIME-Version: 1.0
Received: by 10.231.35.200 with SMTP id q8mr2079619ibd.147.1297690087272; Mon,
	14 Feb 2011 05:28:07 -0800 (PST)
Received: by 10.231.30.73 with HTTP; Mon, 14 Feb 2011 05:28:07 -0800 (PST)
In-Reply-To: <AANLkTimzn89oYdKca8VQAaDMvjsNtT9vvqNioiN7OTU7@mail.gmail.com>
References: <4D58D5EF.6000807@dresearch.de>
	<AANLkTi=4i_m8J4qFCwntdo-qb4CHn98UH+kuz4O=zcgT@mail.gmail.com>
	<4D59066F.1040805@dresearch.de>
	<AANLkTimzn89oYdKca8VQAaDMvjsNtT9vvqNioiN7OTU7@mail.gmail.com>
Date: Mon, 14 Feb 2011 14:28:07 +0100
Message-ID: <AANLkTi=mqsz-yU=W3_OYZ78FkLe1wg1g5avHDGLHe6Es@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: bitbake exit codes? (testing-release-2011.03 build results)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Feb 2011 13:29:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

Got an error when sending the message below. Not sure if it made it to
the list (gmane does not have it yet), so resending.
Apologies if you get this twice.

Frans

2011/2/14 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> 2011/2/14 Steffen Sledz <sledz@dresearch.de>:
>> Am 14.02.2011 09:11, schrieb Frans Meulenbroeks:
>>> 2011/2/14 Steffen Sledz <sledz@dresearch.de>:
>>>> While setting up Jenkins/Hudson jobs for the testing-release-2011.03 branch based on the testscript.sh from the contrib subdir i hit the following problem.
>>>>
>>>> bitbake (1.10.2) finally reports "NOTE: Task Summary: Attempted 1217 tasks of which 0 didn't need to be rerun and 0 failed.". So it seems that the build was successful. But bitbake did not return 0 but 1. So Jenkins marks the build as failed.
>>>>
>>>> I guess the exit code 1 is coming from some QA Issues. How do we handle that if if my guess is right?
>>>>
>>>> Do we mark such a build run as successful in our test matrix?
>>>>
>>>> Has bitbake a defined set of exit codes that we can evaluate in the testscript.sh?
>>>>
>>>> Steffen
>>>
>>> There have been a few threads on this in the past.
>>> One of the ways (and maybe the best one) to get around this is to fix
>>> the QA errors.
>>
>> Of course. You are right.
>>
>> But for the moment the question is: "Do we mark such a builds as successful in our test matrix or not?"
>>
>> Steffen
>>
>
> Personally I'm inclined to say no. Marking them as unsuccessful
> increases the chance of getting them fixed.
> Then again others may think differently & I don't know exactly how
> many QA errors we're talking about.
> (I seem to recall that my console-image build had four, for cups I saw
> a patch, binutils is being looked at or maybe already resolved by
> Khem, no idea about the other two).
>
> Best regards, Frans.
>


