Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 162E8615EE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 04:39:18 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id y6so1216426lbh.35
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Sep 2013 21:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=UUhYNO4JtjTGCOcGdRuIn/XjCpK3HG5RM2+C+L8QZ9A=;
	b=EYjQ4lVMQ5Sfe6ItQv9WdzV1YosnohrP7nxV0HLiqq8rO8yoIx1c6TL33MOTsM4asm
	MVAEnAd8oD0YJkZLCkZww1t4aRdOuwXWOYvxP6SChZmEMaIQ3zcxeXo1r83hcCAnUzqc
	KyKugU3FjAek/lO1kLBCDhB5j6dxxq9VLTF4VfCV8a5b2EWMqc8JgchcP1dpbzBGzfX2
	NABL/nm/l0AX5VWMQD4WUPPpda5AOEG12uHymI0c/PcXRoRtm38TWD4ZABciOUQUoy5N
	V0lTgNoVQ4YDyfv1r+3aPdtlng7z3dVHcSTpYtN+y0/drm2lTNKi4uMqmk84SwII1hJY
	mDeg==
MIME-Version: 1.0
X-Received: by 10.112.156.166 with SMTP id wf6mr5399736lbb.13.1378355960050;
	Wed, 04 Sep 2013 21:39:20 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Wed, 4 Sep 2013 21:39:19 -0700 (PDT)
In-Reply-To: <20130904211411.GR3761@deserted.net>
References: <1378110051-8976-1-git-send-email-lpapp@kde.org>
	<20130904211411.GR3761@deserted.net>
Date: Thu, 5 Sep 2013 00:39:19 -0400
Message-ID: <CADkTA4PbVB2X9abGFMKsAt6NRaZxnZa1GK86e3L+=CGzNfswdA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] openflow: Add latest from git
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
X-List-Received-Date: Thu, 05 Sep 2013 04:39:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Sep 4, 2013 at 5:14 PM, Joe MacDonald <joe@deserted.net> wrote:
> Actually, after all of that, I do have a couple of additional requests
> (beyond just the tweak to the commit log).
>
>    Explicitly cc:ing Bruce here since I'm intentionally not adding
>    meta-virt@.  I've gotten bounced from it in the past as I'm not a
>    subscriber and it's subscriber-only.

:) I can't blame you for that, I share the pain (after bouncing off of oe-devel
just a few days ago myself). Thanks for the cc.

>
> [[oe] [meta-networking][PATCH] openflow: Add latest from git] On 13.09.02 (Mon 09:20) Laszlo Papp wrote:
>
>> 1) The version in meta-virtualization is quite old. It is basically from 2009,
>> and a lot of things has changed since then.
>>
>> 2) More importantly, this software is more like for networking rather than
>> virtualization, so I think it was misplaced.
>
> SOB please?
>
>> ---
>>  .../recipes-support/openflow/openflow_1.0.bb       | 32 ++++++++++++++++++++++
>
> Is this actually based on an OpenFlow 1.0 release, or has it always been
> 1.0+git?  I don't have a copy of meta-virt around to check myself.  If
> there was a real 1.0 recipe around, can we keep it as is and make this
> openflow_git.bb, more in line with the other +git... recipes?

The meta-virt recipe had the same _1.0.bb extension, and it's SRCREV lines up
with the openflow-1.0.0 tag in the repository:

--------

commit 5ccca75a69f99791659bcfbcf35353ab1921320a
Author: Glen Gibb <grg@stanford.edu>
Date:   Thu Dec 31 16:00:53 2009 -0800

    docs: Update ChangeLog to include 1.0.0 information

:100644 100644 2f13dd7... aa0e92e... M  ChangeLog

-------

So it's definitely an option to keep that recipe around as the tagged 1.0, and
create a _git that tracks newer changes (where "newer" is relative, 2011 is
the latest commit in that repo).

Maybe someday, we'll get a working 1.x openflow to play with! :)

Thanks for holding on this briefly, it did help.

Bruce

>
>>  1 file changed, 32 insertions(+)
>>  create mode 100644 meta-networking/recipes-support/openflow/openflow_1.0.bb
>>
>> diff --git a/meta-networking/recipes-support/openflow/openflow_1.0.bb b/meta-networking/recipes-support/openflow/openflow_1.0.bb
>> new file mode 100644
>> index 0000000..eb7770e
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/openflow/openflow_1.0.bb
>> @@ -0,0 +1,32 @@
>> +SUMMARY = "OpenFlow"
>> +DESCRIPTION = "Open standard that enables researchers to run experimental protocols in the campus networks"
>> +HOMEPAGE = "http://www.openflow.org"
>> +SECTION = "networking"
>> +LICENSE = "GPLv2"
>> +
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=e870c934e2c3d6ccf085fd7cf0a1e2e2"
>> +
>> +SRCREV = "c84f33f09d5dbcfc9b489f64cb30475bf36f653a"
>> +PV = "1.0+git${SRCPV}"
>> +SRC_URI = "git://gitosis.stanford.edu/openflow.git;protocol=git"
>> +
>> +DEPENDS = "virtual/libc"
>> +
>> +EXTRA_OECONF += "KARCH=${TARGET_ARCH}"
>> +
>> +PACKAGECONFIG ??= "libssl"
>> +PACKAGECONFIG[libssl] = "--enable-ssl,--disable-ssl, openssl, libssl"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +inherit autotools
>> +
>> +do_configure() {
>> +    ./boot.sh
>> +    oe_runconf
>> +}
>> +
>> +do_install_append() {
>> +     # Remove /var/run as it is created on startup
>> +    rm -rf ${D}${localstatedir}/run
>> +}
>
> And while we're in the neighbourhood, can we also clean up the
> inconsistent spacing?
>
> Thanks.
>
> --
> -Joe MacDonald.
> :wq
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

