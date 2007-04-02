Received: from [216.182.48.170] (helo=beastbox.kfctristate.com)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <tom@openhardware.net>) id 1HYS7v-0001CZ-JT
	for openembedded-devel@openembedded.org; Mon, 02 Apr 2007 21:23:39 +0200
Received: (qmail 6076 invoked from network); 2 Apr 2007 19:23:37 -0000
Received: from unknown (HELO ?172.30.107.2?) (172.30.107.2)
	by beastbox.kfctristate.com with SMTP; 2 Apr 2007 19:23:37 -0000
Message-ID: <4611582F.8010203@openhardware.net>
Date: Mon, 02 Apr 2007 15:23:27 -0400
From: Tom Walsh <tom@openhardware.net>
User-Agent: Thunderbird 1.5.0.10 (X11/20070305)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: versioning madness
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Apr 2007 19:23:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I would like to know how others are handling this problem.   As you 
already know, versioning can be "interesting" with OE.  It is probably 
how I have approached the issue of keeping my list of files seperate 
from the OE bb filetree.

In my project, I have a number of packages which needed specific changes 
to files so that they reflected the needs of the target.  A simple 
example is that of a list of /dev/devices.  initscripts controls the 
device creation through the device_table list.  So, I have a 
device_table file unique to my target.   No problem.

What is a problem is controlling the changes that I make to the OE 
packages tree.  If I simply create a ${MACHINE_NAME} directory under 
packages/initscripts/initscripts-1.0/, then I have to remember that it 
is there.  As this target may never be in the mainstream OE database, I 
keep the uniqueness of my changes in a seperate bb filetree.  The 
local.conf names the BBFILES location of both the mainstream OE tree and 
my bb tree.

This works, if I copy, in total, the packages/initscripts directory into 
my bb tree, then do the changes inside the copy.  I now know where my 
changes are and can distribute them without having people invasively 
patch the OE tree.  Where this breaks down is the in the "PR" variable 
(PR = "r88").  Bitbake will ignore my initscripts-1.0.bb totally, if the 
OE initscripts has a higher "PR" number than my local copy!

The solution that I have done was to set my copy of initscripts-1.0.bb 
to have a PR="r9999", this forces bitbake to always defer to my copy of 
the bb file and ignore the copy in the OE tree.

Develing further into this, as it would seem to me that while this is a 
solution, it is not "elegant" nor is it preferred.  When others make 
changes to packages, such as initscripts, these changes would not be 
propogated into onto my target.  With forcing bitbake to ONLY use my 
copy, changes are not propogated.

It would seem to me that something like this would work, but it doesn't:

BBFILES/initscripts/files/MACHINE_NAME/device_table (IOW: 
zipitbbfiles/initscripts/files/zipit/device_table  would override 
org.openembedded.dev/packages/initscripts-1.0/files/device_table)

That having named 'zipitbbfiles' in local.conf as part of BBFILES, and, 
naming the package 'initscripts' with a dir of 'files'.  That bitbake 
would logically flow with its search for 
'files/${MACHINE_NAME}/device_table' when choosing 'device_table' ???

You would think so, but it doesn't.  The presence of the secondary 
initscripts directory is ignored.  This may be how it should be as there 
is no overriding "PR" value to cause bitbake to vote-off the OE default 
copy.

Do you see what I am trying to do here?




So, the madness continues with this.  Ok, I'll try to use the 
PREFERRED_VERSION_initscripts = "1.0+zipit" and rename my copy of 
initscripts_1.0.bb to initscripts_1.0+zipit.bb.  That does work...  I 
don't need to edit the bb file and set PR="r9999" anymore.

However, this breaks down as well.  There are bb files inside the OE 
tree that do not have a version!  For example: 
org.openembedded.dev/packages/modutils/modutils-collateral.bb is not 
versioned.

Pulling my hair out at this point.  I have reverted back to PR="r9999" 
to force the bitbake version election.  It looks sloppy though, isn't 
there an easier, cleaner way to keep ${MACHINE_NAME} specific files in a 
seperate tree, or, am I resigned to patching the OE tree whenever I want 
to create a working database for my target?




The major issue, as I see it comes down to changes.  If I put my changes 
into the local copy of the OE tree, how do I archive those changes and 
pass them onto someone else?  I could gain write access to the OE tree, 
but, this target should not (or would not) ever be that widespread to 
require it to be added to the repository.

Otherwise, I will still have to set PR to a fantastic value and keep the 
bb files isolated, or use a tarball to patch whatever OE tree that 
someone installs onto their system?



Regards,

TomW





-- 
Tom Walsh - WN3L - Embedded Systems Consultant
http://openhardware.net http://cyberiansoftware.com http://openzipit.org
"Windows? No thanks, I have work to do..."
----------------------------------------------------




