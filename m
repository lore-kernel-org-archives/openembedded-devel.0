Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SpbSU-0007zx-KT
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 10:42:51 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2247517bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 01:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=F/9orOvx3BtZoMEmzh/xfVKFYaL2Hx134jMi2AqE/y8=;
	b=miJd4nM8zkc6Jl1RlCi2hPZ2xGKGfugCxCOWYAFSnJtbezV2slf2riPITj6VSs5C//
	Z3oBCi7bYLtTiZJ00ALWoDdS2HHOGU3fFThuBz5MuIPW6xi2QZOqHA5rd07Kyn8GXKn6
	FAmUXC4P/xRFcmitsxoxLB60KnFFYEmLau6k9WjANHSML268ixVDGeHcp/iGswYEAsBC
	Z2xVPzBO3ueqwGIvjNEf89Wx4MxKhNYwMEKc5FjzE4f8NAdFFh03TkyL73NwSMM+PO56
	4EVKpeWNZBBufq9i6ALZYPvha3wpVBprWkkBGjVo5nkg51J/aaMap/IeCVJoyKkOMynn
	hcYA==
Received: by 10.205.117.141 with SMTP id fm13mr105990bkc.125.1342168290818;
	Fri, 13 Jul 2012 01:31:30 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id fu8sm4214355bkc.5.2012.07.13.01.31.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 01:31:29 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 10:30:24 +0200
Message-Id: <1342168240-7760-17-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, V2 16/32] cronie: move systemd support to meta-systemd
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
X-List-Received-Date: Fri, 13 Jul 2012 08:42:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-extended/cronie/cronie/crond.service   |    0
 .../recipes-extended/cronie/cronie_1.4.8.bbappend  |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-extended/cronie/cronie/crond.service (100%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-extended/cronie/cronie_1.4.8.bbappend (69%)

diff --git a/meta-oe/recipes-extended/cronie/cronie/crond.service b/meta-systemd/meta-oe/recipes-extended/cronie/cronie/crond.service
similarity index 100%
rename from meta-oe/recipes-extended/cronie/cronie/crond.service
rename to meta-systemd/meta-oe/recipes-extended/cronie/cronie/crond.service
diff --git a/meta-oe/recipes-extended/cronie/cronie_1.4.8.bbappend b/meta-systemd/meta-oe/recipes-extended/cronie/cronie_1.4.8.bbappend
similarity index 69%
rename from meta-oe/recipes-extended/cronie/cronie_1.4.8.bbappend
rename to meta-systemd/meta-oe/recipes-extended/cronie/cronie_1.4.8.bbappend
index 5aedb21..66db466 100644
--- a/meta-oe/recipes-extended/cronie/cronie_1.4.8.bbappend
+++ b/meta-systemd/meta-oe/recipes-extended/cronie/cronie_1.4.8.bbappend
@@ -1,7 +1,7 @@
 # look for files in the layer first
-FILESEXTRAPATHS := "${THISDIR}/${PN}"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC = "2"
+PRINC := "${@int(PRINC) + 3}"
 
 inherit systemd
 
-- 
1.7.6.5



