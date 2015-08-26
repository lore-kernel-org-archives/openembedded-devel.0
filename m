Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id F116276DA9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2015 18:01:28 +0000 (UTC)
Received: by igbjg10 with SMTP id jg10so47074497igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2015 11:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=kvHcun1zZwO3AicIRvhKcjqHAXWiPUzNmDBqU2ZA18o=;
	b=dsa1lbqPjqDcy9LiTfDRvBzKj7T16Ec7oijo7J5aQjDfGb76zburcUJb+FyZkncsWh
	KVFk3TCjCD4nlGETXZinC6HIFLI7iVNgv2qVKEToscluXRGVM2oGye4ZsqO5O8RXdrLq
	YA9d24z2FxwDmKveblex5fR6S276MzcaNtKNFYOdk5pZJddmyT7mDgttquLzhfwFpUsz
	/tELTkcjcd7aqW+HSZZVY3jYgnHbDqHeaXp8Q6aNP9KyhO0tCShMj2gbCal7maRnpGoc
	RSGm4PXeeDvmWWvU1o3R8na8W6i33esYLfTml+zkFNUNKZx327cKquR7RuZoaeKJtsWB
	GgMQ==
MIME-Version: 1.0
X-Received: by 10.50.92.106 with SMTP id cl10mr12035693igb.64.1440612088990;
	Wed, 26 Aug 2015 11:01:28 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Wed, 26 Aug 2015 11:01:28 -0700 (PDT)
In-Reply-To: <55DD9BFE.6050807@linux.intel.com>
References: <1440583622-11664-1-git-send-email-alexander.kanavin@linux.intel.com>
	<1440585604.1644.17.camel@iki.fi>
	<55DD9BFE.6050807@linux.intel.com>
Date: Wed, 26 Aug 2015 20:01:28 +0200
Message-ID: <CALbNGRR_j3f-KzA4iPQsdGsYe_VcqZYhhGBZ-8+FiHHRuwiDbA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Cc: Tanu Kaskinen <tanuk@iki.fi>
Subject: Re: [PATCH 1/3] libnotify3: remove the recipe
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
X-List-Received-Date: Wed, 26 Aug 2015 18:01:32 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 26, 2015 at 12:59 PM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 08/26/2015 01:40 PM, Tanu Kaskinen wrote:
>>>
>>>   # needs libnotify3 which conflicts with libnotify, mixing them in build
>>> breaks couple of packages
>>
>>
>>
>> This last comment seems to be out of date after this patch.
>
>
> Actually, this whole thing can be removed:
>
> # needs libnotify3 which conflicts with libnotify, mixing them in build
> breaks couple of packages
> EXCLUDE_FROM_WORLD = "1"
>
> Whoever applies this patch, please amend it accordingly.
>
>
> Alex
I think it's not that easy. We need an libnotify append here with some
RREPLACES / RPOVIDES for libnotify3. Right?

Andreas

