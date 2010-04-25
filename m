Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O5zrL-0001vW-IR for openembedded-devel@lists.openembedded.org;
	Sun, 25 Apr 2010 13:19:02 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O5znj-0001rB-V4 for openembedded-devel@lists.openembedded.org;
	Sun, 25 Apr 2010 13:15:03 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Apr 2010 13:15:03 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Apr 2010 13:15:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 25 Apr 2010 13:13:59 +0200
Message-ID: <hr185n$pcr$2@dough.gmane.org>
References: <D09DC8C0-929F-4983-AB79-490641D85D3C@pilsoft.com>	<l2qb6ebd0a51004240953le39e4f63r6731102e305b4dff@mail.gmail.com>
	<BDAEFC63-65E4-4CA0-8CFC-A5515C830CDC@pilsoft.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100412 Shredder/3.0.5pre
In-Reply-To: <BDAEFC63-65E4-4CA0-8CFC-A5515C830CDC@pilsoft.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
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
X-List-Received-Date: Sun, 25 Apr 2010 11:19:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I was about to send a mail saying "it looks better, but
libpam-base-files fails", but you hit the error sooner than me :)

regards,

Koen

On 25-04-10 01:54, David Hemmo wrote:
> Thank you Chris, things are going further. 
> 
> Unfortunately something else must be different. I have an error with the libpam-base-files.bb recipe
> As the base_do_unpack function is in the stack crawl, I guess it is related 
> 
> Here is the error I get
> 
> NOTE: Unpacking recipes/pam/libpam-base-files/pam.d/*
> ERROR: Error in executing: /home/owner/dvt/oe/oe_shogo2test/recipes/pam/libpam-base-files.bb
> ERROR: Exception:<type 'exceptions.IOError'> Message:[Errno 2] No such file or directory: '/home/owner/dvt/oe/oe_shogo2test/recipes/pam/libpam-base-files/./pam.d/*'
> ERROR: Printing the environment of the function
> ERROR: Error in executing: /home/owner/dvt/oe/oe_shogo2test/recipes/pam/libpam-base-files.bb
> ERROR: Exception:<type 'exceptions.IOError'> Message:[Errno 2] No such file or directory: '/home/owner/dvt/oe/oe_shogo2test/recipes/pam/libpam-base-files/./pam.d/*'
> ERROR: Printing the environment of the function
> ERROR: Build of /home/owner/dvt/oe/oe_shogo2test/recipes/pam/libpam-base-files.bb do_unpack failed
> Traceback (most recent call last):
>   File "/home/owner/dvt/oe/bitbake/bin/bitbake", line 143, in <module>
>     main()
>   File "/home/owner/dvt/oe/bitbake/bin/bitbake", line 140, in main
>     cooker.cook()
>   File "/home/owner/dvt/oe/bitbake/lib/bb/cooker.py", line 640, in cook
>     return self.buildTargets(pkgs_to_build)
>   File "/home/owner/dvt/oe/bitbake/lib/bb/cooker.py", line 547, in buildTargets
>     failures = rq.execute_runqueue()
>   File "/home/owner/dvt/oe/bitbake/lib/bb/runqueue.py", line 841, in execute_runqueue
>     self.execute_runqueue_internal()
>   File "/home/owner/dvt/oe/bitbake/lib/bb/runqueue.py", line 950, in execute_runqueue_internal
>     self.cooker.tryBuild(fn)
>   File "/home/owner/dvt/oe/bitbake/lib/bb/cooker.py", line 136, in tryBuild
>     return self.tryBuildPackage(fn, item, self.configuration.cmd, the_data)
>   File "/home/owner/dvt/oe/bitbake/lib/bb/cooker.py", line 110, in tryBuildPackage
>     bb.build.exec_task('do_%s' % task, the_data)
>   File "/home/owner/dvt/oe/bitbake/lib/bb/build.py", line 283, in exec_task
>     exec_func(task, localdata)
>   File "/home/owner/dvt/oe/bitbake/lib/bb/build.py", line 120, in exec_func
>     exec_func_python(func, d)
>   File "/home/owner/dvt/oe/bitbake/lib/bb/build.py", line 141, in exec_func_python
>     utils.better_exec(comp, g, tmp, bbfile)
>   File "/home/owner/dvt/oe/bitbake/lib/bb/utils.py", line 185, in better_exec
>     exec code in context
>   File "do_unpack", line 4, in <module>
>   File "do_unpack", line 2, in do_unpack
>   File "/home/owner/dvt/oe/bitbake/lib/bb/build.py", line 120, in exec_func
>     exec_func_python(func, d)
>   File "/home/owner/dvt/oe/bitbake/lib/bb/build.py", line 141, in exec_func_python
>     utils.better_exec(comp, g, tmp, bbfile)
>   File "/home/owner/dvt/oe/bitbake/lib/bb/utils.py", line 185, in better_exec
>     exec code in context
>   File "base_do_unpack", line 36, in <module>
>   File "base_do_unpack", line 34, in base_do_unpack
>   File "<bb>", line 37, in oe_unpack_file
>   File "/usr/lib64/python2.6/shutil.py", line 99, in copy2
>     copyfile(src, dst)
>   File "/usr/lib64/python2.6/shutil.py", line 52, in copyfile
>     fsrc = open(src, 'rb')
> IOError: [Errno 2] No such file or directory: '/home/owner/dvt/oe/oe_shogo2test/recipes/pam/libpam-base-files/./pam.d/*'
> ERROR: Task 0 (/home/owner/dvt/oe/oe_shogo2test/recipes/pam/libpam-base-files.bb, do_unpack) failed
> 
> I hope you will be again able to help
> 
> Thanks,
> 
> David Hemmo
> 
> On Apr 24, 2010, at 6:53 PM, Chris Larson wrote:
> 
>> Fixed.  Sorry about that.
>>
>> On Sat, Apr 24, 2010 at 2:25 AM, David Hemmo <david.oe@pilsoft.com> wrote:
>>
>>> Hello,
>>>
>>> I am trying to build an image and I run in a python error that seems to be
>>> caused by the latest modifications to base.bbclase
>>>
>>> ERROR: Error in executing:
>>> /home/owner/dvt/oe/oe_shogo2test/recipes/stage-manager/
>>> stagemanager-native_0.0.1.bb
>>> ERROR: Exception:<type 'exceptions.TypeError'> Message:oe_unpack_file() got
>>> an unexpected keyword argument 'env'
>>> ERROR: Printing the environment of the function
>>> ERROR:  0030:                   destdir = os.path.join(workdir, *subdirs)
>>> ERROR:  0031:                   bb.mkdirhier(destdir)
>>> ERROR:  0032:           else:
>>> ERROR:  0033:                   destdir = workdir
>>> ERROR:  0034:           oe_unpack_file(local, destdir, env=env,
>>> **urldata.parm)
>>> ERROR:  0035:
>>> ERROR: Error in executing:
>>> /home/owner/dvt/oe/oe_shogo2test/recipes/stage-manager/
>>> stagemanager-native_0.0.1.bb
>>> ERROR: Exception:<type 'exceptions.TypeError'> Message:oe_unpack_file() got
>>> an unexpected keyword argument 'env'
>>> ERROR: Printing the environment of the function
>>> ERROR: Build of /home/owner/dvt/oe/oe_shogo2test/recipes/stage-manager/
>>> stagemanager-native_0.0.1.bb do_unpack failed
>>>
>>> it seems the parameters sent to oe_unpack_file are not what the function
>>> faits for
>>>
>>> def oe_unpack_file(file, data, url = None):
>>>
>>> I am too new to this project to propose a patch, but I hope someone will be
>>> able to help
>>>
>>> Thanks
>>>
>>> David Hemmo
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>
>>
>>
>> -- 
>> Christopher Larson
>> clarson at kergoth dot com
>> Founder - BitBake, OpenEmbedded, OpenZaurus
>> Maintainer - Tslib
>> Senior Software Engineer, Mentor Graphics
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL1CP3MkyGM64RGpERAiHGAKCyVd08geY3Q4pELev0JiHLBfArQgCcDCXV
1KJWZR7Agp7DOJtecLECVOw=
=ZgsL
-----END PGP SIGNATURE-----



