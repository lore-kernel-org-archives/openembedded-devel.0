Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.921.1795831323018624518
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2026 18:02:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20260515 header.b=W9vyzRM5;
 spf=pass (domain: kernel.org, ip: 172.105.4.254, mailfrom: devnull+dickson.wu.certik.com@kernel.org)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D4872611E0;
	Sat, 28 Nov 2026 01:52:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795830744;
	b=UCIGHFwi466CgS5Gx/HDxU4WRSJJPsUths8y+ylPnGAoMa3IehKiMoJXgjK44try+9pE
	 YR5why4irITLBj0J+lwCTOrVdcTeMaoa6wKi4aAOJTgkKB1hMFFsnFHzlhiwi/goIuI5n
	 D1PW1tgIlexfWF0xoD0u98senPw+qA0fZVQ9a/92end8cHY0AvSd3IsngB/MyERk2cgMI
	 fcutAP7UgPMsF7YaX8ByJh31pUwWQpUegtRXSopxXy+Jm/4+/vGXp8efCi7XB66ll26xn
	 A31AwRQBN3q5nFQZjt04nlwjSpBXzjLZbXm3ieDn0FxMREftd4jsi6clxdcHw3hkIIQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795830744;
	h=DKIM-Signature:Received:MIME-Version:Content-Type:Message-Id:
	 References:In-Reply-To:From:Date:Subject:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=yQ3RvRxuNKlQp/0c5wKJb5lnk+X5Q+pTuXKA3HMX6E4=;
	b=TuAV67EoJDo5NSCf/N3/gMd2xUWfbbMhMhtkJFhstB3UAq60Plauq1ZaMMnBS7WQglZz
	 oJXYS5v2mffY3wLCaWSoIkmMtytuB2ID36QWWZqogloTn4vWS4VgQnmkEaMhGC5090+Qt
	 6KjB6WYqL3pdYitsQU045teByuSw/olQmLm44YfsLbtaE16uIhehqYVvQ5zlI2X+3517q
	 21zrx1mxlS/xIOAt+01ihTAiJqmioIsVFulW514ZREpcpcfcU8alOVutEnb+/Og5q/78u
	 yz6fvh5ySRt71oOMY1YNsrg0ZnD7glsijFwxQZF1HN6WXlVo+BAfL9z2DikJ3hPdUPQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B9CDC1F00899;
	Sat, 28 Nov 2026 01:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795830744;
	bh=yQ3RvRxuNKlQp/0c5wKJb5lnk+X5Q+pTuXKA3HMX6E4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:Reply-To;
	b=W9vyzRM5I/uZjR5aTR5QbBD/H8TvC8vN3XW6UkV1DQEna09xW8xjVcq4hq9h+weWd
	 jJFLQNphy95jA0TmssiFoKNHccTneXES6m3gbrKkBEcjBUq0tast4x+A0MtgNgI1i+
	 VWgacL8wF3XuoYixCrwVTMgB+09dEcgJta9DuYeYx6nu6CH67x8i6YPFYDgUxlITxW
	 14CZIS14MK6grYXRzdH72FICyHZqWmymUas+YQnkcN+wjeqLl0GRRS4RHcYVAz9aSr
	 Z/JxV2jieKdfffp6UHeRRZZevBRwxYKZOHu8/mTGYIgmd0G1p1+nWcJ8gOgKIs37fm
	 P/114fubFX+Hw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4C0FF4DF12;
	Sat, 28 Nov 2026 01:52:23 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <20261128-pillow-sg-v1-3-cbcff72e5e81@certik.com>
References: <20261128-pillow-sg-v1-0-cbcff72e5e81@certik.com>
In-Reply-To: <20261128-pillow-sg-v1-0-cbcff72e5e81@certik.com>
From: Dickson Wu via B4 Relay <devnull+dickson.wu.certik.com@kernel.org>
Date: Fri, 27 Nov 2026 10:05:11 +0000
Subject: [meta-python][scarthgap][PATCH 3/4] python3-pillow: patch CVE-2026-112400
To: openembedded-devel@lists.openembedded.org
Cc: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795830619; l=3088;
 i=dickson.wu@certik.com; s=dickson-b4; h=from:subject:message-id;
 bh=a/k8HCX+ekskdG/KfwWkFfZ2YntI2rwdfV5RaeQhhqk=;
 b=yvjDAA7ZIerln8gMZ0nQ4nzLIIBhK0p6ELPQ44KsCbKW/ao5XXaRtuiY56SmL5t+oiA/Qbwqm
 2/Z9wN23CcaBpjb+OAQSZ/kEK8BvwrKrJoEngX0Xm5bDB5b+uwYkBN/
X-Developer-Key: i=dickson.wu@certik.com; a=ed25519;
 pk=fxH7FS4FdojeJSGLJzgKdfO51Rvr4EW30yinj2mc1vg=
X-Endpoint-Received: by B4 Relay for dickson.wu@certik.com/dickson-b4 with
 auth_id=1647
X-Original-From: Dickson Wu <dickson.wu@certik.com>
Reply-To: dickson.wu@certik.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 28 Nov 2026 03:31:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133392

From: Dickson Wu <dickson.wu@certik.com>

Do not keep size from failed GIF decompression bomb check (#10116).

Upstream commit:
https://github.com/python-pillow/Pillow/commit/6faed707cfb760a4cbd726ddc8406f576cf35bf7

AI-Generated: OpenAI Codex, gpt-6.2-sol
Signed-off-by: Dickson Wu <dickson.wu@certik.com>
---
 .../python3-pillow/CVE-2026-112400.patch      | 30 +++++++++++++++++++
 .../python/python3-pillow_10.3.0.bb           |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112400.patch

diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112400.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112400.patch
new file mode 100644
index 000000000..9608fc18b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112400.patch
@@ -0,0 +1,30 @@
+From 6faed707cfb760a4cbd726ddc8406f576cf35bf7 Mon Sep 17 00:00:00 2001
+From: Andrew Murray <3112309+radarhere@users.noreply.github.com>
+Date: Sun, 4 Oct 2026 09:18:28 +1100
+Subject: [PATCH] Do not keep size from failed GIF decompression bomb check
+ (#10116)
+
+Co-authored-by: Jeffrey 'Alex' Clark <aclark@aclark.net>
+Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>
+
+CVE: CVE-2026-112400
+Upstream-Status: Backport [https://github.com/python-pillow/Pillow/commit/6faed707cfb760a4cbd726ddc8406f576cf35bf7]
+Backport note: Omit upstream test changes in Tests/test_decompression_bomb.py.
+Signed-off-by: Dickson Wu <dickson.wu@certik.com>
+---
+diff --git a/src/PIL/GifImagePlugin.py b/src/PIL/GifImagePlugin.py
+index 48ba0f9deb1..c6b327ef8f5 100644
+--- a/src/PIL/GifImagePlugin.py
++++ b/src/PIL/GifImagePlugin.py
+@@ -286,8 +286,9 @@ def _seek(self, frame: int, update_image: bool = True) -> None:
+                 x0, y0 = i16(s, 0), i16(s, 2)
+                 x1, y1 = x0 + i16(s, 4), y0 + i16(s, 6)
+                 if (x1 > self.size[0] or y1 > self.size[1]) and update_image:
+-                    self._size = max(x1, self.size[0]), max(y1, self.size[1])
+-                    Image._decompression_bomb_check(self._size)
++                    size = max(x1, self.size[0]), max(y1, self.size[1])
++                    Image._decompression_bomb_check(size)
++                    self._size = size
+                 frame_dispose_extent = x0, y0, x1, y1
+                 flags = s[8]
+ 
diff --git a/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb b/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
index 5f228b227..374984d0e 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https
            file://CVE-2026-112393.patch \
            file://CVE-2026-112398_CVE-2026-112403.patch \
            file://CVE-2026-112900.patch \
+           file://CVE-2026-112400.patch \
            "
 SRCREV = "5c89d88eee199ba53f64581ea39b6a1bc52feb1a"
 

