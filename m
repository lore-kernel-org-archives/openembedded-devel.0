Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1QVgsX-0007q3-QO
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Jun 2011 11:22:45 +0200
Received: by bwz5 with SMTP id 5so3686283bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Jun 2011 02:19:23 -0700 (PDT)
Received: by 10.204.80.74 with SMTP id s10mr3383488bkk.4.1307870362763;
	Sun, 12 Jun 2011 02:19:22 -0700 (PDT)
Received: from mobil-400-586.intern.dresearch.de
	(ip-109-40-245-22.web.vodafone.de [109.40.245.22])
	by mx.google.com with ESMTPS id af13sm4237325bkc.7.2011.06.12.02.19.20
	(version=SSLv3 cipher=OTHER); Sun, 12 Jun 2011 02:19:21 -0700 (PDT)
Message-ID: <4DF48491.6070901@dresearch-fe.de>
Date: Sun, 12 Jun 2011 11:19:13 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110414 SUSE/3.1.10 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4DF0C472.4030608@dresearch-fe.de> <4DF14C7E.7000701@gmail.com>
In-Reply-To: <4DF14C7E.7000701@gmail.com>
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
X-List-Received-Date: Sun, 12 Jun 2011 09:22:45 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10.06.2011 00:43, Khem Raj wrote:
> On 06/09/2011 06:02 AM, Steffen Sledz wrote:
>> Hi Distro Maintainers,
>>
>> as you could read in earlier messages of mine, we're forced to use an
>> older kernel version (2.6.24) for our hardware. This brings a lot of
>> problems as you can imagine (e.g. we're also bound to udev-141).
>>
>> Until now we've used angstrom-2008.1 with some own patches according to
>> the linux-libc-headers and udev versions for our hardware which were
>> reasonably not accepted by the Angstrom maintainers (see discussions [1]
>> or [2]).
>>
>> In there current situation (angstrom-2008.1 is deprecated, the new layer
>> concept will come up) we're looking for a new, better, less hacky solution.
>>
>> My first question therefor is if there are any distros explicitely
>> supporting older kernels (pre 2.6.27) yet? Or are willing to work on it?
>>
>
> I guess a machine layer on top of oe-core could be something you can work out and add/override needed recipes in this layer.

I think it's not that easy.

For kernels prior to 2.6.27 you can't use a lot of core components (e.g. udev with versions higher than 141 or eggdbus) which *a lot of other components* depend on.

The underlying problem are some kernel API functions like inotify_init1 or epoll_create1. Some distros (e.g. Angstrom) use linux-libc-headers 2.6.31 which is higher then 2.6.27 (what in my opinion conflicts with [1]). So there's no chance to detect the mentioned kernel functions correctly at compile time. :(

As a consequence you have to check this in *all* programs at runtime. This is a good wish but hard to realize. E.g. the udev maintainers itself rejected a related patch[2] and say that they are not willing to support older kernel versions.

So in my opinion there are two possible ways:

1. Use only the old supported versions of the components (udev-141 and glib-dbus instead of eggdbus) with all the consequences for other programs.

2. Determine *all* critical kernel functions, look for *all* the places where these are used, and patch them.

Both are a lot more than some override recipes. So i think this needs an own distro with all the maintenance and testing.

Regards,
Steffen

[1] "but a program built against newer kernel headers may not work on an older kernel" <http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob_plain;f=Documentation/make/headers_install.txt;hb=HEAD>
[2] <http://thread.gmane.org/gmane.linux.hotplug.devel/16590>

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


