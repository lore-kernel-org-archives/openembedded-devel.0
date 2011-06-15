Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QWrbi-0006Au-HR
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jun 2011 17:02:14 +0200
Received: by iwn19 with SMTP id 19so372881iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2011 07:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=SKepAaYX0ufYyWBLuOT6sjkaZBBUi3+z8lyqDkF9fJg=;
	b=YCuPuKox0nnpO/54monlPsrBfsRaEjcGCmj499tIn2240OrYJoTTNYi/s/Psaww/mC
	7C87MqrYikQ3T9/uh8h0G3NOdJ13Zl0zouDundLJNReNSlmd5OsKu7wmlA+5oX4EiFc9
	PC0EiYO3hZTMkrhRU964tg8jVR0Y7bLCEv8ck=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=VHV2KK5j4OVu2RA8mFYVfrSKpAWtL1TuMtly/gqOXQctMZItLUc3mSfXgOUSQKV0c7
	8/P9nD9OoUBi1LzdG8oosPCWvEZXExuT7EQ7nojZ2DAWP/1DavW3AG4VwXVcozj5569o
	APlIuSBd7YnoK0myhuZshEYG89AJoQIKSUwQ0=
Received: by 10.231.111.215 with SMTP id t23mr513879ibp.51.1308149927247;
	Wed, 15 Jun 2011 07:58:47 -0700 (PDT)
Received: from [192.168.1.82] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id in11sm266144ibb.56.2011.06.15.07.58.44
	(version=SSLv3 cipher=OTHER); Wed, 15 Jun 2011 07:58:45 -0700 (PDT)
Message-ID: <4DF8C8A3.6020501@gmail.com>
Date: Wed, 15 Jun 2011 07:58:43 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4DF0C472.4030608@dresearch-fe.de>	<4DF14C7E.7000701@gmail.com>	<4DF48491.6070901@dresearch-fe.de>	<it2911$eb0$1@dough.gmane.org>
	<4DF84A7D.2080803@dresearch-fe.de>
In-Reply-To: <4DF84A7D.2080803@dresearch-fe.de>
Subject: Re: Distros supporting older kernels?
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
X-List-Received-Date: Wed, 15 Jun 2011 15:02:14 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/14/2011 11:00 PM, Steffen Sledz wrote:
> On 12.06.2011 13:47, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 12-06-11 11:19, Steffen Sledz wrote:
>>> On 10.06.2011 00:43, Khem Raj wrote:
>>>> On 06/09/2011 06:02 AM, Steffen Sledz wrote:
>>>>> Hi Distro Maintainers,
>>>>>
>>>>> as you could read in earlier messages of mine, we're forced to use an
>>>>> older kernel version (2.6.24) for our hardware. This brings a lot of
>>>>> problems as you can imagine (e.g. we're also bound to udev-141).
>>>>>
>>>>> Until now we've used angstrom-2008.1 with some own patches
>>>>> according to
>>>>> the linux-libc-headers and udev versions for our hardware which were
>>>>> reasonably not accepted by the Angstrom maintainers (see
>>>>> discussions [1]
>>>>> or [2]).
>>>>>
>>>>> In there current situation (angstrom-2008.1 is deprecated, the new
>>>>> layer
>>>>> concept will come up) we're looking for a new, better, less hacky
>>>>> solution.
>>>>>
>>>>> My first question therefor is if there are any distros explicitely
>>>>> supporting older kernels (pre 2.6.27) yet? Or are willing to work
>>>>> on it?
>>>>>
>>>>
>>>> I guess a machine layer on top of oe-core could be something you can
>>>> work out and add/override needed recipes in this layer.
>>>
>>> I think it's not that easy.
>>>
>>> For kernels prior to 2.6.27 you can't use a lot of core components (e.g.
>>> udev with versions higher than 141 or eggdbus) which *a lot of other
>>> components* depend on.
>>>
>>> The underlying problem are some kernel API functions like inotify_init1
>>> or epoll_create1. Some distros (e.g. Angstrom) use linux-libc-headers
>>> 2.6.31 which is higher then 2.6.27 (what in my opinion conflicts with
>>> [1]). So there's no chance to detect the mentioned kernel functions
>>> correctly at compile time. :(
>>>
>>> As a consequence you have to check this in *all* programs at runtime.
>>> This is a good wish but hard to realize. E.g. the udev maintainers
>>> itself rejected a related patch[2] and say that they are not willing to
>>> support older kernel versions.
>>>
>>> So in my opinion there are two possible ways:
>>>
>>> 1. Use only the old supported versions of the components (udev-141 and
>>> glib-dbus instead of eggdbus) with all the consequences for other
>>> programs.
>>>
>>> 2. Determine *all* critical kernel functions, look for *all* the places
>>> where these are used, and patch them.
>>>
>>> Both are a lot more than some override recipes. So i think this needs an
>>> own distro with all the maintenance and testing.
>>
>> 3) Cut your losses and update your kernel port. At some point it just
>> isn't economically feasible aymore to bend userspace against an obsolete
>> kernel.
>
> You can believe me, we would like to do nothing more than this.
>
> But unfortunately we got only one big patch of more than 10000 lines
> against 2.6.24 from the CPU manufacturer (ex Oxford Semiconductors, now
> PLX Technology).
>
> We do not have the power to split up and port this code to newer kernel
> versions and the manufacturer is not willing to do it. :(

Create a linux-libc-headers recipe which builds out of your 2.6.24 
kernel that can fix glibc compatibility and lot other userspace problems
unless some apps really really need new features from kernel. Then you
have to either backport that functionality in kernel or use older 
version of app which does not depend on the new functionality so this
way you can probably have something

If a standard distro should support it or not depends on distro userbase
for that machine
>
> Regards,
> Steffen
>



