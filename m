Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05C9FC5DF74
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:02:09 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2329.1787029324206996305
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fkaIBwob;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso5020785a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 22:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787029323; x=1787634123; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aOY98DEjI+qTVvUH7fsBLvjzMN46lZKpTf41FWxINhM=;
        b=fkaIBwobvyaMpv26HZYGSNr4Od3NH2qWG+fkEw1jBIuRc6MIJefP0GZpFb5nV37ZZt
         Y1fIO9diwNX+X1MAc2F+dBvMKzavre0AzxW90aPKQKXsBupH6Mse6PcsoWjvLH/HOHkD
         lZEOaa+XtpQp3zMYJbIvHV8ExwPNVyQFywKG2aRJDAkE1dSoUAp74Pn8OyEtR03xTS+h
         mPaJxr/te9ghPnJSWTRox/uIQ5JsUiJuBbKZ4D/Es5KEsbgfyAvj+hNQEv2ayDyq55ly
         o9HeRJ7yHFfG0sINoIuHP06wtMjWBhownM8LzUJdWeE7mRFt7EHE27KZ/SZHypj0JXh+
         pJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787029323; x=1787634123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aOY98DEjI+qTVvUH7fsBLvjzMN46lZKpTf41FWxINhM=;
        b=PKOgHx2sHVmJqHLSm1OSQJmf0qtjjxu00Mez01HGBdDfbJxN6j860uJDmxsI2kBEM+
         wWPAt7IGSS+dYHn5skURybHG9iXf4/DvSnHZrj1E6+EcKSsQ/vO4tL7YSSWIE+/EHYnM
         IIR0X1xrdmtfpEy88DCdVwaRtvSMcT0A3DskHBgAiYFZ2At8kX58OX4zbU04aroXw6gn
         +MYG30Lhx8w0qBBpbHqbOJ7BUI1kEmJutGKuG32eOvh2nga5XcrDYXOeUL2hmEX/4r8n
         gL7jMRlH9r1ZtHF4qXlM25OFaX0zzVenAkU/74evDqfF4ARfPgFec8TmJccMzvpRrLI2
         yCNA==
X-Gm-Message-State: AOJu0YwCDW+xJIoNnt797AWqN2Uk6HI6b80fVKsiVTirULUybIT1L6Jv
	ksL1OKHYSZPijHgdfQt69c6bLHcz1IPQjEkkjqR887pZ2GVbYvujXM5u4b+frQ8E
X-Gm-Gg: AR+sD10QY0V7iHM59w5iirDSB2UffambJAKqsllqLNJwzHyzpavIDsdpZyZlrEe4pES
	gfkRcrVAKdVAYrjSoVGEnEAs1lbnGH8Hai1yHj7/T9aXmk9TrLGCr/pPXQQ5And3o94IO8j7Hdv
	dsiAMJ18SyTDMmfZJp6oZPTWKOXoexzylBUpNLZ8AFvp3SmdSB5L31rhTTrP3C8zBXplpQmnRRw
	iAf98d2IVnPbDwDgdzajgq3ZFWtyPpY4CeSqcO9BZYWXuEavjz2yry+3gvtkmz0ezwmjkmLHMEo
	ygtp/evnKCX3/2MyYr8MZj8a204zvBLCLz/snzVU5fqZMAjiu6teGsnfwloESXxR/PgDwbKPqzD
	JkClHTEglLiykOo2zXL2mFy7DHsiKp7ifVR0N5eKjbcfBDvzO1zFzNybduXT7H0xxy0HbQy79DR
	aW749KGX6e/aQPm0lv1UlT+HQpgZVqvyLy0rHn9WhUpn6ZfYuyqPRjJenjfkA1Pz8bhFjxkICtH
	w==
X-Received: by 2002:a17:90b:2587:b0:38e:9045:bac0 with SMTP id 98e67ed59e1d1-3933b741419mr32086795a91.5.1787029323541;
        Mon, 17 Aug 2026 22:02:03 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267be8e5c8sm12840095eec.16.2026.08.17.22.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 22:02:02 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 10/27] firewalld: upgrade 2.2.1 -> 2.5.1
Date: Tue, 18 Aug 2026 17:01:05 +1200
Message-ID: <20260818050123.2901739-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
References: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 05:02:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129209

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also add UPSTREAM_CHECK variables to check for new releases.
Fixes:
$ devtool latest-version firewalld
...
INFO: Current version: 2.2.1
INFO: Latest version:

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../firewalld/{firewalld_2.2.1.bb => firewalld_2.5.1.bb}     | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/{firewalld_2.2.1.bb => firewalld_2.5.1.bb} (97%)

diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_2.2.1.bb b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_2.5.1.bb
similarity index 97%
rename from meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_2.2.1.bb
rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_2.5.1.bb
index 0c670a2caa..7ccbe7d739 100644
--- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_2.2.1.bb
+++ b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_2.5.1.bb
@@ -10,7 +10,10 @@ SRC_URI = "\
     file://firewalld.init \
     file://run-ptest \
 "
-SRC_URI[sha256sum] = "5215ba30236ee1e3df2c2292465a9ff605b9c445dcab2e37da4961cb27c7f36e"
+SRC_URI[sha256sum] = "50fd01cf0b696a1cb7ca722e972d6173b0c5aa6ab13892b00842ae52172b081e"
+
+UPSTREAM_CHECK_URI = "https://github.com/firewalld/firewalld/tags"
+UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 
 # glib-2.0-native is needed for GSETTINGS_RULES autoconf macro from gsettings.m4
 DEPENDS = "intltool-native glib-2.0-native nftables"

