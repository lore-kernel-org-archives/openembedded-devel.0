Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id C406171B2E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Aug 2018 23:32:18 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id z8-v6so7819654qto.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Aug 2018 16:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=a4uQ5cD9ZNQLs+jSnGogm/kgjYVuvMZ0EkgZGWE92bg=;
	b=R3F+fILnStS+IPicqYm43/BajZEO044N2kb/gXo16Tyh9iuUGdTFcSUctVtVyKUXyn
	wHmyzkCsWJOGmva1kLokkmF2tsqwpUYJzwf1OcVBizh4eS3Ny65TPqS2VPDFsn6Y1As/
	ZPcnRTOH0v65/4dstD07OAfdUw1FZwAKKFaK34hfRAJtl35W/xENA9PNH0pvsaNbZzus
	YSYJyQ1+AC7SNi3Fvqd8oK7rxY17lf/3gRj52pQVF8zXLehOonQ+8e1ZVUi5Zz9NoRuz
	rvu+ySysmBwwWreylvisUW5pFwLIWio7krlJCnnkZrle8jChOeIU79N6MyS2oUbaZvO1
	fGNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=a4uQ5cD9ZNQLs+jSnGogm/kgjYVuvMZ0EkgZGWE92bg=;
	b=KJza4NaNAURlEgc1O2bJh8Cg6iM6JOWlmgxtHsYOq4WrTN8xq7LdXFvdYdNQzSCufe
	oq9AGSuMOdTTMJtuwgQwjUo9xNyHuCP4OGVY2tpPOArm7lbt+/rIs3mLrFUB0gklEugA
	ktE5wOklqGuUuVSvXm4SjfE5WN+GVpnccHRtKXV/Qw1kiY+3sYql5JNYXcrjo4kCm7Ke
	IC5H/enwst8LQhiBm+gp31PSXyjcb9WXM/g4MvBqsTt2m8+ATLryAZFwIgmSiZApgHnK
	3+WyCrQGuZUIiuDL6Z87Jpf+rKq8PaPfQ8pWtD15JPKHzeLMSW7aKaB7nPXeBstZtdYv
	GNbw==
X-Gm-Message-State: APzg51Dn3iAPAzNQzm/XbHh62fQg5xrseh5wmfXsN2dpRp0ZkmAOR/sx
	kj7Hyvul1Q9vWKSiqPVXjEvHOmqDXMAjgDtabIY=
X-Google-Smtp-Source: ANB0VdYI6oUikSpNnaVIqbNKHb7ucrs/DneSlP9hn59+g1JBXQzeGLfPnq2lyub8BaqKRFhjKrPvTYiZ8ZsD91ui0vE=
X-Received: by 2002:ac8:758d:: with SMTP id
	s13-v6mr9376975qtq.161.1535585539469; 
	Wed, 29 Aug 2018 16:32:19 -0700 (PDT)
MIME-Version: 1.0
References: <20180723231104.23011-1-alistair.francis@wdc.com>
	<CAMKF1sqs1Xtj6o=yReDTjg7qp=w68PBZRWOXOrWENS3fn+fgFg@mail.gmail.com>
	<CAKmqyKMnqrjf3-zLooNc2KcBpLhctLOufEDep0NnOCo6g_mJWg@mail.gmail.com>
In-Reply-To: <CAKmqyKMnqrjf3-zLooNc2KcBpLhctLOufEDep0NnOCo6g_mJWg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Aug 2018 16:31:53 -0700
Message-ID: <CAMKF1srJ3o0R0zaPZ4r_bLxcHdphoZumHEoPuAdtGbfWzh+a3A@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
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
X-List-Received-Date: Wed, 29 Aug 2018 23:32:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 29, 2018 at 3:47 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Fri, Aug 17, 2018 at 7:21 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > Hi Alistair
> >
> > We have accepted this patch however a new run with x86-64/musl shows
> > that it failed to build with following error
> > probably #include <sys/types.h> will fix it
>
> Hey Khem,
>
> Sorry for the delay, I tried to reproduce this today and I wasn't able
> to. I did see a different issue about missing systemd which I have a
> fix for though.
>

http://git.openembedded.org/meta-openembedded/commit/?id=1e6a27d8e226029689caa22a7cec10f8982ad180

fixed the issue.


> Alistair
>
> >
> >
> > | In file included from util/abspath.c:5:
> > | ./util/strbuf.h:68:45: error: unknown type name 'ssize_t'; did you
> > mean 'size_t'?
> > |  extern void strbuf_init(struct strbuf *buf, ssize_t hint);
> > |                                              ^~~~~~~
> > |                                              size_t
> > | ./util/strbuf.h:73:15: error: unknown type name 'ssize_t'
> > |  static inline ssize_t strbuf_avail(const struct strbuf *sb) {
> > |                ^~~~~~~
> > | ./util/strbuf.h:105:8: error: unknown type name 'ssize_t'
> > |  extern ssize_t strbuf_read(struct strbuf *, int fd, ssize_t hint);
> > |         ^~~~~~~
> > | ./util/strbuf.h:105:53: error: unknown type name 'ssize_t'; did you
> > mean 'size_t'?
> > |  extern ssize_t strbuf_read(struct strbuf *, int fd, ssize_t hint);
> > |                                                      ^~~~~~~
> > |                                                      size_t
> > | make[2]: *** [Makefile:678: util/abspath.o] Error 1
> >
> > On Mon, Jul 23, 2018 at 4:11 PM Alistair Francis
> > <alistair.francis@wdc.com> wrote:
> >>
> >> Add the NDCTL package (the libnvdimm utility library). This is based
> >> on the work from the meta-luv layer with a version bump.
> >>
> >> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> >> ---
> >> V2:
> >>  - Fix install failure
> >>
> >>  meta-oe/recipes-core/ndctl/ndctl_git.bb | 29 +++++++++++++++++++++++++
> >>  1 file changed, 29 insertions(+)
> >>  create mode 100644 meta-oe/recipes-core/ndctl/ndctl_git.bb
> >>
> >> diff --git a/meta-oe/recipes-core/ndctl/ndctl_git.bb b/meta-oe/recipes-core/ndctl/ndctl_git.bb
> >> new file mode 100644
> >> index 000000000..36f94ecfd
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-core/ndctl/ndctl_git.bb
> >> @@ -0,0 +1,29 @@
> >> +SUMMARY = "libnvdimm utility library"
> >> +DESCRIPTION = "Utility library for managing the libnvdimm \
> >> +(non-volatile memory device) sub-system in the Linux kernel. \
> >> +The LIBNVDIMM subsystem provides support for three types of \
> >> +NVDIMMs, namely,PMEM, BLK, and NVDIMM devices that can \
> >> +simultaneously support both PMEM and BLK mode access."
> >> +HOMEPAGE = "https://git.kernel.org/cgit/linux/kernel/git/nvdimm/nvdimm.git/tree/Documentation/nvdimm/nvdimm.txt?h=libnvdimm-for-next"
> >> +LICENSE = "GPLv2+"
> >> +LIC_FILES_CHKSUM = "file://COPYING;md5=e66651809cac5da60c8b80e9e4e79e08"
> >> +
> >> +inherit autotools-brokensep pkgconfig module-base
> >> +
> >> +SRCREV = "0d6aeeabec9d271e08c12e4cf679b59946e20156"
> >> +SRC_URI = "git://github.com/pmem/ndctl.git"
> >> +
> >> +DEPENDS = "virtual/kernel kmod udev json-c"
> >> +
> >> +PV = "v61+git${SRCPV}"
> >> +S = "${WORKDIR}/git"
> >> +
> >> +EXTRA_OECONF += "--enable-test --enable-destructive --disable-docs"
> >> +
> >> +do_configure_prepend() {
> >> +    ${S}/autogen.sh
> >> +}
> >> +
> >> +COMPATIBLE_HOST='(x86_64).*'
> >> +
> >> +FILES_${PN} += "/usr/share/bash-completion/completions/ndctl"
> >> --
> >> 2.17.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

