Received: from [209.85.217.170] (helo=mail-gx0-f170.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Loljs-0008Sa-9O
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Mar 2009 23:43:25 +0200
Received: by gxk18 with SMTP id 18so5709067gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2009 14:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=WM1o82elQBEhl/I0rED/nEs7rDjJTTh3JKfXGrdhitU=;
	b=XUNY1P8aPihKmCLxxpD6cIUj6zTu/QgOd+vumXyhZYk2joZTrpmYaGndjflnOmgfsX
	ANLQ1ndoCrrEv4DQ7bNbUqzYxu/i9ZoYSKoR7X4jokFH0rILcvrltakl0k2362fPhGSg
	Pjw7bNPqfwrhSJDVGqNOXQqlWKGcNhCgqoD5U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=UFpapxUMGB6uswePqcPaWLTZK/jtPuZDKbSd2OY3GENQI/ywBg64ym5e3ikEMryuYz
	GYi6apZkafZvCK2NOzQOzs9MUN9PTfvKmqBNumI2d81pW1l2v2pWNSDbo4j1dfFwATnR
	+GSPx2BKHaZlPadXQ6wrU/BT3xRfHXcGQ+7oU=
MIME-Version: 1.0
Received: by 10.101.71.6 with SMTP id y6mr5499101ank.77.1238535663417; Tue, 31 
	Mar 2009 14:41:03 -0700 (PDT)
In-Reply-To: <200903302141.30822.joerg@hakker.de>
References: <200903302141.30822.joerg@hakker.de>
Date: Tue, 31 Mar 2009 14:41:03 -0700
Message-ID: <19c1b8a90903311441o492174d0v9df11b339a7e0a3d@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] gcc-cross-kernel-3.3.4
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
X-List-Received-Date: Tue, 31 Mar 2009 21:43:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thanks for the patch something like S_IRUSR | S_IWUSR instead of 0666
would be better.

On 3/30/09, J=C3=B6rg Bakker <joerg@hakker.de> wrote:
> Building gcc-cross-kernel-3.3.4 stops with the following error:
>
> | In function 'open',
>
> |     inlined from 'collect_execute' at
> /home/jb/devel/cc/jammsession/oe/build/tmp/work/i586-angstrom-linux/gcc-c=
ross-
> kernel-3.3.4-3.3.4-r9/gcc-3.3.4/gcc/collect2.c:1575:
>
>
> | /usr/include/bits/fcntl2.h:51: error: call to '__open_missing_mode'
> declared
> with attribute error: open with O_CREAT in second argument needs 3 argume=
nts
>
>
> | make[1]: *** [collect2.o] Error 1
>
> | make[1]: *** Waiting for unfinished jobs....
>
> | done
>
> ....
> | make[1]: Leaving directory
> `/home/jb/devel/cc/jammsession/oe/build/tmp/work/i586-angstrom-linux/gcc-
> cross-kernel-3.3.4-3.3.4-r9/gcc-3.3.4/build.i686-linux.i586-angstrom-
> linux/gcc'
> | make: *** [all-gcc] Error 2
> | FATAL: oe_runmake failed
> NOTE: Task failed: /home/jb/devel/cc/jammsession/oe/build/tmp/work/i586-
> angstrom-linux/gcc-cross-kernel-3.3.4-3.3.4-r9/temp/log.do_compile.17555
> NOTE: package gcc-cross-kernel-3.3.4-3.3.4-r9: task do_compile: failed
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /home/jb/devel/cc/jammsession/oe/build/recipes/gcc.save/g=
cc-
> cross-kernel-3.3.4_3.3.4.bb do_compile failed
> ERROR: Task 7 (/home/jb/devel/cc/jammsession/oe/build/recipes/gcc.save/gc=
c-
> cross-kernel-3.3.4_3.3.4.bb, do_compile) failed
> NOTE: Tasks Summary: Attempted 271 tasks of which 265 didn't need to be
> rerun
> and 1 failed.
> ERROR: '/home/jb/devel/cc/jammsession/oe/build/recipes/gcc.save/gcc-cross=
-
> kernel-3.3.4_3.3.4.bb' failed
>
> OE Build Configuration:
> BB_VERSION        =3D "1.8.13"
> METADATA_BRANCH   =3D "org.openembedded.dev"
> METADATA_REVISION =3D "8f8efbe43a7f28802d066f7f83915e8fbd0d4cc2"
> TARGET_ARCH       =3D "i586"
> TARGET_OS         =3D "linux"
> MACHINE           =3D "epia"
> DISTRO            =3D "angstrom"
> DISTRO_VERSION    =3D "2009.X-test-20090329"
>
> The attached patch fixes this.
>
>
>
>


