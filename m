Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rcvengr2@gmail.com>) id 1QbIOk-00037j-MG
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Jun 2011 22:27:10 +0200
Received: by bwf20 with SMTP id 20so1827860bwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jun 2011 13:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:from:date:message-id:subject:to
	:content-type; bh=Nn9e1hYl3MirfDeQiF48vcS53MSQT+DyJSCtYxoFKrc=;
	b=lSgS4/WaWW9ez5CScDiUznYpaull+k5S0p4Ew+nZxpoh+tY+Ps7q0bW8th5zgn9Goo
	b37HrqFpaDqC4FZDq0M+xt9c+02d0IUu+AmfMjylxL3dol7RSuC7gfBd5VtxRHFTvHmw
	C5V+3gJuSirw1l4NILgq+5oD19gfGU+kyJqeM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=jQUWwvqdZR2k4/65O/7i5+Xy1UbTNIa5U4umcAvnKrtH6BvhJsPAY7WHE97y54SiOi
	wXnuKZeNld6PLZ9OHvYFkeLhNivfQV819ajyIyKXY+wkGuhwxEduS2zYPzvL4ONjueQi
	mKGTcETraRNmagiMXNMA2UxDrXLbIXZ/60KF0=
Received: by 10.205.82.139 with SMTP id ac11mr4662972bkc.196.1309206210140;
	Mon, 27 Jun 2011 13:23:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.204.153.212 with HTTP; Mon, 27 Jun 2011 13:23:10 -0700 (PDT)
From: Bob Cvengros <rcvengr2@gmail.com>
Date: Mon, 27 Jun 2011 15:23:10 -0500
Message-ID: <BANLkTik1SX0BQ=rdoJorZN0UWcK1Mnn9Qg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: python-numpy cannot find libraries
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
X-List-Received-Date: Mon, 27 Jun 2011 20:27:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I am having a problem compiling python-numpy similar to that posted
here<http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-April/031840.html>,
however this issue does not appear to have been resolved.

The cross compiler cannot find the correct libraries and seems to be looking
for the libraries on my host machine path rather than the libraries created
for my ARM device. Specifically, I find the following in the resultant
log.do_compile.4120 file:


----------------------------------------------------
$ bitbake -f -c compile python-numpy

......

Running from numpy source directory.
F2PY Version 2
blas_opt_info:
blas_mkl_info:
/home/rcvengr2/oe/tmp/work/armv7a-angstrom-linux-gnueabi/python-numpy-1.4.1-ml0/numpy-1.4.1/numpy/distutils/system_info.py:520:
UserWarning: Specified path /opt/intel/mkl/9.1.023/lib/32/ is invalid.
  warnings.warn('Specified path %s is invalid.' % d)
  NOT AVAILABLE

atlas_blas_threads_info:
Setting PTATLAS=ATLAS
  *libraries ptf77blas,ptcblas,atlas not found in
/home/rcvengr2/oe/tmp//sysroots/x86_64-linux/usr/lib*
  *libraries ptf77blas,ptcblas,atlas not found in /usr/local/lib*
Setting PTATLAS=ATLAS
Setting PTATLAS=ATLAS
  FOUND:
    libraries = ['ptf77blas', 'ptcblas', 'atlas']
    library_dirs = ['/usr/lib64/atlas-base']
    language = c
    include_dirs = ['/usr/include/atlas']


*And later:*
*
*
Could not locate executable arm-angstrom-linux-gnueabi-g77 -march=armv7-a
-mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb
--sysroot=/home/rcvengr2/oe/tmp//sysroots/armv7a-angstrom-linux-gnueabi
Could not locate executable g77
Could not locate executable f77
customize IntelFCompiler
Could not locate executable ifort
Could not locate executable ifc
customize LaheyFCompiler
Could not locate executable lf95
customize PGroupFCompiler
Could not locate executable pgf90
customize AbsoftFCompiler
Could not locate executable f90
customize NAGFCompiler
Found executable /usr/bin/f95
nag: no Fortran 77 compiler found


....and so on
------------------------------------------------------

do_compile eventually throws an error because it cannot recognize the ATLAS
code, but I have traced it back to not being able to find the libraries
listed. Given the provided link, this problem is not unique to my situation.
I wish I could fix it, but my technical skills are not up to the task. I
could use some help resolving the issue.

Thanks,
Bob Cvengros

