Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 657DEC44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 16:43:43 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1568.1784565041733041543
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 09:30:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=i7UQIoOF;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: nguyenthaithuanalg@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so6511334a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 09:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784565041; x=1785169841; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CyDa53mkv8+caDRojze/wUPJLFMFYav+oqLll/Sfi8w=;
        b=i7UQIoOFNa3zk5+3wj4TOQLE6dDKoZP03AsoN8XGZqkJjcTROV3KvuPNE4WN9rghS8
         kogzBpbwTNsgrlDwGhlHqYWmJr7xrPEPlj+rr1/IGYcQ1OBbB2Nvnp7MrR1Ml36WHha9
         3IiLNjfNEDzKquLS8XGrbr72pUZz4AxlyDMFsz+PbmWCccr6IT2ss9cYAqu8TCiU7ukr
         5RSwM4IpwTfIu8p+owyMYva5Z1wmOY21Y7FbG0Oc91CoyXEEkezkiEoYU/4Z9z4DoBsp
         tu/rNChGs92JUAsCBMGZIKQkYt/GiX05iooIn5u5HTxhzmyN10yCFjQkTXhWhs8ifMHX
         hm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784565041; x=1785169841;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CyDa53mkv8+caDRojze/wUPJLFMFYav+oqLll/Sfi8w=;
        b=J6gam+Fu/uDh0b/httHaGvYCV91lIRwjbkvvrrqI+rRDPDdzFCoqwCULQ5ltqrB2s5
         LWA6/lkM43LXDlJ/yZsKj/QYVwXs/WqQQIbjBhYbLkyTzDIy/waMempvQu/esTHq8vH6
         nUmC7Nowaa2Iwxcs0W8DJgnsj0Y3hyvOeH0Se/Ymg50VeOMJsJh+tKqoQkr0vVl8nL/v
         o+EyANAaPKI4HJKd206hTwIdAB7481UAqJmUY/rbbHiVcdemnmyufl9MCTWH3GLVJ86H
         P3D5eoqtTGPBn3hnJndUIl/pSacig4wYRKKE0R4iZ2pBjo5xsP4uev/AfsR2bQMeRSCx
         y8gw==
X-Gm-Message-State: AOJu0Yy8DPlCjOMNQotRGwV4YSFpzCQ0S2uYc2DWZMUPaw5jZaiQBGlt
	7abivTrRb9rOWIHSEwFu91/t/t0aHVl3ob2fj8541xoBaYoyYec9goH5A4KdAQ==
X-Gm-Gg: AfdE7cnPHGLlaQHoXft6NhCQ7hCN7XOzGvzAVAVhxxnK/vE54389kJQYMNqQlF2LFyU
	smRfJ9JMIIIuUBWxHzntIzb0f9a1xChBxTjavMeokQoCpCUg+CiwhOGkZtjQnwoNRgMURIDgsF9
	1XI1bIa3o9S7fa4urkCb3gz40ChZJ7D3dcoLaI01IRZLPFYIVT8Qmk1bFPYMvrcr0fBvj+buNGz
	4xuBj36LzWeOx+3gapVob89Ih9MOBfkR/DS2rXo7oBlgr8S9s8kt3kMEtuuwQlMfR4+gXS8OBa5
	gu3B86Zc73fZxCA51pzPIhOr4q7eyfS/1Sp01zIhCFZ6dNgU80ONDLb/98eblaJss6mHdLDpvcm
	qZFOsbxevAZXdlsvT2z/v8++85iVOU+a9vIV6omPidgpjXMf6le8hMNuSGoKf4El1NiPKzVoBSr
	eLJFQltLcPA5UO6D/17YXCsjk=
X-Received: by 2002:a05:6a20:6a0a:b0:3b4:7d99:a23f with SMTP id adf61e73a8af0-3c3ad8b3abbmr17937104637.45.1784565040885;
        Mon, 20 Jul 2026 09:30:40 -0700 (PDT)
Received: from thuannt-Z87M-D3H.. ([42.113.218.129])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9bcccsm43364429eec.4.2026.07.20.09.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 09:30:40 -0700 (PDT)
From: =?UTF-8?B?VGh14bqtbiBOZ3V54buFbi1UaMOhaQ==?= <nguyenthaithuanalg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Thu=E1=BA=ADn=20Nguy=E1=BB=85n-Th=C3=A1i?= <nguyenthaithuanalg@gmail.com>
Subject: [PATCH v2 2/2] libsimplelog: upgrade 1.0.8 -> 1.1.0
Date: Mon, 20 Jul 2026 23:30:30 +0700
Message-ID: <20260720163030.7247-2-nguyenthaithuanalg@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720163030.7247-1-nguyenthaithuanalg@gmail.com>
References: <20260720163030.7247-1-nguyenthaithuanalg@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:43:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128283

Upgrade libsimplelog to the latest upstream version 1.1.0.

Drop 0001-allow-build-with-cmake-4.patch as it is now integrated
upstream (commit 4827c4325063266f6d2a7e133a9d3a9050ff6a3c).

Update LIC_FILES_CHKSUM due to upstream updating the copyright year
range from 2024 to 2024-2026 in LICENSE.txt. The project remains fully
under the MIT license.

Append -D__LINUX__=1 and -D_GNU_SOURCE=1 to EXTRA_OECMAKE to enable
Linux and GNU-specific extensions like sched_getcpu() for better
performance effectiveness. These flags are optional; without them,
version 1.1.0 remains fully backward compatible and adapts perfectly
with strictly POSIX musl environments.

Signed-off-by: Thuận Nguyễn-Thái <nguyenthaithuanalg@gmail.com>
---
 .../libsimplelog/msg_patch2.txt               | 18 +++++
 meta-oe/recipes-support/libsimplelog/z.sh     | 71 +++++++++++++++++++
 2 files changed, 89 insertions(+)
 create mode 100644 meta-oe/recipes-support/libsimplelog/msg_patch2.txt
 create mode 100755 meta-oe/recipes-support/libsimplelog/z.sh

diff --git a/meta-oe/recipes-support/libsimplelog/msg_patch2.txt b/meta-oe/recipes-support/libsimplelog/msg_patch2.txt
new file mode 100644
index 0000000000..3459f6614f
--- /dev/null
+++ b/meta-oe/recipes-support/libsimplelog/msg_patch2.txt
@@ -0,0 +1,18 @@
+libsimplelog: upgrade 1.0.8 -> 1.1.0
+
+Upgrade libsimplelog to the latest upstream version 1.1.0.
+
+Drop 0001-allow-build-with-cmake-4.patch as it is now integrated
+upstream (commit 4827c4325063266f6d2a7e133a9d3a9050ff6a3c).
+
+Update LIC_FILES_CHKSUM due to upstream updating the copyright year 
+range from 2024 to 2024-2026 in LICENSE.txt. The project remains fully 
+under the MIT license.
+
+Append -D__LINUX__=1 and -D_GNU_SOURCE=1 to EXTRA_OECMAKE to enable 
+Linux and GNU-specific extensions like sched_getcpu() for better 
+performance effectiveness. These flags are optional; without them, 
+version 1.1.0 remains fully backward compatible and adapts perfectly 
+with strictly POSIX musl environments.
+
+Signed-off-by: Thuận Nguyễn-Thái <nguyenthaithuanalg@gmail.com>
diff --git a/meta-oe/recipes-support/libsimplelog/z.sh b/meta-oe/recipes-support/libsimplelog/z.sh
new file mode 100755
index 0000000000..dafcbd0883
--- /dev/null
+++ b/meta-oe/recipes-support/libsimplelog/z.sh
@@ -0,0 +1,71 @@
+#!/bin/bash
+# Tự động dừng script nếu có bất kỳ lệnh nào bị lỗi
+set -e
+
+echo "============================================="
+echo "Starting automated Git rewrite for V2 submission..."
+echo "============================================="
+
+# 1. Hủy bỏ tạm thời 3 commit cũ nhưng giữ nguyên trạng thái các file đã sửa đổi
+echo "-> Resetting the last 3 commits..."
+git reset --soft HEAD~3
+
+# 2. Tạo nội dung văn bản cho Commit số 1 (Binary Log & Cache Feature)
+echo "-> Creating Commit Message for Patch 1..."
+cat << 'EOF' > msg_patch1.txt
+libsimplelog: add binary log feature and cache hit/miss support
+
+Introduce a new binary log feature based on UTF-8 encoding patterns
+to optimize logging capabilities. 
+
+Add cache hit and miss tracking mechanism to monitor performance 
+effectiveness.
+
+Signed-off-by: Thuận Nguyễn-Thái <nguyenthaithuanalg@gmail.com>
+EOF
+
+# 3. Tiến hành commit cho phần thay đổi của Patch 1 trước
+# Chỉ add và commit file recipe .bb gốc tại thời điểm có tính năng này
+echo "-> Committing Patch 1..."
+git commit -s -F msg_patch1.txt
+rm msg_patch1.txt
+
+# 4. Tạo nội dung văn bản cho Commit số 2 (Upgrade 1.1.0 & GNU_SOURCE)
+echo "-> Creating Commit Message for Patch 2..."
+cat << 'EOF' > msg_patch2.txt
+libsimplelog: upgrade 1.0.8 -> 1.1.0
+
+Upgrade libsimplelog to the latest upstream version 1.1.0.
+
+Drop 0001-allow-build-with-cmake-4.patch as it is now integrated
+upstream (commit 4827c4325063266f6d2a7e133a9d3a9050ff6a3c).
+
+Update LIC_FILES_CHKSUM due to upstream updating the copyright year 
+range from 2024 to 2024-2026 in LICENSE.txt. The project remains fully 
+under the MIT license.
+
+Append -D__LINUX__=1 and -D_GNU_SOURCE=1 to EXTRA_OECMAKE to enable 
+Linux and GNU-specific extensions like sched_getcpu() for better 
+performance effectiveness. These flags are optional; without them, 
+version 1.1.0 remains fully backward compatible and adapts perfectly 
+with strictly POSIX musl environments.
+
+Signed-off-by: Thuận Nguyễn-Thái <nguyenthaithuanalg@gmail.com>
+EOF
+
+# 5. Đưa tất cả các thay đổi nâng cấp còn lại (bao gồm cả comment mới) vào Commit số 2
+echo "-> Committing Patch 2..."
+git add .
+git commit -s -F msg_patch2.txt
+rm msg_patch2.txt
+
+# 6. Xuất chuỗi bản vá phiên bản V2 (2 file patch)
+echo "-> Generating V2 patches..."
+git format-patch -2 -v2
+
+echo "============================================="
+echo "SUCCESS! Your local history is cleaned up."
+echo "V2 Patches are generated in the current directory."
+echo "============================================="
+ls -l v2-*.patch
+
-- 
2.43.0


