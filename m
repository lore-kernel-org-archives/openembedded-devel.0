Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id C072D6AC56
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Apr 2015 20:25:20 +0000 (UTC)
Received: by wgdm6 with SMTP id m6so96005798wgd.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Apr 2015 13:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=D+EBA1b+HST12z6to2OzuWa7hnvyPsnM0YQBErRuc58=;
	b=W1ZJYSd/KDwfJPkLINGRkc9u4ms9PLIPpF/AVb8y6/Yt+WF7rt2qifCYedd4LX08bX
	SMDDM9n9yi1dGpUBfK8Sq6gWeonKKI44qHm7+BMPBgT4tINPMhLeVnOEVdgcE4K7ZvOE
	Z62xlDQfsi1qQWRDIGQcqY09FHYEndS3E41qSWGg2E4uaJSS+wHCT21Tjs0TS5wRhsHl
	F0LAsxNGZrKOJeK0TEyzVjYzBWHr8lcL3ANFh6auuj4XGh2m7LABrSZ2O3ikFObycb1l
	RkB4aDqeIesC5nEN6YwaskI4RCHhToEtmBNC8lk+gGl7uitYgWglDdAQANgUFXK+6OOU
	fz/w==
X-Received: by 10.180.90.106 with SMTP id bv10mr27364124wib.4.1428006321195;
	Thu, 02 Apr 2015 13:25:21 -0700 (PDT)
Received: from [192.168.50.199] (ip-84-119-99-153.unity-media.net.
	[84.119.99.153])
	by mx.google.com with ESMTPSA id ch6sm8711767wjc.3.2015.04.02.13.25.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Apr 2015 13:25:20 -0700 (PDT)
Message-ID: <551DA5BA.3050505@gmail.com>
Date: Thu, 02 Apr 2015 22:25:30 +0200
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Max Krummenacher <max.oss.09@gmail.com>, 
	Otavio Salvador <otavio@ossystems.com.br>
References: <CAD0=qkK3-x3CXStZkOVqOwfZioaLq+A9XwXehVT+HdLRzGPanw@mail.gmail.com>	<CAEHkU3VM9sWOcBVynfQhesMXsXo5kQDabQuZLypxembQzfdePA@mail.gmail.com>	<551C4F35.7020001@gmail.com>
	<CAEHkU3Xg=NSPw2gc1rmPLy3RD68BRNK5hczmS5e6tTE9gEBk+A@mail.gmail.com>
In-Reply-To: <CAEHkU3Xg=NSPw2gc1rmPLy3RD68BRNK5hczmS5e6tTE9gEBk+A@mail.gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java] Trying to update openjdk-7 to icedtea 2.5.4 and jdk75b13
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
X-List-Received-Date: Thu, 02 Apr 2015 20:25:23 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi Max, Hi Otavio,

I've managed to build and run OpenJDK-7-75b13 on an armv7 target but now
I run into an issue reported all around in the net:
http://icedtea.classpath.org/bugzilla/show_bug.cgi?id=1851

I'm adressing the same issue with the quartz library on my target as in
the last comment. For this specific case it looks like the segfault is
thrown on a call to Object.clone() within the quartz library.
Unfortunately I don't find any bugfix or other hint for fixing that
issue. Other sites state, that "-XX:+PrintCommandLineFlags" works around
that issue. This is right but it makes the VM painfully slow. So it
looks like either the ThumbEE or the whole ASM optimizations won't be
used with that option.
http://blog.timmattison.com/archives/2014/08/29/deal-with-os-linux-zero-dot-cpp-related-jvm-crashes-without-using-the-oracle-jvm/

I've looked for solutions a lot but didn't find anything helpful, yet.
Any ideas?

If anyone wants to play around with my current work. Please have a look
at my fork on github https://github.com/esven/meta-java/tree/jdk_update

Cheers,
Sven

Am 02.04.2015 um 20:28 schrieb Max Krummenacher:
> Hi Sven
> 
> To be honest I don't know.
> I remembered that pull request when I saw your question, however I did
> not build nor test the updated OpenJDK.
> 
> Regards
> Max
> 
> 2015-04-01 22:04 GMT+02:00 Sven Ebenfeld <sven.ebenfeld@gmail.com>:
>> Hi Max,
>>
>> Am 01.04.2015 um 19:17 schrieb Max Krummenacher:
>>> Hi Sven
>>>
>>> Maybe this pull request to the old meta-java repo location contains
>>> already contains some of the stuff you need.
>>> https://github.com/woglinde/meta-java/pull/62
>>
>> Thanks, I will have a look at this.
>> Did you have the same problem with rmic as well?
>>
>>>
>>> Regards
>>> Max
>>>
>> Cheers,
>> Sven
>>

