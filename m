Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8321378695
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 08:34:51 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id f71so13416902wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 00:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=IYuBhHRwoor6qQs66IiFWs6begc/s0KFbOx8r2Rsp78=;
	b=A9Y7lxsVpMvjQlgDBgbfgyRfaWnVIZMTkT2dPOtWYl7PgSqbFOhAxf52qAuYdghG6p
	zmqHgHmcntVNs3htQLEJCq/vEFxwuGEf0uhPxfKU5ccnaUWcH/LmXDcpK0djW4LwzjR0
	WxwwOoWatFckJ8BGZlp4b6/AYYeJxqalxDtdUm7F0zUzmYpG9e+ygthHAy3X1er9X1x1
	r4SkB4TXVFsEDAykY4RZmwXPvennVhqFOkv4LPMAK9BJ7HIJh1O+h5iFsC8cA5FnqRX7
	/rjN9CbA6Zn8ANAV/cApS12amYOVZtJM2NrcDOXxCyQT08YdoTTw4CKVeKNkhjoJQHBQ
	x59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=IYuBhHRwoor6qQs66IiFWs6begc/s0KFbOx8r2Rsp78=;
	b=C88ll4F4ncl8y9CdmLK3WH7PJQ5rI1cZc6rO2pQlKWkiY5YwiuXt66F3ERJKL4CZmz
	iKGxkfbnHR3RWTTpssRBex+LOpoGy4zMkOYJ5YxoEZXm1c9vxqKmiPubjJYwkniHx7Ra
	wtQC/66We1pdK9cvaslMbpPRVuLRtq4v5+mhn507rQa0pZKiG4IAwDed2aKBdXygCon+
	tLJ4+lW2SctlTAMPQoupuLgUgbZSvPdPa9Nij96HlUkzFRpcza2GJqNiMpFBJOMLdN0m
	7Sg1zWE8wunr8HwLfpaiHl0epcwzmwnGzKikvknL/dEY3sxpMN1Ph/MJ+jdVhUcZngbi
	md6w==
X-Gm-Message-State: AKwxytdk6H4u6Th2WNurmO52KMb/Y5oPwP2uGr9NJzQafrFHiN4ygTKG
	t0Kk06BiwBBtN0lYlgmD+OAhBg==
X-Google-Smtp-Source: ACJfBouLyH3qv8XOnJZ6gY/HGjwxgH1MzGT8MyOwPyRSR85dhSy375OdweSXYcXOzakR09GrfO3oCA==
X-Received: by 10.28.194.137 with SMTP id s131mr1611281wmf.3.1516178092060;
	Wed, 17 Jan 2018 00:34:52 -0800 (PST)
Received: from localhost.localdomain
	(ip-88-152-110-191.hsi03.unitymediagroup.de. [88.152.110.191])
	by smtp.gmail.com with ESMTPSA id
	c54sm4230832wrg.68.2018.01.17.00.34.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Jan 2018 00:34:51 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jan 2018 09:34:08 +0100
Message-Id: <20180117083421.30233-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180117083421.30233-1-schnitzeltony@gmail.com>
References: <20180117083421.30233-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 01/14] xfce4-panel: update 4.12.1 -> 4.12.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Jan 2018 08:34:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../xfce4-panel/{xfce4-panel_4.12.1.bb => xfce4-panel_4.12.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.12.1.bb => xfce4-panel_4.12.2.bb} (91%)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.12.1.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.12.2.bb
similarity index 91%
rename from meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.12.1.bb
rename to meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.12.2.bb
index 80332cebe..75bcdd716 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.12.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.12.2.bb
@@ -8,8 +8,8 @@ inherit xfce gtk-doc distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "0b943f2e72a3693dddb1af559826cb62"
-SRC_URI[sha256sum] = "93d58b80cca9c9eb58adb281bc75404df7cf6cae89f7f98bb9f38690009aa2e8"
+SRC_URI[md5sum] = "803c9aabc2925dc97f96de125c52ba2e"
+SRC_URI[sha256sum] = "42058abb81b8f87691d3999627447de71c3285bcf055f308aab5cefab2de0ce9"
 SRC_URI += " \
     file://0001-clock-time-make-change-of-system-s-timezone-change-t.patch \
     file://0002-windowmenu-do-not-display-desktop-icon-when-no-windo.patch \
-- 
2.14.3


