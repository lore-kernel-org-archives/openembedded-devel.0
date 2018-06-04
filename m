Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 203AB74B83
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jun 2018 02:39:44 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id g20-v6so937168plq.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jun 2018 19:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=HfUxk3zfQowBB+4nYj/pqKtXtFSEtgF7PoucgQ8atKw=;
	b=bPQx+fhrSpAKMyo2CSbw2aPtJVMg4HnuqPJwdpRcsn2QvELrNutBPoKsK7oSOHiFld
	9HyE9y4pDo97yWcxQJbNDUJrwE8EGlbeeqmALhK7muDPn8yYCiliLWHXULivvfXi9Gxm
	FPXu4UR8jkdGmXQJ4a7OHufKTQdlT2b6iLn3k+pvNZXqfyDp4Q4Th8SuGOkzXNxyZlo/
	9Eb+OHYOYDJ9ae003HNWCmdiazp9pr9BgB/cGe6Zgyap2E2W3BnEnB494bF1rVMdhAD7
	KpJcHiVfTDstY9QHL8FzZtxG68BuXsab9ODYvdFveIzR3JlXskfxM/rCT3arVPlH50Eg
	imVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=HfUxk3zfQowBB+4nYj/pqKtXtFSEtgF7PoucgQ8atKw=;
	b=EZCGCzsNUWHg+5O1HG6Di6P4ev+VBAfyNV4KVP0eIktVSMr+tIaoxXtLWTGyyMOeQ4
	7uvIJDKIipJwzxZiwdCooGEs7zJ+pdR/Mx0aqeP3mayfCHw0NanHNI8SxiPt7kKu327S
	UFMf5hiyByOqSxu+w8CfbHVYBW0Ga+jrpTb7M1SAQn2UtHNqtc37cNvsgGrzgiznT46+
	fmwR1+jiuxiESBh9J0FzTquCkZmvYrlMcdGiY4+LaQ9Ir85DGeqU6i+8+ITupiW+WpVL
	kdTi7X0vSfhHIIF3ckJlaORIWsjD11XPIiQ1nxKF6cfOQozQCLPKDWBmgeDvRdw08gFz
	u3cQ==
X-Gm-Message-State: ALKqPwfT6Q2bviwcJn4ZvKVRq2pu4hhDBYwByAIg2iuHhEC8aTTuYv3S
	FLTuQ31l16452Sv4n8Fmj6y14A==
X-Google-Smtp-Source: ADUXVKIPKgH/JccN9XRKXO8LHdWqGaZFlRUQKVTPj0A6dCG7htN6YMnJyWc9+fpW/o0I2idi36pi+w==
X-Received: by 2002:a17:902:9b8f:: with SMTP id
	y15-v6mr20431924plp.187.1528079985436; 
	Sun, 03 Jun 2018 19:39:45 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:f1bd:c539:22b:bbf1])
	by smtp.gmail.com with ESMTPSA id
	m11-v6sm12069697pfk.42.2018.06.03.19.39.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Jun 2018 19:39:44 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sun,  3 Jun 2018 19:39:33 -0700
Message-Id: <fd2d083bc0ae64dd855860057540ed55b08704da.1528079821.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1528079821.git.akuster808@gmail.com>
References: <cover.1528079821.git.akuster808@gmail.com>
Subject: [PATCH 3/6] dnsmasq: update SRC_URI for versions 2.69 and earlier
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
X-List-Received-Date: Mon, 04 Jun 2018 02:39:44 -0000

From: Andre McCurdy <armccurdy@gmail.com>

Versions 2.16 to 2.69 have now also moved into the archives folder.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
(cherry picked from commit d338d219dfbcbbdd133c7d4364bc8a1b19835e0b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/dnsmasq/dnsmasq.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
index ef79c5f..4f4bbf1 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
@@ -6,8 +6,8 @@ LICENSE = "GPLv2 | GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://COPYING-v3;md5=d32239bcb673463ab874e80d47fae504"
 
-#at least versions 2.15 and prior are moved to the archive folder on the server
-SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getVar('PV').split('.')[1]) > 15]}dnsmasq-${PV}.tar.gz;name=dnsmasq-${PV} \
+#at least versions 2.69 and prior are moved to the archive folder on the server
+SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getVar('PV').split('.')[1]) > 69]}dnsmasq-${PV}.tar.gz;name=dnsmasq-${PV} \
            file://init \
            file://dnsmasq.conf \
            file://dnsmasq-resolvconf.service \
-- 
2.7.4


