Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id EFD796028A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Mar 2014 18:40:29 +0000 (UTC)
Received: by mail-yk0-f174.google.com with SMTP id 20so4851276yks.19
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Mar 2014 11:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=YaJwBvyfoneopu+syu6MdnpSkJEgoV5WKFMVqDMsOpU=;
	b=FXP6J5cR1+S8lvqn1rcYr2mqbm+SQiTMhpVwjUu3i0RG4X8I9pKGFdOSirtUZVliXt
	ZNLhpKxAR/4e4ma4wMNZuc2ouPzDk0RziDFaUgRU8nn4/2d8JzN3JtEjJypED3Gt6bhS
	fn3tCThf3ePNxrACbav+0D60jcIkm0m7voR7mf3FRFuFZit0mWW5eRr9qOb1xP3HH+93
	vE7/30A7E3nTbZLjxZ8lZwWBA7FAB8Qw6lAlxGiBxmXG17fxnKZS8DHyMwFQ6vYGcvMy
	8qmx7uTIQXhBEq+CKZgnZO6LhA63z1y5CGtMvRwmeDcoITLOVmCFoH75pW9zjUZ8oEsg
	zcaA==
MIME-Version: 1.0
X-Received: by 10.236.96.201 with SMTP id r49mr22338725yhf.33.1396118430277;
	Sat, 29 Mar 2014 11:40:30 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Sat, 29 Mar 2014 11:40:30 -0700 (PDT)
In-Reply-To: <20140328180000.GM3370@denix.org>
References: <lauren.post@freescale.com>
	<1394227575-27897-1-git-send-email-lauren.post@freescale.com>
	<20140328180000.GM3370@denix.org>
Date: Sat, 29 Mar 2014 15:40:30 -0300
X-Google-Sender-Auth: PhaAVanNtuQRwoTAxfXsw1j08us
Message-ID: <CAP9ODKoM+pLGvXT6EkboDjSwcPhWqERCq86eznqZP5yvf1k7qg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/7] linuxptp: Create 1.4 version
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
X-List-Received-Date: Sat, 29 Mar 2014 18:40:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Denys,

On Fri, Mar 28, 2014 at 3:00 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Fri, Mar 07, 2014 at 03:26:09PM -0600, Lauren Post wrote:
>> Precision Time Protocol (PTP) according to IEEE standard 1588
>
> Heh, another instance of "duplication" - I also have a similar recipe in my
> layer... Well, I do understand that "the early bird gets the worm" or the
> first submitter gets his change merged, but let me point out few issues:

This is the price of 'late upstreaming' :-(

>> Signed-off-by: Lauren Post <lauren.post@freescale.com>
>> ---
>>  .../recipes-connectivity/linuxptp/linuxptp_1.4.bb  |   26 ++++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>  create mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp_1.4.bb
>>
>> diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_1.4.bb b/meta-oe/recipes-connectivity/linuxptp/linuxptp_1.4.bb
>> new file mode 100644
>> index 0000000..c708b13
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_1.4.bb
>> @@ -0,0 +1,26 @@
>> +DESCRIPTION = "Precision Time Protocol (PTP) according to IEEE standard 1588 for Linux"
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>> +
>> +DEPENDS = "virtual/kernel"
>> +
>> +SRC_URI = "http://sourceforge.net/projects/linuxptp/files/v${PV}/linuxptp-${PV}.tgz"
>> +
>> +SRC_URI[md5sum] = "a37ad2b2ef7d1ebc4d64a66d3fe55cdf"
>> +SRC_URI[sha256sum] = "6cfd5291fb7394cc9f25458927874a203971b66b76d1c9d6568e007d0cbd81f2"
>> +
>> +inherit autotools pkgconfig
>
> It's easy to see that linuxptp build doesn't really use autotools or pkgconfig

What you suggest here?

>> +EXTRA_OEMAKE = 'KBUILD_OUTPUT="${STAGING_KERNEL_DIR}" CROSS_COMPILE="${TARGET_PREFIX}"'
>> +
>> +do_configure_append () {
>> +    find ${S} -name makefile | xargs sed -i 's,^\(CC\|CFLAGS\|prefix\|AR\)=,\1 ?=,g'
>
> Why do you need to mangle the makefile? Passing CROSS_COMPILE and maybe ARCH
> should be enough, isn't it?

In fact I guess we do. Otherwise the build system won't use the build
flags we expect, will it?

>> +}
>> +
>> +do_install () {
>> +    install -d ${D}/${bindir}
>> +    install -p ${S}/ptp4l  ${D}/${bindir}
>> +    install -p ${S}/pmc  ${D}/${bindir}
>> +    install -p ${S}/phc2sys  ${D}/${bindir}
>> +    install -p ${S}/hwstamp_ctl  ${D}/${bindir}
>> +}
>
> And the last bit about dependency on virtual/kernel above and passing
> KBUILD_OUTPUT=STAGING_KERNEL_DIR to the build - I have looked into what that
> does and it tries to locate the correct /usr/include/linux/net_tstamp.h just
> to see if it contains definition for HWTSTAMP_TX_ONESTEP_SYNC. But that header
> file hasn't changed in at least 5 years. Anyway, the result of the check is to
> pass some defines to their build. I ended up just short-cutting the check and
> avoid unnecessary dependency on virtual/kernel:

Oh good hint here. This is indeed a nice boost in build and avoids
rebuild when kernel changes.

Could you share this change?

> EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} ARCH=${TARGET_ARCH} \
>                 EXTRA_CFLAGS='-D_GNU_SOURCE -DHAVE_CLOCK_ADJTIME \
>                 -DHAVE_ONESTEP_SYNC'"
>
> Should I submit a patch to fix the above issues?

This is up to Lauren ... I am fine either way ...

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

