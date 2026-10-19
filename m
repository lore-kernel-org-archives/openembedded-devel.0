Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1751.1792434855509332566
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 11:34:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RYMhDhVF;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc4b1f7e8f4so1199252a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 11:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792434855; x=1793039655; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nuQIEYcJHRd3jUlv09xt04enUjzGIqoMQFbRM5YPKqY=;
        b=RYMhDhVFG5vkn82K20Vh+teJllHzKR2nJ4thNRMrY+50EyaSD76DYb9nAyXTqb2IOK
         RsFaNGqJcp+qAUKeoGWldzZ0Azi9qT/CJJuWCL8PmrsNtjcN+/VO6KqPs9bJMJ2R9GS6
         c6hGcC5BHq7YVrZcOsYvwW1wub+bwaeG99JymwhHJQInOr62RRDr5xMVvaxJppxfiQQ1
         9vWLx+0uYDqYH7BR/aFyqC2lxlw6W7cQWCT797ZOeeEfqtDlVxUTWwbtvXP7rA5Wmj54
         Z75yo39JSzok6dj2Yaqb8/IuD/52ZTWbF4FDHtHP7CDyxv8eMdVbqWPP/0otVRAoiSZX
         CTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434855; x=1793039655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nuQIEYcJHRd3jUlv09xt04enUjzGIqoMQFbRM5YPKqY=;
        b=QPGrkv56dHdqmAaQ1yL4HO1SoK7Yfp0Ax4+nhwo1NBMUjF5kCizJlUWtzkkbSyj9ek
         /a3UJxmZtsYSMyuqXt43iJ3q5QMRkH0D8+G8Jk/NJK8Kxw1HldDQ6u+72H3IPHo4O1s8
         S5EF7x7KzRawGtGMxmSgaHDh5TVCBps4dgF3LrCdnlpf99qPaOqf8nQOWj7kSFX3z+6q
         je55gsqvC0bSk7Ed72/OQMyT9MSJg6u6iPorDITnfl3bWmJIhyfxvQ1WbdS9r0QwXfxZ
         iK5ZJb4c4nZuyvtAnOVDJJPx92DKlKQ/HY6v84+BQeQPRW4FkeIgUqv+4Z1zNLM3fAYo
         +c5A==
X-Gm-Message-State: AFq9FYKcLAawwDyecplCO+OQUP+TL0eyipECTrAEDS+ih3G9mMLvhAio
	XV0X3Ks2P67Z4ymN2Zv7gmCoZWsIhxrPZ2ND4PJQFdsvADWc5zpH2DaQM3asMA==
X-Gm-Gg: AYBFou18BCJ94b5vpQndGOxkGGGAl17prxbfUcu5gLYKPWBU+SM9vCTWwBWkNNYgGgr
	z0Hg4pbTLwtbgYfPZwDtMgC7YC1PER69VTTVXtMbCHOuHbXArgcpu9a9LpANfIFORKZDrzYa56e
	+e8AVLjr78R2Vk2FPNzqJRLXDdA3L9/8yo+45CvHef+0FKo/SLgFG9wlLDS0tvVFt1xDIKivtnv
	MZjwvmuRve81orD+bKNZfTKLqWkqPED0i/+uu1CrU01UhQndbAzk0+bqsIcF/ERsIYFGO/CKuHB
	VktQDiQHeyKn+Ow37EAfxHylRrupeLV2j2FdfVDhKvy/cbeF35bbrNukUqqofie+2bs/wMmlQTV
	SkuaAqBD8qdUadvp6/fifJJUbe0zTgxexQmt+Fs95fOp4ulNQj3QR0A8t1NUy5K78/ApJz9dOoQ
	m5YKNMc/Z6yMeVBuGthvAuKIgLvyyN4SpxXl3O7GgBS9VzJpPowKCzl5xO6pEylGU5OyGC3ws3P
	xkjYrp2tWU+itX4nBXshbn1ePXtMW36crDZ/7jGg84n+UAPFnaISW7UlH1VvvK2bP7xdCF0e3aT
	BgJ4nRYa9UjRArp6gU2xnt0+f4bT1Vg=
X-Received: by 2002:a05:6a20:3d19:b0:3de:5302:e92a with SMTP id adf61e73a8af0-3e2262716eamr7542405637.17.1792434854594;
        Mon, 19 Oct 2026 11:34:14 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549fb556sm4632865a12.22.2026.10.19.11.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:34:13 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][PATCH 1/20] netdata: mark CVE-2026-83602 fixed
Date: Tue, 20 Oct 2026 07:33:47 +1300
Message-ID: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 18:34:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131127
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fix identified by NVD is included in the patch release[1] v2.10.4

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-83602

[1]https://github.com/netdata/netdata/pull/22825

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
(cherry picked from commit 4d88db205cd6981f7e1388fdcc17b451f9f8fecd)
---
 meta-webserver/recipes-webadmin/netdata/netdata_2.10.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_2.10.4.bb b/meta-webserver/recipes-webadmin/netdata/netdata_2.10.4.bb
index ed4c54fbe4..9df846cec9 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_2.10.4.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_2.10.4.bb
@@ -167,3 +167,5 @@ FILES:${PN} += "\
     "
 
 RDEPENDS:${PN} = "bash python3-core zlib"
+
+CVE_STATUS[CVE-2026-83602] = "fixed-version: fixed in v2.10.4"
