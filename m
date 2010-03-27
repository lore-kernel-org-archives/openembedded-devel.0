Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NvaHy-0005Xf-C3 for openembedded-devel@lists.openembedded.org;
	Sat, 27 Mar 2010 18:59:15 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NvaEt-0006bY-A4 for openembedded-devel@lists.openembedded.org;
	Sat, 27 Mar 2010 18:56:03 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Mar 2010 18:56:03 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Mar 2010 18:56:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 27 Mar 2010 18:55:51 +0100
Message-ID: <holgr8$8l9$1@dough.gmane.org>
References: <FA726C33-C7BC-48C6-8507-475E87359AF5@dominion.thruhere.net>
	<20100327144204.GJ3458@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100318 Shredder/3.0.5pre
In-Reply-To: <20100327144204.GJ3458@jama>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
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
X-List-Received-Date: Sat, 27 Mar 2010 17:59:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 27-03-10 15:42, Martin Jansa wrote:
> On Sat, Mar 27, 2010 at 12:32:15PM +0100, Koen Kooi wrote:
>> I'm currently fixing outstanding bugs with our qt4 recipes so I can use them in and hostside as well as target side sdk and cmake support  would be helpfull :)
> 
> Have you seen this error? 
> 
> I get this with bitbake master and 1.8 too. 

Could you try changing

# QT abuses $includedir to point to its headers, which breaks pkgconfig
sysroot, so manually fix it up here:

to

# QT abuses includedir to point to its headers, which breaks pkgconfig
sysroot, so manually fix it up here:

regards,

Koen


> 
> Reverting 971efeefff1520607b704cdded86deed43c459fb makes it building fine.
> 
> NOTE: Running task 7194 of 14520 (ID: 8380, /home/shr/shr-unstable/openembedded/recipes/qt4/qt4-x11-free_4.6.2.bb, do_package)
> NOTE: The path does not exist:/home/shr/shr-unstable/tmp/work/armv4t-oe-linux-gnueabi/qt4-x11-free-4.6.2-r17.2/image/usr/lib/qt4/plugins/accessible/
> NOTE: The path does not exist:/home/shr/shr-unstable/tmp/work/armv4t-oe-linux-gnueabi/qt4-x11-free-4.6.2-r17.2/image/usr/lib/qt4/plugins/decorations/
> NOTE: The path does not exist:/home/shr/shr-unstable/tmp/work/armv4t-oe-linux-gnueabi/qt4-x11-free-4.6.2-r17.2/image/usr/lib/qt4/plugins/gfxdrivers/
> NOTE: The path does not exist:/home/shr/shr-unstable/tmp/work/armv4t-oe-linux-gnueabi/qt4-x11-free-4.6.2-r17.2/image/usr/lib/qt4/plugins/mousedrivers/
> NOTE: The path does not exist:/home/shr/shr-unstable/tmp/work/armv4t-oe-linux-gnueabi/qt4-x11-free-4.6.2-r17.2/image/usr/lib/qt4/plugins/styles/
> NOTE: the following files were installed but not shipped in any package:
> NOTE:   /usr/bin/.debug/uic
> NOTE:   /usr/bin/.debug/rcc        
> NOTE:   /usr/bin/.debug/uic3
> NOTE:   /usr/bin/.debug/qttracereplay
> NOTE:   /usr/bin/.debug/qdoc3
> NOTE:   /usr/bin/.debug/moc
> NOTE: <type 'exceptions.Exception'>:variable includedir references itself! while evaluating:
> ${includedir}
> NOTE: <type 'exceptions.Exception'>:variable includedir references itself! while evaluating:
> -I${includedir}/qt4/Qt3Support -DQT_SHARED -I${includedir}/qt4 -DQT3_SUPPORT -I${includedir}
> ERROR: Error in executing: /home/shr/shr-unstable/openembedded/recipes/qt4/qt4-x11-free_4.6.2.bb
> ERROR: Exception:<type 'exceptions.Exception'> Message:variable includedir references itself!
> ERROR: Printing the environment of the function
> ERROR:  0055:                   os.remove(pkgs_file)
> ERROR:  0056:           if pkgconfig_provided[pkg] != []:
> ERROR:  0057:                   f = open(pkgs_file, 'w')
> ERROR:  0058:                   for p in pkgconfig_provided[pkg]:
> ERROR:  0059:                           f.write('%s\n' % p)
> ERROR:  0060:                   f.close()
> ERROR:  0061:                   package_stagefile(pkgs_file, d)
> ERROR:  0062:
> ERROR:  0063:   for dir in [shlibs_dir]:
> ERROR: Error in executing: /home/shr/shr-unstable/openembedded/recipes/qt4/qt4-x11-free_4.6.2.bb
> ERROR: Exception:<type 'exceptions.Exception'> Message:variable includedir references itself!
> ERROR: Printing the environment of the function
> ERROR: Error in executing: /home/shr/shr-unstable/openembedded/recipes/qt4/qt4-x11-free_4.6.2.bb
> ERROR: Exception:<type 'exceptions.Exception'> Message:variable includedir references itself!
> ERROR: Printing the environment of the function
> ERROR: Error in executing: /home/shr/shr-unstable/openembedded/recipes/qt4/qt4-x11-free_4.6.2.bb
> ERROR: Exception:<type 'exceptions.Exception'> Message:variable includedir references itself!
> ERROR: Printing the environment of the function
> ERROR: Build of /home/shr/shr-unstable/openembedded/recipes/qt4/qt4-x11-free_4.6.2.bb do_package failed
> Traceback (most recent call last):
>   File "/home/shr/shr-unstable/bitbake/bin/bitbake", line 143, in <module>
>     main()
>   File "/home/shr/shr-unstable/bitbake/bin/bitbake", line 140, in main
>     cooker.cook()
>   File "/home/shr/shr-unstable/bitbake/lib/bb/cooker.py", line 640, in cook
>     return self.buildTargets(pkgs_to_build)
>   File "/home/shr/shr-unstable/bitbake/lib/bb/cooker.py", line 547, in buildTargets
>     failures = rq.execute_runqueue()
>   File "/home/shr/shr-unstable/bitbake/lib/bb/runqueue.py", line 841, in execute_runqueue
>     self.execute_runqueue_internal()
>   File "/home/shr/shr-unstable/bitbake/lib/bb/runqueue.py", line 950, in execute_runqueue_internal
>     self.cooker.tryBuild(fn)
>   File "/home/shr/shr-unstable/bitbake/lib/bb/cooker.py", line 136, in tryBuild
>     return self.tryBuildPackage(fn, item, self.configuration.cmd, the_data)
>   File "/home/shr/shr-unstable/bitbake/lib/bb/cooker.py", line 110, in tryBuildPackage
>     bb.build.exec_task('do_%s' % task, the_data)
>   File "/home/shr/shr-unstable/bitbake/lib/bb/build.py", line 283, in exec_task
>     exec_func(task, localdata)
>   File "/home/shr/shr-unstable/bitbake/lib/bb/build.py", line 120, in exec_func
>     exec_func_python(func, d)
>   File "/home/shr/shr-unstable/bitbake/lib/bb/build.py", line 141, in exec_func_python
>     utils.better_exec(comp, g, tmp, bbfile)
>   File "/home/shr/shr-unstable/bitbake/lib/bb/utils.py", line 185, in better_exec
>     exec code in context
>   File "do_package", line 4, in <module>
>   File "do_package", line 2, in do_package
>   File "/home/shr/shr-unstable/bitbake/lib/bb/build.py", line 120, in exec_func
>     exec_func_python(func, d)
>   File "/home/shr/shr-unstable/bitbake/lib/bb/build.py", line 141, in exec_func_python
>     utils.better_exec(comp, g, tmp, bbfile)
>   File "/home/shr/shr-unstable/bitbake/lib/bb/utils.py", line 185, in better_exec
>     exec code in context
>   File "package_ipk_do_package", line 4, in <module>
>   File "package_ipk_do_package", line 2, in package_ipk_do_package
>   File "/home/shr/shr-unstable/bitbake/lib/bb/build.py", line 120, in exec_func
>     exec_func_python(func, d)
>   File "/home/shr/shr-unstable/bitbake/lib/bb/build.py", line 141, in exec_func_python
>     utils.better_exec(comp, g, tmp, bbfile)
>   File "/home/shr/shr-unstable/bitbake/lib/bb/utils.py", line 185, in better_exec
>     exec code in context
>   File "package_do_package", line 21, in <module>
>   File "package_do_package", line 18, in package_do_package
>   File "/home/shr/shr-unstable/bitbake/lib/bb/build.py", line 120, in exec_func
>     exec_func_python(func, d)
>   File "/home/shr/shr-unstable/bitbake/lib/bb/build.py", line 141, in exec_func_python
>     utils.better_exec(comp, g, tmp, bbfile)
>   File "/home/shr/shr-unstable/bitbake/lib/bb/utils.py", line 185, in better_exec
>     exec code in context
>   File "package_do_pkgconfig", line 101, in <module>
>   File "package_do_pkgconfig", line 44, in package_do_pkgconfig
>   File "/home/shr/shr-unstable/bitbake/lib/bb/data.py", line 279, in expand
>     return d.expand(s, varname)
>   File "/home/shr/shr-unstable/bitbake/lib/bb/data_smart.py", line 83, in expand
>     s = __expand_var_regexp__.sub(var_sub, s)
>   File "/home/shr/shr-unstable/bitbake/lib/bb/data_smart.py", line 60, in var_sub
>     var = self.getVar(key, 1)
>   File "/home/shr/shr-unstable/bitbake/lib/bb/data_smart.py", line 166, in getVar
>     return self.expand(value,var)
>   File "/home/shr/shr-unstable/bitbake/lib/bb/data_smart.py", line 83, in expand
>     s = __expand_var_regexp__.sub(var_sub, s)
>   File "/home/shr/shr-unstable/bitbake/lib/bb/data_smart.py", line 59, in var_sub
>     raise Exception("variable %s references itself!" % varname)
> Exception: variable includedir references itself!
> 
> Regards,
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLrkanMkyGM64RGpERAljXAJ4kE2qgvfgWKWQZV63GZHiUoD0bzwCguyHf
s4CjUDSQDvMCey8KFK/php0=
=Kc5g
-----END PGP SIGNATURE-----



