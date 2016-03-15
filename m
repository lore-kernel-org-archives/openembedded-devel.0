Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id EFA6E60125
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Mar 2016 11:42:50 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id bc4so18739274lbc.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Mar 2016 04:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KmN9eoqvaX0I21oG9sEsFZKfVAlAL2p6T21aVKiVUqc=;
	b=ggYdU1HepGTyw9qILaM4fiq+ye3iZ5CM4jAISxUDQFuH3iM+LySi7OPPYPL/jySq3N
	go/29fG40j/KuIM4keIImo0GWEVlME+OUGpS/LPwd63d9op6w15K8tR2CJX3vbiPXEYj
	PWa09QNgjdCLfUHoWE0SFGeh/m6XrxDVYrvKC2luDyEyQdesYTvzZLgBtjIOdz/x3j7r
	Ji2az8bQyLQYd+RPrCkm83l99U/5kk32Gq1bhWaYxnasA77mI5ILHWA8DpcL8ICtO7uc
	Li+iHLOoCsWIfHq0XJLKcPZLdNFg4OdZbvgAH8Jr414KvjcfIhnuwFQ/7QDYh2AMekoO
	Vudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KmN9eoqvaX0I21oG9sEsFZKfVAlAL2p6T21aVKiVUqc=;
	b=lfR9cdCIuJkrR0pbQyUl26SMvfGpqRfG/M2nyZsKhslCo2SPT+T5T83R6Eke5/IbyM
	d2S8EAiICM8EKb5axn6RDxNZgzgwDtGeesY61Hm4QG/oqmFiYHazwIWZ4k6HZaqgSzKj
	mL3M/0VVajYf2c7a88CGmmqzv2gYTA0BAWjlWJsmldEAggBMtqplWuOfp8nKq9bq8WZl
	qzZd4bKrsnTQeEAFQC7mx5fWtgx+jszfHbo6C3sjbd6OdJiKKSJC0B5a11LyiAjgd62T
	YmVzXiVScgwc9ATBqWIpw1ZfEDFKxegtOUMS3UNGtPIlhSQgvMneIWvMQjucIixXTgJI
	AN+Q==
X-Gm-Message-State: AD7BkJJGnUGt38Tezm4leslYI0QSpGBVdSgxFCxs0mfylMQt6q8B/m7YgVaUqFsqxxN6oDRBkNQilmpvl2Eg3g==
X-Received: by 10.112.132.36 with SMTP id or4mr785152lbb.71.1458042170566;
	Tue, 15 Mar 2016 04:42:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.114.109.68 with HTTP; Tue, 15 Mar 2016 04:42:30 -0700 (PDT)
In-Reply-To: <20160315103617.GA2551@jama>
References: <1457957618-32168-1-git-send-email-ricardo.ribalda@gmail.com>
	<1457957618-32168-2-git-send-email-ricardo.ribalda@gmail.com>
	<20160315103617.GA2551@jama>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 15 Mar 2016 12:42:30 +0100
Message-ID: <CAPybu_0ohZW99WQKS3tz61cTpLvXFEu9NaYmnXarYqTH-rOkvQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2 2/4] opencv: Remove blacklist
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
X-List-Received-Date: Tue, 15 Mar 2016 11:42:51 -0000
Content-Type: text/plain; charset=UTF-8

That is really weird. I was pretty sure that I tried it fine on my build.

Let me build it again from scratch.

Sorry!

On Tue, Mar 15, 2016 at 11:36 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Mar 14, 2016 at 01:13:36PM +0100, Ricardo Ribalda Delgado wrote:
>> Version 3.0 builds fine with ffmpeg v3
>
> No it doesn't, 3.1 might
>
> http://errors.yoctoproject.org/Errors/Details/55791/
>
>>
>> [ 32%] Building CXX object
>> modules/videoio/CMakeFiles/opencv_videoio.dir/src/cap_ffmpeg.cpp.o
>> DEBUG: Shell function do_compile finished
>> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>> ---
>>  meta-oe/recipes-support/opencv/opencv_3.0.bb | 5 +----
>>  1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/meta-oe/recipes-support/opencv/opencv_3.0.bb b/meta-oe/recipes-support/opencv/opencv_3.0.bb
>> index f6c4ca8fac16..1a34efa7f01f 100644
>> --- a/meta-oe/recipes-support/opencv/opencv_3.0.bb
>> +++ b/meta-oe/recipes-support/opencv/opencv_3.0.bb
>> @@ -130,7 +130,4 @@ do_install_append() {
>>
>>      install -d ${D}${datadir}/OpenCV/samples/bin/
>>      cp -f bin/*-tutorial-* bin/*-example-* ${D}${datadir}/OpenCV/samples/bin/
>> -}
>> -
>> -# http://errors.yoctoproject.org/Errors/Details/40660/
>> -PNBLACKLIST[opencv] ?= "Not compatible with currently used ffmpeg 3"
>> +}
>> \ No newline at end of file
>> --
>> 2.7.0
>>
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



-- 
Ricardo Ribalda

