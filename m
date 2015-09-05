Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 547 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 05 Sep 2015 09:10:07 UTC
Received: from smtp02.mail.online.nl (smtp02.mail.online.nl [194.134.25.72])
	by mail.openembedded.org (Postfix) with ESMTP id 9D52177049
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Sep 2015 09:10:07 +0000 (UTC)
Received: from [192.168.1.5] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp02.mail.online.nl (Postfix) with ESMTP id 868DD1A00C6
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Sep 2015 11:00:58 +0200 (CEST)
Message-ID: <55EAAF4A.10109@topic.nl>
Date: Sat, 05 Sep 2015 11:00:58 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: python-pyopenssl fails during install phase
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 05 Sep 2015 09:10:09 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

With today's OE and meta-oe master branches, I get the following 
mysterious error while building:

(I replaced my topdir with 'TOPDIR' in the log to protect my privacy)

DEBUG: Executing shell function do_install
running install
running bdist_egg
running egg_info
writing requirements to pyOpenSSL.egg-info/requires.txt
writing pyOpenSSL.egg-info/PKG-INFO
writing top-level names to pyOpenSSL.egg-info/top_level.txt
writing dependency_links to pyOpenSSL.egg-info/dependency_links.txt
reading manifest file 'pyOpenSSL.egg-info/SOURCES.txt'
reading manifest template 'MANIFEST.in'
warning: no files found matching 'OpenSSL/RATIONALE'
warning: no previously-included files found matching 'leakcheck'
warning: no previously-included files matching '*.py' found under 
directory 'leakcheck'
warning: no previously-included files matching '*.pem' found under 
directory 'leakcheck'
warning: no previously-included files matching '*.pyc' found anywhere in 
distribution
no previously-included directories found matching 'doc/_build'
writing manifest file 'pyOpenSSL.egg-info/SOURCES.txt'
installing library code to build/bdist.linux-x86_64/egg
running install_lib
running build_py
creating build/bdist.linux-x86_64/egg
creating build/bdist.linux-x86_64/egg/OpenSSL
copying build/lib/OpenSSL/_util.py -> build/bdist.linux-x86_64/egg/OpenSSL
copying build/lib/OpenSSL/crypto.py -> build/bdist.linux-x86_64/egg/OpenSSL
copying build/lib/OpenSSL/__init__.py -> 
build/bdist.linux-x86_64/egg/OpenSSL
copying build/lib/OpenSSL/rand.py -> build/bdist.linux-x86_64/egg/OpenSSL
copying build/lib/OpenSSL/tsafe.py -> build/bdist.linux-x86_64/egg/OpenSSL
copying build/lib/OpenSSL/SSL.py -> build/bdist.linux-x86_64/egg/OpenSSL
creating build/bdist.linux-x86_64/egg/OpenSSL/test
copying build/lib/OpenSSL/test/test_rand.py -> 
build/bdist.linux-x86_64/egg/OpenSSL/test
copying build/lib/OpenSSL/test/util.py -> 
build/bdist.linux-x86_64/egg/OpenSSL/test
copying build/lib/OpenSSL/test/test_tsafe.py -> 
build/bdist.linux-x86_64/egg/OpenSSL/test
copying build/lib/OpenSSL/test/__init__.py -> 
build/bdist.linux-x86_64/egg/OpenSSL/test
copying build/lib/OpenSSL/test/test_crypto.py -> 
build/bdist.linux-x86_64/egg/OpenSSL/test
copying build/lib/OpenSSL/test/test_ssl.py -> 
build/bdist.linux-x86_64/egg/OpenSSL/test
copying build/lib/OpenSSL/test/test_util.py -> 
build/bdist.linux-x86_64/egg/OpenSSL/test
copying build/lib/OpenSSL/version.py -> build/bdist.linux-x86_64/egg/OpenSSL
writing byte-compilation script '/tmp/tmpYEe1_A.py'
/TOPDIR/build/tmp/sysroots/x86_64-linux/usr/bin/python-native/python 
/tmp/tmpYEe1_A.py
removing /tmp/tmpYEe1_A.py
creating build/bdist.linux-x86_64/egg/EGG-INFO
copying pyOpenSSL.egg-info/PKG-INFO -> build/bdist.linux-x86_64/egg/EGG-INFO
copying pyOpenSSL.egg-info/SOURCES.txt -> 
build/bdist.linux-x86_64/egg/EGG-INFO
copying pyOpenSSL.egg-info/dependency_links.txt -> 
build/bdist.linux-x86_64/egg/EGG-INFO
copying pyOpenSSL.egg-info/requires.txt -> 
build/bdist.linux-x86_64/egg/EGG-INFO
copying pyOpenSSL.egg-info/top_level.txt -> 
build/bdist.linux-x86_64/egg/EGG-INFO
zip_safe flag not set; analyzing archive contents...
creating 'dist/pyOpenSSL-0.15.1-py2.7.egg' and adding 
'build/bdist.linux-x86_64/egg' to it
removing 'build/bdist.linux-x86_64/egg' (and everything under it)
Creating 
/TOPDIR/build/tmp/work/mips32el-oe-linux/python-pyopenssl/1_0.15.1-r0/image/usr/lib/python2.7/site-packages/site.py
Processing pyOpenSSL-0.15.1-py2.7.egg
Copying pyOpenSSL-0.15.1-py2.7.egg to 
/TOPDIR/build/tmp/work/mips32el-oe-linux/python-pyopenssl/1_0.15.1-r0/image/usr/lib/python2.7/site-packages
Adding pyOpenSSL 0.15.1 to easy-install.pth file

Installed 
/TOPDIR/build/tmp/work/mips32el-oe-linux/python-pyopenssl/1_0.15.1-r0/image/usr/lib/python2.7/site-packages/pyOpenSSL-0.15.1-py2.7.egg
Processing dependencies for pyOpenSSL==0.15.1
Searching for six>=1.5.2
Reading https://pypi.python.org/simple/six/
Best match: six 1.9.0
Downloading 
https://pypi.python.org/packages/source/s/six/six-1.9.0.tar.gz#md5=476881ef4012262dfc8adc645ee786c4
Processing six-1.9.0.tar.gz
Writing /tmp/easy_install-ZTQGDn/six-1.9.0/setup.cfg
Running six-1.9.0/setup.py -q bdist_egg --dist-dir 
/tmp/easy_install-ZTQGDn/six-1.9.0/egg-dist-tmp-sL3RtM
no previously-included directories found matching 'documentation/_build'
zip_safe flag not set; analyzing archive contents...
six: module references __path__
creating 
/TOPDIR/build/tmp/work/mips32el-oe-linux/python-pyopenssl/1_0.15.1-r0/image/usr/lib/python2.7/site-packages/six-1.9.0-py2.7.egg
Extracting six-1.9.0-py2.7.egg to 
/TOPDIR/build/tmp/work/mips32el-oe-linux/python-pyopenssl/1_0.15.1-r0/image/usr/lib/python2.7/site-packages
Adding six 1.9.0 to easy-install.pth file

Installed 
/TOPDIR/build/tmp/work/mips32el-oe-linux/python-pyopenssl/1_0.15.1-r0/image/usr/lib/python2.7/site-packages/six-1.9.0-py2.7.egg
Searching for cryptography>=0.7
Reading https://pypi.python.org/simple/cryptography/
Best match: cryptography 1.0
Downloading 
https://pypi.python.org/packages/source/c/cryptography/cryptography-1.0.tar.gz#md5=3f2608eb94dcc6e616c3cc2e182181b0
Processing cryptography-1.0.tar.gz
Writing /tmp/easy_install-4LpLp5/cryptography-1.0/setup.cfg
Running cryptography-1.0/setup.py -q bdist_egg --dist-dir 
/tmp/easy_install-4LpLp5/cryptography-1.0/egg-dist-tmp-gn1Pcd

Installed 
/tmp/easy_install-4LpLp5/cryptography-1.0/.eggs/cffi-1.2.1-py2.7-linux-x86_64.egg
Traceback (most recent call last):
   File "setup.py", line 78, in <module>
     test_suite="OpenSSL")
   File 
"/TOPDIR/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7/distutils/core.py", 
line 151, in setup
     dist.run_commands()
   File 
"/TOPDIR/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7/distutils/dist.py", 
line 953, in run_commands
     self.run_command(cmd)
   File 
"/TOPDIR/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7/distutils/dist.py", 
line 972, in run_command
     cmd_obj.run()
   File "build/bdist.linux-x86_64/egg/setuptools/command/install.py", 
line 67, in run
   File "build/bdist.linux-x86_64/egg/setuptools/command/install.py", 
line 117, in do_egg_install
   File 
"build/bdist.linux-x86_64/egg/setuptools/command/easy_install.py", line 
380, in run
   File 
"build/bdist.linux-x86_64/egg/setuptools/command/easy_install.py", line 
610, in easy_install
   File 
"build/bdist.linux-x86_64/egg/setuptools/command/easy_install.py", line 
661, in install_item
   File 
"build/bdist.linux-x86_64/egg/setuptools/command/easy_install.py", line 
709, in process_distribution
   File "build/bdist.linux-x86_64/egg/pkg_resources/__init__.py", line 
836, in resolve
   File "build/bdist.linux-x86_64/egg/pkg_resources/__init__.py", line 
1081, in best_match
   File "build/bdist.linux-x86_64/egg/pkg_resources/__init__.py", line 
1093, in obtain
   File 
"build/bdist.linux-x86_64/egg/setuptools/command/easy_install.py", line 
629, in easy_install
   File 
"build/bdist.linux-x86_64/egg/setuptools/command/easy_install.py", line 
659, in install_item
   File 
"build/bdist.linux-x86_64/egg/setuptools/command/easy_install.py", line 
842, in install_eggs
   File 
"build/bdist.linux-x86_64/egg/setuptools/command/easy_install.py", line 
1070, in build_and_install
   File 
"build/bdist.linux-x86_64/egg/setuptools/command/easy_install.py", line 
1056, in run_setup
   File "build/bdist.linux-x86_64/egg/setuptools/sandbox.py", line 240, 
in run_setup
   File 
"/TOPDIR/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7/contextlib.py", 
line 35, in __exit__
     self.gen.throw(type, value, traceback)
   File "build/bdist.linux-x86_64/egg/setuptools/sandbox.py", line 193, 
in setup_context
   File 
"/TOPDIR/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7/contextlib.py", 
line 35, in __exit__
     self.gen.throw(type, value, traceback)
   File "build/bdist.linux-x86_64/egg/setuptools/sandbox.py", line 164, 
in save_modules
   File "build/bdist.linux-x86_64/egg/setuptools/sandbox.py", line 139, 
in resume
   File "build/bdist.linux-x86_64/egg/setuptools/sandbox.py", line 152, 
in save_modules
   File "build/bdist.linux-x86_64/egg/setuptools/sandbox.py", line 193, 
in setup_context
   File "build/bdist.linux-x86_64/egg/setuptools/sandbox.py", line 237, 
in run_setup
   File "build/bdist.linux-x86_64/egg/setuptools/sandbox.py", line 267, 
in run
   File "build/bdist.linux-x86_64/egg/setuptools/sandbox.py", line 236, 
in runner
   File "build/bdist.linux-x86_64/egg/setuptools/sandbox.py", line 46, 
in _execfile
   File "/tmp/easy_install-4LpLp5/cryptography-1.0/setup.py", line 307, 
in <module>

   File 
"/TOPDIR/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7/distutils/core.py", 
line 111, in setup
     _setup_distribution = dist = klass(attrs)
   File "build/bdist.linux-x86_64/egg/setuptools/dist.py", line 272, in 
__init__
   File 
"/TOPDIR/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7/distutils/dist.py", 
line 287, in __init__
     self.finalize_options()
   File "build/bdist.linux-x86_64/egg/setuptools/dist.py", line 327, in 
finalize_options
   File "build/bdist.linux-x86_64/egg/pkg_resources/__init__.py", line 
2355, in load
   File "build/bdist.linux-x86_64/egg/pkg_resources/__init__.py", line 
2361, in resolve
ImportError: No module named setuptools_ext
WARNING: exit code 1 from a shell command.
ERROR: python setup.py install execution failed.

-- 
Mike Looijmans

