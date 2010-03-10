Received: from bay0-omc4-s16.bay0.hotmail.com ([65.54.190.218])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <salehusman@hotmail.com>) id 1NpNcv-0001GW-Eh
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 16:15:20 +0100
Received: from BAY127-W3 ([65.54.190.199]) by bay0-omc4-s16.bay0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 10 Mar 2010 07:12:14 -0800
Message-ID: <BAY127-W3F00BA8EB939E019488D8D8330@phx.gbl>
X-Originating-IP: [203.82.49.5]
From: saleh usman <salehusman@hotmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Date: Wed, 10 Mar 2010 20:12:15 +0500
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 10 Mar 2010 15:12:14.0765 (UTC)
	FILETIME=[10FB55D0:01CAC064]
X-SA-Exim-Connect-IP: 65.54.190.218
X-SA-Exim-Mail-From: salehusman@hotmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	RCVD_IN_SORBS_WEB,SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Problem with Boost library
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
X-List-Received-Date: Wed, 10 Mar 2010 15:15:20 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


I am bitbaking an image and getting an error related to boost library. Imag=
e is of OSSIE and I am getting error of no such file or dirctory while that=
 file actually exists. Kindly tell me what kind of error is this and how to=
 solve it.

Saleh

Terminal log follows
[saleh@localhost ~]$ bitbake ossie-image
NOTE: Out of date cache found=2C rebuilding...
NOTE: Handling BitBake files: / (1497/8107) [18 %]NOTE: Angstrom DOES NOT s=
upport libiconv because the glibc builtin iconv replacement is used
NOTE: Angstrom DOES NOT support libiconv because the glibc builtin iconv re=
placement is used
NOTE: Handling BitBake files: \ (2536/8107) [31 %]NOTE: Angstrom DOES NOT s=
upport bluez-libs because bluez-libs 3.x has been replaced by bluez4
NOTE: Handling BitBake files: | (2538/8107) [31 %]NOTE: Angstrom DOES NOT s=
upport bluez-libs because bluez-libs 3.x has been replaced by bluez4
NOTE: Handling BitBake files: / (2540/8107) [31 %]NOTE: Angstrom DOES NOT s=
upport bluez-utils because bluez-utils 3.x has been replaced by bluez4
NOTE: Handling BitBake files: - (2552/8107) [31 %]NOTE: Angstrom DOES NOT s=
upport bluez-libs because bluez-libs 3.x has been replaced by bluez4
NOTE: Handling BitBake files: - (2558/8107) [31 %]NOTE: Angstrom DOES NOT s=
upport bluez-utils because bluez-utils 3.x has been replaced by bluez4
NOTE: Handling BitBake files: \ (6788/8107) [83 %]NOTE: Angstrom DOES NOT s=
upport fso-apm because regular apmd is good enough
NOTE: Handling BitBake files: \ (8107/8107) [100 %]
NOTE: Parsing finished. 0 cached=2C 7780 parsed=2C 327 skipped=2C 0 masked.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 1339 of 3317 (ID: 2790=2C /oe/openembedded/recipes/db/db=
_4.3.29.bb=2C do_compile)
NOTE: Running task 1340 of 3317 (ID: 2791=2C /oe/openembedded/recipes/db/db=
_4.3.29.bb=2C do_install)
NOTE: Running task 1341 of 3317 (ID: 2233=2C /oe/openembedded/recipes/gdbm/=
gdbm_1.8.3.bb=2C do_populate_staging)
NOTE: Legacy staging mode for /oe/openembedded/recipes/gdbm/gdbm_1.8.3.bb
NOTE: Running task 1342 of 3317 (ID: 1591=2C /oe/openembedded/recipes/omnio=
rb/omniorb-native_4.0.7.bb=2C do_patch)
NOTE: Running task 1343 of 3317 (ID: 1592=2C /oe/openembedded/recipes/omnio=
rb/omniorb-native_4.0.7.bb=2C do_configure)
NOTE: Running task 1344 of 3317 (ID: 2818=2C /oe/openembedded/recipes/tcltk=
/tk_8.4.19.bb=2C do_populate_staging)
NOTE: Legacy staging mode for /oe/openembedded/recipes/tcltk/tk_8.4.19.bb
NOTE: Running task 1345 of 3317 (ID: 2792=2C /oe/openembedded/recipes/db/db=
_4.3.29.bb=2C do_populate_staging)
NOTE: Legacy staging mode for /oe/openembedded/recipes/db/db_4.3.29.bb
NOTE: Running task 1346 of 3317 (ID: 2137=2C /oe/openembedded/recipes/boost=
/boost-jam-native_3.1.16.bb=2C do_patch)
NOTE: Running task 1347 of 3317 (ID: 2138=2C /oe/openembedded/recipes/boost=
/boost-jam-native_3.1.16.bb=2C do_configure)
NOTE: Running task 1348 of 3317 (ID: 2124=2C /oe/openembedded/recipes/pytho=
n/python_2.6.2.bb=2C do_patch)
NOTE: Applying patch '00-fix-bindir-libdir-for-cross.patch' (/oe/openembedd=
ed/recipes/python/python-2.6.2/00-fix-bindir-libdir-for-cross.patch)
NOTE: Applying patch '01-use-proper-tools-for-cross-build.patch' (/oe/opene=
mbedded/recipes/python/python-2.6.2/01-use-proper-tools-for-cross-build.pat=
ch)
NOTE: Applying patch '02-remove-test-for-cross.patch' (/oe/openembedded/rec=
ipes/python/python-2.6.2/02-remove-test-for-cross.patch)
NOTE: Applying patch '03-fix-tkinter-detection.patch' (/oe/openembedded/rec=
ipes/python/python-2.6.2/03-fix-tkinter-detection.patch)
NOTE: Applying patch '04-default-is-optimized.patch' (/oe/openembedded/reci=
pes/python/python-2.6.2/04-default-is-optimized.patch)
NOTE: Applying patch '05-enable-ctypes-cross-build.patch' (/oe/openembedded=
/recipes/python/python-2.6.2/05-enable-ctypes-cross-build.patch)
NOTE: Applying patch '99-ignore-optimization-flag.patch' (/oe/openembedded/=
recipes/python/python-2.6.2/99-ignore-optimization-flag.patch)
NOTE: Running task 1349 of 3317 (ID: 2125=2C /oe/openembedded/recipes/pytho=
n/python_2.6.2.bb=2C do_configure)
NOTE: Running task 1353 of 3317 (ID: 1614=2C /oe/openembedded/recipes/boost=
/boost_1.34.1.bb=2C do_setscene)
ERROR: function staging_helper failed
ERROR: log data follows (/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/=
boost-1.34.1-${INC_PR}.1/temp/log.staging_helper.21242)
| sh: /oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/boost-1.34.1-.1/tem=
p/run.staging_helper.21242: No such file or directory
NOTE: Task failed: /oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/boost-=
1.34.1-${INC_PR}.1/temp/log.staging_helper.21242
ERROR: TaskFailed event exception=2C aborting
ERROR: Build of /oe/openembedded/recipes/boost/boost_1.34.1.bb do_setscene =
failed
ERROR: Task 1614 (/oe/openembedded/recipes/boost/boost_1.34.1.bb=2C do_sets=
cene) failed
NOTE: Tasks Summary: Attempted 1352 tasks of which 1341 didn't need to be r=
erun and 1 failed.
ERROR: '/oe/openembedded/recipes/boost/boost_1.34.1.bb' failed

 		 	   		 =20
_________________________________________________________________
Hotmail: Trusted email with powerful SPAM protection.
https://signup.live.com/signup.aspx?id=3D60969=

