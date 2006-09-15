Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GOFJa-00015f-QO for openembedded-devel@lists.openembedded.org;
	Fri, 15 Sep 2006 17:09:15 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 79F7E401B49; Fri, 15 Sep 2006 07:43:03 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060915144303.79F7E401B49@tinman.treke.net>
Date: Fri, 15 Sep 2006 07:43:03 -0700 (PDT)
Subject: [Bug 1418] checkroot.sh and /proc/mounts issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Sep 2006 15:09:15 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1418





------- Comment #1 from shanevolpe@gmail.com  2006-09-15 07:43 -------
"checkroot.sh right before it is finished checks the privs. of rootfs in
/proc/modules."

This is a typo:  It should be:
"checkroot.sh right before it is finished checks the privs. of rootfs in
/proc/mounts" 

Sorry for the confusion.
Regards,
Shane

> checkroot.sh right before it is finished checks the privs. of rootfs in
> /proc/modules.  If the rootfs is rw then checkroot.sh exits otherwise it
> remounts it as rw.
> When my system enters this script this is what /proc/mounts looks like:
>     rootfs / rootfs rw 0 0
>     /dev/root / jffs2 ro 0 0 
>     proc /proc proc rw 0 0
> checkroot.sh does its check and sees rootfs is rw so it exists with out
> mounting  "/" as rw.  However /dev/root is the real "/" and it is mounted as ro
> so it does need to be remounted as rw or the system comes up with the root file
> system in ro mode.
> 
> I modified checkroot.sh as follows:
> Line: 153
> --       if [ $(grep rootfs /proc/mounts | awk '{print $4}') = rw ]; then
> ++       if [ $(grep "/dev/root" /proc/mounts | awk '{print $4}') = rw ]; then
>          exit 0
>        fi
>        echo "Remounting root file system..."
>        mount -n -o remount,$rootmode /
> 
> I do not believe this is the best long term solution but it is a temporary one
> for me that works. I would like to hear other people's options on this matter. 
> 
> Why are there two entries in the /proc/mounts for "/"?  
> I verified they are present the minute sysinit calls the first run level
> script.
> 
> Regards,
> Shane
> 


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


