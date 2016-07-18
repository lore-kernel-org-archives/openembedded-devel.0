Return-Path: <danismostlikely@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id B85A560797
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 21:46:52 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id x130so9416467vkc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 14:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=zdnOXvCgBJ6Y6kV/+Q6IY4axrZ6kEFsbGVlL57wjT24=;
	b=Y5tjnNXfM+9k9U72WkCIY6heWghPoSS7B5IMsWntHfBmorvYHHhfeiEY/sK4xhL6xq
	F49ZjAZexZjYUYV7BTSB+B5mtNcZyU3cW1pCJFXoQ08L9qDvIssslI0G7cI5F9PwKU+C
	C13gXRJf2tLDE8OVqtU0JhB2bMYal4a34a4xGKziLMgAEEt5lyEYu6V+kVFSE847uujD
	hs7DXVbiUqWlGJV3XoYQQ4Pl7VApbN16tGvEe6JECQ1Jx+mY1eWw4hZgyAyqf1aLqs82
	ufHo/uNa1VhJ6tN5TNms184Ef7MCclPRAHo21MOEZEmHsDzwOfHZFovKj4XJE3syg/bK
	E+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=zdnOXvCgBJ6Y6kV/+Q6IY4axrZ6kEFsbGVlL57wjT24=;
	b=jC2cQVoYjsRNHbIRhu/H7zYl4K2baaIO7Guwve2boi5dyvypjeY33w/Cn+jBRxC808
	+arsDjehaNqccgKOqm4/pQyKunQ9kG/tWbeUXP84YjsE3WbmNXVysbB2Bu2PeJ6cAD05
	Twx91dVzzp+o2ypg1v+ZGGgH/FNt/PV384BefHg2In0d6KYEx9VLiLE9t7xJqbfBssre
	bJWsqUUqOVi2jbHGTWKCHnBdiPEjYeBpAvODcdIPVRI7WhQZr0euTuCdZ4lGgljfs6Cf
	CKjTFPBAKYJ/zIef62J8QWJfj/fkeSrrElhLzjWaZBKSJJ/VlqGxBAjQm0uPk5ILgYfo
	vlxg==
X-Gm-Message-State: ALyK8tJzanBCeINIZ96u6lB7B7IHSl+rzI5QyysYKtAnbMyXb+xVzAcXZcEHv2/PJfICIZzDNykPk8DXFyZSLQ==
X-Received: by 10.176.69.178 with SMTP id u47mr20049966uau.133.1468878412730; 
	Mon, 18 Jul 2016 14:46:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.51.77 with HTTP; Mon, 18 Jul 2016 14:46:52 -0700 (PDT)
In-Reply-To: <loom.20160718T094851-958@post.gmane.org>
References: <20160622163845.29573-1-danismostlikely@gmail.com>
	<loom.20160711T131713-153@post.gmane.org>
	<CACS+7ZQ_GxdipW4exewtzfyK2nrDFR2=jHJ83d_Ze=@mail.gmail.com>
	<loom.20160718T094851-958@post.gmane.org>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Mon, 18 Jul 2016 15:46:52 -0600
Message-ID: <CACS+7ZQBEB3b8TM5X1f2bLNXPf2seFit3xgDUV95-MPhVAFDpw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH] openjdk-8: make GCC6 happy
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
X-List-Received-Date: Mon, 18 Jul 2016 21:46:53 -0000
Content-Type: text/plain; charset=UTF-8

On 18 July 2016 at 01:51, Patrick Ohly <patrick.ohly@intel.com> wrote:
> Dan McGregor <danismostlikely <at> gmail.com> writes:
>> On 11 July 2016 at 05:29, Patrick Ohly <patrick.ohly <at> intel.com> wrote:
>> > Dan McGregor <danismostlikely <at> gmail.com> writes:
>> >> From: Daniel McGregor <daniel.mcgregor <at> vecima.com>
>> >>
>> >> GCC 6 sets the default C++ standard to C++14 and introduces dead store
>> >> elimination by default. OpenJDK 8 is not ready for either of these
>> >> changes, so set the C++ standard back to gnu++98 and disable dead
>> >> store elimination.
>> >>
>> >> Switched to using --with-extra-cflags, cxxflags, and ldflags. The added
>> >> patch fixes building when using those flags, and are needed to get
>> >> CFLAGS into the JDK build in the native case.
>> >
>> > Has anyone tested this on a host system where gcc is still 4.x, like 4.9.2
>> > on Debian Wheezy?
>> >
>> > I'm finding that -fno-lifetime-dse is also getting passed to the gcc used
>> > for compiling native binaries (obviously in openjdk-8-native, but also for
>> > some helper executables in openjdk-8). This then breaks the compilation
>> > because older gcc rejects that flag.
>> >
>> > I've briefly toyed with the patch below which worked for openjdk-8-native,
>> > but not for openjdk-8. I'm just going to work around it by staying on gcc
>> > 5.x and clearing these extra flags.
>> >
>> > I'm not familiar enough with the openjdk-8 build process to propose a better
>> > solution, but perhaps someone else has an idea?
>> >
> [...]
>> This regex doesn't work in the cross case because the version string
>> doesn't start with "gcc". It starts with '<target-triple>-gcc', so
>> that should be checked instead.
>>
>> I'll fiddle with this patch some more. It looks like a good short-term
>> solution to building OpenJDK on GCC 4 hosts.
>
> Thanks for taking this further. But please really test on such an older
> system, because the patch alone is not enough. Something also needs to
> be done when configuring openjdk-8 such that it uses different flags
> when invoking the host compiler (old gcc) and the target compiler (gcc 6).
>
> I haven't found a solution for that (not familiar enough with the Java
> build system).
>

Will-do. It's just somewhat difficult to find one for this. I'll maybe
generate a build machine based on CentOS or Debian. I wonder why it's
picking non-default CFLAGS for host tools though.

I'll keep poking.


> Bye, Patrick
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

