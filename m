Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6BAB56010B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2017 23:01:18 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id f63so34696442qke.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2017 15:01:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=k6AqHPek5JrICh4pLgOrOU4KvnvkGz3aAqvlAmg0IGE=;
	b=q6WsrozeRnK2pmFqD+akyr6Ak1JpLn5JArXRkJ8qn9ZmmfheOuHDURv5Hpaf8FLeYq
	gO2mwt5FxA/20x28GDs+k/aFmlnUU3QLads8w85vUmoUNGHhR8FQ0J62EUIDuUvTbiQ2
	/guy+vmJcLDDYRgAa4wnzl0IHTzL5ifFIAwRSB5z2kMpxSi3Zzr9/xHcdZO5c69ZrxgB
	FjzLbB8XAMuU9JdNx3Adz3IMp52dPnZXtvsTlF82Ms1ew99SxtZjcjbxZ4jvgP9C6yY/
	hAGREwL29/6Jcrm2JaSKPTh53f+bC9ueTEAfDAspfYLvHF2tICKbh+BrHodSHGS9E13r
	SfhQ==
X-Gm-Message-State: AJaThX64TBWOFvofbXO9FpBmxB4jFGCx9AxYrKGnislM9dPXDWJ4VW+5
	7Z2pT0hUYCLrJ8SYSvtGfXUWmxB3
X-Google-Smtp-Source: AGs4zMYbXNciZEvgBJw5YjyZura53+MoWfW3OGNZHdicoKOJp1LuPhDCaGTohFtWGaZM1g7q9MIRng==
X-Received: by 10.55.71.5 with SMTP id u5mr43003354qka.166.1511823679867;
	Mon, 27 Nov 2017 15:01:19 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	x1sm13652099qti.91.2017.11.27.15.01.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Nov 2017 15:01:19 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Nov 2017 18:01:11 -0500
Message-Id: <1511823671-8136-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] gd: update to version 2.2.5
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
X-List-Received-Date: Mon, 27 Nov 2017 23:01:19 -0000

Resolves the following security issues:
  * Double-free in gdImagePngPtr(). (CVE-2017-6362)
  * Buffer over-read into uninitialized memory. (CVE-2017-7890)

Full changelog: https://github.com/libgd/libgd/blob/gd-2.2.5/CHANGELOG.md

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-support/gd/{gd_2.2.4.bb => gd_2.2.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/gd/{gd_2.2.4.bb => gd_2.2.5.bb} (96%)

diff --git a/meta-oe/recipes-support/gd/gd_2.2.4.bb b/meta-oe/recipes-support/gd/gd_2.2.5.bb
similarity index 96%
rename from meta-oe/recipes-support/gd/gd_2.2.4.bb
rename to meta-oe/recipes-support/gd/gd_2.2.5.bb
index 4932bb7..63d9acf 100644
--- a/meta-oe/recipes-support/gd/gd_2.2.4.bb
+++ b/meta-oe/recipes-support/gd/gd_2.2.5.bb
@@ -16,7 +16,7 @@ DEPENDS = "freetype libpng jpeg zlib tiff"
 SRC_URI = "git://github.com/libgd/libgd.git;branch=GD-2.2 \
           "
 
-SRCREV = "de09874b15a4c88772db35ced842330f5de23e76"
+SRCREV = "8255231b68889597d04d451a72438ab92a405aba"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


