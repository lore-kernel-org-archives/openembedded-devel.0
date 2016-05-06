Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 81F576012C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 14:01:41 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id r184so60382521qkc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 07:01:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=dcM5YdPwe8AE9F34oh/y70MzBqd4LCzFHuBxCW6Rnxs=;
	b=lXSAhzr83ETdXiANdXl/Exzh/Gy3dJrNkS5V+1hoAm9rTSl8XLDjb1MDxgo2LNwDR+
	o1GyZhOnVOEK3vZM94VPb9myUV+zIJdoFAWGInBodvcN48xiB06dLy76Q0UO9ZCM3QTh
	fljx3uLO6C6DN2pESx7tSjbfcizN8z74HfAFIbljrNb1HEQgawJo/m8YCa9ZBCd+Casn
	BXWYZvcFurSIo/WP9aambIEfNKDQUlPTHhhZ/DHHEIBxqxR/Ms0KpzkviVi0xl6OBTHh
	mkWxuK8MTXKR5of26VbczuOuq+W41vvWcxQF/n3R0BW7g9O7PnaY72/WiRPZE+gRchBW
	xziw==
X-Gm-Message-State: AOPr4FUyp+lYN3hFwtVBUbo4RUl6Mcn+wh94+rjcE0mv+ks0nh8IqZZCBkKDEceZUroV9Q==
X-Received: by 10.55.157.204 with SMTP id g195mr21292692qke.68.1462543302252; 
	Fri, 06 May 2016 07:01:42 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id x6sm5804731qka.16.2016.05.06.07.01.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 07:01:41 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 06 May 2016 11:01:33 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri,  6 May 2016 11:00:44 -0300
Message-Id: <1462543259-7206-7-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
References: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe backport krogoth PATCH 07/22] squid: CVE-2016-3947
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
X-List-Received-Date: Fri, 06 May 2016 14:01:42 -0000

From: Catalin Enache <catalin.enache@windriver.com>

Heap-based buffer overflow in the Icmp6::Recv function in
icmp/Icmp6.cc in the pinger in Squid before 3.5.16 and 4.x
before 4.0.8 allows remote servers to cause a denial of
service (performance degradation or transition failures)
or write sensitive information to log files via an ICMPv6
packet.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3947

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../squid/files/CVE-2016-3947.patch                | 48 ++++++++++++++++++++++
 .../recipes-daemons/squid/squid_3.5.7.bb           |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2016-3947.patch

diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2016-3947.patch b/meta-networking/recipes-daemons/squid/files/CVE-2016-3947.patch
new file mode 100644
index 0000000..c83e6ab
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2016-3947.patch
@@ -0,0 +1,48 @@
+From 0fe108ecb2bbdf684f159950eaa55d22f07c4008 Mon Sep 17 00:00:00 2001
+From: Catalin Enache <catalin.enache@windriver.com>
+Date: Wed, 20 Apr 2016 15:17:18 +0300
+Subject: [PATCH] pinger: Fix buffer overflow in Icmp6::Recv
+
+Upstream-Status: Backport
+CVE: CVE-2016-3947
+
+Author: Yuriy M. Kaminskiy <yumkam@gmail.com>
+Committer: Amos Jeffries <squid3@treenet.co.nz
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ src/icmp/Icmp6.cc | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/src/icmp/Icmp6.cc b/src/icmp/Icmp6.cc
+index 794a51a..ee84b80 100644
+--- a/src/icmp/Icmp6.cc
++++ b/src/icmp/Icmp6.cc
+@@ -256,7 +256,7 @@ Icmp6::Recv(void)
+     #define ip6_hops    // HOPS!!!  (can it be true??)
+ 
+         ip = (struct ip6_hdr *) pkt;
+-        pkt += sizeof(ip6_hdr);
++        NP: echo size needs to +sizeof(ip6_hdr);
+ 
+     debugs(42, DBG_CRITICAL, HERE << "ip6_nxt=" << ip->ip6_nxt <<
+             ", ip6_plen=" << ip->ip6_plen <<
+@@ -267,7 +267,6 @@ Icmp6::Recv(void)
+     */
+ 
+     icmp6header = (struct icmp6_hdr *) pkt;
+-    pkt += sizeof(icmp6_hdr);
+ 
+     if (icmp6header->icmp6_type != ICMP6_ECHO_REPLY) {
+ 
+@@ -292,7 +291,7 @@ Icmp6::Recv(void)
+         return;
+     }
+ 
+-    echo = (icmpEchoData *) pkt;
++    echo = (icmpEchoData *) (pkt + sizeof(icmp6_hdr));
+ 
+     preply.opcode = echo->opcode;
+ 
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.7.bb b/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
index c3eabcd..750484a 100644
--- a/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
+++ b/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${MIN_VER}/${BPN}-${P
            file://squid-use-serial-tests-config-needed-by-ptest.patch \
            file://run-ptest \
            file://volatiles.03_squid \
+           file://CVE-2016-3947.patch \
 "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c492e2d6d32ec5c1aad0e0609a141ce9 \
-- 
2.8.2


