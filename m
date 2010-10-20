Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P8WoU-0005FO-RC
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Oct 2010 13:26:35 +0200
Received: by yxt3 with SMTP id 3so1589721yxt.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 04:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=y3LkFR3yPtk9D3UHojvyN+0oEnG6hwOXyp+8a7re3bQ=;
	b=nBL6uMsjso4U91PvbR3DnpIXg30iHqhyz//OMRn1WSjMIyOGo6l18t4vCXl5Ab2MlV
	1RVOj+Wp87f7PI0gCwNu7EvDqoJ5k9kSLZTbrlcMrXTOZX+wxPXnpETSk+lKjXKBhQKh
	4tMWC08nis+fbLaqKyJ4602+By+000RRq6l+4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=AELTVtLHkHP2fs0Nlvt5MnGXhi97ja7o1xG5LRF48t8RW2Y/xRBHlziktC1jtoCW7r
	Sa0i4F8MQIMk8suNA899Z2RE3NmAePJekSKbJi1gQjqLoICtg40cZ+r6CjoXSA3aTb7P
	PBnIA59qCJ4WIEUrdYgZ1573ZLjRX4WOswCq4=
MIME-Version: 1.0
Received: by 10.42.216.131 with SMTP id hi3mr5336827icb.322.1287573954972;
	Wed, 20 Oct 2010 04:25:54 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Wed, 20 Oct 2010 04:25:54 -0700 (PDT)
In-Reply-To: <4CBEB7E8.5020109@nedap.com>
References: <4CBEB7E8.5020109@nedap.com>
Date: Wed, 20 Oct 2010 13:25:54 +0200
Message-ID: <AANLkTikBiKGuQYXCdi_QMirA7_AjQn9b0A0CWtmkMu90@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: failure building gcc-cross-initial for armv5te
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
X-List-Received-Date: Wed, 20 Oct 2010 11:26:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/20 Jaap de Jong <jaap.dejong@nedap.com>:
> =A0building gcc-cross-initial for armv5te fails:
>
> =A0 ///
> =A0 | checking for arm-angstrom-linux-gnueabi-ranlib...
> =A0 arm-angstrom-linux-gnueabi-ranlib
> =A0 | checking for arm-angstrom-linux-gnueabi-strip...
> =A0 arm-angstrom-linux-gnueabi-strip
> =A0 | checking whether ln -s works... yes
> =A0 | checking for arm-angstrom-linux-gnueabi-gcc...
>
> /media/OpenEmbedded/unstable/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-=
cross-initial-4.5-r12.0+svnr164562/gcc-4.5/build.i686-linux.arm-angstrom-li=
nux-gnueabi/./gcc/xgcc
>
> -B/media/OpenEmbedded/unstable/tmp/work/armv5te-angstrom-linux-gnueabi/gc=
c-cross-initial-4.5-r12.0+svnr164562/gcc-4.5/build.i686-linux.arm-angstrom-=
linux-gnueabi/./gcc/
> =A0 -march=3Darmv5te -mtune=3Darm926ej-s -mthumb-interwork -mno-thumb
>
> -isystem/media/OpenEmbedded/unstable/tmp/sysroots/armv5te-angstrom-linux-=
gnueabi/usr/include
>
> -B/media/OpenEmbedded/unstable/tmp/sysroots/i686-linux/usr/armv5te/arm-an=
gstrom-linux-gnueabi/bin/
>
> -B/media/OpenEmbedded/unstable/tmp/sysroots/i686-linux/usr/armv5te/arm-an=
gstrom-linux-gnueabi/lib/
> =A0 -isystem
>
> /media/OpenEmbedded/unstable/tmp/sysroots/i686-linux/usr/armv5te/arm-angs=
trom-linux-gnueabi/include
> =A0 -isystem
>
> /media/OpenEmbedded/unstable/tmp/sysroots/i686-linux/usr/armv5te/arm-angs=
trom-linux-gnueabi/sys-include
>
> --sysroot=3D/media/OpenEmbedded/unstable/tmp/sysroots/armv5te-angstrom-li=
nux-gnueabi
> =A0 | checking for suffix of object files... configure: error: in
>
> `/media/OpenEmbedded/unstable/tmp/work/armv5te-angstrom-linux-gnueabi/gcc=
-cross-initial-4.5-r12.0+svnr164562/gcc-4.5/build.i686-linux.arm-angstrom-l=
inux-gnueabi/arm-angstrom-linux-gnueabi/libgcc':
> =A0 | configure: error: cannot compute suffix of object files: cannot
> =A0 compile
> =A0 | See `config.log' for more details.
> =A0 | make[1]: *** [configure-target-libgcc] Error 1
> =A0 | make[1]: Leaving directory
>
> `/media/OpenEmbedded/unstable/tmp/work/armv5te-angstrom-linux-gnueabi/gcc=
-cross-initial-4.5-r12.0+svnr164562/gcc-4.5/build.i686-linux.arm-angstrom-l=
inux-gnueabi'
> =A0 | make: *** [all] Error 2
> =A0 | FATAL: oe_runmake failed
> =A0 NOTE: Task failed:
>
> /media/OpenEmbedded/unstable/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-=
cross-initial-4.5-r12.0+svnr164562/temp/log.do_compile.1864
> =A0 ERROR: TaskFailed event exception, aborting
> =A0 ERROR: Build of
>
> /media/OpenEmbedded/unstable/org.openembedded.dev/recipes/gcc/gcc-cross-i=
nitial_4.5.bb
> =A0 do_compile failed
> =A0 ERROR: Task 6228
>
> (/media/OpenEmbedded/unstable/org.openembedded.dev/recipes/gcc/gcc-cross-=
initial_4.5.bb,
> =A0 do_compile) failed
> =A0 NOTE: Waiting for 2 active tasks to finish
> =A0 NOTE: 1:
>
> /media/OpenEmbedded/unstable/org.openembedded.dev/recipes/classpath/class=
path-native_0.98.bb,
> =A0 do_install (1885)
> =A0 NOTE: 2:
>
> virtual:native:/media/OpenEmbedded/unstable/org.openembedded.dev/recipes/=
xorg-lib/libx11_1.3.99.902.bb,
> =A0 do_install (1886)
> =A0 NOTE: Waiting for 1 active tasks to finish
> =A0 NOTE: 1:
>
> /media/OpenEmbedded/unstable/org.openembedded.dev/recipes/classpath/class=
path-native_0.98.bb,
> =A0 do_install (1885)
> =A0 NOTE: Tasks Summary: Attempted 888 tasks of which 888 didn't need to
> =A0 be rerun and 1 failed.
> =A0 ERROR:
>
> '/media/OpenEmbedded/unstable/org.openembedded.dev/recipes/gcc/gcc-cross-=
initial_4.5.bb'
> =A0 failed
>
>
> Checking
>
> tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r12.0+svnr1=
64562/gcc-4.5/build.i686-linux.arm-angstrom-linux-gnueabi/gcc/config.log
>
> reveals:
>
> =A0 configure:4791: checking whether compiler driver understands Ada
> =A0 configure:4814: result: no
> =A0 configure:4851: checking how to run the C preprocessor
> =A0 configure:4921: result: gcc -E
> =A0 configure:4941: gcc -E =A0conftest.c
> =A0 configure:4941: $? =3D 0
> =A0 configure:4955: gcc -E =A0conftest.c
> =A0 conftest.c:11: fatal error: ac_nonexistent.h: No such file or directo=
ry
> =A0 compilation terminated.
>
>
> Not sure if it has anything to do with it.
> I can't find ac_nonexistent.h, but perhaps this is intended looking at th=
e
> filename...
> Any help is appreciated!
> Jaap
> _______________________________________________

With the testing-next branch things build fine with me
(ditro slugos, machine nslu2le  and nslu2be)

Frans


