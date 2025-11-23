Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63ADBCFD313
	for <webhook@archiver.kernel.org>; Sun, 23 Nov 2025 16:17:39 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16389.1763914655257818527
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Nov 2025 08:17:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ml+PlS8F;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42b566859ecso3165974f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Nov 2025 08:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763914654; x=1764519454; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0ukY/NhaIPTjyk1D/r3l4nQvB27kkE7IwsQjs4kjq1g=;
        b=ml+PlS8FBXedoyk1kbCGUNoAnwZAgWkCaQHbnbGaBXU0Xaq183RIJ6PAbT7zuq0weS
         KnTWLR403GmHBfoeFE1G7d9UyG5WuPHLOHJ63CoT0zPv8fXpVED7f+bVFrMpULeibiGI
         Dw/+DeAZuKmjDrH2F7zahlEEbPzcW4/vAOkAb9G646GPuR/b/iYsRnvf1ve0rH3becNF
         LaS0pu6bAZDm7aSxj8gBZKeF3fgO7p3SwAOuUnbDhDITz5mduWH2zjeMHOFFJttAAWUS
         7D4ij6vpkUvvJgZFan1XS42do6lf20HORXx2PkGTMEby+koGN+2XIRrHv1s8H6MFCcoh
         wQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763914654; x=1764519454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ukY/NhaIPTjyk1D/r3l4nQvB27kkE7IwsQjs4kjq1g=;
        b=Y9H2Tp1Jnk073+7w0NAg+5/vfENXSZWB2WD+Z96qbVpGTPUXQqixdLSkaz6Kla09oz
         b9161o9M7WXov/BLkSMt0AX3+aOJ35pVpGtW8JK6QxjhAwewKtuXEQ5JQTNKUaedDlYh
         HflE8UtBZdF2K6JEN69bOjydjsjEBL3Psz2khC29foAtzniVDXAYJbc0dGojQJkRcKtb
         c1Kfzax0JRURv1qUKvAXqKgM/nhVkkTKuaK6m5waBz9xCgQGlDCHRACQ2jWWxzTyxZqa
         DqlgBAqiZB0H5CNu205gcAXvZdt/cLF+wvsv0h/zM+HfkKUxbz2FHt30kcXlLZt1vO3n
         xQbQ==
X-Gm-Message-State: AOJu0Yz9twkJuDm07e/IpyUduhFE17qTsBoWsV+9A/wUqSgKxvH3pcqA
	6stwdY+YqxApyWp7nGqt2aUUZpUlp+cOnCinn6uO4oisPLE0AB3GXqOZy0zFINpi
X-Gm-Gg: ASbGncsCd4nCSDfsVeYEQPW8+vLYA4SvU/Qx3MCmf4p15ByN90xGJ5dnH/eUk3Kru4x
	IAYomSfgO09pROkfPAIr9GJGOdjLqR/y/5hcvVANH1PSaRPRk/1Z/PL3TvY+/9wJCiaK3Tc/oSt
	3fyRiG5iKn3VE7abQstLGEU5O2WkO9BXzHWVu0PmHgkCg7KE22rNb1drlKGAo6YOzRRXfH5DDqB
	eU4ktMFCTsZG9sKfIgvlzavJimnQ0zvOZ5bNnnSl+q8CRsAZSxx8lR1p9WA2z+xIUoUEWYaoELa
	xTKtGRoBk0mUqa9A9kqECRawYSpkvVilOe7PvjNLoBB5Gx3J5kx3q9RC00DBiagahfuQmsIu+GM
	ZVsGXP8Ae1GfzzDsFsyowSlItNiyEJI4GiUy+oXxHgRJB5c3ZYpmdxnBNa5NzwwB8xIytAkiOJ8
	DCNJ0ubRrLHdL6O95UX1I=
X-Google-Smtp-Source: AGHT+IHsLYI3grnjUTzNRts8iIgiURaLPnSSEJ3sHi0gZ7q7JECYa6ntydG3WXR+tiLfQ/PwRslYhQ==
X-Received: by 2002:a05:6000:1448:b0:42b:3746:3b82 with SMTP id ffacd0b85a97d-42cc1d230a8mr9044343f8f.54.1763914653452;
        Sun, 23 Nov 2025 08:17:33 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3592sm22279416f8f.21.2025.11.23.08.17.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 08:17:33 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 1/4] redis: ignore CVE-2022-3734 and CVE-2022-0543
Date: Sun, 23 Nov 2025 17:17:29 +0100
Message-ID: <20251123161732.1875494-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Nov 2025 16:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121993

CVE-2022-3734 only affects Windows.
CVE-2022-0543 affects only packages that were packaged for Debian and
Debian-derivative distros.

Neither of these issues is present in upstream Redis.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8f1269507ad95d56aeab3cdd0c0178e194506ca8)

Adapted to Kirkstone (CVE_STATUS -> CVE_CHECK_IGNORE)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/redis/redis_6.2.12.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.12.bb b/meta-oe/recipes-extended/redis/redis_6.2.12.bb
index 0fdd3da327..5de97c5e77 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.12.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.12.bb
@@ -25,6 +25,11 @@ SRC_URI[sha256sum] = "75352eef41e97e84bfa94292cbac79e5add5345fc79787df5cbdff7033
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
+# not-applicable-config: the vulnerability is not present in upstream, only in Debian-packaged version
+CVE_CHECK_IGNORE += "CVE-2022-0543"
+# not-applicable-config: only affects Windows
+CVE_CHECK_IGNORE += "CVE-2022-3734"
+
 FINAL_LIBS:x86:toolchain-clang = "-latomic"
 FINAL_LIBS:riscv32:toolchain-clang = "-latomic"
 FINAL_LIBS:mips = "-latomic"

