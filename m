Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id F24BC7F4D0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 21:32:05 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id w10so5292269pgj.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 14:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=WN2W0zvfK0ed/oNWTX9QlAz5xQgn19Bc58ko+pSQ1ic=;
	b=SppUVGyeUEeLdru1awNINyNoQk0R6dBDwvaiZivvyBRREOiOlKneO5jY+ocexL/3ad
	YISGEO8AXGHPuJWhXoUfMBQOHlrmab9cCdNePKK5WFIuvc4fqvOAiqo7MlSrEpLUUqyx
	M7kEaV70ttnXRKJBx4YNNDbTTKMsE9onzl7xUelJoib27WnQwF6tBnlGmMqx63fIeI8L
	3wTirIBIfpzfmqoo8MAy1cy1yw7D6Rg+0Je2SPvV4MzBYtH/MF1k2pI+R7cUH8eSOX1J
	rRf6bDxbN5bWKYhvLIN1uQh4kJKbOqySsn0bmSegac+w5nxOq4RgHHVKCNe8pIwf1sJa
	tGZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=WN2W0zvfK0ed/oNWTX9QlAz5xQgn19Bc58ko+pSQ1ic=;
	b=atwbvlqnulIYL4FWAcFc1BftW6YAL5BRfwPmAhKYnGeNzQrt+VHyXOj68pmV3lob2l
	8l9HgG+u5jnAay0RUndrQtsauIsdd3ntP2yxsU8QULgVUICj+nrYYxtwkXqxdip61Dj9
	o+NLTIXJzoWUER2fjdTnLYnNkrMWW0tz3QF+PKiEvHY6DZHPodrCy3zgBGm3nQ1CD9d8
	FV30dMGGI9BTzOGKE7eIa0v3+Qneq+M0zsvqKNM8KonsHzfgwJ/kfMgIXtfJsDsvc0lw
	9GCLVxP6XgOL8uVxGM3nQM8+BXVHo8B3hFOFOoyfJkr3h7Hxsw88YsY1zYhhBwxRBXbH
	ZFWg==
X-Gm-Message-State: APjAAAVnPphzIWcg/JyCXbCw2pWxG566Q5MWSovOsSdZEz5NDoDiD+WC
	kHPp1N2EOTmG5R4huT37WryW9OYG
X-Google-Smtp-Source: APXvYqzyMQ6w3lnrbaqF9/7neZ8Xv8r7GWAlTbzBlfNWSS4OXC2jKwQm0ClW4/VGojMkkRbZsU66wQ==
X-Received: by 2002:a17:90a:2182:: with SMTP id
	q2mr5863854pjc.56.1567287126881; 
	Sat, 31 Aug 2019 14:32:06 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8107:6109:754a:f033])
	by smtp.gmail.com with ESMTPSA id
	a18sm8060827pgl.44.2019.08.31.14.32.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 31 Aug 2019 14:32:06 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Aug 2019 14:31:42 -0700
Message-Id: <176974498a1db96579b313f3f015b58a1ae10376.1567286967.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567286967.git.akuster808@gmail.com>
References: <cover.1567286967.git.akuster808@gmail.com>
Subject: [warrior 21/23] libgit2: Upgrade 0.27.8 -> 0.27.9
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
X-List-Received-Date: Sat, 31 Aug 2019 21:32:06 -0000

From: Adrian Bunk <bunk@stusta.de>

This is a security release on the 0.27 branch.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/libgit2/{libgit2_0.27.8.bb => libgit2_0.27.9.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/libgit2/{libgit2_0.27.8.bb => libgit2_0.27.9.bb} (90%)

diff --git a/meta-oe/recipes-support/libgit2/libgit2_0.27.8.bb b/meta-oe/recipes-support/libgit2/libgit2_0.27.9.bb
similarity index 90%
rename from meta-oe/recipes-support/libgit2/libgit2_0.27.8.bb
rename to meta-oe/recipes-support/libgit2/libgit2_0.27.9.bb
index a434089..3ef7bee 100644
--- a/meta-oe/recipes-support/libgit2/libgit2_0.27.8.bb
+++ b/meta-oe/recipes-support/libgit2/libgit2_0.27.9.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3f2cd5d3cccd71d62066ba619614592b"
 DEPENDS = "curl openssl zlib libssh2 libgcrypt"
 
 SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v0.27"
-#v0.27.8
-SRCREV = "2882803ca2b2cdedd069746422155a23fdd002b2"
+SRCREV = "3828d7afdd08b595584048e8e4dab6ddd4506ed1"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


