Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SzqqI-0008Kp-Fs
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 17:09:38 +0200
Received: by pbcwy7 with SMTP id wy7so2526123pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 07:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to;
	bh=6G7BgX7aSJKERMB0Rh0F6/oQQ5sIZPrDH/nsfnPwC9Q=;
	b=02vF2I9/J1/JNyXrufBtJAuXJWdRrwLnqwvifMT4Yv8JEinepyvjr1w+TYtWb2ezvP
	Nfc2LKdlS2KebnJoi1pmjy/molkpTF5YMopnfLWNLANdeH/JhI+BYdK9brqT3Ls1i5rh
	aGdAStykAvd/P6lkB09EXDdgNIqaQRNLvZ8TuDrNzVTPo1mhOzLJ9uEMWMKq7zvAYSNz
	EEa7bQuxEoJaqro1pP7/v0ID8NEd7Jg8yDjCvXGYQT1csdYh9F9TbMM5gQM97tvqoTin
	6XowjJM8HGsqs451ezpz15df5eYGXCkny3EvAT4P9U1AoBzzqXjXpYWA4OJGUiMAQ5nq
	sgmg==
Received: by 10.68.194.168 with SMTP id hx8mr13031565pbc.36.1344610667793;
	Fri, 10 Aug 2012 07:57:47 -0700 (PDT)
Received: from [192.168.1.66] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id wi6sm3487942pbc.35.2012.08.10.07.57.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 07:57:46 -0700 (PDT)
References: <154964BA-5A71-4E33-84CA-FE5929C67D22@gmail.com>
	<E48CCA3B-5D4A-439C-A3A4-E5CE79237DD4@gmail.com>
In-Reply-To: <E48CCA3B-5D4A-439C-A3A4-E5CE79237DD4@gmail.com>
Mime-Version: 1.0 (1.0)
Message-Id: <0EA73ACA-483C-4156-BAB4-9FAF7DA1E4CC@gmail.com>
Cc: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
X-Mailer: iPad Mail (9B206)
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 10 Aug 2012 07:57:44 -0700
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Fri, 10 Aug 2012 15:09:38 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



-Khem

On Aug 10, 2012, at 5:00 AM, Elvis Dowson <elvis.dowson@gmail.com> wrote:

>=20
> On Aug 10, 2012, at 10:44 AM, Elvis Dowson wrote:
>=20
>> I'm working on adding a gcc-4.5 recipe to the meta-openembedded/toolchain=
-layer.=20
>>=20
>> I've based the files off the gcc-4.6 recipes, and taken the patches for g=
cc-4.5.1 from the poky/bernard branch.
>>=20
>> I get the following QA error:
>>=20
>> NOTE: Running task 806 of 890 (ID: 594, /tool/yocto/meta-openembedded/too=
lchain-layer/recipes-devtools/gcc/gcc-runtime_4.5.bb, do_configure)
>> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/t=
mp/work/ppc440-poky-linux/libgcc-4.5.1+svnr162773-r14/packages-split/libgcc/=
lib/libgcc_s.so.1'
>>=20
>> Searching through the mailing lists, I find that a potential fix would be=
 to add the following to gcc-configure-common.inc
>>=20
>> TARGET_CC_ARCH +=3D "${LDFLAGS}"
>>=20
>> I was wondering why this issue manifests for gcc-4.5, and not for gcc-4.6=
 and gcc-4.7?
>>=20
>> After all, the only difference between the 4.6 and 4.7 recipes is just th=
e list of patches and the SRCREV, and the BINUTILS version (2.21) used for g=
cc-4.5, and running it against the current master branches for poky and meta=
-openembedded.
>=20
> Adding the TARGET_CC_ARCH +=3D "{LDFLAGS} to both gcc-configure-common.inc=
 in the poky layer, and to libgcc-4.5.inc in the meta-openembedded/toolchain=
 layer helped me get past the QA Error for libgcc, but now I get a whole bun=
ch of similar errors for a whole bunch of other packages.
>=20
> NOTE: Running noexec task 967 of 974 (ID: 7, /tool/yocto/meta-openembedded=
/toolchain-layer/recipes-devtools/gcc/gcc_4.5.bb, do_package_write)
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-lib/usr/lib/libp=
erl.so.5.14.2'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-encode-by=
te/usr/lib/perl/5.14.2/auto/Encode/Byte/Byte.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-encode-cn=
/usr/lib/perl/5.14.2/auto/Encode/CN/CN.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-encode-eb=
cdic/usr/lib/perl/5.14.2/auto/Encode/EBCDIC/EBCDIC.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-encode-jp=
/usr/lib/perl/5.14.2/auto/Encode/JP/JP.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-encode-kr=
/usr/lib/perl/5.14.2/auto/Encode/KR/KR.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-encode-sy=
mbol/usr/lib/perl/5.14.2/auto/Encode/Symbol/Symbol.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-encode-tw=
/usr/lib/perl/5.14.2/auto/Encode/TW/TW.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-encode-un=
icode/usr/lib/perl/5.14.2/auto/Encode/Unicode/Unicode.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-b/usr/lib=
/perl/5.14.2/auto/B/B.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-compress/=
usr/lib/perl/5.14.2/auto/Compress/Raw/Zlib/Zlib.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-compress/=
usr/lib/perl/5.14.2/auto/Compress/Raw/Bzip2/Bzip2.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-cwd/usr/l=
ib/perl/5.14.2/auto/Cwd/Cwd.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-data/usr/=
lib/perl/5.14.2/auto/Data/Dumper/Dumper.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-devel/usr=
/lib/perl/5.14.2/auto/Devel/Peek/Peek.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-devel/usr=
/lib/perl/5.14.2/auto/Devel/PPPort/PPPort.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-devel/usr=
/lib/perl/5.14.2/auto/Devel/DProf/DProf.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-digest/us=
r/lib/perl/5.14.2/auto/Digest/MD5/MD5.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-digest/us=
r/lib/perl/5.14.2/auto/Digest/SHA/SHA.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-encode/us=
r/lib/perl/5.14.2/auto/Encode/Encode.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-fcntl/usr=
/lib/perl/5.14.2/auto/Fcntl/Fcntl.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-file/usr/=
lib/perl/5.14.2/auto/File/Glob/Glob.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-filter/us=
r/lib/perl/5.14.2/auto/Filter/Util/Call/Call.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-gdbm-file=
/usr/lib/perl/5.14.2/auto/GDBM_File/GDBM_File.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-hash/usr/=
lib/perl/5.14.2/auto/Hash/Util/Util.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-hash/usr/=
lib/perl/5.14.2/auto/Hash/Util/FieldHash/FieldHash.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-i18n/usr/=
lib/perl/5.14.2/auto/I18N/Langinfo/Langinfo.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-io/usr/li=
b/perl/5.14.2/auto/IO/IO.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-ipc/usr/l=
ib/perl/5.14.2/auto/IPC/SysV/SysV.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-list/usr/=
lib/perl/5.14.2/auto/List/Util/Util.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-mime/usr/=
lib/perl/5.14.2/auto/MIME/Base64/Base64.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-math/usr/=
lib/perl/5.14.2/auto/Math/BigInt/FastCalc/FastCalc.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-opcode/us=
r/lib/perl/5.14.2/auto/Opcode/Opcode.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-posix/usr=
/lib/perl/5.14.2/auto/POSIX/POSIX.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-perlio/us=
r/lib/perl/5.14.2/auto/PerlIO/scalar/scalar.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-perlio/us=
r/lib/perl/5.14.2/auto/PerlIO/via/via.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-perlio/us=
r/lib/perl/5.14.2/auto/PerlIO/encoding/encoding.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-sdbm-file=
/usr/lib/perl/5.14.2/auto/SDBM_File/SDBM_File.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-socket/us=
r/lib/perl/5.14.2/auto/Socket/Socket.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-storable/=
usr/lib/perl/5.14.2/auto/Storable/Storable.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-sys/usr/l=
ib/perl/5.14.2/auto/Sys/Hostname/Hostname.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-sys/usr/l=
ib/perl/5.14.2/auto/Sys/Syslog/Syslog.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-text/usr/=
lib/perl/5.14.2/auto/Text/Soundex/Soundex.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-time/usr/=
lib/perl/5.14.2/auto/Time/HiRes/HiRes.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-time/usr/=
lib/perl/5.14.2/auto/Time/Piece/Piece.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-unicode/u=
sr/lib/perl/5.14.2/auto/Unicode/Normalize/Normalize.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-unicode/u=
sr/lib/perl/5.14.2/auto/Unicode/Collate/Collate.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-attribute=
s/usr/lib/perl/5.14.2/auto/attributes/attributes.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-mro/usr/l=
ib/perl/5.14.2/auto/mro/mro.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-re/usr/li=
b/perl/5.14.2/auto/re/re.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-threads/u=
sr/lib/perl/5.14.2/auto/threads/threads.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary: '/tool/yocto/poky/build/tm=
p/work/ppc440-poky-linux/perl-5.14.2-r8/packages-split/perl-module-threads/u=
sr/lib/perl/5.14.2/auto/threads/shared/shared.so'
> ERROR: QA run found fatal errors. Please consider fixing them.
> ERROR: Function failed: do_package_qa
> ERROR: Logfile of failure stored in: /tool/yocto/poky/build/tmp/work/ppc44=
0-poky-linux/perl-5.14.2-r8/temp/log.do_package.39956
> NOTE: package perl-5.14.2-r8: task do_package: Failed
> ERROR: Task 322 (/tool/yocto/poky/meta/recipes-devtools/perl/perl_5.14.2.b=
b, do_package) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 967 tasks of which 828 didn't need to be re=
run and 1 failed.
>=20
>=20
> What should I do? It doesn't happen with gcc-4.6 or gcc-4.7.


Add the same option to recipes. Gcc 4.5 did not do gnu hash by default


>=20
> Best regards,
>=20
> Elvis Dowson
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


