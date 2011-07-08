Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1Qf84J-0008NC-FH
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jul 2011 12:13:55 +0200
Received: by fxh10 with SMTP id 10so2149164fxh.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jul 2011 03:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=37gvuKMvVbAh2ipjPs78xInIGs+crcL83ej4P44+R3k=;
	b=r14mufodG6BsTjtwaJHayiCJyXLIJMPgp457k8p7pOeKQljmyfJWZjzLJf2u1vrZLJ
	+Zy7V4x1BJ24dwPF9w1cmlMxCSBjPGpT05Eilbz14iQPMuplF3J/mCHFmSkJ68TzUL8g
	4ieUFt4vinM779nyRCyYup+SGWogmbiF8tbTs=
Received: by 10.223.145.2 with SMTP id b2mr2827132fav.99.1310119803172; Fri,
	08 Jul 2011 03:10:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.94.68 with HTTP; Fri, 8 Jul 2011 03:09:43 -0700 (PDT)
In-Reply-To: <1310061992.4153.8.camel@mattotaupa>
References: <cover.1310045515.git.michael.lippautz@gmail.com>
	<50751d1b7570089f6aba5072807372c7a31be373.1310045515.git.michael.lippautz@gmail.com>
	<1310061992.4153.8.camel@mattotaupa>
From: Michael Lippautz <michael.lippautz@gmail.com>
Date: Fri, 8 Jul 2011 12:09:43 +0200
Message-ID: <CACVrrMnQNKVLhACRxQFuznrK-UELtVNmJ_d+rHsZnYo19mR=fw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCHv2 1/4] python-pyudev: Add version 0.11 (initial recipe)
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
X-List-Received-Date: Fri, 08 Jul 2011 10:13:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/7/7 Paul Menzel <paulepanter@users.sourceforge.net>:
> Am Donnerstag, den 07.07.2011, 15:35 +0200 schrieb Michael Lippautz:
>> Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
>> ---
>> =A0.../recipes-devtools/python/python-pyudev_0.11.bb =A0| =A0 22 +++++++=
+++++++++++++
>> =A01 files changed, 22 insertions(+), 0 deletions(-)
>> =A0create mode 100644 meta-oe/recipes-devtools/python/python-pyudev_0.11=
.bb
>>
>> diff --git a/meta-oe/recipes-devtools/python/python-pyudev_0.11.bb b/met=
a-oe/recipes-devtools/python/python-pyudev_0.11.bb
>> new file mode 100644
>> index 0000000..03a948a
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/python/python-pyudev_0.11.bb
>> @@ -0,0 +1,22 @@
>> +DESCRIPTION =3D "A libudev binding"
>> +HOMEPAGE =3D "http://pypi.python.org/pypi/pyudev"
>> +SECTION =3D "devel/python"
>> +LICENSE =3D "GPLv2"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d9b6cdffcea4f398e3=
7343"
>> +PR =3D "r0"
>> +
>> +SRCNAME =3D "pyudev"
>> +SRC_URI =3D "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCN=
AME}-${PV}.tar.gz"
>> +SRC_URI[md5sum] =3D "dca4e69da387f9a6683ee4b5c27ca66a"
>> +SRC_URI[sha256sum] =3D "0acfa500219f4bcf711f35c1b2041d035b4bf5f302eca50=
38572ee788d9e584a"
>> +
>> +S =3D "${WORKDIR}/${SRCNAME}-${PV}"
>> +
>> +inherit setuptools
>> +
>> +RDEPENDS_${PN} =3D "\
>> + =A0python-ctypes \
>> + =A0python-subprocess \
>> + =A0python-misc \
>> + =A0libudev \
>> +"
>
> I backported your patch locally to oe-dev and it fails with the
> following error message.
>
> =A0 =A0 =A0 =A0+ /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux=
/usr/bin/python setup.py build
> =A0 =A0 =A0 =A0Traceback (most recent call last):
> =A0 =A0 =A0 =A0 =A0File "setup.py", line 34, in <module>
> =A0 =A0 =A0 =A0 =A0 =A0import pyudev
> =A0 =A0 =A0 =A0 =A0File "/oe/build-angstrom-next/angstrom-dev/work/armv7a=
-angstrom-linux-gnueabi/python-pyudev-0.11-r0/pyudev-0.11/pyudev/__init__.p=
y", line 177, in <module>
> =A0 =A0 =A0 =A0 =A0 =A0from pyudev.device import *
> =A0 =A0 =A0 =A0 =A0File "/oe/build-angstrom-next/angstrom-dev/work/armv7a=
-angstrom-linux-gnueabi/python-pyudev-0.11-r0/pyudev-0.11/pyudev/device.py"=
, line 35, in <module>
> =A0 =A0 =A0 =A0 =A0 =A0from pyudev._libudev import libudev
> =A0 =A0 =A0 =A0 =A0File "/oe/build-angstrom-next/angstrom-dev/work/armv7a=
-angstrom-linux-gnueabi/python-pyudev-0.11-r0/pyudev-0.11/pyudev/_libudev.p=
y", line 35, in <module>
> =A0 =A0 =A0 =A0 =A0 =A0from ctypes import (CDLL, Structure, POINTER, get_=
errno,
> =A0 =A0 =A0 =A0 =A0File "/oe/build-angstrom-next/angstrom-dev/sysroots/i6=
86-linux/usr/lib/python2.6/ctypes/__init__.py", line 10, in <module>
> =A0 =A0 =A0 =A0 =A0 =A0from _ctypes import Union, Structure, Array
> =A0 =A0 =A0 =A0ImportError: No module named _ctypes
> =A0 =A0 =A0 =A0+ oefatal 'python setup.py build_ext execution failed.'
> =A0 =A0 =A0 =A0+ echo FATAL: 'python setup.py build_ext execution failed.=
'
> =A0 =A0 =A0 =A0FATAL: python setup.py build_ext execution failed.
> =A0 =A0 =A0 =A0+ exit 1
>
> `ctype` is available though.
>
>
> Thanks,
>
> Paul
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>

You do not only need `ctypes' for the target, but also for the host
system. You could try to backport also [1], but I don't know whether
that's possible, since I am no longer using oe.dev (layers instead).

Regards,
Michael

[1] http://cgit.openembedded.net/cgit.cgi/openembedded-core/commit/?id=3D58=
f8eb15eea892b2694478bbc71e8c907014509b


