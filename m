Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id CC73F788C3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 01:20:13 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id i14so1678484pgv.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 17:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=p/gFrZW5M4DCvOlgtVHZf09sWZT3iAhzQJ1Szsfvx+Q=;
	b=ZvuEKYpKrMyk8hI4+Ui/ukfPeqfwu3LCaiQ5md2cfFEHbhD3wO5v5GgaUONqiJfVpg
	ilVbE88VWs3myv3VA/PkK8ToK/vCk/chpBAO4unwSboWRSOB7nbf4zKPyG3Ob04kQcMO
	udWloNjcwBB1JFEYbglQNQQVYG0PSuetU6t4p79yUdAlFGQSFEgOg78NGjjJRF4RvW0w
	MRh0hB5Wfys18ZFaLu5Wuo7bN+AmgRWdwpmrjlsXsw6b+ziCEdq99pmNV2iWD5L3rRsn
	DhZzOPzLDQ71xs0/cH50jzhZ/th+LinoAyv1vWq8UJSrKN7Zsx8i6hTUoe6HZO4K5mr3
	e+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=p/gFrZW5M4DCvOlgtVHZf09sWZT3iAhzQJ1Szsfvx+Q=;
	b=rODkuWvtlbnYh+XNFfs/qYjQu1m1EQQENZ5RHun5dh99NLE9wTFifo1voZ3lYrh4fo
	KuhT4/QGRHveYkh8aZJLYD2MSAd3/VKfiDX7vCMwuvpcORNTq3RIazLf1e1+WWx/Quhn
	8r3NWEnRDN/ew4Z/xpuvDfcscVRiAMmJS/PBJJESfEokwTc9mhn8uY5RGl8yoXvIktZX
	J7nLplm/gAPO1LjHaaEzo1033m+XWxKSikSsmcD8u+EwxPSXnwAFJtFSrPFXGOEGAh/u
	+YRa18xlz5IDmQVqg3tTRfo1XvBcE2djsxvQ91HsygjECnE1JZ+ZScF43iUQwCnfDyw4
	e7IA==
X-Gm-Message-State: APf1xPB8JPWcyPO2yJZKVsafGoCYNITNWtyX5Lj2jnxC2r0h9WUQ+pA4
	36CdjijHZ2t8aVeFawylghfp/g==
X-Google-Smtp-Source: AG47ELvB9nhhzRuczPYnaXZzPWrnFIuwiA0yw4mf7aTKTNWUhl+4KrflThwXQin2Dk7x1L9LARsaXA==
X-Received: by 10.99.171.10 with SMTP id p10mr98121pgf.176.1519867214929;
	Wed, 28 Feb 2018 17:20:14 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:b885:642e:b8e3:aa2c?
	([2601:202:4000:1184:b885:642e:b8e3:aa2c])
	by smtp.gmail.com with ESMTPSA id
	f11sm5638984pfa.166.2018.02.28.17.20.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Feb 2018 17:20:14 -0800 (PST)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<17c4a7f6-c188-1a8c-2371-74ec67ebfdac@linux.intel.com>
	<CALbNGRQ06WiqYyvXzfPuS+QYjU-304os4_Vk=sD+DCnfQ1RoXw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <0ca7d4ab-4777-0732-babf-ce4d2265a732@gmail.com>
Date: Wed, 28 Feb 2018 17:20:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRQ06WiqYyvXzfPuS+QYjU-304os4_Vk=sD+DCnfQ1RoXw@mail.gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Splitting meta-oe?
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
X-List-Received-Date: Thu, 01 Mar 2018 01:20:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 02/28/2018 01:33 PM, Andreas Müller wrote:
> On Wed, Feb 28, 2018 at 6:17 PM, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
>> On 02/20/2018 12:45 PM, Burton, Ross wrote:
>>> Is now a good time to talk about splitting up meta-oe?  Some layers are
>>> actively developed and maintained (one example: meta-python), others are
>>> basically bitrotting and only get touched when something else causes them
>>> to break world builds (one example: meta-gnome).  I've long felt that
>>> meta-oe should be split up and the high quality layers managed in their
>>> own
>>> repositories so patches to them don't get held up by breakage in other
>>> sub-layers.
>>>
>>> Another advantage of splitting out the high quality layers is that we'd
>>> like to look at running more community layers through the Yocto
>>> autobuilder, and granular layers make that easier to manage.
>>>
>>> Comments?
>>
>> I just read the whole discussion (been on holiday), and while it seems that
>> splitting layers is seen as too heavy-handed, there is still something that
>> I believe should be done: a policy for blacklisting and removing
>> unmaintained recipes. Such a policy should be:
>>
>> a) clearly defined;
>> b) consistently applied.
>>
>> If that is in place, I, as an oe-core maintainer, would be a lot more
>> willing to contribute to meta-oe, knowing that recipes I contribute to (for
>> example by fixing issues caused by changes in oe-core) are, in fact, used
>> and taken care of otherwise. However, me endlessly fixing well obsolete
>> gnome2 stuff is just a fast track to not caring anymore.
> Isn't there somebody outside willing/capable/having enough time to
> move to gnome 3? This would be the best way to end the gnome2 bit-rott
> discussion and we'd have a desktop which is commonly used and
> addresses touch input. I tried that many years ago but the blocker at
> that time was gobject-introspection. These times are over for long. I
> wanted to start this during christmas-holiday but then my
> music-machine turned into more efforts than expected... For those
> still wanting what's left over from gnome2 currently (for me gedit - I
> don't like gedit3 search..) there is at least the mate-project an
> alternative.
>> So, which recipes are unmaintained?
>>
>> 1. Badly out of date compared to upstream development. Say, one year or more
>> between version provided by meta-oe master, and latest version released by
>> upstream.
> For example: What if something changes upstream that makes it very
> difficult or impossible for us to follow? Have no recent example for
> that but I think if gobject-introspection would have worked for us
> years ago, gnome2 would not be an issue anymore. You mention below
> that in this case a patch has to be sent out. A comment in the recipe
> would be good enough?
>> 2. Recipes which fail to build, and the situation hasn't been addressed, in,
>> say, six months.
> Yes: recipes not building are useless. Martin has done blacklisting in
> the late phase of his maintainer-ship. The only question I have here:
> Does not build mean for all archs or for just .. how many?

See the "State of the world" emails. It included the Arches and packages
failing.

- armin
>> Once either of these is established, the recipe enters a grace period before
>> it is removed. Any objection to such removal should come with a patch that
>> addresses the reason for it.
>>
> I remember the times of mass blacklisting (if I remember correct last
> was recipe-specific-sysroot) this was
>
> * kind of alarm for me for those recipes I need / take care of
> * easy grep'able for those recipes I thought 'why not - I have some
> spare cycles left over'
>
> So my opinion:
> * Recipes not building for a time to be defined: 1. blacklist and
> after x month -> remove
> * Recipes outdated: same 1.blacklist (undo if somebody complains with
> patch commenting in the recipe why not to remove) 2. remove after a
> time period to be defined
>
> Problem/Challenge:
> The way this was handled in the past was an extra duty put on
> maintainer's shoulders. If somebody could create (or is there
> something already?) a script for that and append it to world builds...
>
> Andreas


