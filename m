Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1917.1795113427737020031
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:37:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=RCoCAdh2;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdd9d0c9bbdso51884a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113427; x=1795718227; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AzK/GcssTXrpUDQaCDfhx0bFanW0XUz8u95RSnWXkYE=;
        b=RCoCAdh2+j8TPY5ETXFZuZJgjQnpPSZnyTxyRF7dbq7qE15zR7Jzbz3jURqfDhb7SJ
         vtbLv3peZ7FSWQ+8OMFWSLDvqE/6bxNxNcU2Ofs9F8WnpdHkliKEBDDBoG6FLifzYWRw
         27R1gttj1vqwwCNCVO5RAi5LAznVtbXXfaiarbmi6iNELpzMVZRfS7pPLxLa7oOokpF9
         OBWCNhHHJGxhwc98ESdDo2uIdV7raWpAuiOYctcuCZBfvSHmC/Fo55qyuR1NnEC3Xskm
         OAqR7Oz0Eq3B1yX8iPIMEx0GKpfrUgg2hYR5qhwQxWXDrHxp407jvxBNEAIugzAxedLn
         6DiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113427; x=1795718227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AzK/GcssTXrpUDQaCDfhx0bFanW0XUz8u95RSnWXkYE=;
        b=UXvro0Dg6m4/9dI2dq6OEFRLgYiexVdd46bNz4Nnv3gMKP9ht7L4shp5kjlPQaGKjl
         L9FC3rngumVhql2tprrDVT27p70BM1//4lK5qdgE342wXgnGmXlXAMOywTNKQ6Uya8bc
         ODb7BD8cyY6lH/UDKMPU8XoeT68ekG9gOVzYbcARJ972KGszQu36yOH3sUh+FOrGKAw9
         Lts/fsRvf1BcNtzLlQzZ0YTYldvuPz+TzusB2WVgg3eBrsnzr0UJtCyAY6bMi799uY/N
         rTCD01UAN1KHauG/oTEAJPOhVPKqtXdtHjRX+3R4TGzjHr2lMAYIQOjVOgtjn2yt2yAc
         WipA==
X-Gm-Message-State: APuU4Z+kK2d9UZfFfVKzML1p17v5nRybzW24W5NOJhBW3GvyaHXaBT8M
	LNvksjpEsABiql4BKCaUIkPvZS86N+2D7kD4GxYCYfVqH98eDGonKwEohBpGIA==
X-Gm-Gg: AYBFou3XLJUq8Pb5zinFDICKffTcHGaS5fgKDsOT7yVW8c7eSTQj94StA2EDUbQVCVp
	q/6fdCNsJ7E5lMcstFWugn+b2D7bDaVEP6K2kCdyc8kapRIPg7Ur3zVv78STl8a9zp3lfnWse9p
	/qTg1fB/Wm0QWiRRHK5UEyKf85dCd3B7P8JSP+zI0CQ7Ck4NFrGQbX05qYSrbjEeyM8msk8H9Za
	o49kfFy/jkEnf9VC5mRsshm84PRfQ4SD1YlPpmgFUB1HTm+Jbm6IoBqn1k+Bjd8sfO3frvr0sHp
	GhexMfmVJaaDdD8CCQ8Ao68uRp85xA0XNzFPH5GDCQoRtWUwlUM2TGFx9iiSIs1RG5eu/3rHXD8
	7DZjL6TyqEv9CuAEtQpWvbdAkNL0SXuX28mauiRiLBu6m1zNjZx/H29SsQZcgPYh0bxRzzb5An1
	SjLHtPy2TiAtYj5bTRuz5E22zlI5aOKxVDFAjFO1xBqz/uGyykyVWtwIFOh8t8si40u19iKd/Fk
	rjdBqZLr9js+h2pm95CS9qMgBTO1/q9I2D94hnuWz6wgphJOLWzaJEqvPlaLd/1fPAARr4y2Ux0
	r+4tO4TXuUoo7yOpSldQn751gx+T3Ul6i1ZRcg5ZEbEVfJmRvWzxFSc+Sa6B7A==
X-Received: by 2002:a05:6a20:c887:b0:3e2:86b6:9be8 with SMTP id adf61e73a8af0-4014d36082amr463924637.35.1795113427026;
        Thu, 19 Nov 2026 10:37:07 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:37:06 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 28/64] libgphoto2: patch CVE-2026-120451
Date: Fri, 20 Nov 2026 07:32:56 +1300
Message-ID: <8acab97a6259c675d4135245482acaf8be62efa2.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:37:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132718
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-120451

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gphoto2/libgphoto2/CVE-2026-120451.patch  | 43 +++++++++++++++++++
 .../gphoto2/libgphoto2_2.5.34.bb              |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-120451.patch

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-120451.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-120451.patch
new file mode 100644
index 0000000000..7addb4d566
--- /dev/null
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-120451.patch
@@ -0,0 +1,43 @@
+From 5924549b4750f0b17369f82e98959b779880400a Mon Sep 17 00:00:00 2001
+From: TheProtagonist07 <63047129+TheProtagonist07@users.noreply.github.com>
+Date: Wed, 28 Oct 2026 18:51:05 +0530
+Subject: [PATCH] jl2005c: reject an allocation table that does not fit the
+ buffers
+
+jl2005c_init() computes alloc_table_size from the entry count reported by
+the camera and then reads that many bytes into the 0x4020 byte info[] stack
+buffer and copies them into priv->table[0x4000]. For nb_entries >= 1022 both
+operations write past the end of their destination.
+
+Return GP_ERROR_CORRUPTED_DATA if the table would not fit.
+
+Addresses findings 1 and 2 of #1326.
+
+(cherry picked from commit 6a3393dd996502457ab965432cf0b2035278825e)
+
+CVE: CVE-2026-120451
+Upstream-Status: Backport [https://github.com/gphoto/libgphoto2/commit/6a3393dd996502457ab965432cf0b2035278825e]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ camlibs/jl2005c/jl2005c.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/camlibs/jl2005c/jl2005c.c b/camlibs/jl2005c/jl2005c.c
+index c447a2300..12c106acb 100644
+--- a/camlibs/jl2005c/jl2005c.c
++++ b/camlibs/jl2005c/jl2005c.c
+@@ -144,6 +144,14 @@ restart:
+ 	alloc_table_size = priv->nb_entries * 0x10 + 0x30;
+ 	if (alloc_table_size%0x200)
+ 		alloc_table_size += 0x200 - (alloc_table_size%0x200);
++	/* nb_entries comes from the camera. The table has to fit into the
++	 * local info buffer as well as into priv->table. */
++	if ((size_t)alloc_table_size > sizeof(info) ||
++	    (size_t)alloc_table_size - 0x30 > sizeof(priv->table)) {
++		GP_DEBUG("alloc_table_size 0x%x is too large for %d entries\n",
++			 alloc_table_size, priv->nb_entries);
++		return GP_ERROR_CORRUPTED_DATA;
++	}
+ 	/* However, we have already just now downloaded 0x200 bytes, so
+ 	 * when downloading the rest of the table we correct for that and
+ 	 * just download whatever remains of the information block.
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.34.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.34.bb
index fca158fe11..488364b542 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.34.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.34.bb
@@ -12,6 +12,7 @@ DEPENDS = "libtool jpeg virtual/libusb0 libexif zlib libxml2"
 SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/${BP}.tar.xz;name=libgphoto2 \
            file://40-libgphoto2.rules \
            file://0001-configure-Filter-out-buildpaths-from-CC.patch \
+           file://CVE-2026-120451.patch \
            "
 SRC_URI[libgphoto2.sha256sum] = "51993f5d9bfb6b4e5925cbbe5883085791bff6f81bcacb8ffe1b783ce76d586a"
 
