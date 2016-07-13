Return-Path: <philip.balister@gmail.com>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9E42B6067C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 13:28:23 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id l125so3088352ywb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 06:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=Unt5aCmA8EFD5661dHd2s6ebdlA/EwaKv/hLWCmsm0E=;
	b=uhnZCAsvnnIXr3vgf96Jrbj4THnUUN/8Jd6JaiozDKPElB2mH0a9pAZlw40K77xX9d
	73m6nn8yMm0FOsxcH1q/JzqHS4uJ5kcYg5SGHWDvRuJ0HlTPAlydiZQw0yWQkB6V0NpG
	ZfELFANYCvVY9O7JcRE3zGC7IfJQggVM2yoHe8L6DypisTCFSMLsXFR78FHknJyFpWr5
	ywZJHz2BoNUAlbeU77/qYKuc9OBpSq6QDHl9862ozVpWBnEkFmAlzXog1TPLhs3IBOo6
	1K7IaWSSNSfQKuP8p0qwQC/7JkWmnnso0sVdN8wCEvhEVEXe0ChT71R0m6z77f9JLTTF
	/TSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=Unt5aCmA8EFD5661dHd2s6ebdlA/EwaKv/hLWCmsm0E=;
	b=nEB3B9PX8h7WfoJEt/BZacqfZlM/bUWXXdjA6u7//zwU5N9chq6x5ml9qzGnCqDtrG
	eyIF1PyXLZKmnzo58Gp/dhu/21beaFHtBrXzWofO1bZp+SjM7aC23pZLyZt0qb/yoJyd
	GRHLNpsHZqS+dxZKXxCeG3gqZ16+NprpOhBtOtzcLzqNs0tgYkF3CORTVEPS9g25MscD
	O6RYdn5COXJUtwA4jnLR3q2iR84wctzcJ8666qTN8FdxptUGVTSR2ah7VaAXTdV/tNDU
	lDE1XZBS9N2WhPlPfNXsqg0UlirtlvSfDwuA8hkwjlYKJUsLijAHDbZyuLnIgcNdmmzx
	RSvg==
X-Gm-Message-State: ALyK8tJTn6PnUkBGdg/oR0QEwblx9KLeN7ERdN/YmJVxjjSr/b+7gGA3Uz8+xHDbhP6QbA==
X-Received: by 10.13.218.7 with SMTP id c7mr5497234ywe.165.1468416502949;
	Wed, 13 Jul 2016 06:28:22 -0700 (PDT)
Received: from thuvia.localdomain (pool-71-171-10-138.ronkva.east.verizon.net.
	[71.171.10.138])
	by smtp.gmail.com with ESMTPSA id j7sm8349153ywb.30.2016.07.13.06.28.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jul 2016 06:28:21 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Jul 2016 09:28:14 -0400
Message-Id: <1468416494-17044-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.5.5
Subject: [meta-oe][PATCH] libsodium: Update to 1.0.10.
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
X-List-Received-Date: Wed, 13 Jul 2016 13:28:25 -0000

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-oe/recipes-support/libsodium/libsodium_1.0.10.bb | 10 ++++++++++
 meta-oe/recipes-support/libsodium/libsodium_1.0.8.bb  | 11 -----------
 2 files changed, 10 insertions(+), 11 deletions(-)
 create mode 100644 meta-oe/recipes-support/libsodium/libsodium_1.0.10.bb
 delete mode 100644 meta-oe/recipes-support/libsodium/libsodium_1.0.8.bb

diff --git a/meta-oe/recipes-support/libsodium/libsodium_1.0.10.bb b/meta-oe/recipes-support/libsodium/libsodium_1.0.10.bb
new file mode 100644
index 0000000..370f553
--- /dev/null
+++ b/meta-oe/recipes-support/libsodium/libsodium_1.0.10.bb
@@ -0,0 +1,10 @@
+SUMMARY = "The Sodium crypto library"
+HOMEPAGE = "http://libsodium.org/"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2278eb2755b451372dde7ffeae8cde98"
+
+SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "ea89dcbbda0b2b6ff6a1c476231870dd"
+SRC_URI[sha256sum] = "71b786a96dd03693672b0ca3eb77f4fb08430df307051c0d45df5353d22bc4be"
+
+inherit autotools
diff --git a/meta-oe/recipes-support/libsodium/libsodium_1.0.8.bb b/meta-oe/recipes-support/libsodium/libsodium_1.0.8.bb
deleted file mode 100644
index a2eef4b..0000000
--- a/meta-oe/recipes-support/libsodium/libsodium_1.0.8.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = "The Sodium crypto library"
-HOMEPAGE = "http://libsodium.org/"
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=092a09b78c3be486fac807435bf17b7a"
-
-SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "0a66b86fd3aab3fe4c858edcd2772760"
-SRC_URI[sha256sum] = "c0f191d2527852641e0a996b7b106d2e04cbc76ea50731b2d0babd3409301926"
-
-inherit autotools
-- 
2.5.5


