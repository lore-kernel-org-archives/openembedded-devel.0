Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C7EFD7E6F9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2019 00:26:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5H0Qbw2016893
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 16 Jun 2019 17:26:37 -0700 (PDT)
Received: from [128.224.162.136] (128.224.162.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Sun, 16 Jun 2019 17:26:36 -0700
To: akuster808 <akuster808@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
References: <1560497298-21430-1-git-send-email-yi.zhao@windriver.com>
	<1c330555-d82a-ccdc-eb12-f65438baa38a@gmail.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <b9c71bd7-af07-c697-6967-f01a1179194d@windriver.com>
Date: Mon, 17 Jun 2019 08:26:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1c330555-d82a-ccdc-eb12-f65438baa38a@gmail.com>
X-Originating-IP: [128.224.162.136]
Subject: Re: [meta-networking][PATCH] openipmi: upgrade 2.0.25 -> 2.0.27
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
X-List-Received-Date: Mon, 17 Jun 2019 00:26:38 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 6/16/19 2:08 AM, akuster808 wrote:
>
> On 6/14/19 12:28 AM, Yi Zhao wrote:
>> Refresh all patches.
>>
>> Remove openipmigui-not-compile-pyc-pyo.patch and
>> do-not-install-pyc-and-pyo.patch as the issues had been fixed upstream.
>>
>> Add ipmi_serial_bmc_emu.c-include-readline.h-from-readli.patch to fix
>> the build error.
> Is this a bug fix only update?

I checked the commit log, most of changes are bug fixing. The only one 
feature is remove libedit and switch to readline.


//Yi


>
> - armin
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>   .../files/do-not-install-pyc-and-pyo.patch         | 25 -----------------
>>   .../fix-symlink-install-error-in-cmdlang.patch     | 31 +++++++++++++---------
>>   .../openipmi/files/include_sys_types.patch         | 21 ++++++++++++---
>>   .../files/ipmi-init-fix-the-arguments.patch        |  7 ++---
>>   ..._bmc_emu.c-include-readline.h-from-readli.patch | 31 ++++++++++++++++++++++
>>   .../files/openipmi-no-openipmigui-man.patch        | 27 ++++++++++---------
>>   ...openipmi-remove-host-path-from-la_LDFLAGS.patch | 30 ++++++++++-----------
>>   .../files/openipmigui-not-compile-pyc-pyo.patch    | 26 ------------------
>>   .../{openipmi_2.0.25.bb => openipmi_2.0.27.bb}     |  9 ++++---
>>   9 files changed, 104 insertions(+), 103 deletions(-)
>>   delete mode 100644 meta-networking/recipes-support/openipmi/files/do-not-install-pyc-and-pyo.patch
>>   create mode 100644 meta-networking/recipes-support/openipmi/files/ipmi_serial_bmc_emu.c-include-readline.h-from-readli.patch
>>   delete mode 100644 meta-networking/recipes-support/openipmi/files/openipmigui-not-compile-pyc-pyo.patch
>>   rename meta-networking/recipes-support/openipmi/{openipmi_2.0.25.bb => openipmi_2.0.27.bb} (94%)
>>
>> diff --git a/meta-networking/recipes-support/openipmi/files/do-not-install-pyc-and-pyo.patch b/meta-networking/recipes-support/openipmi/files/do-not-install-pyc-and-pyo.patch
>> deleted file mode 100644
>> index d4e02be..0000000
>> --- a/meta-networking/recipes-support/openipmi/files/do-not-install-pyc-and-pyo.patch
>> +++ /dev/null
>> @@ -1,25 +0,0 @@
>> -Do not install pyc and pyo for python module
>> -
>> -Upstream-Status: Inappropriate [embedded specific]
>> -
>> -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ----
>> - swig/python/Makefile.am | 2 --
>> - 1 file changed, 2 deletions(-)
>> -
>> -diff --git a/swig/python/Makefile.am b/swig/python/Makefile.am
>> -index da95a81..97a62bf 100644
>> ---- a/swig/python/Makefile.am
>> -+++ b/swig/python/Makefile.am
>> -@@ -33,8 +33,6 @@ CLEANFILES = OpenIPMI_wrap.c OpenIPMI.py OpenIPMI.pyo OpenIPMI.pyc
>> - install-exec-local: _OpenIPMI.la OpenIPMI.py OpenIPMI.pyc OpenIPMI.pyo
>> - 	$(INSTALL) -d $(DESTDIR)$(PYTHON_INSTALL_DIR)
>> - 	$(INSTALL_DATA) OpenIPMI.py "$(DESTDIR)$(PYTHON_INSTALL_DIR)"
>> --	$(INSTALL_DATA) OpenIPMI.pyc "$(DESTDIR)$(PYTHON_INSTALL_DIR)"
>> --	$(INSTALL_DATA) OpenIPMI.pyo "$(DESTDIR)$(PYTHON_INSTALL_DIR)"
>> - 	if test "x$(PYTHON_GUI_DIR)" = "xopenipmigui"; then \
>> - 	    $(INSTALL) -d $(DESTDIR)$(bindir); \
>> - 	    $(INSTALL_SCRIPT) $(srcdir)/openipmigui.py "$(DESTDIR)$(bindir)/openipmigui";\
>> ---
>> -1.9.1
>> -
>> diff --git a/meta-networking/recipes-support/openipmi/files/fix-symlink-install-error-in-cmdlang.patch b/meta-networking/recipes-support/openipmi/files/fix-symlink-install-error-in-cmdlang.patch
>> index 449142f..2434884 100644
>> --- a/meta-networking/recipes-support/openipmi/files/fix-symlink-install-error-in-cmdlang.patch
>> +++ b/meta-networking/recipes-support/openipmi/files/fix-symlink-install-error-in-cmdlang.patch
>> @@ -1,18 +1,23 @@
>> -Author: Aws Ismail <aws.ismail@windriver.com>
>> -Date:   Thu Jun 7 16:00:13 2012 -0400
>> +From 7854c60c92243adb14ea89e16fc226d2e47dd4f9 Mon Sep 17 00:00:00 2001
>> +From: Aws Ismail <aws.ismail@windriver.com>
>> +Date: Thu, 7 Jun 2012 16:00:13 -0400
>> +Subject: [PATCH] Fix symlink install error in cmdlang
>>   
>> -    This patch fixes the error during the install stage when
>> -    creating a symbolic link for opeipmish in openipmi/cmdlang
>> -
>> -    Upstream-Status: Pending
>> -
>> -    Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
>> +This patch fixes the error during the install stage when
>> +creating a symbolic link for opeipmish in openipmi/cmdlang
>>   
>> -Index: OpenIPMI-2.0.24/cmdlang/Makefile.am
>> -===================================================================
>> ---- OpenIPMI-2.0.24.orig/cmdlang/Makefile.am
>> -+++ OpenIPMI-2.0.24/cmdlang/Makefile.am
>> -@@ -35,6 +35,7 @@ openipmish_LDADD =  libOpenIPMIcmdlang.l
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
>> +---
>> + cmdlang/Makefile.am | 1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/cmdlang/Makefile.am b/cmdlang/Makefile.am
>> +index 0ca3827..d9a941f 100644
>> +--- a/cmdlang/Makefile.am
>> ++++ b/cmdlang/Makefile.am
>> +@@ -35,6 +35,7 @@ openipmish_LDADD =  libOpenIPMIcmdlang.la \
>>    # compatability.
>>    install-data-local:
>>    	rm -f $(DESTDIR)$(bindir)/ipmish
>> diff --git a/meta-networking/recipes-support/openipmi/files/include_sys_types.patch b/meta-networking/recipes-support/openipmi/files/include_sys_types.patch
>> index 082511a..61b3999 100644
>> --- a/meta-networking/recipes-support/openipmi/files/include_sys_types.patch
>> +++ b/meta-networking/recipes-support/openipmi/files/include_sys_types.patch
>> @@ -1,12 +1,25 @@
>> +From 4f41e090e33a00117a27f0c77b6338fb8b495f37 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Fri, 2 Jun 2017 21:58:32 -0700
>> +Subject: [PATCH] openipmi: Fix build with musl
>> +
>>   include sys/types.h for u_int32_t
>>   
>>   ui.c:340:5: error: unknown type name 'u_int32_t'; did you mean 'uint32_t'?
>>        u_int32_t     addr;
>>        ^~~~~~~~~
>> -Index: OpenIPMI-2.0.24/ui/ui.c
>> -===================================================================
>> ---- OpenIPMI-2.0.24.orig/ui/ui.c
>> -+++ OpenIPMI-2.0.24/ui/ui.c
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + ui/ui.c | 1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/ui/ui.c b/ui/ui.c
>> +index 529ff22..066d118 100644
>> +--- a/ui/ui.c
>> ++++ b/ui/ui.c
>>   @@ -42,6 +42,7 @@
>>    #include <fcntl.h>
>>    #include <time.h>
>> diff --git a/meta-networking/recipes-support/openipmi/files/ipmi-init-fix-the-arguments.patch b/meta-networking/recipes-support/openipmi/files/ipmi-init-fix-the-arguments.patch
>> index 51a398b..c4559c9 100644
>> --- a/meta-networking/recipes-support/openipmi/files/ipmi-init-fix-the-arguments.patch
>> +++ b/meta-networking/recipes-support/openipmi/files/ipmi-init-fix-the-arguments.patch
>> @@ -1,3 +1,6 @@
>> +From 6542ebe7a0d37dee8e9afb856feb8f6c3d334632 Mon Sep 17 00:00:00 2001
>> +From: Jackie Huang <jackie.huang@windriver.com>
>> +Date: Mon, 29 Dec 2014 18:16:04 +0800
>>   Subject: [PATCH] ipmi-init: fix the arguments
>>   
>>   The functions success/failure/warning defined in /etc/init.d/functions
>> @@ -12,7 +15,7 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>   
>>   diff --git a/ipmi.init b/ipmi.init
>> -index 2ebcd94..d8161c5 100644
>> +index ea10b11..aac9f83 100644
>>   --- a/ipmi.init
>>   +++ b/ipmi.init
>>   @@ -45,17 +45,17 @@ elif [ -r /etc/init.d/functions ]; then
>> @@ -36,6 +39,4 @@ index 2ebcd94..d8161c5 100644
>>    		echo
>>    		;;
>>    	    *)
>> ---
>> -1.9.1
>>   
>> diff --git a/meta-networking/recipes-support/openipmi/files/ipmi_serial_bmc_emu.c-include-readline.h-from-readli.patch b/meta-networking/recipes-support/openipmi/files/ipmi_serial_bmc_emu.c-include-readline.h-from-readli.patch
>> new file mode 100644
>> index 0000000..e208de8
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/openipmi/files/ipmi_serial_bmc_emu.c-include-readline.h-from-readli.patch
>> @@ -0,0 +1,31 @@
>> +From bebfb3c24582ec4e45d79c5b52135197bf7373da Mon Sep 17 00:00:00 2001
>> +From: Yi Zhao <yi.zhao@windriver.com>
>> +Date: Fri, 14 Jun 2019 14:17:34 +0800
>> +Subject: [PATCH] ipmi_serial_bmc_emu.c: include readline.h from readline
>> +
>> +The libedit had been removed and swithed to readline.
>> +We need to include readline.h from readline rather than editline.
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> +---
>> + sample/ipmi_serial_bmc_emu.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/sample/ipmi_serial_bmc_emu.c b/sample/ipmi_serial_bmc_emu.c
>> +index e0ae019..1b8bb9a 100644
>> +--- a/sample/ipmi_serial_bmc_emu.c
>> ++++ b/sample/ipmi_serial_bmc_emu.c
>> +@@ -42,7 +42,7 @@
>> + #include <unistd.h>
>> + #include <stdlib.h>
>> + #include <sys/select.h>
>> +-#include <editline/readline.h>
>> ++#include <readline/readline.h>
>> +
>> + #define _GNU_SOURCE
>> + #include <getopt.h>
>> +--
>> +2.7.4
>> +
>> diff --git a/meta-networking/recipes-support/openipmi/files/openipmi-no-openipmigui-man.patch b/meta-networking/recipes-support/openipmi/files/openipmi-no-openipmigui-man.patch
>> index 1fa68f9..858adc5 100644
>> --- a/meta-networking/recipes-support/openipmi/files/openipmi-no-openipmigui-man.patch
>> +++ b/meta-networking/recipes-support/openipmi/files/openipmi-no-openipmigui-man.patch
>> @@ -1,16 +1,19 @@
>> -Author: Aws Ismail <aws.ismail@windriver.com>
>> -Date:   Thu Jun 7 12:28:34 2012 -0400
>> +From a6ffa3939a3ab2ad6a8d277cd8292b7dad6469c6 Mon Sep 17 00:00:00 2001
>> +From: Aws Ismail <aws.ismail@windriver.com>
>> +Date: Thu, 7 Jun 2012 12:28:34 -0400
>> +Subject: [PATCH] Do not build openipmigui man page
>>   
>> -    This patch was carried over from WRL4.3 (openipmi v2.0.16)
>> -
>> -    It was updated for openipmi v2.0.19
>> -
>> -    Disable making openipmigui man page since we don't need it
>> -
>> -    Upstream-Status: Pending
>> -
>> -    Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
>> -    Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> +This patch was carried over from WRL4.3 (openipmi v2.0.16)
>> +It was updated for openipmi v2.0.19
>> +Disable making openipmigui man page since we don't need it
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
>> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> +---
>> + man/Makefile.am | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>   
>>   diff --git a/man/Makefile.am b/man/Makefile.am
>>   index 632f55b..5ce79f5 100644
>> diff --git a/meta-networking/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch b/meta-networking/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch
>> index 83485a9..ce37d5e 100644
>> --- a/meta-networking/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch
>> +++ b/meta-networking/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch
>> @@ -1,4 +1,4 @@
>> -From aa0dc0783a6ff5fb56c914b640836223e3c192bb Mon Sep 17 00:00:00 2001
>> +From 6395659ca6d64b20bf78bb640c2cc523d6c1d9c2 Mon Sep 17 00:00:00 2001
>>   From: Jackie Huang <jackie.huang@windriver.com>
>>   Date: Mon, 29 Dec 2014 18:16:04 +0800
>>   Subject: [PATCH] remove host path from la_LDFLAGS
>> @@ -7,17 +7,15 @@ Upstream-Status: Inappropriate [ cross compile specific ]
>>   
>>   Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>>   ---
>> - cmdlang/Makefile.am |    2 +-
>> - glib/Makefile.am    |    4 ++--
>> - tcl/Makefile.am     |    2 +-
>> - unix/Makefile.am    |    4 ++--
>> - 4 files changed, 6 insertions(+), 6 deletions(-)
>> + cmdlang/Makefile.am | 3 +--
>> + unix/Makefile.am    | 6 ++----
>> + 2 files changed, 3 insertions(+), 6 deletions(-)
>>   
>> -Index: OpenIPMI-2.0.24/cmdlang/Makefile.am
>> -===================================================================
>> ---- OpenIPMI-2.0.24.orig/cmdlang/Makefile.am
>> -+++ OpenIPMI-2.0.24/cmdlang/Makefile.am
>> -@@ -15,8 +15,7 @@ libOpenIPMIcmdlang_la_SOURCES = cmdlang.
>> +diff --git a/cmdlang/Makefile.am b/cmdlang/Makefile.am
>> +index d9a941f..21b9531 100644
>> +--- a/cmdlang/Makefile.am
>> ++++ b/cmdlang/Makefile.am
>> +@@ -15,8 +15,7 @@ libOpenIPMIcmdlang_la_SOURCES = cmdlang.c cmd_domain.c cmd_entity.c cmd_mc.c \
>>    libOpenIPMIcmdlang_la_LIBADD = -lm \
>>    	$(top_builddir)/utils/libOpenIPMIutils.la \
>>    	$(top_builddir)/lib/libOpenIPMI.la
>> @@ -27,11 +25,11 @@ Index: OpenIPMI-2.0.24/cmdlang/Makefile.am
>>    
>>    bin_PROGRAMS = openipmish
>>    
>> -Index: OpenIPMI-2.0.24/unix/Makefile.am
>> -===================================================================
>> ---- OpenIPMI-2.0.24.orig/unix/Makefile.am
>> -+++ OpenIPMI-2.0.24/unix/Makefile.am
>> -@@ -10,14 +10,12 @@ lib_LTLIBRARIES = libOpenIPMIposix.la li
>> +diff --git a/unix/Makefile.am b/unix/Makefile.am
>> +index 5128839..bd0f897 100644
>> +--- a/unix/Makefile.am
>> ++++ b/unix/Makefile.am
>> +@@ -10,14 +10,12 @@ lib_LTLIBRARIES = libOpenIPMIposix.la libOpenIPMIpthread.la
>>    libOpenIPMIpthread_la_SOURCES = posix_thread_os_hnd.c selector.c
>>    libOpenIPMIpthread_la_LIBADD = -lpthread $(GDBM_LIB) \
>>    	$(top_builddir)/utils/libOpenIPMIutils.la $(RT_LIB)
>> diff --git a/meta-networking/recipes-support/openipmi/files/openipmigui-not-compile-pyc-pyo.patch b/meta-networking/recipes-support/openipmi/files/openipmigui-not-compile-pyc-pyo.patch
>> deleted file mode 100644
>> index 3894075..0000000
>> --- a/meta-networking/recipes-support/openipmi/files/openipmigui-not-compile-pyc-pyo.patch
>> +++ /dev/null
>> @@ -1,26 +0,0 @@
>> -openipmi load swig/python/.libs/_OpenIPMI.so to create .pyc and .pyo files.
>> -It fails when multilib is enable:
>> -
>> -| ImportError: .../lib32-openipmi/2.0.25-r0/OpenIPMI-2.0.25/swig/python/.libs/_OpenIPMI.so: wrong ELF class: ELFCLASS32
>> -
>> -Don't compile and install .pyc and .pyo files to fix the failure.
>> -
>> -Upstream-Status: Inappropriate [OE specific]
>> -
>> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> -diff --git a/swig/python/openipmigui/Makefile.am b/swig/python/openipmigui/Makefile.am
>> -index 570e7b9..88258bf 100644
>> ---- a/swig/python/openipmigui/Makefile.am
>> -+++ b/swig/python/openipmigui/Makefile.am
>> -@@ -34,9 +34,9 @@ localcopy:
>> - 		fi \
>> - 	done
>> -
>> --all-local: localcopy $(PYC_FILES) $(PYO_FILES)
>> -+all-local: localcopy
>> -
>> --install-exec-local: $(EXTRA_DIST) $(PYC_FILES) $(PYO_FILES)
>> -+install-exec-local: $(EXTRA_DIST)
>> - 	$(INSTALL) -d $(DESTDIR)$(PYTHON_INSTALL_DIR)/openipmigui
>> - 	$(INSTALL_DATA) $^ $(DESTDIR)$(PYTHON_INSTALL_DIR)/openipmigui
>> -
>> diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.25.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.27.bb
>> similarity index 94%
>> rename from meta-networking/recipes-support/openipmi/openipmi_2.0.25.bb
>> rename to meta-networking/recipes-support/openipmi/openipmi_2.0.27.bb
>> index f0426ce..51cc256 100644
>> --- a/meta-networking/recipes-support/openipmi/openipmi_2.0.25.bb
>> +++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.27.bb
>> @@ -13,6 +13,7 @@ DEPENDS = " \
>>       popt \
>>       python \
>>       swig-native \
>> +    readline \
>>       "
>>   
>>   LICENSE = "GPLv2 & LGPLv2.1 & BSD"
>> @@ -27,16 +28,16 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/openipmi/OpenIPMI-${PV}.tar.gz \
>>              file://openipmi-no-openipmigui-man.patch \
>>              file://openipmi-remove-host-path-from-la_LDFLAGS.patch \
>>              file://ipmi-init-fix-the-arguments.patch \
>> -           file://do-not-install-pyc-and-pyo.patch \
>>              file://include_sys_types.patch \
>> -           file://openipmigui-not-compile-pyc-pyo.patch \
>> +           file://ipmi_serial_bmc_emu.c-include-readline.h-from-readli.patch \
>>              file://openipmi-helper \
>>              file://ipmi.service \
>>              "
>>   
>>   S = "${WORKDIR}/OpenIPMI-${PV}"
>> -SRC_URI[md5sum] = "1461ac4d78fc516646fd0a6e605a8b05"
>> -SRC_URI[sha256sum] = "f0f1a0ec732409930b7a31a6daa6cf39b585f52059b62a5f092b7ece21aa75a5"
>> +
>> +SRC_URI[md5sum] = "d525ceaa07df5440674e7e68a6772fe7"
>> +SRC_URI[sha256sum] = "f3b1fafaaec2e2bac32fec5a86941ad8b8cb64543470bd6d819d7b166713d20b"
>>   
>>   inherit autotools-brokensep pkgconfig pythonnative perlnative update-rc.d systemd cpan-base
>>   
>

