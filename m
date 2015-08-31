Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 04B6376EE2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2015 13:06:30 +0000 (UTC)
Received: by wicpl12 with SMTP id pl12so33058154wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2015 06:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=sv/Zkzp7RnGeduM8t0sEdkqBz8E+NxEI1QGYGhxIpRQ=;
	b=duo3TSANfkdteNPnB+Qc87UVPk/JhdnpkWfZvgQr6LuA5cZHAmbDYQVSTbdcj268zK
	dKepMk5p/JzdTn+d6fyuLaMgo0avUhEGkFNM5dx0ewBVLKGysQQeDvY/STkl2VUtyP2L
	nZ6v+5B06Usyue3eq1sA7kZwCpUXvI1bU4hsQk+mSUj35Vr8ZRRWPXuxcCntdq/UYycm
	qpNmm2wGzWdmU5u6KPTW+iwH0BLa20GOzkeYpkjZFmjtbRrS4RxWgMjmqXMq3hncXeCW
	k5wriTuTMDI4Rxk+ZhN+N2MzjI7bW97LHuaiB32VkBxn7vOjF2bQJeuKBZpq8ZEtBQSm
	B/og==
X-Gm-Message-State: ALoCoQnAYn3oCSAiXqFSmpKLMnqITG9mPytshnoIlI8pTUpj9uaZWuUGucMoWHcFcvenpI+qRecX
X-Received: by 10.194.176.201 with SMTP id ck9mr27060017wjc.108.1441026387479; 
	Mon, 31 Aug 2015 06:06:27 -0700 (PDT)
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com.
	[209.85.212.179]) by smtp.gmail.com with ESMTPSA id
	ev2sm17970293wib.21.2015.08.31.06.06.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Aug 2015 06:06:26 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by wicfv10 with SMTP id fv10so69463373wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2015 06:06:26 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.180.92.225 with SMTP id cp1mr20214065wib.2.1441026386259;
	Mon, 31 Aug 2015 06:06:26 -0700 (PDT)
Received: by 10.28.135.72 with HTTP; Mon, 31 Aug 2015 06:06:26 -0700 (PDT)
In-Reply-To: <55E4035F.6040608@skidata.com>
References: <1A315F32-74AE-4B3B-A5B7-65A33C5A6BC7@gmail.com>
	<CAP9ODKrwYHeeUdcLCLm6Bsw26V4ypZA-kNDYoX=fA4bx_MYQ0Q@mail.gmail.com>
	<55E006B4.50103@skidata.com>
	<CAP9ODKrJz7h9XpTrJZ-k+3nu-W=eFCb4W=91WH_JivZopb6fCg@mail.gmail.com>
	<55E4035F.6040608@skidata.com>
Date: Mon, 31 Aug 2015 10:06:26 -0300
Message-ID: <CAP9ODKpz46jb4rEHTu1377uHZVpXUrnndOWHY0DWERQ0F30NEg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: meta-java - recent commits break foreign (MY!) builds ...
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
X-List-Received-Date: Mon, 31 Aug 2015 13:06:32 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 31, 2015 at 4:33 AM, Richard Leitner
<richard.leitner@skidata.com> wrote:
> On 08/28/2015 04:11 PM, Otavio Salvador wrote:
>> On Fri, Aug 28, 2015 at 3:59 AM, Richard Leitner
>> <richard.leitner@skidata.com> wrote:
>>> I think we should keep (and UPDATE!) openjdk 6 & 7 as long as they get
>>> support from RedHat and therefore IcedTea. There may be users relying on
>>> the old java version for their long-term-supported products (so do we)!
>>>
>>> IMHO we should start with openjdk 6: remove the old versions and add the
>>> latest (1.13.8)!
>>>
>>> What do you think? Any comments?
>>
>> If you are willing to work on that, I have no problem.
>
> As I mentioned, I will update openjdk-7 as long as I need it. If it's
> okay for you I will send patches for these updates to the ml. From a
> current point of view it looks like I will provide updates until end of
> 2016 at least.

Yes; fine with me.

>> The point is Java is complex and we have few people working on this so
>> I prefer one well maintained version than 3 oddly ones.
>
> I understand that. But currently I have no need for openjdk-8. Therefore
> my focus is on keeping openjdk-7 up to date.

Sure.

Specially if your app works with OpenJDK 8 I see no much benefit in
keep using the old version. Do you see it differently?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

