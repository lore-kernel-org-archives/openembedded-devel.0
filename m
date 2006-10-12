Received: from [64.233.166.181] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <axel.lin@gmail.com>) id 1GXxJ1-0000s5-Tq
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Oct 2006 11:56:48 +0200
Received: by py-out-1112.google.com with SMTP id i75so542913pye
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Oct 2006 02:50:24 -0700 (PDT)
Received: by 10.35.96.7 with SMTP id y7mr2876009pyl;
	Thu, 12 Oct 2006 02:50:24 -0700 (PDT)
Received: by 10.35.15.3 with HTTP; Thu, 12 Oct 2006 02:50:24 -0700 (PDT)
Message-ID: <427d64720610120250u7d09183au8d84abfd4ce62118@mail.gmail.com>
Date: Thu, 12 Oct 2006 17:50:24 +0800
From: "axel lin" <axel.lin@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: package hostap-modules-0.4.7-r4: task do_compile: failed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Oct 2006 09:56:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

hi list,
I got hostap-modules compile fail messages as below when I execute
bitbake bootstrap-image.
Do you have any suggestions about this error ?
Regards,
Axel

axel@kdc:/opt/oe/build$ bitbake bootstrap-image
NOTE: Using cache in '/opt/oe/build/tmp/cache'
NOTE: Handling BitBake files: | (4060/4060) [100 %]
NOTE: Parsing finished. 3931 cached, 0 parsed, 129 skipped, 0 masked.

NOTE: build 200610121742: started

OE Build Configuration:
BB_VERSION     = "1.6.1"
OE_REVISION    = "format_version "1"

new_manifest [0000000000000000000000000000000000000004]

old_revision [4f79add1f26425297789165c7217498c99fa7425]"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux-gnueabi"
MACHINE        = "mainstone"
DISTRO         = "angstrom"
DISTRO_VERSION = "test-20061012"
TARGET_FPU     = "soft"

NOTE: preferred version 2.5 of glibc not available
NOTE: package hostap-modules-0.4.7: started
NOTE: package hostap-modules-0.4.7-r4: task do_compile: started
ERROR: function do_compile failed
ERROR: log data follows
(/opt/oe/build/tmp/work/mainstone-angstrom-linux-gnueabi/hostap-modules-0.4.7-r4/temp/log.do_compile.24036)
| NOTE: make -e MAKEFLAGS=
KERNEL_PATH=/opt/oe/build/tmp/staging/mainstone-angstrom-linux-gnueabi/kernel
KERNEL_SRC=/opt/oe/build/tmp/staging/mainstone-angstrom-linux-gnueabi/kernel
KERNEL_VERSION=2.6.18 CC=ccache arm-angstrom-linux-gnueabi-gcc
LD=arm-angstrom-linux-gnueabi-ld
KERNEL_PATH=/opt/oe/build/tmp/staging/mainstone-angstrom-linux-gnueabi/kernel
MAKE=make -e
| Makefile:46: WARNING: No kernel PCMCIA support found and PCMCIA_PATH
is not defined
| Makefile:53: WARNING: Linux wireless extensions, CONFIG_NET_RADIO,
not enabled in the kernel
| *** Can't build for 2.6 with a non-2.6 source!
| make: *** [2.6] Error 1
| FATAL: oe_runmake failed
NOTE: Task failed:
/opt/oe/build/tmp/work/mainstone-angstrom-linux-gnueabi/hostap-modules-0.4.7-r4/temp/log.do_compile.24036
NOTE: package hostap-modules-0.4.7-r4: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package hostap-modules-0.4.7: failed
ERROR: Build of bootstrap-image failed


