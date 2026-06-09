Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC031CD8CBF
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 14:21:27 +0000 (UTC)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81026.1781014879983443289
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 07:21:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nuL6yjXU;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-304d8362a58so3386704eec.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 07:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781014879; x=1781619679; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkyeaIfiaRNBPo7zdOoR+5WowVieXo0oPcVpB676/zw=;
        b=nuL6yjXUUno6sjlINYMNVJgsP0eu+ztYl1HMyapfF4b3FAVHaBusw7iA64kC6RUGXR
         yeyBqjvfKNlY7Exg8+1v8H2P9WT5Nmn3ekJ+5e3S2pgvDCgjqoWTdCIEgPU5wB7VDxUC
         f5dTHQaH84Je0JGbaljjBo8Mz7vJF5X5QEMxHhRfjryWhDSn6JMOy0/Ze0drGIEYtRU6
         Mf1suWEF8hYfyEGd17lUIfEBuwobkpGj9e7cyAk9GIAsM0FBpcXLVGtc0Fe2F71vErN+
         83TW5QatuTbyQduFPgwXUBV/wYtTLTWIcEf8lt0bmbar+uT7jAcvArxs+QCVdzoXO3oy
         7YZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014879; x=1781619679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RkyeaIfiaRNBPo7zdOoR+5WowVieXo0oPcVpB676/zw=;
        b=kc2kUeQTTZN9Iqevb7w9Jf1fyUAXaNKtsRQqvv0g/UmxLAjkDQdARYu/I8ALSQuH/F
         ATfVLkjBKQSPbOnUU8GDXpwr3HuwAT7aUMpkUackokPdkTzaxghbD6uSH/9f20vhH/1x
         /WxEQJRJmS6qlg4TmOtLPy/bjpU5TwIoOtQWjzJz+hen1LJQl6Vldx3mVxr+77YMF+Ln
         eqnnKaskfByUT9BcuE4kk+FJtbHO+7qAKUvhdQCWqUa828hvFgepFabes9ba9KWzirhq
         f18PB9tdXyAbLIFqS+7Xq9GTKC4V4nF9Q4iM7diNSrVeU1UAPAXh1/hkHvGO/5WSjicY
         LCzg==
X-Gm-Message-State: AOJu0Yw00/COVa3x059pZBk1OZRhRhdRqKE1fu7NRx5crLYwq3sVS0ON
	SwY8S/cRJviYaNNp5U14Bbl0eO4P2k5UBl6/sZo1nBR8Bjddxxu8oQsALJrZgYNK9aGmvA==
X-Gm-Gg: Acq92OGHK4s6DDCuLbQZD2pA46jzBW1diDPBv/wbu2UPlv4dQnmxTYQc3ULAqee84w0
	528yi5C3B5Yippo39MuYUcYMYLjNLYAqdpE9c/3g9G29cEmP1+hbYLsp4HC/6z7O7EunaPsRGtC
	TRb913+KSIeNTssz6kTMD/LddyrXevOp1kC8ugMyIbul1OgqFEGHpwsbw08DbwSnB7LCS6wrmMU
	1QjlIhbb/dce9mLbTU8Val+YtcSYLAbQUBLgZvEhX8Ep0SNZtsAuqyvT8SMKz8yZJWSrQiUqJRe
	CavDPnt+71J55clsjG8UB1rP+voe0vWsFVqZKQ1KEZIV+9IyAH7bA1pcHzeRyzROCS0mCKRC9j7
	22vEdGC1uyY0qLlrp0wwbB7dI6/uxUB6o9NoAL5HdyGVtROHM2Of/iUjShmFNLu9FF+OBD0uP9X
	UOXeG0GuOQZCZTZvmo72D6IqGrhSH7Jm65v6UyPsijbFj7ylz4qefYsysdjt4mhVwttEP/HSxYT
	hvPWepVoQgOYDM31Nn/Wo8a+pHVLX0uxtguZW/W90yXEZuF5ItpWNJI51BGEAMAwN3ATIcHrHTO
	oAP+VddoSJBzkcYDDvPofz/H2zaNNNHbVnAKZXbEoDjRDTsyDUc=
X-Received: by 2002:a05:7301:19ad:b0:304:6822:2cb2 with SMTP id 5a478bee46e88-3077ffb50e4mr11090327eec.11.1781014879073;
        Tue, 09 Jun 2026 07:21:19 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df3b234sm27099386eec.23.2026.06.09.07.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:21:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 11/11] libtext-diff-perl: upgrade 1.41 -> 1.45
Date: Tue,  9 Jun 2026 07:21:05 -0700
Message-ID: <20260609142105.1439225-11-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609142105.1439225-1-khem.raj@oss.qualcomm.com>
References: <20260609142105.1439225-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 14:21:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127498

Maintainership moved on CPAN from OVID to NEILB, so update the
SRC_URI author path and HOMEPAGE accordingly. Refresh
LIC_FILES_CHKSUM for the updated FSF address in the bundled GPL
text; the licensing (Artistic-1.0 | GPL-2.0-or-later) is unchanged.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ibtext-diff-perl_1.41.bb => libtext-diff-perl_1.45.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-perl/recipes-perl/libtext/{libtext-diff-perl_1.41.bb => libtext-diff-perl_1.45.bb} (74%)

diff --git a/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb b/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.45.bb
similarity index 74%
rename from meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
rename to meta-perl/recipes-perl/libtext/libtext-diff-perl_1.45.bb
index 90bd555403..0857996681 100644
--- a/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
+++ b/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.45.bb
@@ -6,15 +6,15 @@ faster than shelling out to a system's diff executable for small files, \
 and generally slower on larger files."
 SECTION = "libs"

-HOMEPAGE = "https://metacpan.org/release/OVID/Text-Diff-1.41"
+HOMEPAGE = "https://metacpan.org/release/NEILB/Text-Diff-1.45"

 LICENSE = "Artistic-1.0 | GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=385c55653886acac3821999a3ccd17b3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9e795454c53c99fe48b8180eb5917b10"

-SRC_URI = "${CPAN_MIRROR}/authors/id/O/OV/OVID/Text-Diff-${PV}.tar.gz \
+SRC_URI = "${CPAN_MIRROR}/authors/id/N/NE/NEILB/Text-Diff-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "a67f50a48e313c1680cc662109ce5f913ea71454db355d0cf4db87ac89d2d2fa"
+SRC_URI[sha256sum] = "e8baa07b1b3f53e00af3636898bbf73aec9a0ff38f94536ede1dbe96ef086f04"

 S = "${UNPACKDIR}/Text-Diff-${PV}"


