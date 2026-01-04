Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C097C2A062
	for <webhook@archiver.kernel.org>; Sun,  4 Jan 2026 19:11:15 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48563.1767553868383038144
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Jan 2026 11:11:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TgMqLYiz;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42fb03c3cf2so6780615f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Jan 2026 11:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767553867; x=1768158667; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=d6pHZyipu2mofaaadmGUByAIUI6mAtD8KXukUXbnxCo=;
        b=TgMqLYizcIHRHq1FFTqBpelsF4HRKKXyY3FhteFIjMGS8J7/pJcqXqFBJ+hVf0gCPy
         +PqZIa7R32z6QV8zBRjzqGQPTQZSLLvDaJYnz9n+hEwjxsWbuMGhD0d31aGM9xuXLi7w
         BKjQVM4kTpb69vKkNuZOfvbqfO880kOmXjvVCXnJp7EY/jzDEE3hcNtSVloZwnEDbKG2
         EHtuDZt+d3Ads3OSZkKwcbArRlktJSbWwEos4nDYCp0un08aL7mmgyOblucwrjQmHgfy
         JbXeRqYCNWsFYn+VehivHZOBoJDkw5Pq0VOISJYzVzR2HPCgEjExRbD5whmGsora6skc
         6FAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767553867; x=1768158667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d6pHZyipu2mofaaadmGUByAIUI6mAtD8KXukUXbnxCo=;
        b=NhGQvH9wW0FDX/4bHkB0gjxx0+L3J2fU9XSp8U6NkizMEAJ42Ezxq/r4XF8Z0EMrjR
         5urOkWdTTAP8mFUUmtFE7iG7hPQ6Iwig6ZcWLNk4Wf9a1vrWPwPBov3X8SNEhqkn6Dui
         YkTWFOwNTuOhmyzA21sDOyGjEL44QbK9KbvRliDjjQftJklDXlUd2eRLLnrgceHTEx4q
         OulYtF8tl8T6uqb6jkuUNUmVdFC/RQWSc+qZ7E0pMov/StHylVaN2K/Wc9Z2dtZkrQto
         0uUjgQDZwwsewdr8INVYslxbU66NCm/x/tbVCLDwIu8vmF29MsMpehmcabvHHuakwtfa
         B3Fw==
X-Gm-Message-State: AOJu0YwxkvJ9Mi2154XolMlzoq5x45llhIiGOCxcPNkKcB8Vp0VXM3E/
	OL6CxsmqbknB6BtHk90WyZLlKJTXljyJD40ZSu+wB92xClTVml2FBjNf/oUqrQ==
X-Gm-Gg: AY/fxX7L/LAbeREciRFbobgYY4Ui606X7QLK8ZKyoJxPjVa2L1fxgsOaAfLSMqgBOyP
	McVlKLCNYNB5cishCzt7fEi1DAw1Hu+rkvmRL19IW54kIjZVLOCfD9FrNoMPUBAJHJCFF27EAoL
	3KSfHTu/5orkWCPGa6J19bdIv1sVNEoBe5odIyF2L8KBROzg7Rw+JdEsLNEVn3871R5GUz8meSb
	TvjUiR2B7zyX8pkVA2r5NZheqBOxbUlhhP9C8LhAiLZ530KyI0Cfhg/Pw/TmPnFJBMGnH2slCOr
	bxFa0fLuvZKTuujVnwJKAEHJj15S9r5PyeG5EZVI3ltC4ea+iHEpDamBce47osZIlKJdXyZ8fhZ
	3cHKeRy7onR1Q07qcjCsQJ/ZJWv0DzFw9TOFwQXjrUTvvfI1kleZVi/9MqbNJAY/xEGoPN6DLvG
	xPTsvvQMgS2M69H5kKx1M=
X-Google-Smtp-Source: AGHT+IEW/JCCnYUfohC04svq1AQiil7YODygR0wjxoh2pFcXTj+HXZK0vVaGOH+hp9MUqyCQEpo22w==
X-Received: by 2002:a05:6000:2405:b0:430:f7c9:94c3 with SMTP id ffacd0b85a97d-4324e4c9f36mr58959282f8f.25.1767553866406;
        Sun, 04 Jan 2026 11:11:06 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab2c4fsm96526078f8f.42.2026.01.04.11.11.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 11:11:05 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][PATCH] nginx: set CVE_PRODUCT
Date: Sun,  4 Jan 2026 20:11:04 +0100
Message-ID: <20260104191104.1134405-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Jan 2026 19:11:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123120

nginx has a long history, and has used multiple CPEs
over time. Set CVE_PRODUCT to reflect current and historic
vendor:product pairs.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-webserver/recipes-httpd/nginx/nginx.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index fe23eb397b..81919b9eb1 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -202,3 +202,5 @@ USERADD_PARAM:${PN} = " \
     --groups www-data \
     --shell ${base_sbindir}/nologin \
     --user-group ${NGINX_USER}"
+
+CVE_PRODUCT = "nginx:nginx f5:nginx_open_source f5:nginx"

