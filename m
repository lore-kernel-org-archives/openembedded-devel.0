Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A1BCCD184
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 15:52:20 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.37401.1759765934374280622
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 08:52:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GHIxxCv0;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-77f9fb3bea0so28059177b3.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 08:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759765933; x=1760370733; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9lqRYvDCmduMsQKKdXycKZDYqLfiNCJxCAxWDAVXqQ=;
        b=GHIxxCv0+TS1EUQfFziK2YIe4ZbgY7NTL/KtgLmg+vPvs7RvdG5K/1/g9gb21woUT+
         qCfE1txP5aPnkXbz0SoIAaT6Fi9SBa8BJlPmGxZLULOPiygtpLzfPY7yss2fNW9RSt0e
         +V9FHcOgzBr4eOH5pZmEi/bF4OrJUP+0XFs8UJ6n8ynb6Z1+ZgTMfhhZgA+MigdyZqfO
         YGKvPes8HEynWS6NYawjEz16UYOIyxcIho13Ni1w/0EDEdDIB/u+x+U3ebYNDlCOOFCq
         9KvfUzt/GX1FBBphs9C30Fsj6Hfl7lL+97kPkuOfC3e8fLtbQNxiM1OTHLVuxnCbSAix
         6Hkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759765933; x=1760370733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H9lqRYvDCmduMsQKKdXycKZDYqLfiNCJxCAxWDAVXqQ=;
        b=boahopHLyZGDNaUy1xIw73uHVuHOd8XmVsSF0EigctDSJvb667bJZeeM7RtkKLz5en
         1CwYQtywA/iQj9Sp7AIkFlySZmwi7WqwepTBGWbi4BVUESYa9HuOffgaahf1/yzsU7ie
         ntmFhD8NNIUY5NViMDN872Pn93ilXgqb/WgxXrb02ps55RE+lesRZUVeSOj469rr8d3e
         yFCKq19RW50kga/MwYYndhSbyITcARXEwKftLLaLwzcs3etQrS/i01gEEki+e7+VWHE9
         lWKiAyZXaGFQwv6WrII/jc0iTBTpaqxEO64v+JPZgD1KT8EMFQ0xUO83dOgLx3ZGlDqN
         rfOw==
X-Gm-Message-State: AOJu0YwTGpm+usXsoIUSu++qHAeSAwQnsyRMQwEEISAy6i4JPq8u7bHg
	CUirktPiIwruCgTzq5cnFaofXMWwUxrrWenpC5DW0IImYxLWPhJ/GfD9qVSBlyyt
X-Gm-Gg: ASbGncsVJN6Osk5fhSqULI+YYFWvsHyf2IGutHxYt5Dwerp2yIeUJpJxffOaNEwYh1+
	/am2uX9n9twAs/Ufs9x+9lmQJiUc79S3l2XneCTgSoSwwabOnQTVWp4/48c2qBbsU0yobxpW65A
	fqc1Set+3yLdsOwmDgizbfWOfnnONRezWxvi6lU/4nrxE2c0tcLO0YHlqpV/Y+yfHIA2yc45DDE
	HpMoMqDACTwXTGd7yGP/b54OtP+W5xccHob79jJ4IkqnBaecwThuiHxQvgdtx6anKhlEbid3qtm
	2kzNt1ZER3MhPDCT43YC63jJjqojKuD6KO932WVdVArsv/IBpZeNBwaYJkz9fn+q0VlaakiuMWr
	5rqKfpPBb0ULTooQrWAB8An6v9EkRRzpmzVUWHddwLCIawaeEsR4qQNB/Rw6i0FA=
X-Google-Smtp-Source: AGHT+IGevKzYYaDfs+ZlYyLah4ejr182MH7OKAEGIx6BeJ+cQIg9VMhM0VEO6HMG/cGOarQ3xFaHUA==
X-Received: by 2002:a05:690c:3690:b0:737:625e:bf07 with SMTP id 00721157ae682-77f945bf353mr172697687b3.23.1759765932887;
        Mon, 06 Oct 2025 08:52:12 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-77f81c34d7esm44294397b3.21.2025.10.06.08.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 08:52:12 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 07/10] xfce4-timer-plugin: upgrade 1.7.2 -> 1.8.0
Date: Mon,  6 Oct 2025 11:51:43 -0400
Message-ID: <20251006155146.416335-7-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006155146.416335-1-schonm@gmail.com>
References: <20251006155146.416335-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 15:52:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120298

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-timer-plugin/-/tags/xfce4-timer-plugin-1.8.0
Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-timer-plugin/-/tags/xfce4-timer-plugin-1.7.3

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...fce4-timer-plugin_1.7.2.bb => xfce4-timer-plugin_1.8.0.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/timer/{xfce4-timer-plugin_1.7.2.bb => xfce4-timer-plugin_1.8.0.bb} (77%)

diff --git a/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.2.bb b/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.8.0.bb
similarity index 77%
rename from meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.2.bb
rename to meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.8.0.bb
index 0f164b79c5..eaaeb993fb 100644
--- a/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.2.bb
+++ b/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.8.0.bb
@@ -4,6 +4,8 @@ HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-timer-plugin/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f1c52159bdaebd029cb11927cbe709e4"
 
+XFCE_COMPRESS_TYPE = "xz"
+
 inherit xfce-panel-plugin
 
-SRC_URI[sha256sum] = "feb3b8c2d39505e816683540a3226bd7bda870ccbcb4c7d0f6abfeeff5c58b7d"
+SRC_URI[sha256sum] = "1d3ac3aa2c4345400c025642778e7643aab41047622baf9cdc00bbac78e89f99"
-- 
2.43.0


