Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7758F60079
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Dec 2018 16:50:48 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id g189so11940049pgc.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Dec 2018 08:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=dz14GtTaDn8XqCj71eAdwl71AwZ0isThJl15OBcAS7U=;
	b=cfZos1j2RA7n63uKIPJU23FaVRk1+ymFyH7crYPC5fCrAQZBGlAELGw+RtUp5U1dcD
	Be7oy8DhyHnaY5zfwf8BXMRMApBDoIL5VI//1nHezggsUxmHfzuYhoI+8WwXK3lkmnIS
	LaKtq1NMf5ln9VxxtS31ys5D92y9vAPesZNBlrHFVsI4MFd7JT5gEJXtAHT6O4dDvn4i
	5ybsq75tY6EweEkdejNquZ977MlhzWRRe2OlslxCRCEu3tWz9WoySOG4wUY/AxZ0278N
	7NYpJmeYxCurHMzjsQNRtO3Qy/ZNcF0SzafYf2JAbmfy+JHB4PBbP4i8FFmO+nb7OMbC
	Hcnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dz14GtTaDn8XqCj71eAdwl71AwZ0isThJl15OBcAS7U=;
	b=SYDYSgx0+JUb646LMUdFfgIIw7OMW+0cLGKzZIAwlLvv+2kxu5d0sPmcMGmDid6rdE
	I+eOY0l3fA65X19OLfu1KuMWIe/0lvKI1SjzM6deLJPtbQUdhkkXLbKti/fJfokhzotb
	r5r6dPZgH7h4mkDmiYg174n83qeZjl9uLS05xlXA/mMcIpYVK1tLjErvCOodt0A1kXdB
	Lmw3GAN4T/0EbkJpAm3q/Tap2Ch+DnSqjuwukUidLbRMXYjEXqv9KwCAuXe9cgW4bGSO
	Z0sdLrwlBaX5vY3Towp12bFBJPyMxKDJKv2NPNDbqaW/Wp0DJVCI2/Rc4q7OCkKUHABD
	bfEw==
X-Gm-Message-State: AJcUukdO4puZisKplwZlheYXFwdHnSkoE0zK010j6uGEgagpWOe4ZJAv
	15uKqL6WcYLnRRpJiCcrpfxbsw6etXU=
X-Google-Smtp-Source: ALg8bN4QUTF7Z+SfVwQ5jrGxHNx+n3MOmqzalVkLCnQheZ+oiLGdzEy5GZnSDCrnTW+4P2kz1v8TWA==
X-Received: by 2002:a63:e915:: with SMTP id i21mr4875980pgh.409.1546188649264; 
	Sun, 30 Dec 2018 08:50:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::9c8c])
	by smtp.gmail.com with ESMTPSA id
	w5sm59111465pfn.89.2018.12.30.08.50.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 30 Dec 2018 08:50:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Dec 2018 08:50:32 -0800
Message-Id: <20181230165033.8850-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181230165033.8850-1-raj.khem@gmail.com>
References: <20181230165033.8850-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/3] tinymembench: Update to tip of master
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
X-List-Received-Date: Sun, 30 Dec 2018 16:50:48 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
index 8cb59da737..842644b8a1 100644
--- a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
+++ b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://main.c;endline=22;md5=879b9bbb60851454885b5fa47eb6b34
 
 PV = "0.4.0+git${SRCPV}"
 
-SRCREV = "2c789849709d837b4bd114c11ed2d9bdc65afbc6"
+SRCREV = "a2cf6d7e382e3aea1eb39173174d9fa28cad15f3"
 SRC_URI = "git://github.com/ssvb/tinymembench.git"
 
 S = "${WORKDIR}/git"
-- 
2.20.1


