Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7278EC9830E
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 10:50:53 +0000 (UTC)
Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35335.1790506253113322640
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 03:50:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KpXye4af;
 spf=pass (domain: gmail.com, ip: 74.125.228.40, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc745abb731so831649a12.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 03:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506252; x=1791111052; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gwERE1Wa48lUCuasmHWpyOZgDJM5OllFbvI5f2mQnBg=;
        b=KpXye4afJYJm8b54diFUUzuqnU/bEvOXlqRFVfaXe6QWEjCMXQbpLAuP7AmfKi1Hrj
         oNMkNUC4yyzzBVvJzM+ufUbFXS35iXadzsXIoadgjSYgqF/Szor3t37wn4SGTWsNg6Z/
         I0KzIIekjse1mfA9qaeaWuZqt2mkGR4ZR2oePV4tVzAjSqx/CWSzCo4bJEBXF9/biz6Z
         tsKVL0O1ux4UpXq1wr0VohQWPcPJi8bPTLG7i9Hc7ujWesvkN2NBFn1fgzcmN7vkEkdF
         fZXQax0/oa7hde82VQQ07suK9ehwnG8Q/KopbxENkvLjS/mVIpZwYQYbLhOg29Y6oQc4
         Fl9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506252; x=1791111052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gwERE1Wa48lUCuasmHWpyOZgDJM5OllFbvI5f2mQnBg=;
        b=oGdL/YPxGxd9dTnkHoXDWERrjteYeB1cpssEKK24CTJfphkcwWn3XoPtTGZGK2eyEX
         XUs7QcNz5TH8/gOr3KUpV9y2tjK3ckGcazraMXegwvPE5n1LG6QMDhxqOV5M2GhgWW8Y
         hXf2CxIE7O2aHlmTCR9ULh8gEZD3gVQq9+rs0I3Rue3lDyqTRBkPqsFK3DFwpCXP1wxI
         Eu1GApbHBlGcxHO+Y1iDLl8BbNRObqTA7jgR1HMptoWNJgjAbJSV29Dql1Y4rXxNDc/S
         kEG1mHlbcZKtO7lJZ3p8oGm44dhpaZVsVJWK23iLsDGTNn7+h+q88d/ZgLG+40mXRtwp
         L3OQ==
X-Gm-Message-State: AFuF++lKjlMJBakezmUZ0qbiyfDXavakQU/dNIeDK801SGtKt4NmIc0T
	f2YerqQLTFKIiBLMR0Ol5nxSEQvNFpcHhTZLaaN1m42h7Kh8Xsw8g+sBk2oIhQ==
X-Gm-Gg: AYBFou0/P//pipwOvHp5nSyf1leTvZKaTyakYQCl/VfNhvARPgKCQ1kKG+lYhnNx/r1
	t95Lnc8wiQYc/DHeL6P2r6S65zTaiiSXCqGO4W8bccT5kPAwbsXMoNAHU0Y4FGsvThLq/XPun9k
	ogBqi/Okxc8IxWxTpJ3QgvsD8ItXg3WrI24vRrI1REiO0BK9ME+ZK+JKcMfAGSiRhs7mPNZl7SX
	9KWNVDGekvvMknfXWxiMjyF1tBRj21VXcGcD9YciRuJFyK6Rgf+gaDyPVs7uPNACH0qrHWxMV2G
	dfEKr9yhgvHkS37SSLjFuXJLRyMnJMxCbgvZiQKSnP/uWFpG29dSUz8qqEXaYa+IT5gfa7Z/t1j
	I182GALa7+ru01qH7RgoK3TR8rFIzDPPF/wWKEEsUQI4T3Oxy/cTqnAAr1GkfRPXf6RkFWFzVB2
	0StKXUL0yORx5PtirbO5asli5insU3Lsr4xkpPIWZJfzMHlkfK0rUaURiajxs/M2FXzJufit6iM
	SNmYjPfsq0UstW28D2N1CE=
X-Received: by 2002:a05:6a21:3294:b0:3d3:adbf:7780 with SMTP id adf61e73a8af0-3de0e75f0c9mr8938746637.21.1790506252524;
        Sun, 27 Sep 2026 03:50:52 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88268c5ed75sm640542b3a.48.2026.09.27.03.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:50:51 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 16/35] openvpn: upgrade 2.7.6 -> 2.7.7
Date: Sun, 27 Sep 2026 23:49:43 +1300
Message-ID: <20260927105002.1832451-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 10:50:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130350

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/OpenVPN/openvpn/releases/tag/v2.7.7

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../openvpn/{openvpn_2.7.6.bb => openvpn_2.7.7.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.7.6.bb => openvpn_2.7.7.bb} (98%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.7.6.bb b/meta-networking/recipes-support/openvpn/openvpn_2.7.7.bb
similarity index 98%
rename from meta-networking/recipes-support/openvpn/openvpn_2.7.6.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.7.7.bb
index 930193af7b..604162a7f2 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.7.6.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.7.7.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://github.com/OpenVPN/openvpn/releases/download/v${PV}/${BP}.tar
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[sha256sum] = "10e24a9385f23cc38cc5cf448f3ca0769f939bc4cbecc4f4647d7e006e52db74"
+SRC_URI[sha256sum] = "3ab8f48fd6c26d49ba2333a092433949afdb5c85c0e6a1ff265784fbc04a2463"
 
 CVE_STATUS[CVE-2020-27569] = "not-applicable-config: Applies only Aviatrix OpenVPN client, not openvpn"
 

