Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id E4A3674EE5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jun 2018 12:03:36 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id k6-v6so11161366wrp.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jun 2018 05:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=0bzJCW3BtKQN3ks5Jl9ito2uLKlCGTshMNwUoAEkomE=;
	b=A1TGimffAspfQgfX87aArVDgeLLmKS1q9DgPnlJsT1U70iryEJtuQq5VXpQwO0icsm
	Y8pstyzVYrllLwN1y/eFVBHZmrUkWlf0+OHQwNBV9ZDYywvVlGqsyrN2fdF9ZrdoPOQ8
	G5okSy7Iv0pA0xusliUiOB3eqqGCEHA7n2WeKL20Q2E+xVTqL43GUQjP/bP4GVoNIdUr
	DflZwv4YCAqwHDxKZKQtFeOO+tHv12WWKJmFqL8auDsvJ/CzPCP2ToNGtQ3k6csgYTdW
	B2rlsXAH4h66h+HFn6qX3YRlur1xeP0HdonitwVQnojCPO+OMwSsJfpji9RA/DotNaYC
	qojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0bzJCW3BtKQN3ks5Jl9ito2uLKlCGTshMNwUoAEkomE=;
	b=JiDgGnWMKSJDmJDwypFe6FHpudwVbKRWl2EWMTwAtn5104H31hqp8o11aYqSug8nJY
	Z8J41CF7LzvsYcI4FdiN/vq/Oekt4E9pF8YdOnjEOZe3xjuDKFudrVIM6CXHsdw4esuy
	VrIjOzwK68bQRiFnR6sb8H8L6P/VYlQtTGgF+xK9FNXZfX9ecG79+uYk+WfOuSUYWzm5
	lMRPio/t09ND2QJVCE6fssk712A4O9okXQ2W/Z+QnL6cpzeFO8q51c9U7hJ0g+HbBtQf
	cv+0hy8mzcfiOWRxz6MQWEpkVPZkkIOCe4XGNk41Pirwn+3DZvh2DTWnfcTvgH0TfXLi
	GfMw==
X-Gm-Message-State: APt69E1yvTfH5/IaKJP1HBEp2Ajwqy0TumXH9zrW5UnyPlxDzE/lFo87
	PZYM5GFnf0s3aQNOpwdsoOVbtQ==
X-Google-Smtp-Source: AAOMgpchcMff1SsDV8Dz1mXW3zVkxWdUJe8P3bfCOODRhHLfrqXGnVBCmqyrKpY8iG26ZA/iC1b8iQ==
X-Received: by 2002:adf:cd0e:: with SMTP id
	w14-v6mr5507404wrm.226.1530360217441; 
	Sat, 30 Jun 2018 05:03:37 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BD2A250E47512CF7CAE17AC.dip0.t-ipconnect.de.
	[2003:f0:7bd2:a250:e475:12cf:7cae:17ac])
	by smtp.gmail.com with ESMTPSA id
	p12-v6sm2096602wrn.31.2018.06.30.05.03.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 30 Jun 2018 05:03:36 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Jun 2018 14:03:14 +0200
Message-Id: <20180630120315.29414-11-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180630120315.29414-1-schnitzeltony@gmail.com>
References: <20180630120315.29414-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 10/11] packagegroup-xfce-extended: add blueman if bluetooth is in distro features
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
X-List-Received-Date: Sat, 30 Jun 2018 12:03:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index 2e0f7f5b4..b438c7fe5 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -56,6 +56,7 @@ RRECOMMENDS_${PN} = " \
     xfce4-verve-plugin \
     \
     xfce-polkit \
+    ${@bb.utils.contains("DISTRO_FEATURES", "bluetooth", "blueman", "", d)} \
     \
     thunar-media-tags-plugin \
     thunar-archive-plugin \
-- 
2.14.4


