Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC93F8FA99
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 15:59:36 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36581.1776787171911206546
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Apr 2026 08:59:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=L/G+ZdnA;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso45335565e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2026 08:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776787170; x=1777391970; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zwfvvwhwLu8R4j2Gsm6PsgE5ngHYUP9R+eu5Jw5INsw=;
        b=L/G+ZdnAPCKriNofiqeIdG3F1t+cwdYl2neNEnFCJSV/i59B4yASc5kfjRZV798Hxj
         wWDsr1b0aHurUuH6dvneM5Qp1qwfm5OHCFqJiObVOz/td7JVZ42g6gfBE5aIsEar8GYc
         fCzUeVLO20731A14OvQkkU09GzTmncXYY+zS34B3P24zOFfepiRXaN4uX8PO1qOhKqzO
         XHXvcjdiH5P2w7DZK11s4iO3Ja9wHMw0zlClqOOYCknwW8/RC27+wDcAxktMyJYR4XD7
         oSNse84rXrR7eUN1BQ41YdBoUiuFaJZlsmcoeGe9JkYtkU8+YG/6CKxJR1L8UWDMNyNZ
         VQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776787170; x=1777391970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwfvvwhwLu8R4j2Gsm6PsgE5ngHYUP9R+eu5Jw5INsw=;
        b=GIQabrJvo/X3+WSVJ3bl1xj2yUmGGeHvLbXdqdyd5rb+d4lS0atWwjpXS00ldCxdgJ
         lZA4BkprBZpZ/VPK6acFu1clsm3ASKMoaz5C3+5mC+t1bk66dpRawEFyAuCQ9IpSlCTp
         qao3nfoZC5uYJut9DDBElBJ/n2hmc/IV4vFXNAa0Whzj9Uu7d2gmzpTqCNWPKmtE+s6y
         lm/OWYXlbKAATExYOj0ci2Bq9eoqCHNPCxpS240YupwP0UPfxyli76L688SOsmZVt7ch
         LreBzAYLUdcE3mUu4lzmvqRmdn4PI/kxMy2o1vhqR4sIv/BYAxWYOpDW1TxSMLz6Iwvi
         baoQ==
X-Gm-Message-State: AOJu0YxzaJJnVZdTq/8BrTv/SdmT+lw+OtXGD0cuRJE7WcbqGZQ+Ig9+
	T4VHDyXDUMc1cHHliNHrSCssWzq78f2Je67oJhYfe8mJxaiQ529ov0z1uWtrVQ==
X-Gm-Gg: AeBDiet+sh+bKAiqWHK7QkasF02mPiD39l/9AlqB00+KBq9BVV2CWN780lpclBVjQ/+
	1s+ikoBAa2bz+O0dBHCfz+BTbBc+7oLcaVs8V61s24f8t6pLc5yz1TV2S5KCgwAd4J1nxgxUGi/
	XQr8ZOgUtJm5DGphj+BM3P3wN/9c+kyVlXZyf70g/dP9y6IsOzxVbeDqeWb+4lXDfOxTXCHSDBU
	XhqoGyKfrXnnPFZrMGOyDKW+WJEYBuE5FB7nfLiL3/c8oOXpgukdqqQxiVGiqYq241hg6BpxEfc
	8huOXzlLjGhC+kgc+xKn93Mxm+fFKiQelApClxcaFwypR92bKpXfL1bbOjhc8ahj4u+fIBl2Biw
	wlpjU/gs5AHe9MZihwQJBM9SMuRN6EljNeeIPt8XgdP1BIY3K1pn53mSAB8i9R0oGbA3WbWgLqD
	qZKDQFPQMKkJdGf2fIATyndeDDHJAKkjrJ283jh8UFER4xPbaYiceekF/CsU1BFOXDHk5XkTy33
	YsC4jiGHltFVsUYn7QRczaHFwuSPEmCFNEB8A==
X-Received: by 2002:a05:600c:3483:b0:488:af7f:775f with SMTP id 5b1f17b1804b1-488fb77d343mr250689015e9.18.1776787169832;
        Tue, 21 Apr 2026 08:59:29 -0700 (PDT)
Received: from toster.lan ([185.228.163.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4eec9sm36596582f8f.34.2026.04.21.08.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 08:59:29 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [meta-oe][PATCH] networkmanager: re-implement the vala detection
Date: Tue, 21 Apr 2026 16:59:25 +0100
Message-ID: <20260421155925.1430423-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2026 15:59:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126536

The introduction of DISTRO_FEATURES_OPTED_OUT allows rewriting the
DISTRO_FEATURES by removing whatever is in DISTRO_FEATURES_OPTED_OUT
from DISTRO_FEATURES.

Thus, the logic of vala can be negated, and it can changed be to
see if gobject-introspection-data is available in DISTRO_FEATURES.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../networkmanager/networkmanager_1.56.0.bb                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.56.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.56.0.bb
index 2cc0b76676..138d7118eb 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.56.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.56.0.bb
@@ -76,7 +76,7 @@ PACKAGECONFIG ??= "readline nss ifupdown dnsmasq nmcli \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'wifi polkit ppp', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux audit', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES_OPTED_OUT', 'gobject-introspection-data', '', 'vala', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'gobject-introspection-data', 'vala', '', d)} \
 "
 
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'vala', 'vala', '', d)}
-- 
2.53.0


