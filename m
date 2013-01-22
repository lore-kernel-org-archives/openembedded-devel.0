Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1Txd0n-0002iZ-2X
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2013 13:31:33 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 9FF61F81239; Tue, 22 Jan 2013 05:16:04 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 7D0F4F81237;
	Tue, 22 Jan 2013 05:16:02 -0700 (MST)
Message-ID: <50FE8314.9080201@mlbassoc.com>
Date: Tue, 22 Jan 2013 05:16:20 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <50FDF53C.90001@lambsys.com> <kdlhp2$cil$1@ger.gmane.org>
In-Reply-To: <kdlhp2$cil$1@ger.gmane.org>
Subject: Re: Angstrom Beaglebone broken again?
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
X-List-Received-Date: Tue, 22 Jan 2013 12:31:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-01-22 01:14, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 22-01-13 03:11, David Lambert schreef:
>> Over the past few weeks I have noticed that builds based on the
>> Angstrom/Beaglebone distribution have been unreliable. Notably
>> systemd/udev issues. Now I noticed a new issue (log below). I understand
>> that a dynamically update system will have bugs from time to time, but
>> this appears to be getting worse. Am I the only one who is noticing this?
>> If so, maybe I am doing something wrong. If not, is there any hope of the
>> issue stabilizing somewhat?
>>
>> Regards,
>>
>> Dave.
>>
>>
>>
>> errors
>>
>>
>> dlambert@daves-laptop ~/beaglebone/setup-scripts $ ./oebb.sh update
>> Processing bitbake: Fixed to revision
>> b1dbc24ebcc4e5100c32568c2c41fd982fb4bcce, skipping update Processing
>> meta-angstrom: Current branch angstrom-v2012.05-yocto1.2 is up to date.
>> Processing meta-openembedded: Current branch denzil is up to date.
>> Processing meta-ti: Current branch angstrom-staging-yocto1.2 is up to
>> date. Processing meta-ettus: Fixed to revision
>> 5a6a642f6707dc42a5210dbbf01d2bdfd869d4b0, skipping update Processing
>> meta-efikamx: Fixed to revision 2c09a3a780b23448e8a6ca964256ff7f5ccba65d,
>> skipping update Processing meta-nslu2: Fixed to revision
>> 3d9fc951b05b4df476374b6fc3085ebac7f293ee, skipping update Processing
>> meta-smartphone: Fixed to revision
>> 2b106be01228f64298d6cb338f93088806594344, skipping update Processing
>> meta-intel: Fixed to revision f75f9b6f68473eb0efac802409608f8389be0030,
>> skipping update Processing meta-xilinx: Fixed to revision
>> 5191333565f9913b6175bb19485f7320db82080b, skipping update Processing
>> meta-openpandora: Fixed to revision
>> 9221a48cd088707e0b03f27704c5825fb754bc0c, skipping update Processing
>> meta-raspberrypi: Current branch denzil is up to date. Processing
>> meta-handheld: Fixed to revision
>> 1f05a15aceb4c3a19fa070463b58125b5658b2a9, skipping update Processing
>> meta-opie: Fixed to revision efa3892b20a4ef80274e56e5633ebd62c16f9731,
>> skipping update Processing meta-java: Fixed to revision
>> 3386ea6c96096f107f43f282f654e5afa456109e, skipping update Processing
>> meta-browser: Fixed to revision c47f59df2e723495679c751cbdf6a8c6adec4b6a,
>> skipping update Processing meta-mono: Fixed to revision
>> 83f8233b0498aadb18bf7605c3ba6c71d9e13a3a, skipping update Processing
>> meta-kde: Fixed to revision 5b0882d951cfd71886d423c190faaa7c7f932333,
>> skipping update Processing openembedded-core: remote: Counting objects:
>> 118, done. remote: Compressing objects: 100% (13/13), done. remote: Total
>> 86 (delta 73), reused 86 (delta 73) Unpacking objects: 100% (86/86),
>> done. From git://github.com/openembedded/oe-core 8925501..751c11e  master
>> -> origin/master + dcc186d...475d8fe master-next -> origin/master-next
>> (forced update) Current branch denzil is up to date.
>> dlambert@daves-laptop ~/beaglebone/setup-scripts $ bitbake systemd-image
>> Loading cache: 100%
>> |##################################################################################################|
>>
>>
> ETA:  00:00:00
>> Loaded 2859 entries from dependency cache.
>>
>> OE Build Configuration: BB_VERSION        = "1.15.2" TARGET_ARCH       =
>> "arm" TARGET_OS         = "linux-gnueabi" MACHINE           =
>> "beaglebone" DISTRO            = "angstrom" DISTRO_VERSION    =
>> "v2012.05" TUNE_FEATURES     = "armv7a vfp neon cortexa8" TARGET_FPU
>> = "vfp-neon" meta-angstrom     =
>> "angstrom-v2012.05-yocto1.2:72de0508b00f2111674e8a56058c9e1ae7227697"
>> meta-oe toolchain-layer meta-efl meta-gpe meta-gnome meta-xfce
>> meta-initramfs    = "denzil:c0117f5ad7d1fe18d149bda426c7134ff24daae8"
>> meta-opie         = "master:efa3892b20a4ef80274e56e5633ebd62c16f9731"
>> meta-java         = "master:3386ea6c96096f107f43f282f654e5afa456109e"
>> meta-browser      = "master:c47f59df2e723495679c751cbdf6a8c6adec4b6a"
>> meta-mono         = "master:83f8233b0498aadb18bf7605c3ba6c71d9e13a3a"
>> meta-kde          = "master:5b0882d951cfd71886d423c190faaa7c7f932333"
>> meta-ti           =
>> "angstrom-staging-yocto1.2:edfd9649cbd16b2cdb5385954c0441c7bba92f8d"
>> meta-efikamx      = "master:2c09a3a780b23448e8a6ca964256ff7f5ccba65d"
>> meta-nslu2        = "master:3d9fc951b05b4df476374b6fc3085ebac7f293ee"
>> meta-htc meta-nokia meta-openmoko meta-palm         =
>> "master:2b106be01228f64298d6cb338f93088806594344" meta-handheld     =
>> "master:1f05a15aceb4c3a19fa070463b58125b5658b2a9" meta-raspberrypi  =
>> "denzil:34eef2ea4f5f24630dbb73b386861430167b8431" meta-intel
>> meta-sugarbay meta-crownbay meta-emenlow meta-fishriver meta-fri2
>> meta-jasperforest meta-n450         =
>> "master:f75f9b6f68473eb0efac802409608f8389be0030" meta              =
>> "denzil:0a9e8bf35afd5990c1b586bba5eb68f643458a4b"
>>
>> NOTE: Resolving any missing task queue dependencies NOTE: Preparing
>> runqueue NOTE: Executing SetScene Tasks NOTE: Executing RunQueue Tasks
>> NOTE: Running task 419 of 3256 (ID: 547,
>> /home/dlambert/beaglebone/setup-scripts/sources/meta-openembedded/toolchain-layer/recipes-core/eglibc/eglibc_2.12.bb,
>>
>>
> do_compile)
>> NOTE: Running task 587 of 3256 (ID: 1465,
>> virtual:native:/home/dlambert/beaglebone/setup-scripts/sources/openembedded-core/meta/recipes-support/db/db_5.1.19.bb,
>>
>>
> do_compile)
>> NOTE: package eglibc-2.12-r28: task do_compile: Started NOTE: package
>> db-native-5.1.19-r4: task do_compile: Started ERROR: Function failed:
>> do_compile (see
>> /home/dlambert/beaglebone/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/x86_64-linux/db-native-5.1.19-r4/temp/log.do_compile.1471
>>
>>
> for further information)
>> ERROR: Logfile of failure stored in:
>> /home/dlambert/beaglebone/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/x86_64-linux/db-native-5.1.19-r4/temp/log.do_compile.1471
>>
>>   Log data follows: | ERROR: Function failed: do_compile (see
>> /home/dlambert/beaglebone/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/x86_64-linux/db-native-5.1.19-r4/temp/log.do_compile.1471
>>
>>
> for further information)
>> | NOTE: make -j2 | ./libtool --mode=link gcc -avoid-version
>> -isystem/home/dlambert/beaglebone/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/x86_64-linux/usr/include
>>
>>
> - -O2 -pipe  -rpath
>> /home/dlambert/beaglebone/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/x86_64-linux/usr/lib
>>
>>
> -
> -L/home/dlambert/beaglebone/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/x86_64-linux/usr/lib
>> -L/home/dlambert/beaglebone/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/x86_64-linux/lib
>>
>>
> -
> -Wl,-rpath-link,/home/dlambert/beaglebone/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/x86_64-linux/usr/lib
>> -Wl,-rpath-link,/home/dlambert/beaglebone/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/x86_64-linux/lib
>>
>>
> -
> -Wl,-rpath,/home/dlambert/beaglebone/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/x86_64-linux/usr/lib
>> -Wl,-rpath,/home/dlambert/beaglebone/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/x86_64-linux/lib
>>
>>
> - -Wl,-O1 -o libdb-5.1.la mut_tas.lo mut_pthread.lo  bt_compare.lo
>> bt_compress.lo bt_conv.lo bt_curadj.lo bt_cursor.lo bt_delete.lo
>> bt_method.lo bt_open.lo bt_put.lo bt_rec.lo bt_reclaim.lo bt_recno.lo
>> bt_rsearch.lo bt_search.lo bt_split.lo bt_stat.lo bt_compact.lo
>> bt_upgrade.lo btree_auto.lo hash.lo hash_auto.lo hash_compact.lo
>> hash_conv.lo hash_dup.lo hash_meta.lo hash_method.lo hash_open.lo
>> hash_page.lo hash_rec.lo hash_reclaim.lo hash_stat.lo hash_upgrade.lo
>> qam_stub.lo rep_stub.lo repmgr_stub.lo db_vrfy_stub.lo log_verify_stub.lo
>> lock.lo lock_deadlock.lo lock_failchk.lo lock_id.lo lock_list.lo
>> lock_method.lo lock_region.lo lock_stat.lo lock_timer.lo lock_util.lo
>> mut_alloc.lo mut_failchk.lo mut_method.lo mut_region.lo mut_stat.lo
>> crypto_stub.lo clock.lo crdel_auto.lo crdel_rec.lo db.lo db_am.lo
>> db_auto.lo db_byteorder.lo db_cam.lo db_cds.lo db_compact.lo
>> db_compint.lo db_conv.lo db_dispatch.lo db_dup.lo db_err.lo
>> db_getlong.lo db_idspace.lo db_iface.lo db_join.lo db_log2.lo db_meta.lo
>> db_method.lo db_open.lo db_overflow.lo db_pr.lo db_rec.lo db_reclaim.lo
>> db_remove.lo db_rename.lo db_ret.lo db_setid.lo db_setlsn.lo db_shash.lo
>> db_sort_multiple.lo db_stati.lo db_truncate.lo db_upg.lo db_upg_opd.lo
>> dbreg.lo dbreg_stat.lo dbreg_auto.lo dbreg_rec.lo dbreg_util.lo dbt.lo
>> env_alloc.lo env_config.lo env_failchk.lo env_file.lo env_globals.lo
>> env_open.lo env_method.lo env_name.lo env_recover.lo env_region.lo
>> env_register.lo env_sig.lo env_stat.lo fileops_auto.lo fop_basic.lo
>> fop_rec.lo fop_util.lo hash_func.lo hmac.lo log.lo log_archive.lo
>> log_compare.lo log_debug.lo log_get.lo log_method.lo log_print.lo
>> log_put.lo log_stat.lo mkpath.lo mp_alloc.lo mp_bh.lo mp_fget.lo
>> mp_fmethod.lo mp_fopen.lo mp_fput.lo mp_fset.lo mp_method.lo mp_mvcc.lo
>> mp_region.lo mp_register.lo mp_resize.lo mp_stat.lo mp_sync.lo
>> mp_trickle.lo openflags.lo os_abort.lo os_abs.lo os_alloc.lo os_clock.lo
>> os_cpu.lo os_ctime.lo os_config.lo os_dir.lo os_errno.lo os_fid.lo
>> os_flock.lo os_fsync.lo os_getenv.lo os_handle.lo os_map.lo os_method.lo
>> os_mkdir.lo os_open.lo os_pid.lo os_rename.lo os_root.lo os_rpath.lo
>> os_rw.lo os_seek.lo os_stack.lo os_stat.lo os_tmpdir.lo os_truncate.lo
>> os_uid.lo os_unlink.lo os_yield.lo partition.lo seq_stat.lo sequence.lo
>> sha1.lo snprintf.lo txn.lo txn_auto.lo txn_chkpt.lo txn_failchk.lo
>> txn_method.lo txn_rec.lo txn_recover.lo txn_region.lo txn_stat.lo
>> txn_util.lo zerofill.lo  \ |         -lpthread | libtool: link:
>> `mp_fopen.lo' is not a valid libtool object | make: *** [libdb-5.1.la]
>> Error 1 | ERROR: oe_runmake failed NOTE: package db-native-5.1.19-r4:
>> task do_compile: Failed ERROR: Task 1465
>> (virtual:native:/home/dlambert/beaglebone/setup-scripts/sources/openembedded-core/meta/recipes-support/db/db_5.1.19.bb,
>>
>>
> do_compile) failed with exit code '1'
>> Waiting for 1 running tasks to finish: 0: eglibc-2.12-r28 do_compile (pid
>> 1470) NOTE: package eglibc-2.12-r28: task do_compile: Succeeded NOTE:
>> Tasks Summary: Attempted 587 tasks of which 585 didn't need to be rerun
>> and 1 failed.
>
> That's a recipe managed by oe-core, so you;d have to complain to the
> maintainers of that layer.

Was this a build from scratch, or an update (build attempt in an already
built tree)?  I've seen similar issues with some of the native recipes
recently, but it normally is recoverable.  Try this:
   % bitbake db-native -c cleansstate
   % bitbake db-native
If that works, you should be able to carry on.  If not, report back.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


