Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id E3A1573123
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 08:08:47 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id v203so1615417vkv.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Sep 2017 01:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9jZjFv7/J9DOE1c0+iwrUmxaSlZauJzXkZ2fJ5Dbnvk=;
	b=sw5G0GQyHzpQHFNiMwn/PC/XPQ8u4L0g8qY2krkz3VKMfaDMs3ACeYinCPNDL1f4Ux
	f1NP9B6RPOPvihOyOUbOyQj1Mjwnh19BFLYgkmsf4+ZxPM1Yg5SvUiYHqT2OJMwQtFCt
	/5//I549fsUAd9NVRDXmTf4yidfyqpKG1sA9mJ6OPULrmSBZH2r1EP0rSHEp0oLWaprK
	37zgmH5TLkLIqYJNstKRO48j33lHZhWm9kSoBKYy3idnS08RYEKuS8C2WTA+MaIs+mdT
	52x/rrWmVay5Z6ztpA0yGRFgJqwDm/cJuX6pqkOgdoByiJZqxSsACV5kc4XSnKCV3kPU
	Qpvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9jZjFv7/J9DOE1c0+iwrUmxaSlZauJzXkZ2fJ5Dbnvk=;
	b=LuziCKGgR/KLNJVcz/cVVMRRSxPt0FaDUYk9ryIUrxPXoIRInCOhFuJ7V7hTtaYvIa
	4J4iZYKjxC4/EtYTHkP0KG1vPpfKzMwEM8T7w9yko4frsD3spVOX5rFRz7daKr3EkFQq
	aiZVA5f9EyM+kmsVMjqBTeejy9DrWNRUQ7psGrT6dXwvK40Pfc+wkIh8d9NIuuGJd+7W
	koq6FVi5hUVuMYYG2v2u+HqAjpyYK/YGCJ7ktgrqI7UbIPkNP487eqSt290X3F4hfPk/
	zw3oOmyKP7jloYICSYUsWk1PnSyEZ8Or/b32tFvtp3iFKnHzLiV0XAMAExxTqXJ2nAWT
	Guww==
X-Gm-Message-State: AHPjjUgkZceFg4EQiBsj0ct24MZ4QOhHZS+m/hA7pg6BuhVV3y1kC88G
	9Sc6ATcECOUvRZxo4SvRVbS5M57LAw==
X-Google-Smtp-Source: ADKCNb5l5MGUc3w4Ss3zyEgtRs7YclAKgWbCG2tQMVvyo2nPQ+eP5k17h9ymSYk8l8B+olCtVLxtHANTPvd64om0SrQ=
X-Received: by 10.31.231.1 with SMTP id e1mr1099276vkh.90.1504685328802; Wed,
	06 Sep 2017 01:08:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.15.69 with HTTP; Wed, 6 Sep 2017 01:08:48 -0700 (PDT)
In-Reply-To: <20170904173420.20442-2-raj.khem@gmail.com>
References: <20170904173420.20442-1-raj.khem@gmail.com>
	<20170904173420.20442-2-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 6 Sep 2017 10:08:48 +0200
Message-ID: <CA+chaQfYV9Ke+uZz+_=iQqsuiG_v1hLeOb+=tdYM7U+XPkO7Nw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH V2 2/2] ndisc6: Fix build with clang and update to latest on git
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
X-List-Received-Date: Wed, 06 Sep 2017 08:08:48 -0000
Content-Type: text/plain; charset="UTF-8"

v2 fetches ok, but fails to build:

http://errors.yoctoproject.org/Errors/Details/155160/

On Mon, Sep 4, 2017 at 7:34 PM, Khem Raj <raj.khem@gmail.com> wrote:

> Change recipe to git and http protocol
> Pass PERL variable to configure
> Add patches to fix VLAIS
> Re-organize structure of recipe
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../0001-replace-VLAIS-with-malloc-free-pair.patch | 124
> +++++++++++++++++++++
>  .../ndisc6/0002-Do-not-undef-_GNU_SOURCE.patch     |  30 +++++
>  .../ndisc6/{ndisc6_1.0.3.bb => ndisc6_git.bb}      |  48 ++++----
>  3 files changed, 180 insertions(+), 22 deletions(-)
>  create mode 100644 meta-networking/recipes-support/ndisc6/ndisc6/0001-
> replace-VLAIS-with-malloc-free-pair.patch
>  create mode 100644 meta-networking/recipes-support/ndisc6/ndisc6/0002-Do-
> not-undef-_GNU_SOURCE.patch
>  rename meta-networking/recipes-support/ndisc6/{ndisc6_1.0.3.bb =>
> ndisc6_git.bb} (86%)
>
> diff --git a/meta-networking/recipes-support/ndisc6/ndisc6/0001-
> replace-VLAIS-with-malloc-free-pair.patch b/meta-networking/recipes-
> support/ndisc6/ndisc6/0001-replace-VLAIS-with-malloc-free-pair.patch
> new file mode 100644
> index 000000000..dc58b5b79
> --- /dev/null
> +++ b/meta-networking/recipes-support/ndisc6/ndisc6/0001-
> replace-VLAIS-with-malloc-free-pair.patch
> @@ -0,0 +1,124 @@
> +From 3a7d5396e633e6c02a4583be7faf3d79d0d33748 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Thu, 31 Aug 2017 11:14:41 -0700
> +Subject: [PATCH 1/2] replace VLAIS with malloc/free pair
> +
> +Makes it compatible with non-gnu compilers
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> +Upstream-Status: Pending
> +
> + src/trace-icmp.c |  7 +++++--
> + src/trace-tcp.c  | 14 ++++++++++----
> + src/trace-udp.c  |  7 +++++--
> + 3 files changed, 20 insertions(+), 8 deletions(-)
> +
> +diff --git a/src/trace-icmp.c b/src/trace-icmp.c
> +index 842938e..c76cb54 100644
> +--- a/src/trace-icmp.c
> ++++ b/src/trace-icmp.c
> +@@ -43,16 +43,19 @@ send_echo_probe (int fd, unsigned ttl, unsigned n,
> size_t plen, uint16_t port)
> +       struct
> +       {
> +               struct icmp6_hdr ih;
> +-              uint8_t payload[plen - sizeof (struct icmp6_hdr)];
> ++              uint8_t *payload;
> +       } packet;
> +       memset (&packet, 0, plen);
> ++      packet.payload = malloc(plen - sizeof (struct icmp6_hdr));
> +
> +       packet.ih.icmp6_type = ICMP6_ECHO_REQUEST;
> +       packet.ih.icmp6_id = htons (getpid ());
> +       packet.ih.icmp6_seq = htons ((ttl << 8) | (n & 0xff));
> +       (void)port;
> +
> +-      return send_payload (fd, &packet.ih, plen, ttl);
> ++      ssize_t ret = send_payload (fd, &packet.ih, plen, ttl);
> ++      free(packet.payload);
> ++      return ret;
> + }
> +
> +
> +diff --git a/src/trace-tcp.c b/src/trace-tcp.c
> +index 940f918..62d22ff 100644
> +--- a/src/trace-tcp.c
> ++++ b/src/trace-tcp.c
> +@@ -54,10 +54,11 @@ send_syn_probe (int fd, unsigned ttl, unsigned n,
> size_t plen, uint16_t port)
> +       struct
> +       {
> +               struct tcphdr th;
> +-              uint8_t payload[plen - sizeof (struct tcphdr)];
> ++              uint8_t *payload;
> +       } packet;
> +
> +       memset (&packet, 0, sizeof (packet));
> ++      packet.payload = malloc(plen - sizeof (struct tcphdr));
> +       packet.th.th_sport = sport;
> +       packet.th.th_dport = port;
> +       packet.th.th_seq = htonl ((ttl << 24) | (n << 16) |
> (uint16_t)getpid ());
> +@@ -65,7 +66,9 @@ send_syn_probe (int fd, unsigned ttl, unsigned n,
> size_t plen, uint16_t port)
> +       packet.th.th_flags = TH_SYN | (ecn ? (TH_ECE | TH_CWR) : 0);
> +       packet.th.th_win = htons (TCP_WINDOW);
> +
> +-      return send_payload (fd, &packet, plen, ttl);
> ++      ssize_t ret = send_payload (fd, &packet, plen, ttl);
> ++      free(packet.payload);
> ++      return ret;
> + }
> +
> +
> +@@ -131,10 +134,11 @@ send_ack_probe (int fd, unsigned ttl, unsigned n,
> size_t plen, uint16_t port)
> +       struct
> +       {
> +               struct tcphdr th;
> +-              uint8_t payload[plen - sizeof (struct tcphdr)];
> ++              uint8_t *payload;
> +       } packet;
> +
> +       memset (&packet, 0, sizeof (packet));
> ++      packet.payload = malloc(plen - sizeof (struct tcphdr));
> +       packet.th.th_sport = sport;
> +       packet.th.th_dport = port;
> +       packet.th.th_ack = htonl ((ttl << 24) | (n << 16) |
> (uint16_t)getpid ());
> +@@ -142,7 +146,9 @@ send_ack_probe (int fd, unsigned ttl, unsigned n,
> size_t plen, uint16_t port)
> +       packet.th.th_flags = TH_ACK;
> +       packet.th.th_win = htons (TCP_WINDOW);
> +
> +-      return send_payload (fd, &packet, plen, ttl);
> ++      ssize_t ret = send_payload (fd, &packet, plen, ttl);
> ++      free(packet.payload);
> ++      return ret;
> + }
> +
> +
> +diff --git a/src/trace-udp.c b/src/trace-udp.c
> +index 4adde6b..a6cbb07 100644
> +--- a/src/trace-udp.c
> ++++ b/src/trace-udp.c
> +@@ -46,9 +46,10 @@ send_udp_probe (int fd, unsigned ttl, unsigned n,
> size_t plen, uint16_t port)
> +       struct
> +       {
> +               struct udphdr uh;
> +-              uint8_t payload[plen - sizeof (struct udphdr)];
> ++              uint8_t *payload;
> +       } packet;
> +       memset (&packet, 0, plen);
> ++      packet.payload = malloc(plen - sizeof (struct udphdr));
> +
> +       (void)n;
> +       packet.uh.uh_sport = sport;
> +@@ -61,7 +62,9 @@ send_udp_probe (int fd, unsigned ttl, unsigned n,
> size_t plen, uint16_t port)
> +       /*if (plen > sizeof (struct udphdr))
> +               packet.payload[0] = (uint8_t)ttl;*/
> +
> +-      return send_payload (fd, &packet, plen, ttl);
> ++      ssize_t ret = send_payload (fd, &packet, plen, ttl);
> ++      free(packet.payload);
> ++      return ret;
> + }
> +
> +
> +--
> +2.14.1
> +
> diff --git a/meta-networking/recipes-support/ndisc6/ndisc6/0002-Do-not-undef-_GNU_SOURCE.patch
> b/meta-networking/recipes-support/ndisc6/ndisc6/0002-Do-
> not-undef-_GNU_SOURCE.patch
> new file mode 100644
> index 000000000..3cc2ba80c
> --- /dev/null
> +++ b/meta-networking/recipes-support/ndisc6/ndisc6/0002-Do-
> not-undef-_GNU_SOURCE.patch
> @@ -0,0 +1,30 @@
> +From 2a50154fbce38fd36be7e14f5cd4a8b03c65c72f Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Thu, 31 Aug 2017 11:15:37 -0700
> +Subject: [PATCH 2/2] Do not undef _GNU_SOURCE
> +
> +There are functions from tcp.h which are under _GNU_SOURCE
> +in musl
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> +Upstream-Status: Pending
> +
> + src/trace-tcp.c | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/src/trace-tcp.c b/src/trace-tcp.c
> +index 62d22ff..380008e 100644
> +--- a/src/trace-tcp.c
> ++++ b/src/trace-tcp.c
> +@@ -21,7 +21,6 @@
> + # include <config.h>
> + #endif
> +
> +-#undef _GNU_SOURCE
> + #define _DEFAULT_SOURCE 1
> +
> + #include <string.h>
> +--
> +2.14.1
> +
> diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.3.bb
> b/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
> similarity index 86%
> rename from meta-networking/recipes-support/ndisc6/ndisc6_1.0.3.bb
> rename to meta-networking/recipes-support/ndisc6/ndisc6_git.bb
> index 6bc0531b9..e1ab3ae76 100644
> --- a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.3.bb
> +++ b/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
> @@ -3,22 +3,32 @@ IPv6 networks, including ndisc6, rdisc6, tcptraceroute6
> and traceroute6."
>  SECTION = "net"
>  HOMEPAGE = "http://www.remlab.net/ndisc6/"
>  LICENSE = "GPL-2.0"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>
> -# The tcptraceroute6 and tracert6 commands depend on rltraceroute6 to
> -# perform the actual trace operation.
> -RDEPENDS_${PN}-tcptraceroute6 = "${PN}-rltraceroute6"
> -RDEPENDS_${PN}-tracert6 = "${PN}-rltraceroute6"
> -RDEPENDS_${PN}-misc += "perl"
> -
> -SRC_URI = "http://www.remlab.net/files/ndisc6/ndisc6-${PV}.tar.bz2 \
> -"
> -SRC_URI[md5sum] = "21afdaa3a5a5c1ce50eb7f2b7d795989"
> -SRC_URI[sha256sum] = "0f41d6caf5f2edc1a12924956ae8b1
> d372e3b426bd7b11eed7d38bc974eec821"
> +PV = "1.0.4+git${SRCPV}"
> +SRCREV = "4c794b5512d23c649def1f94a684225dcbb6ac3e"
> +SRC_URI = "git://git.remlab.net/git/ndisc6.git;protocol=http \
> +           file://0001-replace-VLAIS-with-malloc-free-pair.patch \
> +           file://0002-Do-not-undef-_GNU_SOURCE.patch \
> +           "
>
> -LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> +S = "${WORKDIR}/git"
>
>  inherit autotools gettext
>
> +EXTRA_OECONF += "PERL=${USRBINPATH}/perl"
> +
> +do_configure_prepend() {
> +    ${S}/autogen.sh
> +}
> +
> +do_install_append () {
> +    rm -rf ${D}${localstatedir}
> +    # Enable SUID bit for applications that need it
> +    chmod 4555 ${D}${bindir}/rltraceroute6
> +    chmod 4555 ${D}${bindir}/ndisc6
> +    chmod 4555 ${D}${bindir}/rdisc6
> +}
>  ALLOW_EMPTY_${PN} = "1"
>
>  # Split into seperate packages since we normal don't want them all
> @@ -49,15 +59,9 @@ or IPv4."
>  DESCRITPION_${PN}-rdnssd       = "Daemon to autoconfigure the list of DNS
> \
>  servers through slateless IPv6 autoconfiguration."
>
> -# We do not run perl during the build, but only use it on the target.
> -do_configure_prepend() {
> -    export PERL="/usr/bin/perl"
> -}
> +# The tcptraceroute6 and tracert6 commands depend on rltraceroute6 to
> +# perform the actual trace operation.
> +RDEPENDS_${PN}-tcptraceroute6 = "${PN}-rltraceroute6"
> +RDEPENDS_${PN}-tracert6 = "${PN}-rltraceroute6"
> +RDEPENDS_${PN}-misc += "perl"
>
> -do_install_append () {
> -    rm -rf ${D}${localstatedir}
> -    # Enable SUID bit for applications that need it
> -    chmod 4555 ${D}${bindir}/rltraceroute6
> -    chmod 4555 ${D}${bindir}/ndisc6
> -    chmod 4555 ${D}${bindir}/rdisc6
> -}
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

