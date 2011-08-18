Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <blunderer@gmail.com>) id 1Qu9Kd-00063T-MF
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2011 22:36:51 +0200
Received: by gyg4 with SMTP id 4so1726723gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2011 13:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=IpDTs/LIj600ECpZvVzgcaQxwS0xRhxHZdRxMKrehxM=;
	b=M3vAZOgcFdzdTUatPsrjGl1SY8WRCW1UAwqYs/HcdV2Cqi/fUj9gl1CQfYlSU/PfkX
	FEDtYOGgbksYTDtdddeYHGpvMjIn+yDclt+wf3KctJNwevPum2JHrb+pB6ZWp4Wadkqp
	Mr/g3CLE4HkklvG39bBzvUkxsT1vuYAae9bj8=
Received: by 10.236.181.97 with SMTP id k61mr933049yhm.101.1313699531052; Thu,
	18 Aug 2011 13:32:11 -0700 (PDT)
MIME-Version: 1.0
Sender: blunderer@gmail.com
Received: by 10.236.70.70 with HTTP; Thu, 18 Aug 2011 13:31:51 -0700 (PDT)
In-Reply-To: <1313685626.3949.41.camel@mattotaupa>
References: <CAJb9USWOKap6nFh8TxogvQtO8=5cZ9x8AaAEUQto=EjvShW8QA@mail.gmail.com>
	<1313685626.3949.41.camel@mattotaupa>
From: Tristan Lelong <tristan.lelong@blunderer.org>
Date: Thu, 18 Aug 2011 22:31:51 +0200
X-Google-Sender-Auth: _LKrIfxda8XqYBRgfW-TDOYHY3M
Message-ID: <CAJb9USUy-cK5CeR8t6gEGFprHDX-oNf3XOw1Mie77hPJFX0-iQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Add a new recipe: libroxml
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
X-List-Received-Date: Thu, 18 Aug 2011 20:36:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

thank you for your quick and useful answer.

I will check and correct all those comments before submitting this patch ag=
ain.

Regards

2011/8/18 Paul Menzel <paulepanter@users.sourceforge.net>:
> Dear Tristan,
>
>
> thank you for your patch. There are some style problems and I hit some
> build issues, I will all mentioning inline.
>
> First of all I just noticed during this reply that you also attached
> this patch. That is the right thing to do since Google Mail auto wraps
> lines and therefore patches get broken. I recommend you to use `git
> send-email` or a mail program though.
>
>
> Am Donnerstag, den 18.08.2011, 17:48 +0200 schrieb Tristan Lelong:
>
>> Add a new recipe: libroxml
>
> Please follow the commit policy [1][2][3] on how to format the commit
> summary and message.
>
> =A0 =A0 =A0 =A0libroxml: Add version 2.1.0
>
> Also in your pasted message you copied the header twice.
>
>> libroxml is a small fast and powerfull xml parsing library.
>
> s/powerfull/powerful/
>
>> It handles parsing, creating, modifying xml documents
>
> Full stop at the end.
>
> Please add the build configuration you used for building and run
> testing.
>
>> Signed-off-by: Tristan Lelong <tristan.lelong@libroxml.net>
>> ---
>> =A0recipes/libroxml/libroxml.inc =A0 =A0 =A0| =A0 23 +++++++++++++++++++=
++++
>> =A0recipes/libroxml/libroxml_2.1.0.bb | =A0 =A08 ++++++++
>> =A02 files changed, 31 insertions(+), 0 deletions(-)
>> =A0create mode 100644 recipes/libroxml/libroxml.inc
>> =A0create mode 100644 recipes/libroxml/libroxml_2.1.0.bb
>>
>> diff --git a/recipes/libroxml/libroxml.inc b/recipes/libroxml/libroxml.i=
nc
>> new file mode 100644
>> index 0000000..5ade6e7
>> --- /dev/null
>> +++ b/recipes/libroxml/libroxml.inc
>> @@ -0,0 +1,23 @@
>> +
>
> Please no empty line at the beginning.
>
>> +DESCRIPTION =3D "small, fast and powerfull xml library"
>
> Typo as above. Please start with a capital letter.
>
>> +LICENSE =3D "LGPL"
>> +SECTION =3D "libs"
>> +PRIORITY =3D "optional"
>> +MAINTAINER =3D "Tristan Lelong <tristan.lelong@libroxml.net>"
>
> There is no maintainer field. Use `AUTHOR` instead.
>
>> +HOMEPAGE =3D "http://www.libroxml.net"
>
> Please order these fields according to the style guide [4].
>
>> +
>> +PROVIDES =3D "libroxml"
>> +RPROVIDES =3D "libroxml"
>
> Not needed as far as I know.
>
>> +
>> +SRC_URI =3D "http://libroxml.googlecode.com/files/libroxml-2.1.0.tar.gz=
"
>> +
>> +S =3D ${WORKDIR}/${PN}-${PV}
>
> That is the default and can be left out.
>
> I see a pc (pkgconfig) file is shipped. `inherit pkgconfig` should be
> added then I think.
>
>> +
>> +do_install() {
>> + =A0 =A0 =A0 =A0oe_runmake install DESTDIR=3D${D}
>> +}
>> +
>> +PACKAGES =3D ${PN}
>
> Also not needed.
>
>> +
>> +FILES_${PN} =3D ${libdir}/libroxml.so.0 ${bindir}/roxml
>
> Should `roxml` be installed with the library?
>
>> +
>
> No empty line at the end please.
>
>> diff --git a/recipes/libroxml/libroxml_2.1.0.bb
>> b/recipes/libroxml/libroxml_2.1.0.bb
>> new file mode 100644
>> index 0000000..22fff51
>> --- /dev/null
>> +++ b/recipes/libroxml/libroxml_2.1.0.bb
>> @@ -0,0 +1,8 @@
>> +
>> +PR =3D "r0"
>
> Please use `INC_PR` (also adapt the `*.inc`) and move it below the
> require line.
>
>> +
>> +require libroxml.inc
>> +
>> +SRC_URI[md5sum] =3D "eb69737ba6dc345399531dfa5975a53d"
>> +SRC_URI[sha256sum] =3D "823d9d495bc07618355e3137e289dfcc792b8a513f12452=
a2aba9c88b48f2e2d"
>> +
>
> No empty line at the end please. `git diff --check` should warn you
> about this.
>
> I tried to build your recipe with my modifications above using
> `angstrom-2010.x` for `MACHINE =3D "beagleboard". It fails with the
> following error.
>
> =A0 =A0 =A0 =A0NOTE: package libroxml-2.1.0-r0: task do_qa_staging: Start=
ed
> =A0 =A0 =A0 =A0arm-angstrom-linux-gnueabi-objcopy: Unable to recognise th=
e format of the input file `/oe/build-angstrom-next/angstrom-dev/work/armv7=
a-angstrom-linux-gnueabi/libroxml-2.1.0-r0/package/usr/bin/roxml'
> =A0 =A0 =A0 =A0arm-angstrom-linux-gnueabi-strip: Unable to recognise the =
format of the input file `/oe/build-angstrom-next/angstrom-dev/work/armv7a-=
angstrom-linux-gnueabi/libroxml-2.1.0-r0/package/usr/bin/roxml'
> =A0 =A0 =A0 =A0arm-angstrom-linux-gnueabi-objcopy: Unable to recognise th=
e format of the input file `/oe/build-angstrom-next/angstrom-dev/work/armv7=
a-angstrom-linux-gnueabi/libroxml-2.1.0-r0/package/usr/bin/roxml'
> =A0 =A0 =A0 =A0ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip' --rem=
ove-section=3D.comment --remove-section=3D.note '/oe/build-angstrom-next/an=
gstrom-dev/work/armv7a-angstrom-linux-gnueabi/libroxml-2.1.0-r0/package/usr=
/bin/roxml'' strip command failed
> =A0 =A0 =A0 =A0NOTE: package libroxml-2.1.0-r0: task do_qa_staging: Succe=
eded
> =A0 =A0 =A0 =A0ERROR: QA Issue with libroxml: Architecture did not match =
(40 to 3) on /work/armv7a-angstrom-linux-gnueabi/libroxml-2.1.0-r0/packages=
-split/libroxml/usr/lib/libroxml.so.0
> =A0 =A0 =A0 =A0ERROR: QA Issue with libroxml: Architecture did not match =
(40 to 3) on /work/armv7a-angstrom-linux-gnueabi/libroxml-2.1.0-r0/packages=
-split/libroxml/usr/bin/roxml
> =A0 =A0 =A0 =A0ERROR: QA run found fatal errors. Please consider fixing t=
hem.
> =A0 =A0 =A0 =A0NOTE: package libroxml-2.1.0-r0: task do_package_qa: Faile=
d
> =A0 =A0 =A0 =A0ERROR: Function 'do_package_qa' failed
>
> `minimal` and `minimal-uclibc` fail too.
>
> =A0 =A0 =A0 =A0NOTE: package libroxml-2.1.0-r0: task do_populate_sysroot:=
 Succeeded
> =A0 =A0 =A0 =A0ERROR: runstrip: ''arm-oe-linux-gnueabi-strip' --remove-se=
ction=3D.comment --remove-section=3D.note '/oe/build-minimal-eglibc/minimal=
-dev/work/armv7a-oe-linux-gnueabi/libroxml-2.1.0-r0/package/usr/bin/roxml''=
 strip command failed
> =A0 =A0 =A0 =A0NOTE: Running task 770 of 777 (ID: 4, /oe/openembedded/rec=
ipes/libroxml/libroxml_2.1.0.bb, do_qa_staging)
> =A0 =A0 =A0 =A0NOTE: package libroxml-2.1.0-r0: task do_qa_staging: Start=
ed
> =A0 =A0 =A0 =A0NOTE: package libroxml-2.1.0-r0: task do_qa_staging: Succe=
eded
> =A0 =A0 =A0 =A0ERROR: QA Issue with libroxml: Architecture did not match =
(40 to 3) on /work/armv7a-oe-linux-gnueabi/libroxml-2.1.0-r0/packages-split=
/libroxml/usr/lib/libroxml.so.0
> =A0 =A0 =A0 =A0ERROR: QA Issue with libroxml: Architecture did not match =
(40 to 3) on /work/armv7a-oe-linux-gnueabi/libroxml-2.1.0-r0/packages-split=
/libroxml/usr/bin/roxml
> =A0 =A0 =A0 =A0ERROR: QA run found fatal errors. Please consider fixing t=
hem.
> =A0 =A0 =A0 =A0NOTE: package libroxml-2.1.0-r0: task do_package_qa: Faile=
d
> =A0 =A0 =A0 =A0ERROR: Function 'do_package_qa' failed
>
> Are you sure `Makefile` can deal with cross compilation?
>
>
> Thanks,
>
> Paul
>
>
> [1] http://wiki.openembedded.org/index.php/Commit_Policy
> [2] http://wiki.openembedded.org/index.php/Commit_log_example
> [3] http://wiki.openembedded.org/index.php/Commit_Patch_Message_Guideline=
s
> [4] http://wiki.openembedded.org/index.php/Styleguide
> [5] http://wiki.openembedded.org/index.php/Styleguide#PR_variables_with_r=
ecipes_that_use_INC_files
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>



--=20
618FE3EF


