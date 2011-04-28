Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1QFMSe-0005yR-1s
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Apr 2011 10:20:33 +0200
Received: by pzk36 with SMTP id 36so1588723pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Apr 2011 01:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=2+E5yRSkqDpof/y5YA5cO8ueJzk32zPp2Lh3jA6uKDo=;
	b=i+6M4UQoo6zUh8l+kwavvGNtolsaTqkM0Bly66xNp36CRhAxFtfIgoLZoEo380dEtr
	aUgMqEcdZN7v5A9EZd96n2Mkd21LY4bbFMbvofAP1Es1lP9gH4LWFp0j6ddrBzWnaGSC
	8B2j0opokQb6Vuhop1XZa1v0tI0MlQp2pdMX4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=qSKFenfPDr8uQc0s+Y+9Xjhih46oDEpzsKt64c+fBhbdT5DtblqVsL6/ODhEI2KubR
	SxRAxDF2PCj77jVh9QzzxNZlF4XfICJRdLuNtvMEOKk3fWeaNIyaMCOFLH637jyHnuHV
	P6qWQrJm+MMCabw+LpI+Olumwqbrn6DytU5Po=
MIME-Version: 1.0
Received: by 10.142.209.11 with SMTP id h11mr977327wfg.383.1303978666672; Thu,
	28 Apr 2011 01:17:46 -0700 (PDT)
Received: by 10.142.223.2 with HTTP; Thu, 28 Apr 2011 01:17:46 -0700 (PDT)
In-Reply-To: <1303976359.3990.14.camel@mattotaupa>
References: <1303976359.3990.14.camel@mattotaupa>
Date: Thu, 28 Apr 2011 10:17:46 +0200
Message-ID: <BANLkTimhzi=1EBQQCiW+ULBzxY=u2Y_Bug@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: angstrom-2010.x: `bitbake virtual/kernel` fails with `[Errno 2] No such file or directory: '/oe/openembedded/recipes/linux/linux-omap-2.6.37/beagleboard/./configs/'`
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
X-List-Received-Date: Thu, 28 Apr 2011 08:20:33 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Paul,

possibly my fault: with commit
71eb55a998a150f3dc828d2478b7875f807b3536 I removed
/linux/files/configs/.empty

-rw-r--r--	recipes/obsolete/linux/files/configs/.empty (renamed from
recipes/linux/files/configs/.empty)	0
-rw-r--r--	recipes/obsolete/linux/files/ipaq-hal.init (renamed from
recipes/linux/files/ipaq-hal.init)	0
-rw-r--r--	recipes/obsolete/linux/files/linux-2.6-limits.patch
(renamed from recipes/linux/files/linux-2.6-limits.patch)	0
-rw-r--r--	recipes/obsolete/linux/files/usb-gadget-ether-compat.patch
(renamed from recipes/linux/files/usb-gadget-ether-compat.patch)

I see in multikernel.inc


SRC_URI_append =3D " \
           file://configs/ "

Please revert that part if you need it. Sorry for the noise.

Regards

Andrea


On Thu, Apr 28, 2011 at 9:39 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Dear OE folks,
>
>
> using `angstrom-2010.x` for `MACHINE =3D "beagleboard"` and executing
> `bitbake -k virtual/kernel` from an empty build directory, task unpack
> of `linux-omap_2.6.37.bb` fails with the following error.
>
> =A0 =A0 =A0 =A0$ bitbake -k virtual/kernel
> =A0 =A0 =A0 =A0[=85]
> =A0 =A0 =A0 =A0Build Configuration:
> =A0 =A0 =A0 =A0BB_VERSION =A0 =A0 =A0 =A0=3D "1.12.0"
> =A0 =A0 =A0 =A0METADATA_BRANCH =A0 =3D "master"
> =A0 =A0 =A0 =A0METADATA_REVISION =3D "9a7d3ae"
> =A0 =A0 =A0 =A0TARGET_ARCH =A0 =A0 =A0 =3D "arm"
> =A0 =A0 =A0 =A0TARGET_OS =A0 =A0 =A0 =A0 =3D "linux-gnueabi"
> =A0 =A0 =A0 =A0MACHINE =A0 =A0 =A0 =A0 =A0 =3D "beagleboard"
> =A0 =A0 =A0 =A0DISTRO =A0 =A0 =A0 =A0 =A0 =A0=3D "angstrom"
> =A0 =A0 =A0 =A0DISTRO_VERSION =A0 =A0=3D "v20110428"
> =A0 =A0 =A0 =A0TARGET_FPU =A0 =A0 =A0 =A0=3D "hard"
>
> =A0 =A0 =A0 =A0NOTE: Resolving any missing task queue dependencies
> =A0 =A0 =A0 =A0NOTE: Preparing runqueue
> =A0 =A0 =A0 =A0NOTE: Executing RunQueue Tasks
> =A0 =A0 =A0 =A0NOTE: Running task 825 of 945 (ID: 10, /oe/openembedded/re=
cipes/linux/linux-omap_2.6.37.bb, do_setscene)
> =A0 =A0 =A0 =A0NOTE: package linux-omap-2.6.37-r101d+gitrfa3b4e23ec20cfc9=
44db7cc2b30b0d82c20e4472: task do_setscene: Started
> =A0 =A0 =A0 =A0NOTE: package linux-omap-2.6.37-r101d+gitrfa3b4e23ec20cfc9=
44db7cc2b30b0d82c20e4472: task do_setscene: Succeeded
> =A0 =A0 =A0 =A0NOTE: Running task 922 of 945 (ID: 8, /oe/openembedded/rec=
ipes/linux/linux-omap_2.6.37.bb, do_fetch)
> =A0 =A0 =A0 =A0NOTE: package linux-omap-2.6.37-r101d+gitrfa3b4e23ec20cfc9=
44db7cc2b30b0d82c20e4472: task do_fetch: Started
> =A0 =A0 =A0 =A0NOTE: package linux-omap-2.6.37-r101d+gitrfa3b4e23ec20cfc9=
44db7cc2b30b0d82c20e4472: task do_fetch: Succeeded
> =A0 =A0 =A0 =A0NOTE: Running task 923 of 945 (ID: 0, /oe/openembedded/rec=
ipes/linux/linux-omap_2.6.37.bb, do_unpack)
> =A0 =A0 =A0 =A0NOTE: Running task 924 of 945 (ID: 20, /oe/openembedded/re=
cipes/linux/linux-omap_2.6.37.bb, do_distribute_sources)
> =A0 =A0 =A0 =A0NOTE: package linux-omap-2.6.37-r101d+gitrfa3b4e23ec20cfc9=
44db7cc2b30b0d82c20e4472: task do_unpack: Started
> =A0 =A0 =A0 =A0NOTE: package linux-omap-2.6.37-r101d+gitrfa3b4e23ec20cfc9=
44db7cc2b30b0d82c20e4472: task do_distribute_sources: Started
> =A0 =A0 =A0 =A0ERROR: Error executing a python function in /oe/openembedd=
ed/recipes/linux/linux-omap_2.6.37.bb:
> =A0 =A0 =A0 =A0OSError: [Errno 2] No such file or directory: '/oe/openemb=
edded/recipes/linux/linux-omap-2.6.37/beagleboard/./configs/'
>
> =A0 =A0 =A0 =A0ERROR: The stack trace of python calls that resulted in th=
is exception/failure was:
> =A0 =A0 =A0 =A0ERROR: =A0 File "base_do_unpack", line 35, in <module>
> =A0 =A0 =A0 =A0ERROR:
> =A0 =A0 =A0 =A0ERROR: =A0 File "base_do_unpack", line 32, in base_do_unpa=
ck
> =A0 =A0 =A0 =A0ERROR:
> =A0 =A0 =A0 =A0ERROR: =A0 File "base.bbclass", line 29, in oe_unpack
> =A0 =A0 =A0 =A0ERROR:
> =A0 =A0 =A0 =A0ERROR: =A0 File "/oe/openembedded/lib/oe/unpack.py", line =
67, in unpack_file
> =A0 =A0 =A0 =A0ERROR: =A0 =A0 if os.path.samefile(file, dest):
> =A0 =A0 =A0 =A0ERROR:
> =A0 =A0 =A0 =A0ERROR: =A0 File "/usr/lib/python2.6/posixpath.py", line 15=
2, in samefile
> =A0 =A0 =A0 =A0ERROR: =A0 =A0 s1 =3D os.stat(f1)
> =A0 =A0 =A0 =A0ERROR:
> =A0 =A0 =A0 =A0ERROR: The code that was being executed was:
> =A0 =A0 =A0 =A0ERROR: =A0 =A0 =A00031:
> =A0 =A0 =A0 =A0ERROR: =A0 =A0 =A00032: =A0 =A0 =A0 =A0 =A0 =A0oe_unpack(d=
, local, urldata)
> =A0 =A0 =A0 =A0ERROR: =A0 =A0 =A00033:
> =A0 =A0 =A0 =A0ERROR: =A0 =A0 =A00034:
> =A0 =A0 =A0 =A0ERROR: =A0*** 0035:base_do_unpack(d)
> =A0 =A0 =A0 =A0ERROR: =A0 =A0 =A00036:
> =A0 =A0 =A0 =A0ERROR: (file: 'base_do_unpack', lineno: 35, function: <mod=
ule>)
> =A0 =A0 =A0 =A0ERROR: =A0 =A0 =A00028: =A0 =A0 =A0 =A0 =A0 =A0local =3D u=
rldata.localpath
> =A0 =A0 =A0 =A0ERROR: =A0 =A0 =A00029: =A0 =A0 =A0 =A0 =A0 =A0if not loca=
l:
> =A0 =A0 =A0 =A0ERROR: =A0 =A0 =A00030: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0rai=
se bb.build.FuncFailed('Unable to locate local file for %s' % url)
> =A0 =A0 =A0 =A0ERROR: =A0 =A0 =A00031:
> =A0 =A0 =A0 =A0ERROR: =A0*** 0032: =A0 =A0 =A0 =A0 =A0 =A0oe_unpack(d, lo=
cal, urldata)
> =A0 =A0 =A0 =A0ERROR: =A0 =A0 =A00033:
> =A0 =A0 =A0 =A0ERROR: =A0 =A0 =A00034:
> =A0 =A0 =A0 =A0ERROR: =A0 =A0 =A00035:base_do_unpack(d)
> =A0 =A0 =A0 =A0ERROR: =A0 =A0 =A00036:
> =A0 =A0 =A0 =A0ERROR: (file: 'base_do_unpack', lineno: 32, function: base=
_do_unpack)
> =A0 =A0 =A0 =A0NOTE: package linux-omap-2.6.37-r101d+gitrfa3b4e23ec20cfc9=
44db7cc2b30b0d82c20e4472: task base_do_unpack: Failed
> =A0 =A0 =A0 =A0ERROR: Function 'base_do_unpack' failed
> =A0 =A0 =A0 =A0ERROR: Task 0 (/oe/openembedded/recipes/linux/linux-omap_2=
.6.37.bb, do_unpack) failed with exit code '1'
> =A0 =A0 =A0 =A0Waiting for 1 active tasks to finish:
> =A0 =A0 =A0 =A00: linux-omap-2.6.37-r101d+gitrfa3b4e23ec20cfc944db7cc2b30=
b0d82c20e4472 do_distribute_sources (pid 17470)
> =A0 =A0 =A0 =A0NOTE: package linux-omap-2.6.37-r101d+gitrfa3b4e23ec20cfc9=
44db7cc2b30b0d82c20e4472: task do_distribute_sources: Succeeded
> =A0 =A0 =A0 =A0ERROR: '/oe/openembedded/recipes/linux/linux-omap_2.6.37.b=
b' failed
>
> `.configs/` is appended to `SRC_URI` in `multi-kernel.inc` [1].
>
> The strange thing is, that `bitbake -k beagleboard-demo-image` does not
> show this error.
>
> A fix would be greatly appreciated.
>
>
> Thanks,
>
> Paul
>
>
> [1] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/linux=
/multi-kernel.inc#n16
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


