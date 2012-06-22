Received: from mail-qc0-f179.google.com ([209.85.216.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gizero@gmail.com>) id 1Si0Cw-0004a7-VB
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jun 2012 11:31:15 +0200
Received: by qcse14 with SMTP id e14so827093qcs.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jun 2012 02:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=TWiIkchsofljwb9b9ZQ09WYKlclBTxwhZRXN2s9b0/o=;
	b=ixJB2NHDF9T6WwwhXJtxqVfPgSH4CHsq0FcuDCX9gmXHah72x9iagnrGXcLV53P9nT
	2kob25oen0iHS2ERNj0PtanbCXETBxsbu3FkIx4bTu8qqXFUGm8vUv92wL2S5ew8q5rR
	2m+x7hTAlxKKFOj8Ttipmz7oMxqO1YbNyYkCqa812iGGFS3xrRDFv13vDesZLm7G9dnu
	JpRxAGiagONrjGM9Bq6jLD1dKAO+/9GvL2+JTpFjXj1MQ5OI1arFyQlIb0c6pcokHHIq
	H4tJrSmq6rpSyeCZ8PXEICPMlwzzcTzvHYPRDqnmkVh/H67Myo7PGenZKO/Tdqew1vtr
	IBhA==
MIME-Version: 1.0
Received: by 10.224.185.148 with SMTP id co20mr5119755qab.4.1340356827289;
	Fri, 22 Jun 2012 02:20:27 -0700 (PDT)
Received: by 10.229.223.208 with HTTP; Fri, 22 Jun 2012 02:20:27 -0700 (PDT)
In-Reply-To: <20120622082038.GM9352@jama.jama.net>
References: <1340352411-20305-1-git-send-email-gizero@gmail.com>
	<20120622082038.GM9352@jama.jama.net>
Date: Fri, 22 Jun 2012 11:20:27 +0200
Message-ID: <CAC+thW3xN4uDw3V=zVeXLugO_-77c82Wk0M+wxTUMqA9pqYefA@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] libmodbus: update to 3.0.3
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
X-List-Received-Date: Fri, 22 Jun 2012 09:31:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Martin,

On Fri, Jun 22, 2012 at 10:20 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Fri, Jun 22, 2012 at 10:06:51AM +0200, Andrea Galbusera wrote:
>> Signed-off-by: Andrea Galbusera <gizero@gmail.com>
>> ---
>> =A0.../recipes-extended/libmodbus/libmodbus_3.0.2.bb =A0| =A0 16 -------=
---------
>> =A0.../recipes-extended/libmodbus/libmodbus_3.0.3.bb =A0| =A0 16 +++++++=
+++++++++
>> =A02 files changed, 16 insertions(+), 16 deletions(-)
>> =A0delete mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2=
.bb
>> =A0create mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus_3.0.3=
.bb
>
> Please use -M when sending patches like this, so it's easier for review.
>
> Also when you're at it, you can simplify URL like this:
> s%libmodbus/libmodbus-${PV}%${BPN}/${BP}%

Thank you for reviewing. I wasn't aware of -M... still a newbie of
patch workflow. ;-)
Going to update my 'oe patch howto' notes and re-submitting.

>
> Cheers,
>
>>
>> diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb b/met=
a-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb
>> deleted file mode 100644
>> index 03b7fcc..0000000
>> --- a/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb
>> +++ /dev/null
>> @@ -1,16 +0,0 @@
>> -SUMMARY =3D "A Modbus library"
>> -DESCRIPTION =3D "libmodbus is a C library designed to provide a fast an=
d robust \
>> -implementation of the Modbus protocol. It runs on Linux, Mac OS X, Free=
BSD, \
>> -QNX and Windows."
>> -HOMEPAGE =3D "http://www.libmodbus.org/"
>> -SECTION =3D "libs"
>> -
>> -LICENSE =3D "LGPLv2.1+"
>> -LIC_FILES_CHKSUM =3D "file://COPYING.LESSER;md5=3D4fbd65380cdd255951079=
008b364516c"
>> -
>> -SRC_URI =3D "http://github.com/downloads/stephane/libmodbus/libmodbus-$=
{PV}.tar.gz"
>> -
>> -inherit autotools pkgconfig
>> -
>> -SRC_URI[md5sum] =3D "1aaacce9d9779d3a84f7d1a75774c943"
>> -SRC_URI[sha256sum] =3D "927ec90e0e299a7d4ec7086b1e2590566bdfc3bbc22e122=
04229361c029f2615"
>> diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.3.bb b/met=
a-oe/recipes-extended/libmodbus/libmodbus_3.0.3.bb
>> new file mode 100644
>> index 0000000..e6dde2c
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.3.bb
>> @@ -0,0 +1,16 @@
>> +SUMMARY =3D "A Modbus library"
>> +DESCRIPTION =3D "libmodbus is a C library designed to provide a fast an=
d robust \
>> +implementation of the Modbus protocol. It runs on Linux, Mac OS X, Free=
BSD, \
>> +QNX and Windows."
>> +HOMEPAGE =3D "http://www.libmodbus.org/"
>> +SECTION =3D "libs"
>> +
>> +LICENSE =3D "LGPLv2.1+"
>> +LIC_FILES_CHKSUM =3D "file://COPYING.LESSER;md5=3D4fbd65380cdd255951079=
008b364516c"
>> +
>> +SRC_URI =3D "http://github.com/downloads/stephane/libmodbus/libmodbus-$=
{PV}.tar.gz"
>> +
>> +inherit autotools pkgconfig
>> +
>> +SRC_URI[md5sum] =3D "b5042d833c6c132e6fb2551af133a342"
>> +SRC_URI[sha256sum] =3D "6fc7cf91f7293e522afde6ae5fc605c6cd7bdca4ee2ec95=
3db5bb91158ab8677"
>> --
>> 1.7.5.4
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


