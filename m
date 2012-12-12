Received: from m13-70.163.com ([220.181.13.70])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <huanmateme@163.com>) id 1TicG9-0001z1-PU
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Dec 2012 03:41:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Received:Date:From:To:Subject:Content-Type:
	MIME-Version:Message-ID; bh=2Fb1uApWg2eWqZlkqSwMd4XorEQjDJzy/7Gl
	XfmH7Ec=; b=S2AXSoxCmfV6kX2Z0d0IPrISOtlauGIcK0gJcAnvHb5gwaTHG5ab
	cbrl7BkKnZDLunikcogYHNDIlybo+pwFQCUsL9a+bRC0+UuOarWjlb6LTEqfCqYm
	hjrBqoNz3PGYmw1L6mwp8bw5b9g319/+3a0QwBl1HxJKXtA6ZlwDVtw=
Received: from huanmateme$163.com ( [61.148.56.138] ) by
	ajax-webmail-wmsvr70 (Coremail) ; Wed, 12 Dec 2012 10:26:43 +0800 (CST)
X-Originating-IP: [61.148.56.138]
Date: Wed, 12 Dec 2012 10:26:43 +0800 (CST)
From: Biao <huanmateme@163.com>
To: oe-dev <openembedded-devel@lists.openembedded.org>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version SP_ntes V3.5 build
	20121210(21001.5125.5051) Copyright (c) 2002-2012 www.mailtech.cn
	163com
MIME-Version: 1.0
Message-ID: <1c1b83a7.14f97.13b8cef7c19.Coremail.huanmateme@163.com>
X-CM-TRANSID: RsGowEBJj0Jj68dQ3u0HAA--.893W
X-CM-SenderInfo: xkxd0z5dwhzvi6rwjhhfrp/1tbiUQODgE9o2GNeVQAAsG
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [OE users] Got errors when building helloworld
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
X-List-Received-Date: Wed, 12 Dec 2012 02:41:24 -0000
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: 7bit

Hi All,


I got some error when trying to build a simple helloworld, can anyone give a brief instruction on how to debug this?
BTW. I am trying hard to be OE player, If any of my email style or behavior is wrong, please give a hint or any reference resource, i will correct myself.


Thanks in advance,
Biao


zb@zb-d:~/prj/oe$ bitbake hellowold
NOTE: Out of date cache found, rebuilding...
NOTE: Handling BitBake files: / (2944/7226) [40 %]NOTE: <type 'exceptions.TypeError'>:list indices must be integers, not NoneType while evaluating:
http://projects.linuxtogo.org/frs/download.php/14/prismstumbler-0.7.4pre1.tar.gz            file://gpsapi.patch       ${@['', 'file://wireless.patch'][bb.data.getVar('PREFERRED_VERSION_linux-libc-headers', d, 1) and bb.data.getVar('PREFERRED_VERSION_linux-libc-headers', d, 1).split('.')[2] < '30']}            file://fix-includes.patch;striplevel=0            file://libgps-check.patch            file://replace-gps_query.patch            
ERROR: Error in executing: /home/zb/prj/oe/openembedded/recipes/prismstumbler/prismstumbler_0.7.3+0.7.4pre1.bb
ERROR: Exception:<type 'exceptions.TypeError'> Message:list indices must be integers, not NoneType
ERROR: Printing the environment of the function
ERROR: 0001:def __anonfunc():
ERROR: 0002:    __anon_185__home_zb_prj_oe_openembedded_classes_staging_bbclass(d)
ERROR: 0003:    __anon_90__home_zb_prj_oe_openembedded_classes_packaged_staging_bbclass(d)
ERROR: 0004:    __anon_419_classes_base_bbclass(d)
ERROR: 0005:    __anon_102__home_zb_prj_oe_openembedded_classes_siteinfo_bbclass(d)
ERROR: list indices must be integers, not NoneType while parsing /home/zb/prj/oe/openembedded/recipes/prismstumbler/prismstumbler_0.7.3+0.7.4pre1.bb
NOTE: Handling BitBake files: - (2966/7226) [41 %]NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal (<string>, line 1) while evaluating:
${@oe_filter_out('(-L\S+|-l\S+)', '-Wl,-O1 ${TARGET_LINK_HASH_STYLE}', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while parsing /home/zb/prj/oe/openembedded/recipes/uclibc/uclibc-initial_0.9.30.2.bb
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal (<string>, line 1) while evaluating:
${@oe_filter_out('(-L\S+|-l\S+)', '-Wl,-O1 ${TARGET_LINK_HASH_STYLE}', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while parsing /home/zb/prj/oe/openembedded/recipes/uclibc/uclibc_git.bb
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal (<string>, line 1) while evaluating:
${@oe_filter_out('(-L\S+|-l\S+)', '-Wl,-O1 ${TARGET_LINK_HASH_STYLE}', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while parsing /home/zb/prj/oe/openembedded/recipes/uclibc/uclibc_0.9.30.2.bb
NOTE: Handling BitBake files: \ (2972/7226) [41 %]NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal (<string>, line 1) while evaluating:
${@oe_filter_out('(-L\S+|-l\S+)', '-Wl,-O1 ${TARGET_LINK_HASH_STYLE}', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while parsing /home/zb/prj/oe/openembedded/recipes/uclibc/uclibc_0.9.30.3.bb
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal (<string>, line 1) while evaluating:
${@oe_filter_out('(-L\S+|-l\S+)', '-Wl,-O1 ${TARGET_LINK_HASH_STYLE}', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while parsing /home/zb/prj/oe/openembedded/recipes/uclibc/uclibc-initial_0.9.31.bb
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal (<string>, line 1) while evaluating:
${@oe_filter_out('(-L\S+|-l\S+)', '-Wl,-O1 ${TARGET_LINK_HASH_STYLE}', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while parsing /home/zb/prj/oe/openembedded/recipes/uclibc/uclibc-initial_git.bb
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal (<string>, line 1) while evaluating:
${@oe_filter_out('(-L\S+|-l\S+)', '-Wl,-O1 ${TARGET_LINK_HASH_STYLE}', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while parsing /home/zb/prj/oe/openembedded/recipes/uclibc/uclibc-initial_0.9.30.3.bb
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal (<string>, line 1) while evaluating:
${@oe_filter_out('(-L\S+|-l\S+)', '-Wl,-O1 ${TARGET_LINK_HASH_STYLE}', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while parsing /home/zb/prj/oe/openembedded/recipes/uclibc/uclibc_0.9.31.bb
NOTE: Handling BitBake files: \ (3287/7226) [45 %]NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal (<string>, line 1) while evaluating:
${@':'.join(uniq(os.path.normpath(os.path.join(fp, p, o)) for fp in '/home/zb/prj/oe/openembedded/recipes/angstrom'.split(':') for p in 'angstrom-version-2_${DISTRO_VERSION}-r9:angstrom-version-${DISTRO_VERSION}:angstrom-version:angstrom-version-${DISTRO_VERSION}:angstrom-version:files:.'.split(':') for o in reversed([''] + filter(None, 'pn-angstrom-version:fail-fast:build-linux:arm:INVALID:angstrom-2008.1:beagleboard:local'.split(':')))))}
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal (<string>, line 1) while evaluating:
${@patch_deps(d)}
ERROR: EOL while scanning string literal (<string>, line 1) while parsing /home/zb/prj/oe/openembedded/recipes/angstrom/angstrom-version.bb
NOTE: Handling BitBake files: \ (3677/7226) [50 %]NOTE: <class 'bb.fetch.FetchError'>:Fetch command export HOME=/home/zb; export SSH_AUTH_SOCK=/tmp/keyring-dROTKh/ssh; export PATH=/home/zb/prj/oe/build/bin:/home/zb/prj/oe/openembedded/bin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux/usr/armv7a/bin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux/usr/sbin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux/usr/bin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux/sbin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux//bin:/home/zb/prj/oe/bitbake/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games; git ls-remote git://projects.goldelico.com/gta04-kernel.git master failed with signal 128, output:
fatal: remote error: access denied or repository not exported: /gta04-kernel.git
 while evaluating:
${@bb.fetch.get_srcrev(d)}
NOTE: <class 'bb.fetch.FetchError'>:Fetch command export HOME=/home/zb; export SSH_AUTH_SOCK=/tmp/keyring-dROTKh/ssh; export PATH=/home/zb/prj/oe/build/bin:/home/zb/prj/oe/openembedded/bin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux/usr/armv7a/bin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux/usr/sbin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux/usr/bin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux/sbin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux//bin:/home/zb/prj/oe/bitbake/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games; git ls-remote git://projects.goldelico.com/gta04-kernel.git master failed with signal 128, output:
fatal: remote error: access denied or repository not exported: /gta04-kernel.git
 while evaluating:
${SRCPV}
NOTE: <class 'bb.fetch.FetchError'>:Fetch command export HOME=/home/zb; export SSH_AUTH_SOCK=/tmp/keyring-dROTKh/ssh; export PATH=/home/zb/prj/oe/build/bin:/home/zb/prj/oe/openembedded/bin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux/usr/armv7a/bin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux/usr/sbin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux/usr/bin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux/sbin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux//bin:/home/zb/prj/oe/bitbake/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games; git ls-remote git://projects.goldelico.com/gta04-kernel.git master failed with signal 128, output:
fatal: remote error: access denied or repository not exported: /gta04-kernel.git
 while evaluating:
${AUTOREV}
NOTE: <class 'bb.fetch.FetchError'>:Fetch command export HOME=/home/zb; export SSH_AUTH_SOCK=/tmp/keyring-dROTKh/ssh; export PATH=/home/zb/prj/oe/build/bin:/home/zb/prj/oe/openembedded/bin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux/usr/armv7a/bin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux/usr/sbin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux/usr/bin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux/sbin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux//bin:/home/zb/prj/oe/bitbake/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games; git ls-remote git://projects.goldelico.com/gta04-kernel.git master failed with signal 128, output:
fatal: remote error: access denied or repository not exported: /gta04-kernel.git
 while evaluating:
2.6.37+${PR}+gitr${SRCREV}
NOTE: <class 'bb.fetch.FetchError'>:Fetch command export HOME=/home/zb; export SSH_AUTH_SOCK=/tmp/keyring-dROTKh/ssh; export PATH=/home/zb/prj/oe/build/bin:/home/zb/prj/oe/openembedded/bin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux/usr/armv7a/bin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux/usr/sbin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux/usr/bin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux/sbin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux//bin:/home/zb/prj/oe/bitbake/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games; git ls-remote git://projects.goldelico.com/gta04-kernel.git master failed with signal 128, output:
fatal: remote error: access denied or repository not exported: /gta04-kernel.git
 while evaluating:
${PN}-${EXTENDPE}${PV}-${PR}
NOTE: <class 'bb.fetch.FetchError'>:Fetch command export HOME=/home/zb; export SSH_AUTH_SOCK=/tmp/keyring-dROTKh/ssh; export PATH=/home/zb/prj/oe/build/bin:/home/zb/prj/oe/openembedded/bin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux/usr/armv7a/bin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux/usr/sbin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux/usr/bin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux/sbin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux//bin:/home/zb/prj/oe/bitbake/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games; git ls-remote git://projects.goldelico.com/gta04-kernel.git master failed with signal 128, output:
fatal: remote error: access denied or repository not exported: /gta04-kernel.git
 while evaluating:
${TMPDIR}/work/${MULTIMACH_TARGET_SYS}/${PF}
NOTE: <class 'bb.fetch.FetchError'>:Fetch command export HOME=/home/zb; export SSH_AUTH_SOCK=/tmp/keyring-dROTKh/ssh; export PATH=/home/zb/prj/oe/build/bin:/home/zb/prj/oe/openembedded/bin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux/usr/armv7a/bin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux/usr/sbin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux/usr/bin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux/sbin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux//bin:/home/zb/prj/oe/bitbake/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games; git ls-remote git://projects.goldelico.com/gta04-kernel.git master failed with signal 128, output:
fatal: remote error: access denied or repository not exported: /gta04-kernel.git
 while evaluating:
${WORKDIR}/git
NOTE: <class 'bb.fetch.FetchError'>:Fetch command export HOME=/home/zb; export SSH_AUTH_SOCK=/tmp/keyring-dROTKh/ssh; export PATH=/home/zb/prj/oe/build/bin:/home/zb/prj/oe/openembedded/bin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux/usr/armv7a/bin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux/usr/sbin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux/usr/bin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux/sbin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux//bin:/home/zb/prj/oe/bitbake/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games; git ls-remote git://projects.goldelico.com/gta04-kernel.git master failed with signal 128, output:
fatal: remote error: access denied or repository not exported: /gta04-kernel.git
 while evaluating:
${S}
ERROR: Fetch command export HOME=/home/zb; export SSH_AUTH_SOCK=/tmp/keyring-dROTKh/ssh; export PATH=/home/zb/prj/oe/build/bin:/home/zb/prj/oe/openembedded/bin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux/usr/armv7a/bin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux/usr/sbin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux/usr/bin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux/sbin:/home/zb/prj/oe/tmp/sysroots/x86_64-linux//bin:/home/zb/prj/oe/bitbake/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games; git ls-remote git://projects.goldelico.com/gta04-kernel.git master failed with signal 128, output:
fatal: remote error: access denied or repository not exported: /gta04-kernel.git
 while parsing /home/zb/prj/oe/openembedded/recipes/linux/linux-gta04_git.bb
NOTE: Handling BitBake files: | (4218/7226) [58 %]ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/preboot/initramfs-preboot-image.bb
NOTE: Handling BitBake files: - (4386/7226) [60 %]ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/illume-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/dvb-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/openprotium-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/xterminal-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/twin-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/initramfs-kexecboot-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/jlime-opie.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/liveramdisk-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/james-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/minimal-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/helloworld-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/x11-office-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/fso-illume-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/beagleboard-test-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/fso-zhone-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/x11-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/opie-kdepim-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/ti-codec-engine-test-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/gtk-demo-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/beagleboard-validation-base-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/nas-server-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/native-sdk-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/micro-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/sugar-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/bootstrap-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/x11-at91sam9-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/qt4-x11-demo-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/bug-x11-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/ti-demo-x11-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/neuros-osd-base-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/initramfs-kexecboot-klibc-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/distcc-master-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/fso-image-nox.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/base-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/beagleboard-linuxtag2010-demo-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/aurora-fb-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/micro-image-visstrim.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/x11-jvm-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/sectest-gpe-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/bootmanager-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/angstrom-gnome-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/slugos-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/devimage-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/shr-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/fso2-demo-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/fso-image-light.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/fso-paroli-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/console-audio-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/nslu2-base-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/qt4-x11-base-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/angstrom-gnome-image-big.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/console-mipv6-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/imote2-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/console-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/opie-image-16mb.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/sdl-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/gpephone-image-vm.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/x11-gpe-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/slugos-extd-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/muffinman-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/angstrom-systemd-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/fso-console-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/opie-xqtlauncher-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/micro-base-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/xfce-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/mythfront-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/udumpty-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/x11-pimlico-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/jalimo-beagleboard-demo-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/xorg-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/beagleboard-validation-gnome-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/gateway-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/gpe-image-blank-user.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/console-base-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/bug-image-production.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/minimal-gpe-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/initramfs-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/beagleboard-demo-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/qt4e-base-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/e-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/uml-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/bootstrap-image-bootchart.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/opie-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/beagleboard-nand-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/e-image-core.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/shr-lite-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/qt4e-demo-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/gpephone-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/bug-ramdisk.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/fso2-console-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/x11-sato2-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/gpe-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/pivotboot-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/x11-sato-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/initramfs-bootmenu-debug-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/mokogateway-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/gnuradio-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/sdr-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/initramfs-minimal-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/minimal-image-with-mtd-utils.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/distcc-slave-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/xfce46-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/angstrom-x-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/console-at91sam9-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/beagleboard-validation-e17-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/nslu2-linksys-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/x11-at91sam9m10-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/x11-gpe-java-image.bb
ERROR: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass while parsing /home/zb/prj/oe/openembedded/recipes/images/initramfs-bootmenu-image.bb
NOTE: Handling BitBake files: / (4999/7226) [69 %]NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal (<string>, line 1) while evaluating:
${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "${PREFERRED_PROVIDER_virtual/update-alternatives}", d)}
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal (<string>, line 1) while evaluating:
    base-files     base-passwd     busybox     ${@base_contains("MACHINE_FEATURES", "keyboard", "keymaps", "", d)}     modutils-initscripts     netbase     ${DISTRO_UPDATE_ALTERNATIVES}     ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS}     
ERROR: EOL while scanning string literal (<string>, line 1) while parsing /home/zb/prj/oe/openembedded/recipes/tasks/task-boot.bb
NOTE: Handling BitBake files: \ (6159/7226) [85 %]ERROR: SRCREV was used yet no valid SCM was found in SRC_URI
NOTE: <class 'bb.fetch.ParameterError'>: while evaluating:
${@bb.fetch.get_srcrev(d)}
NOTE: <class 'bb.fetch.ParameterError'>: while evaluating:
1.1.0+hgr${SRCPV}
NOTE: <class 'bb.fetch.ParameterError'>: while evaluating:
${PN}-${EXTENDPE}${PV}-${PR}
NOTE: <class 'bb.fetch.ParameterError'>: while evaluating:
${TMPDIR}/work/${MULTIMACH_TARGET_SYS}/${PF}
NOTE: <class 'bb.fetch.ParameterError'>: while evaluating:
${WORKDIR}/cacao
NOTE: <class 'bb.fetch.ParameterError'>: while evaluating:
${S}
ERROR:  while parsing /home/zb/prj/oe/openembedded/recipes/cacao/cacao-native_hg.bb
NOTE: Handling BitBake files: \ (7226/7226) [100 %]
NOTE: Parsing finished. 0 cached, 6825 parsed, 278 skipped, 0 masked.
ERROR: Parsing errors found, exiting...


