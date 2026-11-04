Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2641.1793772339733987599
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 22:05:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=KV5pGFQb;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36661f953e4so405154eec.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 22:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793772339; x=1794377139; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aXnFhiPyaPWYRqp5JNXHZaSwkytPvssv+DRnfv4swMU=;
        b=KV5pGFQbtyftKirpzI+63Hjeqa5XFhA79piSadVrnotp/kcNp4orGo5NbbBzyhJffe
         8GGpNSOdEM2eCsU5pupgupGnkI5rU9KhhZJWBJpbrNyqg8wVRv2vFw2uwV37YD+tp4cd
         f3IKlgLEnKtQYGsko+XFkQqr4+8qQIfRhG7puZPHKfPH0FZjv5qhHV4FK3R+gX3Pa8oQ
         Awn2E3p5ww1EMFH0zF3mfsNEJKdBSqzSBoytf96UPy6HGEUxRc0xD8wuiDFxoDQGmAcq
         lusMLu/+IwJbf5SIAUgGEH8V9Bf9kC2tKlQc+33n0/hU7tBiPI8JGIvMgaWzCTfNrG3M
         v7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793772339; x=1794377139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aXnFhiPyaPWYRqp5JNXHZaSwkytPvssv+DRnfv4swMU=;
        b=ywgwGil+ffW5TdUjpYm0IbEsLQotmase99Sxf/bC7Qi6BEtXhwaubII5LyKbNYYsDu
         biWiObdWcBcQl90VEh3dN0ScIc102OsSrUuQfZNzD4C4P8sK2PniieDQIRAXh0ET6ikj
         vjKLDCHFP9FVJOUr6poWkGyAeUjksI1AWgWYo8otJaBLhDJ5TsaK7KzNVp2PWP3NZASL
         o5ps9ffwUrvHPXxxhqg8s9PxTQeGJoH+iHVHmByxGxVtHiBPi7vE5UF+cv+xkpM56OaC
         opoGmdyLM3DGM1MTGVD3CiOuyZ9271FSMuNic2p+xplK4FbRW90ZWXoxmUce4BiF+a1A
         ccKA==
X-Gm-Message-State: APuU4Z8YbE/fcacpunWdmi99F4qyDVMX+Jz2HSz8LqNkBzxW0/vfUP+z
	CScwAo0EmyeT3vd4X/Rlrcm7krT8L7BGHvctmK6Uv2955XbguFF1FUxG1vfhv5vDDY2mtA==
X-Gm-Gg: AYBFou3CIPkgBaHuLZXVOtRc/pd4bbjpCtN93UcgzMO5tL+Fpihv/7uLieyAapKiuca
	ZlO5wXQQc4yMkhJWnd7joCmezJEoqSVkmyyQW5GLn6Zdh2UI72CPSSegzLGIb4bOAIp97le1El3
	HhGIja7OxeruWGN7+jemv1zevu1kyk22aKXNnJLR5popbxTNTGuENkVxYUkVcy9OlYv7g+bqo/N
	GSY2uTQ15SeXut+ReJEviPeBt+AbB1hyK4E4kT8XTSQ2J8QKBEQDeUevkW0m7pNApV18dcbCF7e
	cdvNL76YYIZKcBW310uIXE+r/GPlptBk5eHzUC8xzJkww9uA0lWau8ndyOAwM4l8Qz2CV93DIWe
	kVGh2sKqbkJQzPG5kMKmaBLxJ5wn9OsYCI4+kAclTNP1tsXtJtNPsRZFF4Nf5IK6iRkjS3W1gx1
	M7A8pls7c3AumM4wgWihFyOcZzCrYf3qvLp1Ai4NxDtMpyLak+0XEYvOY6ye+nGlw4k9fcPX7dX
	+bZpiq8Muaf/wJ42stry5kl/tG5koFSzgKD0sLbC2wU5WT5OGzw92AYHP68+zQyodQf4H6ok0It
	gRzToCyTlkjxkkJDZ9NivvgEFEjuoIKltJwS4Myx89HVvPoAj8h9WWame3/GlOUrQvhnE4ZtBs+
	78yWA6TVGYMmLF+CK1oHdu1GIyYV72Wl2UsZMKcPiFICTlmyzRs/BqcNFnstA7VHrSr7k6+AARn
	BZIOrvA7uR0wVrwNghchLVRn6maLuOK+Ie7SyarmN0RS28WWjGc8RX73kY5iopPMo0oUVZ49F3Q
	lkWYltFP3MlfnqVCnHY6WFBmEpmi/aIUxq+LE/L/421C1W3mbEeE2J8VVUjMvbi02+9qSj7p/ve
	yQcVrnyEaM22F9c4Z5Yx1w370A==
X-Received: by 2002:a05:7301:4545:b0:36c:9ac2:475b with SMTP id 5a478bee46e88-36c9ac25267mr3721985eec.0.1793772338551;
        Tue, 03 Nov 2026 22:05:38 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3785430sm5973410eec.3.2026.11.03.22.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 22:05:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 2/3] python3-cbor2: Install docs/usage.rst for ptests
Date: Tue,  3 Nov 2026 22:05:33 -0800
Message-ID: <20261104060534.1875273-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104060534.1875273-1-khem.raj@oss.qualcomm.com>
References: <20261104060534.1875273-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2026 06:05:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131832
Content-Type: text/plain; charset="utf-8"

tests/test_sequence_docs.py executes the code examples embedded in
docs/usage.rst, resolved relative to the tests directory. The file was
not installed, so all 26 tests in it failed with:

  FileNotFoundError: [Errno 2] No such file or directory:
  '/usr/lib/python3-cbor2/ptest/docs/usage.rst'

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-devtools/python/python3-cbor2_6.2.0.post2.bb      | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_6.2.0.post2.bb b/meta-python/recipes-devtools/python/python3-cbor2_6.2.0.post2.bb
index 10f8869943..cda44d3864 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_6.2.0.post2.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_6.2.0.post2.bb
@@ -11,6 +11,10 @@ CARGO_SRC_DIR = "rust"

 require ${BPN}-crates.inc

+do_install_ptest:append() {
+    install -Dm 0644 ${S}/docs/usage.rst ${D}${PTEST_PATH}/docs/usage.rst
+}
+
 RDEPENDS:${PN}-ptest += " \
     python3-hypothesis \
     python3-tzdata \
