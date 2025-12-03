Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 282C8D1BDE8
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 21:30:00 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27236.1764797395785953236
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 13:29:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i5hBgGNO;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so2473515e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 13:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764797394; x=1765402194; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ssszST3OXZH8Pr9rYskEy2b4V4o2vYxrn4pUE43bTZY=;
        b=i5hBgGNO79nSzaW+cdSHUIUJKmDwguwmT8LbnN90Tafjd+45GxX2XtOWNWHCX1LLv3
         C7tPl/2ZmHmTYP35SY01to4MVzrl6BLLa4jh7GqoVra1ecJHfFJWMlk5Sok2IM3lVPom
         6z5AM0pZe6e7Zrup7cmz8LMchkwd+Luf21ofEiRbbMjfD80SYHyGcSXj/qVOU0ntDui0
         3dHrqTg8hUrtohR8zCKYNHA2QzZmiVecSqP0G2usjx1yBsOMCPS3jyY+4MqQzdJtRA8W
         SWEF/DRvww1pztlW+Ltl5k60GDjcSp2dRupe8UhwD452DhWQurPljjBJOxPIDgWbHZCU
         hf6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764797394; x=1765402194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ssszST3OXZH8Pr9rYskEy2b4V4o2vYxrn4pUE43bTZY=;
        b=DKqNsQCGXHhZP71TFw3ttbQNwa2RVIPWKlvIMq4M3QD9yojH+yJ+wV6oUxW/0Uas2Q
         UjJYuKHrQf7huCdtT86EqHOAkiaicJ/GIswo3fKQ+itr1G8pstE/WWQd3lRteAXaBLg7
         hJqc3GHYZyD1DMyzY81WQIQosVlxOWqemHWZS496x9LiOYPfgZN+Vf1LZCD+Gd8iRVUf
         jWWgWxVg9+/LsXxmTPhzMrZ55bnel0UWW9C4kOzY5Gvddm+Suoj5/FLEu3ul9PnvO/5z
         FsgU0XxGYoYjgeZpcGu/s3cHo/zx6JmI6+nZYh6aml9Z7Mi5A7JLryPGZMxAVWUON3ZU
         B4Nw==
X-Gm-Message-State: AOJu0YwKhikJEwJyPThlYoAHyf9fmgCiidBAc/9mDOeAbgX6KlCJok/1
	iquRgjWMOrhTKTLNAaEugy42ITxSu0RmHvNfOXDYjF64DQXppSGV/q2Fq7+baA==
X-Gm-Gg: ASbGnctOfqjJHsbphZTQYYPxvz9j6QgVDf9D2H31U3GVNCSNec+p09RZWrLsX5A7NiS
	ak1FAEUEAc9QuKLrSn8ZcZQhYGJs3T9c1N2sYG3CQCbSAMefDnx5X3L874udYUuUjmXI0lZ5/fp
	l6pAUTmBKfGEFm9ehRO3gX0rdOe67vxSQiueyvQ40iSo6gZLD3O1jClNgZmWjeWNEb6s71iAYPv
	aA2ab39KAe+a16/yLWqUNQ0kWNfttNH/aoMrVvU0ob5f+l2YaTka9n+lpwCWzfcFso8yDI+A11d
	P3LCNrtaO/mNMByZ01FDzdZD5ATW1UwbiMD0F5B+0XomtjoCFNxXUeu7oRqh5fkxh0rhbiDp8ax
	tg+kJ1Z2UjcdSfAXZrbZNcSHPDVM1QTBXBCudGWHYRYA6att+bU0j5E/vHKj0Njmo6FjkdhREbo
	kaK2TaQXQv
X-Google-Smtp-Source: AGHT+IHg0gLU+EQEOkmV1AoPTDFQHV5CAs5bmz1EJ7tNjR44gCh/Gz3Bba53XaLPUDtEyC7USUfcOg==
X-Received: by 2002:a05:6000:18a6:b0:42b:4069:428a with SMTP id ffacd0b85a97d-42f79514c50mr461873f8f.12.1764797394026;
        Wed, 03 Dec 2025 13:29:54 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f6ffa18ffsm10722885f8f.5.2025.12.03.13.29.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 13:29:53 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 06/12] xrdp: patch CVE-2022-23481
Date: Wed,  3 Dec 2025 22:29:43 +0100
Message-ID: <20251203212949.4046524-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203212949.4046524-1-skandigraun@gmail.com>
References: <20251203212949.4046524-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 21:30:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122284

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23481

Pick the patch that mentions this vulnerability explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../xrdp/xrdp/CVE-2022-23481.patch            | 46 +++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb   |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23481.patch

diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23481.patch b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23481.patch
new file mode 100644
index 0000000000..b138b535e3
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23481.patch
@@ -0,0 +1,46 @@
+From c77e974080da8267d902f99ca5ab7d22ea02d98c Mon Sep 17 00:00:00 2001
+From: matt335672 <30179339+matt335672@users.noreply.github.com>
+Date: Wed, 7 Dec 2022 10:40:25 +0000
+Subject: [PATCH] CVE-2022-23481
+
+Add length checks to client confirm active PDU parsing
+
+CVE: CVE-2022-23481
+Upstream-Status: Backport[https://github.com/neutrinolabs/xrdp/commit/c77e974080da8267d902f99ca5ab7d22ea02d98c]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libxrdp/xrdp_caps.c | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/libxrdp/xrdp_caps.c b/libxrdp/xrdp_caps.c
+index 5c5e74a579..ac21cc0a18 100644
+--- a/libxrdp/xrdp_caps.c
++++ b/libxrdp/xrdp_caps.c
+@@ -667,13 +667,27 @@ xrdp_caps_process_confirm_active(struct xrdp_rdp *self, struct stream *s)
+     int len;
+     char *p;
+ 
++    if (!s_check_rem_and_log(s, 10,
++                             "Parsing [MS-RDPBCGR] TS_CONFIRM_ACTIVE_PDU"
++                             " - header"))
++    {
++        return 1;
++    }
+     in_uint8s(s, 4); /* rdp_shareid */
+     in_uint8s(s, 2); /* userid */
+     in_uint16_le(s, source_len); /* sizeof RDP_SOURCE */
+     in_uint16_le(s, cap_len);
++
++    if (!s_check_rem_and_log(s, source_len + 2 + 2,
++                             "Parsing [MS-RDPBCGR] TS_CONFIRM_ACTIVE_PDU"
++                             " - header2"))
++    {
++        return 1;
++    }
+     in_uint8s(s, source_len);
+     in_uint16_le(s, num_caps);
+     in_uint8s(s, 2); /* pad */
++
+     LOG_DEVEL(LOG_LEVEL_TRACE, "Received [MS-RDPBCGR] TS_CONFIRM_ACTIVE_PDU "
+               "shareID (ignored), originatorID (ignored), lengthSourceDescriptor %d, "
+               "lengthCombinedCapabilities  %d, sourceDescriptor (ignored), "
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
index 55dab2e867..ff14cf8397 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://CVE-2022-23479.patch \
            file://CVE-2022-23480-1.patch \
            file://CVE-2022-23480-2.patch \
+           file://CVE-2022-23481.patch \
            "
 
 SRC_URI[sha256sum] = "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d3302b0c47653277abb"

