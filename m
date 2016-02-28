Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1B3976FF69
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2016 22:54:52 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id l68so15263636wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2016 14:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=psQZo+Gw1UM6eFU12p2zc/PkZojoN+0tUWKb+bKUcHY=;
	b=ZoZ/pwh9Vdw9qyxlvNbv+0NjcLlE1O2U4i6NtdRuWhoUobxcvkcgeeqLndROy7nhMW
	9zsGtKAmr+BCp7uCnQLzBLztTq7NILxYb1ozZcqk4psGbhPZlfT2EQnS7Mq+KWvwMfA7
	p3E7pWCKaOpbuDinbvvA/m/rSB8eTrcm5J/1wvhuEjhTazcq4cAj0hkYcXpt2XI0vwoB
	3oHqVe43p2tUDD1EdM0YHjtVmv9ttWKJ1529ORbfJtb2POAePHg9JlyT7sy16baIsmkP
	txcEcpzHwX/GLSBOmec6ttDvm//AnAm832ioU4p+OYMXAbL/D16FwGGwlnJJNgIi+5lY
	G2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=psQZo+Gw1UM6eFU12p2zc/PkZojoN+0tUWKb+bKUcHY=;
	b=XUWQ099JFgZ4By3pmrmL9bSGzZlxImDhN6o04Fj2OJmG4ls4l7gJBxs6HV+HwZdzvZ
	E21BnKVhCxtMR0C07+qI9HuPKPfn4wZhbFGnBrby3N/TkatRCJlxfpL3nE0URJgxOJCf
	W8mcgsaqjai95XRs3k9Jm+L4AEeM29hV/SnLKZNFkg9qFGNv6ql1NbrS5jlnsCs+MCjg
	zXtfYTrcBNSGjz/twTMA4TWYrAc3l1r99NKgeFJMVLlYeRTby+nFNWeyUPe1zBu7+rkg
	TURSbXK/8E95MDL+Ojde+Zy2iVQZ09Jsb8NiI1l6w+NmegEPJpdWCFwtX59JpOKtTprH
	wDxA==
X-Gm-Message-State: AD7BkJKsbRjHWCZ4hfylYpsqogtJtxrMJ9swUDHDIF12SOhK/peuVP9K/ox5hhJLUkI6oA==
X-Received: by 10.194.120.229 with SMTP id lf5mr12949081wjb.151.1456700093460; 
	Sun, 28 Feb 2016 14:54:53 -0800 (PST)
Received: from ThinkPad-T520.homenet.telecomitalia.it
	(host225-252-dynamic.0-87-r.retail.telecomitalia.it. [87.0.252.225])
	by smtp.gmail.com with ESMTPSA id
	202sm13543004wmo.7.2016.02.28.14.54.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 28 Feb 2016 14:54:53 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 28 Feb 2016 23:54:50 +0100
Message-Id: <1456700090-10792-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-initramfs][PATCH] kexecboot: enable text UI in default EXTRA_OECONF.
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
X-List-Received-Date: Sun, 28 Feb 2016 22:54:53 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
index 3397c29..45095f3 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
@@ -53,7 +53,7 @@ SRC_URI += "\
 
 inherit autotools
 
-EXTRA_OECONF = "--enable-delay=2 --enable-evdev-rate=1000,250"
+EXTRA_OECONF = "--enable-textui --enable-delay=2 --enable-evdev-rate=1000,250"
 
 do_install () {
     install -d ${D}${bindir}
-- 
1.9.1


