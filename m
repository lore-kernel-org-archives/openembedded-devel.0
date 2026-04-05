Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D209EF3D5E0
	for <webhook@archiver.kernel.org>; Sun,  5 Apr 2026 12:49:57 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34600.1775393390965532224
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2026 05:49:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=f6lzczgC;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35c1a131946so2403877a91.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 05:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775393390; x=1775998190; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ltPYnq9Hk7fgtIFBRRur1ov3hemA9HsPywQxdZr+UrU=;
        b=f6lzczgCm5Rc7FJweH8oFnIf0oQ8GDH4FHwCfFvo1TSGlLzgxsDnF6mBF8kGlepR3y
         7sFExScbQ+8oyVRbPLq0UQppy+rWNavJ5hXaW/7SzD69Pvoy0d5B21+iA2m3B7HOxG3f
         BNBbro2ixYIceNFMOEi6DizFzGYxuzvpIscWJn9rRfT8+7NoX2vrAO89cOwaVid2sLMe
         lus/5irrQvpTw+JUf/ZTKvpyy4ADLdWsJ0oEly5WrQwcJ5UxOHAmE120gYygjH3gaaAo
         Zhzz1kawgWkbJU2tKgXDcB910Dntex720MrpBU1NF50nbe7oW/76tBh+YE6BYyNVtJVZ
         RrnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775393390; x=1775998190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ltPYnq9Hk7fgtIFBRRur1ov3hemA9HsPywQxdZr+UrU=;
        b=DO4bDFGCPCMK+7A5DmM7/Tv5PeTZn9pHGBOGRxVpsxlfOwcSmKAQpA4jsyfUVwL2iq
         qzSGhkziwcmWht7ir074ann+rKheqNnTlchrhjC4bygg/tJ9N206PpSvOwa7pxlqvGr8
         +gv94ZMfmyOzkXWsH3RWY+sY+kScuzkD1pchRbvLNm09wXYp7CSwet8EmFzjFqD7WhzU
         JKs1ID5jGxJCjOaGajyNJUBG0TmBgWk4/t5HE7xRlb2q0+4xxtm6EU35qb9W1DRWrVrx
         iR96bpskdVxD8uBxQzSHz1LLXIdI23O++fzmGHWwgDHsGhS8oTn4esFPulfgKjQ8+YN3
         8nMg==
X-Gm-Message-State: AOJu0YxqYFfMIr3Hc2kKmQX3ibS+CnsXwWE/FdN4yQpKPfXA35/zpknr
	Oo0usnANzzxjfh3jqqjy5osRchQAw9A7ZZPC/6iQHvPjkIZwe1LSf2/b0HI+7906g20=
X-Gm-Gg: AeBDiespxmmfJPpsrh/iJF5Q7fH6ToqkzeoBV7hCIbn5p38ntgFzA7DviUJ7guv6xzO
	kWBm3UhS16cMCpsOmNaMLXckUEWeywPfnY7pPoOiqOLh1rpLdXYPx1G8rE7uPK1tZeATeU0DeLD
	49uB1VBlhFsSM9PIjmYeoA/qd6BZDZqfw6jyUci7V6Jl8MJs47IKgfpUyk5aiG2w0WXbqjogblD
	E8o9GqDc/tid0KXjyRODu6yGiZwyu3hBy331h+H1JTur9dHjY7HhxhPf9s0N02Udmxz+2inj9QN
	iSkn4raTt5bBH2erJ5ByBzhh0POcRXwezqVo0FlUQebKxPaLvITF3svop6kwJDWXhvjFMnSXFQt
	kTpjlsr3Ek4cFU2yG5w9LTAZRJFceIAdq2ZPykdVv5TnZ623l+rZtweDRdAz37eiPIjHOZg4Yjn
	Lao/O0VE+qtlD43USNm3DZeni1OWjfJxdJSt4=
X-Received: by 2002:a17:903:3c47:b0:2b2:6fbf:ea2d with SMTP id d9443c01a7336-2b281bba764mr77028265ad.7.1775393390241;
        Sun, 05 Apr 2026 05:49:50 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27477736dsm106828025ad.24.2026.04.05.05.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 05:49:49 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 9/14] zabbix: ignore CVE-2026-23919
Date: Mon,  6 Apr 2026 00:49:11 +1200
Message-ID: <20260405124916.2881008-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260405124916.2881008-1-ankur.tyagi85@gmail.com>
References: <20260405124916.2881008-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 12:49:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126008

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

It was fixed since version 7.0.19[1]

[1] https://support.zabbix.com/browse/ZBX-27638

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-connectivity/zabbix/zabbix_7.0.19.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.19.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.19.bb
index 141342c45b..61f6915ea6 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.19.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.19.bb
@@ -77,3 +77,4 @@ FILES:${PN} += "${libdir}"
 RDEPENDS:${PN} = "logrotate"
 
 CVE_STATUS[CVE-2026-23925] = "fixed-version: fixed since 7.0.18"
+CVE_STATUS[CVE-2026-23919] = "fixed-version: fixed since 7.0.19"

