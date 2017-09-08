Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id E7C54780F3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Sep 2017 05:33:32 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id q76so935951pfq.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Sep 2017 22:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xFkruYL1jjGJQ841Hy4yB4nQDm09yRyb3y04YaQkRKc=;
	b=FXirF6oKwmZrkFR9xX8u51ZOZ6gKdIs6RtOIJmzp2zRlcWifz8zRZFdJ9Oxq+ctPd6
	ryq07So2Sf/vY/kUc/c73S265owOhqeicVm4D1jnMooNgTWA1faX+R1tgizyVRTZRnHw
	RYoir6g+yPIopBFA157Nv6qzoPJvSanPTO06favxW0PVIupJzbnPVjUrmKyvhz7btGDr
	RN90oPE8tIIGZa0aBRn//ZWACkWtC5p3AtU5kXCD+/qcfWSGwb+HT5PyVDRHbrm7RlNM
	L/rr47FPxgCuoYl958RoluGg2HduUkZwrjf1AyAHkFDCon4BnSUHtWGoaOz2ZV4sfwGm
	4xnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xFkruYL1jjGJQ841Hy4yB4nQDm09yRyb3y04YaQkRKc=;
	b=QSxRZ0zdkepXlXVEdFGMzCfQRb+Ma0S7xjWGJ3ueZHXQolXMw/U6s/pI8xWhAZ+lZ7
	2COb9Itx5Zfxw4N5yieuGwE4F4nRgi36By7QYPVFMUkvqPgoUUA7wx+eQurLujMv4Dft
	U9QwieCH1+fzq8DyKKeWCh/6RupxzL834Alb0/iHuw6+FwsjCihFcNvpJLGQzdFSJD/l
	fIleo9AUjJQc0ONn+nmTuTRcCpPGZ6HE999Mgp6dHEKwK+LpBBiH2xfVStKG3tN2b5v+
	4rAuGoZC8qi2sD/WDbWjRjfaUtOzwJbHb4Lp6D6e1Q69pQ/Nje+wIKtWe7f829mqkiap
	ZL2A==
X-Gm-Message-State: AHPjjUhxXzNjUrZsgphdmdmWD/cQrqomFxJPBM+gADh0b0nv0Cn5VhqC
	qzDc4uhijq21damo
X-Google-Smtp-Source: ADKCNb5RX/IrIue/yLvQI0pwRzYQeGyPh7r1ztwkF2GmZPxg1GpTHS/UhzAwsd6XKxD7c3a0OZjpOA==
X-Received: by 10.99.144.68 with SMTP id a65mr1947793pge.429.1504848814016;
	Thu, 07 Sep 2017 22:33:34 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::be3d])
	by smtp.gmail.com with ESMTPSA id
	m190sm1564096pga.2.2017.09.07.22.33.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Sep 2017 22:33:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Sep 2017 22:33:21 -0700
Message-Id: <20170908053322.16130-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908053322.16130-1-raj.khem@gmail.com>
References: <20170908053322.16130-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/3] autofs: Fix build with musl
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
X-List-Received-Date: Fri, 08 Sep 2017 05:33:33 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...kup_multi.c-Replace-__S_IEXEC-with-S_IEXE.patch | 29 ++++++++++++++++++++++
 .../recipes-daemons/autofs/autofs_5.1.2.bb         |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs/0001-modules-lookup_multi.c-Replace-__S_IEXEC-with-S_IEXE.patch

diff --git a/meta-networking/recipes-daemons/autofs/autofs/0001-modules-lookup_multi.c-Replace-__S_IEXEC-with-S_IEXE.patch b/meta-networking/recipes-daemons/autofs/autofs/0001-modules-lookup_multi.c-Replace-__S_IEXEC-with-S_IEXE.patch
new file mode 100644
index 000000000..7ac145674
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs/0001-modules-lookup_multi.c-Replace-__S_IEXEC-with-S_IEXE.patch
@@ -0,0 +1,29 @@
+From e4ee00e08acd7c0912a3264ad32e4de861c7416f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 7 Sep 2017 22:22:31 -0700
+Subject: [PATCH] modules/lookup_multi.c: Replace __S_IEXEC with S_IEXEC
+
+__S_IEXEC is internal to libc and may not be available on
+all libc e.g. musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ modules/lookup_multi.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/modules/lookup_multi.c b/modules/lookup_multi.c
+index 3ecda6d..cf109de 100644
+--- a/modules/lookup_multi.c
++++ b/modules/lookup_multi.c
+@@ -452,7 +452,7 @@ int lookup_reinit(const char *my_mapfmt,
+ 					continue;
+ 				}
+ 
+-				if (st.st_mode & __S_IEXEC)
++				if (st.st_mode & S_IEXEC)
+ 					type = src_prog;
+ 				else
+ 					type = src_file;
+-- 
+2.14.1
+
diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.1.2.bb b/meta-networking/recipes-daemons/autofs/autofs_5.1.2.bb
index ccd8a7f24..68c64fdb0 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.1.2.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.1.2.bb
@@ -26,6 +26,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.gz \
            file://0002-Replace-__S_IEXEC-with-S_IEXEC.patch \
            file://autofs-5.1.2-libtirpc-as-need.patch \
            file://pkgconfig-libnsl.patch \
+           file://0001-modules-lookup_multi.c-Replace-__S_IEXEC-with-S_IEXE.patch \
            "
 SRC_URI[md5sum] = "28cf88f99eff553a8500659ba5d45a76"
 SRC_URI[sha256sum] = "0d57e4138c2ec8058ca92164d035546f68ce4af93acb893369993d67c7056a10"
-- 
2.14.1


