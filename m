Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C21BC16AB3
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:52 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.63886.1699041170399400910
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RJlrG+tg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=EIsp3ClS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018b96bed173-68a91303-ea43-4639-a585-0a04347b7b33-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041169;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Pg6HqDYWyPKOuuxsKyDG+HHCphBWR+rMFuqFhHjQ/2g=;
	b=RJlrG+tgBQCsgtF7sMCriRwuYsFQHTE2kfvpwgfDktgFy4s6UjYOnU95S2cLVeml
	A1VfmpMhNsbvjXB9Mpd9w5KfxuBn+YM82JvmSeWvfO1i3qai49XsbRsUPyeyYDufW9K
	ry4da8GbaXClr9CK3YaT+af3nVauoCS2Qeb4Zj2E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041169;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Pg6HqDYWyPKOuuxsKyDG+HHCphBWR+rMFuqFhHjQ/2g=;
	b=EIsp3ClSURE1LV+ivNx+UydZy/gXZyCyUQtqgmbk8d2SJGPrBjnsnZRCvQ5UNU1X
	TbmLxZAQzviX/fswBMckLNvUwOH6Plh3HPDOrIHU0Dufw77SuAWOHLru+9MdRGmYSoB
	gy9cGgyLicPV8n3WjWxz75vcKAo+tztoklFYhGmg=
Content-Type: multipart/mixed; boundary="===============2560798157856167734=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] luaposix: upgrading to 36.2.1 FAILED
Message-ID: <0101018b96bed173-68a91303-ea43-4639-a585-0a04347b7b33-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.193
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105985

--===============2560798157856167734==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *luaposix* to *36.2.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe luaposix failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4994 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-e575f59b82eae78fb1ac8df7198eaa4a7a963259"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"
meta-oe              
meta-python          
meta-perl            
meta-networking      
meta-multimedia      
meta-gnome           
meta-xfce            
meta-filesystems     
meta-initramfs       
meta-webserver       = "tmp-auh-upgrades:535ca66fac7a2c69727984d7f072d737d7ca2f44"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 7 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 5a8d8c768fc3c51f42cb591e9523a60399efc6a1
WARNING: Command 'git rebase 5a8d8c768fc3c51f42cb591e9523a60399efc6a1' failed:
Auto-merging .gitignore
CONFLICT (content): Merge conflict in .gitignore
Auto-merging NEWS.md
CONFLICT (content): Merge conflict in NEWS.md
Auto-merging README.md
CONFLICT (content): Merge conflict in README.md
Auto-merging doc/examples/abstract-ns-client.lua.html
CONFLICT (add/add): Merge conflict in doc/examples/abstract-ns-client.lua.html
Auto-merging doc/examples/abstract-ns-server.lua.html
CONFLICT (add/add): Merge conflict in doc/examples/abstract-ns-server.lua.html
Auto-merging doc/examples/dir.lua.html
CONFLICT (add/add): Merge conflict in doc/examples/dir.lua.html
Auto-merging doc/examples/dup2.lua.html
CONFLICT (add/add): Merge conflict in doc/examples/dup2.lua.html
Auto-merging doc/examples/fork.lua.html
CONFLICT (add/add): Merge conflict in doc/examples/fork.lua.html
Auto-merging doc/examples/fork2.lua.html
CONFLICT (add/add): Merge conflict in doc/examples/fork2.lua.html
Auto-merging doc/examples/getopt.lua.html
CONFLICT (add/add): Merge conflict in doc/examples/getopt.lua.html
Auto-merging doc/examples/glob.lua.html
CONFLICT (add/add): Merge conflict in doc/examples/glob.lua.html
Auto-merging doc/examples/limit.lua.html
CONFLICT (add/add): Merge conflict in doc/examples/limit.lua.html
Auto-merging doc/examples/lock.lua.html
CONFLICT (add/add): Merge conflict in doc/examples/lock.lua.html
Auto-merging doc/examples/netlink-uevent.lua.html
CONFLICT (add/add): Merge conflict in doc/examples/netlink-uevent.lua.html
Auto-merging doc/examples/packet-socket.lua.html
CONFLICT (add/add): Merge conflict in doc/examples/packet-socket.lua.html
Auto-merging doc/examples/ping.lua.html
CONFLICT (add/add): Merge conflict in doc/examples/ping.lua.html
Auto-merging doc/examples/poll.lua.html
CONFLICT (add/add): Merge conflict in doc/examples/poll.lua.html
Auto-merging doc/examples/rt_sched.lua.html
CONFLICT (add/add): Merge conflict in doc/examples/rt_sched.lua.html
Auto-merging doc/examples/signal.lua.html
CONFLICT (add/add): Merge conflict in doc/examples/signal.lua.html
Auto-merging doc/examples/socket.lua.html
CONFLICT (add/add): Merge conflict in doc/examples/socket.lua.html
Auto-merging doc/examples/termios.lua.html
CONFLICT (add/add): Merge conflict in doc/examples/termios.lua.html
Auto-merging doc/examples/tree.lua.html
CONFLICT (add/add): Merge conflict in doc/examples/tree.lua.html
Auto-merging doc/index.html
CONFLICT (add/add): Merge conflict in doc/index.html
Auto-merging doc/ldoc.css
CONFLICT (add/add): Merge conflict in doc/ldoc.css
Auto-merging doc/modules/posix.ctype.html
CONFLICT (add/add): Merge conflict in doc/modules/posix.ctype.html
Auto-merging doc/modules/posix.dirent.html
CONFLICT (add/add): Merge conflict in doc/modules/posix.dirent.html
Auto-merging doc/modules/posix.errno.html
CONFLICT (add/add): Merge conflict in doc/modules/posix.errno.html
Auto-merging doc/modules/posix.fcntl.html
CONFLICT (add/add): Merge conflict in doc/modules/posix.fcntl.html
Auto-merging doc/modules/posix.fnmatch.html
CONFLICT (add/add): Merge conflict in doc/modules/posix.fnmatch.html
Auto-merging doc/modules/posix.glob.html
CONFLICT (add/add): Merge conflict in doc/modules/posix.glob.html
Auto-merging doc/modules/posix.grp.html
CONFLICT (add/add): Merge conflict in doc/modules/posix.grp.html
Auto-merging doc/modules/posix.html
CONFLICT (add/add): Merge conflict in doc/modules/posix.html
Auto-merging doc/modules/posix.libgen.html
CONFLICT (add/add): Merge conflict in doc/modules/posix.libgen.html
Auto-merging doc/modules/posix.poll.html
CONFLICT (add/add): Merge conflict in doc/modules/posix.poll.html
Auto-merging doc/modules/posix.pwd.html
CONFLICT (add/add): Merge conflict in doc/modules/posix.pwd.html
Auto-merging doc/modules/posix.sched.html
CONFLICT (add/add): Merge conflict in doc/modules/posix.sched.html
Auto-merging doc/modules/posix.signal.html
CONFLICT (add/add): Merge conflict in doc/modules/posix.signal.html
Auto-merging doc/modules/posix.stdio.html
CONFLICT (add/add): Merge conflict in doc/modules/posix.stdio.html
Auto-merging doc/modules/posix.stdlib.html
CONFLICT (add/add): Merge conflict in doc/modules/posix.stdlib.html
Auto-merging doc/modules/posix.sys.msg.html
CONFLICT (add/add): Merge conflict in doc/modules/posix.sys.msg.html
Auto-merging doc/modules/posix.sys.resource.html
CONFLICT (add/add): Merge conflict in doc/modules/posix.sys.resource.html
Auto-merging doc/modules/posix.sys.socket.html
CONFLICT (add/add): Merge conflict in doc/modules/posix.sys.socket.html
Auto-merging doc/modules/posix.sys.stat.html
CONFLICT (add/add): Merge conflict in doc/modules/posix.sys.stat.html
Auto-merging doc/modules/posix.sys.statvfs.html
CONFLICT (add/add): Merge conflict in doc/modules/posix.sys.statvfs.html
Auto-merging doc/modules/posix.sys.time.html
CONFLICT (add/add): Merge conflict in doc/modules/posix.sys.time.html
Auto-merging doc/modules/posix.sys.times.html
CONFLICT (add/add): Merge conflict in doc/modules/posix.sys.times.html
Auto-merging doc/modules/posix.sys.utsname.html
CONFLICT (add/add): Merge conflict in doc/modules/posix.sys.utsname.html
Auto-merging doc/modules/posix.sys.wait.html
CONFLICT (add/add): Merge conflict in doc/modules/posix.sys.wait.html
Auto-merging doc/modules/posix.syslog.html
CONFLICT (add/add): Merge conflict in doc/modules/posix.syslog.html
Auto-merging doc/modules/posix.termio.html
CONFLICT (add/add): Merge conflict in doc/modules/posix.termio.html
Auto-merging doc/modules/posix.time.html
CONFLICT (add/add): Merge conflict in doc/modules/posix.time.html
Auto-merging doc/modules/posix.unistd.html
CONFLICT (add/add): Merge conflict in doc/modules/posix.unistd.html
Auto-merging doc/modules/posix.utime.html
CONFLICT (add/add): Merge conflict in doc/modules/posix.utime.html
Auto-merging luaposix-git-1.rockspec
CONFLICT (rename/rename): luaposix-git-1.rockspec renamed to luaposix-36.2.1-1.rockspec in HEAD and to luaposix-35.1-1.rockspec in 14043c5 (Release version 35.1).

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/sources/luaposix
INFO: New recipe is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/recipes/luaposix/luaposix_36.2.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2560798157856167734==--

