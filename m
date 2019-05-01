Return-Path: <parthitce@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 981897D901
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 May 2019 17:36:37 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id h4so25369002wre.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 May 2019 10:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:cc:from:subject:message-id:date:user-agent:mime-version
	:content-language:content-transfer-encoding;
	bh=wm/kmZFjS+RKa7JCuwITXr/7uwJehJQnwbXLD6711o0=;
	b=LLBQh7Ko3nSfwI4ViBKkFEFujQvEw7Q+C2UuE/cbFggfy8m7MwEo2Dghgbna/Lgrbv
	CK389wV/j8g2sKHbl64BinzftFUgUDAJjuCHDD87gM7b99/u29C453lZ3ZdNKkJBItRo
	tSaDFIWoTXjqsckVXQfUhuO6r/KLcas4y6cEZNRhJsEbjGfe/wppstHPAt8Lp6eFoNxU
	qTKg/ic/Hc7Rj04j/nHXGPjQHSErlSksvMrovF8nRbnVkxLGRll4FXfGLMXrv/9i44zg
	ywOStOAL5CcOyU9t4k9OHbCtIC0QlrMV0bGZY/vXqGfYpDkYmtNnMnjqAndZkHCNbwOZ
	Rx8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=wm/kmZFjS+RKa7JCuwITXr/7uwJehJQnwbXLD6711o0=;
	b=VbZtOnGAGG/5p05XIycAtcvrxr33WNqhLQbip9JsmaSzmkVlSJkogQK7sDyrGESLXN
	jUReP1ORB0GOWZA7n5tgmYksyZ4HTJLFzZrUDbKBV9dmc1LpmkTa///yW7F6pYJTSSHq
	e0FQLJElORC8oE5iklvbvPAebJd2U8dE4xDIHl5NWaCpchlGjAft7zuicx6LS/AvP5v1
	5kDXfyFZNOZWJXWCks+xkrDsSB2gG4X94Pofyt9FFyg8TdI7su+N1zyQlXk9fex0l2e5
	M2Q7bYaEqE163oHGI5AMbY68wLmAChQBQSVZX8THKKw4s+BjGU9JFyA/7YxoMWhfRX63
	xLYA==
X-Gm-Message-State: APjAAAUg1NNpsSQgAeS0t9Q1xXBP4BuqrkJq0AqKvOqdYb5V3u/xfuuN
	junhBw/2A57+8vetmEUm6A==
X-Google-Smtp-Source: APXvYqzL8UcNCdt2Ip2K2etsZDUod9Tx0BfT9HLKUx6fWJGqeehGi/CL3mGgaijiBdBhDaDTKCGz8Q==
X-Received: by 2002:a5d:5108:: with SMTP id s8mr44682523wrt.99.1556732198112; 
	Wed, 01 May 2019 10:36:38 -0700 (PDT)
Received: from [192.168.178.26] ([62.91.105.64])
	by smtp.gmail.com with ESMTPSA id u9sm1883234wmd.14.2019.05.01.10.36.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 May 2019 10:36:37 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
From: Parthiban <parthitce@gmail.com>
Message-ID: <9ede5b50-8c4f-eaaf-8d8b-74d688ef5a4f@gmail.com>
Date: Wed, 1 May 2019 19:36:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
Cc: Parthiban <parthitce@gmail.com>
Subject: python3-tinydb: Install failure
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 May 2019 17:36:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hello All,

I am trying to compile the python3-tinydb and the compilation is successful, but install
fails with below error,

*| ModuleNotFoundError: No module named '_sysconfigdata'*

I could fix this error by copying,

cp ./recipe-sysroot-native/usr/lib/python-sysconfigdata/_sysconfigdata.py recipe-sysroot-native/usr/lib/python3.7/

But not sure the way to fix it in build environment and not sure about the proper
way to make this module visible during build.

Thanks,
Parthiban N

*Full error log:*
ERROR: python3-tinydb-3.13.0-r0 do_install: 'python3 setup.py install --root=/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3-tinydb/3.13.0-r0/image     --prefix=/usr     --install-lib=/usr/lib/python3.7/site-packages     --install-data=/usr/share' execution failed.
ERROR: python3-tinydb-3.13.0-r0 do_install: Function failed: do_install (log file is located at /work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3-tinydb/3.13.0-r0/temp/log.do_install.3000311)
ERROR: Logfile of failure stored in: /work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3-tinydb/3.13.0-r0/temp/log.do_install.3000311
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['virtual:native:/work/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', '/work/meta/recipes-core/glibc/glibc_2.29.bb:do_populate_sysroot', 'virtual:native:/work/meta/recipes-devtools/python/python3_3.7.2.bb:do_populate_sysroot', 'virtual:native:/work/meta-openembedded/meta-python/recipes-devtools/python/python3-pytest-runner_4.2.bb:do_populate_sysroot', '/work/meta/recipes-devtools/gcc/gcc-runtime_8.3.bb:do_populate_sysroot', '/work/meta/recipes-devtools/gcc/gcc-cross_8.3.bb:do_populate_sysroot', '/work/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['pseudo-native', 'glibc', 'python3-native', 'python3-pytest-runner-native', 'gcc-runtime', 'gcc-cross-arm', 'quilt-native', 'python3-setuptools-native', 'python3-py-native', 'python3-setuptools-scm-native', 'linux-libc-headers', 'gdbm-native', 'xz-native', 'sqlite3-native', 'util-linux-native', 'automake-native', 'autoconf-native', 'pkgconfig-native', 'libffi-native', 'libtirpc-native', 'readline-native', 'gnu-config-native', 'openssl-native', 'libtool-native', 'libnsl2-native', 'zlib-native', 'bzip2-native', 'libgcc', 'binutils-cross-arm', 'texinfo-dummy-native', 'libmpc-native', 'mpfr-native', 'flex-native', 'gmp-native', 'unzip-native', 'gettext-minimal-native', 'ncurses-native', 'm4-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_install
| running install
| Traceback (most recent call last):
|   File "setup.py", line 59, in <module>
|     long_description=read('README.rst'),
|   File "/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3-tinydb/3.13.0-r0/recipe-sysroot-native/usr/lib/python3.7/site-packages/setuptools/__init__.py", line 145, in setup
|     return distutils.core.setup(**attrs)
|   File "/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3-tinydb/3.13.0-r0/recipe-sysroot-native/usr/lib/python3.7/distutils/core.py", line 148, in setup
|     dist.run_commands()
|   File "/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3-tinydb/3.13.0-r0/recipe-sysroot-native/usr/lib/python3.7/distutils/dist.py", line 966, in run_commands
|     self.run_command(cmd)
|   File "/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3-tinydb/3.13.0-r0/recipe-sysroot-native/usr/lib/python3.7/distutils/dist.py", line 984, in run_command
|     cmd_obj.ensure_finalized()
|   File "/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3-tinydb/3.13.0-r0/recipe-sysroot-native/usr/lib/python3.7/distutils/cmd.py", line 107, in ensure_finalized
|     self.finalize_options()
|   File "/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3-tinydb/3.13.0-r0/recipe-sysroot-native/usr/lib/python3.7/site-packages/setuptools/command/install.py", line 38, in finalize_options
|     orig.install.finalize_options(self)
|   File "/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3-tinydb/3.13.0-r0/recipe-sysroot-native/usr/lib/python3.7/distutils/command/install.py", line 284, in finalize_options
|     (prefix, exec_prefix) = get_config_vars('prefix', 'exec_prefix')
|   File "/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3-tinydb/3.13.0-r0/recipe-sysroot-native/usr/lib/python3.7/distutils/sysconfig.py", line 472, in get_config_vars
|     func()
|   File "/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3-tinydb/3.13.0-r0/recipe-sysroot-native/usr/lib/python3.7/distutils/sysconfig.py", line 432, in _init_posix
|     _temp = __import__(name, globals(), locals(), ['build_time_vars'], 0)
| ModuleNotFoundError: No module named '_sysconfigdata'
| ERROR: 'python3 setup.py install --root=/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3-tinydb/3.13.0-r0/image     --prefix=/usr     --install-lib=/usr/lib/python3.7/site-packages     --install-data=/usr/share' execution failed.
| WARNING: /work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3-tinydb/3.13.0-r0/temp/run.do_install.3000311:1 exit 1 from 'exit 1'
| ERROR: Function failed: do_install (log file is located at /work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3-tinydb/3.13.0-r0/temp/log.do_install.3000311)
ERROR: Task (/work/meta-openembedded/meta-python/recipes-devtools/python/python3-tinydb_3.13.0.bb:do_install) failed with exit code '1'
NOTE: Tasks Summary: Attempted 920 tasks of which 919 didn't need to be rerun and 1 failed.

Summary: 1 task failed:
  /work/meta-openembedded/meta-python/recipes-devtools/python/python3-tinydb_3.13.0.bb:do_install
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

