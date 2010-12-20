Received: from mail-fx0-f42.google.com ([209.85.161.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <coolaj86@gmail.com>) id 1PUTyQ-0000KT-6u
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Dec 2010 01:51:34 +0100
Received: by fxm11 with SMTP id 11so2223213fxm.29
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Dec 2010 16:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=yIsk9vF16RHegkVIHS0BkdyskJqrNv7qTeCYeI2W+FY=;
	b=J2vVMhvpYaHorTdZXlcHWHQvYPQVUjlT29hXzDAQEuUzcAlmogOHeEvI4acH9KKb3z
	boQPv9Dinn/ysPkgelIp8rcxS/tkOm3EGgaCJ/7vxPFx85Hk0scodm5QEyzmNIgR50ul
	hSRq1zRZ1z+Um1C9ILrID5MNuUmzl5HW0aoxg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=aiUmu8/q6cDO6SkGo8cf+J5NnCBEaHyhlx3Zfl2PKJiDEwPZZSP9QOvCTjS3Ya+RWb
	/jFGB/deqoq2VB07al8sRiloTyksKT+AhAqcZ21njaOjacnUd1dlfNpXOpW+gtD25om+
	d9OPmSJ8HinNpvDUwbwvALizjB/jhP6BXesx0=
Received: by 10.223.97.72 with SMTP id k8mr1340072fan.65.1292806289442; Sun,
	19 Dec 2010 16:51:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.110.140 with HTTP; Sun, 19 Dec 2010 16:51:09 -0800 (PST)
In-Reply-To: <AANLkTi=_xSs+Uc35EzKKHAK9RB8peHR+_a-sxh5rB55p@mail.gmail.com>
References: <AANLkTiknCPruK-CPRKg7hkzhL02Byqk42Tur0a6_fu-7@mail.gmail.com>
	<4D0E865D.8010002@balister.org>
	<AANLkTi=_xSs+Uc35EzKKHAK9RB8peHR+_a-sxh5rB55p@mail.gmail.com>
From: AJ ONeal <coolaj86@gmail.com>
Date: Sun, 19 Dec 2010 17:51:09 -0700
Message-ID: <AANLkTikOE818t47Jda+iiz_H2bN5RKjDdrn4xRR7yJ1Z@mail.gmail.com>
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
X-List-Received-Date: Mon, 20 Dec 2010 00:51:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

I trailed off there...

Both points are valid:

Yours - better to fix what's broken then to create something new that adds
to the obscurity.
Mine - better to delete what's broken and create something new that works.

Reality - lot's of broken things everywhere, some of the same name.

On Sun, Dec 19, 2010 at 5:49 PM, AJ ONeal <coolaj86@gmail.com> wrote:

> Maybe silly, maybe not. It takes just about as much time to learn a
> library's internals as it does to write one.
>
> Case and point: python-inotify.
>
> If you google around for "python-inotify" you get the mainstream module
> that Ubuntu and the rest of the Linux crowd are using.
> This version of the same name has a different API, is a different package.
>
> That's a bit confusing, don't you think?
>
> In this particular case, it may be better to use one of the mainstream
> inotify modules.
> I can't even tell if this one is being actively maintained (though, like I
> said, I e-mailed the author to find out).
>
> That all said, I'm not a python developer, I don't want to figure it out. I
> just want something to use.
>
> AJ ONeal
>
>
> On Sun, Dec 19, 2010 at 3:25 PM, Philip Balister <philip@balister.org>wrote:
>
>> On 12/19/2010 05:18 PM, AJ ONeal wrote:
>>
>>> python-inotify, (bearing no relation to pyinotify or python-inotifyx,
>>> btw)
>>> is broken.
>>> it compiles, but it doesn't work.
>>>
>>> Can someone else confirm?
>>> test case:
>>> https://github.com/coolaj86/python-examples/tree/master/inotify
>>>
>>> After a few events it just freezes.
>>>
>>> I've also informed the author.
>>>
>>> Generally speaking, is there much point in leaving a library in OE that
>>> gives false
>>> hope and then shatters dreams and crushes aspirations?
>>>
>>
>> Now you know it is broken, you should fix. Better for people to have a
>> place to start and not reinvent the wheel.
>>
>> Deleting something just because it does not work is silly. Better to
>> figure out why and fix it.
>>
>> Philip
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
>

