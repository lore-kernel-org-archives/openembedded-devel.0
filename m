Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OCFAp-0007WT-D0
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 May 2010 18:52:43 +0200
Received: (qmail 2532 invoked by uid 503); 12 May 2010 16:55:52 -0000
Received: from b6.ovh.net (HELO mail612.ha.ovh.net) (213.186.33.56)
	by 26.mail-out.ovh.net with SMTP; 12 May 2010 16:55:52 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 12 May 2010 16:48:50 -0000
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 12 May 2010 16:48:50 -0000
Message-ID: <4BEADBF1.20202@eukrea.com>
Date: Wed, 12 May 2010 18:48:49 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.1.9) Gecko/20100317 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20100211094524.GB17089@denix.org>
In-Reply-To: <20100211094524.GB17089@denix.org>
X-Ovh-Tracer-Id: 15848448565506321737
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.27.225
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Race condition in packaged staging?
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
X-List-Received-Date: Wed, 12 May 2010 16:52:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Le 11/02/2010 10:45, Denys Dmytriyenko a écrit :
> I've been seeing some strange breaks in my builds from time to time since the
> introduction of new style staging. It doesn't happen often, but when it does,
> I usually see a message from "tar" complaining about the archive being changed
> on the fly, which comes from the kernel during it's do_package_stage task,
> staging_packager function. The simplest workaround was to disable parallel
> build and parallel bitbake execution (PARALLEL_MAKE and BB_NUMBER_THREADS).
> I usually never had time to investigate further.
>
> Today I received a slightly different message, which gave me some pointers
> towards a possible race condition in packaged staging, when multiple bitbake
> threads are trying to execute relative tasks and have a conflict:
>
> NOTE: Running task 1372 of 1377 (ID: 980, /OE/arago/recipes/ti/ti-dmai_svn.bb, do_package_write)
> NOTE: Running task 1373 of 1377 (ID: 18, /OE/arago/recipes/images/arago-dvsdk-image.bb, do_package_update_index_ipk)
> NOTE: Running task 1374 of 1377 (ID: 982, /OE/arago/recipes/ti/ti-dmai_svn.bb, do_package_stage)
> ERROR: function staging_packager failed
> ERROR: log data follows (/OE/arago-tmp/work/omap3evm-none-linux-gnueabi/ti-dmai-1_1.0+svnr423-r51e/temp/log.staging_packager.13580)
> | mkdir: cannot create directory `/OE/arago-deploy/pstage/angstromglibc/IPKG_BUILD.13587': File exists
> NOTE: Task failed: /OE/arago-tmp/work/omap3evm-none-linux-gnueabi/ti-dmai-1_1.0+svnr423-r51e/temp/log.staging_packager.13580
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /OE/arago/recipes/ti/ti-dmai_svn.bb do_package_stage failed
> ERROR: Task 982 (/OE/arago/recipes/ti/ti-dmai_svn.bb, do_package_stage) failed
> NOTE: Waiting for 1 active tasks to finish
> NOTE: 1: /OE/arago/recipes/images/arago-dvsdk-image.bb, do_package_update_index_ipk (13566)
> NOTE: Tasks Summary: Attempted 1372 tasks of which 549 didn't need to be rerun and 1 failed.
> ERROR: '/OE/arago/recipes/ti/ti-dmai_svn.bb' failed
>
> Hopefully this helps somebody more familiar with the subject (don't want to
> bother RP, but it's his creation :)) easily identify the culprit and fix it,
> either by adding a lock or something similar... :) I hate to not use the full
> power of my 4 cores and run everything in one thread. Thanks.
>
I had a problem which seems to be very close to this problem :
while buidling a project from scratch, it failed at linux's 
staging_packager with the following log :

find: invalid expression; I was expecting to find a ')' somewhere but 
did not see one.
tar: .: file changed as we read it

Simply relaunching bitbake was enough to finish the build.

In this case I had
BB_NUMBER_THREADS=2
PARALLEL_MAKE = "-j 2"

(I also had the same thing with 8 BB threads and - j 8 on an other build 
machine).

Eric


