Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id B5EF37BFB3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 18:08:39 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id c14so2376301plo.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 11:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=PCQvCStYt8IBiXOOX1W3YijcCx8aDrcQtHc+PnwhmTM=;
	b=msOog9xMwZRV/qMLQTHxJLAILEJ3C5dRvUelmJyYTgJPEmNQgwctLctCz8OSMNmlmS
	UgwOAQOeblA8g3/UaHcfrutrO7YwZwAConhRJ5SbPgGEZMYc7oUFYWFGWFjh1E4wUIYF
	guQYQIoV7ZvKZAAZmggIT4HTXtksMtGo1NidmktqeqRiVfrCxKFeCuam2D+5Q88sq8YX
	4tBGvD1MD7y4VJ+IlLg0IxfHTp6XmakMlcKFwK2p1yPPpUVRqvvNvz9f0vKXwcWKLmqB
	PJ/3ZOX6t3lb6Vt5UE9iDKHGUEPssTCRg4437kkyPI8T9vBgwYEy3Nxdk+gGM1mGWfdK
	U+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=PCQvCStYt8IBiXOOX1W3YijcCx8aDrcQtHc+PnwhmTM=;
	b=kCbdrCxQt3QDXuE3iphLdSvp3LDjFbj5637WnezB5hloQEWP+x83Y1n3a8uACee+i0
	8iCE9N0he9wXnXy4O2yXYAXowuTXfx6L7Yu2LPQhPLApP1H0YGbo3+d//gdvoOIcXI5v
	YKuZiNkqS3Olf4ngBR23JSYGRx1f8A3XS3a5htDR3tm4SN+g9LmToGms+dc4j7jhQes5
	rU501i3H+ebH9zk0DeL2PF0xfai+rfqv/3lZpph/sN1ntEVpgbU3eQGDu7GmbWsm7aKw
	bfZQeKPt99XFmmiJ2cef9cDHFesmn3tz9Xzsu2fcxXh5Y+XXSwvJfr0daK1BmbHxEDM0
	adPQ==
X-Gm-Message-State: APjAAAXvk+7wBhcaOc7+SBuJbVQHLE4e1r5trHt2e/BfYrX5H8v1Dq6D
	ZZoBwCoAtAO4GG+wK0WizlVbYRAZ
X-Google-Smtp-Source: APXvYqyJ6UHszk4a7wnUNygCDXkgJuTl55tRhyU5KM6RaN9q9A3/L82MzeVf1d43D1wL8iD5aq4OAQ==
X-Received: by 2002:a17:902:8d95:: with SMTP id
	v21mr77991942plo.225.1560622120393; 
	Sat, 15 Jun 2019 11:08:40 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:5942:80bf:dc9c:15ab?
	([2601:202:4180:c33:5942:80bf:dc9c:15ab])
	by smtp.gmail.com with ESMTPSA id
	k12sm6240380pfa.159.2019.06.15.11.08.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 15 Jun 2019 11:08:39 -0700 (PDT)
To: Yi Zhao <yi.zhao@windriver.com>, openembedded-devel@lists.openembedded.org
References: <1560497298-21430-1-git-send-email-yi.zhao@windriver.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <1c330555-d82a-ccdc-eb12-f65438baa38a@gmail.com>
Date: Sat, 15 Jun 2019 11:08:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1560497298-21430-1-git-send-email-yi.zhao@windriver.com>
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
X-List-Received-Date: Sat, 15 Jun 2019 18:08:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 6/14/19 12:28 AM, Yi Zhao wrote:
> Refresh all patches.
>
> Remove openipmigui-not-compile-pyc-pyo.patch and
> do-not-install-pyc-and-pyo.patch as the issues had been fixed upstream.
>
> Add ipmi_serial_bmc_emu.c-include-readline.h-from-readli.patch to fix
> the build error.
Is this a bug fix only update?

- armin
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  .../files/do-not-install-pyc-and-pyo.patch         | 25 -----------------
>  .../fix-symlink-install-error-in-cmdlang.patch     | 31 +++++++++++++---------
>  .../openipmi/files/include_sys_types.patch         | 21 ++++++++++++---
>  .../files/ipmi-init-fix-the-arguments.patch        |  7 ++---
>  ..._bmc_emu.c-include-readline.h-from-readli.patch | 31 ++++++++++++++++++++++
>  .../files/openipmi-no-openipmigui-man.patch        | 27 ++++++++++---------
>  ...openipmi-remove-host-path-from-la_LDFLAGS.patch | 30 ++++++++++-----------
>  .../files/openipmigui-not-compile-pyc-pyo.patch    | 26 ------------------
>  .../{openipmi_2.0.25.bb => openipmi_2.0.27.bb}     |  9 ++++---
>  9 files changed, 104 insertions(+), 103 deletions(-)
>  delete mode 100644 meta-networking/recipes-support/openipmi/files/do-not-install-pyc-and-pyo.patch
>  create mode 100644 meta-networking/recipes-support/openipmi/files/ipmi_serial_bmc_emu.c-include-readline.h-from-readli.patch
>  delete mode 100644 meta-networking/recipes-support/openipmi/files/openipmigui-not-compile-pyc-pyo.patch
>  rename meta-networking/recipes-support/openipmi/{openipmi_2.0.25.bb => openipmi_2.0.27.bb} (94%)
>
> diff --git a/meta-networking/recipes-support/openipmi/files/do-not-install-pyc-and-pyo.patch b/meta-networking/recipes-support/openipmi/files/do-not-install-pyc-and-pyo.patch
> deleted file mode 100644
> index d4e02be..0000000
> --- a/meta-networking/recipes-support/openipmi/files/do-not-install-pyc-and-pyo.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -Do not install pyc and pyo for python module
> -
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ----
> - swig/python/Makefile.am | 2 --
> - 1 file changed, 2 deletions(-)
> -
> -diff --git a/swig/python/Makefile.am b/swig/python/Makefile.am
> -index da95a81..97a62bf 100644
> ---- a/swig/python/Makefile.am
> -+++ b/swig/python/Makefile.am
> -@@ -33,8 +33,6 @@ CLEANFILES = OpenIPMI_wrap.c OpenIPMI.py OpenIPMI.pyo OpenIPMI.pyc
> - install-exec-local: _OpenIPMI.la OpenIPMI.py OpenIPMI.pyc OpenIPMI.pyo
> - 	$(INSTALL) -d $(DESTDIR)$(PYTHON_INSTALL_DIR)
> - 	$(INSTALL_DATA) OpenIPMI.py "$(DESTDIR)$(PYTHON_INSTALL_DIR)"
> --	$(INSTALL_DATA) OpenIPMI.pyc "$(DESTDIR)$(PYTHON_INSTALL_DIR)"
> --	$(INSTALL_DATA) OpenIPMI.pyo "$(DESTDIR)$(PYTHON_INSTALL_DIR)"
> - 	if test "x$(PYTHON_GUI_DIR)" = "xopenipmigui"; then \
> - 	    $(INSTALL) -d $(DESTDIR)$(bindir); \
> - 	    $(INSTALL_SCRIPT) $(srcdir)/openipmigui.py "$(DESTDIR)$(bindir)/openipmigui";\
> --- 
> -1.9.1
> -
> diff --git a/meta-networking/recipes-support/openipmi/files/fix-symlink-install-error-in-cmdlang.patch b/meta-networking/recipes-support/openipmi/files/fix-symlink-install-error-in-cmdlang.patch
> index 449142f..2434884 100644
> --- a/meta-networking/recipes-support/openipmi/files/fix-symlink-install-error-in-cmdlang.patch
> +++ b/meta-networking/recipes-support/openipmi/files/fix-symlink-install-error-in-cmdlang.patch
> @@ -1,18 +1,23 @@
> -Author: Aws Ismail <aws.ismail@windriver.com>
> -Date:   Thu Jun 7 16:00:13 2012 -0400
> +From 7854c60c92243adb14ea89e16fc226d2e47dd4f9 Mon Sep 17 00:00:00 2001
> +From: Aws Ismail <aws.ismail@windriver.com>
> +Date: Thu, 7 Jun 2012 16:00:13 -0400
> +Subject: [PATCH] Fix symlink install error in cmdlang
>  
> -    This patch fixes the error during the install stage when
> -    creating a symbolic link for opeipmish in openipmi/cmdlang
> -    
> -    Upstream-Status: Pending
> -    
> -    Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
> +This patch fixes the error during the install stage when
> +creating a symbolic link for opeipmish in openipmi/cmdlang
>  
> -Index: OpenIPMI-2.0.24/cmdlang/Makefile.am
> -===================================================================
> ---- OpenIPMI-2.0.24.orig/cmdlang/Makefile.am
> -+++ OpenIPMI-2.0.24/cmdlang/Makefile.am
> -@@ -35,6 +35,7 @@ openipmish_LDADD =  libOpenIPMIcmdlang.l
> +Upstream-Status: Pending
> +
> +Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
> +---
> + cmdlang/Makefile.am | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/cmdlang/Makefile.am b/cmdlang/Makefile.am
> +index 0ca3827..d9a941f 100644
> +--- a/cmdlang/Makefile.am
> ++++ b/cmdlang/Makefile.am
> +@@ -35,6 +35,7 @@ openipmish_LDADD =  libOpenIPMIcmdlang.la \
>   # compatability.
>   install-data-local:
>   	rm -f $(DESTDIR)$(bindir)/ipmish
> diff --git a/meta-networking/recipes-support/openipmi/files/include_sys_types.patch b/meta-networking/recipes-support/openipmi/files/include_sys_types.patch
> index 082511a..61b3999 100644
> --- a/meta-networking/recipes-support/openipmi/files/include_sys_types.patch
> +++ b/meta-networking/recipes-support/openipmi/files/include_sys_types.patch
> @@ -1,12 +1,25 @@
> +From 4f41e090e33a00117a27f0c77b6338fb8b495f37 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 2 Jun 2017 21:58:32 -0700
> +Subject: [PATCH] openipmi: Fix build with musl
> +
>  include sys/types.h for u_int32_t
>  
>  ui.c:340:5: error: unknown type name 'u_int32_t'; did you mean 'uint32_t'?
>       u_int32_t     addr;
>       ^~~~~~~~~
> -Index: OpenIPMI-2.0.24/ui/ui.c
> -===================================================================
> ---- OpenIPMI-2.0.24.orig/ui/ui.c
> -+++ OpenIPMI-2.0.24/ui/ui.c
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + ui/ui.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/ui/ui.c b/ui/ui.c
> +index 529ff22..066d118 100644
> +--- a/ui/ui.c
> ++++ b/ui/ui.c
>  @@ -42,6 +42,7 @@
>   #include <fcntl.h>
>   #include <time.h>
> diff --git a/meta-networking/recipes-support/openipmi/files/ipmi-init-fix-the-arguments.patch b/meta-networking/recipes-support/openipmi/files/ipmi-init-fix-the-arguments.patch
> index 51a398b..c4559c9 100644
> --- a/meta-networking/recipes-support/openipmi/files/ipmi-init-fix-the-arguments.patch
> +++ b/meta-networking/recipes-support/openipmi/files/ipmi-init-fix-the-arguments.patch
> @@ -1,3 +1,6 @@
> +From 6542ebe7a0d37dee8e9afb856feb8f6c3d334632 Mon Sep 17 00:00:00 2001
> +From: Jackie Huang <jackie.huang@windriver.com>
> +Date: Mon, 29 Dec 2014 18:16:04 +0800
>  Subject: [PATCH] ipmi-init: fix the arguments
>  
>  The functions success/failure/warning defined in /etc/init.d/functions
> @@ -12,7 +15,7 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>   1 file changed, 3 insertions(+), 3 deletions(-)
>  
>  diff --git a/ipmi.init b/ipmi.init
> -index 2ebcd94..d8161c5 100644
> +index ea10b11..aac9f83 100644
>  --- a/ipmi.init
>  +++ b/ipmi.init
>  @@ -45,17 +45,17 @@ elif [ -r /etc/init.d/functions ]; then
> @@ -36,6 +39,4 @@ index 2ebcd94..d8161c5 100644
>   		echo
>   		;;
>   	    *)
> --- 
> -1.9.1
>  
> diff --git a/meta-networking/recipes-support/openipmi/files/ipmi_serial_bmc_emu.c-include-readline.h-from-readli.patch b/meta-networking/recipes-support/openipmi/files/ipmi_serial_bmc_emu.c-include-readline.h-from-readli.patch
> new file mode 100644
> index 0000000..e208de8
> --- /dev/null
> +++ b/meta-networking/recipes-support/openipmi/files/ipmi_serial_bmc_emu.c-include-readline.h-from-readli.patch
> @@ -0,0 +1,31 @@
> +From bebfb3c24582ec4e45d79c5b52135197bf7373da Mon Sep 17 00:00:00 2001
> +From: Yi Zhao <yi.zhao@windriver.com>
> +Date: Fri, 14 Jun 2019 14:17:34 +0800
> +Subject: [PATCH] ipmi_serial_bmc_emu.c: include readline.h from readline
> +
> +The libedit had been removed and swithed to readline.
> +We need to include readline.h from readline rather than editline.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + sample/ipmi_serial_bmc_emu.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/sample/ipmi_serial_bmc_emu.c b/sample/ipmi_serial_bmc_emu.c
> +index e0ae019..1b8bb9a 100644
> +--- a/sample/ipmi_serial_bmc_emu.c
> ++++ b/sample/ipmi_serial_bmc_emu.c
> +@@ -42,7 +42,7 @@
> + #include <unistd.h>
> + #include <stdlib.h>
> + #include <sys/select.h>
> +-#include <editline/readline.h>
> ++#include <readline/readline.h>
> + 
> + #define _GNU_SOURCE
> + #include <getopt.h>
> +-- 
> +2.7.4
> +
> diff --git a/meta-networking/recipes-support/openipmi/files/openipmi-no-openipmigui-man.patch b/meta-networking/recipes-support/openipmi/files/openipmi-no-openipmigui-man.patch
> index 1fa68f9..858adc5 100644
> --- a/meta-networking/recipes-support/openipmi/files/openipmi-no-openipmigui-man.patch
> +++ b/meta-networking/recipes-support/openipmi/files/openipmi-no-openipmigui-man.patch
> @@ -1,16 +1,19 @@
> -Author: Aws Ismail <aws.ismail@windriver.com>
> -Date:   Thu Jun 7 12:28:34 2012 -0400
> +From a6ffa3939a3ab2ad6a8d277cd8292b7dad6469c6 Mon Sep 17 00:00:00 2001
> +From: Aws Ismail <aws.ismail@windriver.com>
> +Date: Thu, 7 Jun 2012 12:28:34 -0400
> +Subject: [PATCH] Do not build openipmigui man page
>  
> -    This patch was carried over from WRL4.3 (openipmi v2.0.16)
> -    
> -    It was updated for openipmi v2.0.19
> -    
> -    Disable making openipmigui man page since we don't need it
> -    
> -    Upstream-Status: Pending
> -    
> -    Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
> -    Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +This patch was carried over from WRL4.3 (openipmi v2.0.16)
> +It was updated for openipmi v2.0.19
> +Disable making openipmigui man page since we don't need it
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + man/Makefile.am | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
>  
>  diff --git a/man/Makefile.am b/man/Makefile.am
>  index 632f55b..5ce79f5 100644
> diff --git a/meta-networking/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch b/meta-networking/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch
> index 83485a9..ce37d5e 100644
> --- a/meta-networking/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch
> +++ b/meta-networking/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch
> @@ -1,4 +1,4 @@
> -From aa0dc0783a6ff5fb56c914b640836223e3c192bb Mon Sep 17 00:00:00 2001
> +From 6395659ca6d64b20bf78bb640c2cc523d6c1d9c2 Mon Sep 17 00:00:00 2001
>  From: Jackie Huang <jackie.huang@windriver.com>
>  Date: Mon, 29 Dec 2014 18:16:04 +0800
>  Subject: [PATCH] remove host path from la_LDFLAGS
> @@ -7,17 +7,15 @@ Upstream-Status: Inappropriate [ cross compile specific ]
>  
>  Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>  ---
> - cmdlang/Makefile.am |    2 +-
> - glib/Makefile.am    |    4 ++--
> - tcl/Makefile.am     |    2 +-
> - unix/Makefile.am    |    4 ++--
> - 4 files changed, 6 insertions(+), 6 deletions(-)
> + cmdlang/Makefile.am | 3 +--
> + unix/Makefile.am    | 6 ++----
> + 2 files changed, 3 insertions(+), 6 deletions(-)
>  
> -Index: OpenIPMI-2.0.24/cmdlang/Makefile.am
> -===================================================================
> ---- OpenIPMI-2.0.24.orig/cmdlang/Makefile.am
> -+++ OpenIPMI-2.0.24/cmdlang/Makefile.am
> -@@ -15,8 +15,7 @@ libOpenIPMIcmdlang_la_SOURCES = cmdlang.
> +diff --git a/cmdlang/Makefile.am b/cmdlang/Makefile.am
> +index d9a941f..21b9531 100644
> +--- a/cmdlang/Makefile.am
> ++++ b/cmdlang/Makefile.am
> +@@ -15,8 +15,7 @@ libOpenIPMIcmdlang_la_SOURCES = cmdlang.c cmd_domain.c cmd_entity.c cmd_mc.c \
>   libOpenIPMIcmdlang_la_LIBADD = -lm \
>   	$(top_builddir)/utils/libOpenIPMIutils.la \
>   	$(top_builddir)/lib/libOpenIPMI.la
> @@ -27,11 +25,11 @@ Index: OpenIPMI-2.0.24/cmdlang/Makefile.am
>   
>   bin_PROGRAMS = openipmish
>   
> -Index: OpenIPMI-2.0.24/unix/Makefile.am
> -===================================================================
> ---- OpenIPMI-2.0.24.orig/unix/Makefile.am
> -+++ OpenIPMI-2.0.24/unix/Makefile.am
> -@@ -10,14 +10,12 @@ lib_LTLIBRARIES = libOpenIPMIposix.la li
> +diff --git a/unix/Makefile.am b/unix/Makefile.am
> +index 5128839..bd0f897 100644
> +--- a/unix/Makefile.am
> ++++ b/unix/Makefile.am
> +@@ -10,14 +10,12 @@ lib_LTLIBRARIES = libOpenIPMIposix.la libOpenIPMIpthread.la
>   libOpenIPMIpthread_la_SOURCES = posix_thread_os_hnd.c selector.c
>   libOpenIPMIpthread_la_LIBADD = -lpthread $(GDBM_LIB) \
>   	$(top_builddir)/utils/libOpenIPMIutils.la $(RT_LIB)
> diff --git a/meta-networking/recipes-support/openipmi/files/openipmigui-not-compile-pyc-pyo.patch b/meta-networking/recipes-support/openipmi/files/openipmigui-not-compile-pyc-pyo.patch
> deleted file mode 100644
> index 3894075..0000000
> --- a/meta-networking/recipes-support/openipmi/files/openipmigui-not-compile-pyc-pyo.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -openipmi load swig/python/.libs/_OpenIPMI.so to create .pyc and .pyo files.
> -It fails when multilib is enable:
> -
> -| ImportError: .../lib32-openipmi/2.0.25-r0/OpenIPMI-2.0.25/swig/python/.libs/_OpenIPMI.so: wrong ELF class: ELFCLASS32
> -
> -Don't compile and install .pyc and .pyo files to fix the failure.
> -
> -Upstream-Status: Inappropriate [OE specific]
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> -diff --git a/swig/python/openipmigui/Makefile.am b/swig/python/openipmigui/Makefile.am
> -index 570e7b9..88258bf 100644
> ---- a/swig/python/openipmigui/Makefile.am
> -+++ b/swig/python/openipmigui/Makefile.am
> -@@ -34,9 +34,9 @@ localcopy:
> - 		fi \
> - 	done
> - 
> --all-local: localcopy $(PYC_FILES) $(PYO_FILES)
> -+all-local: localcopy
> - 
> --install-exec-local: $(EXTRA_DIST) $(PYC_FILES) $(PYO_FILES)
> -+install-exec-local: $(EXTRA_DIST)
> - 	$(INSTALL) -d $(DESTDIR)$(PYTHON_INSTALL_DIR)/openipmigui
> - 	$(INSTALL_DATA) $^ $(DESTDIR)$(PYTHON_INSTALL_DIR)/openipmigui
> - 
> diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.25.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.27.bb
> similarity index 94%
> rename from meta-networking/recipes-support/openipmi/openipmi_2.0.25.bb
> rename to meta-networking/recipes-support/openipmi/openipmi_2.0.27.bb
> index f0426ce..51cc256 100644
> --- a/meta-networking/recipes-support/openipmi/openipmi_2.0.25.bb
> +++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.27.bb
> @@ -13,6 +13,7 @@ DEPENDS = " \
>      popt \
>      python \
>      swig-native \
> +    readline \
>      "
>  
>  LICENSE = "GPLv2 & LGPLv2.1 & BSD"
> @@ -27,16 +28,16 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/openipmi/OpenIPMI-${PV}.tar.gz \
>             file://openipmi-no-openipmigui-man.patch \
>             file://openipmi-remove-host-path-from-la_LDFLAGS.patch \
>             file://ipmi-init-fix-the-arguments.patch \
> -           file://do-not-install-pyc-and-pyo.patch \
>             file://include_sys_types.patch \
> -           file://openipmigui-not-compile-pyc-pyo.patch \
> +           file://ipmi_serial_bmc_emu.c-include-readline.h-from-readli.patch \
>             file://openipmi-helper \
>             file://ipmi.service \
>             "
>  
>  S = "${WORKDIR}/OpenIPMI-${PV}"
> -SRC_URI[md5sum] = "1461ac4d78fc516646fd0a6e605a8b05"
> -SRC_URI[sha256sum] = "f0f1a0ec732409930b7a31a6daa6cf39b585f52059b62a5f092b7ece21aa75a5"
> +
> +SRC_URI[md5sum] = "d525ceaa07df5440674e7e68a6772fe7"
> +SRC_URI[sha256sum] = "f3b1fafaaec2e2bac32fec5a86941ad8b8cb64543470bd6d819d7b166713d20b"
>  
>  inherit autotools-brokensep pkgconfig pythonnative perlnative update-rc.d systemd cpan-base
>  


