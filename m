Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <david.thomas@microbee-systems.com>)
	id 1ROtVF-0003ut-Aw for openembedded-devel@lists.openembedded.org;
	Fri, 11 Nov 2011 16:58:53 +0100
Received: by wyh5 with SMTP id 5so4269354wyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Nov 2011 07:52:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.227.208.147 with SMTP id gc19mr8576856wbb.25.1321026755170;
	Fri, 11 Nov 2011 07:52:35 -0800 (PST)
Received: by 10.227.200.14 with HTTP; Fri, 11 Nov 2011 07:52:35 -0800 (PST)
In-Reply-To: <6416131.BOns2L3oYb@helios>
References: <CALJpqJwD0FPCUiD1FRCKR4e=ZTRJb-Lko1nBAC-gLPp057EKpg@mail.gmail.com>
	<1320996619.7415.4.camel@mattotaupa>
	<833EEBB2-42FF-438F-A5F3-8B24DDD3964D@microbee-systems.com>
	<6416131.BOns2L3oYb@helios>
Date: Fri, 11 Nov 2011 09:52:35 -0600
Message-ID: <CALJpqJz=KCMbQJqg=_iuCgaFzvk8mH+454saq254ZuS+e8OgtA@mail.gmail.com>
From: David Thomas <david.thomas@microbee-systems.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: SRC_URI = "svn://svn.o-hand.com/repos/matchbox/trunk
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
X-List-Received-Date: Fri, 11 Nov 2011 15:58:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

I think it is choking on this:


PV = "0.0+svnr${SRCPV}"
PR ="r7"

bb.mkdirhier(codir)

 fatal: Not a valid object name 1910
NOTE: package matchbox-keyboard-0.0+svnr0+1910-r7: task Fetch failed:
Unable to fetch URL
git://git.yoctoproject.org/matchbox-keyboard;protocol=git from any
source.: Failed
ERROR: Function 'Fetch failed: Unable to fetch URL
git://git.yoctoproject.org/matchbox-keyboard;protocol=git from any
source.' failed


Tinkering a tad by commenting out PV = "0.0+svnr${SRCPV}"  makes me
think it is trying to point to a specific release in the repository,
something similar.

bb.mkdirhier(codir)

 fatal: Not a valid object name 1910
NOTE: package matchbox-keyboard-svn-r7: task Fetch failed: Unable to
fetch URL git://git.yoctoproject.org/matchbox-keyboard;protocol=git
from any source.: Failed
ERROR: Function 'Fetch failed: Unable to fetch URL
git://git.yoctoproject.org/matchbox-keyboard;protocol=git from any
source.' failed
ERROR: Task 5758
(/home/twoods/openembedded/recipes/matchbox-keyboard/matchbox-keyboard_svn.bb,
do_fetch) failed with exit code '1'
ERROR: '/home/twoods/openembedded/recipes/matchbox-keyboard/matchbox-keyboard_svn.bb'
failed






On Fri, Nov 11, 2011 at 7:05 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Friday 11 November 2011 06:11:14 David Thomas wrote:
>> Well I checked this and the files where in this location... Still no dice.
>> The manual states it first searches to see if they exist then downloads. I
>> see the opposite, it fails to contact the server and then fails.
>
> I don't think this is to do with those files (they are in the files subdir as
> you point out, and they will be found there via FILESPATH; this is automatic).
> If it's contacting the server and failing, it's the URI pointing to that
> server or some other problem relating to that operation. You're not behind
> some kind of firewall that blocks the git protocol are you?
>
> Also, from one of your earlier emails:
>> SRC_URI = "git:///home/twoods/local;protocol=file;branch=master"
>
> I don't think this is what you want. Just use file://<full path> if you want to
> point it to a local location. But I'm not sure that's what you really want
> here either.
>
>> git://git.yoctoproject.org/matchbox-keyboard;protocol=git;file://smallscreen
>> -fontsize.patch;patch=1
>
> That won't work - you have no space between the first URI and the next. Fix
> that, and assuming your network allows access to remote git repos, that should
> work.
>
> You can double check what SRC_URI bitbake is going to use by running this:
>
> bitbake -e matchbox-keyboard | grep ^SRC_URI
>
> Could you also remind me what DISTRO you are using?
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>



-- 
Dave Thomas
MicroBee Systems, Inc
1429 Weatherly Road, Suite G
Huntsville, AL 35803-1187
256-489-6671 (Voice)
256-426-2431 (Mobile)
256-489-6673 (FAX)
www.microbee-systems.com
"Innovative Solutions for an Embedded World"

This message is intended for the sole use of the addressee, and may
contain information that is privileged, confidential and exempt from
disclosure under applicable law. If you are not the addressee you are
hereby notified that you may not use, copy, disclose, or distribute to
anyone the message or any information contained in the message. If you
have received this message in error, please immediately advise the
sender by reply email and delete this message.


