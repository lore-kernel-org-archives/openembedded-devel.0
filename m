Received: from outbound-va3.frontbridge.com ([216.32.180.16]
	helo=VA3EHSOBE008.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Soumya.R@kpitcummins.com>) id 1ORjGb-0000nh-4m
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jun 2010 12:02:46 +0200
Received: from mail149-va3-R.bigfish.com (10.7.14.245) by
	VA3EHSOBE008.bigfish.com (10.7.40.28) with Microsoft SMTP Server id
	8.1.340.0; Thu, 24 Jun 2010 09:58:02 +0000
Received: from mail149-va3 (localhost.localdomain [127.0.0.1])	by
	mail149-va3-R.bigfish.com (Postfix) with ESMTP id DEB85F0033E	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jun 2010 09:58:02 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VPS-12(zz14ffO1443Nzz1202hzzz32i2a8h61h)
Received: from mail149-va3 (localhost.localdomain [127.0.0.1]) by mail149-va3
	(MessageSwitch) id 1277373480885932_31243;
	Thu, 24 Jun 2010 09:58:00 +0000 (UTC)
Received: from VA3EHSMHS032.bigfish.com (unknown [10.7.14.236])	by
	mail149-va3.bigfish.com (Postfix) with ESMTP id 3D9DF1AD00C3	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jun 2010 09:57:58 +0000 (UTC)
Received: from Kcinpunhjhc01.kpit.com (203.197.93.240) by
	VA3EHSMHS032.bigfish.com (10.7.99.42) with Microsoft SMTP Server (TLS)
	id 14.0.482.44; Thu, 24 Jun 2010 09:57:54 +0000
Received: from Kcinpunhjcms01.kpit.com ([169.254.1.87]) by
	Kcinpunhjhc01.kpit.com ([172.10.16.123]) with mapi;
	Thu, 24 Jun 2010 15:27:50 +0530
From: Soumya R <Soumya.R@kpitcummins.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 24 Jun 2010 15:27:49 +0530
Thread-Topic: Bitbake oe.patch.CmdError
Thread-Index: AQHLE4O0eZa69jrkwEmVMJSv5mnwKg==
Message-ID: <76E258664B189C4CBEF125491CA11ECC9445E0CFBF@KCINPUNHJCMS01.kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Reverse-DNS: Kcinpunhjhc01.kpit.com
X-SA-Exim-Connect-IP: 216.32.180.16
X-SA-Exim-Mail-From: Soumya.R@kpitcummins.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Bitbake oe.patch.CmdError
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
X-List-Received-Date: Thu, 24 Jun 2010 10:02:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,
   I have build a basic image for mipsel now i included qt4-embedded to my =
image.. Now when i run my image
i get the following error

ERROR: Printing the environment of the function
ERROR: Error in executing: /home/likewise-open/KPIT/soumyar/openembedded/re=
cipes/qt4/qt4-embedded_4.7.0-beta1.bb
ERROR: Exception:<class 'oe.patch.CmdError'> Message:Command Error: exit st=
atus: 1  Output:
Applying patch 0001-cross-compile.patch
patching file configure
Hunk #1 FAILED at 726.
Hunk #2 succeeded at 1443 (offset 300 lines).
Hunk #3 succeeded at 2921 (offset 513 lines).
1 out of 3 hunks FAILED -- rejects in file configure
Patch 0001-cross-compile.patch does not apply (enforce with -f)
ERROR: Printing the environment of the function
ERROR: Error in executing: /home/likewise-open/KPIT/soumyar/openembedded/re=
cipes/qt4/qt4-embedded_4.7.0-beta1.bb
ERROR: Exception:<class 'oe.patch.CmdError'> Message:Command Error: exit st=
atus: 1  Output:
Applying patch 0001-cross-compile.patch
patching file configure
Hunk #1 FAILED at 726.
Hunk #2 succeeded at 1443 (offset 300 lines).
Hunk #3 succeeded at 2921 (offset 513 lines).
1 out of 3 hunks FAILED -- rejects in file configure
Patch 0001-cross-compile.patch does not apply (enforce with -f)
ERROR: Printing the environment of the function
ERROR: Build of /home/likewise-open/KPIT/soumyar/openembedded/recipes/qt4/q=
t4-embedded_4.7.0-beta1.bb do_patch failed
Traceback (most recent call last):
  File "/usr/bin/bitbake", line 143, in <module>
    main()
  File "/usr/bin/bitbake", line 140, in main
    cooker.cook()
  File "/usr/lib/pymodules/python2.6/bb/cooker.py", line 639, in cook
    return self.buildTargets(pkgs_to_build)
  File "/usr/lib/pymodules/python2.6/bb/cooker.py", line 546, in buildTarge=
ts
    failures =3D rq.execute_runqueue()
  File "/usr/lib/pymodules/python2.6/bb/runqueue.py", line 840, in execute_=
runqueue
    self.execute_runqueue_internal()
  File "/usr/lib/pymodules/python2.6/bb/runqueue.py", line 949, in execute_=
runqueue_internal
    self.cooker.tryBuild(fn)
  File "/usr/lib/pymodules/python2.6/bb/cooker.py", line 135, in tryBuild
    return self.tryBuildPackage(fn, item, self.configuration.cmd, the_data)=

  File "/usr/lib/pymodules/python2.6/bb/cooker.py", line 109, in tryBuildPa=
ckage
    bb.build.exec_task('do_%s' % task, the_data)
  File "/usr/lib/pymodules/python2.6/bb/build.py", line 283, in exec_task
    exec_func(task, localdata)
  File "/usr/lib/pymodules/python2.6/bb/build.py", line 120, in exec_func
    exec_func_python(func, d)
  File "/usr/lib/pymodules/python2.6/bb/build.py", line 141, in exec_func_p=
ython
    utils.better_exec(comp, g, tmp, bbfile)
  File "/usr/lib/pymodules/python2.6/bb/utils.py", line 185, in better_exec=

    exec code in context
  File "do_patch", line 4, in <module>
  File "do_patch", line 2, in do_patch
  File "/usr/lib/pymodules/python2.6/bb/build.py", line 120, in exec_func
    exec_func_python(func, d)
  File "/usr/lib/pymodules/python2.6/bb/build.py", line 141, in exec_func_p=
ython
    utils.better_exec(comp, g, tmp, bbfile)
  File "/usr/lib/pymodules/python2.6/bb/utils.py", line 185, in better_exec=

    exec code in context
  File "base_do_patch", line 4, in <module>
  File "base_do_patch", line 2, in base_do_patch
  File "/usr/lib/pymodules/python2.6/bb/build.py", line 120, in exec_func
    exec_func_python(func, d)
  File "/usr/lib/pymodules/python2.6/bb/build.py", line 141, in exec_func_p=
ython
    utils.better_exec(comp, g, tmp, bbfile)
  File "/usr/lib/pymodules/python2.6/bb/utils.py", line 185, in better_exec=

    exec code in context
  File "patch_do_patch", line 110, in <module>
  File "patch_do_patch", line 108, in patch_do_patch
  File "/home/likewise-open/KPIT/soumyar/openembedded/lib/oe/patch.py", lin=
e 334, in Resolve
    raise sys.exc_value
oe.patch.CmdError: Command Error: exit status: 1  Output:
Applying patch 0001-cross-compile.patch
patching file configure
Hunk #1 FAILED at 726.
Hunk #2 succeeded at 1443 (offset 300 lines).
Hunk #3 succeeded at 2921 (offset 513 lines).
1 out of 3 hunks FAILED -- rejects in file configure
Patch 0001-cross-compile.patch does not apply (enforce with -f)
ERROR: Task 162 (/home/likewise-open/KPIT/soumyar/openembedded/recipes/qt4/=
qt4-embedded_4.7.0-beta1.bb, do_patch) failed
NOTE: Waiting for 3 active tasks to finish
NOTE: 1: /home/likewise-open/KPIT/soumyar/openembedded/recipes/gettext/gett=
ext_0.17.bb, do_install (32756)
NOTE: 2: /home/likewise-open/KPIT/soumyar/openembedded/recipes/qt4/qt4-tool=
s-native_4.7.0-beta1.bb, do_install (32757)
NOTE: 3: /home/likewise-open/KPIT/soumyar/openembedded/recipes/sysvinit/sys=
vinit_2.86.bb, do_install (32759)
NOTE: Waiting for 2 active tasks to finish
NOTE: 1: /home/likewise-open/KPIT/soumyar/openembedded/recipes/gettext/gett=
ext_0.17.bb, do_install (32756)
NOTE: 2: /home/likewise-open/KPIT/soumyar/openembedded/recipes/qt4/qt4-tool=
s-native_4.7.0-beta1.bb, do_install (32757)
NOTE: Waiting for 1 active tasks to finish
NOTE: 1: /home/likewise-open/KPIT/soumyar/openembedded/recipes/gettext/gett=
ext_0.17.bb, do_install (32756)
NOTE: Tasks Summary: Attempted 674 tasks of which 674 didn't need to be rer=
un and 1 failed.
ERROR: '/home/likewise-open/KPIT/soumyar/openembedded/recipes/qt4/qt4-embed=
ded_4.7.0-beta1.bb' failed

    Anybody can help me out to resolve this please..

Thanks in advance :-)

Regards,
Soumya
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Cummins Infosystems Ltd. It is intended only =
for the person to whom it is addressed. If you are not the intended recipie=
nt, you are not authorized to read, print, retain copy, disseminate, distri=
bute, or use this message or any part thereof. If you receive this message =
in error, please notify the sender immediately and delete all copies of thi=
s message. KPIT Cummins Infosystems Ltd. does not accept any liability for =
virus infected mails.




