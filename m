Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6138B746E5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Aug 2018 22:47:01 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id y17-v6so5688833ljy.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Aug 2018 15:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2PeiSHmVHI8LRFDYczGizBhjF6hhXsUilGGfdVIuPUc=;
	b=EYq/KL1z4NxwPsiyjHtKPImsH/Sq/HY12i2xobcZps95b8/mRNSJ7xpHFlkkXrb09t
	aIT9BMdqBOwFb4kDQ2rGYf53DUWNZjqCtxmul2SrVkCd9HQorbU3GrPhS6VLn5bBazu0
	SipQh38vBLUKpkdV5DYyW7IHXBJ548V4tsMpLfIFZROSezHkd6VCpMQLmLCXy3xxAv9Q
	8cfgBJATeiDkmCBZaLYDmPq3Xc4lYsa5o+pnfGf3iw/PBiPqayL3lUfFvQGSYWs/Zn4X
	fvLxU2NH0qIhLIWNbXPxMyo7Gz14plSbGPJc7A2KRlVTkmR4FVF0WHplDPzGaQb8NUQ5
	B6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2PeiSHmVHI8LRFDYczGizBhjF6hhXsUilGGfdVIuPUc=;
	b=LM7aYq57zsITXSseneIUR2y7SKiE3Ezju1mSAUe0u76jt+7Ol8lDhwMpTIuk5ocWSL
	zMWopKxD7DMMh1HrYIRlgitMSRGVM40jDneAt5iX0IHHJx8WkQui0sKjiv7D/3Km+pyv
	nADVv/kUfCbVMZuG9WbzLWC6o4chREkPOpnTGUBsPOWIvvN1q4tb9yu4kEA3xMO/DYpj
	3WM6LcstGH6GqHz0bpdZi5SO3ZILXtWQ0Rg1ZCuhcsLOCWrMu3r/ENBKDo/tbHbYqLGw
	urIeYm0F/XIA6mPW9GUX3lVPUrjAZSn/3riOYCK8rgDJRTTvBWK5wOuDnG3aEGDs9Lyy
	s/Bg==
X-Gm-Message-State: APzg51A13l+E6T92zwjfvDIyQa3W0WuCvNYyVlUVD2C4djNNovXSrU4P
	Eedd0pBvbAbJlC4u/TahorYEELVp9JDcK6cC6n4=
X-Google-Smtp-Source: ANB0Vdb5gogAyxYx9jpbQhOxBaV6PkoaEJcvZ0Bc4tsF1JbYJMu1/AYHZ7uIeW58WU7G4uYmzKdvJwtj+sb7Chkz2z0=
X-Received: by 2002:a2e:429c:: with SMTP id
	h28-v6mr5398908ljf.67.1535582822001; 
	Wed, 29 Aug 2018 15:47:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:5649:0:0:0:0:0 with HTTP; Wed, 29 Aug 2018 15:46:31
	-0700 (PDT)
In-Reply-To: <CAMKF1sqs1Xtj6o=yReDTjg7qp=w68PBZRWOXOrWENS3fn+fgFg@mail.gmail.com>
References: <20180723231104.23011-1-alistair.francis@wdc.com>
	<CAMKF1sqs1Xtj6o=yReDTjg7qp=w68PBZRWOXOrWENS3fn+fgFg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 29 Aug 2018 15:46:31 -0700
Message-ID: <CAKmqyKMnqrjf3-zLooNc2KcBpLhctLOufEDep0NnOCo6g_mJWg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
	megha.dey@linux.intel.com,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2] ndctl: Add the NDCTL package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Aug 2018 22:47:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 17, 2018 at 7:21 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Hi Alistair
>
> We have accepted this patch however a new run with x86-64/musl shows
> that it failed to build with following error
> probably #include <sys/types.h> will fix it

Hey Khem,

Sorry for the delay, I tried to reproduce this today and I wasn't able
to. I did see a different issue about missing systemd which I have a
fix for though.

Alistair

>
>
> | In file included from util/abspath.c:5:
> | ./util/strbuf.h:68:45: error: unknown type name 'ssize_t'; did you
> mean 'size_t'?
> |  extern void strbuf_init(struct strbuf *buf, ssize_t hint);
> |                                              ^~~~~~~
> |                                              size_t
> | ./util/strbuf.h:73:15: error: unknown type name 'ssize_t'
> |  static inline ssize_t strbuf_avail(const struct strbuf *sb) {
> |                ^~~~~~~
> | ./util/strbuf.h:105:8: error: unknown type name 'ssize_t'
> |  extern ssize_t strbuf_read(struct strbuf *, int fd, ssize_t hint);
> |         ^~~~~~~
> | ./util/strbuf.h:105:53: error: unknown type name 'ssize_t'; did you
> mean 'size_t'?
> |  extern ssize_t strbuf_read(struct strbuf *, int fd, ssize_t hint);
> |                                                      ^~~~~~~
> |                                                      size_t
> | make[2]: *** [Makefile:678: util/abspath.o] Error 1
>
> On Mon, Jul 23, 2018 at 4:11 PM Alistair Francis
> <alistair.francis@wdc.com> wrote:
>>
>> Add the NDCTL package (the libnvdimm utility library). This is based
>> on the work from the meta-luv layer with a version bump.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>> V2:
>>  - Fix install failure
>>
>>  meta-oe/recipes-core/ndctl/ndctl_git.bb | 29 +++++++++++++++++++++++++
>>  1 file changed, 29 insertions(+)
>>  create mode 100644 meta-oe/recipes-core/ndctl/ndctl_git.bb
>>
>> diff --git a/meta-oe/recipes-core/ndctl/ndctl_git.bb b/meta-oe/recipes-core/ndctl/ndctl_git.bb
>> new file mode 100644
>> index 000000000..36f94ecfd
>> --- /dev/null
>> +++ b/meta-oe/recipes-core/ndctl/ndctl_git.bb
>> @@ -0,0 +1,29 @@
>> +SUMMARY = "libnvdimm utility library"
>> +DESCRIPTION = "Utility library for managing the libnvdimm \
>> +(non-volatile memory device) sub-system in the Linux kernel. \
>> +The LIBNVDIMM subsystem provides support for three types of \
>> +NVDIMMs, namely,PMEM, BLK, and NVDIMM devices that can \
>> +simultaneously support both PMEM and BLK mode access."
>> +HOMEPAGE = "https://git.kernel.org/cgit/linux/kernel/git/nvdimm/nvdimm.git/tree/Documentation/nvdimm/nvdimm.txt?h=libnvdimm-for-next"
>> +LICENSE = "GPLv2+"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=e66651809cac5da60c8b80e9e4e79e08"
>> +
>> +inherit autotools-brokensep pkgconfig module-base
>> +
>> +SRCREV = "0d6aeeabec9d271e08c12e4cf679b59946e20156"
>> +SRC_URI = "git://github.com/pmem/ndctl.git"
>> +
>> +DEPENDS = "virtual/kernel kmod udev json-c"
>> +
>> +PV = "v61+git${SRCPV}"
>> +S = "${WORKDIR}/git"
>> +
>> +EXTRA_OECONF += "--enable-test --enable-destructive --disable-docs"
>> +
>> +do_configure_prepend() {
>> +    ${S}/autogen.sh
>> +}
>> +
>> +COMPATIBLE_HOST='(x86_64).*'
>> +
>> +FILES_${PN} += "/usr/share/bash-completion/completions/ndctl"
>> --
>> 2.17.1
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

