Return-Path: <jpuhlman@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8D247617C4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2020 19:02:51 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id z12so3902814pgl.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2020 11:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bwE9iJ4VBGYRIUlkMuzptc7hptwr+FOKTuew9qfqzA4=;
	b=I7rFKgAzLDENI2ahkqpL//5Ttqb0MblUrogQovN94XjjW68/xvFlUG3NApUm7ZLOEm
	uxu7JCsUg61oGsYlhMzaHEl2rgPgR6KD1Bcabm9Fze6FkL9kjTJq6nfoKDf7fnnPAS1y
	d7mBTXXaqAxVtUjRFv7ufBYwxoGV/Rbb0TIZ5qIiNsOUs43Z3iSeTO5GC8GHeeSfAVOY
	AtnMJ1UMvm99oLFyoymMRlnYrabShbhqpZ5Ac0KA5/a+wyRbx6mrLtJut9Xx5zrLFpJL
	mYhUGqFIQ+UpvXVdPOXmwsAHT0D0+e0hEIlV/1JtRM9faqkyNIJBxOJoVkAS8tZBoNzO
	5M0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=bwE9iJ4VBGYRIUlkMuzptc7hptwr+FOKTuew9qfqzA4=;
	b=kfVJyx5vvy30+ZpHTVjDRp+fL3YiI6MZa8ZXY2l4SsofhFAJefJS6xPY6KJOz32WXW
	/R26NW2i59Ol6v+cdyrHlghOjO2nZuLUoTzJxwczLxCbEvJpmIvga69qzJUIaLbIiwOe
	OZbl1YQG6qWQ/AC8MDjaLd6PxzMF3UWAfyHXZyQ3ZVN2retilIVeQHAp+BR2HsAIAExl
	UcFcgwH3+U0aLO+VhOeiqxYEtNU0ocikxvZRn3xfTlHwTLNnjPbE5koUd+FLdY+4NGwC
	6qlFk19/sSKHoxmnPhqi3AyE+oMSWm4Dt4lmDsa7f9/oekKl5marlv33t1+uWISRYA14
	YQQw==
X-Gm-Message-State: APjAAAXo9ssEqQGZlWRW7z53eQCkjvv+UqYpsy2cMgtK65V/59n9F9Nk
	xfPdEjCX9qWIF6B0SzxgnFikwscDPRI=
X-Google-Smtp-Source: APXvYqwNy6gMMnFYYb1ppDYFmfDcJo18ZR19kZ8uBadDVH+KM1AitE8mETP4z0bym4bHF29trXoYlw==
X-Received: by 2002:a63:fe50:: with SMTP id x16mr48188504pgj.31.1582484572056; 
	Sun, 23 Feb 2020 11:02:52 -0800 (PST)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id u4sm9470054pgu.75.2020.02.23.11.02.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 23 Feb 2020 11:02:51 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 6628D2A0629; Sun, 23 Feb 2020 11:02:49 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Feb 2020 11:02:46 -0800
Message-Id: <20200223190246.17729-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] ipmiutil: gzip man pages with out timestamp
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
X-List-Received-Date: Sun, 23 Feb 2020 19:02:51 -0000
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

A timestamp was getting encoded into the gzip header. This
causes multilib conflicts when installed together, and would
likely fail reproducablity tests.
---
 ...imes-from-changing-resulting-gzip-md.patch | 25 +++++++++++++++++++
 .../recipes-kernel/ipmiutil/ipmiutil_3.1.5.bb |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/ipmiutil/ipmiutil/0001-Prevent-access-times-from-changing-resulting-gzip-md.patch

diff --git a/meta-oe/recipes-kernel/ipmiutil/ipmiutil/0001-Prevent-access-times-from-changing-resulting-gzip-md.patch b/meta-oe/recipes-kernel/ipmiutil/ipmiutil/0001-Prevent-access-times-from-changing-resulting-gzip-md.patch
new file mode 100644
index 000000000..78c05ef32
--- /dev/null
+++ b/meta-oe/recipes-kernel/ipmiutil/ipmiutil/0001-Prevent-access-times-from-changing-resulting-gzip-md.patch
@@ -0,0 +1,25 @@
+From da668e5bf1a721797361ab866d09913ee8e157c4 Mon Sep 17 00:00:00 2001
+From: Jeremy Puhlman <jpuhlman@mvista.com>
+Date: Sat, 22 Feb 2020 04:37:04 +0000
+Subject: [PATCH] Prevent access times from changing resulting gzip md5sum
+
+Upstream-Status: Pending
+https://github.com/ipmitool/ipmitool/pull/186
+---
+ doc/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/doc/Makefile.am b/doc/Makefile.am
+index b792762..2c52ce6 100644
+--- a/doc/Makefile.am
++++ b/doc/Makefile.am
+@@ -59,5 +59,5 @@ install:
+ 	${INSTALL_DATA_SH} iuser.8 	 ${manto}
+ 	${INSTALL_DATA_SH} iseltime.8 	 ${manto}
+ 	${INSTALL_DATA_SH} bmclanpet.mib ${datato}
+-	cd ${manto}; gzip -f *.8
++	cd ${manto}; gzip -nf *.8
+ 	
+-- 
+2.13.3
+
diff --git a/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.5.bb b/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.5.bb
index 3e2634028..d0f3688a2 100644
--- a/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.5.bb
+++ b/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.5.bb
@@ -21,6 +21,7 @@ PARALLEL_MAKE = ""
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/ipmiutil/ipmiutil-${PV}.tar.gz \
            file://fix_systemd_path.patch \
+           file://0001-Prevent-access-times-from-changing-resulting-gzip-md.patch \
           "
 SRC_URI[md5sum] = "292d6df25cad678bb27e5c8cdc6748f9"
 SRC_URI[sha256sum] = "58ccdbd5755d7dd72478756715af09e9c73330dfad2b91dbf03d2ac504b301a3"
-- 
2.20.1


