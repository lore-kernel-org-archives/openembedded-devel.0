Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <david.thomas@microbee-systems.com>)
	id 1ROsXs-0002Kb-R7 for openembedded-devel@lists.openembedded.org;
	Fri, 11 Nov 2011 15:57:32 +0100
Received: by wwp14 with SMTP id 14so1833861wwp.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Nov 2011 06:51:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.227.60.85 with SMTP id o21mr8446927wbh.0.1321023075178; Fri,
	11 Nov 2011 06:51:15 -0800 (PST)
Received: by 10.227.200.14 with HTTP; Fri, 11 Nov 2011 06:51:15 -0800 (PST)
In-Reply-To: <6416131.BOns2L3oYb@helios>
References: <CALJpqJwD0FPCUiD1FRCKR4e=ZTRJb-Lko1nBAC-gLPp057EKpg@mail.gmail.com>
	<1320996619.7415.4.camel@mattotaupa>
	<833EEBB2-42FF-438F-A5F3-8B24DDD3964D@microbee-systems.com>
	<6416131.BOns2L3oYb@helios>
Date: Fri, 11 Nov 2011 08:51:15 -0600
Message-ID: <CALJpqJzSkZ9g1kSqztyjHk6M-cjZX=Bj-5K06D0V7nHJpLesxQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 11 Nov 2011 14:57:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

Returning the recipe to the original

EVA-DEV:~/openembedded/recipes/matchbox-keyboard$ bitbake -e
matchbox-keyboard | grep ^SRC_URI
SRC_URI="svn://svn.o-hand.com/repos/matchbox/trunk;module=matchbox-keyboard;proto=http
           file://smallscreen-fontsize.patch;patch=1
file://2-Add-new-modifier--layout--Used-to-cycle-thru-all-available-layouts.patch;patch=1
           file://3-Changes-to-improve-layout-rendering--especially-after-adding-support-for.patch;patch=1
           file://4-Add-rendering-debug-logging.patch;patch=1
  file://5-Add-support-for-loading-multiple-independent-layouts.patch;patch=1
           file://6-Add-layout-switch-key-to-all-layouts.patch;patch=1"



svn: OPTIONS of
'http://svn.o-hand.com/repos/matchbox/trunk/matchbox-keyboard': could
not connect to server (http://svn.o-hand.com)
NOTE: package matchbox-keyboard-0.0+svnr1910-r7: task Fetch failed:
Unable to fetch URL
svn://svn.o-hand.com/repos/matchbox/trunk;module=matchbox-keyboard;proto=http
from any source.: Failed
ERROR: Function 'Fetch failed: Unable to fetch URL
svn://svn.o-hand.com/repos/matchbox/trunk;module=matchbox-keyboard;proto=http
from any source.' failed
ERROR: Task 5758
(/home/twoods/openembedded/recipes/matchbox-keyboard/matchbox-keyboard_svn.bb,
do_fetch) failed with exit code '1'
ERROR: '/home/twoods/openembedded/recipes/matchbox-keyboard/matchbox-keyboard_svn.bb'
failed


I am building for the COMPULAB T-CM3530 using the kernel they post online.
The build platform is Ubuntu 10 LTS



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


