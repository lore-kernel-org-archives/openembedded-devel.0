Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A19CF64BB
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 06:46:54 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29024.1763621206104575017
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 22:46:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TmJ9Y2gK;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-bbbc58451a3so463889a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 22:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763621205; x=1764226005; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NRI9yTZCtj05mev9UOvLi1lAXE9fXikSL6wEvl4h4QM=;
        b=TmJ9Y2gKrJuDawGHoSeyg8IElTDbthr1DHqh0ZqfOzS/xp9r0y7jnOt4tyIAdIwz89
         6dgmgVzofJgXPZ73hteyKRZJSDOUYiABzkDNVZ2unsbvdZhR4E5HLygTcB4sZxr7240u
         3CMkt8T/pDzQCuEzWt//0jcyVY/JvDPDrD2dvEWyYKMo2CtGGHVjo+Zhwvc6R3anlhfH
         Vh8d8KVKe5t3pv2nrPt4B9ShJ2H9hksDmj7zWJfzm7lPz8Ulyf96Z9Sh+vij6Wht9Bri
         jv6gYnvuJ+gNpdU0ZxnAahq6JNu3sOJGah9i5MiVdG1JMDeBO7a7d2de2BEGN/whYi8n
         104Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763621205; x=1764226005;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRI9yTZCtj05mev9UOvLi1lAXE9fXikSL6wEvl4h4QM=;
        b=GiFUgbqNnvr7mcQ9E6vV7HajsgwHLt4Y5XoGpExPG5VnIgh9aeyCy0aByQUvgtS75N
         dMNoH765GdZv3qB7b+O7RBiL76sK77b5JmT+rVtpM75f1mqemegX49aJ9kOUx9zbggEv
         cXXmCCmhCPtUUDOGMxmLo8T11Gzx2n3rt1tYF5M2Mjwd2gkJ8iZ/JJrf8DmhqvtPKtuD
         8PxHuGB7MPeOu44nTVe5TMdkHHszc3AifXjBme/+UOwfDse3uo5zt8iFnnAMXmEV1SYQ
         J0Rz+Gtp1ZNENntCgqMcJsGbm5mCT0lRDfqnsm71KsHOxyqto5jKqMUz0WxJJN87WNOT
         RafQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjTf3n7e2jBMwqasPa/VmiEei1hHY61wLS6Nb9CXgKmn9q1qdMYrZaYswoYoOYFmxNPx/J84WKt8+whsMg2iz5t88=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzTWVJk+27lapc/RLhFKaz/Cpp9829EkXuK7k4nQfj59F28xFEN
	5t4ER5R0pmanmwQMEdsIEIjfCnMIU18nvvOEYQZTu5juFUAKXwFg7JSaLDDuO2Ha50E=
X-Gm-Gg: ASbGncvcd8AqqrrnQoCsJUhk4Aih9jP2ZUo2jH3aev/Z3k17UGpto6uczT37WFmtx53
	zEY8mrh6MjpnQO2iUeLnhg/pP7UIqq72QQxeb/puSRalrJbDPXee5OHoC1HVb+XnJYLGjkyOLMb
	SFKc2ZKMYSQfaaO3KvIJ0ZF0i+yd1c/M02TZQHSZiZXk9kTqUR0bR2qKiR+/yTMxL1A3yipatGv
	V/wAPQ5H4buLMBUcnc5sA1P3jNSpHjQMo+5dKp9QnInMBgoT8KnBMMURO7zhOOgErw3H+hWIgU8
	9cCjjqB3fQJUvRL37wa3YQwYBJTI4b9v1D4DavR5yU2s6rlGcVzvxDjpYFV3EAqmo7Y/fqZ5OmS
	b+6zYFYM9MkOERjjUxhEpyUsw0NNxboDPxQzABbvDcTjF6pNgilQz2FujB6p9DFnNQStkjz9SD6
	WU8Dk4fkykpu4w9vuBwS9Z4NnhGIuctPh8MCmAESPVlWoqf6AlCaX+pd2pUvyRsLGFiBjwsAQnv
	8fF1W1TPIiBW4/cukdc2hRTPher1bY6IrFrBDwDFw==
X-Google-Smtp-Source: AGHT+IG26dV0A++7ocd9dOan6I+seaULpFkMH7/jXKNvjsZZfg289S+pOYcxQanWQABP606J0QLEHQ==
X-Received: by 2002:a05:7300:ed0d:b0:2a4:6416:7f2e with SMTP id 5a478bee46e88-2a6feae9371mr665470eec.35.1763621205250;
        Wed, 19 Nov 2025 22:46:45 -0800 (PST)
Received: from ?IPV6:2601:646:8201:fd20::a95f? ([2601:646:8201:fd20::a95f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a6fc3d0bb6sm8843743eec.2.2025.11.19.22.46.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 22:46:44 -0800 (PST)
Message-ID: <4173ef4d-5fbb-4a72-a4b4-0ccd4fed6eb6@gmail.com>
Date: Wed, 19 Nov 2025 22:46:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] libtracefs: support reproducible builds
To: Changqing Li <changqing.li@windriver.com>,
 openembedded-devel@lists.openembedded.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1879A2400EFE656B.1255594@lists.openembedded.org>
 <489a414b-b0cc-4cb0-8309-6e150d4817d3@windriver.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <489a414b-b0cc-4cb0-8309-6e150d4817d3@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 06:46:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121930



On 11/19/25 10:23 PM, Changqing Li wrote:
> Hi, Khem, Richard
> 
> This issue and also refer https://git.openembedded.org/openembedded- 
> core/commit/?id=8898f97b4acc9d5c2c6583c91d05327f9093133e,
> 
> both issues caused by randomly mtime of the sources checkout by git.
> 
> So I thought maybe change the mtime of files during upack is better,  
> change  like this:
> 
> diff --git a/lib/bb/fetch2/git.py b/lib/bb/fetch2/git.py
> index 0fcdb19df..c4da45fc6 100644
> --- a/lib/bb/fetch2/git.py
> +++ b/lib/bb/fetch2/git.py
> @@ -752,6 +752,8 @@ class Git(FetchMethod):
>               else:
>                   runfetchcmd("%s checkout %s" % (ud.basecmd, 
> ud.revision), d, workdir=destdir)
> 
> +            runfetchcmd("%s restore-mtime" % ud.basecmd, d, 
> workdir=destdir)
> +
>           return True
> 
>       def clean(self, ud, d):
> 
> But restore-mtime is not a git command,  need to install git-restore- 
> mtime,  another option is modify all the files by "touch -d "last commit 
> time"".
> 
> What is your suggestion? if you agree fix from fetch2/gitt.py,  I can 
> send a patch.
> 

git restore-mtime has few limitations to consider, e.g. it might have
issues with shallow clones. It works with tracked files only, so if we
patch a git tree using quilt and patch adds a file to the tree, this 
might not be something it will consider, uncommitted changes resulting
from patches are going to be ignored as well.

touch -d "last commit time" might be interesting to pursue.

> //changqing
> 
> On 11/20/25 14:12, Changqing Li via lists.openembedded.org wrote:
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> [snip of Makefile]
>>   # bison will create both sqlhist.tab.c and sqlhist.tab.h
>> sqlhist.tab.h:
>> sqlhist.tab.c: sqlhist.y sqlhist.tab.h
>>      bison --debug -v --report-file=bison.report -d -o $@ $<
>> [snip]
>>
>> sources of libtracefs is fetched by git, the mtime of sqlhist.y,
>> sqlhist.tab.c is random. so sometimes, sqlhist.tab.c is regenerated,
>> sometimes, sqlhist.tab.c in original sources in used. bison used to
>> gernerate sqlhist.tab.c by upstream libtracefs maybe has different
>> version with the build host one. This make the final libtracefs.so not
>> reproducible. This fix touch sqlhist.tab.c to make it has the newest
>> mtime, and sqlhist.tab.c is not regenerated during build.
>>
>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ---
>>   meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb
>> index b6bae96896..35eabc7b11 100644
>> --- a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb
>> +++ b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb
>> @@ -16,6 +16,10 @@ SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git;branch=${BP
>>   
>>   inherit pkgconfig bash-completion
>>   
>> +do_compile:prepend() {
>> +    touch ${S}/src/sqlhist.tab.c
>> +}
>> +
>>   do_install() {
>>       oe_runmake install DESTDIR=${D} pkgconfig_dir=${libdir}/pkgconfig
>>   }
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#121928):https://lists.openembedded.org/g/openembedded-devel/message/121928
>> Mute This Topic:https://lists.openembedded.org/mt/116387556/3616873
>> Group Owner:openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub [changqing.li@windriver.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


