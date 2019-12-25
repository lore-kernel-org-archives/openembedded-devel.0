Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8CE7F7C7A9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Dec 2019 16:54:42 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id l35so2482713pje.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Dec 2019 08:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=doNv+YS5AA7UYHRunwK9T1x0qODELLAwhYrfAnZT9a0=;
	b=iC3Yw/s1ycLYag7EkoWXuRvWsh5LoIX3CLe5Hoae0wVYV/uoNb6gzOEFkLx+yyG1RG
	maeWbGFrLNt7RjYrgzIxs3NbQDcFfucT1B2tHhx/hrxNN/gIZFMBwI81pWoeixdltX7F
	Ky2Gct7D1dDJt0IOIfV+0yVW3w3bT5wCvjnm4LPRdeOf10+T/cBMi5FsDNQMC7tbCuh9
	kMwbgJcfdK0xYCpb1PvLCPuBw32dAGY9tCbvVM5HtUaS1gF+O4XdMeOGMDRz3wx7vk9T
	pNeoE7C7r9qOLE1nH8rRx8j5jZ3gdAmtKXAFZ/MWHJNCAwsI44occjpMWmq8fFPDRttF
	VfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=doNv+YS5AA7UYHRunwK9T1x0qODELLAwhYrfAnZT9a0=;
	b=gH0XOVIEX5BiZxIaX/Tb27uJWd1sosZHoeTiM9NhLxKFnV+lo/5QZDvyrp1Zo74RmF
	4XU/RZaI7ZmU2RH6ZhuXa/sM0x1GLWd+/dTFga1qp3hOK4WeV7OJCTOfumo4lhQ+GXAV
	PJQ8JWbEj/TZGHVRzt31E7niYGnt7qXLq+kdz84JLVKGUf4hRA++1cCdaE47efQPyNlC
	+QgUfg3R7BJEpNI5lvxRyc/IHXBqRjn5BULWCJVIi/DktgkfJa1nifZ0eccmbPQ3NREH
	/NytVPat9JZm0vmCtOTIjxOXIys0MLjFkkETDRNmz61UXGT+28+sn5L4NghvWdDoHUZO
	U9xw==
X-Gm-Message-State: APjAAAUW45Ji2is4yVrXljN8Oh2B8fx6v4/Aa0K11HhS0D9TbsTsZ3Dq
	WAoo27NgfnWHs6jq8l/WRLQoEEMsud0=
X-Google-Smtp-Source: APXvYqzDYF+W1Fr2ogR4uKkEsATh50We0/C57lroey8l9zRrD6cIxnKoBAxHbXBghE/0wzZ76ARfeg==
X-Received: by 2002:a17:90a:ac18:: with SMTP id
	o24mr14087529pjq.33.1577292882900; 
	Wed, 25 Dec 2019 08:54:42 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	y38sm29859982pgk.33.2019.12.25.08.54.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 25 Dec 2019 08:54:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Dec 2019 08:54:35 -0800
Message-Id: <20191225165435.2122812-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libubox: Update to latest
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
X-List-Received-Date: Wed, 25 Dec 2019 16:54:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix out of bounds array access

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...x-array-out-of-bounds-GCC-10-warning.patch | 42 +++++++++++++++++++
 .../recipes-devtools/libubox/libubox_git.bb   |  3 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/libubox/libubox/0001-blobmsg-fix-array-out-of-bounds-GCC-10-warning.patch

diff --git a/meta-oe/recipes-devtools/libubox/libubox/0001-blobmsg-fix-array-out-of-bounds-GCC-10-warning.patch b/meta-oe/recipes-devtools/libubox/libubox/0001-blobmsg-fix-array-out-of-bounds-GCC-10-warning.patch
new file mode 100644
index 0000000000..4f1dd76326
--- /dev/null
+++ b/meta-oe/recipes-devtools/libubox/libubox/0001-blobmsg-fix-array-out-of-bounds-GCC-10-warning.patch
@@ -0,0 +1,42 @@
+From a12325a0cbf3bf1d66a0b0f8d85e08083bae6066 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
+Date: Wed, 25 Dec 2019 10:27:59 +0100
+Subject: [PATCH] blobmsg: fix array out of bounds GCC 10 warning
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes following warning reported by GCC 10.0.0 20191203:
+
+ blobmsg.c:234:2: error: 'strcpy' offset 6 from the object at 'attr' is out of the bounds of referenced subobject 'name' with type 'uint8_t[0]' {aka 'unsigned char[0]'} at offset 6 [-Werror=array-bounds]
+   234 |  strcpy((char *) hdr->name, (const char *)name);
+       |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+ In file included from blobmsg.c:16:
+ blobmsg.h:42:10: note: subobject 'name' declared here
+    42 |  uint8_t name[];
+       |          ^~~~
+
+Upstream-Status: Submitted [https://gitlab.com/ynezz/openwrt-libubox/commit/3775b3aa28de8c20d96b6f02786a327423b0748a]
+Reported-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Petr Štetiar <ynezz@true.cz>
+---
+ blobmsg.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/blobmsg.c b/blobmsg.c
+index a860483..b6b7535 100644
+--- a/blobmsg.c
++++ b/blobmsg.c
+@@ -195,7 +195,7 @@ blobmsg_new(struct blob_buf *buf, int type, const char *name, int payload_len, v
+ 	attr->id_len |= be32_to_cpu(BLOB_ATTR_EXTENDED);
+ 	hdr = blob_data(attr);
+ 	hdr->namelen = cpu_to_be16(namelen);
+-	strcpy((char *) hdr->name, (const char *)name);
++	memcpy(hdr->name, name, namelen);
+ 	pad_end = *data = blobmsg_data(attr);
+ 	pad_start = (char *) &hdr->name[namelen];
+ 	if (pad_start < pad_end)
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-devtools/libubox/libubox_git.bb b/meta-oe/recipes-devtools/libubox/libubox_git.bb
index f9f4e08b71..7dbefa1152 100644
--- a/meta-oe/recipes-devtools/libubox/libubox_git.bb
+++ b/meta-oe/recipes-devtools/libubox/libubox_git.bb
@@ -16,9 +16,10 @@ SRC_URI = "\
     git://git.openwrt.org/project/libubox.git \
     file://0001-version-libraries.patch \
     file://fix-libdir.patch \
+    file://0001-blobmsg-fix-array-out-of-bounds-GCC-10-warning.patch \
 "
 
-SRCREV = "155bf39896f126b1ba121b816922a88dc34c31e3"
+SRCREV = "07413cce72e19520af55dfcbc765484f5ab41dd9"
 PV = "1.0.1+git${SRCPV}"
 
 S = "${WORKDIR}/git"
-- 
2.24.1


