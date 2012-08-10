Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SzidD-0001wA-Fa
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 08:23:35 +0200
Received: by ghbz2 with SMTP id z2so1160504ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Aug 2012 23:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:mime-version:content-type:subject:date:in-reply-to:to
	:references:message-id:x-mailer;
	bh=Tl/+aYKuP99O3Cz25JjB1ZmhQ3I6yupWFA4uD854S6o=;
	b=G8E36c9ASgRK8uQ0QudVHxwsnGVKpcQdxwgLFZmUBfvXFklqwnWZOMwQWL3RVi5XYO
	qVz7jwR7qUuSnsFv3fzigFO2QrdMjcYf+SfDv+69l1u1nFHIk8rVeqA/oubAOp8xkP8E
	yzpmEklQKcegW3V1pSjWuL8GLw4NvnHy02irGLDJN30zGhgpRllRa60l7j+FT69IL6vX
	42C7p1ZYjSz2esxnwdQglmkNhAPhOkstVuQ+emkmalJM54Go9z5TIivbtTjkHTF8RcGl
	4D/rkoLkPwBtEVdKZhIK+kZHjT2HPsm4V7sAwqi86sVvWAarwyaamuMEsEXPtn1Ou+sg
	rNoA==
Received: by 10.66.75.104 with SMTP id b8mr3924348paw.21.1344579105426;
	Thu, 09 Aug 2012 23:11:45 -0700 (PDT)
Received: from [192.168.1.101] ([94.205.108.162])
	by mx.google.com with ESMTPS id pv8sm2685495pbb.25.2012.08.09.23.11.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Aug 2012 23:11:44 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Mime-Version: 1.0 (Apple Message framework v1278)
Date: Fri, 10 Aug 2012 10:11:38 +0400
In-Reply-To: <A7CCD9A2-354C-4E98-8A79-5CE713415570@gmail.com>
To: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
References: <A7CCD9A2-354C-4E98-8A79-5CE713415570@gmail.com>
Message-Id: <8FD4C9C7-FE92-4124-BB72-2CE9A3B8BDA9@gmail.com>
X-Mailer: Apple Mail (2.1278)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: gcc_4.5.inc: setting BINV value
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
X-List-Received-Date: Fri, 10 Aug 2012 06:23:35 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

On Aug 10, 2012, at 9:32 AM, Elvis Dowson wrote:

> I'm working on writing a gcc-4.5 recipe inside the =
meta-openembedded/toolchain-layer folder, against the current yocto and =
meta-openembedded master.=20
>=20
> I have a small problem, which is that the correct target directory for =
copying the limits.h file is not being created in the filesystem.
>=20
> This is the error that I'm getting is as follows:
>=20
> | cp: cannot create regular file =
`/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/gcc-cross-initial-4.5.1=
+svnr162773-r13/image/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/=
lib/ppc440-poky-linux.gcc-cross-initial/gcc/powerpc-poky-linux/4.5.2/inclu=
de-fixed/limits.h': No such file or directory
> | ERROR: Function failed: do_install (see =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/gcc-cross-initial-4.5.1+=
svnr162773-r13/temp/log.do_install.54176 for further information)
> NOTE: package gcc-cross-initial-4.5.1+svnr162773-r13: task do_install: =
Failed
> ERROR: Task 952 =
(/tool/yocto/meta-openembedded/toolchain-layer/recipes-devtools/gcc/gcc-cr=
oss-initial_4.5.bb, do_install) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 792 tasks of which 246 didn't need to =
be rerun and 1 failed.
>=20
> The 4.5.2 directory doesn't exist on the filesystem:
>=20
> =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/gcc-cross-initial-4.5.1+=
svnr162773-r13/image/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/l=
ib/ppc440-poky-linux.gcc-cross-initial/gcc/powerpc-poky-linux/4.5.2
>=20
> but it does have a 4.5.1 directory:
>=20
> =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/gcc-cross-initial-4.5.1+=
svnr162773-r13/image/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/l=
ib/ppc440-poky-linux.gcc-cross-initial/gcc/powerpc-poky-linux/4.5.1
>=20
> The 4.5.2 value is probably being picked up by the BINV variable, =
which is set to 4.5.2. I modelled the gcc-4.5.inc file after the =
gcc-4.6.inc and gcc-4.7.inc.
>=20
> file: gcc-4.5.inc
>=20
> require recipes-devtools/gcc/gcc-common.inc
>=20
> PR =3D "r13"
>=20
> # Third digit in PV should be incremented after a minor release
> # happens from this branch on gcc e.g. currently its 4.5.4
> # when 4.5.5 is released and we bump SRCREV beyond the release
> # on branch then PV should be incremented to 4.5.5+svnr${SRCPV}
> # to reflect that change
>=20
> PV =3D "4.5.1+svnr${SRCPV}"
>=20
> # BINV should be incremented after updating to a revision
> # after a minor gcc release (e.g. 4.5.3 or 4.5.4) has been made
> # the value will be minor-release+1 e.g. if current minor release was
> # 4.5.4 then the value below will have 5 which will mean 4.5.5
> # which will be next minor release and so on.
>=20
> BINV =3D "4.5.2"
>=20
> SRCREV =3D "162773"
> BRANCH =3D "gcc-4_5-branch"
> FILESPATH =3D "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.5' ], =
d)}"
>=20
> DEPENDS =3D+ "mpfr gmp libmpc elfutils"
> NATIVEDEPS =3D "mpfr-native gmp-native gettext-native libmpc-native =
elfutils-native"
>=20
> LICENSE=3D"GPL-3.0-with-GCC-exception & GPLv3"
>=20
> What should I do? Set BINV =3D "4.5.1" ?
>=20

Setting BINV =3D "4.5.1" fixes the problem, but is that the right thing =
to do? The svn SRVREV that I used is the official gcc-4.5.1 release, so =
should both PV and BINV be set to 4.5.1?

Best regards,

Elvis Dowson


