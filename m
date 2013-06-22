Return-Path: <paul.betafive@gmail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7847A6ADB1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jun 2013 13:29:05 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id q58so6977726wes.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jun 2013 06:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=Bukb5RTy9dSiWcHFoxUXTevEKC66LLsHjQ9LhpAOm44=;
	b=EQTtt/u55fX3H9oXiyETyYgP9oenxBo26WC1ov9PQEQwzmaXpePjnD1XOQOaQEcW0n
	r2iWpTBiBqQEzrrTpIvqTKA8JrzQz7qgH08jJDJE2STX1RgmgMtugcx9uLxH1eBuxl7W
	A1ItdsoQjLi8aT6/zwzxglO5hkLfYtlZYCtjC3IkHkOONZO3vKRWmZoR/EKA1ORPWPAx
	2Sf+TiUTFk5MetuyKh2yHDJMgyDEypONpwiap4Qc9l1OFqbcvuko8sq6sQGZc9uWbwVR
	c4tyJho5JwZQwr2zSWuHgPmQ7KPZ4LXpmYPwy2DLrhtwvujYUHv7QIVdTv/DDqXSPHv4
	bFRw==
X-Received: by 10.194.108.132 with SMTP id hk4mr11662623wjb.43.1371907745934; 
	Sat, 22 Jun 2013 06:29:05 -0700 (PDT)
Received: from vesta.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id nj19sm4038847wic.1.2013.06.22.06.29.04
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 22 Jun 2013 06:29:05 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Jun 2013 14:28:36 +0100
Message-Id: <1371907719-8868-4-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1371907719-8868-1-git-send-email-paul@paulbarker.me.uk>
References: <1371907719-8868-1-git-send-email-paul@paulbarker.me.uk>
Subject: [meta-oe, meta-multimedia, meta-efl][PATCH RFC 3/6] libav: remove unnecessary dependency on liba52
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
X-List-Received-Date: Sat, 22 Jun 2013 13:29:05 -0000

The changelog for libav indicates that liba52 support was removed in version
0.5.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta-oe/recipes-multimedia/libav/libav.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/libav/libav.inc b/meta-oe/recipes-multimedia/libav/libav.inc
index 6e91061..a2fbe6c 100644
--- a/meta-oe/recipes-multimedia/libav/libav.inc
+++ b/meta-oe/recipes-multimedia/libav/libav.inc
@@ -9,7 +9,7 @@ PROVIDES = "ffmpeg"
 ARM_INSTRUCTION_SET = "arm"
 
 # faac faad2 lame schroedinger libgsm
-DEPENDS = "x264 virtual/libsdl zlib libogg libvorbis libvpx libtheora ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'liba52', d)}"
+DEPENDS = "x264 virtual/libsdl zlib libogg libvorbis libvpx libtheora"
 
 INC_PR = "r8"
 
-- 
1.8.3.1


