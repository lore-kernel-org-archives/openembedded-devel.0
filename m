Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2812D7D44D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Apr 2019 02:23:28 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id w30so18004604qta.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Apr 2019 19:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=UT700lJMlEtX0kPENZ8uwIJBPShczjScotEgZDtrwVQ=;
	b=Uiy7PK7RGjGOQ5PxKFg5qtP60abxRHnJIiTUwZtGpwBKyoX0TfrTFiGzCUQ6pNQP7/
	7gO0aHv5+A6DT+MhEzWiLdNHQZirkJiFp2avWB+gEcBrWgHszciTWGeH/Zur7Wh06l3H
	MsJCBgpBiLahibC3yfzqub9Jjqn2yCLcIXsQZtS/4WotP4GQwqBLByK9ppFlkSevPuq0
	creXHMUks0yjPz+SWg8TbU6lFFd2obN/SdjVnoCXCp8Mft7YtSFAI2X4BuXYCGMDEoDz
	h0LLXb1+ZOO46gHG8XYXZzzEO6WYaCYXEweJ0l83rUmfTxragMdUbCQj3N0yNVEaHs3H
	1KCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=UT700lJMlEtX0kPENZ8uwIJBPShczjScotEgZDtrwVQ=;
	b=j7qLn1447wiqovNRGVbuz64/XkjybAtOqPEaPY4w23586QQPJNiUUdaAPyh8PkPG6J
	wsEG8MkhSKwUq12+yau09m3bOK2vdRS3xTb0AkL9WfNxyanOZIdQI6g3THUiM9Ora8we
	xQ0NTVbULb1M2sGpbmFxGsa1Iu6FV6cqb1LCrWr27Be/6EzX9aCUp+vEWpZwZa5Aa+uL
	FQcjWBFJqZZfGaLbetBOYI7fzQBJww1jR6O/jFnBXfEcSz9IXcBt8KDXmyIQrU27ggxP
	1mQKF2yDip7k/jHPy8fDgdWioq/Gt4xb/TWcu2DacRTRT47nm4+N65PwMNiO0bz+ifgf
	iZmQ==
X-Gm-Message-State: APjAAAWW5PCCjnq/mLUMce2PpaZIJIDGmL77+FP/iaQuM4Uis9L6T0wW
	MsuU+G3PED9fIBaNrK0f8bTMqGjh+1XErFHR1Mw=
X-Google-Smtp-Source: APXvYqxH6C4qhS97l+tOWGZ+MqMn74XsGs5duC10N0WEQk9zuhU7NsRv8OHn2diQNRvQBd1a6Aoapgt0F4XzrTAymv8=
X-Received: by 2002:ac8:1846:: with SMTP id n6mr26877482qtk.262.1554776608728; 
	Mon, 08 Apr 2019 19:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190408224258.1744-1-schnitzeltony@gmail.com>
	<20190408224258.1744-6-schnitzeltony@gmail.com>
In-Reply-To: <20190408224258.1744-6-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Apr 2019 19:23:02 -0700
Message-ID: <CAMKF1soiU=idpjn_LUf8AEvinZqjDHQX8y8i6z4ALMg12kKZVw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 5/5] networkmanager: rework musl patches
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
X-List-Received-Date: Tue, 09 Apr 2019 02:23:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 8, 2019 at 3:44 PM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>
> * Split out systemd specifics
> * Simplfy patch to fix musl / linux-libc-header definition conflicts. Thi=
s makes
>   future maintenance less pain and fixes build for recipes depending on
>   networkmanager.
>
> For further background read patch description in 0002-Fix-build-with-musl=
.patch
>
> Build tested with all dependents found in my layers:
>
> * network-manager-applet
> * networkmanager-openvpn
> * python-networkmanager
> * networkmanager-qt
> * plasma-nm
> * liri-networkmanager
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  ...ix-build-with-musl-systemd-specific.patch} | 196 ++----------------
>  .../musl/0002-Fix-build-with-musl.patch       | 118 +++++++++++
>  .../networkmanager/networkmanager_1.16.0.bb   |   7 +-
>  3 files changed, 135 insertions(+), 186 deletions(-)
>  rename meta-networking/recipes-connectivity/networkmanager/networkmanage=
r/musl/{0001-Fix-build-with-musl.patch =3D> 0001-Fix-build-with-musl-system=
d-specific.patch} (51%)
>  create mode 100644 meta-networking/recipes-connectivity/networkmanager/n=
etworkmanager/musl/0002-Fix-build-with-musl.patch
>
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager/musl/0001-Fix-build-with-musl.patch b/meta-networking/recipes-connec=
tivity/networkmanager/networkmanager/musl/0001-Fix-build-with-musl-systemd-=
specific.patch
> similarity index 51%
> rename from meta-networking/recipes-connectivity/networkmanager/networkma=
nager/musl/0001-Fix-build-with-musl.patch
> rename to meta-networking/recipes-connectivity/networkmanager/networkmana=
ger/musl/0001-Fix-build-with-musl-systemd-specific.patch
> index b3f93ff92..accd2f256 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/=
musl/0001-Fix-build-with-musl.patch
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/=
musl/0001-Fix-build-with-musl-systemd-specific.patch
> @@ -1,75 +1,26 @@
> -From f43c9a5b07832a91383e59d655bc3c8a9f48c451 Mon Sep 17 00:00:00 2001
> +From 7b09945585e6ce65049fa4039f26caee8daa44b9 Mon Sep 17 00:00:00 2001
>  From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
>  Date: Tue, 2 Apr 2019 01:34:35 +0200
> -Subject: [PATCH] Fix build with musl
> +Subject: [PATCH 1/2] Fix build with musl - systemd specific
>  MIME-Version: 1.0
>  Content-Type: text/plain; charset=3DUTF-8
>  Content-Transfer-Encoding: 8bit
>
> +Networkmanager imported some code from systemd. This requires some adjus=
tments
> +for musl.
> +
>  Upstream-Status: Pending
>
>  Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>  ---
> - clients/cli/connections.c                    |  1 -
> - libnm-core/nm-utils.c                        |  2 +-
> - shared/n-acd/src/n-acd.c                     |  1 -
> - shared/systemd/src/basic/in-addr-util.c      |  1 +
> - shared/systemd/src/basic/process-util.c      |  9 ++++++
> - shared/systemd/src/basic/socket-util.h       |  6 ++++
> - shared/systemd/src/basic/stdio-util.h        |  2 ++
> - shared/systemd/src/basic/string-util.h       |  5 ++++
> - shared/systemd/src/basic/util.h              | 29 ++++----------------
> - src/platform/wifi/nm-wifi-utils.h            |  4 +++
> - src/platform/wpan/nm-wpan-utils.h            |  2 --
> - src/settings/nm-settings-connection.h        |  2 --
> - src/systemd/src/libsystemd-network/sd-lldp.c |  1 +
> - src/systemd/src/systemd/sd-dhcp-client.h     |  2 ++
> - src/systemd/src/systemd/sd-dhcp-lease.h      |  2 ++
> - src/systemd/src/systemd/sd-dhcp6-client.h    |  2 ++
> - src/systemd/src/systemd/sd-ipv4ll.h          |  2 ++
> - src/systemd/src/systemd/sd-lldp.h            |  2 +-
> - 19 files changed, 44 insertions(+), 32 deletions(-)
> + shared/systemd/src/basic/in-addr-util.c |  1 +
> + shared/systemd/src/basic/process-util.c |  9 ++++++++
> + shared/systemd/src/basic/socket-util.h  |  6 +++++
> + shared/systemd/src/basic/stdio-util.h   |  2 ++
> + shared/systemd/src/basic/string-util.h  |  5 +++++
> + shared/systemd/src/basic/util.h         | 29 +++++--------------------
> + 6 files changed, 28 insertions(+), 24 deletions(-)
>
> -diff --git a/clients/cli/connections.c b/clients/cli/connections.c
> -index 6db44f8..36e51cc 100644
> ---- a/clients/cli/connections.c
> -+++ b/clients/cli/connections.c
> -@@ -25,7 +25,6 @@
> - #include <stdlib.h>
> - #include <unistd.h>
> - #include <signal.h>
> --#include <netinet/ether.h>
> - #include <readline/readline.h>
> - #include <readline/history.h>
> - #include <fcntl.h>
> -diff --git a/libnm-core/nm-utils.c b/libnm-core/nm-utils.c
> -index d276cfe..2aec785 100644
> ---- a/libnm-core/nm-utils.c
> -+++ b/libnm-core/nm-utils.c
> -@@ -21,10 +21,10 @@
> -
> - #include "nm-default.h"
> -
> -+#include <netinet/ether.h>
> - #include "nm-utils.h"
> -
> - #include <stdlib.h>
> --#include <netinet/ether.h>
> - #include <arpa/inet.h>
> - #include <uuid/uuid.h>
> - #include <libintl.h>
> -diff --git a/shared/n-acd/src/n-acd.c b/shared/n-acd/src/n-acd.c
> -index def56a2..dd4eb78 100644
> ---- a/shared/n-acd/src/n-acd.c
> -+++ b/shared/n-acd/src/n-acd.c
> -@@ -11,7 +11,6 @@
> - #include <inttypes.h>
> - #include <limits.h>
> - #include <linux/if_packet.h>
> --#include <netinet/if_ether.h>
> - #include <netinet/in.h>
> - #include <stdlib.h>
> - #include <string.h>
>  diff --git a/shared/systemd/src/basic/in-addr-util.c b/shared/systemd/sr=
c/basic/in-addr-util.c
>  index 5ced350..c6b52b8 100644
>  --- a/shared/systemd/src/basic/in-addr-util.c
> @@ -223,129 +174,6 @@ index dc33d66..cc768e9 100644
>   /* Normal memcpy requires src to be nonnull. We do nothing if n is 0. *=
/
>   static inline void memcpy_safe(void *dst, const void *src, size_t n) {
>           if (n =3D=3D 0)
> -diff --git a/src/platform/wifi/nm-wifi-utils.h b/src/platform/wifi/nm-wi=
fi-utils.h
> -index 36148b5..d282eb2 100644
> ---- a/src/platform/wifi/nm-wifi-utils.h
> -+++ b/src/platform/wifi/nm-wifi-utils.h
> -@@ -22,7 +22,11 @@
> - #ifndef __WIFI_UTILS_H__
> - #define __WIFI_UTILS_H__
> -
> -+#if defined(__GLIBC__)
> - #include <net/ethernet.h>
> -+#else /* musl libc */
> -+#define ETH_ALEN      6               /* Octets in one ethernet addr   =
*/
> -+#endif
> -
> - #include "nm-dbus-interface.h"
> - #include "nm-setting-wireless.h"
> -diff --git a/src/platform/wpan/nm-wpan-utils.h b/src/platform/wpan/nm-wp=
an-utils.h
> -index 1b54ec4..ed39938 100644
> ---- a/src/platform/wpan/nm-wpan-utils.h
> -+++ b/src/platform/wpan/nm-wpan-utils.h
> -@@ -20,8 +20,6 @@
> - #ifndef __WPAN_UTILS_H__
> - #define __WPAN_UTILS_H__
> -
> --#include <net/ethernet.h>
> --
> - #include "nm-dbus-interface.h"
> - #include "platform/nm-netlink.h"
> -
> -diff --git a/src/settings/nm-settings-connection.h b/src/settings/nm-set=
tings-connection.h
> -index e796b71..c01fef6 100644
> ---- a/src/settings/nm-settings-connection.h
> -+++ b/src/settings/nm-settings-connection.h
> -@@ -22,8 +22,6 @@
> - #ifndef __NETWORKMANAGER_SETTINGS_CONNECTION_H__
> - #define __NETWORKMANAGER_SETTINGS_CONNECTION_H__
> -
> --#include <net/ethernet.h>
> --
> - #include "nm-dbus-object.h"
> - #include "nm-connection.h"
> -
> -diff --git a/src/systemd/src/libsystemd-network/sd-lldp.c b/src/systemd/=
src/libsystemd-network/sd-lldp.c
> -index 741128e..62914ae 100644
> ---- a/src/systemd/src/libsystemd-network/sd-lldp.c
> -+++ b/src/systemd/src/libsystemd-network/sd-lldp.c
> -@@ -3,6 +3,7 @@
> - #include "nm-sd-adapt-core.h"
> -
> - #include <arpa/inet.h>
> -+#include <net/ethernet.h>
> - #include <linux/sockios.h>
> - #include <sys/ioctl.h>
> -
> -diff --git a/src/systemd/src/systemd/sd-dhcp-client.h b/src/systemd/src/=
systemd/sd-dhcp-client.h
> -index bd0d429..c935fe1 100644
> ---- a/src/systemd/src/systemd/sd-dhcp-client.h
> -+++ b/src/systemd/src/systemd/sd-dhcp-client.h
> -@@ -20,7 +20,9 @@
> - ***/
> -
> - #include <inttypes.h>
> -+#if defined(__GLIBC__)
> - #include <net/ethernet.h>
> -+#endif
> - #include <netinet/in.h>
> - #include <sys/types.h>
> - #include <stdbool.h>
> -diff --git a/src/systemd/src/systemd/sd-dhcp-lease.h b/src/systemd/src/s=
ystemd/sd-dhcp-lease.h
> -index d299c79..991e67e 100644
> ---- a/src/systemd/src/systemd/sd-dhcp-lease.h
> -+++ b/src/systemd/src/systemd/sd-dhcp-lease.h
> -@@ -19,7 +19,9 @@
> - ***/
> -
> - #include <inttypes.h>
> -+#if defined(__GLIBC__)
> - #include <net/ethernet.h>
> -+#endif
> - #include <netinet/in.h>
> - #include <sys/types.h>
> -
> -diff --git a/src/systemd/src/systemd/sd-dhcp6-client.h b/src/systemd/src=
/systemd/sd-dhcp6-client.h
> -index 43d38f5..57ab487 100644
> ---- a/src/systemd/src/systemd/sd-dhcp6-client.h
> -+++ b/src/systemd/src/systemd/sd-dhcp6-client.h
> -@@ -20,7 +20,9 @@
> - ***/
> -
> - #include <inttypes.h>
> -+#if defined(__GLIBC__)
> - #include <net/ethernet.h>
> -+#endif
> - #include <sys/types.h>
> -
> - #include "sd-dhcp6-lease.h"
> -diff --git a/src/systemd/src/systemd/sd-ipv4ll.h b/src/systemd/src/syste=
md/sd-ipv4ll.h
> -index 71bd4cf..1c667ba 100644
> ---- a/src/systemd/src/systemd/sd-ipv4ll.h
> -+++ b/src/systemd/src/systemd/sd-ipv4ll.h
> -@@ -19,7 +19,9 @@
> -   along with systemd; If not, see <http://www.gnu.org/licenses/>.
> - ***/
> -
> -+#if defined(__GLIBC__)
> - #include <net/ethernet.h>
> -+#endif
> - #include <netinet/in.h>
> -
> - #include "sd-event.h"
> -diff --git a/src/systemd/src/systemd/sd-lldp.h b/src/systemd/src/systemd=
/sd-lldp.h
> -index bf3afad..4cace87 100644
> ---- a/src/systemd/src/systemd/sd-lldp.h
> -+++ b/src/systemd/src/systemd/sd-lldp.h
> -@@ -18,7 +18,7 @@
> - ***/
> -
> - #include <inttypes.h>
> --#include <net/ethernet.h>
> -+//#include <net/ethernet.h>
> - #include <sys/types.h>
> -
> - #include "sd-event.h"
>  --
>  2.20.1
>
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager/musl/0002-Fix-build-with-musl.patch b/meta-networking/recipes-connec=
tivity/networkmanager/networkmanager/musl/0002-Fix-build-with-musl.patch
> new file mode 100644
> index 000000000..25f9a4a00
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/=
musl/0002-Fix-build-with-musl.patch
> @@ -0,0 +1,118 @@
> +From 0b0f2d5abe27b2c9587f449795f0ae3568fc3e38 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
> +Date: Mon, 8 Apr 2019 23:10:43 +0200
> +Subject: [PATCH 2/2] Fix build with musl
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The build issues caused by definition conflicts musl vs linux-libc heade=
rs
> +(error: redefinition of ...) can be reduced to two headers:
> +
> +1. netinet/if_ether.h <-> linux/if_ether.h: linux-libc header plays well=
 with
> +   glibc and musl headers in case libc's variant (netinet/if_ether.h) is
> +   included BEFORE linux variant [1]. We add include at two positions:
> +   1. shared/nm-default.h: This is a global which used for networkmanage=
r and
> +      is included at the very beginning of all c-files.
> +   2. libnm-core/nm-utils.h: This file makes it into installation and is=
 used
> +      by dependent packages as network-manager-applet
> +2. net/if_arp. <-> linux/if_ether.h: linux-libc: Unfortunaly these files=
 do
> +   not play together in harmony. Therefore the libc variant is included =
early in
> +   shared/nm-default.h and occurances linux/if_arp.h are removed.
> +
> +Note:
> +Be aware that this is still nasty business: We have to trust that musl h=
eaders
> +define same signatures as linux would do - just because musl-makers cons=
ider
> +linux-libc headers 'notoriously broken for userspace' [2] (search for
> +'error: redefinition of').
> +
> +[1] http://lists.openembedded.org/pipermail/openembedded-core/2019-March=
/280440.html
> +[2] https://wiki.musl-libc.org/faq.html
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +---
> + clients/tui/nmt-device-entry.c   | 1 -
> + libnm-core/nm-utils.h            | 4 ++++
> + shared/nm-default.h              | 3 +++
> + src/devices/nm-device.c          | 2 +-
> + src/platform/nm-linux-platform.c | 1 -
> + 5 files changed, 8 insertions(+), 3 deletions(-)
> +
> +diff --git a/clients/tui/nmt-device-entry.c b/clients/tui/nmt-device-ent=
ry.c
> +index 43fbbc1..3eae286 100644
> +--- a/clients/tui/nmt-device-entry.c
> ++++ b/clients/tui/nmt-device-entry.c
> +@@ -39,7 +39,6 @@
> + #include "nmt-device-entry.h"
> +
> + #include <sys/socket.h>
> +-#include <linux/if_arp.h>
> +
> + #include "nmtui.h"
> +
> +diff --git a/libnm-core/nm-utils.h b/libnm-core/nm-utils.h
> +index 2b5baba..8a50131 100644
> +--- a/libnm-core/nm-utils.h
> ++++ b/libnm-core/nm-utils.h
> +@@ -25,6 +25,10 @@
> + #error "Only <NetworkManager.h> can be included directly."
> + #endif
> +
> ++/* include as early as possible for musl */
> ++#include <netinet/if_ether.h>
> ++/* #include <net/if_arp.h> - uncoment for broken dependents?? */
> ++
> + #include <glib.h>
> +
> + #include <netinet/in.h>
> +diff --git a/shared/nm-default.h b/shared/nm-default.h
> +index 26d6476..b29e8af 100644
> +--- a/shared/nm-default.h
> ++++ b/shared/nm-default.h
> +@@ -211,6 +211,9 @@
> + #endif
> +
> + #include <stdlib.h>
> ++/* include as early as possible for musl */
> ++#include <netinet/if_ether.h>
> ++#include <net/if_arp.h>
> +
> + /**********************************************************************=
*******/
> +
> +diff --git a/src/devices/nm-device.c b/src/devices/nm-device.c
> +index 7514fa7..d305fa5 100644
> +--- a/src/devices/nm-device.c
> ++++ b/src/devices/nm-device.c
> +@@ -24,6 +24,7 @@
> + #include "nm-device.h"
> +
> + #include <netinet/in.h>
> ++#include <net/if.h>
> + #include <unistd.h>
> + #include <sys/ioctl.h>
> + #include <signal.h>
> +@@ -32,7 +33,6 @@
> + #include <arpa/inet.h>
> + #include <fcntl.h>
> + #include <linux/if_addr.h>
> +-#include <linux/if_arp.h>
> + #include <linux/rtnetlink.h>
> + #include <linux/pkt_sched.h>
> +
> +diff --git a/src/platform/nm-linux-platform.c b/src/platform/nm-linux-pl=
atform.c
> +index 2f5c75b..d6ca6d9 100644
> +--- a/src/platform/nm-linux-platform.c
> ++++ b/src/platform/nm-linux-platform.c
> +@@ -27,7 +27,6 @@
> + #include <fcntl.h>
> + #include <libudev.h>
> + #include <linux/ip.h>
> +-#include <linux/if_arp.h>
> + #include <linux/if_link.h>
> + #include <linux/if_tun.h>
> + #include <linux/if_tunnel.h>
> +--
> +2.20.1
> +
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager_1.16.0.bb b/meta-networking/recipes-connectivity/networkmanager/netw=
orkmanager_1.16.0.bb
> index 9f57908e9..970782c72 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.16.0.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.16.0.bb
> @@ -28,7 +28,10 @@ SRC_URI =3D " \
>      file://0002-Do-not-create-settings-settings-property-documentati.pat=
ch \
>      file://0003-dlopen-failure.patch \
>  "
> -SRC_URI_append_libc-musl =3D " file://musl/0001-Fix-build-with-musl.patc=
h"
> +SRC_URI_append_libc-musl =3D " \
> +    file://musl/0001-Fix-build-with-musl-systemd-specific.patch \
> +    file://musl/0002-Fix-build-with-musl.patch \
> +"
>
>  SRC_URI[md5sum] =3D "10abacaafb162a67d2942adf03e7e9e4"
>  SRC_URI[sha256sum] =3D "8e962833b6ca03edda1bc57ed6614a7b8c2339531b44acef=
098d05f2324c5d2c"
> @@ -53,7 +56,7 @@ GI_DATA_ENABLED_libc-musl =3D "False"
>  # stolen from https://github.com/voidlinux/void-packages/blob/master/src=
pkgs/NetworkManager/template
>  CFLAGS_libc-musl_append =3D " \

this is wrong,  it should be CFLAGS_append_libc-musl
but I see it builds without these but probably wont run. So while here can =
you
address this ?

>      -DHAVE_SECURE_GETENV -Dsecure_getenv=3Dgetenv \
> -    -D__USE_POSIX199309 -DRTLD_DEEPBIND=3D0 \
> +    -DRTLD_DEEPBIND=3D0 \
>  "
>
>  do_compile_prepend() {
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

