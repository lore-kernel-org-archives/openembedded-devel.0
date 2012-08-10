Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Szi1D-00015M-3a
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 07:44:19 +0200
Received: by pbcwy7 with SMTP id wy7so1882478pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Aug 2012 22:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:date:message-id:to:mime-version:x-mailer;
	bh=FBWuwbR2OjPkcJF2vKGXX+/9iIASWKdKwnZVrubQlIo=;
	b=jDo/f0wdQO3Fpg8x0RhSkEBqMVS/JlsNhDAAKy5n8lynpXsFLgJ0rgMwptkx1CYGjO
	iZ8H2HCnHV91X5tdP5OOF7ivnhG9c0LxP7aaT5DavEZhY3h0+2EGJZunWN6xFPnzALV9
	ZReTa4+nJRv5+YzsJG8ACN4ZPxkz8AmrcR1ag64YbtijcxKqDKd+yRa1zia98u/Txdfh
	mlzIiS8hDPEfohmRW/zPfIVl/+SYM1dnrHdfgODrOgmyTnKOQs2bgXRW3383G1DDtjia
	JaOllK5a1tuUHtWaZsUSlCvY2tkgXirQiG9N2ahIK5S/5PaG5DuggNUeZcZyjeQlHedn
	QWPw==
Received: by 10.66.84.6 with SMTP id u6mr3508956pay.75.1344576748953;
	Thu, 09 Aug 2012 22:32:28 -0700 (PDT)
Received: from [192.168.1.101] ([94.205.108.162])
	by mx.google.com with ESMTPS id qr3sm2605706pbc.69.2012.08.09.22.32.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Aug 2012 22:32:28 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Date: Fri, 10 Aug 2012 09:32:23 +0400
Message-Id: <A7CCD9A2-354C-4E98-8A79-5CE713415570@gmail.com>
To: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1278)
X-Mailer: Apple Mail (2.1278)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: gcc_4.5.inc: setting BINV value
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
X-List-Received-Date: Fri, 10 Aug 2012 05:44:19 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,
       I'm working on writing a gcc-4.5 recipe inside the =
meta-openembedded/toolchain-layer folder, against the current yocto and =
meta-openembedded master.=20

I have a small problem, which is that the correct target directory for =
copying the limits.h file is not being created in the filesystem.

This is the error that I'm getting is as follows:

| cp: cannot create regular file =
`/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/gcc-cross-initial-4.5.1=
+svnr162773-r13/image/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/=
lib/ppc440-poky-linux.gcc-cross-initial/gcc/powerpc-poky-linux/4.5.2/inclu=
de-fixed/limits.h': No such file or directory
| ERROR: Function failed: do_install (see =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/gcc-cross-initial-4.5.1+=
svnr162773-r13/temp/log.do_install.54176 for further information)
NOTE: package gcc-cross-initial-4.5.1+svnr162773-r13: task do_install: =
Failed
ERROR: Task 952 =
(/tool/yocto/meta-openembedded/toolchain-layer/recipes-devtools/gcc/gcc-cr=
oss-initial_4.5.bb, do_install) failed with exit code '1'
NOTE: Tasks Summary: Attempted 792 tasks of which 246 didn't need to be =
rerun and 1 failed.

The 4.5.2 directory doesn't exist on the filesystem:

=
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/gcc-cross-initial-4.5.1+=
svnr162773-r13/image/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/l=
ib/ppc440-poky-linux.gcc-cross-initial/gcc/powerpc-poky-linux/4.5.2

but it does have a 4.5.1 directory:

=
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/gcc-cross-initial-4.5.1+=
svnr162773-r13/image/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/l=
ib/ppc440-poky-linux.gcc-cross-initial/gcc/powerpc-poky-linux/4.5.1

The 4.5.2 value is probably being picked up by the BINV variable, which =
is set to 4.5.2. I modelled the gcc-4.5.inc file after the gcc-4.6.inc =
and gcc-4.7.inc.

file: gcc-4.5.inc

require recipes-devtools/gcc/gcc-common.inc

PR =3D "r13"

# Third digit in PV should be incremented after a minor release
# happens from this branch on gcc e.g. currently its 4.5.4
# when 4.5.5 is released and we bump SRCREV beyond the release
# on branch then PV should be incremented to 4.5.5+svnr${SRCPV}
# to reflect that change

PV =3D "4.5.1+svnr${SRCPV}"

# BINV should be incremented after updating to a revision
# after a minor gcc release (e.g. 4.5.3 or 4.5.4) has been made
# the value will be minor-release+1 e.g. if current minor release was
# 4.5.4 then the value below will have 5 which will mean 4.5.5
# which will be next minor release and so on.

BINV =3D "4.5.2"

SRCREV =3D "162773"
BRANCH =3D "gcc-4_5-branch"
FILESPATH =3D "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.5' ], d)}"

DEPENDS =3D+ "mpfr gmp libmpc elfutils"
NATIVEDEPS =3D "mpfr-native gmp-native gettext-native libmpc-native =
elfutils-native"

LICENSE=3D"GPL-3.0-with-GCC-exception & GPLv3"

What should I do? Set BINV =3D "4.5.1" ?

Best regards,

Elvis Dowson=

