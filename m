Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1OIInG-00019t-JM
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 May 2010 11:57:41 +0200
Received: from cpe002275e3273f-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.245.115] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1OIIjE-0005dq-WC for openembedded-devel@lists.openembedded.org;
	Sat, 29 May 2010 05:53:17 -0400
Date: Sat, 29 May 2010 05:53:09 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@lynx
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.DEB.2.00.1005290545350.9807@lynx>
User-Agent: Alpine 2.00 (DEB 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Firefox build error for beagle/angstrom, sed encounters perm error
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
X-List-Received-Date: Sat, 29 May 2010 09:57:41 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  from a fully pulled OE development branch, trying to build firefox:
...
NOTE: Parsing finished. 7603 cached, 464 parsed, 311 skipped, 0
masked.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 2710 of 2721 (ID: 2,
/home/rpjday/oe/openembedded/recipes/mozilla/firefox_3.6.3.bb,
do_install)
ERROR: function do_install failed
ERROR: see log in
/home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/firefox-3.6.3-r0/temp/log.do_install.9638
NOTE: Task failed:
/home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/firefox-3.6.3-r0/temp/log.do_install.9638
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/rpjday/oe/openembedded/recipes/mozilla/firefox_3.6.3.bb
do_install failed
ERROR: Task 2
(/home/rpjday/oe/openembedded/recipes/mozilla/firefox_3.6.3.bb,
do_install) failed
NOTE: Tasks Summary: Attempted 2710 tasks of which 2710 didn't need to
be rerun and 1 failed.
ERROR: '/home/rpjday/oe/openembedded/recipes/mozilla/firefox_3.6.3.bb'
failed
$

  the tail end of the log file:

...
grep:
/home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/firefox-3.6.3-r0/image/usr/lib/firefox-devel-3.6.3/include:
No such file or directory
sed: couldn't open temporary file
/home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/firefox-3.6.3-r0/image/usr/lib/firefox-devel-3.6.3/bin/greprefs/sedkR2qFg:
Permission denied
sed: couldn't open temporary file
/home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/firefox-3.6.3-r0/image/usr/lib/firefox-devel-3.6.3/bin/components/seddYp3Qg:
Permission denied
sed: couldn't open temporary file
/home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/firefox-3.6.3-r0/image/usr/lib/firefox-devel-3.6.3/bin/defaults/syspref/sedvHkELe:
Permission denied

  the entire log file has been uploaded to
http://pastebin.com/xgiRvK8V.

rday

-- 

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


