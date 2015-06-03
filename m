Return-Path: <naresh.bhat@linaro.org>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id D52DF757A7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jun 2015 09:26:20 +0000 (UTC)
Received: by oiww2 with SMTP id w2so2911514oiw.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2015 02:26:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=7SHImCxub7gKZtMcm1v7jxtGFYcLghS5+BrNRLF+Ok0=;
	b=h4a9EpKGPr30be0ymCfZkZA11c6q4mo64yi5Ly+A+keMyPg9IeB1KAR/BpmLadKgZn
	8F5LZ6vz9Mqph2+DOrwprKDoNDFqXFFPlwaJ0EJNKUmii9VT+NgnfYPBZM40QQtNF0FD
	HbrrYnhVj3/fGG3073Fo2w5ob6IDOCnUjPIVT4wgKOI+Fj7OVvzmqaEYEw9Py0+YT/oC
	ZDxhb4ev+ggXMIHkPaWif0MWGW7VY2eVciekQbevMaUdiIIhgjyTSNJagUP27Rmb0WrP
	FBNl5NQoUcNuZ06AHtSAN5iAaJjfiPW6odoQxGjVYo4hvi8CwVXMpAZHZnfHfEHGRSoL
	ut4g==
X-Gm-Message-State: ALoCoQk+S8HB5sb1Pal7H5az9N/GX+D0XP60/KEgXNMc4+wjgMgNlTLQpVF2BEOAa/LOXPcphajW
MIME-Version: 1.0
X-Received: by 10.60.155.97 with SMTP id vv1mr19269829oeb.15.1433323581794;
	Wed, 03 Jun 2015 02:26:21 -0700 (PDT)
Received: by 10.60.167.75 with HTTP; Wed, 3 Jun 2015 02:26:21 -0700 (PDT)
In-Reply-To: <mkmerf$klu$1@ger.gmane.org>
References: <1433315969-8449-1-git-send-email-naresh.bhat@linaro.org>
	<mkmerf$klu$1@ger.gmane.org>
Date: Wed, 3 Jun 2015 14:56:21 +0530
Message-ID: <CAFoFrHZS-ANXLAONouasqLwqhPuupvz7MNjCaA=JpbA44MC8_Q@mail.gmail.com>
From: Naresh Bhat <naresh.bhat@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-filesystems][PATCH] xorriso: Add xorriso v1.4.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Jun 2015 09:26:23 -0000
Content-Type: text/plain; charset=UTF-8

On 3 June 2015 at 14:15, Koen Kooi <koen@dominion.thruhere.net> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Naresh Bhat schreef op 03-06-15 om 09:19:
>> Add xorriso v1.4.0 based on the discussions
>> http://patchwork.openembedded.org/patch/91143/
>> http://lists.openembedded.org/pipermail/openembedded-devel/2015-April/100981
> .html
>>
>>
> We have tested this package with
>> Montavista CGE product - http://www.mvista.com/ and luvOS distribution -
>> https://01.org/linux-uefi-validation build. Inherit the pkgconfig to
>> avoid the below error, .. ... | disabled use of O_DIRECT with input of
>> -as cdrskin |
>> luv-yocto/build/tmp/work/aarch64-oe-linux/xorriso/1.4.0-r0/xorriso-1.4.0/
>>
>>
> configure: line 14352: syntax error near unexpected token `LIBCDIO,'
>> |
>> luv-yocto/build/tmp/work/aarch64-oe-linux/xorriso/1.4.0-r0/xorriso-1.4.0/
>>
>>
> configure: line 14352: `    PKG_CHECK_MODULES(LIBCDIO, libcdio >=
> $LIBCDIO_REQUIRED)'
>> ... ....
>>
>> Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org> Signed-off-by:
>> Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com> Signed-off-by:
>> Gaurang Shastri <gshastri@juniper.net> ---
>> .../recipes-utils/xorriso/xorriso_1.4.0.bb         |   29
>> ++++++++++++++++++++ 1 file changed, 29 insertions(+) create mode 100644
>> meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb
>>
>> diff --git a/meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb
>> b/meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb new file mode
>> 100644 index 0000000..73ba9b3 --- /dev/null +++
>> b/meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb @@ -0,0 +1,29
>> @@ +DESCRIPTION = "xorriso copies file objects from POSIX compliant
>> filesystems \ +into Rock Ridge enhanced ISO 9660 filesystems and allows
>> session-wise \ +manipulation of such filesystems" + +LICENSE = "GPLv3"
>> +LIC_FILES_CHKSUM =
>> "file://COPYING;md5=d32239bcb673463ab874e80d47fae504" + +SRC_URI =
>> "http://www.gnu.org/software/${BPN}/${BPN}-${PV}.tar.gz" +
>> +SRC_URI[md5sum] = "ec79fd2736b8da76e7a870e27cadf6fa" +SRC_URI[sha256sum]
>> = "0bd1e085015b28c24f57697d6def2fe84517967dc417554c0c3ccf1685ed0e56" +
>> +PACKAGECONFIG ??= "acl attr zlib bzip2 readline" +PACKAGECONFIG[acl] =
>> "--enable-libacl,--disable-libacl,acl," +PACKAGECONFIG[attr] =
>> "--enable-xattr,--disable-xattr,attr," +PACKAGECONFIG[zlib] =
>> "--enable-zlib,--disable-zlib,zlib," +PACKAGECONFIG[bzip2] =
>> "--enable-libbz2,--disable-libbz2,bzip2," +PACKAGECONFIG[readline] =
>> "--enable-libreadline,--disable-libreadline,readline," + +RDEPENDS_${PN}
>> = "tk"
>
> R* variables go below do_install
Thank Koen,

I have moved the R* variable.
>
>> +REQUIRED_DISTRO_FEATURES = "x11" + +inherit autotools-brokensep
>> pkgconfig + +do_configure_prepend () { +    touch NEWS +} +
>> +BBCLASSEXTEND = "native"
>>
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFVbr6vMkyGM64RGpERAscEAKCR+Asg4/BFyI6INuiE2UzDqUGdeQCcDD/s
> mAPWo9S+lfhM0ZRDzkEWhQI=
> =3kZB
> -----END PGP SIGNATURE-----
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

