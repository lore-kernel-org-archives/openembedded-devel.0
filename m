Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T2K28-00019U-H7
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Aug 2012 12:44:04 +0200
Received: from localhost ([127.0.0.1]:60332 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T2JqY-0005D5-7y
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Aug 2012 10:32:06 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=dQ1iHZdCEvYi7JtX0WX/x65wRSs=; b=k+2gVw1LB98IMmq6PRgcTlbFdxRI
	+9t0+hfEfe1n6uX17iEVO77WhI2PrFvjPWRIXhnbj637LlBl5VTDg94tY7UHS/bm
	L2n2K92Tg3dLyTnswgxIlOW9Lc9COVZgkexy/tuH8YxVRyWCMj0cjPDNZvYx0p0u
	h5xbbQNG14zvvJY=
Received: from [195.171.99.130] (port=2022 helo=[192.168.0.47])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T2JqY-0005D2-4H
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Aug 2012 10:32:06 +0000
Message-ID: <502E1DF9.9070101@communistcode.co.uk>
Date: Fri, 17 Aug 2012 11:33:29 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAMKF1srjqDsesRcWP7oGzouPj9aOt_Ln0aOWE9cEQwpUQ7Unuw@mail.gmail.com>
In-Reply-To: <CAMKF1srjqDsesRcWP7oGzouPj9aOt_Ln0aOWE9cEQwpUQ7Unuw@mail.gmail.com>
Subject: Re: Toolchain rework, call for testing
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
X-List-Received-Date: Fri, 17 Aug 2012 10:44:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 17/08/12 05:47, Khem Raj wrote:
> Hi All
>
> Recently glibc build has been simplified upstream. It has dropped the
> dependency on libgcc_s and libgcc_eh for building glibc itself.
> This means that we can simplify our toolchain bootstrap a bit by
> dropping 1 of the 3 cross gcc build stages. We do not need
> gcc-cross-intermediate
> anymore. This should bring some build time reduction and simplify the
> bootstrap. I have a series of patches which I have tested
> by building core-image-minimal and meta-toolchain for all supported
> qemu architectures and also uclibc/eglibc both
> but it needs a lot more testing therefore I am calling out wider
> audience for help in testing it out.
>
> The branch is
>
> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/toolchain-rework
>
> Thanks
>
> -Khem
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


Hi Khem,

I successfully built core-image-minimal for qemuarm and tested it in 
qemu with a completely fresh clone.

Build output as follows:

    [jack@archHP build]$ bitbake core-image-minimal
    Pseudo is not present but is required, building this first before
    the main build
    Parsing recipes: 100%
    |###############################################################################|
    ETA:  00:00:00
    Parsing of 824 .bb files complete (0 cached, 824 parsed). 1122
    targets, 36 skipped, 0 masked, 0 errors.

    Build Configuration:
    BB_VERSION        = "1.15.3"
    TARGET_ARCH       = "arm"
    TARGET_OS         = "linux-gnueabi"
    MACHINE           = "qemuarm"
    DISTRO_VERSION    = "oe-core.0"
    TUNE_FEATURES     = "armv5 dsp thumb arm926ejs"
    TARGET_FPU        = "soft"
    meta              =
    "kraj/toolchain-rework:126a0363d03c1f5ff7a6b8ae0939d1a9ff8336f0"

    NOTE: Resolving any missing task queue dependencies
    NOTE: Preparing runqueue
    NOTE: Executing SetScene Tasks
    NOTE: Executing RunQueue Tasks
    NOTE: Tasks Summary: Attempted 63 tasks of which 0 didn't need to be
    rerun and all succeeded.
    Loading cache: 100%
    |#################################################################################|
    ETA:  00:00:00
    Loaded 1123 entries from dependency cache.

    Build Configuration:
    BB_VERSION        = "1.15.3"
    TARGET_ARCH       = "arm"
    TARGET_OS         = "linux-gnueabi"
    MACHINE           = "qemuarm"
    DISTRO_VERSION    = "oe-core.0"
    TUNE_FEATURES     = "armv5 dsp thumb arm926ejs"
    TARGET_FPU        = "soft"
    meta              =
    "kraj/toolchain-rework:126a0363d03c1f5ff7a6b8ae0939d1a9ff8336f0"

    NOTE: Resolving any missing task queue dependencies
    NOTE: Preparing runqueue
    NOTE: Executing SetScene Tasks
    NOTE: Executing RunQueue Tasks
    WARNING: Failed to fetch URL
    http://kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.22.tar.bz2,
    attempting MIRRORS if available
    WARNING: Failed to fetch URL
    http://www.apache.org/dist/subversion/subversion-1.7.2.tar.bz2,
    attempting MIRRORS if available
    WARNING: Failed to fetch URL
    ftp://ftp.ossp.org/pkg/lib/uuid/uuid-1.6.2.tar.gz, attempting
    MIRRORS if available
    WARNING: unifdef-native: No generic license file exists for: GPL in
    any provider
    WARNING: Failed to fetch URL
    http://kernel.org/pub/linux/kernel/people/jsipek/guilt/guilt-0.33.tar.gz,
    attempting MIRRORS if available
    ERROR: chrpath command failed with exit code 7
    ERROR: chrpath command failed with exit code 7
    WARNING: ossp-uuid-native: No generic license file exists for:
    ossp_uuid in any provider
    WARNING: Failed to fetch URL
    ftp://ftp.debian.org/debian/pool/main/b/base-passwd/base-passwd_3.5.24.tar.gz,
    attempting MIRRORS if available
    WARNING: Failed to fetch URL
    http://kernel.org/pub/linux/utils/kernel/hotplug/udev-164.tar.gz,
    attempting MIRRORS if available
    NOTE: validating kernel configuration

    WARNING: QA Issue: udev: /lib/libgudev-1.0.so.0.0.1, installed in
    the base_prefix, requires a shared library under exec_prefix (/usr):
    libgobject-2.0.so.0 => /usr/lib/libgobject-2.0.so.0 (0xdead2000)
    WARNING: QA Issue: udev: /lib/libgudev-1.0.so.0.0.1, installed in
    the base_prefix, requires a shared library under exec_prefix (/usr):
    libgthread-2.0.so.0 => /usr/lib/libgthread-2.0.so.0 (0xdead3000)
    WARNING: QA Issue: udev: /lib/libgudev-1.0.so.0.0.1, installed in
    the base_prefix, requires a shared library under exec_prefix (/usr):
    libffi.so.5 => /usr/lib/libffi.so.5 (0xdead4000)
    WARNING: QA Issue: udev: /lib/libgudev-1.0.so.0.0.1, installed in
    the base_prefix, requires a shared library under exec_prefix (/usr):
    libglib-2.0.so.0 => /usr/lib/libglib-2.0.so.0 (0xdead5000)
    WARNING: QA Issue: udev: /lib/udev/udev-acl, installed in the
    base_prefix, requires a shared library under exec_prefix (/usr):
    libglib-2.0.so.0 => /usr/lib/libglib-2.0.so.0 (0xdead2000)
    NOTE: Tasks Summary: Attempted 1513 tasks of which 236 didn't need
    to be rerun and all succeeded.

    Summary: There were 13 WARNING messages shown.
    Summary: There were 2 ERROR messages shown, returning a non-zero
    exit code.


Regards,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



