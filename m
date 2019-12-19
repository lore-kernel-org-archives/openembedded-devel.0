Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id C00AA7D075
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2019 21:57:53 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id x8so3839475pgk.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2019 13:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tOWiDJulbF1erDUibJCIkFnw+IEymepOJiEjQUgXj6I=;
	b=iqX1GSuy4MGEbs/JuXur5gp/j+upQsjqJogc7QzoxHJkB5B3UasvYbkohErlq89MID
	1g5wugaUpW8oSzhft/8bHAWQRO6OUDWFoh/ZPUi01EjjsZrplr6FE6fh4MBSOKkiVIjX
	df46PiS4OmBtzbRNgdxpraCoswXl4/+mq7xvNfHZL1NGxzo6RG6g37rimO0R3iqwFCWT
	0Sa7kCBlhoKdYgvDLndznVawxjG7hBKWSu+bHUQ91tvw69NSIUJUGqYAJXVAY6opv4MF
	augfkeYPTiXkGe0yLZC3nAokoQiDuhtiDUrHG/8KwO8YoojuDJcpDArt1ZMDpeRY8YiN
	PMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tOWiDJulbF1erDUibJCIkFnw+IEymepOJiEjQUgXj6I=;
	b=q8+Nzwv6S8ae1pXkatrYHcuYd6d23dKKpV5mELLceZgSUcEghsvQHPOnsvgBJjU6nk
	vL4oN9yjQErMgbS3ZdJul4rQSC+P9rj9mKPZQyRMN5R3XC402UTCXMcYKBFVz2EXCw3y
	JNwmpjsC9NneIeMq/YNTcVTtiNRyXFfeaMt2orW2VVtR4/OLC3cAIctEx17TmeU6PfFu
	FIZDSQ4LpWm8BuO60cRe1gXV9DoV3pQfZIE+4dRfaQtI9gkiZnZhDqsedTo1UL18jWA2
	WAQt4sBPD1eRMIyV8ysOMy3B3Ndcz4F24RVtXfivtSM7hrWcbuzbwcLINpNQD0tYoiOL
	2RVg==
X-Gm-Message-State: APjAAAVPebBOnzl6Wri8wqvvFgxiVYVGE3Z3iVMxMpODx1FUVOL37xUT
	BRYaYxqfK5Q/e6FyqNLKrwzgipQd8D0=
X-Google-Smtp-Source: APXvYqwc/1foMssy+CHfO+1lbW+xbfQkZ4GFSjlwv2vtgXbTYhlmEKnfOPS0RJ5zY8ecx5czCvuwkw==
X-Received: by 2002:a63:7985:: with SMTP id
	u127mr11090546pgc.169.1576792674328; 
	Thu, 19 Dec 2019 13:57:54 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4b])
	by smtp.gmail.com with ESMTPSA id
	w11sm4196191pfi.77.2019.12.19.13.57.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 13:57:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Dec 2019 13:57:46 -0800
Message-Id: <20191219215746.2317472-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mpv: Remove luajit dependency for ppc64
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
X-List-Received-Date: Thu, 19 Dec 2019 21:57:53 -0000
Content-Transfer-Encoding: 8bit

luajit is not available on ppc64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb
index 1ba9f0f6c8..29bcfe49f5 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb
@@ -29,6 +29,8 @@ inherit waf pkgconfig pythonnative features_check
 LUA ?= "lua"
 LUA_mips64  = ""
 LUA_aarch64  = ""
+LUA_powerpc64  = ""
+
 # Note: both lua and libass are required to get on-screen-display (controls)
 PACKAGECONFIG ??= " \
     ${LUA} \
-- 
2.24.1


