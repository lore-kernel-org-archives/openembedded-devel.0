Received: from fg-out-1718.google.com ([72.14.220.154])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NvXGB-0000RI-Vv
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Mar 2010 15:45:12 +0100
Received: by fg-out-1718.google.com with SMTP id e12so361549fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Mar 2010 07:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=gqMVD4EEu/ntgJgiyKD4YizL2eVV5Of45vOVf98Im98=;
	b=xan2AVREez69+06jhj7i2IJ6dwzI/c5W1rXKILOUPDFWfTAU+kZ/ZySc5SXAvOmg9d
	e2g814Lh00BfRzdSVTeOGsRJ1NxX6efp1TFRPAIf8DR38pTxbfqwF4d06RixAJjUcHg/
	KPUQ1TfuqhjxoXWxRS70q4waa5jT92zMvXYyc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=jiotCrWRvxKDGMFgsYK2Swf0hH8HcfdY12/92uip+CcDn0OgRJKVVXuBh6841ByVKv
	9SRbTuxTSF7Wj9fkS1sFQseAeEIVHZUTEu0n5ETsCoaxhutDLjztn0/pnpuU3YXgqgRv
	jCuahP/EuCiZ6cr3QZMAYMVONmd+MV6SasPBA=
Received: by 10.87.67.25 with SMTP id u25mr1491351fgk.32.1269700921772;
	Sat, 27 Mar 2010 07:42:01 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm1480693fxm.12.2010.03.27.07.42.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 27 Mar 2010 07:42:00 -0700 (PDT)
Date: Sat, 27 Mar 2010 15:42:04 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100327144204.GJ3458@jama>
References: <FA726C33-C7BC-48C6-8507-475E87359AF5@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <FA726C33-C7BC-48C6-8507-475E87359AF5@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 72.14.220.154
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: valentin.longchamp@epfl.ch, Holger Freyther <zecke@selfish.org>
Subject: Re: QT4 and cmake patches
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
X-List-Received-Date: Sat, 27 Mar 2010 14:45:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 27, 2010 at 12:32:15PM +0100, Koen Kooi wrote:
> I'm currently fixing outstanding bugs with our qt4 recipes so I can use them in and hostside as well as target side sdk and cmake support  would be helpfull :)

Have you seen this error? 

I get this with bitbake master and 1.8 too. 

Reverting 971efeefff1520607b704cdded86deed43c459fb makes it building fine.

NOTE: Running task 7194 of 14520 (ID: 8380, /home/shr/shr-unstable/openembedded/recipes/qt4/qt4-x11-free_4.6.2.bb, do_package)
NOTE: The path does not exist:/home/shr/shr-unstable/tmp/work/armv4t-oe-linux-gnueabi/qt4-x11-free-4.6.2-r17.2/image/usr/lib/qt4/plugins/accessible/
NOTE: The path does not exist:/home/shr/shr-unstable/tmp/work/armv4t-oe-linux-gnueabi/qt4-x11-free-4.6.2-r17.2/image/usr/lib/qt4/plugins/decorations/
NOTE: The path does not exist:/home/shr/shr-unstable/tmp/work/armv4t-oe-linux-gnueabi/qt4-x11-free-4.6.2-r17.2/image/usr/lib/qt4/plugins/gfxdrivers/
NOTE: The path does not exist:/home/shr/shr-unstable/tmp/work/armv4t-oe-linux-gnueabi/qt4-x11-free-4.6.2-r17.2/image/usr/lib/qt4/plugins/mousedrivers/
NOTE: The path does not exist:/home/shr/shr-unstable/tmp/work/armv4t-oe-linux-gnueabi/qt4-x11-free-4.6.2-r17.2/image/usr/lib/qt4/plugins/styles/
NOTE: the following files were installed but not shipped in any package:
NOTE:   /usr/bin/.debug/uic
NOTE:   /usr/bin/.debug/rcc        
NOTE:   /usr/bin/.debug/uic3
NOTE:   /usr/bin/.debug/qttracereplay
NOTE:   /usr/bin/.debug/qdoc3
NOTE:   /usr/bin/.debug/moc
NOTE: <type 'exceptions.Exception'>:variable includedir references itself! while evaluating:
${includedir}
NOTE: <type 'exceptions.Exception'>:variable includedir references itself! while evaluating:
-I${includedir}/qt4/Qt3Support -DQT_SHARED -I${includedir}/qt4 -DQT3_SUPPORT -I${includedir}
ERROR: Error in executing: /home/shr/shr-unstable/openembedded/recipes/qt4/qt4-x11-free_4.6.2.bb
ERROR: Exception:<type 'exceptions.Exception'> Message:variable includedir references itself!
ERROR: Printing the environment of the function
ERROR:  0055:                   os.remove(pkgs_file)
ERROR:  0056:           if pkgconfig_provided[pkg] != []:
ERROR:  0057:                   f = open(pkgs_file, 'w')
ERROR:  0058:                   for p in pkgconfig_provided[pkg]:
ERROR:  0059:                           f.write('%s\n' % p)
ERROR:  0060:                   f.close()
ERROR:  0061:                   package_stagefile(pkgs_file, d)
ERROR:  0062:
ERROR:  0063:   for dir in [shlibs_dir]:
ERROR: Error in executing: /home/shr/shr-unstable/openembedded/recipes/qt4/qt4-x11-free_4.6.2.bb
ERROR: Exception:<type 'exceptions.Exception'> Message:variable includedir references itself!
ERROR: Printing the environment of the function
ERROR: Error in executing: /home/shr/shr-unstable/openembedded/recipes/qt4/qt4-x11-free_4.6.2.bb
ERROR: Exception:<type 'exceptions.Exception'> Message:variable includedir references itself!
ERROR: Printing the environment of the function
ERROR: Error in executing: /home/shr/shr-unstable/openembedded/recipes/qt4/qt4-x11-free_4.6.2.bb
ERROR: Exception:<type 'exceptions.Exception'> Message:variable includedir references itself!
ERROR: Printing the environment of the function
ERROR: Build of /home/shr/shr-unstable/openembedded/recipes/qt4/qt4-x11-free_4.6.2.bb do_package failed
Traceback (most recent call last):
  File "/home/shr/shr-unstable/bitbake/bin/bitbake", line 143, in <module>
    main()
  File "/home/shr/shr-unstable/bitbake/bin/bitbake", line 140, in main
    cooker.cook()
  File "/home/shr/shr-unstable/bitbake/lib/bb/cooker.py", line 640, in cook
    return self.buildTargets(pkgs_to_build)
  File "/home/shr/shr-unstable/bitbake/lib/bb/cooker.py", line 547, in buildTargets
    failures = rq.execute_runqueue()
  File "/home/shr/shr-unstable/bitbake/lib/bb/runqueue.py", line 841, in execute_runqueue
    self.execute_runqueue_internal()
  File "/home/shr/shr-unstable/bitbake/lib/bb/runqueue.py", line 950, in execute_runqueue_internal
    self.cooker.tryBuild(fn)
  File "/home/shr/shr-unstable/bitbake/lib/bb/cooker.py", line 136, in tryBuild
    return self.tryBuildPackage(fn, item, self.configuration.cmd, the_data)
  File "/home/shr/shr-unstable/bitbake/lib/bb/cooker.py", line 110, in tryBuildPackage
    bb.build.exec_task('do_%s' % task, the_data)
  File "/home/shr/shr-unstable/bitbake/lib/bb/build.py", line 283, in exec_task
    exec_func(task, localdata)
  File "/home/shr/shr-unstable/bitbake/lib/bb/build.py", line 120, in exec_func
    exec_func_python(func, d)
  File "/home/shr/shr-unstable/bitbake/lib/bb/build.py", line 141, in exec_func_python
    utils.better_exec(comp, g, tmp, bbfile)
  File "/home/shr/shr-unstable/bitbake/lib/bb/utils.py", line 185, in better_exec
    exec code in context
  File "do_package", line 4, in <module>
  File "do_package", line 2, in do_package
  File "/home/shr/shr-unstable/bitbake/lib/bb/build.py", line 120, in exec_func
    exec_func_python(func, d)
  File "/home/shr/shr-unstable/bitbake/lib/bb/build.py", line 141, in exec_func_python
    utils.better_exec(comp, g, tmp, bbfile)
  File "/home/shr/shr-unstable/bitbake/lib/bb/utils.py", line 185, in better_exec
    exec code in context
  File "package_ipk_do_package", line 4, in <module>
  File "package_ipk_do_package", line 2, in package_ipk_do_package
  File "/home/shr/shr-unstable/bitbake/lib/bb/build.py", line 120, in exec_func
    exec_func_python(func, d)
  File "/home/shr/shr-unstable/bitbake/lib/bb/build.py", line 141, in exec_func_python
    utils.better_exec(comp, g, tmp, bbfile)
  File "/home/shr/shr-unstable/bitbake/lib/bb/utils.py", line 185, in better_exec
    exec code in context
  File "package_do_package", line 21, in <module>
  File "package_do_package", line 18, in package_do_package
  File "/home/shr/shr-unstable/bitbake/lib/bb/build.py", line 120, in exec_func
    exec_func_python(func, d)
  File "/home/shr/shr-unstable/bitbake/lib/bb/build.py", line 141, in exec_func_python
    utils.better_exec(comp, g, tmp, bbfile)
  File "/home/shr/shr-unstable/bitbake/lib/bb/utils.py", line 185, in better_exec
    exec code in context
  File "package_do_pkgconfig", line 101, in <module>
  File "package_do_pkgconfig", line 44, in package_do_pkgconfig
  File "/home/shr/shr-unstable/bitbake/lib/bb/data.py", line 279, in expand
    return d.expand(s, varname)
  File "/home/shr/shr-unstable/bitbake/lib/bb/data_smart.py", line 83, in expand
    s = __expand_var_regexp__.sub(var_sub, s)
  File "/home/shr/shr-unstable/bitbake/lib/bb/data_smart.py", line 60, in var_sub
    var = self.getVar(key, 1)
  File "/home/shr/shr-unstable/bitbake/lib/bb/data_smart.py", line 166, in getVar
    return self.expand(value,var)
  File "/home/shr/shr-unstable/bitbake/lib/bb/data_smart.py", line 83, in expand
    s = __expand_var_regexp__.sub(var_sub, s)
  File "/home/shr/shr-unstable/bitbake/lib/bb/data_smart.py", line 59, in var_sub
    raise Exception("variable %s references itself!" % varname)
Exception: variable includedir references itself!

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


