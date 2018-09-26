Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 749007553F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2018 12:18:25 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id j15-v6so22692223wrt.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2018 05:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=szxP4JmXpVb2uItWnp/bZkuA3uJ/q9wh+K6EO5BxdbA=;
	b=H79u8qAVJmo+RazHsQexyoIbQ9Z/e83laCBJaTCyWGqpfZwXFO4WnKsFvkd3ARPdid
	nI4dKEBLJzihERDrhFYehVDl3IRiwlR7q1jdd3pRm8xjYA4Tm+82sJ7LgPPhebrq9Jpk
	4GNkk8KlQ6YBBqkE2pkYR4GjAZfhVrsinyWTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=szxP4JmXpVb2uItWnp/bZkuA3uJ/q9wh+K6EO5BxdbA=;
	b=QkZTVqb35a1UTqxQ6VokDLvMAhShyYdP6Pva5ov/nYJWTqYFSI+zAtGqZIw7Ml2Tf8
	oKjRFeWupIvmt3JqZzK08OR3RZsbz4E0gQmREsLeNTfRkhAKPruBeozzXSIsniX8Vvbg
	0xBDIboBCh8ldLyhLbdPqfkkKCNtMMMyO+NH0tgJudWN6GVNM4G3LPyElIUY4fK8UQ1T
	OD/gIjoBkJ3XLRwKUxOrTp238yQk1rmldeo6UHYzkZ2YwJZzmN+DDEPm5lu2ubSKNL+/
	AOLEMCGwpNrKdCJbSX7D0yLbe/WqD3gm0jhRaNrrwcortm/mtoMq5h0yho6qo13xoNMH
	shEA==
X-Gm-Message-State: ABuFfoj4BMhsen2EV5nEB/hJeBfE7WRBQavUOsoszIpRt9cBtKsz3iOo
	InSd4vfDvjsyn9YmE71z17Cg2Q==
X-Google-Smtp-Source: ACcGV60MdapfDXxBSsfL0QD0Wkzj24IdDY6kHzbSPy1ytlS92evrHSxhp1l3dfeg3QDqu+gkppTFfg==
X-Received: by 2002:a5d:6782:: with SMTP id
	v2-v6mr4859031wru.245.1537964306030; 
	Wed, 26 Sep 2018 05:18:26 -0700 (PDT)
Received: from localhost.localdomain ([92.154.90.120])
	by smtp.gmail.com with ESMTPSA id
	z12-v6sm4247960wmf.23.2018.09.26.05.18.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Sep 2018 05:18:24 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed, 26 Sep 2018 14:18:04 +0200
Message-Id: <20180926121806.30667-2-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20180926121806.30667-1-nicolas.dechesne@linaro.org>
References: <20180926121806.30667-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-oe][sumo][PATCH 1/2] meta-multimedia: fixup LAYERDEPENDS
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
X-List-Received-Date: Wed, 26 Sep 2018 12:18:25 -0000
Content-Transfer-Encoding: 8bit

libebml depends on dos2unix classe since 26dafa0f3542 (libebml: inherit
dos2unix), so LAYERDEPENDS needs to be updated accordingly, otherwise we are
getting a ParseError:

ERROR: ParseError at
/srv/work/oe/meta-openembedded/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb:13:
Could not inherit file classes/dos2unix.bbclass

It was initially found with yocto-check-layer script.

In OE/master branch, the dos2unix class was moved to oe-core, so the problem
does not exist in master, and this patch is less invasive than cherry pick the
change from master (move dos2unix from meta-oe to oe-core).

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta-multimedia/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
index cfedf2f6b..a1dfed4e9 100644
--- a/meta-multimedia/conf/layer.conf
+++ b/meta-multimedia/conf/layer.conf
@@ -27,6 +27,6 @@ BBFILE_PRIORITY_multimedia-layer = "6"
 # cause compatibility issues with other layers
 LAYERVERSION_multimedia-layer = "1"
 
-LAYERDEPENDS_multimedia-layer = "core"
+LAYERDEPENDS_multimedia-layer = "core openembedded-layer"
 
 LAYERSERIES_COMPAT_multimedia-layer = "sumo"
-- 
2.18.0


