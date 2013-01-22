Received: from [23.30.85.2] (helo=mail.breakawaysystems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dave@lambsys.com>) id 1TxTh7-0006BP-1P
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2013 03:34:38 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.breakawaysystems.com (Postfix) with ESMTP id 5427124A841
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jan 2013 20:11:16 -0600 (CST)
Received: from mail.breakawaysystems.com ([127.0.0.1])
	by localhost (mail-breakaway.protnet [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id XclAMTPLw1pg
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jan 2013 20:11:10 -0600 (CST)
Received: from [192.168.1.100] (unknown [23.30.85.1])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: dlambert@breakawaysystems.com)
	by mail.breakawaysystems.com (Postfix) with ESMTPSA id 3DE7A24A830
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jan 2013 20:11:09 -0600 (CST)
Message-ID: <50FDF53C.90001@lambsys.com>
Date: Mon, 21 Jan 2013 20:11:08 -0600
From: David Lambert <dave@lambsys.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Angstrom Beaglebone broken again?
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
X-List-Received-Date: Tue, 22 Jan 2013 02:34:38 -0000
X-Groupsio-MsgNum: 42780
Content-Type: multipart/mixed; boundary="------------020404090009090508070800"

--------------020404090009090508070800
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

     Over the past few weeks I have noticed that builds based on the=20
Angstrom/Beaglebone distribution have been unreliable. Notably=20
systemd/udev issues. Now I noticed a new issue (log below).
     I understand that a dynamically update system will have bugs from=20
time to time, but this appears to be getting worse. Am I the only one=20
who is noticing this? If so, maybe I am doing something wrong. If not,=20
is there any hope of the issue stabilizing somewhat?

Regards,

Dave.



errors


dlambert@daves-laptop ~/beaglebone/setup-scripts $ ./oebb.sh update
Processing bitbake: Fixed to revision b1dbc24ebcc4e5100c32568c2c41fd982fb=
4bcce, skipping update
Processing meta-angstrom: Current branch angstrom-v2012.05-yocto1.2 is up=
 to date.
Processing meta-openembedded: Current branch denzil is up to date.
Processing meta-ti: Current branch angstrom-staging-yocto1.2 is up to dat=
e.
Processing meta-ettus: Fixed to revision 5a6a642f6707dc42a5210dbbf01d2bdf=
d869d4b0, skipping update
Processing meta-efikamx: Fixed to revision 2c09a3a780b23448e8a6ca964256ff=
7f5ccba65d, skipping update
Processing meta-nslu2: Fixed to revision 3d9fc951b05b4df476374b6fc3085eba=
c7f293ee, skipping update
Processing meta-smartphone: Fixed to revision 2b106be01228f64298d6cb338f9=
3088806594344, skipping update
Processing meta-intel: Fixed to revision f75f9b6f68473eb0efac802409608f83=
89be0030, skipping update
Processing meta-xilinx: Fixed to revision 5191333565f9913b6175bb19485f732=
0db82080b, skipping update
Processing meta-openpandora: Fixed to revision 9221a48cd088707e0b03f27704=
c5825fb754bc0c, skipping update
Processing meta-raspberrypi: Current branch denzil is up to date.
Processing meta-handheld: Fixed to revision 1f05a15aceb4c3a19fa070463b581=
25b5658b2a9, skipping update
Processing meta-opie: Fixed to revision efa3892b20a4ef80274e56e5633ebd62c=
16f9731, skipping update
Processing meta-java: Fixed to revision 3386ea6c96096f107f43f282f654e5afa=
456109e, skipping update
Processing meta-browser: Fixed to revision c47f59df2e723495679c751cbdf6a8=
c6adec4b6a, skipping update
Processing meta-mono: Fixed to revision 83f8233b0498aadb18bf7605c3ba6c71d=
9e13a3a, skipping update
Processing meta-kde: Fixed to revision 5b0882d951cfd71886d423c190faaa7c7f=
932333, skipping update
Processing openembedded-core: remote: Counting objects: 118, done.
remote: Compressing objects: 100% (13/13), done.
remote: Total 86 (delta 73), reused 86 (delta 73)
Unpacking objects: 100% (86/86), done.
 From git://github.com/openembedded/oe-core
    8925501..751c11e  master     -> origin/master
  + dcc186d...475d8fe master-next -> origin/master-next  (forced update)
Current branch denzil is up to date.
dlambert@daves-laptop ~/beaglebone/setup-scripts $ bitbake systemd-image
Loading cache: 100% |####################################################=
##############################################| ETA:  00:00:00
Loaded 2859 entries from dependency cache.

OE Build Configuration:
BB_VERSION        =3D "1.15.2"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "beaglebone"
DISTRO            =3D "angstrom"
DISTRO_VERSION    =3D "v2012.05"
TUNE_FEATURES     =3D "armv7a vfp neon cortexa8"
TARGET_FPU        =3D "vfp-neon"
meta-angstrom     =3D "angstrom-v2012.05-yocto1.2:72de0508b00f2111674e8a5=
6058c9e1ae7227697"
meta-oe
toolchain-layer
meta-efl
meta-gpe
meta-gnome
meta-xfce
meta-initramfs    =3D "denzil:c0117f5ad7d1fe18d149bda426c7134ff24daae8"
meta-opie         =3D "master:efa3892b20a4ef80274e56e5633ebd62c16f9731"
meta-java         =3D "master:3386ea6c96096f107f43f282f654e5afa456109e"
meta-browser      =3D "master:c47f59df2e723495679c751cbdf6a8c6adec4b6a"
meta-mono         =3D "master:83f8233b0498aadb18bf7605c3ba6c71d9e13a3a"
meta-kde          =3D "master:5b0882d951cfd71886d423c190faaa7c7f932333"
meta-ti           =3D "angstrom-staging-yocto1.2:edfd9649cbd16b2cdb538595=
4c0441c7bba92f8d"
meta-efikamx      =3D "master:2c09a3a780b23448e8a6ca964256ff7f5ccba65d"
meta-nslu2        =3D "master:3d9fc951b05b4df476374b6fc3085ebac7f293ee"
meta-htc
meta-nokia
meta-openmoko
meta-palm         =3D "master:2b106be01228f64298d6cb338f93088806594344"
meta-handheld     =3D "master:1f05a15aceb4c3a19fa070463b58125b5658b2a9"
meta-raspberrypi  =3D "denzil:34eef2ea4f5f24630dbb73b386861430167b8431"
meta-intel
meta-sugarbay
meta-crownbay
meta-emenlow
meta-fishriver
meta-fri2
meta-jasperforest
meta-n450         =3D "master:f75f9b6f68473eb0efac802409608f8389be0030"
meta              =3D "denzil:0a9e8bf35afd5990c1b586bba5eb68f643458a4b"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Running task 419 of 3256 (ID: 547, /home/dlambert/beaglebone/setup-=
scripts/sources/meta-openembedded/toolchain-layer/recipes-core/eglibc/egl=
ibc_2.12.bb, do_compile)
NOTE: Running task 587 of 3256 (ID: 1465, virtual:native:/home/dlambert/b=
eaglebone/setup-scripts/sources/openembedded-core/meta/recipes-support/db=
/db_5.1.19.bb, do_compile)
NOTE: package eglibc-2.12-r28: task do_compile: Started
NOTE: package db-native-5.1.19-r4: task do_compile: Started
ERROR: Function failed: do_compile (see /home/dlambert/beaglebone/setup-s=
cripts/build/tmp-angstrom_v2012_05-eglibc/work/x86_64-linux/db-native-5.1=
=2E19-r4/temp/log.do_compile.1471 for further information)
ERROR: Logfile of failure stored in: /home/dlambert/beaglebone/setup-scri=
pts/build/tmp-angstrom_v2012_05-eglibc/work/x86_64-linux/db-native-5.1.19=
-r4/temp/log.do_compile.1471
Log data follows:
| ERROR: Function failed: do_compile (see /home/dlambert/beaglebone/setup=
-scripts/build/tmp-angstrom_v2012_05-eglibc/work/x86_64-linux/db-native-5=
=2E1.19-r4/temp/log.do_compile.1471 for further information)
| NOTE: make -j2
| ./libtool --mode=3Dlink gcc -avoid-version -isystem/home/dlambert/beagl=
ebone/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/x86_64-li=
nux/usr/include -O2 -pipe  -rpath /home/dlambert/beaglebone/setup-scripts=
/build/tmp-angstrom_v2012_05-eglibc/sysroots/x86_64-linux/usr/lib -L/home=
/dlambert/beaglebone/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sys=
roots/x86_64-linux/usr/lib -L/home/dlambert/beaglebone/setup-scripts/buil=
d/tmp-angstrom_v2012_05-eglibc/sysroots/x86_64-linux/lib -Wl,-rpath-link,=
/home/dlambert/beaglebone/setup-scripts/build/tmp-angstrom_v2012_05-eglib=
c/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/home/dlambert/beaglebone=
/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/x86_64-linux/l=
ib -Wl,-rpath,/home/dlambert/beaglebone/setup-scripts/build/tmp-angstrom_=
v2012_05-eglibc/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/home/dlambert/b=
eaglebone/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/x86_6=
4-linux/lib -Wl,-O1 -o libdb-5.1.la mut_tas.lo mut_pthread.lo  bt_compare=
=2Elo bt_compress.lo bt_conv.lo bt_curadj.lo bt_cursor.lo bt_delete.lo bt=
_method.lo bt_open.lo bt_put.lo bt_rec.lo bt_reclaim.lo bt_recno.lo bt_rs=
earch.lo bt_search.lo bt_split.lo bt_stat.lo bt_compact.lo bt_upgrade.lo =
btree_auto.lo hash.lo hash_auto.lo hash_compact.lo hash_conv.lo hash_dup.=
lo hash_meta.lo hash_method.lo hash_open.lo hash_page.lo hash_rec.lo hash=
_reclaim.lo hash_stat.lo hash_upgrade.lo qam_stub.lo rep_stub.lo repmgr_s=
tub.lo db_vrfy_stub.lo log_verify_stub.lo lock.lo lock_deadlock.lo lock_f=
ailchk.lo lock_id.lo lock_list.lo lock_method.lo lock_region.lo lock_stat=
=2Elo lock_timer.lo lock_util.lo mut_alloc.lo mut_failchk.lo mut_method.l=
o mut_region.lo mut_stat.lo  crypto_stub.lo clock.lo crdel_auto.lo crdel_=
rec.lo db.lo db_am.lo db_auto.lo db_byteorder.lo db_cam.lo db_cds.lo db_c=
ompact.lo db_compint.lo db_conv.lo db_dispatch.lo db_dup.lo db_err.lo db_=
getlong.lo db_idspace.lo db_iface.lo db_join.lo db_log2.lo db_meta.lo db_=
method.lo db_open.lo db_overflow.lo db_pr.lo db_rec.lo db_reclaim.lo db_r=
emove.lo db_rename.lo db_ret.lo db_setid.lo db_setlsn.lo db_shash.lo db_s=
ort_multiple.lo db_stati.lo db_truncate.lo db_upg.lo db_upg_opd.lo dbreg.=
lo dbreg_stat.lo dbreg_auto.lo dbreg_rec.lo dbreg_util.lo dbt.lo env_allo=
c.lo env_config.lo env_failchk.lo env_file.lo env_globals.lo env_open.lo =
env_method.lo env_name.lo env_recover.lo env_region.lo env_register.lo en=
v_sig.lo env_stat.lo fileops_auto.lo fop_basic.lo fop_rec.lo fop_util.lo =
hash_func.lo hmac.lo log.lo log_archive.lo log_compare.lo log_debug.lo lo=
g_get.lo log_method.lo log_print.lo log_put.lo log_stat.lo mkpath.lo mp_a=
lloc.lo mp_bh.lo mp_fget.lo mp_fmethod.lo mp_fopen.lo mp_fput.lo mp_fset.=
lo mp_method.lo mp_mvcc.lo mp_region.lo mp_register.lo mp_resize.lo mp_st=
at.lo mp_sync.lo mp_trickle.lo openflags.lo os_abort.lo os_abs.lo os_allo=
c.lo os_clock.lo os_cpu.lo os_ctime.lo os_config.lo os_dir.lo os_errno.lo=
 os_fid.lo os_flock.lo os_fsync.lo os_getenv.lo os_handle.lo os_map.lo os=
_method.lo os_mkdir.lo os_open.lo os_pid.lo os_rename.lo os_root.lo os_rp=
ath.lo os_rw.lo os_seek.lo os_stack.lo os_stat.lo os_tmpdir.lo os_truncat=
e.lo os_uid.lo os_unlink.lo os_yield.lo partition.lo seq_stat.lo sequence=
=2Elo sha1.lo snprintf.lo txn.lo txn_auto.lo txn_chkpt.lo txn_failchk.lo =
txn_method.lo txn_rec.lo txn_recover.lo txn_region.lo txn_stat.lo txn_uti=
l.lo zerofill.lo  \
| 		-lpthread
| libtool: link: `mp_fopen.lo' is not a valid libtool object
| make: *** [libdb-5.1.la] Error 1
| ERROR: oe_runmake failed
NOTE: package db-native-5.1.19-r4: task do_compile: Failed
ERROR: Task 1465 (virtual:native:/home/dlambert/beaglebone/setup-scripts/=
sources/openembedded-core/meta/recipes-support/db/db_5.1.19.bb, do_compil=
e) failed with exit code '1'
Waiting for 1 running tasks to finish:
0: eglibc-2.12-r28 do_compile (pid 1470)
NOTE: package eglibc-2.12-r28: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 587 tasks of which 585 didn't need to be r=
erun and 1 failed.

Summary: 1 task failed:
   virtual:native:/home/dlambert/beaglebone/setup-scripts/sources/openemb=
edded-core/meta/recipes-support/db/db_5.1.19.bb, do_compile
Summary: There was 1 ERROR message shown, returning a non-zero exit code.=

dlambert@daves-laptop ~/beaglebone/setup-scripts $


--------------020404090009090508070800
Content-Type: text/x-vcard; charset=utf-8;
 name="dave.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="dave.vcf"

begin:vcard
fn:David Lambert
n:Lambert;David
org:Breakaway Systems LLC
adr:;;24703 Lakebriar Drive;Katy;TX;77494;USA
email;internet:dave@lambsys.com
title:President
tel;work:281 395-3439
tel;fax:281 395-0796
tel;cell:281 787-3648
url:breakawaysystems.com
version:2.1
end:vcard


--------------020404090009090508070800--
