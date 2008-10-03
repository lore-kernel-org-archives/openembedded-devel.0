Received: from [66.111.4.27] (helo=out3.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rod@whitby.id.au>) id 1KlacM-0003OX-9y
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Oct 2008 04:42:10 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 0B477172229
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Oct 2008 22:37:56 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Thu, 02 Oct 2008 22:37:56 -0400
X-Sasl-enc: +dQ40OKXd18Mt213kVbTuh5qqes6ykor6+3sQ1izfDI5 1223001475
Received: from [192.168.1.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTPSA id EACF42DACE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Oct 2008 22:37:54 -0400 (EDT)
Message-ID: <48E5857B.1070301@whitby.id.au>
Date: Fri, 03 Oct 2008 12:07:47 +0930
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.16 (Windows/20080708)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: git fetcher failure?
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
X-List-Received-Date: Fri, 03 Oct 2008 02:42:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Anyone know why this git fetch fails?

The git tarball is downloaded from the angstrom tarball stash, but then
when it is unpacked the specific git revision required can't be found:

> fatal: failed to unpack tree object daf0729351631f93f9f2f22af33d46658c6f5d68

I have already tried blowing away anything in the downloads area related
to this git repo ...

> NOTE: Running task 2336 of 5076 (ID: 950, /home/shr/fso-testing/openembedded/packages/freesmartphone/fso-gpsd_git.bb, do_fetch)
> NOTE: package fso-gpsd-0.6+r3+gitrdaf0729351631f93f9f2f22af33d46658c6f5d68: started
> NOTE: package fso-gpsd-0.6+r3+gitrdaf0729351631f93f9f2f22af33d46658c6f5d68-r3: task do_fetch: started
> NOTE: fetch http://www.angstrom-distribution.org/unstable/sources/git_git.freesmartphone.org.fso-gpsd.git_daf0729351631f93f9f2f22af33d46658c6f5d68.tar.gz
> --01:25:48--  http://www.angstrom-distribution.org/unstable/sources/git_git.freesmartphone.org.fso-gpsd.git_daf0729351631f93f9f2f22af33d46658c6f5d68.tar.gz
>            => `/home/shr/fso-testing/downloads/git_git.freesmartphone.org.fso-gpsd.git_daf0729351631f93f9f2f22af33d46658c6f5d68.tar.gz'
> Resolving www.angstrom-distribution.org... 85.214.40.226
> Connecting to www.angstrom-distribution.org|85.214.40.226|:80... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 01:25:49 ERROR 404: Not Found.
> 
> NOTE: fetch http://downloads.openmoko.org/sources/git_git.freesmartphone.org.fso-gpsd.git_daf0729351631f93f9f2f22af33d46658c6f5d68.tar.gz
> --01:25:49--  http://downloads.openmoko.org/sources/git_git.freesmartphone.org.fso-gpsd.git_daf0729351631f93f9f2f22af33d46658c6f5d68.tar.gz
>            => `/home/shr/fso-testing/downloads/git_git.freesmartphone.org.fso-gpsd.git_daf0729351631f93f9f2f22af33d46658c6f5d68.tar.gz'
> Resolving downloads.openmoko.org... 88.198.93.219
> Connecting to downloads.openmoko.org|88.198.93.219|:80... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 01:25:49 ERROR 404: Not Found.
> 
> NOTE: fetch http://www.angstrom-distribution.org/unstable/sources/git_git.freesmartphone.org.fso-gpsd.git.tar.gz
> --01:25:49--  http://www.angstrom-distribution.org/unstable/sources/git_git.freesmartphone.org.fso-gpsd.git.tar.gz
>            => `/home/shr/fso-testing/downloads/git_git.freesmartphone.org.fso-gpsd.git.tar.gz'
> Resolving www.angstrom-distribution.org... 85.214.40.226
> Connecting to www.angstrom-distribution.org|85.214.40.226|:80... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 29,410 (29K) [application/x-gzip]
> 
> 100%[================================================================================================================================================================================>] 29,410        60.71K/s
> 
> 01:25:50 (60.64 KB/s) - `/home/shr/fso-testing/downloads/git_git.freesmartphone.org.fso-gpsd.git.tar.gz' saved [29410/29410]
> 
> NOTE: Fetched git_git.freesmartphone.org.fso-gpsd.git.tar.gz from tarball stash, skipping checkout
> Unpacking 7 objects...
>  100% (7/7) done
> Warning: No merge candidate found because value of config option
>          "branch.master.merge" does not match any remote branch fetched.
> No changes.
> Removing unused objects 100%...
> Done.
> NOTE: Creating tarball of git repository
> fatal: failed to unpack tree object daf0729351631f93f9f2f22af33d46658c6f5d68
> NOTE: Task failed: Fetch failed: Fetch command export PATH=/home/shr/fso-testing/tmp/staging/i686-linux/usr/bin/arm-angstrom-linux-gnueabi:/home/shr/fso-testing/tmp/staging/i686-linux/usr/sbin:/home/shr/fso-testing/tmp/staging/i686-linux/usr/bin:/home/shr/fso-testing/tmp/cross/bin:/home/shr/fso-testing/tmp/staging/i686-linux/sbin:/home/shr/fso-testing/bitbake/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games; git read-tree daf0729351631f93f9f2f22af33d46658c6f5d68 failed with signal 128, output:
> 
> NOTE: oestats: task failed, see http://tinderbox.openembedded.net/packages/155827/
> NOTE: package fso-gpsd-0.6+r3+gitrdaf0729351631f93f9f2f22af33d46658c6f5d68-r3: task do_fetch: failed
> ERROR: TaskFailed event exception, aborting
> NOTE: package fso-gpsd-0.6+r3+gitrdaf0729351631f93f9f2f22af33d46658c6f5d68: failed
> ERROR: Build of /home/shr/fso-testing/openembedded/packages/freesmartphone/fso-gpsd_git.bb do_fetch failed
> ERROR: Task 950 (/home/shr/fso-testing/openembedded/packages/freesmartphone/fso-gpsd_git.bb, do_fetch) failed
> NOTE: Tasks Summary: Attempted 2335 tasks of which 2335 didn't need to be rerun and 1 failed.
> ERROR: '/home/shr/fso-testing/openembedded/packages/freesmartphone/fso-gpsd_git.bb' failed

-- Rod



