Received: from [209.85.200.173] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <taroth@gmail.com>) id 1LkQm3-0005kB-BE
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Mar 2009 23:31:39 +0100
Received: by wf-out-1314.google.com with SMTP id 25so953943wfa.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2009 15:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:user-agent:mime-version:content-type;
	bh=vaoW/kGOIP+YUTnw/lDSVACiasybV1JlKwK5GEzN3H0=;
	b=ChHfewzicmZPcsgUHhtHFrFcsTQ+S1+kKmS2JvuX3BPHlEHv8dsSitlZZWx4Os9OqI
	UJjHtG6TcCVXYGDyfS+7XJh+ZZ7Jt6kUSESIMIzRR+5cwcrhLnaEheWbwvLlJRyueGcm
	37kLCsBdfH8Lu1DpsXkty2xtrT6TF4gA1h5DU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:user-agent:mime-version
	:content-type;
	b=C/4qvQ91NX1KLBf3NB1m/qwK1Fhoy2Q4KTatCXv15kfHiOFEcYtn+eOEg6uDpnhoN/
	w8BAzJxpTKNi2oALfCxkOGM3dOy42MQt992rXuKHbVC31F4S17wpHS9N6Uzh4lApyP79
	cg1ZtVICeVJCQsa0WeHqFaAeLwnF6YlOy5vzQ=
Received: by 10.142.217.17 with SMTP id p17mr1154004wfg.40.1237501839509;
	Thu, 19 Mar 2009 15:30:39 -0700 (PDT)
Received: from dorkboy (99-203-159-164.pools.spcsdns.net [99.203.159.164])
	by mx.google.com with ESMTPS id 30sm2509318wfc.24.2009.03.19.15.30.38
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 19 Mar 2009 15:30:39 -0700 (PDT)
Date: Thu, 19 Mar 2009 15:30:29 -0700 (PDT)
From: "Theodore A. Roth" <taroth@gmail.com>
To: OpenEmbedded Development List <openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.DEB.1.00.0903191522200.10548@localhost.localdomain>
User-Agent: Alpine 1.00 (DEB 882 2007-12-20)
MIME-Version: 1.0
Subject: rpm-native problem?
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
X-List-Received-Date: Thu, 19 Mar 2009 22:31:39 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

Hi,

I just did a pull this morning and am getting this failure when parsing
BitBake files:



NOTE: Handling BitBake files: \ (0697/6606) [10 %]__builtin__:6: 
DeprecationWarning: raising a string exception is deprecated
NOTE: No Python in STAGING_INCDIR. Forgot to build python-native ?:None 
while evaluating:
${@python_dir(d)}
/home/roth/dev/OE/bitbake/lib/bb/data_smart.py:93: DeprecationWarning: 
raising a string exception is deprecated
  raise
NOTE: No Python in STAGING_INCDIR. Forgot to build python-native ?:None 
while evaluating:
--with-python 		
--with-python-incdir=${STAGING_INCDIR}/${PYTHON_DIR} 	
--with-python-libdir=${libdir}/${PYTHON_DIR} 		--without-apidocs 	
--without-selinux 		--without-lua 		--without-dmalloc 	
--without-efence ${MUTEX}
ERROR: Error in executing: 
/home/roth/dev/OE/openembedded/recipes/rpm/rpm-native_4.4.2.3.bb
ERROR: Exception:No Python in STAGING_INCDIR. Forgot to build 
python-native ? Message:None
ERROR: Printing the environment of the function
ERROR: 	0002:    import bb
ERROR: 	0003:    from bb import __version__
ERROR: 	0004:    base_after_parse(d)
ERROR: 	0005:
ERROR: 	0006:    # Remove this for bitbake 1.8.12
ERROR: 	0007:    try:
ERROR: 	0008:        from distutils.version import LooseVersion
ERROR: 	0009:    except ImportError:
ERROR: 	0010:        def LooseVersion(v): print "WARNING: sanity.bbclass 
can't compare versions without python-distutils"; return 1
/home/roth/dev/OE/bitbake/lib/bb/utils.py:191: DeprecationWarning: raising 
a string exception is deprecated
  raise
Traceback (most recent call last):
  File "/home/roth/dev/OE/bitbake/bin/bitbake", line 143, in <module>
    main()
  File "/home/roth/dev/OE/bitbake/bin/bitbake", line 140, in main
    cooker.cook()
  File "/home/roth/dev/OE/bitbake/lib/bb/cooker.py", line 617, in cook
    self.updateCache()
  File "/home/roth/dev/OE/bitbake/lib/bb/cooker.py", line 587, in 
updateCache
    self.parse_bbfiles(filelist, masked, self.myProgressCallback)
  File "/home/roth/dev/OE/bitbake/lib/bb/cooker.py", line 717, in 
parse_bbfiles
    def parse_bbfiles(self, filelist, masked, progressCallback = None):
  File "/home/roth/dev/OE/bitbake/lib/bb/cooker.py", line 766, in 
parse_bbfiles
    raise
  File "/home/roth/dev/OE/bitbake/lib/bb/cooker.py", line 726, in 
parse_bbfiles
    fromCache, skip = self.bb_cache.loadData(f, self.configuration.data)
  File "/home/roth/dev/OE/bitbake/lib/bb/cache.py", line 168, in loadData
    bb_data, skipped = self.load_bbfile(fn, cfgData)
  File "/home/roth/dev/OE/bitbake/lib/bb/cache.py", line 413, in 
load_bbfile
    raise
  File "/home/roth/dev/OE/bitbake/lib/bb/cache.py", line 405, in 
load_bbfile
    bb_data = parse.handle(bbfile, bb_data) # read .bb data
  File "/home/roth/dev/OE/bitbake/lib/bb/parse/__init__.py", line 75, in 
handle
    return h['handle'](fn, data, include)
  File "/home/roth/dev/OE/bitbake/lib/bb/parse/parse_py/BBHandler.py", 
line 184, in handle
    finalise(fn, d)
  File "/home/roth/dev/OE/bitbake/lib/bb/parse/parse_py/BBHandler.py", 
line 92, in finalise
    build.exec_func("__anonfunc", d)
  File "/home/roth/dev/OE/bitbake/lib/bb/build.py", line 113, in exec_func
    exec_func_python(func, d)
  File "/home/roth/dev/OE/bitbake/lib/bb/build.py", line 136, in 
exec_func_python
    utils.better_exec(comp, g, tmp, bbfile)
  File "/home/roth/dev/OE/bitbake/lib/bb/utils.py", line 171, in 
better_exec
    exec code in context
  File "__anonfunc", line 76, in <module>
  File "__anonfunc", line 74, in __anonfunc
  File "<bb>", line 5, in gettext_after_parse
  File "/home/roth/dev/OE/bitbake/lib/bb/data.py", line 97, in getVar
    return d.getVar(var,exp)
  File "/home/roth/dev/OE/bitbake/lib/bb/data_smart.py", line 167, in 
getVar
    return self.expand(value,var)
  File "/home/roth/dev/OE/bitbake/lib/bb/data_smart.py", line 84, in 
expand
    s = __expand_var_regexp__.sub(var_sub, s)
  File "/home/roth/dev/OE/bitbake/lib/bb/data_smart.py", line 61, in 
var_sub
    var = self.getVar(key, 1)
  File "/home/roth/dev/OE/bitbake/lib/bb/data_smart.py", line 167, in 
getVar
    return self.expand(value,var)
  File "/home/roth/dev/OE/bitbake/lib/bb/data_smart.py", line 85, in 
expand
    s = __expand_python_regexp__.sub(python_sub, s)
  File "/home/roth/dev/OE/bitbake/lib/bb/data_smart.py", line 71, in 
python_sub
    s = eval(code)
  File "<string>", line 1, in <module>
  File "<bb>", line 6, in python_dir
No Python in STAGING_INCDIR. Forgot to build python-native ?



Is this problem related to the following patch?


Author: Marcin Juszkiewicz <hrw@openembedded.org>  2008-11-19 03:12:37
Committer: Marcin Juszkiewicz <hrw@openembedded.org>  2009-03-19 12:22:34
Parent: 47bb0f5ca3d62205703973398d79ed553bed8a4f (linux-msm7xxx: bump 
htcraphael SRCREV to a version that boots)
Child:  cabcbfe980d379e03589be3ed4bd0a4fc006e770 (beecrypt: get patch from 
Poky to fix building on 64bit machines)
Branches: org.openembedded.dev, remotes/origin/org.openembedded.dev, 
ts7800
Follows: mv-packages-to-recipes-post
Precedes: 

    rpm/rpm-native: Add recipe for 4.4.2.3 (from Poky)
    
    Squashed set of changes from Poky:
    
    svn r5069 - rpm/rpm-native: Add recipe for 4.4.2.3
    svn r5085 - rpm: Patch out some Makefile strangeness causing build 
failures
    svn r5093 - rpm: Enable python extensions and improve cross compiling 
patches
    svn r5103 - rpm: Tweak patches to remove popt problem
    svn r5113 - rpm: Add recommends support from suse rpm patches
    svn r5132 - rpm-native: Set varprefix to get the rpm database in a 
sane location
    svn r5152 - rpm: Handle PYTHONVER differently in EXTRA_OECONF to stop 
gettext/uclibc failures during parsing
    svn r5154 - rpm: Add missing patches
    svn r5423 - rpm: Add python module packaging
    
    OE changes:
    
    rpm-native: add Python 2.6 support
    rpm: use distutils-base to get Python version
    rpm: use sed instead of ed - it is present in our metadata
    rpm: set ARM_INSTRUCTION_SET as it fails to build for thumb
    
    | /tmp/ccYO91se.s: Assembler messages:
    | /tmp/ccYO91se.s:71: Error: selected processor does not support `swpb 
r2,r3,[r4]'
    | /tmp/ccYO91se.s:72: Error: unshifted register required -- `eor 
r2,r2,#1'




Thanks for any help.

Ted Roth


