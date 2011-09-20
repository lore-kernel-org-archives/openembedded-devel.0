Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <blunderer@gmail.com>) id 1R61VK-00081H-L4
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Sep 2011 16:40:58 +0200
Received: by wwf27 with SMTP id 27so742926wwf.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2011 07:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type;
	bh=cnsEQ2EACoWJrtRTqx7o0Hq212bb69yIBgdeyvzkUwE=;
	b=W7oAsEi3FZ9LVJBvdKgkQfPkOn72xrkXf+EG0uui3Uq1FWaIROVJqRf2ywLs+46eGe
	WNfnTG4tUvsO9Zxg/v3wbhKHmbKFfIg2O7pKjKURWKAm1NpXfrqMCX5zJvL7Ob+Nnuj2
	23KsHILxZpQW5iqEtItLTww4QA2jviUOzPvxI=
Received: by 10.216.160.7 with SMTP id t7mr812269wek.108.1316529341275;
	Tue, 20 Sep 2011 07:35:41 -0700 (PDT)
Received: from [10.1.20.51] ([92.103.82.100])
	by mx.google.com with ESMTPS id j18sm2579255wbo.6.2011.09.20.07.35.39
	(version=SSLv3 cipher=OTHER); Tue, 20 Sep 2011 07:35:40 -0700 (PDT)
Sender: tristan <blunderer@gmail.com>
Message-ID: <4E78A4BA.1090807@blunderer.org>
Date: Tue, 20 Sep 2011 16:35:38 +0200
From: Tristan Lelong <tristan.lelong@blunderer.org>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: Paul Menzel <paulepanter@users.sourceforge.net>
References: <1316012411-28874-1-git-send-email-tristan.lelong@blunderer.org>
	<1316341630.7061.9.camel@mattotaupa>
In-Reply-To: <1316341630.7061.9.camel@mattotaupa>
X-Enigmail-Version: 1.3.2
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v2] libroxml: Add version 2.1.0
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
X-List-Received-Date: Tue, 20 Sep 2011 14:40:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

I corrected the other problems with my recipe and I'm about to submit it
again.
There is only one point I don't understand:

"Please add how you tested this package with."


What do you mean by tested? you want the openembedded distro, toolchain,
version (git hash)? the full local.conf? the software internal tests?
anything else?

Thank you very much for your time.


Le 18/09/2011 12:26, Paul Menzel a écrit :
> Dear Tristan,
>
>
> thank you for updating the patch.
>
> Am Mittwoch, den 14.09.2011, 17:00 +0200 schrieb
tristan.lelong@blunderer.org:
>> From: Tristan Lelong <tristan.lelong@blunderer.org>
>>
>> libroxml is a small fast and powerful xml library
>
> Please add how you tested this package with.
>
>> Signed-off-by: Tristan Lelong <tristan.lelong@blunderer.org>
>> ---
>> recipes/libroxml/libroxml.inc | 19 +++++++++++++++++++
>> recipes/libroxml/libroxml_2.1.0.bb | 6 ++++++
>> 2 files changed, 25 insertions(+), 0 deletions(-)
>> create mode 100644 recipes/libroxml/libroxml.inc
>> create mode 100644 recipes/libroxml/libroxml_2.1.0.bb
>>
>> diff --git a/recipes/libroxml/libroxml.inc b/recipes/libroxml/libroxml.inc
>> new file mode 100644
>> index 0000000..06322fe
>> --- /dev/null
>> +++ b/recipes/libroxml/libroxml.inc
>> @@ -0,0 +1,19 @@
>> +DESCRIPTION = "Small, fast and powerful xml library"
>> +AUTHOR = "Tristan Lelong <tristan.lelong@libroxml.net>"
>> +HOMEPAGE = "http://www.libroxml.net"
>> +SECTION = "libs"
>> +PRIORITY = "optional"
>> +INC_PR = "r0"
>> +LICENSE = "LGPL"
>
> Please order according to the style guide [1].
>
> Additionally checking the license this contradicts itself. `LGPL.txt`
> actually says version 3 or later, but the header in the the source files
> like `roxml.c` says LGPL 2.1 or later.
>
> Please clarify that in the source as you are the upstream author.
> Additionally please never release a new source archive without changing
> the version number. This causes problems when checksums are used as in
> OE.
>
>> +
>> +SRC_URI = "http://libroxml.googlecode.com/files/libroxml-2.1.0.tar.gz"
>
> Please use `${P}` instead of `libroxml-2.1.0`.
>
>> +
>> +inherit pkgconfig
>
> You do not ship any pkg-config file.
>
>> +
>> +do_install() {
>> + oe_runmake install DESTDIR=${D}
>> +}
>> +
>> +PACKAGES= ${PN} roxml
>> +FILES_${PN} = ${libdir}/libroxml.so.0
>> +FILES_roxml = ${bindir}/roxml
>
> Why do you need to define that manually?
>
> NOTE: package libroxml-2.1.0-r0.0: task do_qa_staging: Started
> WARNING: the following files were installed but not shipped in any package:
> WARNING: /usr/lib/libroxml.so
> WARNING: /usr/lib/libroxml.a
> WARNING: /usr/lib/pkgconfig/libroxml.pc
> WARNING: /usr/lib/.debug/libroxml.so.0
> WARNING: /usr/include/roxml.h
> WARNING: /usr/share/man/man1/roxml.1
> WARNING: /usr/share/doc/libroxml/LGPL.txt
> WARNING: /usr/bin/.debug/roxml
>
>> diff --git a/recipes/libroxml/libroxml_2.1.0.bb
b/recipes/libroxml/libroxml_2.1.0.bb
>> new file mode 100644
>> index 0000000..b3669e1
>> --- /dev/null
>> +++ b/recipes/libroxml/libroxml_2.1.0.bb
>> @@ -0,0 +1,6 @@
>> +PR = "${INC_PR}.0"
>> +
>> +SRC_URI[md5sum] = "ad1903efa241914baec2fd432a176549"
>> +SRC_URI[sha256sum] =
"bf2d908c330e28e5470fe9a841438b78025dc1406742fc54aad6fa8db401229a"
>> +
>> +require libroxml.inc
>
> I think `require libroxml.inc` should go to the beginning.
>
>
> Thanks,
>
> Paul
>
>
> [1] http://openembedded.org/index.php?title=Styleguide


- -- 
618FE3EF
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk54pLoACgkQFj9oxGGP4+8AEACfXMzlV4KATxgZ8SPMHD57bS4T
VYUAn3IVRTqIhDCFHr8faJmHRBRzL9Zg
=7Egn
-----END PGP SIGNATURE-----


