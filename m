Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 383FD7FD86
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 17:24:42 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id q8so1438059pfh.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 09:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=xybIZ4OBnAuKMlhoMOeDGWD/qv1E5BlAwKQ9SYjgoSY=;
	b=eQfYV4nkdCZYFqDa2gwJDjQ9XiYUevOgxlWT10CrfpKGjet0hr50qdrWVVBRAuVTMi
	M55Xi6sdj+yR51p+Rq0NuXwSkvwBTIw74ce00cS2O/lx7muogdMjfpjSw75c0f/LGSOi
	mfIdBwgAO7sd/LAfkbw1WW5BXIrEeEeFB7txmZCTwFEnAyK84RB//+Go3IHlUStamX4I
	aFJRigeqYxHa0pMkLZdm5j+PpOvK/7D07gjezu56kzPzhcUwzoqjKKLgZit/WtIbN0iy
	caaaCKSE5GnecCB8M31tKdcCM8Xm2LgyVj6sSeQp5YCCXsVYKkJlQ6mSSLv+BqsxTL8B
	U84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=xybIZ4OBnAuKMlhoMOeDGWD/qv1E5BlAwKQ9SYjgoSY=;
	b=ENJSHE81uFRXfxpYngQiU9tB4kTtlADzhK7u7Bhnlmk2VqQ+Qdu/PxTiLwjJKS+BIx
	lOEmWNFR6gQ++x8wrKSjI2npPk2SvEucbPY8nxOf6Ap8RwIHkQVKdXbxaddH9xylv0CQ
	WlKVZLQs04wbnvO6bzwyru/rzSvlu/lw8+CUNFcANoJ4ZKyc6wWtLuSgOvu8VKKkm5HE
	vanCNSBVKqUTC98qOhIpUnuugalOJpIrrLYojDvbcRmS4WVXWTpQc1MgHgk1b7S3X7Yq
	R9M4L6K2IydMoQ3NH+XUs0HilUrxmmHusbWiJxBSkLA3udHkPRhNXmgu0F09G27BJN74
	UpMg==
X-Gm-Message-State: APjAAAWV5MGK3fAjmIrKI+a+AqJvhYwzZkKrvJheFyi4DH03t72S095q
	WW+GmAo4ldkUSpWYuZ63GP4=
X-Google-Smtp-Source: APXvYqz3N/g0tOKDEOCYWJZgS7dlqSLjiyTrvojyywf7zOJq1jSMsQuvLLs880BDZo0OVVv2LvT/pQ==
X-Received: by 2002:a63:fe50:: with SMTP id x16mr5102887pgj.31.1579886683048; 
	Fri, 24 Jan 2020 09:24:43 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:5dac:ba30:48e4:cb20?
	([2601:646:9200:4e0:5dac:ba30:48e4:cb20])
	by smtp.gmail.com with ESMTPSA id
	t30sm7176684pgl.75.2020.01.24.09.24.41
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 24 Jan 2020 09:24:42 -0800 (PST)
To: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20200124134304.21057-1-costamagnagianfranco@yahoo.it>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <1743fc14-a7dc-3087-966e-48654e958843@gmail.com>
Date: Fri, 24 Jan 2020 09:24:41 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200124134304.21057-1-costamagnagianfranco@yahoo.it>
Cc: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: Re: [meta-oe][PATCH 1/2] dlt-daemon: add initial recipe based on meta-ivi branch (with lots of changes)
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
X-List-Received-Date: Fri, 24 Jan 2020 17:24:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/24/20 5:43 AM, Gianfranco Costamagna wrote:
> From: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
> 
> dlt-daemon is useful on embedded systems as a logging system
> 

fails to build with musl [1], perhaps its missing including pthread.h

[1] https://errors.yoctoproject.org/Errors/Details/308000/

> Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> ---
>   ...execute-processes-as-a-specific-user.patch | 95 +++++++++++++++++++
>   ...0004-Modify-systemd-config-directory.patch | 25 +++++
>   .../dlt-daemon/dlt-daemon_2.18.4.bb           | 48 ++++++++++
>   3 files changed, 168 insertions(+)
>   create mode 100644 meta-oe/recipes-devtools/dlt-daemon/dlt-daemon/0002-Don-t-execute-processes-as-a-specific-user.patch
>   create mode 100644 meta-oe/recipes-devtools/dlt-daemon/dlt-daemon/0004-Modify-systemd-config-directory.patch
>   create mode 100644 meta-oe/recipes-devtools/dlt-daemon/dlt-daemon_2.18.4.bb
> 
> diff --git a/meta-oe/recipes-devtools/dlt-daemon/dlt-daemon/0002-Don-t-execute-processes-as-a-specific-user.patch b/meta-oe/recipes-devtools/dlt-daemon/dlt-daemon/0002-Don-t-execute-processes-as-a-specific-user.patch
> new file mode 100644
> index 000000000..7c082297e
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/dlt-daemon/dlt-daemon/0002-Don-t-execute-processes-as-a-specific-user.patch
> @@ -0,0 +1,95 @@
> +From 24204fefec474ef001599a14ad669f41b6f28061 Mon Sep 17 00:00:00 2001
> +From: Andrei Gherzan <andrei.gherzan@windriver.com>
> +Date: Tue, 18 Nov 2014 15:47:22 +0100
> +Subject: [PATCH] Don't execute processes as a specific user.
> +
> +Upstream-Status: Inappropriate [Configuration Specific]
> +Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
> +
> +---
> + systemd/dlt-adaptor-udp.service.cmake  | 3 +--
> + systemd/dlt-dbus.service.cmake         | 1 -
> + systemd/dlt-example-user.service.cmake | 3 +--
> + systemd/dlt-receive.service.cmake      | 3 +--
> + systemd/dlt-system.service.cmake       | 1 -
> + systemd/dlt.service.cmake              | 1 -
> + 6 files changed, 3 insertions(+), 9 deletions(-)
> +
> +diff --git a/systemd/dlt-adaptor-udp.service.cmake b/systemd/dlt-adaptor-udp.service.cmake
> +index e06330c..ebf0594 100644
> +--- a/systemd/dlt-adaptor-udp.service.cmake
> ++++ b/systemd/dlt-adaptor-udp.service.cmake
> +@@ -19,9 +19,8 @@ Wants=dlt.service
> +
> + [Service]
> + Type=simple
> +-User=@DLT_USER@
> + ExecStart=@CMAKE_INSTALL_PREFIX@/bin/dlt-adaptor-udp -a @DLT_ADAPTOR_UDP_APPID@ -c @DLT_ADAPTOR_UDP_CTID@ -p @DLT_ADAPTOR_UDP_PORT@
> + LimitCORE=infinity
> +
> + [Install]
> +-WantedBy=multi-user.target
> +\ No newline at end of file
> ++WantedBy=multi-user.target
> +diff --git a/systemd/dlt-dbus.service.cmake b/systemd/dlt-dbus.service.cmake
> +index 9baf3e9..74a7eac 100644
> +--- a/systemd/dlt-dbus.service.cmake
> ++++ b/systemd/dlt-dbus.service.cmake
> +@@ -20,7 +20,6 @@ Wants=dlt.service
> +
> + [Service]
> + Type=simple
> +-User=@DLT_USER@
> + ExecStart=@CMAKE_INSTALL_PREFIX@/bin/dlt-dbus
> + WatchdogSec=@DLT_WatchdogSec@
> + NotifyAccess=main
> +diff --git a/systemd/dlt-example-user.service.cmake b/systemd/dlt-example-user.service.cmake
> +index 2f300ec..b1aef07 100644
> +--- a/systemd/dlt-example-user.service.cmake
> ++++ b/systemd/dlt-example-user.service.cmake
> +@@ -19,6 +19,5 @@ Wants=dlt.service
> +
> + [Service]
> + Type=simple
> +-User=@DLT_USER@
> + ExecStart=@CMAKE_INSTALL_PREFIX@/bin/dlt-example-user "Hallo from GENIVI DLT example user application"
> +-LimitCORE=infinity
> +\ No newline at end of file
> ++LimitCORE=infinity
> +diff --git a/systemd/dlt-receive.service.cmake b/systemd/dlt-receive.service.cmake
> +index dd53ab7..a68aad2 100644
> +--- a/systemd/dlt-receive.service.cmake
> ++++ b/systemd/dlt-receive.service.cmake
> +@@ -20,6 +20,5 @@ Wants=dlt.service
> +
> + [Service]
> + Type=simple
> +-User=@DLT_USER@
> + ExecStart=@CMAKE_INSTALL_PREFIX@/bin/dlt-receive -o /tmp/dlt_receive_log.dlt localhost
> +-LimitCORE=infinity
> +\ No newline at end of file
> ++LimitCORE=infinity
> +diff --git a/systemd/dlt-system.service.cmake b/systemd/dlt-system.service.cmake
> +index 7dfada0..ef6e319 100755
> +--- a/systemd/dlt-system.service.cmake
> ++++ b/systemd/dlt-system.service.cmake
> +@@ -20,7 +20,6 @@ Wants=dlt.service
> +
> + [Service]
> + Type=simple
> +-User=@DLT_USER@
> + ExecStart=@CMAKE_INSTALL_PREFIX@/bin/dlt-system
> + WatchdogSec=@DLT_WatchdogSec@
> + NotifyAccess=main
> +diff --git a/systemd/dlt.service.cmake b/systemd/dlt.service.cmake
> +index 920c81f..5480cbe 100755
> +--- a/systemd/dlt.service.cmake
> ++++ b/systemd/dlt.service.cmake
> +@@ -19,7 +19,6 @@ Documentation=man:dlt-daemon(1) man:dlt.conf(5)
> +
> + [Service]
> + Type=simple
> +-User=@DLT_USER@
> + ExecStart=@CMAKE_INSTALL_PREFIX@/bin/dlt-daemon
> + WatchdogSec=@DLT_WatchdogSec@
> + NotifyAccess=main
> diff --git a/meta-oe/recipes-devtools/dlt-daemon/dlt-daemon/0004-Modify-systemd-config-directory.patch b/meta-oe/recipes-devtools/dlt-daemon/dlt-daemon/0004-Modify-systemd-config-directory.patch
> new file mode 100644
> index 000000000..4e9e3ce43
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/dlt-daemon/dlt-daemon/0004-Modify-systemd-config-directory.patch
> @@ -0,0 +1,25 @@
> +From 859e566b0ce6f791629704a5786be23489dc573f Mon Sep 17 00:00:00 2001
> +From: Andrei Gherzan <andrei.gherzan@windriver.com>
> +Date: Tue, 18 Nov 2014 15:51:30 +0100
> +Subject: [PATCH] Modify systemd config directory
> +
> +Upstream-Status: Inappropriate [Configuration Specific]
> +Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
> +
> +---
> + CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 845d269..52a00ed 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -200,7 +200,7 @@ if(WITH_SYSTEMD OR WITH_SYSTEMD_WATCHDOG OR WITH_SYSTEMD_JOURNAL)
> +
> +     set(systemd_SRCS ${PROJECT_SOURCE_DIR}/systemd/3rdparty/sd-daemon.c)
> +
> +-    set(SYSTEMD_UNITDIR "${CMAKE_INSTALL_PREFIX}/lib/systemd/system" CACHE PATH
> ++    set(SYSTEMD_UNITDIR "/lib/systemd/system" CACHE PATH
> +         "Set directory to install systemd unit files")
> +
> +     add_subdirectory(systemd)
> diff --git a/meta-oe/recipes-devtools/dlt-daemon/dlt-daemon_2.18.4.bb b/meta-oe/recipes-devtools/dlt-daemon/dlt-daemon_2.18.4.bb
> new file mode 100644
> index 000000000..de97ad28a
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/dlt-daemon/dlt-daemon_2.18.4.bb
> @@ -0,0 +1,48 @@
> +SUMMARY = "Diagnostic Log and Trace"
> +DESCRIPTION = "This component provides a standardised log and trace interface, \
> +based on the standardised protocol specified in the AUTOSAR standard 4.0 DLT. \
> +This component can be used by GENIVI components and other applications as \
> +logging facility providing: \
> +- the DLT shared library \
> +- the DLT daemon, including startup scripts \
> +- the DLT daemon adaptors- the DLT client console utilities \
> +- the DLT test applications"
> +HOMEPAGE = "https://www.genivi.org/"
> +SECTION = "console/utils"
> +LICENSE = "MPLv2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=8184208060df880fe3137b93eb88aeea"
> +
> +PR = "r2"

drop PR here

> +
> +DEPENDS = "dbus zlib gzip-native"
> +
> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES','systemd', d)}"
> +PACKAGECONFIG[systemd] = "-DWITH_SYSTEMD=ON,-DWITH_SYSTEMD=OFF,systemd"
> +
> +
> +SRCREV = "14ea971be7e808b9c5099c7f404ed3cf341873c4"
> +SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=https \
> +    file://0002-Don-t-execute-processes-as-a-specific-user.patch \
> +    file://0004-Modify-systemd-config-directory.patch \
> +    "
> +S = "${WORKDIR}/git"
> +
> +inherit autotools gettext cmake systemd
> +
> +PACKAGES += "${PN}-systemd"
> +SYSTEMD_PACKAGES = "${PN} ${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} = "dlt-system.service dlt.service"
> +SYSTEMD_AUTO_ENABLE_${PN} = "enable"
> +SYSTEMD_SERVICE_${PN}-systemd = "dlt-example-user.service \
> +    dlt-dbus.service \
> +    dlt-adaptor-udp.service \
> +    dlt-receive.service"
> +SYSTEMD_AUTO_ENABLE_${PN}-systemd = "disable"
> +
> +EXTRA_OECMAKE += "-DWITH_DLT_DBUS=ON -DWITH_DLT_SYSTEM=ON -DWITH_DLT_ADAPTOR=ON"
> +
> +FILES_${PN}-doc += "/usr/share/dlt-filetransfer"
> +
> +do_install_append() {
> +   rm -f ${D}${bindir}/dlt-test-*
> +}
> 


