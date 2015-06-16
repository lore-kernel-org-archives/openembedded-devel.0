Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7E0B474051
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jun 2015 11:44:11 +0000 (UTC)
Received: by wigg3 with SMTP id g3so106076123wig.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jun 2015 04:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=bBuMR1qa4RedABGA8rvWHoRv7MAhcu6oriJ9iEIjOUI=;
	b=GJ8QXKaFZL+ViKmgPWn1mAW9quXSEMn+wFeJcf/mSClhNVXZg+Qa1h2P3/vg1/nQU7
	y/52AcpWDavmvJALtlOnRM7tcCmYanhwLwK5Ww9w317+XYCRAeiTfLA8qQiHtByXK3EP
	gc8PxWlpJPrFGVvKsfK//riXb97iMrJjHHEKnWY5pgA0nOprY1gqFVBpbcud90g1w9QY
	lITpi9OrVQUXtvi4ShN0BkIWUa3rTpkQBZSLKXY66qO1o61GB3qkcaohwHUIHPQBtpry
	azXNeZB9TO+QE+YgD7yYMvq+rmqENMgSs+fTVgf4jVgwjFJKFmb9GYMtAyFMLhc7rhRp
	D+KA==
X-Received: by 10.181.25.234 with SMTP id it10mr42923183wid.41.1434455052583; 
	Tue, 16 Jun 2015 04:44:12 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id gj7sm20372136wib.4.2015.06.16.04.44.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Jun 2015 04:44:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 16 Jun 2015 13:44:21 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150616114421.GA2395@jama>
References: <1434358336-34981-1-git-send-email-biannm@cn.fujitsu.com>
	<1434358336-34981-7-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1434358336-34981-7-git-send-email-biannm@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 6/7] libtdb: add new recipe
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
X-List-Received-Date: Tue, 16 Jun 2015 11:44:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2015 at 04:52:15PM +0800, Bian Naimeng wrote:
> libtdb is required by samba4

It conflicts with samba3, should we just replace samba_3* with samba_4?

NOTE: recipe libtdb-1.3.0-r0: task do_populate_sysroot: Started
ERROR: The recipe libtdb is trying to install files into a shared area when=
 those files already exist. Those files and their manifest location are:
   /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/pkgdata/runti=
me-rprovides/libtdb/libtdb
 Matched in manifest-qemuarm-samba.packagedata
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/pkgdata/runtime=
-reverse/libtdb1
 Matched in manifest-qemuarm-samba.packagedata
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/pkgdata/runtime=
/libtdb.packaged
 Matched in manifest-qemuarm-samba.packagedata
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/pkgdata/runtime=
/libtdb
 Matched in manifest-qemuarm-samba.packagedata
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/pkgdata/shlibs2=
/libtdb.list
 Matched in manifest-qemuarm-samba.packagedata
Please verify which recipe should provide the above files.
The build has stopped as continuing in this scenario WILL break things, if =
not now, possibly in the future (we've seen builds fail several months late=
r). If the system knew how to recover from this automatically it would howe=
ver there are several different scenarios which can result in this and we d=
on't know which one this is. It may be you have switched providers of somet=
hing like virtual/kernel (e.g. from linux-yocto to linux-yocto-dev), in tha=
t case you need to execute the clean task for both recipes and it will reso=
lve this error. It may be you changed DISTRO_FEATURES from systemd to udev =
or vice versa. Cleaning those recipes should again resolve this error howev=
er switching DISTRO_FEATURES on an existing build directory is not supporte=
d, you should really clean out tmp and rebuild (reusing sstate should be sa=
fe). It could be the overlapping files detected are harmless in which case =
adding them to SSTATE_DUPWHITELIST may be the correct solution. It could al=
so be your build is including two different conflicting versions of things =
(e.g. bluez 4 and bluez 5 and the correct solution for that would be to res=
olve the conflict. If in doubt, please ask on the mailing list, sharing the=
 error and filelist above.
ERROR: If the above message is too much, the simpler version is you're advi=
sed to wipe out tmp and rebuild (reusing sstate is fine). That will likely =
fix things in most (but not all) cases.
ERROR: Function failed: sstate_task_postfunc
ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work/armv5te-oe-linux-gnueabi/libtdb/1.3.0-r0/temp/log.do_packagedata.2=
7608
NOTE: recipe libtdb-1.3.0-r0: task do_packagedata: Failed
ERROR: Task 27734 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-o=
e/recipes-support/libtdb/libtdb_1.3.0.bb, do_packagedata) failed with exit =
code '1'
NOTE: Running task 20344 of 31972 (ID: 27663, /home/jenkins/oe/world/shr-co=
re/meta-openembedded/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb, do_p=
ackage)
ERROR: The recipe libtdb is trying to install files into a shared area when=
 those files already exist. Those files and their manifest location are:
   /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/lib/libtd=
b.so.1
 Matched in manifest-qemuarm-samba.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/lib/libtdb.=
so
 Matched in manifest-qemuarm-samba.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/lib/pkgconf=
ig/tdb.pc
 Matched in manifest-qemuarm-samba.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/include/tdb=
=2Eh
 Matched in manifest-qemuarm-samba.populate_sysroot
Please verify which recipe should provide the above files.
The build has stopped as continuing in this scenario WILL break things, if =
not now, possibly in the future (we've seen builds fail several months late=
r). If the system knew how to recover from this automatically it would howe=
ver there are several different scenarios which can result in this and we d=
on't know which one this is. It may be you have switched providers of somet=
hing like virtual/kernel (e.g. from linux-yocto to linux-yocto-dev), in tha=
t case you need to execute the clean task for both recipes and it will reso=
lve this error. It may be you changed DISTRO_FEATURES from systemd to udev =
or vice versa. Cleaning those recipes should again resolve this error howev=
er switching DISTRO_FEATURES on an existing build directory is not supporte=
d, you should really clean out tmp and rebuild (reusing sstate should be sa=
fe). It could be the overlapping files detected are harmless in which case =
adding them to SSTATE_DUPWHITELIST may be the correct solution. It could al=
so be your build is including two different conflicting versions of things =
(e.g. bluez 4 and bluez 5 and the correct solution for that would be to res=
olve the conflict. If in doubt, please ask on the mailing list, sharing the=
 error and filelist above.
ERROR: If the above message is too much, the simpler version is you're advi=
sed to wipe out tmp and rebuild (reusing sstate is fine). That will likely =
fix things in most (but not all) cases.
ERROR: Function failed: sstate_task_postfunc
ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work/armv5te-oe-linux-gnueabi/libtdb/1.3.0-r0/temp/log.do_populate_sysr=
oot.27647
NOTE: recipe libtdb-1.3.0-r0: task do_populate_sysroot: Failed
ERROR: Task 27729 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-o=
e/recipes-support/libtdb/libtdb_1.3.0.bb, do_populate_sysroot) failed with =
exit code '1'

>=20
> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> ---
>  .../libtdb/do-not-check-xsltproc-manpages.patch    | 15 +++++++++++
>  meta-oe/recipes-support/libtdb/libtdb_1.3.0.bb     | 30 ++++++++++++++++=
++++++
>  2 files changed, 45 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libtdb/libtdb/do-not-check-xs=
ltproc-manpages.patch
>  create mode 100644 meta-oe/recipes-support/libtdb/libtdb_1.3.0.bb
>=20
> diff --git a/meta-oe/recipes-support/libtdb/libtdb/do-not-check-xsltproc-=
manpages.patch b/meta-oe/recipes-support/libtdb/libtdb/do-not-check-xsltpro=
c-manpages.patch
> new file mode 100644
> index 0000000..bcc45c9
> --- /dev/null
> +++ b/meta-oe/recipes-support/libtdb/libtdb/do-not-check-xsltproc-manpage=
s.patch
> @@ -0,0 +1,15 @@
> +Don't check manpages for xsltproc.
> +
> +Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> +
> +--- tdb-1.3.0.orig/wscript	2015-04-22 09:52:32.366000222 +0900
> ++++ tdb-1.3.0/wscript	2015-04-22 09:51:57.720000205 +0900
> +@@ -90,7 +90,7 @@ def configure(conf):
> +         not conf.env.disable_tdb_mutex_locking):
> +         conf.define('USE_TDB_MUTEX_LOCKING', 1)
> +=20
> +-    conf.CHECK_XSLTPROC_MANPAGES()
> ++    conf.find_program('xsltproc', var=3D'XSLTPROC')
> +=20
> +     if not conf.env.disable_python:
> +         # also disable if we don't have the python libs installed
> diff --git a/meta-oe/recipes-support/libtdb/libtdb_1.3.0.bb b/meta-oe/rec=
ipes-support/libtdb/libtdb_1.3.0.bb
> new file mode 100644
> index 0000000..b7f3d21
> --- /dev/null
> +++ b/meta-oe/recipes-support/libtdb/libtdb_1.3.0.bb
> @@ -0,0 +1,30 @@
> +SUMMARY =3D "The tdb library"
> +SECTION =3D "libs"
> +LICENSE =3D "LGPL-3.0+ & GPL-3.0+"
> +
> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/LGPL=
-3.0;md5=3Dbfccfe952269fff2b407dd11f2f3083b \
> +                    file://${COREBASE}/meta/files/common-licenses/GPL-3.=
0;md5=3Dc79ff39f19dfec6d293b95dea7b07891"
> +
> +SRC_URI =3D "http://samba.org/ftp/tdb/tdb-${PV}.tar.gz \
> +           file://do-not-check-xsltproc-manpages.patch"
> +
> +SRC_URI[md5sum] =3D "f18cd6afc4f5670edfe58f72d2665f94"
> +SRC_URI[sha256sum] =3D "04bee48d405ab7815810575a6e0cb364cc0eea6187b54b18=
c84e9c18a768ba20"
> +
> +S =3D "${WORKDIR}/tdb-${PV}"
> +
> +inherit wafsamba
> +
> +EXTRA_OECONF +=3D "--disable-rpath \
> +                 --bundled-libraries=3DNONE \
> +                 --builtin-libraries=3Dreplace \
> +                 --with-libiconv=3D${STAGING_DIR_HOST}${prefix}\
> +                "
> +
> +PACKAGES +=3D "tdb-tools python-tdb python-tdb-dbg"
> +
> +FILES_${PN} =3D "${libdir}/*.so.*"
> +FILES_tdb-tools =3D "${bindir}/*"
> +FILES_python-tdb =3D "${libdir}/python${PYTHON_BASEVERSION}/site-package=
s/*"
> +FILES_python-tdb-dbg =3D "${libdir}/python${PYTHON_BASEVERSION}/site-pac=
kages/.debug/*"
> +RDEPENDS_python-tdb =3D "python"
> --=20
> 1.8.4.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

