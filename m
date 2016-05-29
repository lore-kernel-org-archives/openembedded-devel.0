Return-Path: <net147@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 63BE5763F0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2016 10:43:40 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id x1so1828445pav.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2016 03:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=030RfYNOG0RQwldKBWIumPf5G2smUsnPpIhnyh1VriA=;
	b=QAfmFdB2gQybfHquN4zOiX5gA2xe/6v1SjExNKvECVQ74bFdDS+9YfiHWpArNyMYhb
	INtLjj2lSolsdyRDJAekcCe3FGvbHH8j2v2KqpNNQFo3nAnYn2x6rNKjEVx4a/6KNdsY
	JvTzCCIB0a+2wrTecy8a+M93qOUGvuA+VWa0Iv9rM9kBqBOxXkKePq7W2zycMj/uqJwg
	17f/WfISM/SovSiV/0+DxNC4H3oKOk9g5dU9Nh0BdE+XYXaddPjJe0TZp8ww95+rgezv
	Axn7OcApy0bBqjX6XyPs3wrDPGIFxURQU+Nx6qEfKofVTBgrMfWCxhLsm7fq/u94ym+W
	pNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=030RfYNOG0RQwldKBWIumPf5G2smUsnPpIhnyh1VriA=;
	b=Uliwm9Ys2t7LqSFFMsHcRo2kOBLBoZNitU0rPeczmxREIdAcrtHQSR31pvfjGMe/fv
	+ox1YOSTp/HQo1nox36FYkNAuKnFtRLL5lOhjOibzEtsCNjd2/S9U792UTFFFl8jeSe0
	m0MRYI3OP0ouv44BTi5LDdtAg+hb0b2nKcHmluc3CyKPEUuc92727JgsfHvtWpIb74Q6
	E9TsFIx4VzD/UaxuYeoCN6XDnJ1FUssDf61Y9HHZ08UMYvWveVg+fzno87WkLa8NPhBs
	31ePWJOmWeHxR7e/TSWarwzQ0zqrBfVRA6Nr6qxsWPeDt1VeVN+5ThacPaEULv4nnFcr
	ruBA==
X-Gm-Message-State: ALyK8tJOJlOJ3/otEVoydMV0Ht8n6vMfGnA78SyC3+6MufQKQb48L77FEOyDgLyibSr5OA==
X-Received: by 10.66.191.100 with SMTP id gx4mr37942600pac.128.1464518621234; 
	Sun, 29 May 2016 03:43:41 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	t77sm25411006pfa.71.2016.05.29.03.43.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 May 2016 03:43:40 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 May 2016 20:44:23 +1000
Message-Id: <1464518663-6100-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.8.0
Subject: [meta-networking][PATCH] libtalloc: add missing libaio dependency
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
X-List-Received-Date: Sun, 29 May 2016 10:43:42 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-networking/recipes-support/libtalloc/libtalloc_2.1.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.1.6.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.6.bb
index 8937311..b9192b0 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.1.6.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://talloc.samba.org"
 SECTION = "libs"
 LICENSE = "LGPL-3.0+ & GPL-3.0+"
 
-DEPENDS += "libbsd"
+DEPENDS += "libaio libbsd"
 
 SRC_URI = "http://samba.org/ftp/talloc/talloc-${PV}.tar.gz"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b \
-- 
2.8.0


