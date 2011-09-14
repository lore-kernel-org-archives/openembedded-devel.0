Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <blunderer@gmail.com>) id 1R3r9Y-0003wD-Vk
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Sep 2011 17:13:33 +0200
Received: by wyh5 with SMTP id 5so206678wyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Sep 2011 08:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:message-id:date:from:reply-to:user-agent:mime-version:to
	:subject:references:in-reply-to:x-enigmail-version:content-type;
	bh=SdYXPmzXwgQ1A+FB8JeuFW545y/JWN1J1tF/xGg5jNM=;
	b=UNiepIpoW7rwufsRPS53cewTAHEtXhE0TTNoFhSDlEirrO0GoXrPif9Z13rwnOT/0Y
	3x1ZolR2iJAHxScfxwgu8DA/zvWTGHSFtTHp/Y/f4Fg/WkDH4z2ZkIYDgVQeqhPQDX4R
	dJHo22U+7MU889BB/dxyZsD9w2EODwPgHm0KE=
Received: by 10.227.157.80 with SMTP id a16mr516986wbx.28.1316012902523;
	Wed, 14 Sep 2011 08:08:22 -0700 (PDT)
Received: from [10.1.20.51] ([92.103.82.100])
	by mx.google.com with ESMTPS id n39sm4386499wbp.7.2011.09.14.08.08.20
	(version=SSLv3 cipher=OTHER); Wed, 14 Sep 2011 08:08:21 -0700 (PDT)
Sender: tristan <blunderer@gmail.com>
Message-ID: <4E70C364.1090400@blunderer.org>
Date: Wed, 14 Sep 2011 17:08:20 +0200
From: Tristan Lelong <tristan.lelong@blunderer.org>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAJb9USWOKap6nFh8TxogvQtO8=5cZ9x8AaAEUQto=EjvShW8QA@mail.gmail.com>
	<1313685626.3949.41.camel@mattotaupa>
In-Reply-To: <1313685626.3949.41.camel@mattotaupa>
X-Enigmail-Version: 1.3.1
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
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
X-List-Received-Date: Wed, 14 Sep 2011 15:13:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello,

I corrected the patch to add libroxml (see previous mail [PATCH v2]
libroxml: Add version 2.1.0).
Sorry for the delay, I was very busy during past weeks.

The libroxml Makefile is capable of cross-compilation, the error came
from a mistake in the downloaded tar.gz: it contained binaries compilled
for x86.
This is now corrected, and the recipe should build with any kind of
config: I tried with a i686 native and a powerpc toolchain.

regards

Le 18/08/2011 18:40, Paul Menzel a écrit :
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
> libroxml: Add version 2.1.0
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
>> recipes/libroxml/libroxml.inc | 23 +++++++++++++++++++++++
>> recipes/libroxml/libroxml_2.1.0.bb | 8 ++++++++
>> 2 files changed, 31 insertions(+), 0 deletions(-)
>> create mode 100644 recipes/libroxml/libroxml.inc
>> create mode 100644 recipes/libroxml/libroxml_2.1.0.bb
>>
>> diff --git a/recipes/libroxml/libroxml.inc b/recipes/libroxml/libroxml.inc
>> new file mode 100644
>> index 0000000..5ade6e7
>> --- /dev/null
>> +++ b/recipes/libroxml/libroxml.inc
>> @@ -0,0 +1,23 @@
>> +
>
> Please no empty line at the beginning.
>
>> +DESCRIPTION = "small, fast and powerfull xml library"
>
> Typo as above. Please start with a capital letter.
>
>> +LICENSE = "LGPL"
>> +SECTION = "libs"
>> +PRIORITY = "optional"
>> +MAINTAINER = "Tristan Lelong <tristan.lelong@libroxml.net>"
>
> There is no maintainer field. Use `AUTHOR` instead.
>
>> +HOMEPAGE = "http://www.libroxml.net"
>
> Please order these fields according to the style guide [4].
>
>> +
>> +PROVIDES = "libroxml"
>> +RPROVIDES = "libroxml"
>
> Not needed as far as I know.
>
>> +
>> +SRC_URI = "http://libroxml.googlecode.com/files/libroxml-2.1.0.tar.gz"
>> +
>> +S = ${WORKDIR}/${PN}-${PV}
>
> That is the default and can be left out.
>
> I see a pc (pkgconfig) file is shipped. `inherit pkgconfig` should be
> added then I think.
>
>> +
>> +do_install() {
>> + oe_runmake install DESTDIR=${D}
>> +}
>> +
>> +PACKAGES = ${PN}
>
> Also not needed.
>
>> +
>> +FILES_${PN} = ${libdir}/libroxml.so.0 ${bindir}/roxml
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
>> +PR = "r0"
>
> Please use `INC_PR` (also adapt the `*.inc`) and move it below the
> require line.
>
>> +
>> +require libroxml.inc
>> +
>> +SRC_URI[md5sum] = "eb69737ba6dc345399531dfa5975a53d"
>> +SRC_URI[sha256sum] =
"823d9d495bc07618355e3137e289dfcc792b8a513f12452a2aba9c88b48f2e2d"
>> +
>
> No empty line at the end please. `git diff --check` should warn you
> about this.
>
> I tried to build your recipe with my modifications above using
> `angstrom-2010.x` for `MACHINE = "beagleboard". It fails with the
> following error.
>
> NOTE: package libroxml-2.1.0-r0: task do_qa_staging: Started
> arm-angstrom-linux-gnueabi-objcopy: Unable to recognise the format of
the input file
`/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/libroxml-2.1.0-r0/package/usr/bin/roxml'
> arm-angstrom-linux-gnueabi-strip: Unable to recognise the format of the
input file
`/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/libroxml-2.1.0-r0/package/usr/bin/roxml'
> arm-angstrom-linux-gnueabi-objcopy: Unable to recognise the format of
the input file
`/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/libroxml-2.1.0-r0/package/usr/bin/roxml'
> ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip'
--remove-section=.comment --remove-section=.note
'/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/libroxml-2.1.0-r0/package/usr/bin/roxml''
strip command failed
> NOTE: package libroxml-2.1.0-r0: task do_qa_staging: Succeeded
> ERROR: QA Issue with libroxml: Architecture did not match (40 to 3) on
/work/armv7a-angstrom-linux-gnueabi/libroxml-2.1.0-r0/packages-split/libroxml/usr/lib/libroxml.so.0
> ERROR: QA Issue with libroxml: Architecture did not match (40 to 3) on
/work/armv7a-angstrom-linux-gnueabi/libroxml-2.1.0-r0/packages-split/libroxml/usr/bin/roxml
> ERROR: QA run found fatal errors. Please consider fixing them.
> NOTE: package libroxml-2.1.0-r0: task do_package_qa: Failed
> ERROR: Function 'do_package_qa' failed
>
> `minimal` and `minimal-uclibc` fail too.
>
> NOTE: package libroxml-2.1.0-r0: task do_populate_sysroot: Succeeded
> ERROR: runstrip: ''arm-oe-linux-gnueabi-strip'
--remove-section=.comment --remove-section=.note
'/oe/build-minimal-eglibc/minimal-dev/work/armv7a-oe-linux-gnueabi/libroxml-2.1.0-r0/package/usr/bin/roxml''
strip command failed
> NOTE: Running task 770 of 777 (ID: 4,
/oe/openembedded/recipes/libroxml/libroxml_2.1.0.bb, do_qa_staging)
> NOTE: package libroxml-2.1.0-r0: task do_qa_staging: Started
> NOTE: package libroxml-2.1.0-r0: task do_qa_staging: Succeeded
> ERROR: QA Issue with libroxml: Architecture did not match (40 to 3) on
/work/armv7a-oe-linux-gnueabi/libroxml-2.1.0-r0/packages-split/libroxml/usr/lib/libroxml.so.0
> ERROR: QA Issue with libroxml: Architecture did not match (40 to 3) on
/work/armv7a-oe-linux-gnueabi/libroxml-2.1.0-r0/packages-split/libroxml/usr/bin/roxml
> ERROR: QA run found fatal errors. Please consider fixing them.
> NOTE: package libroxml-2.1.0-r0: task do_package_qa: Failed
> ERROR: Function 'do_package_qa' failed
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
> [3] http://wiki.openembedded.org/index.php/Commit_Patch_Message_Guidelines
> [4] http://wiki.openembedded.org/index.php/Styleguide
> [5]
http://wiki.openembedded.org/index.php/Styleguide#PR_variables_with_recipes_that_use_INC_files
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


- -- 
618FE3EF
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk5ww2MACgkQFj9oxGGP4+/xmwCfar6mRoF5UXMJa28C1OcViziM
jO4AoOTlBDZTvhFNrIZ9PMfekQpp7x03
=LGFU
-----END PGP SIGNATURE-----


