Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PNxAv-0007Qu-2c
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Dec 2010 01:37:31 +0100
Received: by pxi17 with SMTP id 17so1217564pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 16:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=NSSVsnCevaG7F/m2GFq2R59oSSD9lYe02nSYLUThzu8=;
	b=ns/7CWAiR+QwFHayyM5Gu7KA4Y2keMfcXZ/+Lz7HQ4Zcnr9sP2qAIb3k7J34gFHHqg
	UOVEPHWiuJtjk/I/ncXlpfaypRqEcIori52fzNZ+60+SQ/FzillTZ6sFRYofdsmsuE4S
	paO3fybS1raoeLuDIK8IE1ht7Qmgw4OzGK5qg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=ulFoi7pp+SNUcDQNQkRrGO3drOiOTTm22+ZB74IxO66zQxo0aNeNInTV2y30ndvHFC
	jE1P6RM/P/WFqV07CMYgMwknsnD47Jzytks9ASxrZo5F+jqYnwmRCmwTKQOzUpiUgASx
	WEIN6gPXJTCOb1eli0m5oSwI/AvQCcVbDqgzI=
Received: by 10.142.154.6 with SMTP id b6mr9738084wfe.220.1291250165074;
	Wed, 01 Dec 2010 16:36:05 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id p8sm679020wff.16.2010.12.01.16.36.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 01 Dec 2010 16:36:04 -0800 (PST)
Message-ID: <4CF6E9EE.2040908@gmail.com>
Date: Thu, 02 Dec 2010 11:05:58 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] inetutils_1.8.bb: Fix build when DISTRO_FEATURES lacks ipv6.
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
X-List-Received-Date: Thu, 02 Dec 2010 00:37:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

In file included from ./ping.h:19:0,
                 from ping_address.c:47:
./ping_common.h:23:27: fatal error: netinet/icmp6.h: No such file or directory
compilation terminated.
In file included from ./ping.h:19:0,
                 from ping_router.c:46:
./ping_common.h:23:27: fatal error: netinet/icmp6.h: No such file or directory
compilation terminated.
make[2]: *** [ping_address.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[2]: *** [ping_router.o] Error 1
In file included from ping_common.c:32:0:
ping_common.h:23:27: fatal error: netinet/icmp6.h: No such file or directory
compilation terminated.
make[2]: *** [ping_common.o] Error 1
In file included from ping.h:19:0,
                 from libping.c:38:
ping_common.h:23:27: fatal error: netinet/icmp6.h: No such file or directory
compilation terminated.
make[2]: *** [libping.o] Error 1
In file included from ./ping.h:19:0,
                 from ping_timestamp.c:46:
./ping_common.h:23:27: fatal error: netinet/icmp6.h: No such file or directory
compilation terminated.
make[2]: *** [ping_timestamp.o] Error 1
In file included from ./ping.h:19:0,
                 from ping_echo.c:47:
./ping_common.h:23:27: fatal error: netinet/icmp6.h: No such file or directory
compilation terminated.
make[2]: *** [ping_echo.o] Error 1
In file included from ./ping.h:19:0,
                 from ping.c:49:
./ping_common.h:23:27: fatal error: netinet/icmp6.h: No such file or directory
compilation terminated.
make[2]: *** [ping.o] Error 1

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 .../inetutils/inetutils-1.8/fix-disable-ipv6.patch |   58 ++++++++++++++++++++
 recipes/inetutils/inetutils_1.8.bb                 |    6 ++-
 2 files changed, 63 insertions(+), 1 deletions(-)
 create mode 100644 recipes/inetutils/inetutils-1.8/fix-disable-ipv6.patch

diff --git a/recipes/inetutils/inetutils-1.8/fix-disable-ipv6.patch b/recipes/inetutils/inetutils-1.8/fix-disable-ipv6.patch
new file mode 100644
index 0000000..75d51a1
--- /dev/null
+++ b/recipes/inetutils/inetutils-1.8/fix-disable-ipv6.patch
@@ -0,0 +1,58 @@
+Upstream: http://www.mail-archive.com/bug-inetutils@gnu.org/msg02103.html
+
+diff -ur inetutils-1.8.orig/ping/ping_common.h inetutils-1.8/ping/ping_common.h
+--- inetutils-1.8.orig/ping/ping_common.h	2010-05-15 20:55:47.000000000 +0930
++++ inetutils-1.8/ping/ping_common.h	2010-12-01 12:19:08.000000000 +1030
+@@ -17,10 +17,14 @@
+   You should have received a copy of the GNU General Public License
+   along with this program.  If not, see `http://www.gnu.org/licenses/'. */
+ 
++#include <config.h>
++
+ #include <netinet/in_systm.h>
+ #include <netinet/in.h>
+ #include <netinet/ip.h>
++#ifdef HAVE_IPV6
+ #include <netinet/icmp6.h>
++#endif
+ #include <icmp.h>
+ #include <error.h>
+ #include <progname.h>
+@@ -66,13 +70,19 @@
+   (t).tv_usec = ((i)%PING_PRECISION)*(1000000/PING_PRECISION) ;\
+ } while (0)
+ 
++#ifdef HAVE_IPV6
+ /* Not sure about this step*/
+ #define _PING_BUFLEN(p, USE_IPV6) ((USE_IPV6)? ((p)->ping_datalen + sizeof (struct icmp6_hdr)) : \
+ 				   ((p)->ping_datalen + sizeof (icmphdr_t)))
++#else
++#define _PING_BUFLEN(p, USE_IPV6) ((p)->ping_datalen + sizeof (icmphdr_t))
++#endif
+ 
++#ifdef HAVE_IPV6
+ typedef int (*ping_efp6) (int code, void *closure, struct sockaddr_in6 * dest,
+ 			  struct sockaddr_in6 * from, struct icmp6_hdr * icmp,
+ 			  int datalen);
++#endif
+ 
+ typedef int (*ping_efp) (int code,
+ 			 void *closure,
+@@ -81,13 +91,17 @@
+ 			 struct ip * ip, icmphdr_t * icmp, int datalen);
+ 
+ union event {
++#ifdef HAVE_IPV6
+   ping_efp6 handler6;
++#endif
+   ping_efp handler;
+ };
+ 
+ union ping_address {
+   struct sockaddr_in ping_sockaddr;
++#ifdef HAVE_IPV6
+   struct sockaddr_in6 ping_sockaddr6;
++#endif
+ };
+ 
+ typedef struct ping_data PING;
diff --git a/recipes/inetutils/inetutils_1.8.bb b/recipes/inetutils/inetutils_1.8.bb
index 42fb760..1e3d2ab 100644
--- a/recipes/inetutils/inetutils_1.8.bb
+++ b/recipes/inetutils/inetutils_1.8.bb
@@ -17,12 +17,16 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
            file://inetutils-1.8-1003-use-daemon-from-the-C-library-when-possible.patch \
            file://inetutils-1.8-1004-detect-fork-support.patch \
            file://inetutils-1.8-1005-ftpd-add-daemon-D-nommu-support.patch \
+           file://fix-disable-ipv6.patch \
 "
 
 inherit autotools
 
+noipv6="${@base_contains('DISTRO_FEATURES', 'ipv6', '', '--disable-ipv6 gl_cv_socket_ipv6=no', d)}"
 EXTRA_OECONF = "--with-ncurses-include-dir=${STAGING_INCDIR} \
-		--with-path-procnet-dev=/proc/net/dev"
+		--with-path-procnet-dev=/proc/net/dev \
+		${noipv6} \
+		"
 
 do_configure_prepend () {
 	export HELP2MAN='true'
-- 
1.7.1



