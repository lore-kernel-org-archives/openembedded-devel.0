Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kartikmohta@gmail.com>) id 1Q7ass-0003BN-H6
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Apr 2011 00:07:30 +0200
Received: by iye7 with SMTP id 7so2036272iye.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2011 15:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:from:date:message-id:subject:to
	:content-type; bh=MQKoxmLxpwQz3FCxY1vVPB0DUsHGjqf6grbcfzU6WRo=;
	b=wlUSJEJpglYbBDHUG97f8Q8Z2uKNf8ziKWO3yD4e9m8tMECghqB5MGuFs8NQcTKdDg
	KdJCVNOQ+YrPeMQbPUQSngYcdOW8odDZseJ7f8/C9QhOqSOgycJejA6BnKnAAo2qlk56
	xFAvHRo4ZizvYifbuS8ezXZsRqu2uXPotl3R0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=gZlIFUdG4dTcumjjAEVJo4DO8XNj3XJQhtaDNstlA7VXi+SFIfG4i1ayBAFTUs0GcW
	LrYamGNDGJbTWi6YthReNJGfGHZm/bn/y0fdLlc+CT4Xao/hQjBkfaT+QQY30HLCvGpN
	kjXGBv4qzrX2R8EpRKDgp+HxKrFnTZDPeMJkk=
Received: by 10.43.48.131 with SMTP id uw3mr151738icb.405.1302127522442; Wed,
	06 Apr 2011 15:05:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.42.222.135 with HTTP; Wed, 6 Apr 2011 15:04:57 -0700 (PDT)
From: Kartik Mohta <kartikmohta@gmail.com>
Date: Wed, 6 Apr 2011 18:04:57 -0400
Message-ID: <BANLkTimPVgqbjMhJnBcniZgJBbRd_1D8yQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: python-distutils_2.6.6: config/Makefile contains sysroot
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
X-List-Received-Date: Wed, 06 Apr 2011 22:07:30 -0000
Content-Type: text/plain; charset=UTF-8

The Makefile (in /usr/lib/python2.6/config) used by distutils to
compile modules contains the original sysroot used while compiling
Python on the host:

CC=        arm-angstrom-linux-gnueabi-gcc -march=armv7-a
-mtune=cortex-a8 -mfpu=neon -mfloat-abi=hard -mthumb-interwork
-mno-thumb --sysroot=/home/kartikmohta/overo-oe/tmp/sysroots/armv7a-hardfp-angstrom-linux-gnueabi
CXX=       arm-angstrom-linux-gnueabi-g++ -march=armv7-a
-mtune=cortex-a8 -mfpu=neon -mfloat-abi=hard -mthumb-interwork
-mno-thumb --sysroot=/home/kartikmohta/overo-oe/tmp/sysroots/armv7a-hardfp-angstrom-linux-gnueabi

This leads to the following error when compiling modules using distutils:
/usr/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/bin/ld:
this linker was not configured to use sysroots


Can these sysroot arguments be removed in the do_install_append() step
using a simple sed script?

-- 
Kartik


