Received: from [206.46.173.17] (helo=vms173017pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MvQbm-0002TY-87
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Oct 2009 09:06:49 +0200
Received: from gandalf.denix.org ([71.127.57.136]) by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KR4009GNUDC9APF@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	07 Oct 2009 02:05:41 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A35B614AF60; Wed,
	07 Oct 2009 03:05:35 -0400 (EDT)
Date: Wed, 07 Oct 2009 03:05:35 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20091007070535.GA32377@denix.org>
References: <4ACC337D.4080709@gmail.com>
MIME-version: 1.0
In-reply-to: <4ACC337D.4080709@gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.17
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: mtd-utils-native compile failed
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
X-List-Received-Date: Wed, 07 Oct 2009 07:06:49 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Oct 07, 2009 at 08:21:49AM +0200, Enrico Castro wrote:
> I built the console-image, but I encountered in this error:
>
> -Wp,-MD,/home/*****/oe/tmp/work/i686-linux/mtd-utils-native-1.2.0+git-r3/git/mkfs.ubifs/.mkfs.ubifs.c.dep
> mkfs.ubifs.c: In function 'add_inode_with_data':
> mkfs.ubifs.c:944: error: 'FS_COMPR_FL' undeclared (first use in this 
> function)
> mkfs.ubifs.c:944: error: (Each undeclared identifier is reported only once
> mkfs.ubifs.c:944: error: for each function it appears in.)
> mkfs.ubifs.c:946: error: 'FS_SYNC_FL' undeclared (first use in this 
> function)
> mkfs.ubifs.c:948: error: 'FS_IMMUTABLE_FL' undeclared (first use in this 
> function)
> mkfs.ubifs.c:950: error: 'FS_APPEND_FL' undeclared (first use in this 
> function)
> mkfs.ubifs.c:952: error: 'FS_DIRSYNC_FL' undeclared (first use in this 
> function)
> mkfs.ubifs.c: In function 'add_dir_inode':
> mkfs.ubifs.c:1025: error: 'FS_IOC_GETFLAGS' undeclared (first use in this 
> function)
> mkfs.ubifs.c: In function 'add_file':
> mkfs.ubifs.c:1211: error: 'FS_COMPR_FL' undeclared (first use in this 
> function)
> mkfs.ubifs.c: In function 'add_non_dir':
> mkfs.ubifs.c:1255: error: 'FS_IOC_GETFLAGS' undeclared (first use in this 
> function)
> make[1]: *** 

Your host linux-libc-headers are too old for UBIFS. Either upgrade your host, 
set PREFERRED_VERSION to 1.1.0 or disable UBI altogether[1].

[1] http://arago-project.org/git/?p=arago.git;a=commitdiff;h=8771cb4b44b8ba776d8e0aef1b7790e68b3358da

-- 
Denys


