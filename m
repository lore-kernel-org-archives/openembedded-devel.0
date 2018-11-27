Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9CF4D6B507
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 07:46:38 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id w6so7471601pgl.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 23:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=JAfASQi4ZjUdP7qZasVr0I94f4997ZRZNYnpWh6vLWs=;
	b=J59KWY8AMZ60IQRymPGQqWclC1ztYsQu07/3GhHd+Mi2Num97IE9xTM5cLwI2RaTXO
	XRtzoyanXVrP7Vc+hZLwZqe1kXJNySib/LCe53HiRxkXB4KJPaHHj5U7CmryRU7nbRmg
	dkZDDK38ufF3NoEFm+NN15o4UmZL+TqQ4EYabK5bdemYPcITMRd3zsRENHX3Z3x4nbjY
	kpzVaW6xy/Y92hU8Qz+asPEmj9hC0UjmiL6PdLAGDcpFW+di/klZlilLPIImantdyvW2
	xk+ajPvD3u5/JmNrFpOBqdcokqYLkI38sGw7CA6GpE7xQbceNljLDjeGrWSk2OcbAJsS
	0n5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JAfASQi4ZjUdP7qZasVr0I94f4997ZRZNYnpWh6vLWs=;
	b=p1kYO1X+r1g4RbJKVoUxEuY7IFGGs35dbHQqJpr1BYloudxnWmt/uZVEPmtcMyRiZs
	rjxuDgc6DIgVEAVLdp5UqRrQPbilxH26/atv1oPYcQRL3WWNQn9BXinWhsR4WTBI7uKs
	LaI7iG2O/FK+3JlLFbvWL0N3n6Rc3ersdB0IMbE5jF1WFfHht0m98sJ7muzloeWhiL6o
	J+8z5DtU6ZgH4cd46GoTKQo5U5+d36BIFFM6uO6m7gSCLLcIeKRHYunbM2VsXBRMNGNJ
	cS/9DyWytduzEpZ2R+AWBTro1UPqoO/iJbHrVvIP4ikHJgXKlG3nBMsaEWZO+6Df5fpU
	jCMA==
X-Gm-Message-State: AA+aEWYkyMw52PbNqyGcqNDXMgy+OoNDvKC68THSFyc3eBnqtf3W5tSy
	u2ly8HUVnZ7c45EF5RNAk5fIHVmlucA=
X-Google-Smtp-Source: AFSGD/V1DNH/NOU3W85eHNC39Gx52kv4m1xE+2jIWldkyHJ9XE8NGx1ZhtgUL5l8awtq5JBQiONj5A==
X-Received: by 2002:a63:24c2:: with SMTP id
	k185mr27475659pgk.406.1543304799370; 
	Mon, 26 Nov 2018 23:46:39 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::26ab])
	by smtp.gmail.com with ESMTPSA id
	l63-v6sm3339036pfb.75.2018.11.26.23.46.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Nov 2018 23:46:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Nov 2018 23:46:29 -0800
Message-Id: <20181127074629.23966-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181127074629.23966-1-raj.khem@gmail.com>
References: <20181127074629.23966-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 2/2] rygel: Upgrade to 0.37.0
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
X-List-Received-Date: Tue, 27 Nov 2018 07:46:38 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../rygel/{rygel_0.34.0.bb => rygel_0.37.0.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-connectivity/rygel/{rygel_0.34.0.bb => rygel_0.37.0.bb} (95%)

diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb b/meta-multimedia/recipes-connectivity/rygel/rygel_0.37.0.bb
similarity index 95%
rename from meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb
rename to meta-multimedia/recipes-connectivity/rygel/rygel_0.37.0.bb
index 21331ffcb0..4869d866f2 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.37.0.bb
@@ -13,8 +13,8 @@ RDEPENDS_${PN} = "gstreamer1.0-plugins-base-playback shared-mime-info"
 RRECOMMENDS_${PN} = "rygel-plugin-media-export"
 
 GNOME_COMPRESS_TYPE = "xz"
-SRC_URI[archive.md5sum] = "7d8923324b280cd5452803d61176a34a"
-SRC_URI[archive.sha256sum] = "fbb2d46cbe4e750df6610b4c66b2278f06d1f71a257c7903e676ccb394dad418"
+SRC_URI[archive.md5sum] = "f897167ad82e2e741582f2c393a76843"
+SRC_URI[archive.sha256sum] = "dfd3d885da3ac383ba0cfbf119995f4a0c2bca2cc8f8cfcd3df10cfec8f35cd7"
 
 inherit gnomebase vala gobject-introspection gettext systemd
 
-- 
2.19.2


