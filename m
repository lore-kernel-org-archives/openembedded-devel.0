Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay@jay-tech.ru>) id 1PHwaW-0002kL-EF
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Nov 2010 11:47:43 +0100
Received: by ewy24 with SMTP id 24so2462909ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Nov 2010 02:46:02 -0800 (PST)
Received: by 10.213.28.14 with SMTP id k14mr647006ebc.87.1289817962159;
	Mon, 15 Nov 2010 02:46:02 -0800 (PST)
Received: from mozart.localnet (93-81-138-51.broadband.corbina.ru
	[93.81.138.51])
	by mx.google.com with ESMTPS id v56sm6488171eeh.8.2010.11.15.02.46.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 15 Nov 2010 02:46:01 -0800 (PST)
Sender: Yury Bushmelev <jay@jay-tech.ru>
MIME-Version: 1.0
Received: by 10.220.95.74 with HTTP; Mon, 15 Nov 2010 02:37:58 -0800 (PST)
X-Originating-IP: [93.81.138.51]
Date: Mon, 15 Nov 2010 13:45:58 +0300
Message-Id: <201011151345.58456.jay4mail@gmail.com>
From: Yuri Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Length: 17478
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: jay@jay-tech.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL,
	WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [testing-next] race condition on incremental build of tosa opie-image
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
X-List-Received-Date: Mon, 15 Nov 2010 10:47:44 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hello!

There are results from tonight's testbuilder run on current testing-next.

I have following fail when doing _incremental_ test build of
angstrom-2008.1/tosa/opie-image. Clean build was fine.
Bitbake version: git master, OE version: testing-next.
bb threads: 5, make threads: 2

Bad thing is that error log on tinderbox is totally unuseful.
Build stats:
http://tinderbox.openembedded.net/builds/103097/
Log:
http://tinderbox.openembedded.net/public/logs/task/10153584.txt

Note tasks order in following log. It looks like race condition.

NOTE: package libqtaux2-1.2.4-r2.0: task do_setscene: Succeeded
[...]
| OSError: [Errno 2] No such file or directory: '/storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/armv5te/libqtaux2-1_1.2.4-
r0.6_armv5te.ipk'
[...]
NOTE: Running task 6770 of 6932 (ID: 3421, /storage/oe/testbuilder/openembedded/recipes/libqtaux/libqtaux2_1.2.4.bb, do_fetch)

I have untouched build directory as well as lvm snapshot of this
volume before build, so I can even try to reproduce error.


Log starting here (please do not quote on reply):
-- 
NOTE: Running task 4162 of 6932 (ID: 3423, /storage/oe/testbuilder/openembedded/recipes/libqtaux/libqtaux2_1.2.4.bb, do_setscene)
NOTE: package libqtaux2-1.2.4-r2.0: task do_setscene: Started
NOTE: package libqtaux2-1.2.4-r2.0: task do_setscene: Succeeded
ERROR: Task 2635 (/storage/oe/testbuilder/openembedded/recipes/images/initramfs-kexecboot-klibc-image.bb, do_package_update_index_ipk) 
failed with exit code '1'
NOTE: Running task 4153 of 6932 (ID: 2635, /storage/oe/testbuilder/openembedded/recipes/images/initramfs-kexecboot-klibc-image.bb, 
do_package_update_index_ipk)
NOTE: package initramfs-kexecboot-klibc-image-1.0-r0: task do_package_update_index_ipk: Started
NOTE: Running task 6769 of 6932 (ID: 10, /storage/oe/testbuilder/openembedded/recipes/images/opie-image.bb, do_setscene)
NOTE: package opie-image-1.0-r0: task do_setscene: Started
NOTE: oestats: task failed, see http://tinderbox.openembedded.net/public/logs/task/10153584.txt
ERROR: Logfile of failure stored in: /storage/oe/testbuilder/build/angstrom_2008/armv5/work/tosa-angstrom-linux-gnueabi/initramfs-kexecboot-
klibc-image-1.0-r0/temp/log.do_package_update_index_ipk.2868
Log data follows:
| + ipkgarchs='all any noarch arm  armv4 armv4t armv5te tosa'
| + '[' '!' -z '' ']'
| + mkdir -p /storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk
| + touch /storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/Packages
| + ipkg-make-index -r /storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/Packages -p 
/storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/Packages -l 
/storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/Packages.filelist -m 
/storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk
| /storage/oe/testbuilder/build/angstrom_2008/armv5/sysroots/x86_64-linux/usr/bin/ipkg.py:39: DeprecationWarning: the md5 module is 
deprecated; use hashlib instead
|   import md5
| 
| + for arch in '$ipkgarchs'
| + '[' -e /storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/all/ ']'
| + touch /storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/all/Packages
| + ipkg-make-index -r /storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/all/Packages -p 
/storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/all/Packages -l 
/storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/all/Packages.filelist -m 
/storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/all/
| /storage/oe/testbuilder/build/angstrom_2008/armv5/sysroots/x86_64-linux/usr/bin/ipkg.py:39: DeprecationWarning: the md5 module is 
deprecated; use hashlib instead
|   import md5
| 
| + '[' -e /storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/x86_64-all-sdk/ ']'
| + '[' -e /storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/x86_64-linux-sdk-all/ ']'
| + for arch in '$ipkgarchs'
| + '[' -e /storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/any/ ']'
| + '[' -e /storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/x86_64-any-sdk/ ']'
| + '[' -e /storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/x86_64-linux-sdk-any/ ']'
| + for arch in '$ipkgarchs'
| + '[' -e /storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/noarch/ ']'
| + '[' -e /storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/x86_64-noarch-sdk/ ']'
| + '[' -e /storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/x86_64-linux-sdk-noarch/ ']'
| + for arch in '$ipkgarchs'
| + '[' -e /storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/arm/ ']'
| + '[' -e /storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/x86_64-arm-sdk/ ']'
| + '[' -e /storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/x86_64-linux-sdk-arm/ ']'
| + for arch in '$ipkgarchs'
| + '[' -e /storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/armv4/ ']'
| + '[' -e /storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/x86_64-armv4-sdk/ ']'
| + '[' -e /storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/x86_64-linux-sdk-armv4/ ']'
| + for arch in '$ipkgarchs'
| + '[' -e /storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/armv4t/ ']'
| + '[' -e /storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/x86_64-armv4t-sdk/ ']'
| + '[' -e /storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/x86_64-linux-sdk-armv4t/ ']'
| + for arch in '$ipkgarchs'
| + '[' -e /storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/armv5te/ ']'
| + touch /storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/armv5te/Packages
| + ipkg-make-index -r /storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/armv5te/Packages -p 
/storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/armv5te/Packages -l 
/storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/armv5te/Packages.filelist -m 
/storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/armv5te/
| /storage/oe/testbuilder/build/angstrom_2008/armv5/sysroots/x86_64-linux/usr/bin/ipkg.py:39: DeprecationWarning: the md5 module is 
deprecated; use hashlib instead
|   import md5
| Traceback (most recent call last):
|   File "/storage/oe/testbuilder/build/angstrom_2008/armv5/sysroots/x86_64-linux/usr/bin/ipkg-make-index", line 102, in <module>
|     fnameStat = os.stat(filename)
| OSError: [Errno 2] No such file or directory: '/storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/armv5te/libqtaux2-1_1.2.4-
r0.6_armv5te.ipk'
NOTE: package initramfs-kexecboot-klibc-image-1.0-r0: task do_package_update_index_ipk: Failed
ERROR: Function 'do_package_update_index_ipk' failed (see /storage/oe/testbuilder/build/angstrom_2008/armv5/work/tosa-angstrom-linux-
gnueabi/initramfs-kexecboot-klibc-image-1.0-r0/temp/log.do_package_update_index_ipk.2868 for further information)
NOTE: Running task 6770 of 6932 (ID: 3421, /storage/oe/testbuilder/openembedded/recipes/libqtaux/libqtaux2_1.2.4.bb, do_fetch)
NOTE: package libqtaux2-1.2.4-r2.0: task do_fetch: Started
NOTE: package opie-image-1.0-r0: task do_setscene: Succeeded
NOTE: package libqtaux2-1.2.4-r2.0: task do_fetch: Succeeded
NOTE: Running task 6771 of 6932 (ID: 8, /storage/oe/testbuilder/openembedded/recipes/images/opie-image.bb, do_fetch)
NOTE: package opie-image-1.0-r0: task do_fetch: Started
NOTE: Running task 6772 of 6932 (ID: 3413, /storage/oe/testbuilder/openembedded/recipes/libqtaux/libqtaux2_1.2.4.bb, do_unpack)
NOTE: package libqtaux2-1.2.4-r2.0: task do_unpack: Started
NOTE: Running task 6773 of 6932 (ID: 3428, /storage/oe/testbuilder/openembedded/recipes/libqtaux/libqtaux2_1.2.4.bb, do_distribute_sources)
NOTE: package libqtaux2-1.2.4-r2.0: task do_distribute_sources: Started
NOTE: Unpacking ../sources/opie.libqtaux_anoncvs.handhelds.org_v1_2_4_.tar.gz to build/angstrom_2008/armv5/work/armv5te-angstrom-linux-
gnueabi/libqtaux2-1.2.4-r2.0/
NOTE: package opie-image-1.0-r0: task do_fetch: Succeeded
NOTE: package libqtaux2-1.2.4-r2.0: task do_unpack: Succeeded
NOTE: package libqtaux2-1.2.4-r2.0: task do_distribute_sources: Succeeded
NOTE: Running task 6774 of 6932 (ID: 0, /storage/oe/testbuilder/openembedded/recipes/images/opie-image.bb, do_unpack)
NOTE: package opie-image-1.0-r0: task do_unpack: Started
NOTE: Running task 6775 of 6932 (ID: 16, /storage/oe/testbuilder/openembedded/recipes/images/opie-image.bb, do_distribute_sources)
NOTE: package opie-image-1.0-r0: task do_distribute_sources: Started
NOTE: Unpacking openembedded/recipes/images/opie-image.bb to build/angstrom_2008/armv5/work/tosa-angstrom-linux-gnueabi/opie-image-1.0-
r0/
NOTE: Running task 6776 of 6932 (ID: 3414, /storage/oe/testbuilder/openembedded/recipes/libqtaux/libqtaux2_1.2.4.bb, do_patch)
NOTE: package libqtaux2-1.2.4-r2.0: task do_patch: Started
NOTE: package opie-image-1.0-r0: task do_unpack: Succeeded
NOTE: package libqtaux2-1.2.4-r2.0: task do_patch: Succeeded
NOTE: Running task 6777 of 6932 (ID: 1, /storage/oe/testbuilder/openembedded/recipes/images/opie-image.bb, do_patch)
NOTE: package opie-image-1.0-r0: task do_patch: Started
NOTE: Running task 6778 of 6932 (ID: 3424, /storage/oe/testbuilder/openembedded/recipes/libqtaux/libqtaux2_1.2.4.bb, do_configure)
NOTE: package libqtaux2-1.2.4-r2.0: task do_configure: Started
NOTE: package opie-image-1.0-r0: task do_distribute_sources: Succeeded
NOTE: package opie-image-1.0-r0: task do_patch: Succeeded
NOTE: package libqtaux2-1.2.4-r2.0: task do_configure: Succeeded
NOTE: Running task 6779 of 6932 (ID: 11, /storage/oe/testbuilder/openembedded/recipes/images/opie-image.bb, do_configure)
NOTE: package opie-image-1.0-r0: task do_configure: Started
NOTE: Running task 6780 of 6932 (ID: 3425, /storage/oe/testbuilder/openembedded/recipes/libqtaux/libqtaux2_1.2.4.bb, do_qa_configure)
NOTE: package libqtaux2-1.2.4-r2.0: task do_qa_configure: Started
NOTE: package opie-image-1.0-r0: task do_configure: Succeeded
NOTE: package libqtaux2-1.2.4-r2.0: task do_qa_configure: Succeeded
NOTE: Running task 6781 of 6932 (ID: 12, /storage/oe/testbuilder/openembedded/recipes/images/opie-image.bb, do_qa_configure)
NOTE: package opie-image-1.0-r0: task do_qa_configure: Started
NOTE: Running task 6782 of 6932 (ID: 3426, /storage/oe/testbuilder/openembedded/recipes/libqtaux/libqtaux2_1.2.4.bb, do_compile)
NOTE: package libqtaux2-1.2.4-r2.0: task do_compile: Started
NOTE: package opie-image-1.0-r0: task do_qa_configure: Succeeded
NOTE: Running task 6783 of 6932 (ID: 13, /storage/oe/testbuilder/openembedded/recipes/images/opie-image.bb, do_compile)
NOTE: package opie-image-1.0-r0: task do_compile: Started
NOTE: package opie-image-1.0-r0: task do_compile: Succeeded
NOTE: Running task 6784 of 6932 (ID: 2, /storage/oe/testbuilder/openembedded/recipes/images/opie-image.bb, do_install)
NOTE: package opie-image-1.0-r0: task do_install: Started
NOTE: package libqtaux2-1.2.4-r2.0: task do_compile: Succeeded
NOTE: package opie-image-1.0-r0: task do_install: Succeeded
NOTE: Running task 6785 of 6932 (ID: 3415, /storage/oe/testbuilder/openembedded/recipes/libqtaux/libqtaux2_1.2.4.bb, do_install)
NOTE: package libqtaux2-1.2.4-r2.0: task do_install: Started
NOTE: Running task 6786 of 6932 (ID: 3430, /storage/oe/testbuilder/openembedded/recipes/libqtaux/libqtaux2_1.2.4.bb, do_opie_install)
NOTE: package libqtaux2-1.2.4-r2.0: task do_opie_install: Started
NOTE: Running task 6787 of 6932 (ID: 15, /storage/oe/testbuilder/openembedded/recipes/images/opie-image.bb, do_package)
NOTE: package opie-image-1.0-r0: task do_package: Started
NOTE: Section = Base or Libs. Target won't be installed automatically.
NOTE: Running task 6788 of 6932 (ID: 3, /storage/oe/testbuilder/openembedded/recipes/images/opie-image.bb, do_populate_sysroot)
NOTE: package opie-image-1.0-r0: task do_populate_sysroot: Started
NOTE: package libqtaux2-1.2.4-r2.0: task do_opie_install: Succeeded
NOTE: package libqtaux2-1.2.4-r2.0: task do_install: Succeeded
NOTE: package opie-image-1.0-r0: task do_package: Succeeded
NOTE: package opie-image-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 6789 of 6932 (ID: 3416, /storage/oe/testbuilder/openembedded/recipes/libqtaux/libqtaux2_1.2.4.bb, do_populate_sysroot)
NOTE: package libqtaux2-1.2.4-r2.0: task do_populate_sysroot: Started
NOTE: Running task 6790 of 6932 (ID: 3427, /storage/oe/testbuilder/openembedded/recipes/libqtaux/libqtaux2_1.2.4.bb, do_package)
NOTE: package libqtaux2-1.2.4-r2.0: task do_package: Started
NOTE: Running task 6791 of 6932 (ID: 19, /storage/oe/testbuilder/openembedded/recipes/images/opie-image.bb, do_package_write_ipk)
NOTE: package opie-image-1.0-r0: task do_package_write_ipk: Started
NOTE: Running task 6792 of 6932 (ID: 4, /storage/oe/testbuilder/openembedded/recipes/images/opie-image.bb, do_qa_staging)
NOTE: package opie-image-1.0-r0: task do_qa_staging: Started
NOTE: package libqtaux2-1.2.4-r2.0: task do_populate_sysroot: Succeeded
NOTE: package opie-image-1.0-r0: task do_package_write_ipk: Succeeded
NOTE: package libqtaux2-1.2.4-r2.0: task do_package: Succeeded
NOTE: Running task 6793 of 6932 (ID: 3417, /storage/oe/testbuilder/openembedded/recipes/libqtaux/libqtaux2_1.2.4.bb, do_qa_staging)
NOTE: package libqtaux2-1.2.4-r2.0: task do_qa_staging: Started
NOTE: package opie-image-1.0-r0: task do_qa_staging: Succeeded
Packaged contents of libqtaux2-dbg into /storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/armv5te/libqtaux2-dbg_1.2.4-
r2.0.6_armv5te.ipk
NOTE: Running task 6836 of 6932 (ID: 5, /storage/oe/testbuilder/openembedded/recipes/images/opie-image.bb, do_package_write)
NOTE: package opie-image-1.0-r0: task do_package_write: Started
Packaged contents of libqtaux2-dev into /storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/armv5te/libqtaux2-dev_1.2.4-
r2.0.6_armv5te.ipk
Packaged contents of libqtaux2 into /storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/armv5te/libqtaux2-1_1.2.4-
r2.0.6_armv5te.ipk
NOTE: package libqtaux2-1.2.4-r2.0: task do_qa_staging: Succeeded
NOTE: Running task 6837 of 6932 (ID: 3431, /storage/oe/testbuilder/openembedded/recipes/libqtaux/libqtaux2_1.2.4.bb, do_package_write_ipk)
NOTE: package libqtaux2-1.2.4-r2.0: task do_package_write_ipk: Started
NOTE: Not creating empty archive for libqtaux2-doc-1.2.4-r2.0.6
NOTE: package opie-image-1.0-r0: task do_package_write: Succeeded
NOTE: Not creating empty archive for libqtaux2-locale-1.2.4-r2.0.6
NOTE: Running task 6865 of 6932 (ID: 6, /storage/oe/testbuilder/openembedded/recipes/images/opie-image.bb, do_package_stage)
NOTE: package opie-image-1.0-r0: task do_package_stage: Started
NOTE: package libqtaux2-1.2.4-r2.0: task do_package_write_ipk: Succeeded
NOTE: Running task 6866 of 6932 (ID: 3418, /storage/oe/testbuilder/openembedded/recipes/libqtaux/libqtaux2_1.2.4.bb, do_package_write)
NOTE: package libqtaux2-1.2.4-r2.0: task do_package_write: Started
NOTE: package opie-image-1.0-r0: task do_package_stage: Succeeded
NOTE: package libqtaux2-1.2.4-r2.0: task do_package_write: Succeeded
NOTE: Running task 6867 of 6932 (ID: 3419, /storage/oe/testbuilder/openembedded/recipes/libqtaux/libqtaux2_1.2.4.bb, do_package_stage)
NOTE: package libqtaux2-1.2.4-r2.0: task do_package_stage: Started
NOTE: package libqtaux2-1.2.4-r2.0: task do_package_stage: Succeeded
NOTE: Running task 6868 of 6932 (ID: 3420, /storage/oe/testbuilder/openembedded/recipes/libqtaux/libqtaux2_1.2.4.bb, do_package_stage_all)
NOTE: package libqtaux2-1.2.4-r2.0: task do_package_stage_all: Started
NOTE: package libqtaux2-1.2.4-r2.0: task do_package_stage_all: Succeeded
NOTE: Running task 6890 of 6932 (ID: 3422, /storage/oe/testbuilder/openembedded/recipes/libqtaux/libqtaux2_1.2.4.bb, do_build)
NOTE: package libqtaux2-1.2.4-r2.0: task do_build: Started
NOTE: package libqtaux2-1.2.4-r2.0: task do_build: Succeeded
NOTE: Running task 6891 of 6932 (ID: 3429, /storage/oe/testbuilder/openembedded/recipes/libqtaux/libqtaux2_1.2.4.bb, do_rm_work)
NOTE: package libqtaux2-1.2.4-r2.0: task do_rm_work: Started
NOTE: package libqtaux2-1.2.4-r2.0: task do_rm_work: Succeeded
ERROR: '/storage/oe/testbuilder/openembedded/recipes/images/initramfs-kexecboot-klibc-image.bb' failed
NOTE: oestats: build failed, see http://tinderbox.openembedded.net/builds/103097/
ERROR: '/storage/oe/testbuilder/openembedded/recipes/images/initramfs-kexecboot-klibc-image.bb' failed
NOTE: oestats: build failed, see http://tinderbox.openembedded.net/builds/103097/


-- 
Yury Bushmelev


