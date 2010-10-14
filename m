Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <m.schuknecht@DResearch.de>) id 1P6Oo1-0008Do-L2
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 16:29:20 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id D332C491278
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 16:28:47 +0200 (CEST)
Received: from fsc-480-012-88.intern.dresearch.de ([10.32.10.177]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 14 Oct 2010 16:28:47 +0200
Received: by fsc-480-012-88.intern.dresearch.de (Postfix, from userid 10022)
	id 2F1D07207E; Thu, 14 Oct 2010 16:28:47 +0200 (CEST)
From: Mario Schuknecht <m.schuknecht@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Oct 2010 16:28:32 +0200
Message-Id: <1287066512-6337-1-git-send-email-m.schuknecht@dresearch.de>
X-Mailer: git-send-email 1.7.1
X-OriginalArrivalTime: 14 Oct 2010 14:28:47.0719 (UTC)
	FILETIME=[1D1D2F70:01CB6BAC]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: m.schuknecht@DResearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] linux-2.6.24: tcp: ioctl type SIOCOUTQNSD returns amount of data not sent
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
X-List-Received-Date: Thu, 14 Oct 2010 14:29:20 -0000

In contrast to SIOCOUTQ which returns the amount of data sent
but not yet acknowledged plus data not yet sent this patch only
returns the data not sent.

For various methods of live streaming bitrate control it may
be helpful to know how much data are in the tcp outqueue are
not sent yet.

Signed-off-by: Mario Schuknecht <m.schuknecht@dresearch.de>
---
 .../hipox/siocoutqsnd.patch                        |   54 ++++++++++++++++++++
 .../linux-libc-headers_2.6.24.bb                   |    4 ++
 2 files changed, 58 insertions(+), 0 deletions(-)
 create mode 100644 recipes/linux-libc-headers/linux-libc-headers-2.6.24/hipox/siocoutqsnd.patch

diff --git a/recipes/linux-libc-headers/linux-libc-headers-2.6.24/hipox/siocoutqsnd.patch b/recipes/linux-libc-headers/linux-libc-headers-2.6.24/hipox/siocoutqsnd.patch
new file mode 100644
index 0000000..616a860
--- /dev/null
+++ b/recipes/linux-libc-headers/linux-libc-headers-2.6.24/hipox/siocoutqsnd.patch
@@ -0,0 +1,54 @@
+tcp: ioctl type SIOCOUTQNSD returns amount of data not sent
+
+In contrast to SIOCOUTQ which returns the amount of data sent
+but not yet acknowledged plus data not yet sent this patch only
+returns the data not sent.
+
+For various methods of live streaming bitrate control it may
+be helpful to know how much data are in the tcp outqueue are
+not sent yet.
+
+Signed-off-by: Mario Schuknecht <m.schuknecht@dresearch.de>
+
+diff -Nurd linux-2.6.24.orig//include/asm-arm/ioctls.h linux-2.6.24/include/asm-arm/ioctls.h
+--- linux-2.6.24.orig//include/asm-arm/ioctls.h	2010-10-08 09:03:02.000000000 +0200
++++ linux-2.6.24/include/asm-arm/ioctls.h	2010-10-08 09:09:55.000000000 +0200
+@@ -53,6 +53,8 @@
+ #define TIOCGPTN	_IOR('T',0x30, unsigned int) /* Get Pty Number (of pty-mux device) */
+ #define TIOCSPTLCK	_IOW('T',0x31, int)  /* Lock/unlock Pty */
+ 
++#define TIOCOUTQNSD	0x5437
++
+ #define FIONCLEX	0x5450  /* these numbers need to be adjusted. */
+ #define FIOCLEX		0x5451
+ #define FIOASYNC	0x5452
+diff -Nurd linux-2.6.24.orig//include/linux/sockios.h linux-2.6.24/include/linux/sockios.h
+--- linux-2.6.24.orig//include/linux/sockios.h	2010-10-08 09:03:02.000000000 +0200
++++ linux-2.6.24/include/linux/sockios.h	2010-10-08 09:10:43.000000000 +0200
+@@ -23,6 +23,7 @@
+ /* Linux-specific socket ioctls */
+ #define SIOCINQ		FIONREAD
+ #define SIOCOUTQ	TIOCOUTQ
++#define SIOCOUTQNSD	TIOCOUTQNSD
+ 
+ /* Routing table calls. */
+ #define SIOCADDRT	0x890B		/* add routing table entry	*/
+diff -Nurd linux-2.6.24.orig//net/ipv4/tcp.c linux-2.6.24/net/ipv4/tcp.c
+--- linux-2.6.24.orig//net/ipv4/tcp.c	2010-10-08 09:02:59.000000000 +0200
++++ linux-2.6.24/net/ipv4/tcp.c	2010-10-08 09:10:43.000000000 +0200
+@@ -444,6 +444,15 @@
+ 		else
+ 			answ = tp->write_seq - tp->snd_una;
+ 		break;
++	case SIOCOUTQNSD:
++		if (sk->sk_state == TCP_LISTEN)
++			return -EINVAL;
++
++		if ((1 << sk->sk_state) & (TCPF_SYN_SENT | TCPF_SYN_RECV))
++			answ = 0;
++		else
++			answ = tp->write_seq - tp->snd_nxt;
++		break;
+ 	default:
+ 		return -ENOIOCTLCMD;
+ 	}
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
index e95299b..421937b 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
@@ -9,6 +9,10 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
            file://export_falloc_h.patch \
            file://unifdef.patch"
 
+SRC_URI_append_hipox = " \
+	file://siocoutqsnd.patch \
+	"
+
 S = "${WORKDIR}/linux-${PV}"
 
 do_configure() {
-- 
1.7.1



