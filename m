Received: from mail-fx0-f42.google.com ([209.85.161.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <coolaj86@gmail.com>) id 1PUTwb-0000I4-HL
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Dec 2010 01:49:41 +0100
Received: by fxm11 with SMTP id 11so2222502fxm.29
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Dec 2010 16:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=Z5wcxd0H/qgh2BoPlFNmkxBHgXjr+vgJ8YuUCBh4+9k=;
	b=rTmWl8xpFwiFCw/9kiQlcK+6YDk/FOtKskGT7nlERoAjJMzZPLe0aeXeHd00/c+QSx
	T/vEzcgm+Jd9PXg/NQaoBxIB7Gm9ofC3b93UxcyfvOLlagg4kjonZEcSwuYfh+fTXj5W
	/yR602ue6EiRkbRYD8ZVokIsvIcXroa03/Rdc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=XuB5vwaEVy7TUqAwkFgbyeQItNkUKXpCKw7Dk785Xs6ABv10PSuhVfdBqwSdbFWZfs
	EyKT9Ypkx9jjGWyStqwX6XIjXJRsKU5s5clU93kTtzEthtXLROL1NaxF4Z1ZpCWXMWlQ
	nLCruubGR9XZ6V2KPRgpjeYzLbgjLCWePytAo=
Received: by 10.223.103.6 with SMTP id i6mr3931002fao.84.1292806175380; Sun,
	19 Dec 2010 16:49:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.110.140 with HTTP; Sun, 19 Dec 2010 16:49:15 -0800 (PST)
In-Reply-To: <4D0E865D.8010002@balister.org>
References: <AANLkTiknCPruK-CPRKg7hkzhL02Byqk42Tur0a6_fu-7@mail.gmail.com>
	<4D0E865D.8010002@balister.org>
From: AJ ONeal <coolaj86@gmail.com>
Date: Sun, 19 Dec 2010 17:49:15 -0700
Message-ID: <AANLkTi=_xSs+Uc35EzKKHAK9RB8peHR+_a-sxh5rB55p@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: python-inotify broken
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
X-List-Received-Date: Mon, 20 Dec 2010 00:49:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

Maybe silly, maybe not. It takes just about as much time to learn a
library's internals as it does to write one.

Case and point: python-inotify.

If you google around for "python-inotify" you get the mainstream module that
Ubuntu and the rest of the Linux crowd are using.
This version of the same name has a different API, is a different package.

That's a bit confusing, don't you think?

In this particular case, it may be better to use one of the mainstream
inotify modules.
I can't even tell if this one is being actively maintained (though, like I
said, I e-mailed the author to find out).

That all said, I'm not a python developer, I don't want to figure it out. I
just want something to use.

AJ ONeal

On Sun, Dec 19, 2010 at 3:25 PM, Philip Balister <philip@balister.org>wrote:

> On 12/19/2010 05:18 PM, AJ ONeal wrote:
>
>> python-inotify, (bearing no relation to pyinotify or python-inotifyx, btw)
>> is broken.
>> it compiles, but it doesn't work.
>>
>> Can someone else confirm?
>> test case:
>> https://github.com/coolaj86/python-examples/tree/master/inotify
>>
>> After a few events it just freezes.
>>
>> I've also informed the author.
>>
>> Generally speaking, is there much point in leaving a library in OE that
>> gives false
>> hope and then shatters dreams and crushes aspirations?
>>
>
> Now you know it is broken, you should fix. Better for people to have a
> place to start and not reinvent the wheel.
>
> Deleting something just because it does not work is silly. Better to figure
> out why and fix it.
>
> Philip
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

