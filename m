Received: from bay0-omc4-s16.bay0.hotmail.com ([65.54.190.218])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <salehusman@hotmail.com>) id 1OZmaE-0006Dm-Qu
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 17:12:27 +0200
Received: from BAY127-W14 ([65.54.190.199]) by bay0-omc4-s16.bay0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 16 Jul 2010 08:12:02 -0700
Message-ID: <BAY127-W14254C957B2B347B4D3BDFD8BC0@phx.gbl>
X-Originating-IP: [203.82.49.5]
From: saleh usman <salehusman@hotmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>, OSSIE
	Embedded Discussion <ossie-sca@opensdr.com>
Date: Fri, 16 Jul 2010 21:12:03 +0600
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 16 Jul 2010 15:12:02.0927 (UTC)
	FILETIME=[3ECCFFF0:01CB24F9]
X-SA-Exim-Connect-IP: 65.54.190.218
X-SA-Exim-Mail-From: salehusman@hotmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Problem of libpcap
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
X-List-Received-Date: Fri, 16 Jul 2010 15:12:27 -0000
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


I am bitbaking console-iamge but getting error of not building libpcap? I'v=
e bitbake libpcap separately but it is also not building. Its bitbake fails=
 during configure. These are shown in following terminal logs. Kindly tell =
me how to remove this error?
Saleh

[Saleh@localhost ~]$ bitbake console-image
NOTE: Handling BitBake files: \ (8169/8169) [100 %]
NOTE: Parsing finished. 7530 cached=2C 309 parsed=2C 330 skipped=2C 0 maske=
d.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 1774 of 3226 (ID: 1317=2C /sdr/openembedded/recipes/libp=
cap/libpcap_1.0.0.bb=2C do_configure)
ERROR: function do_configure failed
ERROR: log data follows (/sdr/build/tmp/work/armv5te-angstrom-linux-gnueabi=
/libpcap-1.0.0-r6/temp/log.do_configure.2961)
| cat: /sdr/build/tmp/work/armv5te-angstrom-linux-gnueabi/libpcap-1.0.0-r6/=
libpcap-1.0.0/aclocal.m4: No such file or directory
NOTE: Task failed: /sdr/build/tmp/work/armv5te-angstrom-linux-gnueabi/libpc=
ap-1.0.0-r6/temp/log.do_configure.2961
ERROR: TaskFailed event exception=2C aborting
ERROR: Build of /sdr/openembedded/recipes/libpcap/libpcap_1.0.0.bb do_confi=
gure failed
ERROR: Task 1317 (/sdr/openembedded/recipes/libpcap/libpcap_1.0.0.bb=2C do_=
configure) failed
NOTE: Tasks Summary: Attempted 1773 tasks of which 1773 didn't need to be r=
erun and 1 failed.
ERROR: '/sdr/openembedded/recipes/libpcap/libpcap_1.0.0.bb' failed


[Saleh@localhost openembedded]$ bitbake libpcap
NOTE: Handling BitBake files: \ (8169/8169) [100 %]
NOTE: Parsing finished. 7530 cached=2C 309 parsed=2C 330 skipped=2C 0 maske=
d.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 1695 of 2385 (ID: 7=2C /sdr/openembedded/recipes/libpcap=
/libpcap_1.0.0.bb=2C do_configure)
ERROR: function do_configure failed
ERROR: log data follows (/sdr/build/tmp/work/armv5te-angstrom-linux-gnueabi=
/libpcap-1.0.0-r6/temp/log.do_configure.11281)
| cat: /sdr/build/tmp/work/armv5te-angstrom-linux-gnueabi/libpcap-1.0.0-r6/=
libpcap-1.0.0/aclocal.m4: No such file or directory
NOTE: Task failed: /sdr/build/tmp/work/armv5te-angstrom-linux-gnueabi/libpc=
ap-1.0.0-r6/temp/log.do_configure.11281
ERROR: TaskFailed event exception=2C aborting
ERROR: Build of /sdr/openembedded/recipes/libpcap/libpcap_1.0.0.bb do_confi=
gure failed
ERROR: Task 7 (/sdr/openembedded/recipes/libpcap/libpcap_1.0.0.bb=2C do_con=
figure) failed
NOTE: Tasks Summary: Attempted 1694 tasks of which 1694 didn't need to be r=
erun and 1 failed.
ERROR: '/sdr/openembedded/recipes/libpcap/libpcap_1.0.0.bb' failed

 		 	   		 =20
_________________________________________________________________
Hotmail: Trusted email with Microsoft=92s powerful SPAM protection.
https://signup.live.com/signup.aspx?id=3D60969=

