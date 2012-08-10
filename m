Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Szo52-0008AE-EW
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 14:12:41 +0200
Received: by pbcwy7 with SMTP id wy7so2308056pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 05:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:mime-version:content-type:subject:date:in-reply-to:to
	:references:message-id:x-mailer;
	bh=5tEi1Bu25eZQGb2JHKQZQQ2uoBK2fxXlhoouUdm0pBo=;
	b=WqNYns0LaVIXCWNb0Pec5vWOsdOItfI5LSsugP3Nh9dP4Knscn8/4Q2Txm5IA6Lz8s
	FReRNWbDuEKkk+dx2tQ1+BOplnTSmXMNkYmXk4p9ov4NmPEIcxzfy/Oo0AwmvJ0ZgkIE
	7NNVt1NLu30V6jrEgkRNAC/tUIdTNTL9/kadKDgU4+QgIcWerHNBoPbo1dkqNetkiBe1
	5FMR0/Cz4kiw0AEldgIXM7NN83IVfNt57Qv6APYMb1VPlkcUSeq0p/ub/mfySm1dL4pb
	ydC+UC4ZBf7N0ow7RcQASlh4OF52BmH7Td38w4kVqvtKV7QiWJCDgZUKmlODNh+XsNxW
	jMYg==
Received: by 10.68.216.136 with SMTP id oq8mr12281827pbc.68.1344600049899;
	Fri, 10 Aug 2012 05:00:49 -0700 (PDT)
Received: from [192.168.1.101] ([94.205.108.162])
	by mx.google.com with ESMTPS id nr8sm3228084pbc.43.2012.08.10.05.00.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 05:00:49 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Mime-Version: 1.0 (Apple Message framework v1278)
Date: Fri, 10 Aug 2012 16:00:42 +0400
In-Reply-To: <154964BA-5A71-4E33-84CA-FE5929C67D22@gmail.com>
To: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
References: <154964BA-5A71-4E33-84CA-FE5929C67D22@gmail.com>
Message-Id: <E48CCA3B-5D4A-439C-A3A4-E5CE79237DD4@gmail.com>
X-Mailer: Apple Mail (2.1278)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-openembedded] libgcc-4.5.1: ERROR: QA Issue: No GNU_HASH in the elf binary libgcc_s.so.1
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
X-List-Received-Date: Fri, 10 Aug 2012 12:12:41 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 10, 2012, at 10:44 AM, Elvis Dowson wrote:

> I'm working on adding a gcc-4.5 recipe to the =
meta-openembedded/toolchain-layer.=20
>=20
> I've based the files off the gcc-4.6 recipes, and taken the patches =
for gcc-4.5.1 from the poky/bernard branch.
>=20
> I get the following QA error:
>=20
> NOTE: Running task 806 of 890 (ID: 594, =
/tool/yocto/meta-openembedded/toolchain-layer/recipes-devtools/gcc/gcc-run=
time_4.5.bb, do_configure)
> ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/libgcc-4.5.1+svnr162773=
-r14/packages-split/libgcc/lib/libgcc_s.so.1'
>=20
> Searching through the mailing lists, I find that a potential fix would =
be to add the following to gcc-configure-common.inc
>=20
> TARGET_CC_ARCH +=3D "${LDFLAGS}"
>=20
> I was wondering why this issue manifests for gcc-4.5, and not for =
gcc-4.6 and gcc-4.7?
>=20
> After all, the only difference between the 4.6 and 4.7 recipes is just =
the list of patches and the SRCREV, and the BINUTILS version (2.21) used =
for gcc-4.5, and running it against the current master branches for poky =
and meta-openembedded.

Adding the TARGET_CC_ARCH +=3D "{LDFLAGS} to both =
gcc-configure-common.inc in the poky layer, and to libgcc-4.5.inc in the =
meta-openembedded/toolchain layer helped me get past the QA Error for =
libgcc, but now I get a whole bunch of similar errors for a whole bunch =
of other packages.

NOTE: Running noexec task 967 of 974 (ID: 7, =
/tool/yocto/meta-openembedded/toolchain-layer/recipes-devtools/gcc/gcc_4.5=
.bb, do_package_write)
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-lib/usr/lib/libperl.so.5.14.2'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-encode-byte/usr/lib/perl/5.14.2/auto/Encode/Byte/Byte.s=
o'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-encode-cn/usr/lib/perl/5.14.2/auto/Encode/CN/CN.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-encode-ebcdic/usr/lib/perl/5.14.2/auto/Encode/EBCDIC/EB=
CDIC.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-encode-jp/usr/lib/perl/5.14.2/auto/Encode/JP/JP.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-encode-kr/usr/lib/perl/5.14.2/auto/Encode/KR/KR.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-encode-symbol/usr/lib/perl/5.14.2/auto/Encode/Symbol/Sy=
mbol.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-encode-tw/usr/lib/perl/5.14.2/auto/Encode/TW/TW.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-encode-unicode/usr/lib/perl/5.14.2/auto/Encode/Unicode/=
Unicode.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-b/usr/lib/perl/5.14.2/auto/B/B.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-compress/usr/lib/perl/5.14.2/auto/Compress/Raw/Zlib/Zli=
b.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-compress/usr/lib/perl/5.14.2/auto/Compress/Raw/Bzip2/Bz=
ip2.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-cwd/usr/lib/perl/5.14.2/auto/Cwd/Cwd.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-data/usr/lib/perl/5.14.2/auto/Data/Dumper/Dumper.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-devel/usr/lib/perl/5.14.2/auto/Devel/Peek/Peek.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-devel/usr/lib/perl/5.14.2/auto/Devel/PPPort/PPPort.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-devel/usr/lib/perl/5.14.2/auto/Devel/DProf/DProf.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-digest/usr/lib/perl/5.14.2/auto/Digest/MD5/MD5.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-digest/usr/lib/perl/5.14.2/auto/Digest/SHA/SHA.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-encode/usr/lib/perl/5.14.2/auto/Encode/Encode.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-fcntl/usr/lib/perl/5.14.2/auto/Fcntl/Fcntl.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-file/usr/lib/perl/5.14.2/auto/File/Glob/Glob.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-filter/usr/lib/perl/5.14.2/auto/Filter/Util/Call/Call.s=
o'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-gdbm-file/usr/lib/perl/5.14.2/auto/GDBM_File/GDBM_File.=
so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-hash/usr/lib/perl/5.14.2/auto/Hash/Util/Util.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-hash/usr/lib/perl/5.14.2/auto/Hash/Util/FieldHash/Field=
Hash.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-i18n/usr/lib/perl/5.14.2/auto/I18N/Langinfo/Langinfo.so=
'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-io/usr/lib/perl/5.14.2/auto/IO/IO.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-ipc/usr/lib/perl/5.14.2/auto/IPC/SysV/SysV.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-list/usr/lib/perl/5.14.2/auto/List/Util/Util.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-mime/usr/lib/perl/5.14.2/auto/MIME/Base64/Base64.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-math/usr/lib/perl/5.14.2/auto/Math/BigInt/FastCalc/Fast=
Calc.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-opcode/usr/lib/perl/5.14.2/auto/Opcode/Opcode.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-posix/usr/lib/perl/5.14.2/auto/POSIX/POSIX.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-perlio/usr/lib/perl/5.14.2/auto/PerlIO/scalar/scalar.so=
'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-perlio/usr/lib/perl/5.14.2/auto/PerlIO/via/via.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-perlio/usr/lib/perl/5.14.2/auto/PerlIO/encoding/encodin=
g.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-sdbm-file/usr/lib/perl/5.14.2/auto/SDBM_File/SDBM_File.=
so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-socket/usr/lib/perl/5.14.2/auto/Socket/Socket.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-storable/usr/lib/perl/5.14.2/auto/Storable/Storable.so'=

ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-sys/usr/lib/perl/5.14.2/auto/Sys/Hostname/Hostname.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-sys/usr/lib/perl/5.14.2/auto/Sys/Syslog/Syslog.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-text/usr/lib/perl/5.14.2/auto/Text/Soundex/Soundex.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-time/usr/lib/perl/5.14.2/auto/Time/HiRes/HiRes.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-time/usr/lib/perl/5.14.2/auto/Time/Piece/Piece.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-unicode/usr/lib/perl/5.14.2/auto/Unicode/Normalize/Norm=
alize.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-unicode/usr/lib/perl/5.14.2/auto/Unicode/Collate/Collat=
e.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-attributes/usr/lib/perl/5.14.2/auto/attributes/attribut=
es.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-mro/usr/lib/perl/5.14.2/auto/mro/mro.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-re/usr/lib/perl/5.14.2/auto/re/re.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-threads/usr/lib/perl/5.14.2/auto/threads/threads.so'
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/packages=
-split/perl-module-threads/usr/lib/perl/5.14.2/auto/threads/shared/shared.=
so'
ERROR: QA run found fatal errors. Please consider fixing them.
ERROR: Function failed: do_package_qa
ERROR: Logfile of failure stored in: =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/perl-5.14.2-r8/temp/log.=
do_package.39956
NOTE: package perl-5.14.2-r8: task do_package: Failed
ERROR: Task 322 =
(/tool/yocto/poky/meta/recipes-devtools/perl/perl_5.14.2.bb, do_package) =
failed with exit code '1'
NOTE: Tasks Summary: Attempted 967 tasks of which 828 didn't need to be =
rerun and 1 failed.


What should I do? It doesn't happen with gcc-4.6 or gcc-4.7.

Best regards,

Elvis Dowson


