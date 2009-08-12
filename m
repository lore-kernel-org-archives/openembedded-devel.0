Received: from [209.85.218.221] (helo=mail-bw0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MbAB0-00012f-6j
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Aug 2009 11:31:22 +0200
Received: by bwz21 with SMTP id 21so3401248bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2009 02:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=czu7TPJ51gTC+R7Hljx4eSw4OEn7tSHfnup7SoHAo0o=;
	b=dkB+tZQiZKj1w6hWm8QGc9RpuUNRVy0CM8YY4JqxCyvRO4dBiwO+QEgjJUlRydht7C
	woQ4qdgBtutYnr1T2yZR6+Vy/LWgc+Y5RPdRz4tSynASVYS6unsAF8HPT9EdJtY2JF7F
	xkGCyQELeQ8nRBeuPWbECyro3WjemURmjelHs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=b1Ubm/wieB9Pq/sopNnXBZOK/GF94iLeDDFBswUcOOLZRaTC6/o4EwRflU6rwO4Mod
	79Id9vokFNPEgySVV2X3CK41tu0EFNN0QlmJcuSgoit3Rol5oDLm+thZOyOpUWs602bO
	UFeULVPUF/feRJp/Armw5unndm05Fzy/+d08o=
MIME-Version: 1.0
Received: by 10.103.161.16 with SMTP id n16mr2669717muo.44.1250068496554; Wed, 
	12 Aug 2009 02:14:56 -0700 (PDT)
In-Reply-To: <4A828368.5030100@atmel.com>
References: <4A828368.5030100@atmel.com>
Date: Wed, 12 Aug 2009 12:14:56 +0300
Message-ID: <fce2a370908120214o3b6893b0lfc515b0874f5afd3@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: U-Boot not copied into tmp/deploy/glibc/<board>
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Aug 2009 09:31:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2009 at 11:55 AM, Ulf
Samuelsson<ulf.samuelsson@atmel.com> wrote:
> Right now, u-boot is built in my private git tree,
> when I do bitbake x11-gpe-image,
>
> It is not copied to tmp/deploy/glibc/<board>
>
> If I do
> bitbake u-boot, the stuff IS copied.
>
> Anyone can think of a reason for this problem?
>
> I have modified the git tree since the first build
> to fix some problems. Can old junk be the trouble?

I've seen the behaviour yesterday on my tree.

>
> Result of latest bitbake x11-gpe-image
>
> Start building x11-gpe-image at 10:41:27
> /home/ulf/projects/OE_atmel/bitbake/lib/bb/COW.py:29:
> DeprecationWarning: the sets module is deprecated
> =C2=A0import types, sets
> /home/ulf/projects/OE_atmel/bitbake/lib/bb/COW.py:29:
> DeprecationWarning: the sets module is deprecated
> =C2=A0import types, sets
> NOTE: Out of date cache found, rebuilding...
> NOTE: Handling BitBake files: - (4956/7055) [70 %]NOTE: Angstrom DOES
> NOT support bluez-utils because bluez-utils 3.x has been replaced by blue=
z4
> NOTE: Angstrom DOES NOT support bluez-utils because bluez-utils 3.x has
> been replaced by bluez4
> NOTE: Handling BitBake files: \ (4960/7055) [70 %]NOTE: Angstrom DOES
> NOT support bluez-libs because bluez-libs 3.x has been replaced by bluez4
> NOTE: Handling BitBake files: - (4969/7055) [70 %]NOTE: Angstrom DOES
> NOT support bluez-libs because bluez-libs 3.x has been replaced by bluez4
> NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3.x has
> been replaced by bluez4
> NOTE: Handling BitBake files: | (7055/7055) [100 %]
> NOTE: Parsing finished. 0 cached, 6766 parsed, 289 skipped, 0 masked.
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing runqueue
> NOTE: Running task 2549 of 5150 (ID: 414,
> /home/ulf/projects/OE_atmel/openembedded/recipes/angstrom/angstrom-versio=
n.bb,
> do_setscene)
> staging-angstrom-version-at91sam9263ek-angstrom-linux-gnueabi -
> 2009.X-test-20090811-r2 -
> NOTE: Running task 3032 of 5150 (ID: 110,
> /home/ulf/projects/OE_atmel/openembedded/recipes/u-boot/u-boot_2009.08-rc=
2.bb,
> do_setscene)
> Removing package
> staging-angstrom-version-at91sam9263ek-angstrom-linux-gnueabi from root..=
.
> staging-u-boot-at91sam9263ek-angstrom-linux-gnueabi - 2009.08-rc2-r0 -
> Removing package staging-u-boot-at91sam9263ek-angstrom-linux-gnueabi
> from root...
> NOTE: Running task 5117 of 5150 (ID: 415,
> /home/ulf/projects/OE_atmel/openembedded/recipes/angstrom/angstrom-versio=
n.bb,
> do_fetch)
> NOTE: Running task 5118 of 5150 (ID: 111,
> /home/ulf/projects/OE_atmel/openembedded/recipes/u-boot/u-boot_2009.08-rc=
2.bb,
> do_fetch)
> NOTE: Running task 5119 of 5150 (ID: 416,
> /home/ulf/projects/OE_atmel/openembedded/recipes/angstrom/angstrom-versio=
n.bb,
> do_unpack)
> NOTE: Unpacking ../openembedded/recipes/angstrom/angstrom-version.bb to
> tmp/work/at91sam9263ek-angstrom-linux-gnueabi/angstrom-version-1_2009.X-t=
est-20090812-r2/
> NOTE: Running task 5120 of 5150 (ID: 112,
> /home/ulf/projects/OE_atmel/openembedded/recipes/u-boot/u-boot_2009.08-rc=
2.bb,
> do_unpack)
> NOTE: Unpacking /home/downloads/u-boot-2009.08-rc2.tar.bz2 to
> tmp/work/at91sam9263ek-angstrom-linux-gnueabi/u-boot-2009.08-rc2-r1/
> NOTE: Running task 5121 of 5150 (ID: 417,
> /home/ulf/projects/OE_atmel/openembedded/recipes/angstrom/angstrom-versio=
n.bb,
> do_patch)
> NOTE: Running task 5122 of 5150 (ID: 418,
> /home/ulf/projects/OE_atmel/openembedded/recipes/angstrom/angstrom-versio=
n.bb,
> do_configure)
> NOTE: Running task 5123 of 5150 (ID: 419,
> /home/ulf/projects/OE_atmel/openembedded/recipes/angstrom/angstrom-versio=
n.bb,
> do_qa_configure)
> NOTE: Running task 5124 of 5150 (ID: 420,
> /home/ulf/projects/OE_atmel/openembedded/recipes/angstrom/angstrom-versio=
n.bb,
> do_compile)
> NOTE: Running task 5125 of 5150 (ID: 421,
> /home/ulf/projects/OE_atmel/openembedded/recipes/angstrom/angstrom-versio=
n.bb,
> do_install)
> NOTE: Running task 5126 of 5150 (ID: 424,
> /home/ulf/projects/OE_atmel/openembedded/recipes/angstrom/angstrom-versio=
n.bb,
> do_package)
> NOTE: Running task 5127 of 5150 (ID: 422,
> /home/ulf/projects/OE_atmel/openembedded/recipes/angstrom/angstrom-versio=
n.bb,
> do_populate_staging)
> NOTE: Running task 5128 of 5150 (ID: 113,
> /home/ulf/projects/OE_atmel/openembedded/recipes/u-boot/u-boot_2009.08-rc=
2.bb,
> do_patch)
> NOTE: Applying patch 'u-boot-2009.08-rc1-001-nosoftfloat.patch'
> (../openembedded/recipes/u-boot/u-boot-2009.08-rc2/u-boot-2009.08-rc1-001=
-nosoftfloat.patch)
> NOTE: Applying patch 'u-boot-2009.08-rc1-007-tools.patch'
> (../openembedded/recipes/u-boot/u-boot-2009.08-rc2/u-boot-2009.08-rc1-007=
-tools.patch)
> NOTE: Applying patch 'u-boot-2009.08-rc1-008-Makefile.patch'
> (../openembedded/recipes/u-boot/u-boot-2009.08-rc2/u-boot-2009.08-rc1-008=
-Makefile.patch)
> NOTE: Applying patch 'u-boot-2009.08-rc1-009-factory.patch'
> (../openembedded/recipes/u-boot/u-boot-2009.08-rc2/u-boot-2009.08-rc1-009=
-factory.patch)
> NOTE: Applying patch 'u-boot-2009.08-rc1-010-coloured_led.patch'
> (../openembedded/recipes/u-boot/u-boot-2009.08-rc2/u-boot-2009.08-rc1-010=
-coloured_led.patch)
> NOTE: Applying patch 'u-boot-2009.08-rc1-012-ethinit.patch'
> (../openembedded/recipes/u-boot/u-boot-2009.08-rc2/u-boot-2009.08-rc1-012=
-ethinit.patch)
> NOTE: Applying patch 'u-boot-2009.08-rc1-013-configs.patch'
> (../openembedded/recipes/u-boot/u-boot-2009.08-rc2/u-boot-2009.08-rc1-013=
-configs.patch)
> NOTE: Applying patch 'u-boot-2009.08-rc1-014-no-weak-inlines.patch'
> (../openembedded/recipes/u-boot/u-boot-2009.08-rc2/u-boot-2009.08-rc1-014=
-no-weak-inlines.patch)
> NOTE: Applying patch 'u-boot-2009.08-rc1-015-large-u-boot.patch'
> (../openembedded/recipes/u-boot/u-boot-2009.08-rc2/u-boot-2009.08-rc1-015=
-large-u-boot.patch)
> NOTE: Applying patch 'u-boot-2009.08-rc1-add-raise.patch'
> (../openembedded/recipes/u-boot/u-boot-2009.08-rc2/u-boot-2009.08-rc1-add=
-raise.patch)
> NOTE: Applying patch 'u-boot-2009.08-rc1-eabi.patch'
> (../openembedded/recipes/u-boot/u-boot-2009.08-rc2/u-boot-2009.08-rc1-eab=
i.patch)
> NOTE: Running task 5129 of 5150 (ID: 114,
> /home/ulf/projects/OE_atmel/openembedded/recipes/u-boot/u-boot_2009.08-rc=
2.bb,
> do_configure)
> NOTE: Running task 5130 of 5150 (ID: 115,
> /home/ulf/projects/OE_atmel/openembedded/recipes/u-boot/u-boot_2009.08-rc=
2.bb,
> do_qa_configure)
> NOTE: Running task 5131 of 5150 (ID: 116,
> /home/ulf/projects/OE_atmel/openembedded/recipes/u-boot/u-boot_2009.08-rc=
2.bb,
> do_compile)
> NOTE: Running task 5134 of 5150 (ID: 426,
> /home/ulf/projects/OE_atmel/openembedded/recipes/angstrom/angstrom-versio=
n.bb,
> do_package_write_ipk)
> Packaged contents of angstrom-version into
> /home/ulf/projects/OE_atmel/build-sam9263ek/tmp/deploy/glibc/ipk/at91sam9=
263ek/angstrom-version_2009.X-test-20090812-r2.3_at91sam9263ek.ipk
> NOTE: Running task 5139 of 5150 (ID: 423,
> /home/ulf/projects/OE_atmel/openembedded/recipes/angstrom/angstrom-versio=
n.bb,
> do_package_write)
> NOTE: Running task 5140 of 5150 (ID: 425,
> /home/ulf/projects/OE_atmel/openembedded/recipes/angstrom/angstrom-versio=
n.bb,
> do_package_stage)
> NOTE: Running task 5141 of 5150 (ID: 117,
> /home/ulf/projects/OE_atmel/openembedded/recipes/u-boot/u-boot_2009.08-rc=
2.bb,
> do_install)
> NOTE: Running task 5142 of 5150 (ID: 120,
> /home/ulf/projects/OE_atmel/openembedded/recipes/u-boot/u-boot_2009.08-rc=
2.bb,
> do_package)
> NOTE: Running task 5143 of 5150 (ID: 118,
> /home/ulf/projects/OE_atmel/openembedded/recipes/u-boot/u-boot_2009.08-rc=
2.bb,
> do_populate_staging)
> NOTE: Running task 5144 of 5150 (ID: 122,
> /home/ulf/projects/OE_atmel/openembedded/recipes/u-boot/u-boot_2009.08-rc=
2.bb,
> do_package_write_ipk)
> Packaged contents of u-boot-dbg into
> /home/ulf/projects/OE_atmel/build-sam9263ek/tmp/deploy/glibc/ipk/at91sam9=
263ek/u-boot-dbg_2009.08-rc2-r1.3_at91sam9263ek.ipk
> NOTE: Not creating empty archive for u-boot-2009.08-rc2-r1.3
> NOTE: Not creating empty archive for u-boot-doc-2009.08-rc2-r1.3
> Packaged contents of u-boot-dev into
> /home/ulf/projects/OE_atmel/build-sam9263ek/tmp/deploy/glibc/ipk/at91sam9=
263ek/u-boot-dev_2009.08-rc2-r1.3_at91sam9263ek.ipk
> NOTE: Not creating empty archive for u-boot-locale-2009.08-rc2-r1.3
> NOTE: Running task 5145 of 5150 (ID: 119,
> /home/ulf/projects/OE_atmel/openembedded/recipes/u-boot/u-boot_2009.08-rc=
2.bb,
> do_package_write)
> NOTE: Running task 5146 of 5150 (ID: 18,
> /home/ulf/projects/OE_atmel/openembedded/recipes/images/x11-gpe-image.bb,
> do_package_update_index_ipk)
> NOTE: Running task 5147 of 5150 (ID: 121,
> /home/ulf/projects/OE_atmel/openembedded/recipes/u-boot/u-boot_2009.08-rc=
2.bb,
> do_package_stage)
> NOTE: Running task 5149 of 5150 (ID: 10,
> /home/ulf/projects/OE_atmel/openembedded/recipes/images/x11-gpe-image.bb,
> do_rootfs)
> NOTE: Running task 5150 of 5150 (ID: 0,
> /home/ulf/projects/OE_atmel/openembedded/recipes/images/x11-gpe-image.bb,
> do_build)
> NOTE: Tasks Summary: Attempted 5150 tasks of which 5121 didn't need to
> be rerun and 0 failed.
> .............................................
>
>
>
>
>
> ulf@grond:~/projects/OE_atmel/build-sam9263ek> bitbake u-boot
> /home/ulf/projects/OE_atmel/bitbake/lib/bb/COW.py:29:
> DeprecationWarning: the sets module is deprecated
> =C2=A0import types, sets
> /home/ulf/projects/OE_atmel/bitbake/lib/bb/COW.py:29:
> DeprecationWarning: the sets module is deprecated
> =C2=A0import types, sets
> NOTE: Handling BitBake files: | (7055/7055) [100 %]
> NOTE: Parsing finished. 6766 cached, 0 parsed, 289 skipped, 0 masked.
> NOTE: Cache is clean, not saving.
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing runqueue
> NOTE: Running task 445 of 449 (ID: 15,
> /home/ulf/projects/OE_atmel/openembedded/recipes/u-boot/u-boot_2009.08-rc=
2.bb,
> do_package_stage_all)
> NOTE: Running task 446 of 449 (ID: 14,
> /home/ulf/projects/OE_atmel/openembedded/recipes/u-boot/u-boot_2009.08-rc=
2.bb,
> do_distribute_sources)
> NOTE: Running task 447 of 449 (ID: 11,
> /home/ulf/projects/OE_atmel/openembedded/recipes/u-boot/u-boot_2009.08-rc=
2.bb,
> do_qa_staging)
> NOTE: Running task 448 of 449 (ID: 10,
> /home/ulf/projects/OE_atmel/openembedded/recipes/u-boot/u-boot_2009.08-rc=
2.bb,
> do_deploy)
> NOTE: Running task 449 of 449 (ID: 0,
> /home/ulf/projects/OE_atmel/openembedded/recipes/u-boot/u-boot_2009.08-rc=
2.bb,
> do_build)
> NOTE: Tasks Summary: Attempted 449 tasks of which 444 didn't need to be
> rerun and 0 failed.
>
>
> --
> Best Regards
> Ulf Samuelsson
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


