Return-Path: <andrea.adami@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2787C606D4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 May 2014 08:34:11 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id w7so2849838lbi.35
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 May 2014 01:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=OOPjaPBb+pZFwFd/gY1VmyQ8uyykOPzm95qA3idce/4=;
	b=xOAR9wbi2CaJyG6FQzhw0bR/5HxO6M8/GxrK71vHalSKzCMMOQl9P5syN+EuGy090U
	ywGh4J/lQzeUpRz02b36hbKNH5WUHm6LZKALcuDBbFsD8Zpvvv/vtJqFrwEmsU0EQIZc
	RmUIwVL2F2EE662E99nKF0bwrWVFXPTebs7v4fAueWwCmhe6ySNJCiN5eg7Jdjj7Jcqt
	EUGcd0U/iBSbVF0kr+WsZmwua+GOTeqV1pLszPBP2IC+W+2+JlotqaNUn5cEYJTxplE9
	fSPamQrocY9HrxmHw6FtDy0xVg8WOExixYN7xzr3fpKdvIoezDgtimUrvNT6PPYpZADF
	1dLQ==
MIME-Version: 1.0
X-Received: by 10.112.171.67 with SMTP id as3mr10947572lbc.10.1399019651733;
	Fri, 02 May 2014 01:34:11 -0700 (PDT)
Received: by 10.112.35.234 with HTTP; Fri, 2 May 2014 01:34:11 -0700 (PDT)
In-Reply-To: <1399018873.12731.21.camel@ted>
References: <1398986009-20163-1-git-send-email-andrea.adami@gmail.com>
	<1399018873.12731.21.camel@ted>
Date: Fri, 2 May 2014 10:34:11 +0200
Message-ID: <CAAQYJAtY33YvGL7RVYpBiKtOkt3OxV7h=XV0EyY8yovZwDFdtg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH] klcc_cross: move in target sysroot as crosscript
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
X-List-Received-Date: Fri, 02 May 2014 08:34:13 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 2, 2014 at 10:21 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2014-05-02 at 01:13 +0200, Andrea Adami wrote:
>> Klcc-cross is properly a crosscript so avoid to
>> inherit cross.bbclass and stage it in target sysroot
>> under usr/bin/crossscripts.
>> Minor adjustment is necessary for INSTALLDIR.
>>
>> Finally some optional magic mangling is added to better match the perl syntax:
>> let it commented for future reference.
>
> Why is this commented? Its not optional and the recipe will not work
> properly without that change.
>
> Cheers,
>
> Richard


Richard,

I probably misunderstand that part.

I could not see any difference in the produced klcc.cross scripts with
or without the mangling.
Tested runtime on 3 machines.
What I did not yet try is a rebuild from sstate but I expect it to be rebuilt.

Will send a patch v2.

Thanks

Andrea


>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> ---
>>  .../recipes-devtools/klibc/klcc-cross_2.0.3.bb     | 40 +++++++++++++---------
>>  1 file changed, 23 insertions(+), 17 deletions(-)
>>
>> diff --git a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.3.bb b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.3.bb
>> index 7ff9c2e..5e767c1 100644
>> --- a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.3.bb
>> +++ b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.3.bb
>> @@ -7,28 +7,34 @@ FILESPATH =. "${FILE_DIRNAME}/klibc-${PV}:"
>>
>>  SRC_URI += "file://use-env-for-perl.patch"
>>
>> -inherit cross
>> -
>>  # disable task already run in klibc recipe
>>  do_configure[noexec] = "1"
>> +
>>  do_compile() {
>> -    oe_runmake 'INSTALLDIR=${STAGING_DIR_TARGET}${target_libdir}/klibc' klcc
>> +    oe_runmake 'INSTALLDIR=${STAGING_DIR_TARGET}${libdir}/klibc' klcc
>>  }
>> -# The linux-libc-headers and klibc custom headers are not machine-specific
>> -# but are installed into machine sysroot.
>> -# Klcc wrapper is hardcoding some of these paths thus, to keep the recipe
>> -# arch-specific, we force the rebuild of klcc-cross for each machine.
>> -do_compile[vardeps] += "MACHINE"
>> +
>>  do_install() {
>> -    install -d ${D}${bindir}
>> -    install -m 0755 klcc/klcc ${D}${bindir}/${TARGET_PREFIX}klcc
>> +    install -d ${D}${bindir_crossscripts}/
>> +    install -m 0755 klcc/klcc ${D}${bindir_crossscripts}/${TARGET_PREFIX}klcc
>> +    # Insert an unencoded path as a comment to trigger the sstate renaming functions
>> +    sed -i '2i #${STAGING_DIR_TARGET}'  ${D}${bindir_crossscripts}/${TARGET_PREFIX}klcc
>> +}
>> +
>> +SYSROOT_PREPROCESS_FUNCS += "klcc_sysroot_preprocess"
>> +
>> +klcc_sysroot_preprocess () {
>> +       sysroot_stage_dir ${D}${bindir_crossscripts} ${SYSROOT_DESTDIR}${bindir_crossscripts}
>>  }
>>
>> +deltask do_package
>> +deltask do_packagedata
>> +deltask do_package_write_ipk
>> +deltask do_package_write_rpm
>> +deltask do_package_write_deb
>> +deltask do_package_write_tar
>>
>> -# disable unneeded tasks
>> -do_package[noexec] = "1"
>> -do_packagedata[noexec] = "1"
>> -do_package_write_ipk[noexec] = "1"
>> -do_package_write_rpm[noexec] = "1"
>> -do_package_write_deb[noexec] = "1"
>> -do_package_write_tar[noexec] = "1"
>> +SSTATE_SCAN_FILES = "*"
>> +#EXTRA_STAGING_FIXMES = "MANGLEDSTAGINGDIRTARGET MANGLEDSTAGINGDIR"
>> +#MANGLEDSTAGINGDIR = "${@d.getVar("STAGING_DIR", True).replace("/", "\\\\/").replace("-", "\\-")}"
>> +#MANGLEDSTAGINGDIRTARGET = "${@d.getVar("STAGING_DIR_TARGET", True).replace("/", "\\\\/").replace("-", "\\-")}"
>
>

