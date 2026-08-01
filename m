Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C98E4C55172
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 21:46:06 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13614.1785620760345809491
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 14:46:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JYhTYFd9;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ca88130e09aso1678204a12.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 14:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785620760; x=1786225560; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6GOUzqte4EnjizrqmRfVylGLS/5q8nCDMGFzHpPLc6s=;
        b=JYhTYFd9X4GAEIIsxSNHtbC6EKHBP/Yc3XyWq8zYPYHQ3+0fkWiK9lHY45X/l3yEjy
         GgGvuvwWHb/1811EncGFKQH3cGduW5cPLUf2sIkZRxSkOa5NpTGIKpWRlS9w56BRPaws
         JuDbMiWS4AHQ701y864UCNojfT2X1SVK5iJbjwBEJPiL6cioDUVkmD3SKopeVVgVehIh
         OC2DL8e3L36dEOuiLM/a17EkaAvCY4P/ob3VLxirjW7XRuCBbaNwjHmAfpJxRcYGe+Ed
         oIJ0VXAfCjlPPUqW5fFB4NPxHa2khHwxHuA4BPTlsAuxUcMLPPK4dGmDCILkXF92rwCt
         BYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785620760; x=1786225560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6GOUzqte4EnjizrqmRfVylGLS/5q8nCDMGFzHpPLc6s=;
        b=iqgcU1B+Fmklx/iXq2jc3Gr/xDYAWr51bKRnl1pDWes9AerTFlxqnO2kvSxraQr1ZU
         KfUWpbDtZ63/94scC/CxiDBaxY2cd05jQBjotyBETBmvAKKZvMZdvcDXz0+2RN4NTaqa
         PfWFgGkg/dIOND0tKzUasWL1NfS7FTLtcvLlsoSEq+FpWg+paIK/wbwPKMP//k9RBFHv
         C0RCDN2OYBt0yvmNVAOilMJ7CU+qUjzVZHrXs7gAmd2D8g1msU/5Kwf8kdmcJyBuV4Y5
         4Gi9036snvh+sgx3R3D66vEX4ANyCXMvFgTGPsUEZc8UesRhAkH7YIsPBGb+9mWfKJXl
         OVdw==
X-Gm-Message-State: AOJu0YwyYWGlppPXKf84dB8iqfdCiSSnMkHtY7j9kOYbrhPb5oXFLm1x
	9Gi+UrO5fqIl8xIigS3YZGcV+tF1ffxP4k0mOM85gT8zU1E0s4MEKbwIL+zCec9/
X-Gm-Gg: AR+sD11DufHKMUpJwxBuW7zdFiRNkbGyULsR1PQWlDpN6f3g8Z2ctfKL/rJpVUIsrby
	YU5a74vz/0uHenCt7xUNLTgXNjkL7uIZWhKNwfnLRR/b0MtQe0Wsz9n0Cc/FYBDzOlVT/qfKyzz
	ohB/mH5T+LBpbx03ByNsSzs5SGeKc4AJrMM7W5nvzelCoqqE3WRBasVOeEBq77vEI3IbTsMdiV5
	DJKJhqc4Iy+b2kcXvGv0Tsf+9EU/kbwbyiB/a3198mDUJ7b31jYRgg00Llqj3IdNXgSpUrJV8FB
	Db+tq9DUTPOJ5+j5kn7FYPuyaa18EntS1g9e4cdv/aylGapgqqM/6LR0mMyqQq9+JqRbo8DF8Qp
	8KmrQdhUXEwuWAdkGwvEW2CBDxfO9HHvzhJZg8Al8jjWnIGQrJWvQLEQcXdtvZGRf/f1ZL1irhY
	TX9s//KPQKLc9/ztJwnyTZgHgi1mia671bCzpsctJYSe58X5sd5kH3m6jMdr7fiBPb9RTA0G+Lz
	jpPsE8tuIbhuFJY1lRbxXw6Q3EO86v62oiejrrAEhUc3dJjUhLv9mJrAqHxQC0fztoqP5U9sBMG
	yrfC256VHD3b3qAVg7zEVx5OsaZOXMB7coh2Sck9BnspqIzO+PmzD7z3T1VDbTDltC/qClZqNxh
	Mzg==
X-Received: by 2002:a05:6a20:2591:b0:3c3:812a:2198 with SMTP id adf61e73a8af0-3c92a4d6fc5mr4977901637.4.1785620759657;
        Sat, 01 Aug 2026 14:45:59 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm19105102eec.1.2026.08.01.14.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:45:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 31/31] python3-mpv: propagate ffmpeg's commercial LICENSE_FLAGS
Date: Sat,  1 Aug 2026 14:45:26 -0700
Message-ID: <20260801214526.788343-31-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
References: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 21:46:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128648

python3-mpv RDEPENDS on mpv, which requires ffmpeg (LICENSE_FLAGS =
"commercial"). With "commercial" not in LICENSE_FLAGS_ACCEPTED, parsing
the universe target - which ignores EXCLUDE_FROM_WORLD - reports:

  WARNING: Nothing RPROVIDES 'mpv' (but .../python3-mpv_1.0.8.bb
           RDEPENDS on or otherwise requires it)
  NOTE: Runtime target 'python3-mpv' is unbuildable, removing...

Now that mpv carries LICENSE_FLAGS = "commercial" and is skipped, carry
the same flag here so python3-mpv is likewise skipped cleanly in both
world and universe instead of surfacing as an unbuildable dependency.
The redundant EXCLUDE_FROM_WORLD is dropped.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-mpv_1.0.8.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-mpv_1.0.8.bb b/meta-python/recipes-devtools/python/python3-mpv_1.0.8.bb
index 2d345cfc55..19b84334f1 100644
--- a/meta-python/recipes-devtools/python/python3-mpv_1.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-mpv_1.0.8.bb
@@ -14,4 +14,8 @@ RDEPENDS:${PN} += "\
     mpv \
     python3-ctypes \
 "
-EXCLUDE_FROM_WORLD = "${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "0", "1", d)}"
+# RDEPENDS on mpv, which propagates ffmpeg's LICENSE_FLAGS = "commercial";
+# carry the same flag so this recipe is cleanly skipped (in both world and
+# universe) unless "commercial" is in LICENSE_FLAGS_ACCEPTED, rather than
+# surfacing as an unbuildable "Nothing RPROVIDES 'mpv'" dependency.
+LICENSE_FLAGS = "commercial"

