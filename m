Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6FCEA79504
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Aug 2018 23:42:09 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id p6-v6so8663245ljc.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Aug 2018 16:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SbVzD4BF5oiAMgolK/vx2tKyKkjNaVppXMw0zmRHqIo=;
	b=emlG2nEBqH1FirMIwjuOTZR3kEueLSqSCkqZh24KyyNQLFUjqX9UXvVkBjN55HbMMd
	X35DmeNYiX8jbVzXxa9KJRB1SB1TFVkyJYRBrLbdcV2jQRh3ntEpBN1+DN8VrAEhXAc7
	qSyN+14IuRI1mJn374F7V14+GKTfrtb2bE4/VicE1qJVJF/TxRRyrKeQIdxBu4qH6lfu
	3KXdpE2+ye2TdcMVhpfOXT9Fr02RMN9Q2OuDRbLsjrmDOKUOv+4SPoNRajjWas7Roe8d
	rzBKa64BF5O6k8LssvUuUmIZVkdKgPrTFwH+4MtrSmLqEJ4ANAUChAlIOoPFRLPaWbTJ
	xCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SbVzD4BF5oiAMgolK/vx2tKyKkjNaVppXMw0zmRHqIo=;
	b=KAYKN1DwCmIiCerSvKcFI4h2mks9N4Evn5RwJkKVJHJok0bGehM8iJkmjG28uwIUYW
	I4ylY89QpjEr7E3z5/sCf99MO9lMTUu0OV5FuOC4nM91mn844uLry/K++x8oF1lsYFpq
	dRTRrXmYa7Hf5F/+acMrdL+1qlFSrQf2uGRaBTf0vlFm0CoTxw5I3B5nLJy5qJ7WTKeH
	dVv/DKd61Z70FM7vdnMytlPP0+kaLZL7BaD+H7k1f9rWR0d+VkN0nl0MiEbstM2MyNb/
	/9el4uhrG8ZRjKaSyCZuWkIa/+PmoXo2nm2A1QRv+wDhhmayg8BGqQz8MYSa0ozdg0bh
	ODCg==
X-Gm-Message-State: APzg51A2jQKLRCHeg8c7GijCdLiuoriRmOly2MfUUcwHm3L+qY6lx7RC
	UvY8nRkaA0WcP3zLcvW9R4IQtIq4SLmPLiay0DU=
X-Google-Smtp-Source: ANB0VdbJrZaC3rdaGj5JStu0fa1kjii7ErGH9BSDoTLqi0zGkdaBEj8OyQaMNXvVkgpcRl3isJgDtuivcegkTqXYcso=
X-Received: by 2002:a2e:380d:: with SMTP id
	f13-v6mr9170923lja.74.1535672529974; 
	Thu, 30 Aug 2018 16:42:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:5649:0:0:0:0:0 with HTTP; Thu, 30 Aug 2018 16:41:39
	-0700 (PDT)
In-Reply-To: <CAMKF1srJ3o0R0zaPZ4r_bLxcHdphoZumHEoPuAdtGbfWzh+a3A@mail.gmail.com>
References: <20180723231104.23011-1-alistair.francis@wdc.com>
	<CAMKF1sqs1Xtj6o=yReDTjg7qp=w68PBZRWOXOrWENS3fn+fgFg@mail.gmail.com>
	<CAKmqyKMnqrjf3-zLooNc2KcBpLhctLOufEDep0NnOCo6g_mJWg@mail.gmail.com>
	<CAMKF1srJ3o0R0zaPZ4r_bLxcHdphoZumHEoPuAdtGbfWzh+a3A@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 30 Aug 2018 16:41:39 -0700
Message-ID: <CAKmqyKN_JLCsw+MWWUtKVYCp0e9r7khQK6y4DUyNwjMDDuGE+g@mail.gmail.com>
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
X-List-Received-Date: Thu, 30 Aug 2018 23:42:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 29, 2018 at 4:31 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Aug 29, 2018 at 3:47 PM Alistair Francis <alistair23@gmail.com> wrote:
>>
>> On Fri, Aug 17, 2018 at 7:21 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> > Hi Alistair
>> >
>> > We have accepted this patch however a new run with x86-64/musl shows
>> > that it failed to build with following error
>> > probably #include <sys/types.h> will fix it
>>
>> Hey Khem,
>>
>> Sorry for the delay, I tried to reproduce this today and I wasn't able
>> to. I did see a different issue about missing systemd which I have a
>> fix for though.
>>
>
> http://git.openembedded.org/meta-openembedded/commit/?id=1e6a27d8e226029689caa22a7cec10f8982ad180
>
> fixed the issue.

Ah, I missed that. Thanks for that.

Alistair

>
>
>> Alistair
>>
>> >
>> >
>> > | In file included from util/abspath.c:5:
>> > | ./util/strbuf.h:68:45: error: unknown type name 'ssize_t'; did you
>> > mean 'size_t'?
>> > |  extern void strbuf_init(struct strbuf *buf, ssize_t hint);
>> > |                                              ^~~~~~~
>> > |                                              size_t
>> > | ./util/strbuf.h:73:15: error: unknown type name 'ssize_t'
>> > |  static inline ssize_t strbuf_avail(const struct strbuf *sb) {
>> > |                ^~~~~~~
>> > | ./util/strbuf.h:105:8: error: unknown type name 'ssize_t'
>> > |  extern ssize_t strbuf_read(struct strbuf *, int fd, ssize_t hint);
>> > |         ^~~~~~~
>> > | ./util/strbuf.h:105:53: error: unknown type name 'ssize_t'; did you
>> > mean 'size_t'?
>> > |  extern ssize_t strbuf_read(struct strbuf *, int fd, ssize_t hint);
>> > |                                                      ^~~~~~~
>> > |                                                      size_t
>> > | make[2]: *** [Makefile:678: util/abspath.o] Error 1
>> >
>> > On Mon, Jul 23, 2018 at 4:11 PM Alistair Francis
>> > <alistair.francis@wdc.com> wrote:
>> >>
>> >> Add the NDCTL package (the libnvdimm utility library). This is based
>> >> on the work from the meta-luv layer with a version bump.
>> >>
>> >> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> >> ---
>> >> V2:
>> >>  - Fix install failure
>> >>
>> >>  meta-oe/recipes-core/ndctl/ndctl_git.bb | 29 +++++++++++++++++++++++++
>> >>  1 file changed, 29 insertions(+)
>> >>  create mode 100644 meta-oe/recipes-core/ndctl/ndctl_git.bb
>> >>
>> >> diff --git a/meta-oe/recipes-core/ndctl/ndctl_git.bb b/meta-oe/recipes-core/ndctl/ndctl_git.bb
>> >> new file mode 100644
>> >> index 000000000..36f94ecfd
>> >> --- /dev/null
>> >> +++ b/meta-oe/recipes-core/ndctl/ndctl_git.bb
>> >> @@ -0,0 +1,29 @@
>> >> +SUMMARY = "libnvdimm utility library"
>> >> +DESCRIPTION = "Utility library for managing the libnvdimm \
>> >> +(non-volatile memory device) sub-system in the Linux kernel. \
>> >> +The LIBNVDIMM subsystem provides support for three types of \
>> >> +NVDIMMs, namely,PMEM, BLK, and NVDIMM devices that can \
>> >> +simultaneously support both PMEM and BLK mode access."
>> >> +HOMEPAGE = "https://git.kernel.org/cgit/linux/kernel/git/nvdimm/nvdimm.git/tree/Documentation/nvdimm/nvdimm.txt?h=libnvdimm-for-next"
>> >> +LICENSE = "GPLv2+"
>> >> +LIC_FILES_CHKSUM = "file://COPYING;md5=e66651809cac5da60c8b80e9e4e79e08"
>> >> +
>> >> +inherit autotools-brokensep pkgconfig module-base
>> >> +
>> >> +SRCREV = "0d6aeeabec9d271e08c12e4cf679b59946e20156"
>> >> +SRC_URI = "git://github.com/pmem/ndctl.git"
>> >> +
>> >> +DEPENDS = "virtual/kernel kmod udev json-c"
>> >> +
>> >> +PV = "v61+git${SRCPV}"
>> >> +S = "${WORKDIR}/git"
>> >> +
>> >> +EXTRA_OECONF += "--enable-test --enable-destructive --disable-docs"
>> >> +
>> >> +do_configure_prepend() {
>> >> +    ${S}/autogen.sh
>> >> +}
>> >> +
>> >> +COMPATIBLE_HOST='(x86_64).*'
>> >> +
>> >> +FILES_${PN} += "/usr/share/bash-completion/completions/ndctl"
>> >> --
>> >> 2.17.1
>> >>
>> >> --
>> >> _______________________________________________
>> >> Openembedded-devel mailing list
>> >> Openembedded-devel@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

