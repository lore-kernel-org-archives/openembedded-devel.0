Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 207F6CCD182
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 15:52:20 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.37403.1759765938986250279
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 08:52:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dyywPQvF;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-71d60110772so51640967b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 08:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759765938; x=1760370738; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HQ672EiOjeN8ph14FZZKZ2KDzNgYpepYazoSb/rFLs=;
        b=dyywPQvF9+S53Rps3vcTxAbqVOO6kuM4J/+qXto262S+Lcr/XR/rpvLcnoc4bORMxo
         waeAO7sAsS2GEUouY+Wk8KBFhCCax+i9xhCLky99Az1vWMuZ2FKo8qUIqIAZE/K2QGMM
         MYC29mN29KSrYgj0xXKo+iup64+IajAa2HB5cTaOmEmCaAhenpj471ZUHQ6gLzs/fyh3
         LNTQ3vkJxsTEsYW0uLfMlBjhPhfKN89j/k2GIsSqDPZcd+xjcVc/P5FELkR0vXA3RJ7x
         m4W5O3JlgQk35n3oCstG0pYlcZ7DB9o1Xv/3EMyTxOg2S1R9qiVJOZ/VLbN9CSYsXhWK
         7D1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759765938; x=1760370738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HQ672EiOjeN8ph14FZZKZ2KDzNgYpepYazoSb/rFLs=;
        b=LElp+LDCYbg28Y+t0HU/hMF6PFFMvMbGrafpzJH8UvAUBsTp550rWDjY7s9NSgMUJ9
         uBN7NQ8o8pC1uU/ONE7keEPeky9ISFeh63VHGvXHLTt2yjAHF7faDUgfpnJdJelj+iW5
         MTixE9x7+ykPw5rcdgHbxAho9O9e5pguSBjRrKW7Y0Q5m9PguwxlNsgFsIbgmSiqFxTv
         bbCPBwRB0qY3j7YsPvM3sYJ81eq8KvX5qV6/0GJWoHXkxo8E8LwNTPlPFSL/ZOCW2+G5
         10HSe/3ZGts/i03rIXfpqhwIkYDsfZ9wWPGF1OldMpuzqhVlCOU3JFIxeCFlwfeZluQf
         xs2A==
X-Gm-Message-State: AOJu0YyNS5R71xpwdiZUmC+ln+TqLsVp1oNpyP6uZiKEWmgBU8hBCkA7
	YkXkAnd1bVxFmGLiOv5jI/Wb7fG+U3ZdzEtrFrCcI9T5MJcKMchQ9IZHBMtmvcW9
X-Gm-Gg: ASbGncvpjExDLJKguCiLtI2PbCliGvuIaN/0cnm4RTArr0uaic7ISfVp/GtvZ1XGryH
	oh1nEeGnX8TX8sICaT0sjAoKWxClXBbzjW9kO7erdAtyo1Mu2peRcPD4aONespEI8PtXv/Amc2t
	p3xqTWDBImtCfY4S2J5Rq+p0FY/jNliwQBrgWAe+virdSLiRuHwkF4+5E5p7tRiutFYCNK0CLmM
	VAWqjQU7xY1fEMMAizWR8eGQb9A92/yVXtPUMG0p5o+3b5E5jzaMUZtiXrtYsXePsDl8jStehlp
	JaJDYKicXWfsHu/mYmV1f2plxh0KVHbqjrbG982hG26IOAP3IXazJEFGA6rpfTeIpoB2c3cvdzt
	zyx6hHdxFujD4AdI+V6jHdVgRJXhz7UwnvZseJR0wSOB9YF3ZaqwLOnvlz+4pO1m3eQE4rwdURA
	==
X-Google-Smtp-Source: AGHT+IFlbK8B6x+5pZ4PbTjAJaGGqJojnBifvtNnPCmscFqQxp9rTFz5ajDiJ/lfa7B2LWsZNmjAWA==
X-Received: by 2002:a05:690c:a87:b0:77f:772e:6229 with SMTP id 00721157ae682-77f945930a4mr245766287b3.1.1759765937459;
        Mon, 06 Oct 2025 08:52:17 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-77f81c34d7esm44294397b3.21.2025.10.06.08.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 08:52:17 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 09/10] xfce4-wavelan-plugin: upgrade 0.6.3 -> 0.7.0
Date: Mon,  6 Oct 2025 11:51:45 -0400
Message-ID: <20251006155146.416335-9-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006155146.416335-1-schonm@gmail.com>
References: <20251006155146.416335-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 15:52:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120300

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-wavelan-plugin/-/tags/xfce4-wavelan-plugin-0.7.0
Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-wavelan-plugin/-/tags/xfce4-wavelan-plugin-0.6.4

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...-wavelan-plugin_0.6.3.bb => xfce4-wavelan-plugin_0.7.0.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/wavelan/{xfce4-wavelan-plugin_0.6.3.bb => xfce4-wavelan-plugin_0.7.0.bb} (70%)

diff --git a/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.3.bb b/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.7.0.bb
similarity index 70%
rename from meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.3.bb
rename to meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.7.0.bb
index 64e7ea6a18..d6c9da7041 100644
--- a/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.3.bb
+++ b/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.7.0.bb
@@ -3,6 +3,8 @@ HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-wavelan-plugin/start"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e1e5872df9c5cf1a23f16493d9104920"
 
+XFCE_COMPRESS_TYPE = "xz"
+
 inherit xfce-panel-plugin
 
-SRC_URI[sha256sum] = "61c0c2f56cb70872d403b770dd76349df9ff24c0dbe905ee1b4f913c34d8f72b"
+SRC_URI[sha256sum] = "5fdce1e1b0d29d0a258dca86bab9d4edcbc12098134b92e00ea1502086a49116"
-- 
2.43.0


