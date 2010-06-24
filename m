Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1ORoK4-0001R2-04
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jun 2010 17:30:33 +0200
Received: by pxi2 with SMTP id 2so1016807pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jun 2010 08:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=RmGud9esXB1xlW3ie8usIySvqDPjTUQ6gd1AEzZEQ1I=;
	b=HBXQk5Xwe07/KLOEW0lVCeQJndFbJnfI5MLYxqVEAFIloBQ07J+ccYUk71d4IdWr1e
	1Fjf97Jqa/WQOFvJLNP0oINWkDm4iVZ/Bqny132vmISS5DHCBexEsuOerjI+SjNehj6c
	3TPT8bA/+eWpU3zTCSpx5roOy6aezmuPGTWdA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=iqFEvPiqJqVVIPBKex+hgmVWxcirWa7/nWm8CbTv1EYpmS8VM6YW4S2iKaSUSJUHN6
	sjKz5nQ9i185o80vTmyqxxQUN3xd+7EXBYb3px8z6eZ+Fq7xg+6Zc4qoG9nnlabmdWot
	jH0aYqaZ97twZqy/MGcEpArsUw3OLKVIN5TGY=
Received: by 10.143.24.41 with SMTP id b41mr9150248wfj.48.1277392917776;
	Thu, 24 Jun 2010 08:21:57 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id i19sm5836521rvn.11.2010.06.24.08.21.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 24 Jun 2010 08:21:56 -0700 (PDT)
Date: Thu, 24 Jun 2010 08:23:05 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100624152305.GG28292@gmail.com>
References: <76E258664B189C4CBEF125491CA11ECC9445E0CFBF@KCINPUNHJCMS01.kpit.com>
MIME-Version: 1.0
In-Reply-To: <76E258664B189C4CBEF125491CA11ECC9445E0CFBF@KCINPUNHJCMS01.kpit.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Bitbake oe.patch.CmdError
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
X-List-Received-Date: Thu, 24 Jun 2010 15:35:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (24/06/10 15:27), Soumya R wrote:
> Hi All,
>    I have build a basic image for mipsel now i included qt4-embedded to my image.. Now when i run my image
> i get the following error
> 
> ERROR: Printing the environment of the function
> ERROR: Error in executing: /home/likewise-open/KPIT/soumyar/openembedded/recipes/qt4/qt4-embedded_4.7.0-beta1.bb
> ERROR: Exception:<class 'oe.patch.CmdError'> Message:Command Error: exit status: 1  Output:
> Applying patch 0001-cross-compile.patch
> patching file configure
> Hunk #1 FAILED at 726.
> Hunk #2 succeeded at 1443 (offset 300 lines).
> Hunk #3 succeeded at 2921 (offset 513 lines).
> 1 out of 3 hunks FAILED -- rejects in file configure
> Patch 0001-cross-compile.patch does not apply (enforce with -f)

this is the error. Go into the build tree and try to redo this patch

> ERROR: Printing the environment of the function
> ERROR: Error in executing: /home/likewise-open/KPIT/soumyar/openembedded/recipes/qt4/qt4-embedded_4.7.0-beta1.bb
> ERROR: Exception:<class 'oe.patch.CmdError'> Message:Command Error: exit status: 1  Output:
> Applying patch 0001-cross-compile.patch
> patching file configure
> Hunk #1 FAILED at 726.
> Hunk #2 succeeded at 1443 (offset 300 lines).
> Hunk #3 succeeded at 2921 (offset 513 lines).
> 1 out of 3 hunks FAILED -- rejects in file configure
> Patch 0001-cross-compile.patch does not apply (enforce with -f)
> ERROR: Printing the environment of the function
> ERROR: Build of /home/likewise-open/KPIT/soumyar/openembedded/recipes/qt4/qt4-embedded_4.7.0-beta1.bb do_patch failed
> Traceback (most recent call last):
>   File "/usr/bin/bitbake", line 143, in <module>
>     main()
>   File "/usr/bin/bitbake", line 140, in main
>     cooker.cook()
>   File "/usr/lib/pymodules/python2.6/bb/cooker.py", line 639, in cook
>     return self.buildTargets(pkgs_to_build)
>   File "/usr/lib/pymodules/python2.6/bb/cooker.py", line 546, in buildTargets
>     failures = rq.execute_runqueue()
>   File "/usr/lib/pymodules/python2.6/bb/runqueue.py", line 840, in execute_runqueue
>     self.execute_runqueue_internal()
>   File "/usr/lib/pymodules/python2.6/bb/runqueue.py", line 949, in execute_runqueue_internal
>     self.cooker.tryBuild(fn)
>   File "/usr/lib/pymodules/python2.6/bb/cooker.py", line 135, in tryBuild
>     return self.tryBuildPackage(fn, item, self.configuration.cmd, the_data)
>   File "/usr/lib/pymodules/python2.6/bb/cooker.py", line 109, in tryBuildPackage
>     bb.build.exec_task('do_%s' % task, the_data)
>   File "/usr/lib/pymodules/python2.6/bb/build.py", line 283, in exec_task
>     exec_func(task, localdata)
>   File "/usr/lib/pymodules/python2.6/bb/build.py", line 120, in exec_func
>     exec_func_python(func, d)
>   File "/usr/lib/pymodules/python2.6/bb/build.py", line 141, in exec_func_python
>     utils.better_exec(comp, g, tmp, bbfile)
>   File "/usr/lib/pymodules/python2.6/bb/utils.py", line 185, in better_exec
>     exec code in context
>   File "do_patch", line 4, in <module>
>   File "do_patch", line 2, in do_patch
>   File "/usr/lib/pymodules/python2.6/bb/build.py", line 120, in exec_func
>     exec_func_python(func, d)
>   File "/usr/lib/pymodules/python2.6/bb/build.py", line 141, in exec_func_python
>     utils.better_exec(comp, g, tmp, bbfile)
>   File "/usr/lib/pymodules/python2.6/bb/utils.py", line 185, in better_exec
>     exec code in context
>   File "base_do_patch", line 4, in <module>
>   File "base_do_patch", line 2, in base_do_patch
>   File "/usr/lib/pymodules/python2.6/bb/build.py", line 120, in exec_func
>     exec_func_python(func, d)
>   File "/usr/lib/pymodules/python2.6/bb/build.py", line 141, in exec_func_python
>     utils.better_exec(comp, g, tmp, bbfile)
>   File "/usr/lib/pymodules/python2.6/bb/utils.py", line 185, in better_exec
>     exec code in context
>   File "patch_do_patch", line 110, in <module>
>   File "patch_do_patch", line 108, in patch_do_patch
>   File "/home/likewise-open/KPIT/soumyar/openembedded/lib/oe/patch.py", line 334, in Resolve
>     raise sys.exc_value
> oe.patch.CmdError: Command Error: exit status: 1  Output:
> Applying patch 0001-cross-compile.patch
> patching file configure
> Hunk #1 FAILED at 726.
> Hunk #2 succeeded at 1443 (offset 300 lines).
> Hunk #3 succeeded at 2921 (offset 513 lines).
> 1 out of 3 hunks FAILED -- rejects in file configure
> Patch 0001-cross-compile.patch does not apply (enforce with -f)
> ERROR: Task 162 (/home/likewise-open/KPIT/soumyar/openembedded/recipes/qt4/qt4-embedded_4.7.0-beta1.bb, do_patch) failed
> NOTE: Waiting for 3 active tasks to finish
> NOTE: 1: /home/likewise-open/KPIT/soumyar/openembedded/recipes/gettext/gettext_0.17.bb, do_install (32756)
> NOTE: 2: /home/likewise-open/KPIT/soumyar/openembedded/recipes/qt4/qt4-tools-native_4.7.0-beta1.bb, do_install (32757)
> NOTE: 3: /home/likewise-open/KPIT/soumyar/openembedded/recipes/sysvinit/sysvinit_2.86.bb, do_install (32759)
> NOTE: Waiting for 2 active tasks to finish
> NOTE: 1: /home/likewise-open/KPIT/soumyar/openembedded/recipes/gettext/gettext_0.17.bb, do_install (32756)
> NOTE: 2: /home/likewise-open/KPIT/soumyar/openembedded/recipes/qt4/qt4-tools-native_4.7.0-beta1.bb, do_install (32757)
> NOTE: Waiting for 1 active tasks to finish
> NOTE: 1: /home/likewise-open/KPIT/soumyar/openembedded/recipes/gettext/gettext_0.17.bb, do_install (32756)
> NOTE: Tasks Summary: Attempted 674 tasks of which 674 didn't need to be rerun and 1 failed.
> ERROR: '/home/likewise-open/KPIT/soumyar/openembedded/recipes/qt4/qt4-embedded_4.7.0-beta1.bb' failed
> 
>     Anybody can help me out to resolve this please..
> 
> Thanks in advance :-)
> 
> Regards,
> Soumya
> This message contains information that may be privileged or confidential and is the property of the KPIT Cummins Infosystems Ltd. It is intended only for the person to whom it is addressed. If you are not the intended recipient, you are not authorized to read, print, retain copy, disseminate, distribute, or use this message or any part thereof. If you receive this message in error, please notify the sender immediately and delete all copies of this message. KPIT Cummins Infosystems Ltd. does not accept any liability for virus infected mails.
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


