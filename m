Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id F077F74A0E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 May 2018 19:00:30 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id f189so26071006pfa.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2018 12:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DlMh4NU0UVp7KYQV0NPr4MOwTvnrFnCaaeqMpGua8Dw=;
	b=kyMC4SVs3czndoE+ExmJJOGv5YHPFbSq0u/ooLyAkAIUaHEZBkdveohN7EzjmKAkge
	nLCmVUFBQIP7DP5fIPTm1AVNBgS6i3GYl6N+T6xo5meKnvvcK0G/12878+d6SWbH8JfV
	o/TnN+AmItbBD/DZA851WjOoW8xhNY50ROBQtFpfbqsjN/7yix/mGFg8hp+ayg/lobr0
	vwrVj/m1RLdntfi+OQhToZIv6R9yu0MWrPBgIwZs4Xh6AK7qEsCNVCov4Bc6XTUMc+TG
	TkaSXvL8InVZOhx/OCtlDwy6IwPx7vMT4464Hze5cw6lla380el3WguH4aWPjQDpWSYt
	qGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DlMh4NU0UVp7KYQV0NPr4MOwTvnrFnCaaeqMpGua8Dw=;
	b=QIOz/w2BQ5yZgs65Yke5dSPxIa5cXuJJj8cZvpPNKeBQ5wYs47noWANdho3eNWBGU1
	INtpaoUZmNqV7vnk4DWncsqkgb5AKVzSaL5KzE/Q4yDCS1zScOqECNkusD7E5Vaac0hz
	lquljWkU4iSdwUBP4OzD755vxLBNhBCP6t9pXV+TZImcgjMwp42Ud7ydKB2F4sjn9FGd
	T9XU+/NtoCysqORHR3YbVCqewAQIMrae+RjmTXP6kUwMNLY8V4jnsECldVEgqN6qxMHi
	5pCmkYHXJlZuvs7x6kulscZMEgQ+7QNGwTtIkylN0yUZIIIBEAejldLexaM63lORWjsk
	aA+Q==
X-Gm-Message-State: ALQs6tBLXnJ05O48zYft4uZWMiWdDoyUu9TlrIsbEqxLMh+39U0VFSkq
	zVdOY7xrP9FUh4R5Rp8Spjk6sQ==
X-Google-Smtp-Source: AB8JxZrkgPjVC6w44sHv+ffyiM5JbpfsMFB6fU8LTA2e11O1aa9bOsQOqQimWW4et1F5C3jvzd5Rmg==
X-Received: by 10.98.204.8 with SMTP id a8mr44707612pfg.219.1525892431596;
	Wed, 09 May 2018 12:00:31 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	131sm27732437pfa.128.2018.05.09.12.00.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 May 2018 12:00:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 May 2018 12:00:06 -0700
Message-Id: <20180509190011.30006-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509190011.30006-1-raj.khem@gmail.com>
References: <20180509190011.30006-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 11/16] geany-plugins: Add dependency on fribidi
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
X-List-Received-Date: Wed, 09 May 2018 19:00:31 -0000

Its needed by addons

Fixes

ld: cannot find -lfribidi
| collect2: error: ld returned 1 exit status
| make[3]: *** [Makefile:569: addons.la] Error 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/geany/geany-plugins_1.31.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_1.31.bb b/meta-oe/recipes-devtools/geany/geany-plugins_1.31.bb
index 3b5b7ce94e..d8f2f894bb 100644
--- a/meta-oe/recipes-devtools/geany/geany-plugins_1.31.bb
+++ b/meta-oe/recipes-devtools/geany/geany-plugins_1.31.bb
@@ -11,6 +11,7 @@ python () {
 }
 
 DEPENDS = " \
+    fribidi \
     geany \
     libxml2 \
     libsoup-2.4 \
-- 
2.17.0


