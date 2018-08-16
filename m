Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id A914279267
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 18:28:00 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id j5-v6so4983403wrr.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 11:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=unbQKxgN04zk2UBm+yG4Ta5tdezK+VtBIx+MtyVFJ9o=;
	b=CTfxwL5aHzPwVHP/Oo3yMT5WHpm5WI/vn7VL12QL3bNylyyavbWgCvdrhfUpvfnIv4
	my05iabqDxY6K7UllWAwgrABUowY+3RZtcO9hs3a95GkcSB15xE16IWZHbAVVUu2wmVu
	iLjEIlfUOxKhMdqpGfozpUBGfea+9MWQ8HdF2PYWlQ0mR1zZ4L07GMg4D6HGOhfQamVg
	sjzSqm7uAOvtSVj7mmgh9k5JuApDvQYZYRDTc7+FZ352ZS31/Zmp/EnhHjNnEUvgmf3k
	eDMfF5rlRIMOwp9L3T9ie9O4BH2hi7QC7CaWBym74a2pAaOAhTW8jgjpMcQgFzVR/pW3
	Ap6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=unbQKxgN04zk2UBm+yG4Ta5tdezK+VtBIx+MtyVFJ9o=;
	b=eJFgyEGz3F53pFqOmmISLeYidDOMm12nitwTCdbXcZNh/JA2uEDH4I7st6liV63ikM
	H3B8FXjUk8V1hBFlna6YFKzn4ety/3r9PrqZLbwCD1Bkqoulh1P1aJsT5CL42TdkIfgH
	72+w1kJ0TomMIChxY5JfTWuzEeRpYq0sZh+x//MzgJq8yew7ypLeXhwPsAl1689rz4M2
	l27A5BxYuS/UH+hJA6A3CcKwkqMWgzw5q6hLtXWvv75yhCdaTQXby5cUljcOjp1dEcNu
	plh9Bi87av5PXhODZm5yQvbLHYLVSfP+VXEusMb9BRArVXci7SVAYqWcEkQD4ashBgHX
	tzOQ==
X-Gm-Message-State: AOUpUlEevMLSd+hVrD8qBaZMVREYJME1t+ChBj9oizltgXL7t9HnyWSv
	qFpVmtKFLyBUkM0/UPFgJqC4mb+G
X-Google-Smtp-Source: AA+uWPxjndj9UpB2QnjUc4ukP7+iH0Ryt6vhwdEvDKTa0nUYNiNBop2nJBwQCJRi52t6aAi2K/P0mQ==
X-Received: by 2002:adf:b456:: with SMTP id
	v22-v6mr19669360wrd.187.1534444080873; 
	Thu, 16 Aug 2018 11:28:00 -0700 (PDT)
Received: from localhost.localdomain
	(p200300F07BC4D1601E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc4:d160:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	g10-v6sm26040224wrv.90.2018.08.16.11.27.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Aug 2018 11:28:00 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Aug 2018 20:27:37 +0200
Message-Id: <20180816182748.2400-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180816182748.2400-1-schnitzeltony@gmail.com>
References: <20180816182748.2400-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 05/16] poppler: upgrade 0.66.0 -> 0.67.0
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
X-List-Received-Date: Thu, 16 Aug 2018 18:28:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-support/poppler/{poppler_0.66.0.bb => poppler_0.67.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler_0.66.0.bb => poppler_0.67.0.bb} (94%)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.66.0.bb b/meta-oe/recipes-support/poppler/poppler_0.67.0.bb
similarity index 94%
rename from meta-oe/recipes-support/poppler/poppler_0.66.0.bb
rename to meta-oe/recipes-support/poppler/poppler_0.67.0.bb
index a50c201c5..210c87112 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.66.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.67.0.bb
@@ -8,8 +8,8 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-glib-CMakeLists.txt-Add-libpoppler-to-link-along-wit.patch \
            file://basename-include.patch \
            "
-SRC_URI[md5sum] = "6602813e52f02f85f11ba1590e0ef749"
-SRC_URI[sha256sum] = "2c096431adfb74bc2f53be466889b7646e1b599f28fa036094f3f7235cc9eae7"
+SRC_URI[md5sum] = "bcfbdcaca2a1f72435e4aaa3c06664ca"
+SRC_URI[sha256sum] = "a34a4f1a0f5b610c584c65824e92e3ba3e08a89d8ab4622aee11b8ceea5366f9"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.14.4


