Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id E9F2A6022E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 15:58:57 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id y129so938803pgy.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 08:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EF4q3GpF2SgPyzHgG0HkZtTf6vUzA8OEe2XPwbGzMRs=;
	b=TvYTCVonbH914rvCBuEgWqAYcOZV6tTzLd3bJBZd562WwT+v6aSzLOmacZziVNLQ4X
	V5xSt3xmbqRLUDbyhpw+GxoPankEx2+JR0YjdsDdbzGTDKkqKVusnrZwgpkO3lbbcl7U
	GboppsPoL/1YZa/8bvCJT7td+RUBoP8vpFHmbas1NJAX0jBUORSQeA332LE2H17Ekw34
	PFlkK652PlkigcoFZfRk5FZeC4qy411EZ76zshpm8c6TbL1TXVdQl4yzuSY/WpO06GJi
	Df7likc/U7Xk+uAnOQfi6uEaycDIUSobfgvyxhL4hTQTbozB/PSWCrEcXd4pJKdEKGxy
	OohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EF4q3GpF2SgPyzHgG0HkZtTf6vUzA8OEe2XPwbGzMRs=;
	b=V5GCvb5vDchYlXJ5NvSvsx6YnB1nFvD5BBp4eAE9+tXnP/upcVWalxZ8LzpCUNT5LM
	TuYNdah3+O26EcNoe9ZHpYgr1wQLUiYmJ+VMCh+7VC4o0/hsu3dueb8IB4ozH4yL0U48
	O53ijESnh4NJ/xRepKukfRqyZzqVitQLqm+C7fLjLctyPD6b7eWPxorq98VgpUQdVgjZ
	nqpOhFxodEqYpGVrDJxARydKzBPicuBzKklfuADN8+PhkqJt0zK+PaJxVUWqDq2b4gir
	QbsTfZ0bf14YD6KUZGv4txoaJdHpttqGzAjIpO9RPwJ/W8oYdL1LPdLk4VMQg/U5tt5w
	reMw==
X-Gm-Message-State: AHYfb5i1J2a5DIvtcunApLGtD5nzj1oR9tvBJxWXLO3h05O72bfpy6sd
	2jHw0k2pAO4HePlBkcgCxh8UmBs78g==
X-Received: by 10.84.133.14 with SMTP id 14mr13958289plf.440.1502380739018;
	Thu, 10 Aug 2017 08:58:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Thu, 10 Aug 2017 08:58:28 -0700 (PDT)
In-Reply-To: <CALatG=6hnNTwGzz1FrFhiCGkj16xHHz_57SKGJjQfY7vWsLNuQ@mail.gmail.com>
References: <1502377935-30119-1-git-send-email-liu.ming50@gmail.com>
	<2f7ad030-fd8a-c925-5435-fe73cebbc443@gmail.com>
	<CALatG=6hnNTwGzz1FrFhiCGkj16xHHz_57SKGJjQfY7vWsLNuQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Aug 2017 08:58:28 -0700
Message-ID: <CAMKF1srNfV-EksvqJXpHTFDkC78svRf5VoVt3mau3cG6+JT9MQ@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCH] json-spirit: Add -latomic to LDFLAGS
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
X-List-Received-Date: Thu, 10 Aug 2017 15:58:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 10, 2017 at 8:36 AM, Ming Liu <liu.ming50@gmail.com> wrote:
> Hi, Khem:
>
> I added that since I observed the error only on a armv5e machine, error did
> not show up on cortexa8/x86_64 machines, so I attempted to guess that option
> would not be always needed, for instance, if some ARCH support atomic
> instructions.

We should add it for armv5 alone then, for other arches, gcc does provide
needed atomics.

>
> //Ming Liu
>
> 2017-08-10 17:19 GMT+02:00 Khem Raj <raj.khem@gmail.com>:
>>
>> On 8/10/17 8:12 AM, liu.ming50@gmail.com wrote:
>> > From: Ming Liu <peter.x.liu@external.atlascopco.com>
>> >
>> > This fixes following errors when compiling with clang:
>> > | ../json_spirit/libjson_spirit.so.4.0.8: error: undefined reference to
>> > '__atomic_load_4'
>> > | ../json_spirit/libjson_spirit.so.4.0.8: error: undefined reference to
>> > '__atomic_compare_exchange_4'
>> > | ../json_spirit/libjson_spirit.so.4.0.8: error: undefined reference to
>> > '__atomic_fetch_sub_4'
>> > | ../json_spirit/libjson_spirit.so.4.0.8: error: undefined reference to
>> > '__atomic_fetch_add_4'
>> >
>> > Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
>> > ---
>> >  meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
>> > b/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
>> > index 53bbf7e..2f456bf 100644
>> > --- a/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
>> > +++ b/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
>> > @@ -17,6 +17,8 @@ S = "${WORKDIR}/json_spirit_v${PV}"
>> >
>> >  DEPENDS = "boost"
>> >
>> > +LDFLAGS += "-Wl,--as-needed -latomic -Wl,--no-as-needed"
>>
>> Do we need --as-needed
>>
>> > +
>> >  inherit cmake
>> >
>> >  FILES_${PN}-dev += "${datadir}/cmake/Modules/FindLibJsonSpirit.cmake"
>> >
>>
>>
>

