Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 39CDD768A6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 07:58:23 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so165556452wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 00:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=rkwiEw3n5uwRDme/IyF06fLD9kChNvg73weiN5ttH08=;
	b=ehpWOUXI+qE/hGQM6MGTZasntf3Yt7eLBLaAKrhqp9funGuTk9M6TkAFVwWgWwXTxq
	L0/JcAi4UwwGp2HqjEIGgt4154+hXvb/IP9aMqCKT6qLrRPUo8rnKomoAjKkyLAVCSqR
	Emhs1NACPpJ2RDQyamqbRBkK+b1rIEMrHQgaGKS15Vq45f01sNjEqdVjJ6iK3YlphTzG
	3Tg1KQB7XuMsbdEJ6L7PtJVITG+7JgJMv09/KJZt1UbFiTWKpk4mya0jFgOsRF5z2UMT
	a3SHQ9o84khYLmtSuDGQPMM95hKP3RObQ7+BuOauo7KnByuz+aKIjWIrsxh8kiL29X+l
	0CTA==
X-Received: by 10.180.88.196 with SMTP id bi4mr34775655wib.70.1439279904083;
	Tue, 11 Aug 2015 00:58:24 -0700 (PDT)
Received: from localhost.localdomain
	(ip-109-91-251-29.hsi12.unitymediagroup.de. [109.91.251.29])
	by smtp.googlemail.com with ESMTPSA id
	fs8sm2124773wib.0.2015.08.11.00.58.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Aug 2015 00:58:23 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Aug 2015 09:57:36 +0200
Message-Id: <1439279859-1815-15-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
References: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 14/17] networkmanager: update to 1.0.4
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
X-List-Received-Date: Tue, 11 Aug 2015 07:58:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{networkmanager_1.0.2.bb => networkmanager_1.0.4.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/networkmanager/{networkmanager_1.0.2.bb => networkmanager_1.0.4.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.2.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.2.bb
rename to meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb
index 324d165..62debe9 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.2.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb
@@ -12,8 +12,8 @@ SRC_URI = " \
     ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
     file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch \
 "
-SRC_URI[md5sum] = "5a4899f89edcbdd1ac46d2d947e8d6eb"
-SRC_URI[sha256sum] = "359385707494bedbb48cfe0992ccfbcc4ac147dae1f7a47055c71e96439508ff"
+SRC_URI[md5sum] = "7eabef7bd3bbdd6dc0473dd32aeac924"
+SRC_URI[sha256sum] = "e4099fa2f4f4b8d95d0ad9fdd03ec20960845085fa500bf79aecbf54cee018c9"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
-- 
2.1.0


