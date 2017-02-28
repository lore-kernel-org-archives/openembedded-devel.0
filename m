Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id CFE9872FB1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 15:53:56 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u63so3071842wmu.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 07:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=I1LdmtLYf7V5DqXiNzVqaVBBHfFU0Sk5Z70DNw+nfzI=;
	b=aFqJmwj82BqVmM709/FJnklQNzXjKfbOU+ZmLrTLVQBbxTsCJuzQEB8LW96WxIhB61
	6WxSgSO6CE7z9elpqKJzjYbKTPoOQjJYsSzvFz38klmtwCDjOkjZcbUIhaU7PgOTddn4
	ZRiK1ZhJLf5j83M0x28Ho3u4rs2YO02N9rCgziYCxoreNNGWo8tzDm5qcqEEAwF9R4VM
	bjH88hMwlydqn3yZZeKlWc13gcL93djNLcZ6ZrdeFNC3ITJadq9nnxHlCWfVHEev4RSc
	qQFraZGDv1f495TBMmmZvIAFlGsH1wZ0lDugPCBzooy6tP3efzXoxhYXwJCFa9uTyalP
	XjCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=I1LdmtLYf7V5DqXiNzVqaVBBHfFU0Sk5Z70DNw+nfzI=;
	b=BmAsOfE0B+nDGhFf4MlPEQva5N49yhe8umYGaEmyRByFzgpEloO2R9R9k82JVavAwH
	Xjjer82niNaRdFv+HQOdmnOZUuWuvHbvyeVU/F4/YFFuKa3vblJF38hZFx7w1AA9oQcp
	HUHGNhpM/fRCaYgpKcfEgR1GqiQj9izKdL0ePEfD7rAM6msEW7hFWW1fxpQafJMYtu5t
	q1bHUoFsDVwSMZdTeL3MKMp0RYIPOewM375jikpCF+7V9IvI46MySPUvJDOAKfxi6vo2
	vlhzCPJB4lImEn7OVWNB2abmSpqUUvBRjL4PBbxGjgLQaB00DHNEB/9bjPq5g9yBvms+
	VJiQ==
X-Gm-Message-State: AMke39mu1ZIDV1+C4HBZNeL6c54p2t3dpPJLQvzUPmyYsHwPp2pAnKydYrkyCS1hP5ZSLDBjazkgCOn4Uv4j2g==
X-Received: by 10.28.172.68 with SMTP id v65mr17389215wme.49.1488297238067;
	Tue, 28 Feb 2017 07:53:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Tue, 28 Feb 2017 07:53:57 -0800 (PST)
In-Reply-To: <CADNbA1qfBGSOGoqMTL+oH+9khe90q_9PtiNn3wguJus5Kn6N0A@mail.gmail.com>
References: <1487973956-9430-1-git-send-email-derek@asterius.io>
	<CA+chaQe4JwXjKwhFFG62Z3+9zrGpLfoPA+FFNqibypFQMAcrgQ@mail.gmail.com>
	<CADNbA1qfBGSOGoqMTL+oH+9khe90q_9PtiNn3wguJus5Kn6N0A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 28 Feb 2017 16:53:57 +0100
Message-ID: <CA+chaQesP+RXmj5SEkpCZdiWwZQkfLCwhQHHuiJqHcu2wRtj-w@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-filesystems][PATCH] xfsprogs: update depends to work correctly with RSS
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
X-List-Received-Date: Tue, 28 Feb 2017 15:53:58 -0000
Content-Type: text/plain; charset=UTF-8

Are you using gold (ld-is-gold in DISTRO_FEATURES)?

On Tue, Feb 28, 2017 at 4:37 PM, Derek Straka <derek@asterius.io> wrote:

> I don't understand why I'm not seeing this failure with the patch and you
> are.  The only difference I can think of is that I do a cleansstate prior
> to rebuilding, but I would have expected the additional DEPENDS to
> invalidate any cached SSTATE that may have been laying around.  Any
> thoughts?
>
> On Tue, Feb 28, 2017 at 4:25 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>> Unfortunately still fails with:
>>
>> TOPDIR/tmp-glibc/work/core2-64-oe-linux/xfsprogs/4.8.0-r0/xfsprogs-4.8.0/libxfs/.libs/libxfs.so: error: undefined reference to 'uuid_compare'
>> TOPDIR/tmp-glibc/work/core2-64-oe-linux/xfsprogs/4.8.0-r0/xfsprogs-4.8.0/libxfs/.libs/libxfs.so: error: undefined reference to 'uuid_copy'
>>
>> http://errors.yoctoproject.org/Errors/Details/134287/
>>
>> On Fri, Feb 24, 2017 at 11:05 PM, Derek Straka <derek@asterius.io> wrote:
>>
>>> Resolves build issue exposed by RSS
>>> See http://errors.yoctoproject.org/Errors/Details/130663/
>>>
>>> Signed-off-by: Derek Straka <derek@asterius.io>
>>> ---
>>>  meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb | 3 +--
>>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
>>> b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
>>> index b4c50a2..f527237 100644
>>> --- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
>>> +++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
>>> @@ -15,6 +15,7 @@ inherit autotools-brokensep
>>>
>>>  PACKAGES =+ "${PN}-fsck ${PN}-mkfs ${PN}-repair libhandle"
>>>
>>> +DEPENDS += "util-linux"
>>>
>>>  RDEPENDS_${PN} = "${PN}-fsck ${PN}-mkfs ${PN}-repair"
>>>
>>> @@ -54,5 +55,3 @@ do_configure_prepend () {
>>>  do_install_append() {
>>>          oe_runmake 'DESTDIR=${D}' install install-dev
>>>  }
>>> -
>>> -PNBLACKLIST[xfsprogs] ?= "Fails to build with RSS
>>> http://errors.yoctoproject.org/Errors/Details/130663/"
>>> --
>>> 2.7.4
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>
>>
>

