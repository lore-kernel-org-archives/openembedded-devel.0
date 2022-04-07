Return-Path: <stefan@datenfreihafen.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A748C35280
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 15:41:14 +0000 (UTC)
Received: from proxima.lasnet.de (proxima.lasnet.de [78.47.171.185])
 by mx.groups.io with SMTP id smtpd.web10.3646.1649315035039986726
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Apr 2022 00:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@datenfreihafen.org header.s=2021 header.b=FdjZrJ6E;
 spf=pass (domain: datenfreihafen.org, ip: 78.47.171.185,
 mailfrom: stefan@datenfreihafen.org)
Received: from [IPV6:2003:e9:d71c:2746:5cff:fb2d:7c4f:9]
 (p200300e9d71c27465cfffb2d7c4f0009.dip0.t-ipconnect.de
 [IPv6:2003:e9:d71c:2746:5cff:fb2d:7c4f:9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: stefan@datenfreihafen.org)
	by proxima.lasnet.de (Postfix) with ESMTPSA id 7060BC05DE;
	Thu,  7 Apr 2022 09:03:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=datenfreihafen.org;
	s=2021; t=1649315031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fd7Q8hL983RpFxyrMMCkjCJIuk72urO3w6URZvnWD/k=;
	b=FdjZrJ6EDBucCkwzhvM/U5NRAFFLjPYHa/bn3Xb1tZaIuu1dUg4uPhvMDyJTIWUJE98k9u
	NyKNBwrmt1zhPRkP3f8B71PJXWvKZtVARGyA17h+fNBC2C+Mh0RXXnusRWTPMQvSdxesIm
	iCb9lmWOA7/rh/z6zgiAxY3I1HPKcoIh8kwTiFpg+4dIEqCGs6FYUyBo/d8U7tr5M+p14q
	J7Kg7SLPbohk2Mz0ZPXKDN5S3MTrhacivUXT6qpjaO7UP+5fKI6vv4u83xE0cRX3BBGn3L
	malsxpfSsI8ZbE9ZD03l+5GkDcn27l7GtitpRjTKlAcqgelzTvTjeK3jEOu85w==
Message-ID: <d436dd22-671d-abc7-e44f-94329f1d7014@datenfreihafen.org>
Date: Thu, 7 Apr 2022 09:03:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] [meta-networking][PATCH v2 1/4] ot-br-posix: add recipe for
 an OpenThread Border Router
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
 Stefan Schmidt <stefan.schmidt@huawei.com>
References: <20220405091219.1593707-1-stefan@datenfreihafen.org>
 <CAMKF1sqXOTFTJiNTg5zYebfFDm8JL=OeorNQDY+N_hBo=TAn-Q@mail.gmail.com>
From: Stefan Schmidt <stefan@datenfreihafen.org>
In-Reply-To: 
 <CAMKF1sqXOTFTJiNTg5zYebfFDm8JL=OeorNQDY+N_hBo=TAn-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Apr 2022 15:41:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96447

Hello Khem.

On 07.04.22 02:20, Khem Raj wrote:
> still fails to build
> 
> https://errors.yoctoproject.org/Errors/Details/654012/

Sigh, sorry for this.

Its a different recipe than the first one that failed.
I will sit down and try to figure out why I am not seeing any of the 
problems in my local builds. Need to check the autobuilder configs.

regards
Stefan Schmidt

> 
> On Tue, Apr 5, 2022 at 5:12 AM Stefan Schmidt <stefan@datenfreihafen.org> wrote:
>>
>> From: Stefan Schmidt <stefan.schmidt@huawei.com>
>>
>> The OpenThread project is an open source implementation of the Thread
>> low-power mesh network protocol. In a Thread network devices can have
>> different roles, and of of these roles is a Border Router that allows a
>> Thread network to be connected with other IP networks.
>>
>> Ot-br-posix runs as a systemd service on a standard Linux system to
>> handle the connection to a Thread network.
>>
>> The small musl compile fix has been submitted upstream and is pending
>> while the systemd unit file change is OE specific and avoids having
>> service dependencies implemented as pre exec hooks.
>>
>> Signed-off-by: Stefan Schmidt <stefan.schmidt@huawei.com>
>> ---
>> v2:
>> - Upstream status of one patch changed from pending to submitted
>>
>>   ...ce.in-remove-pre-exec-hook-for-mdns-.patch | 35 +++++++++++
>>   ...lient-add-needed-header-for-fd_set-c.patch | 27 +++++++++
>>   .../openthread/ot-br-posix_git.bb             | 59 +++++++++++++++++++
>>   3 files changed, 121 insertions(+)
>>   create mode 100644 meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-otbr-agent.service.in-remove-pre-exec-hook-for-mdns-.patch
>>   create mode 100644 meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-web-service-ot-client-add-needed-header-for-fd_set-c.patch
>>   create mode 100644 meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
>>
>> diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-otbr-agent.service.in-remove-pre-exec-hook-for-mdns-.patch b/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-otbr-agent.service.in-remove-pre-exec-hook-for-mdns-.patch
>> new file mode 100644
>> index 000000000..250de4bdd
>> --- /dev/null
>> +++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-otbr-agent.service.in-remove-pre-exec-hook-for-mdns-.patch
>> @@ -0,0 +1,35 @@
>> +From ed60d4605b81c43b9ba9504a37835109c247c6f8 Mon Sep 17 00:00:00 2001
>> +From: Stefan Schmidt <stefan.schmidt@huawei.com>
>> +Date: Fri, 1 Apr 2022 21:46:03 +0200
>> +Subject: [PATCH] otbr-agent.service.in: remove pre exec hook for mdns service
>> +
>> +It uses the service command which is not available in all cases under
>> +Yocto/OE. The upstream project uses this mainly with Ubuntu and Raspian
>> +as testbeds.
>> +
>> +In our case we simply ensure that avahi-daemon is installed on the
>> +system inside the recipe.
>> +
>> +Upstream-Status: Inappropriate [OE specific]
>> +
>> +Signed-off-by: Stefan Schmidt <stefan.schmidt@huawei.com>
>> +---
>> + src/agent/otbr-agent.service.in | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/src/agent/otbr-agent.service.in b/src/agent/otbr-agent.service.in
>> +index 8314121347..4c97869def 100644
>> +--- a/src/agent/otbr-agent.service.in
>> ++++ b/src/agent/otbr-agent.service.in
>> +@@ -6,7 +6,7 @@ After=dbus.socket
>> +
>> + [Service]
>> + EnvironmentFile=-@CMAKE_INSTALL_FULL_SYSCONFDIR@/default/otbr-agent
>> +-@EXEC_START_PRE@ExecStart=@CMAKE_INSTALL_FULL_SBINDIR@/otbr-agent $OTBR_AGENT_OPTS
>> ++ExecStart=@CMAKE_INSTALL_FULL_SBINDIR@/otbr-agent $OTBR_AGENT_OPTS
>> + KillMode=mixed
>> + Restart=on-failure
>> + RestartSec=5
>> +--
>> +2.35.1
>> +
>> diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-web-service-ot-client-add-needed-header-for-fd_set-c.patch b/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-web-service-ot-client-add-needed-header-for-fd_set-c.patch
>> new file mode 100644
>> index 000000000..29f2af849
>> --- /dev/null
>> +++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-web-service-ot-client-add-needed-header-for-fd_set-c.patch
>> @@ -0,0 +1,27 @@
>> +From 596eb2b582609794d87f2dbefa4b2e839faf52c8 Mon Sep 17 00:00:00 2001
>> +From: Stefan Schmidt <stefan.schmidt@huawei.com>
>> +Date: Fri, 28 May 2021 14:19:53 +0200
>> +Subject: [PATCH] web-service/ot-client: add needed header for fd_set() call
>> +
>> +The select.h header file is needed for fd_set(). Depending on the
>> +compiler and settings this will result in an error when not included.
>> +
>> +Upstream-Status: Submitted [https://github.com/openthread/ot-br-posix/pull/1326]
>> +
>> +Signed-off-by: Stefan Schmidt <stefan.schmidt@huawei.com>
>> +---
>> + src/web/web-service/ot_client.cpp | 1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/src/web/web-service/ot_client.cpp b/src/web/web-service/ot_client.cpp
>> +index f151a0126..173cc48e1 100644
>> +--- a/src/web/web-service/ot_client.cpp
>> ++++ b/src/web/web-service/ot_client.cpp
>> +@@ -39,6 +39,7 @@
>> + #include <string.h>
>> + #include <sys/socket.h>
>> + #include <sys/un.h>
>> ++#include <sys/select.h>
>> + #include <unistd.h>
>> +
>> + #include "common/code_utils.hpp"
>> diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
>> new file mode 100644
>> index 000000000..5247ad4db
>> --- /dev/null
>> +++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
>> @@ -0,0 +1,59 @@
>> +# SPDX-FileCopyrightText: Huawei Inc.
>> +#
>> +# SPDX-License-Identifier: Apache-2.0
>> +SUMMARY = "OpenThread Border Router"
>> +SECTION = "net"
>> +LICENSE = "BSD-3-Clause & MIT"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=87109e44b2fda96a8991f27684a7349c \
>> +                    file://third_party/Simple-web-server/repo/LICENSE;md5=852b3f7f320b19f6431487b8b2fb1d74 \
>> +                    file://third_party/cJSON/repo/LICENSE;md5=218947f77e8cb8e2fa02918dc41c50d0 \
>> +                    file://third_party/http-parser/repo/LICENSE-MIT;md5=9bfa835d048c194ab30487af8d7b3778 \
>> +                    file://third_party/openthread/repo/LICENSE;md5=543b6fe90ec5901a683320a36390c65f \
>> +                    "
>> +DEPENDS = "autoconf-archive dbus readline avahi jsoncpp boost libnetfilter-queue"
>> +SRCREV = "9ef4e310b05ca0dbecb549e92ce7caa9d7461f19"
>> +PV = "0.3.0+git${SRCPV}"
>> +
>> +SRC_URI = "gitsm://github.com/openthread/ot-br-posix.git;protocol=https;branch=main \
>> +           file://0001-web-service-ot-client-add-needed-header-for-fd_set-c.patch \
>> +           file://0001-otbr-agent.service.in-remove-pre-exec-hook-for-mdns-.patch \
>> +           "
>> +
>> +S = "${WORKDIR}/git"
>> +SYSTEMD_SERVICE:${PN} = "otbr-agent.service"
>> +
>> +inherit pkgconfig cmake systemd
>> +
>> +EXTRA_OECMAKE = "-DBUILD_TESTING=OFF \
>> +                 -DOTBR_DBUS=ON \
>> +                 -DOTBR_REST=ON \
>> +                 -DOTBR_WEB=OFF \
>> +                 -DCMAKE_LIBRARY_PATH=${libdir} \
>> +                 -DOTBR_MDNS=avahi \
>> +                 -DOTBR_BACKBONE_ROUTER=ON \
>> +                 -DOTBR_BORDER_ROUTING=ON \
>> +                 -DOTBR_SRP_ADVERTISING_PROXY=ON \
>> +                 -DOTBR_BORDER_AGENT=ON \
>> +                 -DOT_SPINEL_RESET_CONNECTION=ON \
>> +                 -DOT_TREL=ON \
>> +                 -DOT_MLR=ON \
>> +                 -DOT_SRP_SERVER=ON \
>> +                 -DOT_ECDSA=ON \
>> +                 -DOT_SERVICE=ON \
>> +                 -DOTBR_DUA_ROUTING=ON \
>> +                 -DOT_DUA=ON \
>> +                 -DOT_BORDER_ROUTING_NAT64=ON \
>> +                 -DOTBR_DNSSD_DISCOVERY_PROXY=ON \
>> +                 -DOTBR_INFRA_IF_NAME=eth0 \
>> +                 -DOTBR_NO_AUTO_ATTACH=1 \
>> +                 -DOT_REFERENCE_DEVICE=ON \
>> +                 -DOT_DHCP6_CLIENT=ON \
>> +                 -DOT_DHCP6_SERVER=ON \
>> +                 "
>> +
>> +RDEPENDS:${PN} = "iproute2 avahi-daemon"
>> +
>> +RCONFLICTS:${PN} = "ot-daemon"
>> +
>> +FILES:${PN} += "${systemd_unitdir}/*"
>> +FILES:${PN} += "${datadir}/*"
>> --
>> 2.35.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#96421): https://lists.openembedded.org/g/openembedded-devel/message/96421
>> Mute This Topic: https://lists.openembedded.org/mt/90261621/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

