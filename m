Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <david.oe@pilsoft.com>) id 1O5pOP-0006qP-6s
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Apr 2010 02:08:14 +0200
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 19C63D1A070
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Apr 2010 01:54:53 +0200 (CEST)
Received: from smtp3-g21.free.fr (localhost [127.0.0.1])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 63D04818079
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Apr 2010 01:54:48 +0200 (CEST)
Received: from mail.pilsoft.com (mna75-2-82-67-197-228.fbx.proxad.net
	[82.67.197.228])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 32E8D818075
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Apr 2010 01:54:46 +0200 (CEST)
Received: from [192.168.33.16] ([192.168.33.1]) BY mail.pilsoft.com
	([192.168.33.30])
	WITH ESMTP (4D WebSTAR V Mail (5.4.1)); Sun, 25 Apr 2010 01:54:44 +0200
Mime-Version: 1.0 (Apple Message framework v1078)
From: David Hemmo <david.oe@pilsoft.com>
In-Reply-To: <l2qb6ebd0a51004240953le39e4f63r6731102e305b4dff@mail.gmail.com>
Date: Sun, 25 Apr 2010 01:54:45 +0200
Message-Id: <BDAEFC63-65E4-4CA0-8CFC-A5515C830CDC@pilsoft.com>
References: <D09DC8C0-929F-4983-AB79-490641D85D3C@pilsoft.com>
	<l2qb6ebd0a51004240953le39e4f63r6731102e305b4dff@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1078)
X-SA-Exim-Connect-IP: 212.27.42.10
X-SA-Exim-Mail-From: david.oe@pilsoft.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,UNPARSEABLE_RELAY
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: problem with modifications to base.bbclass
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
X-List-Received-Date: Sun, 25 Apr 2010 00:08:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Thank you Chris, things are going further.=20

Unfortunately something else must be different. I have an error with the =
libpam-base-files.bb recipe
As the base_do_unpack function is in the stack crawl, I guess it is =
related=20

Here is the error I get

NOTE: Unpacking recipes/pam/libpam-base-files/pam.d/*
ERROR: Error in executing: =
/home/owner/dvt/oe/oe_shogo2test/recipes/pam/libpam-base-files.bb
ERROR: Exception:<type 'exceptions.IOError'> Message:[Errno 2] No such =
file or directory: =
'/home/owner/dvt/oe/oe_shogo2test/recipes/pam/libpam-base-files/./pam.d/*'=

ERROR: Printing the environment of the function
ERROR: Error in executing: =
/home/owner/dvt/oe/oe_shogo2test/recipes/pam/libpam-base-files.bb
ERROR: Exception:<type 'exceptions.IOError'> Message:[Errno 2] No such =
file or directory: =
'/home/owner/dvt/oe/oe_shogo2test/recipes/pam/libpam-base-files/./pam.d/*'=

ERROR: Printing the environment of the function
ERROR: Build of =
/home/owner/dvt/oe/oe_shogo2test/recipes/pam/libpam-base-files.bb =
do_unpack failed
Traceback (most recent call last):
  File "/home/owner/dvt/oe/bitbake/bin/bitbake", line 143, in <module>
    main()
  File "/home/owner/dvt/oe/bitbake/bin/bitbake", line 140, in main
    cooker.cook()
  File "/home/owner/dvt/oe/bitbake/lib/bb/cooker.py", line 640, in cook
    return self.buildTargets(pkgs_to_build)
  File "/home/owner/dvt/oe/bitbake/lib/bb/cooker.py", line 547, in =
buildTargets
    failures =3D rq.execute_runqueue()
  File "/home/owner/dvt/oe/bitbake/lib/bb/runqueue.py", line 841, in =
execute_runqueue
    self.execute_runqueue_internal()
  File "/home/owner/dvt/oe/bitbake/lib/bb/runqueue.py", line 950, in =
execute_runqueue_internal
    self.cooker.tryBuild(fn)
  File "/home/owner/dvt/oe/bitbake/lib/bb/cooker.py", line 136, in =
tryBuild
    return self.tryBuildPackage(fn, item, self.configuration.cmd, =
the_data)
  File "/home/owner/dvt/oe/bitbake/lib/bb/cooker.py", line 110, in =
tryBuildPackage
    bb.build.exec_task('do_%s' % task, the_data)
  File "/home/owner/dvt/oe/bitbake/lib/bb/build.py", line 283, in =
exec_task
    exec_func(task, localdata)
  File "/home/owner/dvt/oe/bitbake/lib/bb/build.py", line 120, in =
exec_func
    exec_func_python(func, d)
  File "/home/owner/dvt/oe/bitbake/lib/bb/build.py", line 141, in =
exec_func_python
    utils.better_exec(comp, g, tmp, bbfile)
  File "/home/owner/dvt/oe/bitbake/lib/bb/utils.py", line 185, in =
better_exec
    exec code in context
  File "do_unpack", line 4, in <module>
  File "do_unpack", line 2, in do_unpack
  File "/home/owner/dvt/oe/bitbake/lib/bb/build.py", line 120, in =
exec_func
    exec_func_python(func, d)
  File "/home/owner/dvt/oe/bitbake/lib/bb/build.py", line 141, in =
exec_func_python
    utils.better_exec(comp, g, tmp, bbfile)
  File "/home/owner/dvt/oe/bitbake/lib/bb/utils.py", line 185, in =
better_exec
    exec code in context
  File "base_do_unpack", line 36, in <module>
  File "base_do_unpack", line 34, in base_do_unpack
  File "<bb>", line 37, in oe_unpack_file
  File "/usr/lib64/python2.6/shutil.py", line 99, in copy2
    copyfile(src, dst)
  File "/usr/lib64/python2.6/shutil.py", line 52, in copyfile
    fsrc =3D open(src, 'rb')
IOError: [Errno 2] No such file or directory: =
'/home/owner/dvt/oe/oe_shogo2test/recipes/pam/libpam-base-files/./pam.d/*'=

ERROR: Task 0 =
(/home/owner/dvt/oe/oe_shogo2test/recipes/pam/libpam-base-files.bb, =
do_unpack) failed

I hope you will be again able to help

Thanks,

David Hemmo

On Apr 24, 2010, at 6:53 PM, Chris Larson wrote:

> Fixed.  Sorry about that.
>=20
> On Sat, Apr 24, 2010 at 2:25 AM, David Hemmo <david.oe@pilsoft.com> =
wrote:
>=20
>> Hello,
>>=20
>> I am trying to build an image and I run in a python error that seems =
to be
>> caused by the latest modifications to base.bbclase
>>=20
>> ERROR: Error in executing:
>> /home/owner/dvt/oe/oe_shogo2test/recipes/stage-manager/
>> stagemanager-native_0.0.1.bb
>> ERROR: Exception:<type 'exceptions.TypeError'> =
Message:oe_unpack_file() got
>> an unexpected keyword argument 'env'
>> ERROR: Printing the environment of the function
>> ERROR:  0030:                   destdir =3D os.path.join(workdir, =
*subdirs)
>> ERROR:  0031:                   bb.mkdirhier(destdir)
>> ERROR:  0032:           else:
>> ERROR:  0033:                   destdir =3D workdir
>> ERROR:  0034:           oe_unpack_file(local, destdir, env=3Denv,
>> **urldata.parm)
>> ERROR:  0035:
>> ERROR: Error in executing:
>> /home/owner/dvt/oe/oe_shogo2test/recipes/stage-manager/
>> stagemanager-native_0.0.1.bb
>> ERROR: Exception:<type 'exceptions.TypeError'> =
Message:oe_unpack_file() got
>> an unexpected keyword argument 'env'
>> ERROR: Printing the environment of the function
>> ERROR: Build of =
/home/owner/dvt/oe/oe_shogo2test/recipes/stage-manager/
>> stagemanager-native_0.0.1.bb do_unpack failed
>>=20
>> it seems the parameters sent to oe_unpack_file are not what the =
function
>> faits for
>>=20
>> def oe_unpack_file(file, data, url =3D None):
>>=20
>> I am too new to this project to propose a patch, but I hope someone =
will be
>> able to help
>>=20
>> Thanks
>>=20
>> David Hemmo
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> =
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>=20
>=20
>=20
>=20
> --=20
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20



