Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 480A66AC37
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2016 09:22:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7O9MkN4023872
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2016 02:22:46 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 24 Aug 2016 02:22:45 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 24 Aug 2016 17:07:04 +0800
Message-ID: <74c4bcf069a2df85478c6e39883d74f75859cc4f.1472027350.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1472027350.git.jackie.huang@windriver.com>
References: <cover.1472027350.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 16/16] inetutils: fixes for ipv6 feature
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
X-List-Received-Date: Wed, 24 Aug 2016 09:22:45 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* Rebase the patch fix-disable-ipv6.patch
* Add PACKAGECONFIG for ipv6 and ping6 instead of
  using noipv6 in EXTRA_OECONF
* Fix the do_install to avoid failure when ipv6
  is disable

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../inetutils/inetutils/fix-disable-ipv6.patch     | 43 +++++++++++++++++-----
 .../inetutils/inetutils_1.9.4.bb                   | 10 ++---
 2 files changed, 38 insertions(+), 15 deletions(-)

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils/fix-disable-ipv6.patch b/meta-networking/recipes-connectivity/inetutils/inetutils/fix-disable-ipv6.patch
index bd3ae47..24c134f 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils/fix-disable-ipv6.patch
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils/fix-disable-ipv6.patch
@@ -2,9 +2,15 @@ Upstream: http://www.mail-archive.com/bug-inetutils@gnu.org/msg02103.html
 
 Upstream-Status: Pending
 
-diff -ur inetutils-1.8.orig/ping/ping_common.h inetutils-1.8/ping/ping_common.h
---- inetutils-1.8.orig/ping/ping_common.h	2010-05-15 20:55:47.000000000 +0930
-+++ inetutils-1.8/ping/ping_common.h	2010-12-01 12:19:08.000000000 +1030
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ ping/ping_common.h | 20 ++++++++++++++++++++
+ 1 file changed, 20 insertions(+)
+
+diff --git a/ping/ping_common.h b/ping/ping_common.h
+index 1dfd1b5..3bfbd12 100644
+--- a/ping/ping_common.h
++++ b/ping/ping_common.h
 @@ -17,10 +17,14 @@
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see `http://www.gnu.org/licenses/'. */
@@ -20,18 +26,32 @@ diff -ur inetutils-1.8.orig/ping/ping_common.h inetutils-1.8/ping/ping_common.h
  #include <icmp.h>
  #include <error.h>
  #include <progname.h>
-@@ -66,13 +70,19 @@
+@@ -62,7 +66,12 @@ struct ping_stat
+    want to follow the traditional behaviour of ping.  */
+ #define DEFAULT_PING_COUNT 0
+ 
++#ifdef HAVE_IPV6
+ #define PING_HEADER_LEN (USE_IPV6 ? sizeof (struct icmp6_hdr) : ICMP_MINLEN)
++#else
++#define PING_HEADER_LEN (ICMP_MINLEN)
++#endif
++
+ #define PING_TIMING(s)  ((s) >= sizeof (struct timeval))
+ #define PING_DATALEN    (64 - PING_HEADER_LEN)  /* default data length */
+ 
+@@ -74,13 +83,20 @@ struct ping_stat
    (t).tv_usec = ((i)%PING_PRECISION)*(1000000/PING_PRECISION) ;\
  } while (0)
  
 +#ifdef HAVE_IPV6
- /* Not sure about this step*/
- #define _PING_BUFLEN(p, USE_IPV6) ((USE_IPV6)? ((p)->ping_datalen + sizeof (struct icmp6_hdr)) : \
- 				   ((p)->ping_datalen + sizeof (icmphdr_t)))
+ /* FIXME: Adjust IPv6 case for options and their consumption.  */
+ #define _PING_BUFLEN(p, u) ((u)? ((p)->ping_datalen + sizeof (struct icmp6_hdr)) : \
+ 				   (MAXIPLEN + (p)->ping_datalen + ICMP_TSLEN))
+ 
 +#else
-+#define _PING_BUFLEN(p, USE_IPV6) ((p)->ping_datalen + sizeof (icmphdr_t))
++#define _PING_BUFLEN(p, u) (MAXIPLEN + (p)->ping_datalen + ICMP_TSLEN)
 +#endif
- 
++
 +#ifdef HAVE_IPV6
  typedef int (*ping_efp6) (int code, void *closure, struct sockaddr_in6 * dest,
  			  struct sockaddr_in6 * from, struct icmp6_hdr * icmp,
@@ -40,7 +60,7 @@ diff -ur inetutils-1.8.orig/ping/ping_common.h inetutils-1.8/ping/ping_common.h
  
  typedef int (*ping_efp) (int code,
  			 void *closure,
-@@ -81,13 +91,17 @@
+@@ -89,13 +105,17 @@ typedef int (*ping_efp) (int code,
  			 struct ip * ip, icmphdr_t * icmp, int datalen);
  
  union event {
@@ -58,3 +78,6 @@ diff -ur inetutils-1.8.orig/ping/ping_common.h inetutils-1.8/ping/ping_common.h
  };
  
  typedef struct ping_data PING;
+-- 
+2.8.3
+
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
index 58e760b..8db6b74 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
@@ -29,17 +29,18 @@ SRC_URI[sha256sum] = "be8f75eff936b8e41b112462db51adf689715658a1b09e0d6b05d11ec9
 inherit autotools gettext update-alternatives texinfo
 
 SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '', 'file://fix-disable-ipv6.patch', d)}"
-noipv6="${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '', '--disable-ipv6 gl_cv_socket_ipv6=no', d)}"
 
 PACKAGECONFIG ??= "ftp uucpd \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6 ping6', '', d)} \
                   "
 PACKAGECONFIG[ftp] = "--enable-ftp,--disable-ftp,readline"
 PACKAGECONFIG[uucpd] = "--enable-uucpd,--disable-uucpd,readline"
 PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam"
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6 gl_cv_socket_ipv6=no,"
+PACKAGECONFIG[ping6] = "--enable-ping6,--disable-ping6,"
 
 EXTRA_OECONF = "--with-ncurses-include-dir=${STAGING_INCDIR} \
-        ${noipv6} \
         inetutils_cv_path_login=${base_bindir}/login \
         --with-libreadline-prefix=${STAGING_LIBDIR} \
         --enable-rpath=no \
@@ -56,8 +57,7 @@ do_install_append () {
     install -m 0755 -d ${D}${base_sbindir}
     install -m 0755 -d ${D}${sbindir}
     install -m 0755 -d ${D}${sysconfdir}/xinetd.d
-    mv ${D}${bindir}/ping ${D}${base_bindir}/
-    mv ${D}${bindir}/ping6 ${D}${base_bindir}/
+    mv ${D}${bindir}/ping* ${D}${base_bindir}/
     mv ${D}${bindir}/ifconfig ${D}${base_sbindir}/
     mv ${D}${libexecdir}/syslogd ${D}${base_sbindir}/
     mv ${D}${bindir}/hostname ${D}${base_bindir}/
@@ -135,7 +135,7 @@ ALTERNATIVE_LINK_NAME[ifconfig]  = "${base_sbindir}/ifconfig"
 ALTERNATIVE_${PN}-ping = "ping"
 ALTERNATIVE_LINK_NAME[ping]   = "${base_bindir}/ping"
 
-ALTERNATIVE_${PN}-ping6 = "ping6"
+ALTERNATIVE_${PN}-ping6 = "${@bb.utils.contains('PACKAGECONFIG', 'ping6', 'ping6', '', d)}"
 ALTERNATIVE_LINK_NAME[ping6]  = "${base_bindir}/ping6"
 
 
-- 
2.8.3


