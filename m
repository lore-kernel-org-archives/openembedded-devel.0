Received: from [209.85.220.207] (helo=mail-fx0-f207.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <castroenrico@gmail.com>) id 1MvPv8-000222-Qx
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Oct 2009 08:22:45 +0200
Received: by fxm3 with SMTP id 3so4650833fxm.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Oct 2009 23:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=393S8zJUki8wucEYP+p+lT1oYcqxg3FyOHmeMN6SGNo=;
	b=VJHTYhyLkKSVgQp5SYilgiFcSQqhp/nq+St6rHtmwyfclC0hpT5HnCEMEpBzvfQ5z/
	zqne41QLPzReMgRBji1P67SBwViz+XO8gIqZyr4CcO5f1+M9rA96YXEn6S3XIe4jYckO
	r1J5AhrLxVlxyBDsq0Auxc0tjQebcV0BbX+XQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=lkUegNWN8W4dDPQ6hne2hdqr2n9oIl3eudYQiaKLw9nARaqJ3NygXz/86NB5z2yqXI
	f9VPvlzJ9iTtbzJUv5kAGMq/LTXw06j/66eOx0BpBwix2rDJ7rUg/7Zwo9endX5S2ugs
	q1DVc7R9osSFX7MckTQ6Mk2UvBCYr3FCkouIA=
Received: by 10.103.80.36 with SMTP id h36mr1151237mul.18.1254896513282;
	Tue, 06 Oct 2009 23:21:53 -0700 (PDT)
Received: from ubuntu.redarrow (net-93-144-253-88.t2.dsl.vodafone.it
	[93.144.253.88])
	by mx.google.com with ESMTPS id j6sm2253529mue.50.2009.10.06.23.21.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 06 Oct 2009 23:21:52 -0700 (PDT)
Message-ID: <4ACC337D.4080709@gmail.com>
Date: Wed, 07 Oct 2009 08:21:49 +0200
From: Enrico Castro <castroenrico@gmail.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.207
X-SA-Exim-Mail-From: castroenrico@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: mtd-utils-native compile failed
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
X-List-Received-Date: Wed, 07 Oct 2009 06:22:45 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

I built the console-image, but I encountered in this error:

  NOTE: Running task 1615 of 2199 (ID: 103, 
/home/*****/oe/openembedded/recipes/mtd/mtd-utils-native_1.2.0+git.bb, do_compile)
ERROR: function do_compile failed
ERROR: see log in 
/home/*****/oe/tmp/work/i686-linux/mtd-utils-native-1.2.0+git-r3/temp/log.do_compile.16985
NOTE: Task failed: 
/home/*****/oe/tmp/work/i686-linux/mtd-utils-native-1.2.0+git-r3/temp/log.do_compile.16985
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/*****/oe/openembedded/recipes/mtd/mtd-utils-native_1.2.0+git.bb do_compile failed
ERROR: Task 103 (/home/*****/oe/openembedded/recipes/mtd/mtd-utils-native_1.2.0+git.bb, do_compile) 
failed
NOTE: Tasks Summary: Attempted 1614 tasks of which 1614 didn't need to be rerun and 1 failed.
ERROR: '/home/*****/oe/openembedded/recipes/mtd/mtd-utils-native_1.2.0+git.bb' failed

The log file is:

NOTE: make CC=ccache gcc  CFLAGS=-isystem/home/*****/oe/tmp/staging/i686-linux/usr/include -O2 -g 
-I/home/*****/oe/tmp/work/i686-linux/mtd-utils-native-1.2.0+git-r3/git//include -DWITHOUT_XATTR
d=mkfs.ubifs_all; \
	t=`echo $d | sed s:.*_::` d=`echo $d | sed s:_.*::`; \
	make BUILDDIR=/home/*****/oe/tmp/work/i686-linux/mtd-utils-native-1.2.0+git-r3/git/$d -C $d $t
make[1]: Entering directory 
`/home/*****/oe/tmp/work/i686-linux/mtd-utils-native-1.2.0+git-r3/git/mkfs.ubifs'
ccache gcc  -isystem/home/*****/oe/tmp/staging/i686-linux/usr/include -I./include 
-isystem/home/*****/oe/tmp/staging/i686-linux/usr/include -O2 -g 
-I/home/*****/oe/tmp/work/i686-linux/mtd-utils-native-1.2.0+git-r3/git//include -DWITHOUT_XATTR -c 
-o /home/*****/oe/tmp/work/i686-linux/mtd-utils-native-1.2.0+git-r3/git/mkfs.ubifs/mkfs.ubifs.o 
mkfs.ubifs.c -g 
-Wp,-MD,/home/*****/oe/tmp/work/i686-linux/mtd-utils-native-1.2.0+git-r3/git/mkfs.ubifs/.mkfs.ubifs.c.dep
mkfs.ubifs.c: In function 'add_inode_with_data':
mkfs.ubifs.c:944: error: 'FS_COMPR_FL' undeclared (first use in this function)
mkfs.ubifs.c:944: error: (Each undeclared identifier is reported only once
mkfs.ubifs.c:944: error: for each function it appears in.)
mkfs.ubifs.c:946: error: 'FS_SYNC_FL' undeclared (first use in this function)
mkfs.ubifs.c:948: error: 'FS_IMMUTABLE_FL' undeclared (first use in this function)
mkfs.ubifs.c:950: error: 'FS_APPEND_FL' undeclared (first use in this function)
mkfs.ubifs.c:952: error: 'FS_DIRSYNC_FL' undeclared (first use in this function)
mkfs.ubifs.c: In function 'add_dir_inode':
mkfs.ubifs.c:1025: error: 'FS_IOC_GETFLAGS' undeclared (first use in this function)
mkfs.ubifs.c: In function 'add_file':
mkfs.ubifs.c:1211: error: 'FS_COMPR_FL' undeclared (first use in this function)
mkfs.ubifs.c: In function 'add_non_dir':
mkfs.ubifs.c:1255: error: 'FS_IOC_GETFLAGS' undeclared (first use in this function)
make[1]: *** 
[/home/*****/oe/tmp/work/i686-linux/mtd-utils-native-1.2.0+git-r3/git/mkfs.ubifs/mkfs.ubifs.o] Error 1
make[1]: Leaving directory 
`/home/*****/oe/tmp/work/i686-linux/mtd-utils-native-1.2.0+git-r3/git/mkfs.ubifs'
make: *** [subdirs_mkfs.ubifs_all] Error 2
FATAL: oe_runmake failed

Thanks in advance to the reply.

Regards,

Enrico



