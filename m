Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE539CCD1A5
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 18:32:16 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.20641.1761071528773881642
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 11:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AKclfFPw;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4710a1f9e4cso44092635e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 11:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761071527; x=1761676327; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QRWio3mQTZtrWhZCILwqmgGVreKA5VbxBk3FeiNPTJs=;
        b=AKclfFPwSgHQ59cuzU+uovD4SdIMFaBXTfV+n5babgXsQZ7mRtX8EQYqLy1cEBGxlV
         y+Duau+cb6Z1cVj76VZct3tyExlNei2u5J80JbHnmGXyIJEmGtCXo+z67qKRt1REdfA+
         hBkheNxeqYTnS7pieI8XSiw8Y1PKVugU8fQYLDTnvkQKABLLaw3sacz+7SbIVLpCyD33
         K8DfusB/oepe0tZsypNSPcvCCrQFB2KrnlXXcZKYw7Fyt8UpxcIS4X3kHptj4JWRrzw/
         TqxA2Xjix+vbiL6e4HTG0gowo8c8DscvoCZ5w1ooF5ClnmZxbfVdACEXevatQ0idnJ7t
         Cr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761071527; x=1761676327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QRWio3mQTZtrWhZCILwqmgGVreKA5VbxBk3FeiNPTJs=;
        b=IVF1w5YraKxtko1M2ZCp3PakXViP1jw+JyBSDsJYRoogBhLpfQxDuY1hcrAzJxsXzp
         YS+VtHSOmMm5Hf4xkezDXVvqABvqyjtP0Sv5RO70elOpwPFh36cEkLIE9jQ7mCH9/rlG
         XizEkaMLdd2yEyfQDK0EOTPLad4UZEjvId8mvt3LIQNCyUrYDB9+s9TO5VbNUrkCJQ/z
         43vyfh2q9CrvPVqXySS5OVuj7kqtmc19mgAcAtTCYz2Yk8IcpDHkSqnJu8AUjLXBzPVp
         +T1ZooyDhmVKzv7EmEY/Wvi2xmcb//69Q480cKQoYHS+REVrm+Qo9x0N1JxekffXooBL
         BuUA==
X-Gm-Message-State: AOJu0Ywo/9jxhz1Bfh0HjfMya8B3AXfU7+t84zoY9BBfdZBBcuI6g/E6
	OUcfzLV721cHF/f7ZQG7PERjtWFrFfJ1zNE0wZsbRT/dW5oFTvdSRSKyStyaPQ==
X-Gm-Gg: ASbGncsH36oUdbXapsKZFQQ6M2iVH+mNxx9eEjJYOZFmhkHATgHkTdLgVvZ26MyDG5N
	iF/oyDUwQlBDMukTeBP9upMByj9OZTemZb/0hCbGoKpJrVnAA7JK/vBPwtVQa7EiFQ8VCwy3Mx5
	Hhq6KsHnerCdWpL/8s49gIDyDAO19Ag7WB2yk89LmW+Wp/Lvzoqkrq5PAP1nwzKH+JimBdDJyho
	LoeTcEI3SNeD0xGs8YCeZY0ZKilHqxBq8WgZ+3JaGA4QbVbBeyGtkelntRLY+5BJBj2q9x24dKr
	99m7Z1EVi+aCVgS/uJovBjKwOQr1qjBKOfpH/EUODuYMH3sA4emuG7e0g1T+zDOHafZwzebIOx/
	LE8YhJGUQObqAdrt1vgzQ7cIKvQzCrK46lazLZQZ6b3LdFz2k2cPKfe/h+D870n9Uq8ku3as8Yh
	epp+BbYJMV
X-Google-Smtp-Source: AGHT+IF0YDoiop0ueGh0R6KbOZ21AjHQ+mcd0QkFRKbkLITvoxIV9U0kpCRFWiNGlyZ3KDHYkB3p0A==
X-Received: by 2002:a05:600c:190b:b0:471:a24:497c with SMTP id 5b1f17b1804b1-47117919b54mr139462585e9.33.1761071527038;
        Tue, 21 Oct 2025 11:32:07 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496cf3b45sm20984535e9.7.2025.10.21.11.32.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 11:32:06 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 3/6] squid: patch CVE-2022-41318
Date: Tue, 21 Oct 2025 20:32:01 +0200
Message-ID: <20251021183204.269102-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251021183204.269102-1-skandigraun@gmail.com>
References: <20251021183204.269102-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 18:32:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120843

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-41318

Pick the v4 patch referenced in the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../squid/files/CVE-2022-41318.patch          | 45 +++++++++++++++++++
 .../recipes-daemons/squid/squid_4.15.bb       |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2022-41318.patch

diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2022-41318.patch b/meta-networking/recipes-daemons/squid/files/CVE-2022-41318.patch
new file mode 100644
index 0000000000..c1cf699d05
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2022-41318.patch
@@ -0,0 +1,45 @@
+From 36a55f44abe5ee0387d83663397e7fe111e21fa4 Mon Sep 17 00:00:00 2001
+From: Amos Jeffries <yadij@users.noreply.github.com>
+Date: Tue, 9 Aug 2022 23:34:54 +0000
+Subject: [PATCH] Bug 3193 pt2: NTLM decoder truncating strings (#1114)
+
+The initial bug fix overlooked large 'offset' causing integer
+wrap to extract a too-short length string.
+
+Improve debugs and checks sequence to clarify cases and ensure
+that all are handled correctly.
+
+CVE: CVE-2022-41318
+Upstream-Status: Backport [https://github.com/squid-cache/squid/commit/4031c6c2b004190fdffbc19dab7cd0305a2025b7]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ lib/ntlmauth/ntlmauth.cc | 13 +++++++++++--
+ 1 file changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/lib/ntlmauth/ntlmauth.cc b/lib/ntlmauth/ntlmauth.cc
+index 5d96372..f00fd51 100644
+--- a/lib/ntlmauth/ntlmauth.cc
++++ b/lib/ntlmauth/ntlmauth.cc
+@@ -107,10 +107,19 @@ ntlm_fetch_string(const ntlmhdr *packet, const int32_t packet_size, const strhdr
+     int32_t o = le32toh(str->offset);
+     // debug("ntlm_fetch_string(plength=%d,l=%d,o=%d)\n",packet_size,l,o);
+ 
+-    if (l < 0 || l > NTLM_MAX_FIELD_LENGTH || o + l > packet_size || o == 0) {
+-        debug("ntlm_fetch_string: insane data (pkt-sz: %d, fetch len: %d, offset: %d)\n", packet_size,l,o);
++    if (l < 0 || l > NTLM_MAX_FIELD_LENGTH) {
++        debug("ntlm_fetch_string: insane string length (pkt-sz: %d, fetch len: %d, offset: %d)\n", packet_size,l,o);
+         return rv;
+     }
++    else if (o <= 0 || o > packet_size) {
++        debug("ntlm_fetch_string: insane string offset (pkt-sz: %d, fetch len: %d, offset: %d)\n", packet_size,l,o);
++        return rv;
++    }
++    else if (l > packet_size - o) {
++        debug("ntlm_fetch_string: truncated string data (pkt-sz: %d, fetch len: %d, offset: %d)\n", packet_size,l,o);
++        return rv;
++    }
++
+     rv.str = (char *)packet + o;
+     rv.l = 0;
+     if ((flags & NTLM_NEGOTIATE_ASCII) == 0) {
diff --git a/meta-networking/recipes-daemons/squid/squid_4.15.bb b/meta-networking/recipes-daemons/squid/squid_4.15.bb
index 4cb21187fc..9ac420d579 100644
--- a/meta-networking/recipes-daemons/squid/squid_4.15.bb
+++ b/meta-networking/recipes-daemons/squid/squid_4.15.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.bz2
            file://CVE-2023-5824.patch \
            file://CVE-2021-46784.patch \
            file://CVE-2022-41317.patch \
+           file://CVE-2022-41318.patch \
            "
 
 SRC_URI:remove:toolchain-clang = "file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch"

