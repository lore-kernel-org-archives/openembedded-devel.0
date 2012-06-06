Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martiert@gmail.com>) id 1Sc9oL-0000cl-RV
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jun 2012 08:33:41 +0200
Received: by eaal1 with SMTP id l1so1750291eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jun 2012 23:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=syKeJJn7R8LQygGubswwyUoOMA9zuM167elo6giSY+0=;
	b=LtwTWroCXSXDjpqZULCOACjakfcGkGqhUmyQ9s/PYFN+PCKpEfHdngtA6rUrSwnC+I
	p3Vt2UyZ9kvCcRGfchpDzLl9z/rtrTClhyxFblfhsbJtjDdAk+wnsy0JiLjWUhNivxVk
	YP9q4s6W0noOc4kXR3MCTibohW7GTiYz3asGtzkc8wze/d/JQ9KbWmGgbV4zRM6VwfZI
	GSw2WSoRvr2Lyr7XYZM7Sk2IhPk6H1uEmCN+9E7h2zTWsod9gYDZNYd5irAvEKsV12GS
	Rok8vXeWtfkW7y0PCY1hY48iPXUVUnnvkx0KFEsLoKeFLicmldNNNAVUDMWbfabqXCFr
	Mdig==
Received: by 10.14.127.198 with SMTP id d46mr8354304eei.206.1338963794816;
	Tue, 05 Jun 2012 23:23:14 -0700 (PDT)
Received: from [10.54.74.16] (64-103-25-233.cisco.com. [64.103.25.233])
	by mx.google.com with ESMTPS id n52sm2554025eeh.9.2012.06.05.23.23.12
	(version=SSLv3 cipher=OTHER); Tue, 05 Jun 2012 23:23:13 -0700 (PDT)
Message-ID: <4FCEF69C.1070907@gmail.com>
Date: Wed, 06 Jun 2012 08:20:12 +0200
From: =?UTF-8?B?TWFydGluIEVydHPDpXM=?= <martiert@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.4) Gecko/20120502 Thunderbird/10.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4FCC5A7B.8040204@gmail.com>
	<CAMKF1spW20v28PG+Te=5nfiGR0upuRqTRTr7G3w3SZTeR1zi7w@mail.gmail.com>
	<4FCE2F51.3030003@gmail.com>
	<CAMKF1sqdnyayLoU0Fdhxgy07uUdHDiB3D6pF5gpZpjb8HFFx7w@mail.gmail.com>
In-Reply-To: <CAMKF1sqdnyayLoU0Fdhxgy07uUdHDiB3D6pF5gpZpjb8HFFx7w@mail.gmail.com>
Subject: Re: gcc-crosssdk-initial can not compile. Get message: this target does not support --with-float
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
X-List-Received-Date: Wed, 06 Jun 2012 06:33:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The configure log is at: http://pastebin.com/93h1rw7G
while the compile log, which is what actually failes, is at:
http://pastebin.com/2iXYrCDa

Be warned that the compile log is quite big, a little over 1700 lines,
and do seem to actually be a configure step, not a compilation step.
This really puzzles me.

Thanks for the help

- Martin

On 06/05/12 22:53, Khem Raj wrote:
> On Tuesday, June 5, 2012, Martin Ertsås <martiert@gmail.com> wrote:
>> Sure. Will do it first thing in the morning. Think this actually happens
> in compile though, for some reason. Do you want me to paste it and give a
> link, or is it ok with an attachment?
>
> Paste in is ok
>> - Martin
>>
>> On 06/04/12 18:32, Khem Raj wrote:
>>> On Sun, Jun 3, 2012 at 11:49 PM, Martin Ertsås<martiert@gmail.com>
>  wrote:
>>>> Hi.
>>>>
>>>> When trying to compile meta-toolchain, it crashes during
>>>> gcc-cross-initial with the error:
>>>>
>>>> this target does not support --with-float
>>>> Valied --with options are: arch arch_32 arch_64 cpu cpu_32 cpu_64 tune
>>>> tune_32 tune_64
>>> can you post log.do_configure of this package somewhere ?
>>>
>>>> The reason for this is a commit that happened 2012-05-01 in openembedded
>>>> core, called "gcc: Grok for callconvention-hard to enable hard float".
>>>> Reverting this patches makes it compile, and still I get the
>>>> --mfloat-abi=hard when compiling with the resulting toolchain.
>>>>
>>>> I'm compiling on a x64 Linux machine, with the target being a cortexa9
>>>> processor. I have the DEFAULTTUNE set to cortexa9hf-neon. What should
>>>> the patch do, and what will happen if I disable it?
>>>>
>>>> Best regard
>>>> Martin
>>>>
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



