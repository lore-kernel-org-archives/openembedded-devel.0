Received: from vms173009pub.verizon.net ([206.46.173.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NfVeU-0000A2-Is
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 10:48:05 +0100
Received: from gandalf.denix.org ([unknown] [71.251.51.225])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KXO009PV8FO4I95@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	11 Feb 2010 03:45:25 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 9F2B514AF60; Thu,
	11 Feb 2010 04:45:24 -0500 (EST)
Date: Thu, 11 Feb 2010 04:45:24 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100211094524.GB17089@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.9
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Race condition in packaged staging?
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
X-List-Received-Date: Thu, 11 Feb 2010 09:48:05 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Hi,

I've been seeing some strange breaks in my builds from time to time since the 
introduction of new style staging. It doesn't happen often, but when it does, 
I usually see a message from "tar" complaining about the archive being changed 
on the fly, which comes from the kernel during it's do_package_stage task, 
staging_packager function. The simplest workaround was to disable parallel 
build and parallel bitbake execution (PARALLEL_MAKE and BB_NUMBER_THREADS).
I usually never had time to investigate further.

Today I received a slightly different message, which gave me some pointers 
towards a possible race condition in packaged staging, when multiple bitbake 
threads are trying to execute relative tasks and have a conflict:

NOTE: Running task 1372 of 1377 (ID: 980, /OE/arago/recipes/ti/ti-dmai_svn.bb, do_package_write)
NOTE: Running task 1373 of 1377 (ID: 18, /OE/arago/recipes/images/arago-dvsdk-image.bb, do_package_update_index_ipk)
NOTE: Running task 1374 of 1377 (ID: 982, /OE/arago/recipes/ti/ti-dmai_svn.bb, do_package_stage)
ERROR: function staging_packager failed
ERROR: log data follows (/OE/arago-tmp/work/omap3evm-none-linux-gnueabi/ti-dmai-1_1.0+svnr423-r51e/temp/log.staging_packager.13580)
| mkdir: cannot create directory `/OE/arago-deploy/pstage/angstromglibc/IPKG_BUILD.13587': File exists
NOTE: Task failed: /OE/arago-tmp/work/omap3evm-none-linux-gnueabi/ti-dmai-1_1.0+svnr423-r51e/temp/log.staging_packager.13580
ERROR: TaskFailed event exception, aborting
ERROR: Build of /OE/arago/recipes/ti/ti-dmai_svn.bb do_package_stage failed
ERROR: Task 982 (/OE/arago/recipes/ti/ti-dmai_svn.bb, do_package_stage) failed
NOTE: Waiting for 1 active tasks to finish
NOTE: 1: /OE/arago/recipes/images/arago-dvsdk-image.bb, do_package_update_index_ipk (13566)
NOTE: Tasks Summary: Attempted 1372 tasks of which 549 didn't need to be rerun and 1 failed.
ERROR: '/OE/arago/recipes/ti/ti-dmai_svn.bb' failed

Hopefully this helps somebody more familiar with the subject (don't want to 
bother RP, but it's his creation :)) easily identify the culprit and fix it, 
either by adding a lock or something similar... :) I hate to not use the full 
power of my 4 cores and run everything in one thread. Thanks.

-- 
Denys


