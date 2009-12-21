Received: from bay0-omc4-s7.bay0.hotmail.com ([65.54.190.209])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <salehusman@hotmail.com>) id 1NMkG6-0000mS-Eg
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Dec 2009 16:33:21 +0100
Received: from BAY127-W4 ([65.54.190.199]) by bay0-omc4-s7.bay0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 21 Dec 2009 07:30:23 -0800
Message-ID: <BAY127-W4FA6C5C1EEBBD693C15EFD8820@phx.gbl>
X-Originating-IP: [203.82.49.5]
From: saleh usman <salehusman@hotmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 Dec 2009 20:30:23 +0500
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 21 Dec 2009 15:30:23.0219 (UTC)
	FILETIME=[831DFC30:01CA8252]
X-SA-Exim-Connect-IP: 65.54.190.209
X-SA-Exim-Mail-From: salehusman@hotmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Building "console-image"
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
X-List-Received-Date: Mon, 21 Dec 2009 15:33:21 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable





Hello=20
I am building "console-image"  and aftrer bitbaking what steps I should exa=
ctly follow to run it on my board b.I've bord which has an ARM GPP processo=
r runing  linux on it=2C means which files I need and how to run them and a=
lso my board dosn't suppot gcc.

I am new to both linux and openembedded so plz help me in moving forward.

Terminal window is looking like as below.
=20
=20
=20
[saleh@localhost build]$ bitbake console-image
NOTE: Handling BitBake files: - (7634/7634) [100 %]
NOTE: Parsing finished. 7045 cached=2C 303 parsed=2C 286 skipped=2C 0 maske=
d.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 1399 of 2472 (ID: 228=2C /oe/openembedded/recipes/angstr=
om/angstrom-version.bb=2C do_setscene)
staging-angstrom-version-omap5912osk-angstrom-linux-gnueabi - 2009.X-test-2=
0091221-r2
Removing package staging-angstrom-version-omap5912osk-angstrom-linux-gnueab=
i from root...
(offline root mode: not running staging-angstrom-version-omap5912osk-angstr=
om-linux-gnueabi.prerm)
(offline root mode: not running staging-angstrom-version-omap5912osk-angstr=
om-linux-gnueabi.postrm)
Installing staging-angstrom-version-omap5912osk-angstrom-linux-gnueabi (200=
9.X-test-20091221-r2) to root...
(offline root mode: not running staging-angstrom-version-omap5912osk-angstr=
om-linux-gnueabi.preinst)
Configuring staging-angstrom-version-omap5912osk-angstrom-linux-gnueabi
(offline root mode: not running staging-angstrom-version-omap5912osk-angstr=
om-linux-gnueabi.postinst)
NOTE: Staging package found but invalid for /oe/openembedded/recipes/angstr=
om/angstrom-version.bb
NOTE: Running task 1400 of 2472 (ID: 229=2C /oe/openembedded/recipes/angstr=
om/angstrom-version.bb=2C do_fetch)
NOTE: Running task 1401 of 2472 (ID: 230=2C /oe/openembedded/recipes/angstr=
om/angstrom-version.bb=2C do_unpack)
NOTE: Unpacking ../openembedded/recipes/angstrom/angstrom-version.bb to tmp=
/work/omap5912osk-angstrom-linux-gnueabi/angstrom-version-1_2009.X-test-200=
91221-r2/
NOTE: Running task 1568 of 2472 (ID: 231=2C /oe/openembedded/recipes/angstr=
om/angstrom-version.bb=2C do_patch)
NOTE: Running task 1569 of 2472 (ID: 232=2C /oe/openembedded/recipes/angstr=
om/angstrom-version.bb=2C do_configure)
NOTE: Running task 1674 of 2472 (ID: 233=2C /oe/openembedded/recipes/angstr=
om/angstrom-version.bb=2C do_qa_configure)
NOTE: Running task 1675 of 2472 (ID: 234=2C /oe/openembedded/recipes/angstr=
om/angstrom-version.bb=2C do_compile)
NOTE: Running task 1676 of 2472 (ID: 235=2C /oe/openembedded/recipes/angstr=
om/angstrom-version.bb=2C do_install)
NOTE: Running task 1695 of 2472 (ID: 238=2C /oe/openembedded/recipes/angstr=
om/angstrom-version.bb=2C do_package)
NOTE: Running task 2064 of 2472 (ID: 240=2C /oe/openembedded/recipes/angstr=
om/angstrom-version.bb=2C do_package_write_ipk)
Packaged contents of angstrom-version into /oe/build/tmp/deploy/glibc/ipk/o=
map5912osk/angstrom-version_2009.X-test-20091221-r2.5_omap5912osk.ipk
NOTE: Running task 2065 of 2472 (ID: 236=2C /oe/openembedded/recipes/angstr=
om/angstrom-version.bb=2C do_populate_staging)
NOTE: Running task 2433 of 2472 (ID: 237=2C /oe/openembedded/recipes/angstr=
om/angstrom-version.bb=2C do_package_write)
NOTE: Running task 2434 of 2472 (ID: 239=2C /oe/openembedded/recipes/angstr=
om/angstrom-version.bb=2C do_package_stage)
NOTE: Running task 2467 of 2472 (ID: 18=2C /oe/openembedded/recipes/images/=
console-image.bb=2C do_package_update_index_ipk)
NOTE: Running task 2471 of 2472 (ID: 10=2C /oe/openembedded/recipes/images/=
console-image.bb=2C do_rootfs)
NOTE: Running task 2472 of 2472 (ID: 0=2C /oe/openembedded/recipes/images/c=
onsole-image.bb=2C do_build)
NOTE: Tasks Summary: Attempted 2472 tasks of which 2456 didn't need to be r=
erun and 0 failed.
=20
Regards=20
Saleh Usman
=20
=20

 		 	   		 =20
_________________________________________________________________
Windows Live: Keep your friends up to date with what you do online.
http://www.microsoft.com/middleeast/windows/windowslive/see-it-in-action/so=
cial-network-basics.aspx?ocid=3DPID23461::T:WLMTAGL:ON:WL:en-xm:SI_SB_1:092=
010=

