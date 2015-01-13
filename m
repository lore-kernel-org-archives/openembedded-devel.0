Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f171.google.com (mail-yk0-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0D49E65C85
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jan 2015 17:55:36 +0000 (UTC)
Received: by mail-yk0-f171.google.com with SMTP id 142so2051113ykq.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jan 2015 09:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=Au3RTCfFnRBfwEQ0R7ki3DDyFcDQRQvgiP5+NkHrdt0=;
	b=YeEDd00OENDaf+jB3ThAunctFAnC3OjV8tn0hEMz/mFhDq5hFauS7grmdvcpmfFgMf
	hWEXFfqauv/tyu7Qgri2y+uX/gyiRgS82s9mfvavi4T51DHV6U27kwvrCUEwvmn8OHGB
	vedcCKCWqO0ycNYFrfhROxSIWf3Iu0hFUlxbVHs4RrYEEwHIs8W4IjOBpM8IMFicDTks
	UZ1qWO5rNgSl7x5rV1ybvYePKhKhC5djHW+NxfeJXjZ/w2ZBt4CFYiXoHhhhQPb13jzD
	pYYllU9aDst2sgwoH5AjWHmoq6s24AKaAaAOMyEw4oEiD2dG/MQBmbn4QIs6Wacoss59
	lgXQ==
MIME-Version: 1.0
X-Received: by 10.236.109.166 with SMTP id s26mr3780610yhg.67.1421171736945;
	Tue, 13 Jan 2015 09:55:36 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Tue, 13 Jan 2015 09:55:36 -0800 (PST)
In-Reply-To: <20150113132422.GJ18240@mail.itconsulting-heinold.de>
References: <54B220B0.8070609@gmail.com> <54B222F2.4070802@gmail.com>
	<loom.20150113T130012-516@post.gmane.org>
	<20150113132422.GJ18240@mail.itconsulting-heinold.de>
Date: Tue, 13 Jan 2015 15:55:36 -0200
X-Google-Sender-Auth: Kh7MZe1tkLncbhpcYJ-153bP1Pw
Message-ID: <CAP9ODKocqaD+cXFba28jxXyd75aRmWnpwNY3NNx1wVY4Q3wVuA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Query on meta-java layer openjdk-7-jre build
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
X-List-Received-Date: Tue, 13 Jan 2015 17:55:47 -0000
Content-Type: text/plain; charset=UTF-8

Hello Max,

On Tue, Jan 13, 2015 at 11:24 AM, Henning Heinold
<henning@itconsulting-heinold.de> wrote:
> On Tue, Jan 13, 2015 at 01:02:01PM +0000, Max Krummenacher wrote:
>> > I have OpenEmbedded setup and using the daisy branch. For the meta-java
>> layer I
>> > am using the master branch of
>> http://git.yoctoproject.org/cgit/cgit.cgi/meta-java/.
>> >
>> > For our embedded modules we have our own meta layer. I am trying to build
>> > an angstrom image with LXDE.
>> >
>> > We are using ARMv7 hard-float Thumb2 builds (armv7at2hf-vfp). Most errors
>> seems
>> > to be "not declared in this scope" errors. Are there some definitions to
>> be
>> > declared in the conf file, so the build picks it up or is some modification
>> > required to the source with a custome patch declared in the bb file for
>> this?
>> I have run into the same issues.
>>
>> This are follow up errors. The failing qemu-arm runs should have produced
>> header files which provide those definitions.
>>
>> >
>> > Not much knowledge on OpenEmbedded. Also can someone explain the qemu
>> segmentation
>> > fault errors?
>> see above
>>
>> > Trying to build openjdk-7-jre gives me the following error. A complete
>> log file is also attached.
>> >
>> > Can someone give me any pointers on how can I get the build to be
>> successful for
>> > using Java?
>>
>> My investigation showed that qemu-arm can not execute any binary which is
>> compiled with the compiler for Colibri-T20 and is linked with the -static
>> flag.
>> Even a simple hello world program does not work. When executing that hello
>> world on the real hardware I also get a segmentation fault.
>>
>> I got java compiling and running by updating to the latest of meta-java,
>> applying the patch which enables xawt and applying a patch which compiles
>> all binaries without the -static flag. Compiling with dynamic linking
>> however produces a binary which run on qemu-arm and on the target.
>> Currently I have no idea why statically linked binaries fail.
>>
>
> Hi Max,
>
> thanks to investigate this and now it make some sense why qemu is collapsing.
> To notice I switched to static builds long ago
> because the qemu-calls did not worked with the shared compiled executables. Now
> it looks like the other way around. And we maybe should consider to switch back
> to shared library builds.

 Can you prepare a patchset for it?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

