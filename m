Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id CEC2873751
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Mar 2015 22:25:15 +0000 (UTC)
Received: by igbhl2 with SMTP id hl2so12823721igb.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Mar 2015 14:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mDI6mIgQMncwGSDgECdyVB84Lk2DNlnyEY7vtfZ4GMI=;
	b=Co9AVJsh3/zJL7QDq1M7G7zy1NbC/oqZS7x3dvVnMW2LwpKqc33892sGfRZ2SZ1q64
	oLENUYTXf1YdKgNZuDTFZW2l99Y/n7yl2jwR9MAthIxNlrVlzDdn1aegNSXP/rPBZtu/
	MFNvT0lw3WNSs45/byYb+4choren7V0D9w1uLvrChBlg3qxcFyu8nbGOCLkKWC8sJgzd
	9BN0UCBNyTGfWxr0XRvCvc5dl14y0OHoU6XSs4pKy0TlsBQqLN/H2AlRhYc47hlZrHSQ
	gb45bIHkuFf4zadbtauUWHPCsZINMqoC/E4bTJE+TITZalbjndg3wekIIo5RRfmJB5aU
	c3IQ==
X-Received: by 10.51.17.40 with SMTP id gb8mr18378421igd.44.1425248716582;
	Sun, 01 Mar 2015 14:25:16 -0800 (PST)
Received: from kraj-ch2e.sys.comcast.net (a-96-119-88-205.sys.comcast.net.
	[96.119.88.205])
	by mx.google.com with ESMTPSA id d6sm6852297ioe.44.2015.03.01.14.25.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Mar 2015 14:25:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  1 Mar 2015 22:25:06 +0000
Message-Id: <1425248708-4076-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1425248708-4076-1-git-send-email-raj.khem@gmail.com>
References: <1425248708-4076-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/4] collectd: Backport fix build with newer gcc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 01 Mar 2015 22:25:15 -0000

on mips we get the errors of type mismatch

Change-Id: Ib7b3bd243417d1ba77e8167daf761fd4a2fc2e64
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ure-size_t-portability-in-DEBUG-statement.patch | 30 ++++++++++++++++++++++
 .../recipes-extended/collectd/collectd_5.4.1.bb    |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-extended/collectd/collectd/0001-netlink-ensure-size_t-portability-in-DEBUG-statement.patch

diff --git a/meta-oe/recipes-extended/collectd/collectd/0001-netlink-ensure-size_t-portability-in-DEBUG-statement.patch b/meta-oe/recipes-extended/collectd/collectd/0001-netlink-ensure-size_t-portability-in-DEBUG-statement.patch
new file mode 100644
index 0000000..52b9a86
--- /dev/null
+++ b/meta-oe/recipes-extended/collectd/collectd/0001-netlink-ensure-size_t-portability-in-DEBUG-statement.patch
@@ -0,0 +1,30 @@
+From f6c89c17955223bf8c99a901ca6f901b83fa521f Mon Sep 17 00:00:00 2001
+From: Marc Fournier <marc.fournier@camptocamp.com>
+Date: Wed, 3 Dec 2014 16:15:28 +0100
+Subject: [PATCH] netlink: ensure size_t portability in DEBUG() statement
+
+This prevents the following error when building on 32bit systems with
+gcc 4.7.2:
+
+netlink.c: In function 'ir_read':
+netlink.c:783:7: error: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'size_t' [-Werror=format]
+---
+ src/netlink.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/netlink.c b/src/netlink.c
+index 422dc8c..3c4642c 100644
+--- a/src/netlink.c
++++ b/src/netlink.c
+@@ -683,7 +683,7 @@ static int ir_read (void)
+         continue;
+       }
+ 
+-      DEBUG ("netlink plugin: ir_read: querying %s from %s (%lu).",
++      DEBUG ("netlink plugin: ir_read: querying %s from %s (%zu).",
+           type_name[type_index], iflist[ifindex], ifindex);
+ 
+       nlh = mnl_nlmsg_put_header (buf);
+-- 
+2.1.4
+
diff --git a/meta-oe/recipes-extended/collectd/collectd_5.4.1.bb b/meta-oe/recipes-extended/collectd/collectd_5.4.1.bb
index 92b231c..6e40076 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.4.1.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.4.1.bb
@@ -9,6 +9,7 @@ SRC_URI = "http://collectd.org/files/collectd-${PV}.tar.bz2 \
            file://no-gcrypt-badpath.patch \
            file://collectd-version.patch \
            file://glibc-2.20-compatiblity.patch \
+           file://0001-netlink-ensure-size_t-portability-in-DEBUG-statement.patch \
            file://collectd.init \
            file://collectd.service"
 SRC_URI[md5sum] = "6f56c71c96573a7f4f7fb3bfab185974"
-- 
2.1.4


