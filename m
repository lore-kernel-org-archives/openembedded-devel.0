Received: from mail-dotnet1.eads.net ([80.156.45.103])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@eads.com>)
	id 1OfujH-00032v-DB for openembedded-devel@lists.openembedded.org;
	Mon, 02 Aug 2010 15:07:40 +0200
Received: from unknown (HELO de-gate2.mailhub.intra.corp) ([53.154.243.34])
	by mail-dotnet1.eads.net with ESMTP; 02 Aug 2010 14:56:14 +0200
Received: from gateinet0.mail.ds.corp ([149.207.23.240]) by
	de-gate2.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.7381); 
	Mon, 2 Aug 2010 15:06:18 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet0.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Mon, 2 Aug 2010 15:06:18 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Mon, 2 Aug 2010 15:06:16 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5ADD@deimsg40.de.net.world>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: Problems building gdb-cross-sdk
Thread-Index: AcsyQ327qZlxZTrjSk2JIyV6+Te4Yg==
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@eads.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 02 Aug 2010 13:06:18.0350 (UTC)
	FILETIME=[7EE7A8E0:01CB3243]
X-SA-Exim-Connect-IP: 80.156.45.103
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@eads.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Problems building gdb-cross-sdk
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
X-List-Received-Date: Mon, 02 Aug 2010 13:11:02 -0000
X-List-Received-Date: Mon, 02 Aug 2010 13:11:02 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I am running in strange problems while building gdb-cross-sdk.

If I run bitbake gdb-cross-sdk on exactly the same overlay/openembedded
environment on different virtual machines, I succeed on my test
VM, using my production VM I get the following error: =20

>>>>
DEBUG: Legacy staging mode for
/angstrom/bsp_arm/openembedded/recipes/gdb/gdb-cross-sdk_7.1.bb
DEBUG: update_data()
DEBUG: update_data()
DEBUG: Executing task do_populate_sysroot
DEBUG: update_data()
DEBUG: mkdirhier(/angstrom/temp/angstrom-omap3evm/pstage)
DEBUG:
mkdirhier(/angstrom/temp/angstrom-omap3evm/sysroots/armv7a-angstrom-linu
x-gnueabi//usr/local/angstrom/arm/bin)
DEBUG:
mkdirhier(/angstrom/temp/angstrom-omap3evm/sysroots/armv7a-angstrom-linu
x-gnueabi//usr/local/angstrom/arm/lib)
DEBUG:
mkdirhier(/angstrom/temp/angstrom-omap3evm/sysroots/armv7a-angstrom-linu
x-gnueabi//usr/local/angstrom/arm/include)
DEBUG:
mkdirhier(/angstrom/temp/angstrom-omap3evm/sysroots/i686-linux/usr/bin)
DEBUG:
mkdirhier(/angstrom/temp/angstrom-omap3evm/sysroots/i686-linux/usr/lib)
DEBUG:
mkdirhier(/angstrom/temp/angstrom-omap3evm/sysroots/i686-linux/usr/inclu
de)
DEBUG:
mkdirhier(/angstrom/temp/angstrom-omap3evm/sysroots/i686-linux-sdk/usr/l
ocal/angstrom/arm/share)
DEBUG:
mkdirhier(/angstrom/temp/angstrom-omap3evm/work/i686-armv7a-sdk-angstrom
-linux-gnueabi/gdb-cross-sdk-7.1-r6.0/gdb-7.1)
DEBUG:
mkdirhier(/angstrom/temp/angstrom-omap3evm/work/i686-armv7a-sdk-angstrom
-linux-gnueabi/gdb-cross-sdk-7.1-r6.0/build-arm-angstrom-linux-gnueabi)
NOTE: Legacy staging mode for
/angstrom/bsp_arm/openembedded/recipes/gdb/gdb-cross-sdk_7.1.bb
DEBUG:
mkdirhier(/angstrom/temp/angstrom-omap3evm/work/i686-armv7a-sdk-angstrom
-linux-gnueabi/gdb-cross-sdk-7.1-r6.0/temp)
DEBUG:
mkdirhier(/angstrom/temp/angstrom-omap3evm/work/i686-armv7a-sdk-angstrom
-linux-gnueabi/gdb-cross-sdk-7.1-r6.0/temp)ERROR: Error in executing:
/angstrom/bsp_arm/openembedded/recipes/gdb/gdb-cross-sdk_7.1.bb
ERROR: Exception:<type 'exceptions.OSError'> Message:[Errno 1] Operation
not permitted:
'//usr/local/angstrom/arm/bin/arm-angstrom-linux-gnueabi-nm'
ERROR: Printing the environment of the function
ERROR: Error in executing:
/angstrom/bsp_arm/openembedded/recipes/gdb/gdb-cross-sdk_7.1.bb
ERROR: Exception:<type 'exceptions.OSError'> Message:[Errno 1] Operation
not permitted:
'//usr/local/angstrom/arm/bin/arm-angstrom-linux-gnueabi-nm'
ERROR: Printing the environment of the function
ERROR: 	0029:        bb.build.exec_func('do_stage', d)
ERROR: 	0030:        for f in
(bb.data.getVar('SYSROOT_PREPROCESS_FUNCS', d, True) or '').split():
ERROR: 	0031:            bb.build.exec_func(f, d)
ERROR: 	0032:        bb.build.exec_func('populate_sysroot_posthook', d)
ERROR: 	0033:        bb.utils.unlockfile(lock)
ERROR: 	0034:    else:
ERROR: 	0035:        dest =3D bb.data.getVar('D', d, True)
ERROR: 	0036:        sysrootdest =3D
bb.data.expand('${SYSROOT_DESTDIR}${STAGING_DIR_TARGET}', d)
ERROR: 	0037:        bb.mkdirhier(sysrootdest)
ERROR: Build of
/angstrom/bsp_arm/openembedded/recipes/gdb/gdb-cross-sdk_7.1.bb
do_populate_sysroot failed
Traceback (most recent call last):
  File "/angstrom/bsp_arm/bitbake/bin/bitbake", line 143, in <module>
    main()
  File "/angstrom/bsp_arm/bitbake/bin/bitbake", line 140, in main
    cooker.cook()
  File "/angstrom/bsp_arm/bitbake/lib/bb/cooker.py", line 640, in cook
    return self.buildTargets(pkgs_to_build)
  File "/angstrom/bsp_arm/bitbake/lib/bb/cooker.py", line 547, in
buildTargets
    failures =3D rq.execute_runqueue()
  File "/angstrom/bsp_arm/bitbake/lib/bb/runqueue.py", line 841, in
execute_runqueue
    self.execute_runqueue_internal()
  File "/angstrom/bsp_arm/bitbake/lib/bb/runqueue.py", line 950, in
execute_runqueue_internal
    self.cooker.tryBuild(fn)
  File "/angstrom/bsp_arm/bitbake/lib/bb/cooker.py", line 136, in
tryBuild
    return self.tryBuildPackage(fn, item, self.configuration.cmd,
the_data)
  File "/angstrom/bsp_arm/bitbake/lib/bb/cooker.py", line 110, in
tryBuildPackage
    bb.build.exec_task('do_%s' % task, the_data)
  File "/angstrom/bsp_arm/bitbake/lib/bb/build.py", line 283, in
exec_task
    exec_func(task, localdata)
  File "/angstrom/bsp_arm/bitbake/lib/bb/build.py", line 120, in
exec_func
    exec_func_python(func, d)
  File "/angstrom/bsp_arm/bitbake/lib/bb/build.py", line 141, in
exec_func_python
    utils.better_exec(comp, g, tmp, bbfile)
  File "/angstrom/bsp_arm/bitbake/lib/bb/utils.py", line 185, in
better_exec
    exec code in context
  File "do_populate_sysroot", line 49, in <module>
  File "do_populate_sysroot", line 31, in do_populate_sysroot
  File "/angstrom/bsp_arm/bitbake/lib/bb/build.py", line 120, in
exec_func
    exec_func_python(func, d)
  File "/angstrom/bsp_arm/bitbake/lib/bb/build.py", line 141, in
exec_func_python
    utils.better_exec(comp, g, tmp, bbfile)
  File "/angstrom/bsp_arm/bitbake/lib/bb/utils.py", line 185, in
better_exec
    exec code in context
  File "relocatable_binaries_preprocess", line 4, in <module>
  File "relocatable_binaries_preprocess", line 2, in
relocatable_binaries_preprocess
  File "<bb>", line 7, in rpath_replace
  File "<bb>", line 33, in process_dir
OSError: [Errno 1] Operation not permitted:
'//usr/local/angstrom/arm/bin/arm-angstrom-linux-gnueabi-nm'
<<<<<

the production VM is drived from the test VM, so the used environment is
mostly the same.

The python routine obviously loose or mangle the ${SYSROOT_DESTDIR} and
${STAGING_DIR_TARGET} Variable, but I can't figure out why.

Instead of '//usr/local/angstrom/arm/bin/arm-angstrom-linux-gnueabi-nm'
it should be something  like
'/angstrom/temp/angstrom-omap3evm/work/i686-armv7a-sdk-angstrom-linux-gn
ueabi/gdb-cross-sdk-7.1-r6.0/temp' I suppose.

Has someone an idea what's going on ?

Regards
Wolfgang Hauser


