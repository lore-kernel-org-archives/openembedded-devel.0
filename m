Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id C33927423D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2015 12:11:31 +0000 (UTC)
Received: by igcrk20 with SMTP id rk20so39809229igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2015 05:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=27rQcQjOzt0oiSjujXan7605OjVzsH3Bk1Dby+Nj5e4=;
	b=LTmM37Gqj4pDSfKQMHE9DYWArSI/yIntYtWLqQbrmQUu25YmW96UuL6qWNyU5ANn4g
	4kZRX4UuOQJQPfKYqEhllKYoJfLyBd9sa1yAfE4sb09Zb2i8TNuh0PVpiX70tVt0IZ43
	H16Yn/bOXq/l62wQa1ad3wJGT/xp2gmo+GGmQ8LEDboCaxtn/KYVkJ18pk7ZoVn5ud0j
	iJOhEdFsgq6KzPnyFD5WkE/eRAV0VVRFEmTYAjEBvSvtWMX2zoQ5UI6d8yo0V3tr8a49
	+DPC39WtU5hO5461VeMKbjpDZ9KiEi0v0p6Svb1omdJvu0UOK9VWtMyjXLpikQwIUeyj
	XHAQ==
X-Gm-Message-State: ALoCoQnx2hucZxBI+psFQQAaUN8wQJGo/dbMBgsSgDsk0OFnBSwdohzc1TWuj5NeCTqD1vVN2GCy
X-Received: by 10.50.3.37 with SMTP id 5mr3172696igz.96.1441973491435;
	Fri, 11 Sep 2015 05:11:31 -0700 (PDT)
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com.
	[209.85.213.171])
	by smtp.gmail.com with ESMTPSA id f31sm91953ioj.13.2015.09.11.05.11.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Sep 2015 05:11:29 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igcpb10 with SMTP id pb10so43098278igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2015 05:11:29 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.225.66 with SMTP id ri2mr3288393igc.5.1441973489438; Fri,
	11 Sep 2015 05:11:29 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Fri, 11 Sep 2015 05:11:29 -0700 (PDT)
In-Reply-To: <1441958143.24871.377.camel@linuxfoundation.org>
References: <1440724441-692-1-git-send-email-vinay.k.awasthi@intel.com>
	<55E009D2.6010106@skidata.com>
	<CAP9ODKrt7jhFtN6JWFqqbSnJxyX4kAc77CkigOCChkV4gz=-Cw@mail.gmail.com>
	<1441958143.24871.377.camel@linuxfoundation.org>
Date: Fri, 11 Sep 2015 09:11:29 -0300
Message-ID: <CAP9ODKoduXi8_SQp_=Qr1W07VC3KpuQhXhoH4MFtgqxiw0sdnw@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-java][PATCH] OpenJDK-8: For x86 and ARM
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
X-List-Received-Date: Fri, 11 Sep 2015 12:11:31 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 11, 2015 at 4:55 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2015-08-28 at 14:29 -0300, Otavio Salvador wrote:
>> On Fri, Aug 28, 2015 at 4:12 AM, Richard Leitner
>> <richard.leitner@skidata.com> wrote:
>> > On 08/28/2015 03:14 AM, Vinay K. Awasthi wrote:
>> >> Rebased it again with latest change-set and tested it on oe-core master with latest mate-openembedded.
>> >>
>> >> There is no change in recipe.
>> >>
>> >> This enables OpenJDK-8 jre/jdk for x86 and ARM.
>> >>
>> >> This recipe is tested for arm (zero VM) and x86 (hotspot vm).
>> >>
>> >> To build just use bitbake openjdk-8.
>> >
>> > I successfully compiled and tested it for/on an ARMv7 Cortex A9 CPU:
>> > # /usr/lib/jvm/java-8-openjdk/jre/bin/java -version
>> > openjdk version "1.8.0-internal"
>> > OpenJDK Runtime Environment (build 1.8.0-internal-leri_2015_08_28_08_47-b00)
>> > OpenJDK Zero VM (build 25.60-b23, interpreted mode)
>> >
>> > Also X11/awt/swing works fine! Only problem for me is that ZeroVM is
>> > running in "interpreted mode". Therefore my programs are running really
>> > slow.
>> >
>> > Was the "mixed mode" available/working in your tests?
>> >
>> > IMHO a working JIT (=> mixed-mode) is a must-have for merging this patch
>> > upstream. What do you think Otavio?
>>
>> Yes, I agree. There are other people working in OpenJDK 8 here[1] (at
>> ml) it seems so maybe we could share some ideas on how to fix it.
>
> I'm hearing there is a little frustration about moving forward with
> this. I'd like to suggest that a staged approach might be better in this
> case, for example if OpenJDK-8 is working on IA, how about adding it
> with:
>
> # mixed-mode isn't working on ARM yet
> COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
>
> With a large change like this, I think its perhaps ok to take a staged
> approach, as long as its clear what is/isn't expected to work?
> If/as/when the ARM people have time to make it work there, patches can
> be sent to change that? This way it unblocks people and doesn't hold
> keen contributors back.

I am without much time to look at this and do a proper testing. If any
other maintainer wants to handle this I would be thankful.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

