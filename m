Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id C859978766
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jun 2018 13:52:29 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id c23-v6so6182430plz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jun 2018 06:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=UD9AgQNAminBfty+50T4gvmkRu9nsbD1qjOSs7cYFKU=;
	b=cf3l3uLVfjkWBJW12foWb7RXkgckvR7NccfeeSkhLs9A4WgWzOVc4TknJsEgr8yYLP
	leEC/Ebt7t/H0WEN2N9jcTZeqqwdjK3r+rDuLV0wbNIyOL7wxwY97LPtv/6rnGUmws+u
	EsbTwb8hqQZ9TLkjlUHT1Ed/8fihQgdjtx99+LiHGgKvQ0dgz1QFBWOc+G+JZZCFjWmF
	G9K1HYbN/95jdtOFoZo7LXi/F0JAu1Xyz+UO7ZPY10by2cjqS7iiaBLgEMHz8X1pH6t9
	0na8J1FEnRBWZYp/R9rMIPu0/A7QraW+7yPsCmeSuESHmg4mmIHL3qunKLJCib4QJMPU
	DFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=UD9AgQNAminBfty+50T4gvmkRu9nsbD1qjOSs7cYFKU=;
	b=aHtzjdzf90iPI+Nq62oxcnL0UWU7VB02p4BvP7TAVwTdQ6z4UDAf05xTWX8jU8QGnn
	1nETszDx6iCgZfmrW0MYzFsHMiWrRQeepLN4jwghncXtIvYPSSCvTW3foLbxMVDsTqOb
	gOq4VPItm+FHvMN7ZUGnzr97MmB2vWP8xB0at2Dg0bRlPIgF530cwgVSHstYxY883rhM
	OotarSwDFYilgNz7u8pV8aPoHtAIPTXir4+3vK5El7qBJC7LJSQWI+vY9yXE5piRX0Zw
	FDnD3vU1ndxgnQixWHh7HABlykbovXFzP3yGZY290k8/Aoxx2ds6VMSPaqqaSVx/V+S8
	4KYQ==
X-Gm-Message-State: APt69E06U5gDprF/mdi/+BeiqnNjNLXQ0TQI2JHtGTNfBlV+4F4HIPS/
	WqDekuMOEEu8cojVTxUaQwU=
X-Google-Smtp-Source: ADUXVKKYO+23LLHk0/c4p62TLQLCHZ7OIcTGP7pO6R2yZtRKlh4G/p2SUtUC9/pdJvd/YUhre0aO7g==
X-Received: by 2002:a17:902:1ea:: with SMTP id
	b97-v6mr2193178plb.58.1528379550954; 
	Thu, 07 Jun 2018 06:52:30 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:143:7168:4d6f:f251])
	by smtp.gmail.com with ESMTPSA id
	t21-v6sm18675481pfi.22.2018.06.07.06.52.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jun 2018 06:52:30 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gamil.com,
	openembedded-devel@lists.openembedded.org
Date: Thu,  7 Jun 2018 06:52:18 -0700
Message-Id: <25d7d4bd5775f02f7064f1fa7fe659159aaab305.1528379391.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1528379391.git.akuster808@gmail.com>
References: <cover.1528379391.git.akuster808@gmail.com>
Subject: [PATCH 3/4] python3-asn1crypto: add support for Python 3
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
X-List-Received-Date: Thu, 07 Jun 2018 13:52:30 -0000

From: Ricardo Salveti <ricardo@opensourcefoundries.com>

python-asn1crypto.inc already available and used by the Python 2
version.

Signed-off-by: Ricardo Salveti <ricardo@opensourcefoundries.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-asn1crypto_0.23.0.bb | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-asn1crypto_0.23.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-asn1crypto_0.23.0.bb b/meta-python/recipes-devtools/python/python3-asn1crypto_0.23.0.bb
new file mode 100644
index 0000000..30f3404
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-asn1crypto_0.23.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-asn1crypto.inc
-- 
2.7.4


