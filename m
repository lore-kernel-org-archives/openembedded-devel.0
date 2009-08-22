Received: from [151.189.21.47] (helo=mail-in-07.arcor-online.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martinator.de@arcor.de>) id 1MeiDn-0007Pi-00
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Aug 2009 06:28:55 +0200
Received: from mail-in-13-z2.arcor-online.net (mail-in-13-z2.arcor-online.net
	[151.189.8.30]) by mx.arcor.de (Postfix) with ESMTP id 9F0BD3CA1AC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Aug 2009 06:11:25 +0200 (CEST)
Received: from mail-in-09.arcor-online.net (mail-in-09.arcor-online.net
	[151.189.21.49])
	by mail-in-13-z2.arcor-online.net (Postfix) with ESMTP id 7F8661B8E08
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Aug 2009 06:11:25 +0200 (CEST)
Received: from [192.168.178.27] (e179143172.adsl.alicedsl.de [85.179.143.172])
	(Authenticated sender: martinator.de@arcor.de)
	by mail-in-09.arcor-online.net (Postfix) with ESMTPSA id 3AF601AF2F5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Aug 2009 06:11:25 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mail-in-09.arcor-online.net 3AF601AF2F5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arcor.de; s=mail-in;
	t=1250914285; bh=3O55JSVswIEUyczLtUCNRJfg1CaeU6ItrvyOHx5PDWw=;
	h=Message-ID:Date:From:MIME-Version:To:Subject:Content-Type:
	Content-Transfer-Encoding;
	b=VuHdXYrMO9OAOCWekBnXL55Ai9FwdD0nrPoOcBTi355fdRxylFoUPgmfWeP/aG+oa
	uOBlo/DdzAQEaQlFGmRACKKphz0gOSoSmnacEE1x7QCpD86aPtHq2L7zJe3NverY8l
	NEeWzMhH7ITwH6HRHlJzLuMJbIWy4qzSknwlpSEA=
Message-ID: <4A8F6FE3.5080901@arcor.de>
Date: Sat, 22 Aug 2009 06:11:15 +0200
From: Martin Wegner <martinator.de@arcor.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.96.0
Subject: bitbake source fetch problem :(
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
X-List-Received-Date: Sat, 22 Aug 2009 04:28:55 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hi,

I try to cross compile jalimo/icedtea but bitbake can't fetch
http://www.angstrom-distribution.org/unstable/sources/hg.icedtea6__icedtea.classpath.org_bb7ad7d43804.tar.gz
 :( 

Who can help me please? Here is the log:

martin@martin-desktop:/stuff/openembedded$ bitbake openjdk-6
/var/lib/python-support/python2.6/bb/COW.py:29: DeprecationWarning: the
sets module is deprecated
  import types, sets
WARNING: No matches in filesystem for /stuff/jalimo-trunk/oe-overlay in
COLLECTIONS
/var/lib/python-support/python2.6/bb/COW.py:29: DeprecationWarning: the
sets module is deprecated
  import types, sets
NOTE: Handling BitBake files: \ (7184/7184) [100 %]
NOTE: Parsing finished. 6899 cached, 0 parsed, 285 skipped, 2 masked.
NOTE: Cache is clean, not saving.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
ERROR: Multiple .bb files are due to be built which each provide
virtual/javac-native
(/stuff/openembedded/recipes/ecj/ecj-bootstrap-native.bb
/stuff/openembedded/recipes/openjdk-langtools/openjdk-javac-native_0.0+jdk7-b31.bb).
 This usually means one provides something the other doesn't and should.
NOTE: Executing runqueue
NOTE: Running task 1429 of 2097 (ID: 2,
/stuff/jalimo/trunk/oe-overlay/packages/icedtea/openjdk-6_6b16.bb, do_fetch)
NOTE: fetch
http://www.angstrom-distribution.org/unstable/sources/hg.icedtea6__icedtea.classpath.org_bb7ad7d43804.tar.gz
--2009-08-22 06:00:27-- 
http://www.angstrom-distribution.org/unstable/sources/hg.icedtea6__icedtea.classpath.org_bb7ad7d43804.tar.gz
Resolving www.angstrom-distribution.org... 85.214.40.226
Connecting to www.angstrom-distribution.org|85.214.40.226|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2009-08-22 06:00:28 ERROR 404: Not Found.

NOTE: Fetch hg://icedtea.classpath.org;module=hg/icedtea6;rev=bb7ad7d43804
/usr/bin/env: hg: No such file or directory
NOTE: Task failed: Fetch failed: Fetch command export
SSH_AUTH_SOCK=/tmp/keyring-GtpqAr/socket.ssh; export
PATH=/stuff/tmp/staging/i686-linux/usr/bin/armv5te-angstrom-linux-gnueabi:/stuff/tmp/staging/i686-linux/usr/bin/armv5te-angstrom-linux-gnueabi:/stuff/tmp/staging/i686-linux/usr/sbin:/stuff/tmp/staging/i686-linux/usr/bin:/stuff/tmp/cross/armv5te/bin:/stuff/tmp/staging/i686-linux/sbin:/stuff/tmp/staging/i686-linux/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games;
/usr/bin/env hg clone -r bb7ad7d43804
http://icedtea.classpath.org/hg/icedtea6 hg/icedtea6 failed with signal
127, output:
/usr/bin/env: hg: No such file or directory

ERROR: TaskFailed event exception, aborting
ERROR: Build of
/stuff/jalimo/trunk/oe-overlay/packages/icedtea/openjdk-6_6b16.bb
do_fetch failed
ERROR: Task 2
(/stuff/jalimo/trunk/oe-overlay/packages/icedtea/openjdk-6_6b16.bb,
do_fetch) failed
NOTE: Tasks Summary: Attempted 1428 tasks of which 1428 didn't need to
be rerun and 1 failed.
ERROR:
'/stuff/jalimo/trunk/oe-overlay/packages/icedtea/openjdk-6_6b16.bb' failed

Greetings!

Martin



