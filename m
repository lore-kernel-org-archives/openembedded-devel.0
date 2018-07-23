Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 74E3775532
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 23:12:02 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id q5-v6so1942051ljh.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 16:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fm1QROl0JLy0RyFc54zNy2QNJ1izIRSFVbej0cN3aFA=;
	b=VwvjpJHOAlpdrv83Z9H3aFRCfKi0EdwWxV6qcJM+v7MXNzs6sEFii/P85OxNUlygVY
	fJAlub/EtB4X5I/AjTFjxw8T/mOvChrpS3ly2/gf8PCDz8bxEvuh87jvYoDqzJpKqQQ3
	W8m3wpAgt83tRU4QxSr8MDlQl+gf9yzG8RvkCHK7rtkJEkA8t7+ziWVT/z8ugu+oNCMR
	2JKz1xezYWoiODDMQUdlkGRxBGdFnaV9WlkapuhuJUXmxGQFXTcsSXmFTJC1uEWIVF2Y
	YdmG/Qm/gbz0MIs8xUoVpsUNptyIHFmnvoFtZEV5zuNDKSCtYCgPAP/tSXQSP+8oiDAT
	ZyUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fm1QROl0JLy0RyFc54zNy2QNJ1izIRSFVbej0cN3aFA=;
	b=ep+mnJMqatddhGjSi55Hr0RknRPaOhzp1VyIRTS9/I9fR8768YapkrdeIQ7lrt6fA/
	G+HJyxSwXJfO/ZbHo5DXwiva656IewCYf0mTw9M8WGvsqiIQtVCNvuMiUosQiXKQ2b5h
	rHGu2QNuz6IVeUyBPKSZWAdvzvLH6mfl2wCeqm0j5i+8kYN6SnIr3p2yOUWRrE3vEilf
	PTtUcLvFTCHvxCHPDFsAiy5dYPLy0NcWGvcvr5fwnVvdoXWU7jWeg5DU9btCyhi+NBWr
	0UbP/0ZsEutQTyjoLqs8WHDVwybnjDGMCMNZ0Jb1Iyr5e/FBDF7G/rzg+dyggiClzHTu
	9BHg==
X-Gm-Message-State: AOUpUlE9ODhu3uMyW+9pIQZ34XEd/5nr8ZUy3uVhdHTjxIF7VD0M1F/1
	hjgOnWhy4erC3fUYBTqnu73QnkG5WvIKgNdfRRs=
X-Google-Smtp-Source: AAOMgpcxwGrdbzr7uNImsyYvVUwo1Fyg8QqKu14ejz/RLasDxCRTtf4vXgTPyzLuYtN2aN41GeJMSiswx+WZcYpn1+U=
X-Received: by 2002:a2e:8185:: with SMTP id
	e5-v6mr10702322ljg.93.1532387523054; 
	Mon, 23 Jul 2018 16:12:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:859a:0:0:0:0:0 with HTTP; Mon, 23 Jul 2018 16:11:32
	-0700 (PDT)
In-Reply-To: <CAMKF1soTg324TAuiTLRczMKq2aF0GSqNdDqhTmUW+neGAtj+fw@mail.gmail.com>
References: <20180716223703.1588-1-alistair.francis@wdc.com>
	<CAMKF1soTg324TAuiTLRczMKq2aF0GSqNdDqhTmUW+neGAtj+fw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Jul 2018 16:11:32 -0700
Message-ID: <CAKmqyKOs2XKDxHckLB3H6aUORi+UndKzoy4hV+2PsvdC0=+6-A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
	megha.dey@linux.intel.com,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] ndctl: Add the NDCTL package
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
X-List-Received-Date: Mon, 23 Jul 2018 23:12:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 20, 2018 at 4:06 PM, Khem Raj <raj.khem@gmail.com> wrote:
> fails to build on qemux86_64
>
> | install: cannot stat
> '/home/jenkins/oe/world/oe-build/build/tmpfs/work/qemux86_64-bec-linux/ndctl/v61+gitAUTOINC+0d6aeeabec-r0/ndctl_runner':
> No such file or directory
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_install (log file is located at
> /home/jenkins/oe/world/oe-build/build/tmpfs/work/qemux86_64-bec-linux/ndctl/v61+gitAUTOINC+0d6aeeabec-r0/temp/log.do_install.28110)

Fixed in v2.

Alistair

> On Mon, Jul 16, 2018 at 3:47 PM Alistair Francis
> <alistair.francis@wdc.com> wrote:
>>
>> Add the NDCTL package (the libnvdimm utility library). This is based
>> on the work from the meta-luv layer with a version bump.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>  meta-oe/recipes-core/ndctl/ndctl_git.bb | 34 +++++++++++++++++++++++++
>>  1 file changed, 34 insertions(+)
>>  create mode 100644 meta-oe/recipes-core/ndctl/ndctl_git.bb
>>
>> diff --git a/meta-oe/recipes-core/ndctl/ndctl_git.bb b/meta-oe/recipes-core/ndctl/ndctl_git.bb
>> new file mode 100644
>> index 000000000..3bf54e74b
>> --- /dev/null
>> +++ b/meta-oe/recipes-core/ndctl/ndctl_git.bb
>> @@ -0,0 +1,34 @@
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
>> +do_install_append() {
>> +        install -d ${D}${bindir}
>> +        install -m 755 ${WORKDIR}/ndctl_runner ${D}${bindir}
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

