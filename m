Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8455E6C538
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Feb 2019 02:02:16 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id y1so2341063pgk.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Feb 2019 18:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KkaUo7KBk5patc39UvDq4HWHTWhsoOPGrl7Qv1qaULg=;
	b=JdY3PCoe5Ot8V+l2rIavS7A0N1tSv9ZH5XSJJeOEKfTOdtkcOdk78u55ejgFFwyo3Q
	wyMC82pCkcb3uzFTk+L3U3tpdNy1aB/QI8QDTiKgrn4Gt9+mRCivaQyKOyXaThRadeQz
	E41cocSLNZceBrDNok/5YvjwMNdU/z1hk6FaoOEKbtllRwNbcFYTko/q9GZDtlQ0h9i+
	mmdoGk2u2/v2MXM+3bpjTj68J2KlQULUv+kflD6ZnTFkVhzXFC9T5UxoJd4joREM1mS7
	vttYYIVKYFWLdh6SsKLRLu0oDDXD52klqCveTXyiOa+K9ev//x/olVyOUvk1ila7zpRS
	fNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KkaUo7KBk5patc39UvDq4HWHTWhsoOPGrl7Qv1qaULg=;
	b=nY7skt1VTsxGd/tz4LJTUHUKzZSM5t8Jzj2fA+dabfgQ9IeLZjZxn/uvMZ4JZeOYAn
	fYIWTrf7jxQkTVKPBC+3eYh9HJNJB1dnjyM8RFHk66RMfael8f6Qsuy0GdG+NXalb4aA
	CKvMw+imAKdHHHXW/svZ76uClAPIrImQZd9KIbY4fF2aDRRKd5X5z/UsEz91obBKb5i4
	XZyOorH3HCQZKac6vTyrppvyTWQPwBWKwpODZZpE58BBV5dvGJP5547wrfjsPxZ+zWtU
	sLlRhxyCpvjJb/hkHAC7/3MIT2KtmaMWokAk2w/ZxvhizA8FAmS8Hu4wsIV70wY4hfXU
	oTtg==
X-Gm-Message-State: AHQUAuaG7eA8NH8Ar+GP5HgvsG3J7LNRzLlR/GcVMoOXQKdT3kSzNZaf
	Y3YT2vPslwpEIwSB+weiHQhhBqrR
X-Google-Smtp-Source: AHgI3IauO8/f5nm7fQocsBZ4Paoku2R3Yiuqvo25La5ZRT0Z/tqXjRwIX0r2k63qN/q9DHdu0esHpA==
X-Received: by 2002:a62:178f:: with SMTP id 137mr25145767pfx.226.1549677736805;
	Fri, 08 Feb 2019 18:02:16 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::dc44])
	by smtp.gmail.com with ESMTPSA id
	g26sm4221184pfh.61.2019.02.08.18.02.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Feb 2019 18:02:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Feb 2019 18:02:06 -0800
Message-Id: <20190209020206.11491-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH V2] libupnp: Upgrade to 1.8.4
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
X-List-Received-Date: Sat, 09 Feb 2019 02:02:16 -0000
Content-Transfer-Encoding: 8bit

License-Update: Renamed and deleted empty line

License file is now called COPYING
https://github.com/mrjimenez/pupnp/commit/d3a04002e5e5220f88b43d979505bb3156532e83#diff-7116ef0705885343c9e1b2171a06be0e

This is 3 Clause BSD license so make it accurate

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix license checksums

 .../recipes-connectivity/libupnp/libupnp_git.bb       | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp_git.bb b/meta-multimedia/recipes-connectivity/libupnp/libupnp_git.bb
index 7a524f2d50..50d19de675 100644
--- a/meta-multimedia/recipes-connectivity/libupnp/libupnp_git.bb
+++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp_git.bb
@@ -5,16 +5,17 @@ protocols along with a UPnP-specific eXtensible Markup Language (XML) parser \
 supporting the Document Object Model (DOM) Level 2 API and an optional, \
 integrated mini web server for serving UPnP related documents."
 HOMEPAGE = "http://pupnp.sourceforge.net/"
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b3190d5244e08e78e4c8ee78544f4863"
+LIC_FILES_CHKSUM = "file://COPYING;md5=394a0f17b97f33426275571e15920434"
 
-PV = "1.8.2+git${SRCPV}"
-SRCREV = "56d6042abae861e8838a4e6b6b5b575b99e38f34"
+PV = "1.8.4+git${SRCPV}"
+# release-1.8.4
+SRCREV = "d5a01fc9895daae98a0c5a8c7d3afce46add529d"
 SRC_URI = "git://github.com/mrjimenez/pupnp.git;protocol=https"
 
 S="${WORKDIR}/git"
 
 inherit autotools
 
-EXTRA_OECONF += "--enable-reuseaddr"
\ No newline at end of file
+EXTRA_OECONF += "--enable-reuseaddr"
-- 
2.20.1


