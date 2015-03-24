Return-Path: <rapphil@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4126A6AC43;
	Tue, 24 Mar 2015 11:54:57 +0000 (UTC)
Received: by qgez102 with SMTP id z102so102400569qge.3;
	Tue, 24 Mar 2015 04:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=uX7NQFSsptlulaLKxHTHz4btCbb2P8mmtu48a7q1Qew=;
	b=wdwiNYI9m94K4WSnv4dULhrtuWDTK7W154K/D+5L4koQLdMT12M9c0GEXllCaTaTbh
	jfBxDQwLIipg5z/vp8GqewP3/94QRZ+ZLoG9V/nbsqf4D4We5vdlyVH+BbeFpMRl7RVk
	IJefP7lijsJcjnb6dF7fXtCRrtshK2+26gisXK0fYNyigEBp3VO+BejOz6Kn0Q062wVS
	7N6lxN6kkYc3shFxXecPcBatJ+BHJayKqg9TXGDZkXmqQRG33Yl+qEwqe4lAnL5CLX9a
	dczQK3POPyg3l3iNfUkj0R7pBBwbgj2lEJBz+YRYIOjmdEdogdi5JR9njXfiHH3jj5LC
	LDfg==
MIME-Version: 1.0
X-Received: by 10.229.214.199 with SMTP id hb7mr5272231qcb.12.1427198098733;
	Tue, 24 Mar 2015 04:54:58 -0700 (PDT)
Received: by 10.140.142.200 with HTTP; Tue, 24 Mar 2015 04:54:58 -0700 (PDT)
In-Reply-To: <20150324010258.GG3904@jama>
References: <20150303074258.E353A50433@opal.openembedded.org>
	<20150321153142.GJ4738@jama>
	<CAENGNheZZ67eAKA1O58kj7ztXG3Sv8tBagvOnLQJDx77=S1ouw@mail.gmail.com>
	<20150324010258.GG3904@jama>
Date: Tue, 24 Mar 2015 08:54:58 -0300
Message-ID: <CAENGNhfZJxWeQcsugydhrrALrzM0L6XT0u7gEjXFQOfy2HYT+w@mail.gmail.com>
From: Raphael Philipe <rapphil@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	Raphael Silva <raphael.philipe@ossystems.com.br>
Subject: Re: [oe-commits] Raphael Silva : fio: fix do_compile error
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
X-List-Received-Date: Tue, 24 Mar 2015 11:55:00 -0000
Content-Type: text/plain; charset=UTF-8

Now I can see it!

Thank you. I will provide a patch for this soon.

Regards,

On Mon, Mar 23, 2015 at 10:02 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Mar 23, 2015 at 09:56:29PM -0300, Raphael Philipe wrote:
>> Hi Martin,
>>
>> I'm sorry, but I wasn't able to reproduce this problem. Could you
>> please give more details on how you setup your build?
>
> Have you tried to build numactl before rebuilding fio?
> meta-oe/recipes-support/numactl/numactl_2.0.9.bb
>
> bitbake numactl
> bitbake -c cleansstate fio
> bitbake fio
>
> should show the error
>
>>
>> Regards,
>>
>> On Sat, Mar 21, 2015 at 12:31 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > On Tue, Mar 03, 2015 at 07:42:58AM +0000, git@git.openembedded.org wrote:
>> >> Module: meta-openembedded.git
>> >> Branch: master
>> >> Commit: 9b35e07cabaf3ed9bd681423a758b9c0dc3945af
>> >> URL:    http://git.openembedded.org/?p=meta-openembedded.git&a=commit;h=9b35e07cabaf3ed9bd681423a758b9c0dc3945af
>> >>
>> >> Author: Raphael Silva <rapphil@gmail.com>
>> >> Date:   Sat Feb 28 20:15:16 2015 -0300
>> >>
>> >> fio: fix do_compile error
>> >>
>> >> * Update to v2.2.6
>> >
>> > Please fix these issues:
>> > fio-2.2.6: fio rdepends on numactl, but it isn't a build dependency? [build-deps]
>> > fio-2.2.6: fio rdepends on zlib, but it isn't a build dependency? [build-deps]
>> >>
>> >> Signed-off-by: Raphael Silva <raphael.philipe@ossystems.com.br>
>> >> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> >>
>> >> ---
>> >>
>> >>  ...eric-assembly-nop-and-barrier-code-for-ar.patch | 30 ----------------------
>> >>  .../fio/{fio_2.0.5.bb => fio_2.2.6.bb}             | 11 ++++----
>> >>  2 files changed, 5 insertions(+), 36 deletions(-)
>> >>
>> >> diff --git a/meta-oe/recipes-benchmark/fio/fio/0001-ARM-Use-generic-assembly-nop-and-barrier-code-for-ar.patch b/meta-oe/recipes-benchmark/fio/fio/0001-ARM-Use-generic-assembly-nop-and-barrier-code-for-ar.patch
>> >> deleted file mode 100644
>> >> index db97244..0000000
>> >> --- a/meta-oe/recipes-benchmark/fio/fio/0001-ARM-Use-generic-assembly-nop-and-barrier-code-for-ar.patch
>> >> +++ /dev/null
>> >> @@ -1,30 +0,0 @@
>> >> -From 152b969cd4ff5b4b7e1c65eca1f9ab243b8a30c8 Mon Sep 17 00:00:00 2001
>> >> -From: Otavio Salvador <otavio@ossystems.com.br>
>> >> -Date: Sun, 14 Apr 2013 13:53:35 -0300
>> >> -Subject: [PATCH] ARM: Use generic assembly nop and barrier code for armv6
>> >> -
>> >> -Upstream-Status: Submitted
>> >> -
>> >> -Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> >> ----
>> >> - arch/arch-arm.h |    4 +++-
>> >> - 1 files changed, 3 insertions(+), 1 deletions(-)
>> >> -
>> >> -diff --git a/arch/arch-arm.h b/arch/arch-arm.h
>> >> -index 658b688..7cd9502 100644
>> >> ---- a/arch/arch-arm.h
>> >> -+++ b/arch/arch-arm.h
>> >> -@@ -18,7 +18,9 @@
>> >> - #define __NR_sys_vmsplice   343
>> >> - #endif
>> >> -
>> >> --#if defined (__ARM_ARCH_4__) || defined (__ARM_ARCH_4T__) || defined (__ARM_ARCH_5__) || defined (__ARM_ARCH_5T__) || defined (__ARM_ARCH_5TE__) || defined (__ARM_ARCH_5TEJ__)
>> >> -+#if defined (__ARM_ARCH_4__) || defined (__ARM_ARCH_4T__) \
>> >> -+    || defined (__ARM_ARCH_5__) || defined (__ARM_ARCH_5T__) || defined (__ARM_ARCH_5TE__) || defined (__ARM_ARCH_5TEJ__) \
>> >> -+    || defined(__ARM_ARCH_6__)  || defined(__ARM_ARCH_6J__) || defined(__ARM_ARCH_6Z__) || defined(__ARM_ARCH_6ZK__)
>> >> - #define nop             __asm__ __volatile__("mov\tr0,r0\t@ nop\n\t")
>> >> - #define read_barrier()      __asm__ __volatile__ ("" : : : "memory")
>> >> - #define write_barrier()     __asm__ __volatile__ ("" : : : "memory")
>> >> ---
>> >> -1.7.2.5
>> >> -
>> >> diff --git a/meta-oe/recipes-benchmark/fio/fio_2.0.5.bb b/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
>> >> similarity index 72%
>> >> rename from meta-oe/recipes-benchmark/fio/fio_2.0.5.bb
>> >> rename to meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
>> >> index 8dcf637..016b1f2 100644
>> >> --- a/meta-oe/recipes-benchmark/fio/fio_2.0.5.bb
>> >> +++ b/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
>> >> @@ -12,17 +12,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
>> >>
>> >>  DEPENDS = "libaio"
>> >>
>> >> -# rev for v2.0.5
>> >> -SRCREV = "02efadeb8b05144bcf2fc7796e1da2e7db211d00"
>> >> -SRC_URI = "git://git.kernel.dk/fio.git \
>> >> -           file://0001-ARM-Use-generic-assembly-nop-and-barrier-code-for-ar.patch"
>> >> +# rev for v2.2.6
>> >> +SRCREV = "f52c9691bc8c285f3445235c69acdfd6de7f9b82"
>> >> +SRC_URI = "git://git.kernel.dk/fio.git"
>> >>
>> >>  S = "${WORKDIR}/git"
>> >>
>> >> -EXTRA_OEMAKE = "CC='${CC}' CFLAGS='${CFLAGS}' LDFLAGS='${LDFLAGS}'"
>> >> +EXTRA_OEMAKE = "CC='${CC}' LDFLAGS='${LDFLAGS}'"
>> >>
>> >>  do_install() {
>> >> -    oe_runmake install DESTDIR=${D} bindir=${bindir} mandir=${mandir}
>> >> +    oe_runmake install DESTDIR=${D} prefix=${prefix} mandir=${mandir}
>> >>      install -d ${D}/${docdir}/${PN}
>> >>      cp -a ${S}/examples ${D}/${docdir}/${PN}/
>> >>  }
>> >>
>> >> --
>> >> _______________________________________________
>> >> Openembedded-commits mailing list
>> >> Openembedded-commits@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>> >
>> > --
>> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

