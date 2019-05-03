Return-Path: <parthitce@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0F7F46BC88
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 May 2019 08:32:26 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c12so6716583wrt.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 May 2019 01:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=3JwWr49VXmRy2JrhCujWKSomZHq/U+MZEfGJ9r5lfqU=;
	b=ZN83cXaQpDIGMCLF7+CA1NX+ZDXlxNT79ORBMzwD8LZVQLekv5T94t+gjQHIdfHHmw
	SNn+UXr1yMG/UhgtB1f/QD6WAMCgDz0uathKQ6aL7CQ+yPrd3fbzlc6qLW8Q+lWKTW8H
	oivbzDg14+hmngyPQiVCoObkF61Fm2Rl86fdnvJCbS0CRateRrmf4GyY6pE9bcLNXlLP
	y/21fpRYJdc87JS/5unaZOXuQOYpo0U/NSS1bwRr7S1i638WkrZklQFexEvYKRagDZdN
	w7otNc0lblVXDqIOhQ3yhg/FQCOUYHVjsUoZ33Vtv2hm3whaSFMt+nDehB/5eWX8UK0Q
	FI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=3JwWr49VXmRy2JrhCujWKSomZHq/U+MZEfGJ9r5lfqU=;
	b=O+eE0RM16IWunxBwgtMfvQTAOftTGwI9b4dyp81wrRdYUWKFqgF6dgvkhm2wo9LTH1
	3DPhXLP7dIzqGwBgAQoaif4hPkVab3tqSYrMcg9QWblF2aRBdKy7kMTs/tNK+SWMY0NV
	P7dvFTYYmMSXcsFhppC4x2qbz6RYj732fLWtuS9CLZwHK8KMME/PqByqwbQNYsSPuRSP
	i78uJ/mf0IWLIqYB7hMI8qA03up+VisSxve8HppBEpA8PGZlK0SlG1X9YKkEuERiwyf7
	m8JaPhvNema/YeLbyGjAUulaB/eB3dfXE9HEO9E1OgRp/4VP5u+a1SLrkE6/n/IgJzUQ
	hPGQ==
X-Gm-Message-State: APjAAAUyZy66IF+FUgnD+AfuVsQ2N+W0xfQlUDZBi8doV7EaGLNx+iQK
	lf7tZXa5nGkbIdUnQtKZ7w==
X-Google-Smtp-Source: APXvYqyiKTakAFXigFO6VH0V+Mbg1YFMz/792CewTsTQfRZwchSKLGXY9nS3xR+qRwOJq/QFeY0IfA==
X-Received: by 2002:a5d:420c:: with SMTP id n12mr783142wrq.321.1556872347531; 
	Fri, 03 May 2019 01:32:27 -0700 (PDT)
Received: from antares.denx.de ([62.91.23.180])
	by smtp.gmail.com with ESMTPSA id
	b10sm2747035wme.25.2019.05.03.01.32.25
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 May 2019 01:32:26 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <9ede5b50-8c4f-eaaf-8d8b-74d688ef5a4f@gmail.com>
	<CAMKF1sq4HaU8hELGqPPLgw+dBrv_J3RfCkaW5nRx76UWoGH_uQ@mail.gmail.com>
From: Parthiban Nallathambi <parthitce@gmail.com>
Message-ID: <1eb730dd-b240-5d41-e8c1-492dff13fec1@gmail.com>
Date: Fri, 3 May 2019 10:32:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sq4HaU8hELGqPPLgw+dBrv_J3RfCkaW5nRx76UWoGH_uQ@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Parthiban <parthitce@gmail.com>
Subject: Re: python3-tinydb: Install failure
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
X-List-Received-Date: Fri, 03 May 2019 08:32:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hello Khem,

On 5/2/19 11:07 PM, Khem Raj wrote:
> On Wed, May 1, 2019 at 10:36 AM Parthiban <parthitce@gmail.com> wrote:
>>
>> Hello All,
>>
>> I am trying to compile the python3-tinydb and the compilation is successful, but install
>> fails with below error,
>>
>> *| ModuleNotFoundError: No module named '_sysconfigdata'*
>>
>> I could fix this error by copying,
>>
>> cp ./recipe-sysroot-native/usr/lib/python-sysconfigdata/_sysconfigdata.py recipe-sysroot-native/usr/lib/python3.7/
>>
> 
> this should be done via do_install to move this file into
> ${D}${libdir}/${PYTHON_DIR}

Do you meant to fix this in python3_3.7.2.bb by copying it?

Thanks,
Parthiban N
> 
>> But not sure the way to fix it in build environment and not sure about the proper
>> way to make this module visible during build.
>>
>> Thanks,
>> Parthiban N
>>
>> *Full error log:*
>> ERROR: python3-tinydb-3.13.0-r0 do_install: 'python3 setup.py install --root=/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3-tinydb/3.13.0-r0/image     --prefix=/usr     --install-lib=/usr/lib/python3.7/site-packages     --install-data=/usr/share' execution failed.
>> ERROR: python3-tinydb-3.13.0-r0 do_install: Function failed: do_install (log file is located at /work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3-tinydb/3.13.0-r0/temp/log.do_install.3000311)
>> ERROR: Logfile of failure stored in: /work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3-tinydb/3.13.0-r0/temp/log.do_install.3000311
>> Log data follows:
>> | DEBUG: Executing python function extend_recipe_sysroot
>> | NOTE: Direct dependencies are ['virtual:native:/work/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', '/work/meta/recipes-core/glibc/glibc_2.29.bb:do_populate_sysroot', 'virtual:native:/work/meta/recipes-devtools/python/python3_3.7.2.bb:do_populate_sysroot', 'virtual:native:/work/meta-openembedded/meta-python/recipes-devtools/python/python3-pytest-runner_4.2.bb:do_populate_sysroot', '/work/meta/recipes-devtools/gcc/gcc-runtime_8.3.bb:do_populate_sysroot', '/work/meta/recipes-devtools/gcc/gcc-cross_8.3.bb:do_populate_sysroot', '/work/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_populate_sysroot']
>> | NOTE: Installed into sysroot: []
>> | NOTE: Skipping as already exists in sysroot: ['pseudo-native', 'glibc', 'python3-native', 'python3-pytest-runner-native', 'gcc-runtime', 'gcc-cross-arm', 'quilt-native', 'python3-setuptools-native', 'python3-py-native', 'python3-setuptools-scm-native', 'linux-libc-headers', 'gdbm-native', 'xz-native', 'sqlite3-native', 'util-linux-native', 'automake-native', 'autoconf-native', 'pkgconfig-native', 'libffi-native', 'libtirpc-native', 'readline-native', 'gnu-config-native', 'openssl-native', 'libtool-native', 'libnsl2-native', 'zlib-native', 'bzip2-native', 'libgcc', 'binutils-cross-arm', 'texinfo-dummy-native', 'libmpc-native', 'mpfr-native', 'flex-native', 'gmp-native', 'unzip-native', 'gettext-minimal-native', 'ncurses-native', 'm4-native']
>> | DEBUG: Python function extend_recipe_sysroot finished
>> | DEBUG: Executing shell function do_install
>> | running install
>> | Traceback (most recent call last):
>> |   File "setup.py", line 59, in <module>
>> |     long_description=read('README.rst'),
>> |   File "/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3-tinydb/3.13.0-r0/recipe-sysroot-native/usr/lib/python3.7/site-packages/setuptools/__init__.py", line 145, in setup
>> |     return distutils.core.setup(**attrs)
>> |   File "/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3-tinydb/3.13.0-r0/recipe-sysroot-native/usr/lib/python3.7/distutils/core.py", line 148, in setup
>> |     dist.run_commands()
>> |   File "/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3-tinydb/3.13.0-r0/recipe-sysroot-native/usr/lib/python3.7/distutils/dist.py", line 966, in run_commands
>> |     self.run_command(cmd)
>> |   File "/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3-tinydb/3.13.0-r0/recipe-sysroot-native/usr/lib/python3.7/distutils/dist.py", line 984, in run_command
>> |     cmd_obj.ensure_finalized()
>> |   File "/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3-tinydb/3.13.0-r0/recipe-sysroot-native/usr/lib/python3.7/distutils/cmd.py", line 107, in ensure_finalized
>> |     self.finalize_options()
>> |   File "/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3-tinydb/3.13.0-r0/recipe-sysroot-native/usr/lib/python3.7/site-packages/setuptools/command/install.py", line 38, in finalize_options
>> |     orig.install.finalize_options(self)
>> |   File "/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3-tinydb/3.13.0-r0/recipe-sysroot-native/usr/lib/python3.7/distutils/command/install.py", line 284, in finalize_options
>> |     (prefix, exec_prefix) = get_config_vars('prefix', 'exec_prefix')
>> |   File "/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3-tinydb/3.13.0-r0/recipe-sysroot-native/usr/lib/python3.7/distutils/sysconfig.py", line 472, in get_config_vars
>> |     func()
>> |   File "/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3-tinydb/3.13.0-r0/recipe-sysroot-native/usr/lib/python3.7/distutils/sysconfig.py", line 432, in _init_posix
>> |     _temp = __import__(name, globals(), locals(), ['build_time_vars'], 0)
>> | ModuleNotFoundError: No module named '_sysconfigdata'
>> | ERROR: 'python3 setup.py install --root=/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3-tinydb/3.13.0-r0/image     --prefix=/usr     --install-lib=/usr/lib/python3.7/site-packages     --install-data=/usr/share' execution failed.
>> | WARNING: /work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3-tinydb/3.13.0-r0/temp/run.do_install.3000311:1 exit 1 from 'exit 1'
>> | ERROR: Function failed: do_install (log file is located at /work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3-tinydb/3.13.0-r0/temp/log.do_install.3000311)
>> ERROR: Task (/work/meta-openembedded/meta-python/recipes-devtools/python/python3-tinydb_3.13.0.bb:do_install) failed with exit code '1'
>> NOTE: Tasks Summary: Attempted 920 tasks of which 919 didn't need to be rerun and 1 failed.
>>
>> Summary: 1 task failed:
>>    /work/meta-openembedded/meta-python/recipes-devtools/python/python3-tinydb_3.13.0.bb:do_install
>> Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

