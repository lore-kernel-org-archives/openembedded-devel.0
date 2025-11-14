Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03AEBCE7B01
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 12:48:50 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17044.1763124528538019703
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Nov 2025 04:48:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kEVBYAIg;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42b31c610fcso1684830f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 04:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763124527; x=1763729327; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=P6zv83xxhPYymjz/rc5rAA+ig1brTIp78njD+PNboLo=;
        b=kEVBYAIgiRI54ER0GJZRdYOLbfU9+J6V3zDDR2g6OU47W8K5TUfcU+cJ9JDYrKPvHz
         EjzVCvUsZxAK29Xbav+yjKD78XR2mpeCEpNcOOumPKekBru+C0tkmf+WodcUmt7YqcCC
         NNv27Ihtdtf0AGWd5FGUaDTh6t4PAJu3ThiAWUeSqp/VgSfBcXcFfuEpleYsWDwYEOSU
         m0ogN76UPT2ZfGrDtRII9nnfU4hD8xuMn43Hhy54/3WhT3ICyResRjXLU6gNdOgAlDng
         nQupr8fcHs7HHzL/XDhsnWTXHwQ1wtCh6jrxXZVQkOvBqpZt5O5Y8EdbsBSPq1GZVuOt
         EomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763124527; x=1763729327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P6zv83xxhPYymjz/rc5rAA+ig1brTIp78njD+PNboLo=;
        b=h4V/uCSjtFrYHeG0sNMecr6O3iNs8Gwi3unYKx0vtBIY8pQQXd95jarfICf/1r5wfB
         5XALqb65rpczDOjnbnPDRCYihHjqBKgVXENqu/msCqGwjhE8ap7NnTnr6EBPRN9PviyI
         lCybJqaTqSrcRVNV/O0/PX1TAOdM/oD+VR4QK77gW8cDIj5JSfwoYBuUqPsRF8BJ4YEk
         4rdmcYNnL0VToxmby4+wK+hMrXD+Ev6YTnohXSiR/9OlbQTRV0dWXcJnlAxbtfejaKQL
         znqytyCxlDrPIfk4oo4y2K5K4qdzI8MCuQSN/b6I7B1w2jWOFzKaqKEwYLevo2jfMUEN
         Mipg==
X-Gm-Message-State: AOJu0YziXgepVdMnaFY5YlU2J8L4W0AUb06IsAZ4A/+gjTCVonnMAzSH
	qyVXfdgn61u9iLY7uRharQjA4MJrJ25l2MJSkX8wtSUtW1HN4iP6CaMtInWitvkI
X-Gm-Gg: ASbGncv421OESGSnJnVy8dPyXSf8Ws/eOAeNuwFu51UfcFr+N5Wx1WmZKu9pVlHb1Hx
	GTdqBU0kS32A4tn6mFFuuGSt1WXGGmNL3KYVvWbbJ4IMQRt130/3FLaoEoiURTYxQnJ0aGbrMJD
	sGEeAw10IBIWbe8N2Sv68eAYW9f9hZ2GHH1SC2IkaS8/kqva8lj3XJTtF92J5ZiLC0yavdsR7Vt
	zqpez4Ujr6gJ2vrU9qgzIgr+D1gnvpEJRaFuVXmb1WokPKb9irzs6UxsZL3tL4tVyml9owpYF7v
	2g9D2h/AnQTfyWtW7xVshBKVaz4xb0V0pgIRBiDroNg+w9c8tTbJZ6WM+8KzGMBjD/8i5aEsSIB
	2VNbZ+0UfV10QNsaAamdV0EdmEiYdVN0O/gTiZfxkG00riSWyOR8UFYo42zkatvVpLhz5irm5Ue
	GbR4UMnK5CjK+SeTkLyZI=
X-Google-Smtp-Source: AGHT+IHedwO88bDGI/OUu/jVE6GYIK4GWJt2rObg3IMM/R0ZyDavgGWYz2QL3xSiv4ZOj59iPPz7YA==
X-Received: by 2002:a05:6000:1849:b0:3e7:45c7:828e with SMTP id ffacd0b85a97d-42b59385bcemr3038612f8f.33.1763124526608;
        Fri, 14 Nov 2025 04:48:46 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b8d6sm10092927f8f.28.2025.11.14.04.48.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 04:48:46 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] rsyslog: set status for CVE-2015-3243
Date: Fri, 14 Nov 2025 13:48:45 +0100
Message-ID: <20251114124845.3317228-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 12:48:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121708

Details: https://nvd.nist.gov/vuln/detail/CVE-2015-3243

The issue is about file permissions: by default rsyslog creates world-readable
files. In case a log message contains some sensitive information, then that's
exposed to every user on the system.

However the rsyslog.conf file that is shipped with the recipe solves it: it
already sets non-world-readable default permissions on all files, so this
vulnerability is fixed in the default OE recipe.

See also this package in OpenSuse[1], where it is solved the same way.

[1]: https://build.opensuse.org/requests/619439/changes (rsyslog.conf.in)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf | 1 +
 meta-oe/recipes-extended/rsyslog/rsyslog_8.2506.0.bb  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf
index dbfefb7597..388c4e70bb 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf
@@ -13,6 +13,7 @@ $ModLoad imklog   # kernel logging (formerly provided by rklogd)
 
 #
 # Set the default permissions
+# Setting the $FileCreateMode not world readable fixes CVE-2015-3243
 #
 $FileOwner root
 $FileGroup adm
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2506.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2506.0.bb
index 4ba41678aa..bcac76a231 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2506.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2506.0.bb
@@ -38,6 +38,7 @@ UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/tags"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
 CVE_PRODUCT = "rsyslog:rsyslog"
+CVE_STATUS[CVE-2015-3243] = "fix-file-included: The shipped default rsyslog.conf contains the fix"
 
 inherit autotools pkgconfig systemd update-rc.d ptest
 

