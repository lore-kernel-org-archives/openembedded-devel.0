Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8D26865FEC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Dec 2014 08:32:49 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id r20so1777548wiv.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Dec 2014 00:32:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Xf76eWFKvOClCoMqe8YJBmNp9rkvB2FF+P9/hNp6KH8=;
	b=TIlYrAs325HJXNxXVra+AtM0Qpm2HicM9rvc1rrhgfsrNXDM/FnJijfhO12YOh00kB
	G8t5q4FwcnssG0G1Q7RJUAAfa/G6pWbErZXtMF4z+XrMkoZMnwkjskyvXSeC74yxKX7d
	s8595N2BJAkzuGWNdOyl1fP2Y5QcOPjSUWVVi56V1AD+zFLL5MWJFkNMccWPjFBDd+Cz
	4gyy95J1wDyXcHphWOoon4lk2JYwl+SVVO11UWq4E0E2AOYDb7Ya3xskZr9rsGXcKBx6
	VsEqgr1+lr1hHmJMZmSLv5wY2Xk3c1b56HJF9E++CeDV1RrMNXHM/1+kKmKFs34FRfK/
	m19g==
X-Gm-Message-State: ALoCoQmyN0uD0s1OWYlSU0mnNZYyoEjYvW6CoWC5Cj/Lv4icUlE4fLc/Tvvbrj45q9PzcMb+pVh/
X-Received: by 10.180.103.40 with SMTP id ft8mr5329799wib.68.1418373169197;
	Fri, 12 Dec 2014 00:32:49 -0800 (PST)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id kn5sm847348wjb.48.2014.12.12.00.32.47
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 12 Dec 2014 00:32:47 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Dec 2014 09:32:39 +0100
Message-Id: <1418373159-29364-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-gumstix-community] u-boot-overo 2013.07: add missing LICENSE info
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
X-List-Received-Date: Fri, 12 Dec 2014 08:33:00 -0000

OE-core moved the LICENSE info from the .inc to the .bb, update
u-boot-overo to match.

This fixes an error in bitbake-prserv-tool export.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-bsp/u-boot/u-boot-overo_2013.07.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-bsp/u-boot/u-boot-overo_2013.07.bb b/recipes-bsp/u-boot/u-boot-overo_2013.07.bb
index df43372..348c933 100644
--- a/recipes-bsp/u-boot/u-boot-overo_2013.07.bb
+++ b/recipes-bsp/u-boot/u-boot-overo_2013.07.bb
@@ -1,5 +1,9 @@
 require recipes-bsp/u-boot/u-boot.inc
 
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
+                    file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
+
 # SPL build
 UBOOT_BINARY = "u-boot.img"
 UBOOT_IMAGE = "u-boot-${MACHINE}-${PV}-${PR}.img"
-- 
1.9.0


