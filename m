Received: from mail-ia0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TeTmw-0008Io-KE
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Nov 2012 17:50:07 +0100
Received: by mail-ia0-f175.google.com with SMTP id z3so465720iad.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Nov 2012 08:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=OWAdwshKUlFjk3LTrRZZGqsukMAb7fMJBLOLJsJ6+dA=;
	b=Vz9koXAyBDBzKQXbnJGpQ0Yz3g7sZlaQJH0/oWUCSb4as3ZZLnjpDamc/4XuTZqWwW
	BVFG8gB5gt/7fOVv4yjcIL+xlNrh3y450/BeDs9pTUby5Y9qHP9iq7xuqsXoi88UhDkU
	n+lB6PkKjQr7IVUfjB/gSzq+h51KMvaNbOZq9TlZMmmfv4BA90Qq7VbMkFm8YaQJy7VS
	yK7Pvg6H4li2FGwLLOIp7Lw5zyMID+cHx5vAZLw/FatupMC1nkpPVcGTCVcHkLg9z6wa
	3Rd2v7z/TIx8bvPWBIS+BfXa2zDkpvBrZJKPF6TVNbb8T4aGaKRGNFeuu+NBVngCerLg
	5Udg==
MIME-Version: 1.0
Received: by 10.50.150.235 with SMTP id ul11mr1592711igb.31.1354293348876;
	Fri, 30 Nov 2012 08:35:48 -0800 (PST)
Received: by 10.64.20.113 with HTTP; Fri, 30 Nov 2012 08:35:48 -0800 (PST)
In-Reply-To: <CAPOJ94OVOe=fP-8cgCdDFGFEJskce4G=DMcTR6a-JDM9QHJg0w@mail.gmail.com>
References: <CAPOJ94OVOe=fP-8cgCdDFGFEJskce4G=DMcTR6a-JDM9QHJg0w@mail.gmail.com>
Date: Fri, 30 Nov 2012 17:35:48 +0100
Message-ID: <CALbNGRRqj6NvBxqB+EGcLcFd9CcNKKnSNZmJHM8f=BA-biF3dg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Peter Bigot <bigotp@acm.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] gphoto2: fix gettext build error
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
X-List-Received-Date: Fri, 30 Nov 2012 16:50:07 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Nov 25, 2012 at 3:19 PM, Peter Bigot <bigotp@acm.org> wrote:
> Koen Kooi <koen <at> dominion.thruhere.net> writes:
>
>>
>> Signed-off-by: Koen Kooi <koen <at> dominion.thruhere.net>
>
>> ---
>>  .../recipes-graphics/gphoto2/libgphoto2_2.4.11.bb  |    3 +--
>>  1 files changed, 1 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
> b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
>> index d7f6ac0..27f660b 100644
>> --- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
>> +++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
>> @@ -3,7 +3,7 @@ SECTION = "libs"
>>  LICENSE = "LGPLv2.1"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=0448d3676bc0de00406af227d341a4d1"
>>
>> -PR = "r3"
>> +PR = "r4"
>>
>>  DEPENDS = "libtool jpeg virtual/libusb0 libexif"
>>
>> @@ -26,7 +26,6 @@ inherit autotools pkgconfig gettext lib_package
>>  EXTRA_OECONF = " --with-drivers=all udevscriptdir=/lib/udev
> ac_cv_lib_ltdl_lt_dlcaller_register=yes"
>>
>>  do_configure_append() {
>> -    cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in
>> ${S}/libgphoto2_port/po/
>>      cd ${S}/libgphoto2_port/
>>      autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF}
>> $acpaths
>>      cd ${S}
>
> I was about to submit a similar patch reverting the original.  Here's what I
> wrote up.
>
> Revert "libgphoto2: fix build"
>
> When using gettext-0.18's Makefile.in.in the elimination of AM_PO_SUBDIRS()
> prevented the substitution of @GETTEXT_MACRO_VERSION@.  With the original
> patch I get:
>
> | Making all in po
> | make[4]: Entering directory
> `/prj/oe/yocto-ang/build/tmp-angstrom_v2012_12-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2-2.4.11-r3/libgphoto2-2.4.11/libgphoto2_port/po'
> | *** error: gettext infrastructure mismatch: using a Makefile.in.in from
> gettext version 0.18 but the autoconf macros are from gettext version
> @GETTEXT_MACRO_VERSION@
>
After last update it is again me to fail :-((

One question: Is it possible that you don't have gettext installed on
your build machine? If installed: Which version is it?

Andreas


