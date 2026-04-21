Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF88F8FA97
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 15:28:26 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35114.1776785302540534543
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Apr 2026 08:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PEs6wJ7d;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488d2079582so51140485e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2026 08:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776785300; x=1777390100; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hwHP6ksTKs4iVwbzm07YEHtMRUnb8jLaUIGm5t1l2uQ=;
        b=PEs6wJ7dgCDo4huKqg9q8OhTUv3r801ZjgtjZCTZAR0slvaOe3PPGmYHoRnnOhFrRY
         RXhf8UJwjELQ9hI22VH8zfVj7WFhSEieWARXs1ZncAtDpl2i0CMMqdPWNAaktTs1nGPM
         oJsELAmlyoNq250t33bpSRa8ATLZViw6UkqgPaVJn+OoFZUgqMnYYPNugRNXaSwhzHD0
         hfll1aQ33dfNtbbGTxIv0qZlfgiX4VQRRnd7XveVb0dSwOGx3TwBtGkBTzlySYs9MF2y
         fMa2dJ07KmH0lVcoOm8OcNwDKB4pk4HAVBIGj7EC8xGHdAE5DbY/WtxaQC6l8SmjeKmQ
         FKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776785301; x=1777390101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hwHP6ksTKs4iVwbzm07YEHtMRUnb8jLaUIGm5t1l2uQ=;
        b=qkmHcTwcrIeLjBOmZzGrXEtdSHr7OfJl/Zuy5gaLp/KoaeYBQ/eLwZmYg8S21uhpx1
         3KUGGEJGBfHVIHPKPWxkQTlPTNlqawhdgrVaZklwCvxpG3BfTDw3/KoOC0IpRTKqC8dr
         S19Y7WDMK+3aOs1zWGciOhBpCAFh1x0WlXGwxLfVMYbr9nRH3daoKf5CugJjCNxszjTI
         XgrTzeCFAdHlgYSzTgsC4yIgAXJVExUSJDxn5Rg9ynzpRVwVVahuoaYJ/WHGakxkQ9YH
         xGiUk+CXD81BTPXUu9IQB7MjnJ8CFbxKKtIIm86OArrA+q5Z/NGHS7E543ZsayWIvT47
         x1xw==
X-Gm-Message-State: AOJu0Yy9rS6IPV/S/dOf58ID3Qc4W7pdw3O2JsG8lP29bxOJusspaUTX
	mgedI5uhr41ISNuQF1757oU7m3RNCZ0gGqeqKJKUvks63CkP+NgC5m0aI1uZzA==
X-Gm-Gg: AeBDieuMCvcbcRecZjv1ijtttBHS1q4//fvmOGr+jZteJ/PrJc+RID1WSymifQRbIDL
	w0gP8eUpY+hrX5Rtw8ts1YsAxyjye+oV6R1Kvwwyn5jD31z5+jDG1yRchEpmL+VFRsMXzImADoi
	omkMVCD/puYaRr9zSXIUC2Fim9kkPgiB4AWhc3vOQynugROugfEZfkv+QoG3XzXCTcOd2931BI2
	Gu1QW7U9wqmvjVTGZpMycdA9fnIb2eclOxbN5qt9wrX9KLs/RaiJVV1erh24ZedHyJGkwpLRiav
	tHt3cD12xhWhBpUNoYcype1cnkxV2K1ch9P3jGR7yvAojUZ5f93b2za4X7Q4vog9Fgf9BObL39O
	3ujxGHga8/3enhs+ZD/60NumFrRLJtL++5AuxpL2c2cOkwvBfsKvVXZZ4BxVJV2mr9x3DoBFJQ2
	uSYd5zTEyy4D4riJ4CnsTrx0JMiBdyJOwYK7MCTnAR2+GEWb2CWShI+AG0GlUyBTRCkqnYmgRZH
	0ellnPVJo/ifgTKH+L/Kcc1ZDA=
X-Received: by 2002:a05:600c:a416:b0:488:90ac:8f71 with SMTP id 5b1f17b1804b1-488fb73a9fcmr217783635e9.5.1776785300248;
        Tue, 21 Apr 2026 08:28:20 -0700 (PDT)
Received: from toster.lan ([185.228.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc177dafsm464845745e9.4.2026.04.21.08.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 08:28:19 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [meta-oe][PATCH] networkmanager: DISTRO_FEATURES_BACKFILL_CONSIDERED -> DISTRO_FEATURES_OPTED_OUT
Date: Tue, 21 Apr 2026 16:28:13 +0100
Message-ID: <20260421152813.1365294-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2026 15:28:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126535

Variable DISTRO_FEATURES_BACKFILL_CONSIDERED has been renamed
to DISTRO_FEATURES_OPTED_OUT.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../networkmanager/networkmanager_1.56.0.bb                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.56.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.56.0.bb
index b04ad90738..2cc0b76676 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.56.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.56.0.bb
@@ -76,7 +76,7 @@ PACKAGECONFIG ??= "readline nss ifupdown dnsmasq nmcli \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'wifi polkit ppp', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux audit', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES_BACKFILL_CONSIDERED', 'gobject-introspection-data', '', 'vala', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES_OPTED_OUT', 'gobject-introspection-data', '', 'vala', d)} \
 "
 
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'vala', 'vala', '', d)}
-- 
2.53.0


