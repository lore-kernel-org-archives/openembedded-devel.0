Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radoslav@kolev.info>) id 1QGrUA-0002kb-8d
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 May 2011 13:40:18 +0200
Received: by vws2 with SMTP id 2so4762310vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 May 2011 04:37:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.52.181.65 with SMTP id du1mr2043223vdc.100.1304336260674; Mon,
	02 May 2011 04:37:40 -0700 (PDT)
Received: by 10.52.166.231 with HTTP; Mon, 2 May 2011 04:37:40 -0700 (PDT)
In-Reply-To: <20110502105241.GA3275@jama.jama.net>
References: <BANLkTik1xhYidSX6QugYpYv5BmXCL78JUA@mail.gmail.com>
	<20110502105241.GA3275@jama.jama.net>
Date: Mon, 2 May 2011 14:37:40 +0300
Message-ID: <BANLkTinaUrDmaT02zL-H5KCPDVj9T6rm5A@mail.gmail.com>
From: Radoslav Kolev <radoslav@kolev.info>
To: openembedded-devel@lists.openembedded.org
Subject: Re: buildindex is always 0, using BB_GIT_CLONE_FOR_SRCREV = "1"
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
X-List-Received-Date: Mon, 02 May 2011 11:40:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, May 2, 2011 at 1:52 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, May 02, 2011 at 01:18:08PM +0300, Radoslav Kolev wrote:
>> Hi,
>>
>> I'm trying to make a recipe which gets the newest revision from a git
>> repository.
>>
>> Also to get upgradable packages on different build machines I have the
>>
>> BB_GIT_CLONE_FOR_SRCREV = "1"
>
> You need to set empty
> BB_LOCALCOUNT_OVERRIDE = ""
> with it.

Thanks Martin! I unset the variable in local.conf and it's working as
expected now. I am sure I tested doing this before too, but with no
effect. I must have made a change after the last time I tried
unsetting BB_LOCALCOUNT_OVERRIDE which made it work now, but I can't
track this down.

I'd say I find the description in the bitbake.conf comment a little confusing:

# For now disable autoincrement of revision counter in SRCPV, whoever
wants it, should enable it in local.conf or distro config
# Revision counter is incremented only locally (bad for multiple
builders filling shared feeds), LOCALCOUNT can be used to maintain
# counter globally in OE metadata (LOCALCOUNT value set in recipe).
# Make sure you disable it, if you want always upgradable paths for
git recipes without bumping LOCALCOUNT with every SRCREV change
# or if you're using AUTOREV feature.
BB_LOCALCOUNT_OVERRIDE = "1"

My interpretation of this was obviously incorrect. From the first
sentence "For now disable autoincrement ..." it implies that the
current default value of "1" means that it (autoincrement) is
disabled, so no change is needed. And from last sentence "Make sure
you disable it," I understood 'it' as referring to the "autoincrement
of revision counter in SRCPV", but it seems it's referring to the
LOCALCOUNT_OVERRIDE. I think the last sentence will be more clear if
changed to "Make sure you disable this override, if ..."

Also, I thought the BB_LOCALCOUNT_OVERRIDE var was only concerned when
keeping an incrementing counter in the local cache, and not when using
BB_GIT_CLONE_FOR_SRCREV = "1".

So to sum up my understanding now and see if it's correct:

LOCALCOUNT_OVERRIDE actually does two things if unset - enable
autoincrementing of revision counter (doesn't matter if it's coming
from local counter stored in cache or the SCM system like git, svn,
etc) and disable overriding the LOCALCOUNT value form withing reciper.

Regards,
Radoslav Kolev


