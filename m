Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2321CAC5B3
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 10:39:50 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.13102.1758621432694731465
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 02:57:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J0VTQxac;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: nitin.wankhade333@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b5509894ee9so491018a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 02:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758621431; x=1759226231; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0CJJ8ySW4s75tynIMwKv6339OAVJM35hBBWES/Jbmx0=;
        b=J0VTQxaczxmxLXNvkFg18i3l2BAJS1+oV/ngUDtCDsrWhyE+pK48yayCRMGw/uqXfI
         F2nRx2KXoNt6vTTJ0tFy8YbE3gqHEBE/K1artRMjLBcyK0C7gAzJ0IO1xFRUS4ZhPtZ0
         XmuL22TTLpt8ePzZaqdY3brcZR74d8Lo4KzfnJo1wzZcqKxhYoEVu4+mPvctrDf5Fm8f
         Ss7omDZ1lvvAQYvnkz4a6BMdydHPUHAEgRT8C55eZ8O3vuH7llzcbs8apFBAzg3e6doy
         4gt7BAeTw+o82WgxgHCEQy5q2W7e1Jj+fpRtmVkatwC/iUyaCCt5O93bM0UEl/bmOoYQ
         VjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758621431; x=1759226231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0CJJ8ySW4s75tynIMwKv6339OAVJM35hBBWES/Jbmx0=;
        b=l3UONIQDev+v0QYhD3EDayoEzZxb4F3tZ+lRfyX0p5vU9KkopAgYVytBijzRBREEM/
         9Q4p5cGPeJvz2ySaBxbbIOweSuczFNGLONO0YWnXONKvWZmVczaiefFfg+Z4JYpNXMzi
         4zx4k5nR6kwy5YkbAX5QmQ+iv+Gp5KWQk40p5NfWGQ8rh2z86vthZNIqNuhG76LmKIBB
         fXre36oIjhgtvWeBHEzxnwEC+RbGag5PjEbf+xKsJL+clthJoQ9kvbpKLo0nAp/H45Dr
         rVzeJGRNp5vu3sQRwuJCKvbpoMM4/cCXzmuxFgBMlhywqtEbO91St9+BAkncIYBvXq5w
         M0Tw==
X-Gm-Message-State: AOJu0Yx8NWY3bTw9XNqZcIpiPZyTXe7oLIxBpUMwRt62wOALHPmB1sTa
	cw4I1gxner41MgyBWAiDoe4bJvEr12K3fgJkQ9XdqHgC4zt8TXkTfw3THo8WjxJb
X-Gm-Gg: ASbGncvHmhIZp5CS2ian4HBfVtwfTwMy5gllFZLEi4YME5deBoxfn0sz8qppPvPonBb
	xqWp0yviGBSoC5bvVSzIXxk1iIfLWSXdac4Sz7Gk98ub50V0uFsmvbPL80KOCUeXj00XDtEXfwq
	1CHOyTkuXhZ3Zm0Q0krxzB7MIRy4GgwZZ5ozBbiryw5kg7PqSBQ8rzexrD1fd1o10R5FD9o3V8e
	f64TUXPKIJgYdiPs/LyJjX3xx8pMmhDhGX3RVcj8Ypz5UuOjRkfBcLI8g6hPo5AZYxXAXkXC3NN
	I6pC2mJ7dXnZ7PSAybR5UmApWxhgnKWFIVETydt5j2lRF/mZju1GAUwjDVdSwhCx4MWv7AMibeb
	u6vwmEXfrEz3fO4IXIl3rVL9+BjUrCGu9eMN/LQw9npIMFkOro923rg==
X-Google-Smtp-Source: AGHT+IHY7mWuE+H795PIRQQt2ddBYkN9sNF3Pygb40w5d9u/MDSBBSQCqteXwUHzjjqF4wU63LW42g==
X-Received: by 2002:a05:6a00:1796:b0:775:f364:9466 with SMTP id d2e1a72fcca58-77f539e8592mr1269018b3a.6.1758621431416;
        Tue, 23 Sep 2025 02:57:11 -0700 (PDT)
Received: from LL-3324L.kpit.com ([2401:4900:1c45:4aaf:f702:9ced:7f9b:68e6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f363ed5a0sm5762125b3a.41.2025.09.23.02.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 02:57:10 -0700 (PDT)
From: Nitin Wankhade <nitin.wankhade333@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Divyanshu.Rathore@bmwtechworks.in,
	Florian Westphal <fw@strlen.de>,
	Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
Subject: [OE-core][Scarthgap][PATCH] examples: genl: fix wrong attribute size
Date: Tue, 23 Sep 2025 15:29:03 +0530
Message-Id: <20250923095903.2687733-1-nitin.wankhade333@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 10:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119663

This example no longer works on more recent kernels:

genl-family-get
error: Invalid argument

dmesg says:
netlink: 'genl-family-get': attribute type 1 has an invalid length.

Fix this and also zero out the reserved field in the genl header,
while not validated yet for dumps this could change.

Upstream-Status: Backport [https://git.netfilter.org/libmnl/patch/?id=54dea548d796653534645c6e3c8577eaf7d77411]

Reported-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
Signed-off-by: Florian Westphal <fw@strlen.de>
(cherry picked from commit 54dea548d796653534645c6e3c8577eaf7d77411)
Signed-off-by: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
---
 ...amples-genl-fix-wrong-attribute-size.patch | 44 +++++++++++++++++++
 meta/recipes-extended/libmnl/libmnl_1.0.5.bb  |  5 ++-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libmnl/files/0001-examples-genl-fix-wrong-attribute-size.patch

diff --git a/meta/recipes-extended/libmnl/files/0001-examples-genl-fix-wrong-attribute-size.patch b/meta/recipes-extended/libmnl/files/0001-examples-genl-fix-wrong-attribute-size.patch
new file mode 100644
index 0000000000..9e06abb9a4
--- /dev/null
+++ b/meta/recipes-extended/libmnl/files/0001-examples-genl-fix-wrong-attribute-size.patch
@@ -0,0 +1,44 @@
+From 67ad7abf1fe888c650f9e8ed326a499e1456285c Mon Sep 17 00:00:00 2001
+From: Florian Westphal <fw@strlen.de>
+Date: Mon, 15 Sep 2025 14:40:30 +0200
+Subject: [PATCH] examples: genl: fix wrong attribute size
+
+This example no longer works on more recent kernels:
+
+genl-family-get
+error: Invalid argument
+
+dmesg says:
+netlink: 'genl-family-get': attribute type 1 has an invalid length.
+
+Fix this and also zero out the reserved field in the genl header,
+while not validated yet for dumps this could change.
+
+Upstream-Status: Backport [https://git.netfilter.org/libmnl/patch/?id=54dea548d796653534645c6e3c8577eaf7d77411]
+
+Reported-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+Signed-off-by: Florian Westphal <fw@strlen.de>
+(cherry picked from commit 54dea548d796653534645c6e3c8577eaf7d77411)
+Signed-off-by: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
+---
+ examples/genl/genl-family-get.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/examples/genl/genl-family-get.c b/examples/genl/genl-family-get.c
+index ba8de12..0c20067 100644
+--- a/examples/genl/genl-family-get.c
++++ b/examples/genl/genl-family-get.c
+@@ -199,8 +199,9 @@ int main(int argc, char *argv[])
+ 	genl = mnl_nlmsg_put_extra_header(nlh, sizeof(struct genlmsghdr));
+ 	genl->cmd = CTRL_CMD_GETFAMILY;
+ 	genl->version = 1;
++	genl->reserved = 0;
+ 
+-	mnl_attr_put_u32(nlh, CTRL_ATTR_FAMILY_ID, GENL_ID_CTRL);
++	mnl_attr_put_u16(nlh, CTRL_ATTR_FAMILY_ID, GENL_ID_CTRL);
+ 	if (argc >= 2)
+ 		mnl_attr_put_strz(nlh, CTRL_ATTR_FAMILY_NAME, argv[1]);
+ 	else
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/libmnl/libmnl_1.0.5.bb b/meta/recipes-extended/libmnl/libmnl_1.0.5.bb
index 66b30d7f60..d0bf658eef 100644
--- a/meta/recipes-extended/libmnl/libmnl_1.0.5.bb
+++ b/meta/recipes-extended/libmnl/libmnl_1.0.5.bb
@@ -6,7 +6,10 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "https://netfilter.org/projects/libmnl/files/libmnl-${PV}.tar.bz2"
+SRC_URI = "https://netfilter.org/projects/libmnl/files/libmnl-${PV}.tar.bz2 \
+           file://0001-examples-genl-fix-wrong-attribute-size.patch \
+"
+
 SRC_URI[sha256sum] = "274b9b919ef3152bfb3da3a13c950dd60d6e2bcd54230ffeca298d03b40d0525"
 
 inherit autotools pkgconfig
-- 
2.34.1


