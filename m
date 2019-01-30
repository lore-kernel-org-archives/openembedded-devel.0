Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id BA43C6C4A5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2019 21:35:20 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id y185so605229wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2019 13:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=a0sK23Cf0+jV3arvVLuI1ujPmrM7wVGjyi+DsfqFQAI=;
	b=mjT99rGGhtSuyZ388MTcxaSu9O4NPlIKb5KzgVHRnujDQE1mw8oI2ho+P/LPrsRLb1
	VJSZ46WJ0TEtkYZgslPsPWPxLS38fumEydyBiAIaC2brEl8Bp+gvFLuuMDzsIfJQGxax
	Ml2L9tDsacp/cbnermPuxY0gm22YIrvSmXMt7x2F8fzV6uLU91gfcCPTjEQyHxu0gjpo
	Asj8KQHMUaVFqCiQvSa2CwwhT50APTeAvdHxapVYTRHpc6621ROcv1+6P+w8F9YZDzgc
	bERzm4573qs2W2Wooz2GInYUR95dyO1g2LgyJREhM9OQEfWvzM81+pJohTcZ99FQgzG1
	xn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=a0sK23Cf0+jV3arvVLuI1ujPmrM7wVGjyi+DsfqFQAI=;
	b=DbhZd/gH1mgXxtZV0Fzf45OzBgzrGOfC3/943MJZVil0pee1QSXMCwZ9yBseWox96j
	dnhS10R3uzF9KdNqaukdQDEiTrbQD4NtZOnBz3VSNJbNVjesb5S62DriLgdDfTpspu9N
	VA9fWZxaG5L7/lg+L6Su2BAesOlz6knLDW0mAhTO3flqaH/gcer3SNWLK+2FYe+rjj+D
	HZjL7o7DqreYZLImlO574k/eaT+QnbbAojwqDGDDQ4GPe2Ujkmieqh0ODn30pzdD4UIG
	9ZvD/mGqrcOwOjg0r9JTw48DXgwWcvGhswomfwSugyCYsIQAuHoVMqKDi9iNlLIwoKYp
	IHBA==
X-Gm-Message-State: AJcUukfdEmZ50gaz1k4sbmI52R9GMlS0cWyNvirKWFPyDTY5Tkj/sCNr
	VxZKpQfqBk8lgCznxF+YqSY3Ha46
X-Google-Smtp-Source: ALg8bN5lLQ5GEmCYJuekybFINgliokYZAFusHw1vdbKY5SKm8eq+J7FPOTpNeu1mmobuf4zpmYgX9Q==
X-Received: by 2002:a1c:e484:: with SMTP id
	b126mr25751148wmh.119.1548884121132; 
	Wed, 30 Jan 2019 13:35:21 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F017D32603632896313B27F.dip0.t-ipconnect.de.
	[2003:f0:7f01:7d32:6036:3289:6313:b27f])
	by smtp.gmail.com with ESMTPSA id
	z14sm1418054wrm.48.2019.01.30.13.35.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 30 Jan 2019 13:35:20 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Jan 2019 22:35:10 +0100
Message-Id: <20190130213510.18227-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190130213510.18227-1-schnitzeltony@gmail.com>
References: <20190130213510.18227-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libgit2: upgrade 0.27.4 -> 0.27.8
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
X-List-Received-Date: Wed, 30 Jan 2019 21:35:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libgit2/{libgit2_0.27.4.bb => libgit2_0.27.8.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libgit2/{libgit2_0.27.4.bb => libgit2_0.27.8.bb} (90%)

diff --git a/meta-oe/recipes-support/libgit2/libgit2_0.27.4.bb b/meta-oe/recipes-support/libgit2/libgit2_0.27.8.bb
similarity index 90%
rename from meta-oe/recipes-support/libgit2/libgit2_0.27.4.bb
rename to meta-oe/recipes-support/libgit2/libgit2_0.27.8.bb
index 816ae5e2e..a43408908 100644
--- a/meta-oe/recipes-support/libgit2/libgit2_0.27.4.bb
+++ b/meta-oe/recipes-support/libgit2/libgit2_0.27.8.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3f2cd5d3cccd71d62066ba619614592b"
 DEPENDS = "curl openssl zlib libssh2 libgcrypt"
 
 SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v0.27"
-#v0.27.5
-SRCREV = "8e0b172981a046d19f1d9efa5acd6186bccbd3ce"
+#v0.27.8
+SRCREV = "2882803ca2b2cdedd069746422155a23fdd002b2"
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1


