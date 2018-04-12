Return-Path: <samuli.piippo@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7283774695
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2018 14:38:56 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id e98-v6so7313891itd.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2018 07:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UhZphPUTy9cPxiyCjgtbX7rGRZ6iUlQ5FGNWlKdB098=;
	b=BX4ODZkHK3hr0DDrvhNsPpmeOQclZsQ1bYtrc+oJTANpSkAVXGvNfJmEdcp14I87GV
	lovZmAvv2bj92JA83c90vRa1ABq3fQFQp4DT1FSawDaMeKbXwiMoTsgTV7upvwCnj6F4
	t0lz8IJNXBO+zxhEXOrW1YNv4Jqsby6HB9XN+vc8zbkJhjL/UZPJIK7ePAtnwINFW4hI
	2MKhnqbeVvGIOfjTp33Rihm8TpsejURgojqtZ/nC1ui3fzJeFK/vbbfPknbFBzXAOahq
	3o6JvrUqgKE01riYhus/zRjefIL/BxncK87S2IjWIMgcoRDqNJqOwEbqxaGXnm+2QvWZ
	jDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UhZphPUTy9cPxiyCjgtbX7rGRZ6iUlQ5FGNWlKdB098=;
	b=crAOfX9hJBivI0W41if+Xm3SAzBcD7g80XVm59kgzE7U8fBDdEsmpxuStdYiTLU72q
	anqHJxMVEp1SJBel1CTdPQ7Ms0E9y2Fn0MyPSq1IfvN1FRR5VFO+cjIGX/WereT1bcT0
	/OEgmbilEOaYyHfmbh0pPjfQT3RixKYjHq+FIzWSorzDbqRLiecfUrBoziAZyWpOU28f
	EBg0vsv9vol1QB9vWhIb7+m6K6fTKcIg+cuIfVBB0ScAMY1noJWVAVievCD1yTEN1I9R
	+8OXoE660f0ure6Oczwy3X75VEZvU17LQK78UBXXF5ZumDPfyxLw7rFWVOkG8JosQnUM
	zOcA==
X-Gm-Message-State: ALQs6tCU697sf7Bu8RLhOkOomsuaq0v3eeDiY/8bv75sNwQi105fA/2A
	uvZcyl+G6dWAFC/i3Kv5fP0IPN/9GuBqXMDW2jU=
X-Google-Smtp-Source: AIpwx49alv5AQEY6h9EtvCj4BA7RYTKRQ32fG4VqFG7oQT7l/L6Oo0p4RKLPuR9H3WuuVlerl7XU/RZZU95P5T6BZeo=
X-Received: by 2002:a24:55d0:: with SMTP id
	e199-v6mr991604itb.34.1523543936961; 
	Thu, 12 Apr 2018 07:38:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.146.139 with HTTP; Thu, 12 Apr 2018 07:38:56 -0700 (PDT)
In-Reply-To: <CA+chaQcg-01rq7Nq1iGZM80Cce1wN-g-gDc1iNS4RC3QJBhw8Q@mail.gmail.com>
References: <20180412133558.9655-1-Martin.Jansa@gmail.com>
	<7f04089b-7479-2575-6d91-8887118d19f8@zonque.org>
	<CA+chaQcg-01rq7Nq1iGZM80Cce1wN-g-gDc1iNS4RC3QJBhw8Q@mail.gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Thu, 12 Apr 2018 17:38:56 +0300
Message-ID: <CABXoSoX3nprqRjxyzAo5BG3yhk-OhVqAkZXGKeqco25fFrGVRg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][rocko][WIP][PATCH] qt5: upgrade to 5.9.5
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
X-List-Received-Date: Thu, 12 Apr 2018 14:38:56 -0000
Content-Type: text/plain; charset="UTF-8"

I don't think it will be fixed any time soon, which is why we sent
https://patchwork.openembedded.org/patch/148747/

On 12 April 2018 at 17:30, Martin Jansa <martin.jansa@gmail.com> wrote:
>>  Also, I guess you also need to bump the version number in recipes-qt/qt5/qt5-git.inc,
> right?
>
> Right I forgot to squash that change to this one. Well that's one of the
> reasons why this have [WIP] in subject.
>
> Were you testing it on top of latest rocko branch? Your errors show
> ;nobranch=1 which shouldn't be there since:
> https://github.com/meta-qt5/meta-qt5/commit/32bb7d18a08d1c48873d7ab6332d4cc3815a4dff
>
> And for the errors we need to wait until github mirror is synced again:
> latest commit on codereview.qt-project.org is 28 hours old and that's what
> is now in SRCREV:
> https://codereview.qt-project.org/gitweb?p=qt%2Fqtbase.git;a=shortlog;h=refs%2Fheads%2F5.9
>
> but github is 1,5 month behind missing last 35 commits:
> https://github.com/qt/qtbase/commits/5.9
>
> Hopefully this issue with github mirror is only temporary and will be fixed
> soon.
>
> On Thu, Apr 12, 2018 at 4:12 PM, Daniel Mack <daniel@zonque.org> wrote:
>
>> On Thursday, April 12, 2018 03:35 PM, Martin Jansa wrote:
>> > * use latest revision from 5.9, because 5.9.5 tag is only on 5.9.5
>> >   branch which might get removed in future I was told
>> >
>> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>
>> I'm getting the following errors with this patch:
>>
>> WARNING: qtxmlpatterns-5.9.4+gitAUTOINC+3444bfc803-r0 do_fetch: Failed
>> to fetch URL
>> git://github.com/qt/qtxmlpatterns.git;name=qtxmlpatterns;branch=5.9;
>> nobranch=1;protocol=git,
>> attempting MIRRORS if available
>> ERROR: qtxmlpatterns-5.9.4+gitAUTOINC+3444bfc803-r0 do_fetch: Fetcher
>> failure: Unable to find revision
>> 3444bfc8039c5090b02fd7f98abe8064a73019d7 in branch 5.9 even from upstream
>> ERROR: qtxmlpatterns-5.9.4+gitAUTOINC+3444bfc803-r0 do_fetch: Fetcher
>> failure for URL:
>> 'git://github.com/qt/qtxmlpatterns.git;name=qtxmlpatterns;branch=5.9;
>> nobranch=1;protocol=git'.
>> Unable to fetch URL from any source.
>> ERROR: qtxmlpatterns-5.9.4+gitAUTOINC+3444bfc803-r0 do_fetch: Function
>> failed: base_do_fetch
>> ERROR: Logfile of failure stored in:
>> /home/daniel/src/nepos/poky/build/tmp-glibc/work/aarch64-
>> nepos-linux/qtxmlpatterns/5.9.4+gitAUTOINC+3444bfc803-r0/
>> temp/log.do_fetch.3513
>> ERROR: Task
>> (/home/daniel/src/nepos/poky/build/conf/../../../meta-qt5/
>> recipes-qt/qt5/qtxmlpatterns_git.bb:do_fetch)
>> failed with exit code '1'
>> WARNING: qtbase-native-5.9.4+gitAUTOINC+f2095f2c66-r0 do_fetch: Failed
>> to fetch URL
>> git://github.com/qt/qtbase.git;name=qtbase;branch=5.9;
>> nobranch=1;protocol=git,
>> attempting MIRRORS if available
>> ERROR: qtbase-native-5.9.4+gitAUTOINC+f2095f2c66-r0 do_fetch: Fetcher
>> failure: Unable to find revision
>> f2095f2c66d0dae8525879f6c14165ace650e7f1 in branch 5.9 even from upstream
>> ERROR: qtbase-native-5.9.4+gitAUTOINC+f2095f2c66-r0 do_fetch: Fetcher
>> failure for URL:
>> 'git://github.com/qt/qtbase.git;name=qtbase;branch=5.9;
>> nobranch=1;protocol=git'.
>> Unable to fetch URL from any source.
>> ERROR: qtbase-native-5.9.4+gitAUTOINC+f2095f2c66-r0 do_fetch: Function
>> failed: base_do_fetch
>> ERROR: Logfile of failure stored in:
>> /home/daniel/src/nepos/poky/build/tmp-glibc/work/x86_64-
>> linux/qtbase-native/5.9.4+gitAUTOINC+f2095f2c66-r0/temp/log.do_fetch.3509
>> ERROR: Task
>> (/home/daniel/src/nepos/poky/build/conf/../../../meta-qt5/
>> recipes-qt/qt5/qtbase-native_git.bb:do_fetch)
>> failed with exit code '1'
>> WARNING: qtbase-5.9.4+gitAUTOINC+f2095f2c66-r0 do_fetch: Failed to fetch
>> URL
>> git://github.com/qt/qtbase.git;name=qtbase;branch=5.9;
>> nobranch=1;protocol=git,
>> attempting MIRRORS if available
>> ERROR: qtbase-5.9.4+gitAUTOINC+f2095f2c66-r0 do_fetch: Fetcher failure:
>> Unable to find revision f2095f2c66d0dae8525879f6c14165ace650e7f1 in
>> branch 5.9 even from upstream
>> ERROR: qtbase-5.9.4+gitAUTOINC+f2095f2c66-r0 do_fetch: Fetcher failure
>> for URL:
>> 'git://github.com/qt/qtbase.git;name=qtbase;branch=5.9;
>> nobranch=1;protocol=git'.
>> Unable to fetch URL from any source.
>> ERROR: qtbase-5.9.4+gitAUTOINC+f2095f2c66-r0 do_fetch: Function failed:
>> base_do_fetch
>> ERROR: Logfile of failure stored in:
>> /home/daniel/src/nepos/poky/build/tmp-glibc/work/aarch64-
>> nepos-linux/qtbase/5.9.4+gitAUTOINC+f2095f2c66-r0/temp/log.do_fetch.3511
>> ERROR: Task
>> (/home/daniel/src/nepos/poky/build/conf/../../../meta-qt5/
>> recipes-qt/qt5/qtbase_git.bb:do_fetch)
>> failed with exit code '1'
>>
>>
>>
>> Also, I guess you also need to bump the version number in
>> recipes-qt/qt5/qt5-git.inc, right?
>>
>>
>> Thanks,
>> Daniel
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

