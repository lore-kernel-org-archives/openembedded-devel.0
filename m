Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PNEkj-0003fC-0E
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Nov 2010 02:11:30 +0100
Received: by pzk12 with SMTP id 12so744611pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 17:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=v+I78WEeDgd+LkuUlG9GnfzjMiwWcW5qgE3pcJQa+PE=;
	b=wdZ4suPNAPf2qpIwDSif0x8zH38dGuK0xlvISPWbO29Dp2N0rE7WSAbQx2UhAzWSka
	N+B0vfr7YFM8IypNNiWcXqgtnYMGAAElepD1hqJAvcezwLDhXMSkNHaJidd/pakUQ4m8
	x3BCgEZhUOIvYgpmTxFiFSxxqkR/w2XxOz6i0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=SxcQxItstDYeNKITn4wO2ufDK76U8Mdejkexf8TNHzfRTkI0p8z8vADQ1hXsAdaTF5
	nwQKA2k4P8Lb93fhTJzOXBBmwFp59gaJegWOfP1gxG3Pga4FJOH95uRgrbCdNGWaP2jo
	L0D7BTL7K+qxzWV9tnLpMPJl6Kw30+b5XWU54=
Received: by 10.142.237.4 with SMTP id k4mr6475639wfh.171.1291079408057;
	Mon, 29 Nov 2010 17:10:08 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id f5sm8216507wfg.2.2010.11.29.17.10.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 29 Nov 2010 17:10:06 -0800 (PST)
Message-ID: <4CF44EE8.30504@gmail.com>
Date: Tue, 30 Nov 2010 11:40:00 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] avahi_0.6.25.bb: Fix build when DISTRO_FEATURES lacks ipv6.
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
X-List-Received-Date: Tue, 30 Nov 2010 01:11:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

socket.c: In function 'avahi_mdns_mcast_join_ipv6':
socket.c:159:38: error: 'IPV6_DROP_MEMBERSHIP' undeclared (first use in this function)
socket.c:159:38: note: each undeclared identifier is reported only once for each function it appears in
socket.c:161:45: error: 'IPV6_ADD_MEMBERSHIP' undeclared (first use in this function)
socket.c: In function 'ipv6_pktinfo':
socket.c:273:9: warning: unused variable 'yes'
socket.c:272:29: warning: unused parameter 'fd'
socket.c: In function 'avahi_open_socket_ipv6':
socket.c:387:38: error: 'IPV6_MULTICAST_HOPS' undeclared (first use in this function)
socket.c:393:38: error: 'IPV6_UNICAST_HOPS' undeclared (first use in this function)
socket.c:399:38: error: 'IPV6_V6ONLY' undeclared (first use in this function)
socket.c:405:38: error: 'IPV6_MULTICAST_LOOP' undeclared (first use in this function)
cache.c: In function 'avahi_cache_start_poof':
cache.c:494:5: warning: cast discards qualifiers from pointer target type
socket.c: In function 'avahi_send_dns_packet_ipv4':
socket.c:524:16: warning: cast increases required alignment of target type
socket.c: In function 'avahi_send_dns_packet_ipv6':
socket.c:575:23: error: invalid application of 'sizeof' to incomplete type 'struct in6_pktinfo'
socket.c:603:30: error: invalid application of 'sizeof' to incomplete type 'struct in6_pktinfo'
socket.c:608:27: error: 'IPV6_PKTINFO' undeclared (first use in this function)
socket.c:613:17: error: dereferencing pointer to incomplete type
socket.c:616:25: error: dereferencing pointer to incomplete type
socket.c: In function 'avahi_recv_dns_packet_ipv4':
socket.c:716:48: warning: cast increases required alignment of target type
socket.c:716:25: warning: dereferencing type-punned pointer will break strict-aliasing rules
socket.c:722:44: warning: cast increases required alignment of target type
socket.c: In function 'avahi_recv_dns_packet_ipv6':
socket.c:855:22: error: 'IPV6_HOPLIMIT' undeclared (first use in this function)
socket.c:858:48: warning: cast increases required alignment of target type
socket.c:858:25: warning: dereferencing type-punned pointer will break strict-aliasing rules
socket.c:864:22: error: 'IPV6_PKTINFO' undeclared (first use in this function)
socket.c:868:39: error: dereferencing pointer to incomplete type
socket.c:871:59: error: dereferencing pointer to incomplete type
socket.c: In function 'avahi_open_unicast_socket_ipv6':
socket.c:946:38: error: 'IPV6_V6ONLY' undeclared (first use in this function)
make[2]: *** [libavahi_core_la-socket.lo] Error 1

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/avahi/avahi-0.6.25/disable-ipv6.patch |  433 +++++++++++++++++++++++++
 recipes/avahi/avahi_0.6.25.bb                 |    6 +
 2 files changed, 439 insertions(+), 0 deletions(-)
 create mode 100644 recipes/avahi/avahi-0.6.25/disable-ipv6.patch

diff --git a/recipes/avahi/avahi-0.6.25/disable-ipv6.patch b/recipes/avahi/avahi-0.6.25/disable-ipv6.patch
new file mode 100644
index 0000000..14c2723
--- /dev/null
+++ b/recipes/avahi/avahi-0.6.25/disable-ipv6.patch
@@ -0,0 +1,433 @@
+diff -ur avahi-0.6.25.orig/avahi-core/iface.c avahi-0.6.25/avahi-core/iface.c
+--- avahi-0.6.25.orig/avahi-core/iface.c	2008-12-13 08:06:15.000000000 +1030
++++ avahi-0.6.25/avahi-core/iface.c	2010-11-30 09:33:14.000000000 +1030
+@@ -207,7 +207,14 @@
+                    avahi_address_snprint(at, sizeof(at), &i->local_mcast_address));
+ 
+     if (i->protocol == AVAHI_PROTO_INET6)
++#ifndef DISABLE_IPV6
+         r = avahi_mdns_mcast_join_ipv6(i->monitor->server->fd_ipv6, &i->local_mcast_address.data.ipv6, i->hardware->index, join);
++#else
++    {
++	i->mcast_joined = 0;
++        return -1;
++    }
++#endif
+     else {
+         assert(i->protocol == AVAHI_PROTO_INET);
+ 
+@@ -569,8 +576,10 @@
+ 
+     if (i->protocol == AVAHI_PROTO_INET && i->monitor->server->fd_ipv4 >= 0)
+         avahi_send_dns_packet_ipv4(i->monitor->server->fd_ipv4, i->hardware->index, p, i->mcast_joined ? &i->local_mcast_address.data.ipv4 : NULL, a ? &a->data.ipv4 : NULL, port);
++#ifndef DISABLE_IPV6
+     else if (i->protocol == AVAHI_PROTO_INET6 && i->monitor->server->fd_ipv6 >= 0)
+         avahi_send_dns_packet_ipv6(i->monitor->server->fd_ipv6, i->hardware->index, p, i->mcast_joined ? &i->local_mcast_address.data.ipv6 : NULL, a ? &a->data.ipv6 : NULL, port);
++#endif
+ }
+ 
+ void avahi_interface_send_packet(AvahiInterface *i, AvahiDnsPacket *p) {
+@@ -768,6 +777,7 @@
+             if ((ntohl(a->data.ipv4.address) & m) == (ntohl(ia->address.data.ipv4.address) & m))
+                 return 1;
+         } else {
++#ifndef DISABLE_IPV6
+             unsigned j;
+             unsigned char pl;
+             assert(a->proto == AVAHI_PROTO_INET6);
+@@ -791,6 +801,9 @@
+                 if ((a->data.ipv6.address[j] & m) != (ia->address.data.ipv6.address[j] & m))
+                     break;
+             }
++#else
++            return 1;
++#endif
+         }
+     }
+ 
+diff -ur avahi-0.6.25.orig/avahi-core/server.c avahi-0.6.25/avahi-core/server.c
+--- avahi-0.6.25.orig/avahi-core/server.c	2009-04-14 10:58:56.000000000 +0930
++++ avahi-0.6.25/avahi-core/server.c	2010-11-30 09:25:29.000000000 +1030
+@@ -818,8 +818,11 @@
+ 
+             if (j->protocol == AVAHI_PROTO_INET && s->fd_legacy_unicast_ipv4 >= 0) {
+                 avahi_send_dns_packet_ipv4(s->fd_legacy_unicast_ipv4, j->hardware->index, p, NULL, NULL, 0);
+-            } else if (j->protocol == AVAHI_PROTO_INET6 && s->fd_legacy_unicast_ipv6 >= 0)
++            }
++#ifndef DISABLE_IPV6
++	    else if (j->protocol == AVAHI_PROTO_INET6 && s->fd_legacy_unicast_ipv6 >= 0)
+                 avahi_send_dns_packet_ipv6(s->fd_legacy_unicast_ipv6, j->hardware->index, p, NULL, NULL, 0);
++#endif
+         }
+ 
+     /* Reset the id */
+@@ -848,6 +851,7 @@
+ 
+     }
+ 
++#ifndef DISABLE_IPV6
+     if (address->proto == AVAHI_PROTO_INET6 && s->fd_legacy_unicast_ipv6 >= 0) {
+         struct sockaddr_in6 lsa;
+         socklen_t l = sizeof(lsa);
+@@ -857,6 +861,7 @@
+         else
+             return avahi_port_from_sockaddr((struct sockaddr*) &lsa) == port;
+     }
++#endif
+ 
+     return 0;
+ }
+@@ -904,9 +909,11 @@
+         return;
+     }
+ 
++#ifndef DISABLE_IPV6
+     if (avahi_address_is_ipv4_in_ipv6(src_address))
+         /* This is an IPv4 address encapsulated in IPv6, so let's ignore it. */
+         return;
++#endif
+ 
+     if (originates_from_local_legacy_unicast_socket(s, src_address, port))
+         /* This originates from our local reflector, so let's ignore it */
+@@ -1031,11 +1038,14 @@
+     if (fd == s->fd_ipv4) {
+         dest.proto = src.proto = AVAHI_PROTO_INET;
+         p = avahi_recv_dns_packet_ipv4(s->fd_ipv4, &src.data.ipv4, &port, &dest.data.ipv4, &iface, &ttl);
+-    } else {
++    }
++#ifndef DISABLE_IPV6
++    else {
+         assert(fd == s->fd_ipv6);
+         dest.proto = src.proto = AVAHI_PROTO_INET6;
+         p = avahi_recv_dns_packet_ipv6(s->fd_ipv6, &src.data.ipv6, &port, &dest.data.ipv6, &iface, &ttl);
+     }
++#endif
+ 
+     if (p) {
+         if (iface == AVAHI_IF_UNSPEC)
+@@ -1062,10 +1072,13 @@
+ 
+     if (fd == s->fd_legacy_unicast_ipv4)
+         p = avahi_recv_dns_packet_ipv4(s->fd_legacy_unicast_ipv4, NULL, NULL, NULL, NULL, NULL);
+-    else {
++    else
++#ifndef DISABLE_IPV6
++    {
+         assert(fd == s->fd_legacy_unicast_ipv6);
+         p = avahi_recv_dns_packet_ipv6(s->fd_legacy_unicast_ipv6, NULL, NULL, NULL, NULL, NULL);
+     }
++#endif
+ 
+     if (p) {
+         dispatch_legacy_unicast_packet(s, p);
+@@ -1325,33 +1338,47 @@
+     assert(s);
+ 
+     s->fd_ipv4 = s->config.use_ipv4 ? avahi_open_socket_ipv4(s->config.disallow_other_stacks) : -1;
++#ifndef DISABLE_IPV6
+     s->fd_ipv6 = s->config.use_ipv6 ? avahi_open_socket_ipv6(s->config.disallow_other_stacks) : -1;
++#endif
+ 
++#ifndef DISABLE_IPV6
+     if (s->fd_ipv6 < 0 && s->fd_ipv4 < 0)
++#else
++    if (s->fd_ipv4 < 0)
++#endif
+         return AVAHI_ERR_NO_NETWORK;
+ 
+     if (s->fd_ipv4 < 0 && s->config.use_ipv4)
+         avahi_log_notice("Failed to create IPv4 socket, proceeding in IPv6 only mode");
++#ifndef DISABLE_IPV6
+     else if (s->fd_ipv6 < 0 && s->config.use_ipv6)
+         avahi_log_notice("Failed to create IPv6 socket, proceeding in IPv4 only mode");
++#endif
+ 
+     s->fd_legacy_unicast_ipv4 = s->fd_ipv4 >= 0 && s->config.enable_reflector ? avahi_open_unicast_socket_ipv4() : -1;
++#ifndef DISABLE_IPV6
+     s->fd_legacy_unicast_ipv6 = s->fd_ipv6 >= 0 && s->config.enable_reflector ? avahi_open_unicast_socket_ipv6() : -1;
++#endif
+ 
+-    s->watch_ipv4 =
+-        s->watch_ipv6 =
+-        s->watch_legacy_unicast_ipv4 =
+-        s->watch_legacy_unicast_ipv6 = NULL;
++    s->watch_ipv4 = s->watch_legacy_unicast_ipv4 = NULL;
++#ifndef DISABLE_IPV6
++    s->watch_ipv6 = s->watch_legacy_unicast_ipv6 = NULL;
++#endif
+ 
+     if (s->fd_ipv4 >= 0)
+         s->watch_ipv4 = s->poll_api->watch_new(s->poll_api, s->fd_ipv4, AVAHI_WATCH_IN, mcast_socket_event, s);
++#ifndef DISABLE_IPV6
+     if (s->fd_ipv6 >= 0)
+         s->watch_ipv6 = s->poll_api->watch_new(s->poll_api, s->fd_ipv6, AVAHI_WATCH_IN, mcast_socket_event, s);
++#endif
+ 
+     if (s->fd_legacy_unicast_ipv4 >= 0)
+         s->watch_legacy_unicast_ipv4 = s->poll_api->watch_new(s->poll_api, s->fd_legacy_unicast_ipv4, AVAHI_WATCH_IN, legacy_unicast_socket_event, s);
++#ifndef DISABLE_IPV6
+     if (s->fd_legacy_unicast_ipv6 >= 0)
+         s->watch_legacy_unicast_ipv6 = s->poll_api->watch_new(s->poll_api, s->fd_legacy_unicast_ipv6, AVAHI_WATCH_IN, legacy_unicast_socket_event, s);
++#endif
+ 
+     return 0;
+ }
+@@ -1499,25 +1526,33 @@
+ 
+     if (s->watch_ipv4)
+         s->poll_api->watch_free(s->watch_ipv4);
++#ifndef DISABLE_IPV6
+     if (s->watch_ipv6)
+         s->poll_api->watch_free(s->watch_ipv6);
++#endif
+ 
+     if (s->watch_legacy_unicast_ipv4)
+         s->poll_api->watch_free(s->watch_legacy_unicast_ipv4);
++#ifndef DISABLE_IPV6
+     if (s->watch_legacy_unicast_ipv6)
+         s->poll_api->watch_free(s->watch_legacy_unicast_ipv6);
++#endif
+ 
+     /* Free sockets */
+ 
+     if (s->fd_ipv4 >= 0)
+         close(s->fd_ipv4);
++#ifndef DISABLE_IPV6
+     if (s->fd_ipv6 >= 0)
+         close(s->fd_ipv6);
++#endif
+ 
+     if (s->fd_legacy_unicast_ipv4 >= 0)
+         close(s->fd_legacy_unicast_ipv4);
++#ifndef DISABLE_IPV6
+     if (s->fd_legacy_unicast_ipv6 >= 0)
+         close(s->fd_legacy_unicast_ipv6);
++#endif
+ 
+     /* Free other stuff */
+ 
+@@ -1570,7 +1605,11 @@
+     assert(c);
+ 
+     memset(c, 0, sizeof(AvahiServerConfig));
++#ifndef DISABLE_IPV6
+     c->use_ipv6 = 1;
++#else
++    c->use_ipv6 = 0;
++#endif
+     c->use_ipv4 = 1;
+     c->allow_interfaces = NULL;
+     c->deny_interfaces = NULL;
+@@ -1592,7 +1631,9 @@
+     c->disable_publishing = 0;
+     c->allow_point_to_point = 0;
+     c->publish_aaaa_on_ipv4 = 1;
++#ifndef DISABLE_IPV6
+     c->publish_a_on_ipv6 = 0;
++#endif
+ 
+     return c;
+ }
+diff -ur avahi-0.6.25.orig/avahi-core/socket.c avahi-0.6.25/avahi-core/socket.c
+--- avahi-0.6.25.orig/avahi-core/socket.c	2008-06-18 08:43:44.000000000 +0930
++++ avahi-0.6.25/avahi-core/socket.c	2010-11-29 16:55:33.000000000 +1030
+@@ -142,6 +142,7 @@
+     return 0;
+ }
+ 
++#ifndef DISABLE_IPV6
+ int avahi_mdns_mcast_join_ipv6(int fd, const AvahiIPv6Address *a, int idx, int join) {
+     struct ipv6_mreq mreq6;
+     struct sockaddr_in6 sa6;
+@@ -165,6 +166,7 @@
+ 
+     return 0;
+ }
++#endif
+ 
+ static int reuseaddr(int fd) {
+     int yes;
+@@ -371,6 +373,7 @@
+     return -1;
+ }
+ 
++#ifndef DISABLE_IPV6
+ int avahi_open_socket_ipv6(int no_reuse) {
+     struct sockaddr_in6 sa, local;
+     int fd = -1, yes, r;
+@@ -440,6 +443,7 @@
+ 
+     return -1;
+ }
++#endif
+ 
+ static int sendmsg_loop(int fd, struct msghdr *msg, int flags) {
+     assert(fd >= 0);
+@@ -560,6 +564,7 @@
+     return sendmsg_loop(fd, &msg, 0);
+ }
+ 
++#ifndef DISABLE_IPV6
+ int avahi_send_dns_packet_ipv6(
+         int fd,
+         AvahiIfIndex interface,
+@@ -621,6 +626,7 @@
+ 
+     return sendmsg_loop(fd, &msg, 0);
+ }
++#endif
+ 
+ AvahiDnsPacket *avahi_recv_dns_packet_ipv4(
+         int fd,
+@@ -775,6 +781,7 @@
+     return NULL;
+ }
+ 
++#ifndef DISABLE_IPV6
+ AvahiDnsPacket *avahi_recv_dns_packet_ipv6(
+         int fd,
+         AvahiIPv6Address *ret_src_address,
+@@ -892,6 +899,7 @@
+ 
+     return NULL;
+ }
++#endif
+ 
+ int avahi_open_unicast_socket_ipv4(void) {
+     struct sockaddr_in local;
+@@ -933,6 +941,7 @@
+     return -1;
+ }
+ 
++#ifndef DISABLE_IPV6
+ int avahi_open_unicast_socket_ipv6(void) {
+     struct sockaddr_in6 local;
+     int fd = -1, yes;
+@@ -977,3 +986,4 @@
+ 
+     return -1;
+ }
++#endif
+diff -ur avahi-0.6.25.orig/avahi-core/socket.h avahi-0.6.25/avahi-core/socket.h
+--- avahi-0.6.25.orig/avahi-core/socket.h	2008-06-18 08:43:44.000000000 +0930
++++ avahi-0.6.25/avahi-core/socket.h	2010-11-29 16:53:25.000000000 +1030
+@@ -32,18 +32,28 @@
+ #define AVAHI_IPV6_MCAST_GROUP "ff02::fb"
+ 
+ int avahi_open_socket_ipv4(int no_reuse);
++#ifndef DISABLE_IPV6
+ int avahi_open_socket_ipv6(int no_reuse);
++#endif
+ 
+ int avahi_open_unicast_socket_ipv4(void);
++#ifndef DISABLE_IPV6
+ int avahi_open_unicast_socket_ipv6(void);
++#endif
+ 
+ int avahi_send_dns_packet_ipv4(int fd, AvahiIfIndex iface, AvahiDnsPacket *p, const AvahiIPv4Address *src_address, const AvahiIPv4Address *dst_address, uint16_t dst_port);
++#ifndef DISABLE_IPV6
+ int avahi_send_dns_packet_ipv6(int fd, AvahiIfIndex iface, AvahiDnsPacket *p, const AvahiIPv6Address *src_address, const AvahiIPv6Address *dst_address, uint16_t dst_port);
++#endif
+ 
+ AvahiDnsPacket *avahi_recv_dns_packet_ipv4(int fd, AvahiIPv4Address *ret_src_address, uint16_t *ret_src_port, AvahiIPv4Address *ret_dst_address, AvahiIfIndex *ret_iface, uint8_t *ret_ttl);
++#ifndef DISABLE_IPV6
+ AvahiDnsPacket *avahi_recv_dns_packet_ipv6(int fd, AvahiIPv6Address *ret_src_address, uint16_t *ret_src_port, AvahiIPv6Address *ret_dst_address, AvahiIfIndex *ret_iface, uint8_t *ret_ttl);
++#endif
+ 
+ int avahi_mdns_mcast_join_ipv4(int fd, const AvahiIPv4Address *local_address, int iface, int join);
++#ifndef DISABLE_IPV6
+ int avahi_mdns_mcast_join_ipv6(int fd, const AvahiIPv6Address *local_address, int iface, int join);
++#endif
+ 
+ #endif
+diff -ur avahi-0.6.25.orig/avahi-core/wide-area.c avahi-0.6.25/avahi-core/wide-area.c
+--- avahi-0.6.25.orig/avahi-core/wide-area.c	2008-06-18 08:43:44.000000000 +0930
++++ avahi-0.6.25/avahi-core/wide-area.c	2010-11-29 17:00:46.000000000 +1030
+@@ -144,12 +144,16 @@
+         return avahi_send_dns_packet_ipv4(l->engine->fd_ipv4, AVAHI_IF_UNSPEC, p, NULL, &a->data.ipv4, AVAHI_DNS_PORT);
+         
+     } else {
++#ifndef DISABLE_IPV6
+         assert(a->proto == AVAHI_PROTO_INET6);
+ 
+         if (l->engine->fd_ipv6 < 0)
+             return -1;
+         
+         return avahi_send_dns_packet_ipv6(l->engine->fd_ipv6, AVAHI_IF_UNSPEC, p, NULL, &a->data.ipv6, AVAHI_DNS_PORT);
++#else
++	return -1;
++#endif
+     }
+ }
+ 
+@@ -559,8 +563,10 @@
+     if (fd == e->fd_ipv4)
+         p = avahi_recv_dns_packet_ipv4(e->fd_ipv4, NULL, NULL, NULL, NULL, NULL);
+     else {
++#ifndef DISABLE_IPV6
+         assert(fd == e->fd_ipv6);
+         p = avahi_recv_dns_packet_ipv6(e->fd_ipv6, NULL, NULL, NULL, NULL, NULL);
++#endif
+     }
+ 
+     if (p) {
+@@ -580,13 +586,21 @@
+ 
+     /* Create sockets */
+     e->fd_ipv4 = s->config.use_ipv4 ? avahi_open_unicast_socket_ipv4() : -1;
++#ifndef DISABLE_IPV6
+     e->fd_ipv6 = s->config.use_ipv6 ? avahi_open_unicast_socket_ipv6() : -1;
++#endif
+ 
++#ifndef DISABLE_IPV6
+     if (e->fd_ipv4 < 0 && e->fd_ipv6 < 0) {
++#else
++    if (e->fd_ipv4 < 0) {
++#endif
+         avahi_log_error(__FILE__": Failed to create wide area sockets: %s", strerror(errno));
+-
++ 
++#ifndef DISABLE_IPV6
+         if (e->fd_ipv6 >= 0)
+             close(e->fd_ipv6);
++#endif
+ 
+         if (e->fd_ipv4 >= 0)
+             close(e->fd_ipv4);
+@@ -601,8 +615,10 @@
+     
+     if (e->fd_ipv4 >= 0)
+         e->watch_ipv4 = s->poll_api->watch_new(e->server->poll_api, e->fd_ipv4, AVAHI_WATCH_IN, socket_event, e);
++#ifndef DISABLE_IPV6
+     if (e->fd_ipv6 >= 0)
+         e->watch_ipv6 = s->poll_api->watch_new(e->server->poll_api, e->fd_ipv6, AVAHI_WATCH_IN, socket_event, e);
++#endif
+ 
+     e->n_dns_servers = e->current_dns_server = 0;
+     e->next_id = (uint16_t) rand();
+@@ -635,11 +651,13 @@
+     if (e->watch_ipv4)
+         e->server->poll_api->watch_free(e->watch_ipv4);
+ 
++#ifndef DISABLE_IPV6
+     if (e->watch_ipv6)
+         e->server->poll_api->watch_free(e->watch_ipv6);
+ 
+     if (e->fd_ipv6 >= 0)
+         close(e->fd_ipv6);
++#endif
+     
+     if (e->fd_ipv4 >= 0)
+         close(e->fd_ipv4);
+@@ -661,7 +679,11 @@
+ 
+     if (a) {
+         for (e->n_dns_servers = 0; n > 0 && e->n_dns_servers < AVAHI_WIDE_AREA_SERVERS_MAX; a++, n--) 
++#ifndef DISABLE_IPV6
+             if ((a->proto == AVAHI_PROTO_INET && e->fd_ipv4 >= 0) || (a->proto == AVAHI_PROTO_INET6 && e->fd_ipv6 >= 0))
++#else
++            if (a->proto == AVAHI_PROTO_INET && e->fd_ipv4 >= 0)
++#endif
+                 e->dns_servers[e->n_dns_servers++] = *a;
+     } else {
+         assert(n == 0);
diff --git a/recipes/avahi/avahi_0.6.25.bb b/recipes/avahi/avahi_0.6.25.bb
index fa41831..f27b1f9 100644
--- a/recipes/avahi/avahi_0.6.25.bb
+++ b/recipes/avahi/avahi_0.6.25.bb
@@ -6,5 +6,11 @@ DEPENDS += "intltool-native"
 
 PACKAGES =+ "libavahi-gobject"
 
+SRC_URI += "file://disable-ipv6.patch"
+
+noipv6 = "${@base_contains('DISTRO_FEATURES', 'ipv6', '', '-DDISABLE_IPV6', d)}"
+EXTRA_OEMAKE_append = " 'CFLAGS=${CFLAGS} ${noipv6}'"
+
+
 SRC_URI[md5sum] = "a83155a6e29e3988f07e5eea3287b21e"
 SRC_URI[sha256sum] = "9220d974f5515b8ccfa3900cd72cedcac0fa4cc87ca3c64405f7c55346cbba59"
-- 
1.7.1



