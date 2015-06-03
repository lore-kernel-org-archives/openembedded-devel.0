Return-Path: <naresh.bhat@linaro.org>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 719277579F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jun 2015 07:25:42 +0000 (UTC)
Received: by obcnx10 with SMTP id nx10so1127583obc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2015 00:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=UVUnmfIPFsJ6E3hDKuyLxZKJS1z8kmfu6Xd1Vt2i6cE=;
	b=aq2AxREIeC5GIAQCQShWbUSf70sZ0qGp7fBTXOzQoFEcDRZwz3PrJs8ChyN9Mg4Wrq
	iZEGCV5JuV1jEF+zfzor8DFCMk33IMkTE6F5LAROajGaX6rO1FpJYhY+xYRjkNvbCoSJ
	NZdFTb23L8uFMeYrI48s/Ap2TNa+V/9BFdKwJtcTe1x+veRDpBscIXROqxRWV+OXnWYD
	i9TSNhI+X97UTvZoMZx8gJhXmG+tFHux+dq2ccTnk4Ckf3fDe/lkKp98a2aIkc8ENZ9a
	mCQIqeAqqXrDqJdkplay13itMTMS+bElMy0epamp/cJXkwQCzzKRIDki+ltYrVbgFXDu
	3uKw==
X-Gm-Message-State: ALoCoQlI3glOTrt4aQGOvI2xHOjcWot+D9ajDqWU6y/+69ElUM9lXUM17GeTPI8CDHJg7JJPBEdJ
MIME-Version: 1.0
X-Received: by 10.182.78.9 with SMTP id x9mr1777567obw.72.1433316343643; Wed,
	03 Jun 2015 00:25:43 -0700 (PDT)
Received: by 10.60.167.75 with HTTP; Wed, 3 Jun 2015 00:25:43 -0700 (PDT)
In-Reply-To: <CAJ86T=V9TrY4Pv53kwWua2beRp1XhFbXt767qK+-2=NF=76bRw@mail.gmail.com>
References: <1433170089-9030-1-git-send-email-naresh.bhat@linaro.org>
	<CAJ86T=V9TrY4Pv53kwWua2beRp1XhFbXt767qK+-2=NF=76bRw@mail.gmail.com>
Date: Wed, 3 Jun 2015 12:55:43 +0530
Message-ID: <CAFoFrHYVp7iZDNdfJ0x1h3POtRy5pgNQPKMZsHTAAm5rxHhBRA@mail.gmail.com>
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
X-List-Received-Date: Wed, 03 Jun 2015 07:25:44 -0000
Content-Type: text/plain; charset=UTF-8

Hi Andre McCurdy,

Thank you very much for doing review.  I have considered all your
suggestions and you can find the re-worked patch
http://lists.openembedded.org/pipermail/openembedded-devel/2015-June/101744.html

On 3 June 2015 at 05:05, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Mon, Jun 1, 2015 at 7:48 AM, Naresh Bhat <naresh.bhat@linaro.org> wrote:
>> Add xorriso v1.4.0 based on the discussions
>> http://patchwork.openembedded.org/patch/91143/
>> http://lists.openembedded.org/pipermail/openembedded-devel/2015-April/100981.html
>> We have tested this package with
>> Montavista CGE product - http://www.mvista.com/ and
>> luvOS distribution - https://01.org/linux-uefi-validation build.
>> Inherit the pkgconfig to avoid the below error,
>> ..
>> ...
>> | disabled use of O_DIRECT with input of -as cdrskin
>> | luv-yocto/build/tmp/work/aarch64-oe-linux/xorriso/1.4.0-r0/xorriso-1.4.0/
>> configure: line 14352: syntax error near unexpected token `LIBCDIO,'
>> | luv-yocto/build/tmp/work/aarch64-oe-linux/xorriso/1.4.0-r0/xorriso-1.4.0/
>> configure: line 14352: `    PKG_CHECK_MODULES(LIBCDIO, libcdio >= $LIBCDIO_REQUIRED)'
>> ...
>> ....
>>
>> Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
>> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
>> Signed-off-by: Gaurang Shastri <gshastri@juniper.net>
>> ---
>>  .../recipes-utils/xorriso/xorriso_1.4.0.bb         |   30 ++++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>>  create mode 100644 meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb
>>
>> diff --git a/meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb b/meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb
>> new file mode 100644
>> index 0000000..2f81f0d
>> --- /dev/null
>> +++ b/meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb
>> @@ -0,0 +1,30 @@
>> +DESCRIPTIONS = "xorriso copies file objects from POSIX compliant filesystems \
>> +into Rock Ridge enhanced ISO 9660 filesystems and allows session-wise \
>> +manipulation of such filesystems"
>
> That should be DESCRIPTION, not DESCRIPTIONS.
Done.
>
>> +LICENSE = "GPLv3"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>> +
>> +# with, without, depends, rdepends
>> +#
>
> Drop these comments.
Thanks, I have removed it.
>
>> +PACKAGECONFIG ??= "acl attr zlib bzip2 readline"
>> +PACKAGECONFIG[acl] = "--enable-libacl,--disable-libacl,acl,"
>> +PACKAGECONFIG[attr] = "--enable-xattr,--disable-xattr,attr,"
>> +PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib,"
>> +PACKAGECONFIG[bzip2] = "--enable-libbz2,--disable-libbz2,bzip2,"
>> +PACKAGECONFIG[readline] = "--enable-libreadline,--disable-libreadline,readline,"
>> +
>> +RDEPENDS_${PN} = "tk"
>
> tk depends on the x11 distro feature, so perhaps xorriso should do too?
Yes, You are right.  I did the necessary changes.
>
>> +inherit autotools-brokensep pkgconfig
>> +
>> +SRC_URI = "http://www.gnu.org/software/${BPN}/${BPN}-${PV}.tar.gz"
>
> Move nearer to the top of the recipe, after LIC_FILES_CHKSUM.
Done.
>
> See http://www.openembedded.org/wiki/Styleguide
Thanks I have looked into it.
>
>> +do_configure_prepend () {
>> +    touch NEWS
>> +}
>> +
>> +BBCLASSEXTEND = "native"
>> +
>> +SRC_URI[md5sum] = "ec79fd2736b8da76e7a870e27cadf6fa"
>> +SRC_URI[sha256sum] = "0bd1e085015b28c24f57697d6def2fe84517967dc417554c0c3ccf1685ed0e56"
>
> Move nearer to the top of the recipe, just after SRC_URI.
Done.
>
>> --
>> 1.7.9.5
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

