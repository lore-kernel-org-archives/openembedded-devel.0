Received: from [216.145.245.197] (helo=mx01.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1Lkr0e-0004yc-98
	for openembedded-devel@openembedded.org; Sat, 21 Mar 2009 03:32:28 +0100
Received: from [209.242.7.134] (helo=[192.168.231.111])
	by mx01.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LkqzY-0000Io-8c
	for openembedded-devel@openembedded.org; Fri, 20 Mar 2009 21:31:21 -0500
Message-ID: <49C4516C.90607@dls.net>
Date: Fri, 20 Mar 2009 21:31:08 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.21) Gecko/20090302 Thunderbird/2.0.0.21 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
Subject: Parse failure for the new RPM recipes
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
X-List-Received-Date: Sat, 21 Mar 2009 02:32:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Something wrong; looks like a python function is being called during the parse phase - it throws up because TMPDIR is empty -- of course there's no python-native; I haven't built anything yet!

I have no idea what this is doing.  I'll try converting it to a warning so that parsing continues.  If that works, I'll commit that change -- someone can revert it as soon as the real fix comes along (that's the best I can do; I just have no idea what this is trying to do, or why that function is being evaluated at parse time).

Mike (mwester)

-----------------------

NOTE: Out of date cache found, rebuilding...
NOTE: Handling BitBake files: | (4851/6608) [73 %]__builtin__:6: DeprecationWarning: raising a string exception is deprecated
NOTE: No Python in STAGING_INCDIR. Forgot to build python-native ?:None while evaluating:
${@python_dir(d)}
/r/slug/slugos/bitbake/lib/bb/data_smart.py:93: DeprecationWarning: raising a string exception is deprecated
  raise
NOTE: No Python in STAGING_INCDIR. Forgot to build python-native ?:None while evaluating:
--with-python           --with-python-incdir=${STAGING_INCDIR}/${PYTHON_DIR}            --with-python-libdir=${libdir}/${PYTHON_DIR}            --without-apidocs               --without-selinux               --without-lua           --without-dmalloc               --without-efence ${MUTEX}
ERROR: Error in executing: /r/slug/slugos/openembedded/recipes/rpm/rpm-native_4.4.2.3.bb
ERROR: Exception:No Python in STAGING_INCDIR. Forgot to build python-native ? Message:None
ERROR: Printing the environment of the function
ERROR:  0002:    import bb
ERROR:  0003:    from bb import __version__
ERROR:  0004:    base_after_parse(d)
ERROR:  0005:
ERROR:  0006:    # Remove this for bitbake 1.8.12
ERROR:  0007:    try:
ERROR:  0008:        from distutils.version import LooseVersion
ERROR:  0009:    except ImportError:
ERROR:  0010:        def LooseVersion(v): print "WARNING: sanity.bbclass can't compare versions without python-distutils"; return 1
/r/slug/slugos/bitbake/lib/bb/utils.py:191: DeprecationWarning: raising a string exception is deprecated
  raise
/r/slug/slugos/bitbake/lib/bb/cache.py:415: DeprecationWarning: raising a string exception is deprecated
  raise
/r/slug/slugos/bitbake/lib/bb/cooker.py:766: DeprecationWarning: raising a string exception is deprecated
  raise
Traceback (most recent call last):
  File "/r/slug/slugos/bitbake/bin/bitbake", line 143, in <module>
    main()
  File "/r/slug/slugos/bitbake/bin/bitbake", line 140, in main
    cooker.cook()
  File "/r/slug/slugos/bitbake/lib/bb/cooker.py", line 617, in cook
    self.updateCache()
  File "/r/slug/slugos/bitbake/lib/bb/cooker.py", line 587, in updateCache
    self.parse_bbfiles(filelist, masked, self.myProgressCallback)
  File "/r/slug/slugos/bitbake/lib/bb/cooker.py", line 726, in parse_bbfiles
    fromCache, skip = self.bb_cache.loadData(f, self.configuration.data)
  File "/r/slug/slugos/bitbake/lib/bb/cache.py", line 170, in loadData
    bb_data, skipped = self.load_bbfile(fn, cfgData)
  File "/r/slug/slugos/bitbake/lib/bb/cache.py", line 407, in load_bbfile
    bb_data = parse.handle(bbfile, bb_data) # read .bb data
  File "/r/slug/slugos/bitbake/lib/bb/parse/__init__.py", line 75, in handle
    return h['handle'](fn, data, include)
  File "/r/slug/slugos/bitbake/lib/bb/parse/parse_py/BBHandler.py", line 161, in handle
    build.exec_func("__anonfunc", d)
  File "/r/slug/slugos/bitbake/lib/bb/build.py", line 113, in exec_func
    exec_func_python(func, d)
  File "/r/slug/slugos/bitbake/lib/bb/build.py", line 136, in exec_func_python
    utils.better_exec(comp, g, tmp, bbfile)
  File "/r/slug/slugos/bitbake/lib/bb/utils.py", line 171, in better_exec
    exec code in context
  File "__anonfunc", line 76, in <module>
  File "__anonfunc", line 74, in __anonfunc
  File "<bb>", line 5, in gettext_after_parse
  File "/r/slug/slugos/bitbake/lib/bb/data.py", line 97, in getVar
    return d.getVar(var,exp)
  File "/r/slug/slugos/bitbake/lib/bb/data_smart.py", line 167, in getVar
    return self.expand(value,var)
  File "/r/slug/slugos/bitbake/lib/bb/data_smart.py", line 84, in expand
    s = __expand_var_regexp__.sub(var_sub, s)
  File "/r/slug/slugos/bitbake/lib/bb/data_smart.py", line 61, in var_sub
    var = self.getVar(key, 1)
  File "/r/slug/slugos/bitbake/lib/bb/data_smart.py", line 167, in getVar
    return self.expand(value,var)
  File "/r/slug/slugos/bitbake/lib/bb/data_smart.py", line 85, in expand
    s = __expand_python_regexp__.sub(python_sub, s)
  File "/r/slug/slugos/bitbake/lib/bb/data_smart.py", line 71, in python_sub
    s = eval(code)
  File "<string>", line 1, in <module>
  File "<bb>", line 6, in python_dir
No Python in STAGING_INCDIR. Forgot to build python-native ?


