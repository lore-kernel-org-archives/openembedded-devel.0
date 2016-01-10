Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id D8CB0760A3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2016 01:00:09 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id 65so2220343pfd.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2016 17:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=u+5d5hd7mdkeU7PeHsILsSk7wPrnAbG5sFCoDqvsbtQ=;
	b=yaqL8O93Sp0+UPkYEsclgQSXSAIh3yzewiIngmuNw8EA+uWIsf2mae7z2iQV4/m8Vc
	bvmUQ2vTqv4Vg3QIkSrXvJ0WeMejMzwPGWOMsWBgSmuKkdYHhlrf50QmdBk0UUktrlBl
	S8OdcDl9FvDdKfUfR39Bg9ic0LtadpCx6kAqzjaVkvyNIWJD0Ca0xdTvjSCYBczm/gex
	+6hEmdYQIRokVVG3yEyx5wKQNW3oro3lAA1MBaHYMQ7vuOiWyQF2C54JAGx8NGyJJCon
	AgTEAs3K2VPAOplm1S9RvxXYxfwA6kj/fXgd/Xe/eECALd5Q/DiIx1k8GbF4FSlgL1tV
	MQtg==
X-Received: by 10.98.80.135 with SMTP id g7mr6424668pfj.132.1452387610516;
	Sat, 09 Jan 2016 17:00:10 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	w82sm8341676pfi.95.2016.01.09.17.00.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 17:00:05 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 43DC1FCC849; Sat,  9 Jan 2016 16:59:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Jan 2016 16:59:40 -0800
Message-Id: <2638f49349c026663c47c05286b1c346353e99bf.1452386603.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
Subject: [PATCH 17/22] iscsitarget: resolve build error if CONFIG_IPV6 config is not enabled
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
X-List-Received-Date: Sun, 10 Jan 2016 01:00:10 -0000

From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>

The element skc_v6_daddr (in struct sock_common) is defined in
kernel source only when CONFIG_IPV6 is enabled. Hence, access
sk_v6_daddr element (i.e __sk_common.skc_v6_daddr) only when CONFIG_IPV6
is defined; to fix below error in world build:

-- snip --
/home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/qemux86/kernel-source/include/net/sock.h:330:33: error: 'struct sock_common' has no member named 'skc_v6_daddr'
-- CUT --

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../access-sk_v6_daddr-iff-IPV6-defined.patch      | 28 ++++++++++++++++++++++
 .../iscsitarget/iscsitarget_1.4.20.3+svn502.bb     |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-networking/recipes-extended/iscsitarget/files/access-sk_v6_daddr-iff-IPV6-defined.patch

diff --git a/meta-networking/recipes-extended/iscsitarget/files/access-sk_v6_daddr-iff-IPV6-defined.patch b/meta-networking/recipes-extended/iscsitarget/files/access-sk_v6_daddr-iff-IPV6-defined.patch
new file mode 100644
index 0000000..4444234
--- /dev/null
+++ b/meta-networking/recipes-extended/iscsitarget/files/access-sk_v6_daddr-iff-IPV6-defined.patch
@@ -0,0 +1,28 @@
+The element skc_v6_daddr (in struct sock_common) is defined in 
+kernel source only when CONFIG_IPV6 is enabled. Hence, access 
+sk_v6_daddr element (i.e __sk_common.skc_v6_daddr) only when CONFIG_IPV6 
+is defined; to fix below error in world build:
+
+-- snip --
+/home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/qemux86/kernel-source/include/net/sock.h:330:33: error: 'struct sock_common' has no member named 'skc_v6_daddr'
+-- CUT --
+
+Upstream-Status: Pending
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+
+--- iscsitarget-1.4.20.3+svn502_org/kernel/conn.c	2015-12-29 21:57:50.547932217 -0800
++++ iscsitarget-1.4.20.3+svn502/kernel/conn.c	2015-12-29 22:47:25.254657627 -0800
+@@ -46,10 +46,12 @@ void conn_info_show(struct seq_file *seq
+ 			snprintf(buf, sizeof(buf),
+ 				 "%pI4", &inet_sk(sk)->inet_daddr);
+ 			break;
++#if defined(CONFIG_IPV6)
+ 		case AF_INET6:
+ 			snprintf(buf, sizeof(buf), "[%pI6]",
+ 				 &(sk)->sk_v6_daddr);
+ 			break;
++#endif /* defined(CONFIG_IPV6) */
+ 		default:
+ 			break;
+ 		}
diff --git a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
index c96810b..b327f86 100644
--- a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
+++ b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
@@ -11,6 +11,7 @@ DEPENDS = "openssl virtual/kernel"
 SRC_URI = "http://ftp.heanet.ie/mirrors/ubuntu/pool/universe/i/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://use-kernel-makefile-to-get-kernel-version.patch \
            file://fix-errors-observed-with-linux-3.19-and-greater.patch \
+           file://access-sk_v6_daddr-iff-IPV6-defined.patch \
 	  "
 SRC_URI[md5sum] = "ef9bc823bbabd3c772208c00d5f2d089"
 SRC_URI[sha256sum] = "d3196ccb78a43266dce28587bfe30d8ab4db7566d7bce96057dfbb84100babb5"
-- 
1.9.1


