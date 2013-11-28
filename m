Return-Path: <ticotimo@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id B34F2610D4
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2013 22:00:05 +0000 (UTC)
Received: by mail-la0-f53.google.com with SMTP id ea20so6205473lab.26
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2013 14:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=Nitv1fsZQV4XFVk6VQU+a12EIWBmlBMmOxtyJvKgYvw=;
	b=s8qncr9WzcR01RqebwkLA8DzjUBHXuLwhmp+ddZ9N5KBQGrDyxyS9/Gg7zxp8f0vJq
	QnJD7tddniBHUxZd9R6kkr7uSuBaSAvlHNeHHtNX7DgWYHS75qhQYXzyaaGSFs+47bnB
	iPVBba/zvoWnnGcW1SyFobEa9bvGM8+WgCn3nQpCjVvwPrwUxk7GOP4ls4qeQ+wy/SH7
	KOc9G0LE64gKF9rmnfp3voA70lK7/qBFzuGYATjc75HE3+ceJ+wlQfKer6h2PaYV9E4H
	tUbKgsaMjTjHWjtVWUKoxhHROF8s+VO4RVEfOfObirobJyuc1qIuPIJGeHSsJZ3kdXx3
	p0Ag==
MIME-Version: 1.0
X-Received: by 10.112.167.3 with SMTP id zk3mr16744834lbb.23.1385676004244;
	Thu, 28 Nov 2013 14:00:04 -0800 (PST)
Received: by 10.114.74.174 with HTTP; Thu, 28 Nov 2013 14:00:04 -0800 (PST)
Date: Thu, 28 Nov 2013 14:00:04 -0800
Message-ID: <CANx9H-DMjo0JaHyGqgxh31wX77Z_OmpjF=cgAayLKyYcKLenxw@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: Openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: xbmc build failing
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
X-List-Received-Date: Thu, 28 Nov 2013 22:00:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

using angstrom-v2013.12-yocto1.5 on Ubuntu 12.04.3 LTS x86_64:

xbmc fails building euphoria screen saver-- configure problem?:

| make[4]: Entering directory
`/mnt/work/setup-scripts/build/tmp-angstrom_v2013_12-eglibc/work/armv7ahf-vfp-neon-angstrom-linux-gnueabi/xbmc/11.0+gitrAUTOINC+82388d55da-r14/git/xbmc/screensavers/rsxs-0.9/src'
| Making all in euphoria
| make[5]: Entering directory
`/mnt/work/setup-scripts/build/tmp-angstrom_v2013_12-eglibc/work/armv7ahf-vfp-neon-angstrom-linux-gnueabi/xbmc/11.0+gitrAUTOINC+82388d55da-r14/git/xbmc/screensavers/rsxs-0.9/src/euphoria'
| depbase=`echo ../common.o | sed 's|[^/]*$|.deps/&|;s|\.o$||'`;\
| arm-angstrom-linux-gnueabi-g++  -march=armv7-a -marm -mthumb-interwork
-mfloat-abi=hard -mfpu=neon
--sysroot=/mnt/work/setup-scripts/build/tmp-angstrom_v2013_12-eglibc/sysroots/beaglebone
-DHAVE_CONFIG_H -I. -I../..  -DPKGDATADIR=\"/usr/share/rsxs\" -I./..
-I../../lib  -D_LINUX -DXBMC
-I/mnt/work/setup-scripts/build/tmp-angstrom_v2013_12-eglibc/sysroots/beaglebone/usr/include/libpng16
  -fexpensive-optimizations -fomit-frame-pointer -O4 -ffast-math
-fpermissive -fvisibility-inlines-hidden -fPIC -DPIC -D_REENTRANT
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -g -D_DEBUG -Wall -O2
-mno-apcs-stack-check -MT ../common.o -MD -MP -MF $depbase.Tpo -c -o
../common.o ../common.cc &&\
| mv -f $depbase.Tpo $depbase.Po
| In file included from ../common.cc:50:0:
|
/mnt/work/setup-scripts/build/tmp-angstrom_v2013_12-eglibc/sysroots/beaglebone/usr/include/c++/ctime:70:11:
error: '::gmtime' has not been declared
|    using ::gmtime;
|            ^
|
/mnt/work/setup-scripts/build/tmp-angstrom_v2013_12-eglibc/sysroots/beaglebone/usr/include/c++/ctime:71:11:
error: '::localtime' has not been declared
|    using ::localtime;
|            ^
| make[5]: *** [../common.o] Error 1
| make[5]: Leaving directory
`/mnt/work/setup-scripts/build/tmp-angstrom_v2013_12-eglibc/work/armv7ahf-vfp-neon-angstrom-linux-gnueabi/xbmc/11.0+gitrAUTOINC+82388d55da-r14/git/xbmc/screensavers/rsxs-0.9/src/euphoria'

