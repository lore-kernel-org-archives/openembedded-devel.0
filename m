Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HXmyq-0006KF-J8
	for openembedded-devel@openembedded.org; Sun, 01 Apr 2007 01:27:32 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l2VNRWZC013620
	for <openembedded-devel@openembedded.org>;
	Sun, 1 Apr 2007 00:27:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12850-10-2 for <openembedded-devel@openembedded.org>;
	Sun,  1 Apr 2007 00:27:29 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l2VNRO1u013601
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sun, 1 Apr 2007 00:27:24 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20070330133719.GF4796@zfr01-2138.crm.mot.com>
References: <20070330133719.GF4796@zfr01-2138.crm.mot.com>
Date: Sun, 01 Apr 2007 00:27:25 +0100
Message-Id: <1175383645.5852.24.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Problem for building glibc (ipkg-build: command not found)
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
X-List-Received-Date: Sat, 31 Mar 2007 23:27:32 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Fri, 2007-03-30 at 15:37 +0200, Jeremy Dufour wrote:
> NOTE: Running task 145 of 182 (ID: 84, /home/djerem/work/zaurus/oe/stuff/org.openembedded.dev/packages/ipkg-utils/ipkg-utils-native_1.6+cvs20050404.bb, do_unpack)
> NOTE: package ipkg-utils-native-1.6+cvs20050404: started
> NOTE: package ipkg-utils-native-1.6+cvs20050404-r8: task do_unpack: started
> NOTE: Unpacking /home/djerem/work/zaurus/oe/dl_dir/ipkg-utils_anoncvs.handhelds.org__20050930.tar.gz to /home/djerem/work/zaurus/oe/stuff/tmp/work/i686-linux/ipkg-utils-native-1.6+cvs20050404-r8/
> NOTE: package ipkg-utils-native-1.6+cvs20050404-r8: task do_unpack: completed
> NOTE: package ipkg-utils-native-1.6+cvs20050404: completed
> NOTE: Running task 148 of 182 (ID: 107, /home/djerem/work/zaurus/oe/stuff/org.openembedded.dev/packages/glibc/glibc_2.3.5+cvs20050627.bb, do_package_write)
> NOTE: package glibc-2.3.5+cvs20050627: started
> NOTE: package glibc-2.3.5+cvs20050627-r13: task do_package_write: started
> sh: ipkg-build: command not found
> NOTE: Task failed: ipkg-build execution failed
> NOTE: package glibc-2.3.5+cvs20050627-r13: task do_package_write: failed
> ERROR: TaskFailed event exception, aborting
> NOTE: package glibc-2.3.5+cvs20050627: failed
> ERROR: Build of /home/djerem/work/zaurus/oe/stuff/org.openembedded.dev/packages/glibc/glibc_2.3.5+cvs20050627.bb do_package_write failed
> ERROR: Task 107 (/home/djerem/work/zaurus/oe/stuff/org.openembedded.dev/packages/glibc/glibc_2.3.5+cvs20050627.bb, do_package_write) failed
> ERROR: '/home/djerem/work/zaurus/oe/stuff/org.openembedded.dev/packages/glibc/glibc_2.3.5+cvs20050627.bb' failed
> 
> 
> I decided to switch back to bitbake-1.6, and it works fine.
> 
> So I am wondering where the problem can come from? A problem of dependancy
> wrong handled by bitabke, a problem of package glibc/ipkg-utils?

It looks like a dependency issue, there is no way to tell bitbake that
ipkg-utils-native must have run do_populate_staging before it can run
do_package_write tasks.

The email I just sent to the list has a proposed fix but its not
backwards compatible so will need some discussion.

A short term work around is to "bitbake ipkg-utils-native" before
running your other bitbake command.

Cheers,

Richard



