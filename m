Return-Path: <bill.randle@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7E037785A6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Dec 2017 05:46:35 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id v26so6514076pfl.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Dec 2017 21:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WvHVRvYNf1dSUUnbBTOnkw7cP47K9ot2dHjCYcILjJk=;
	b=kv7GJO9ut4v14+e3VU4Y51E8WQr4n3/OfKsb73Km6NTDy3XyJ/+XYFvwYq1DmnE5Jt
	yTG4d5xD5Q3DtD1vxf40xxK8red8Y1CdAXAN9XIjtNRFxMAYqZkUfQkNSL5CIf9Cv/f0
	/kMP3BUV6qt+lWaJIaj4k7OLf8jXcqBTzkwnP5DQoY3uqiRvd8ob1C5XyKUvJGJQNGsI
	0V1sOvuXItdOTE6ar0pu+i12JFyXqBtwnKldFXYSwWUOl80288eJ7kcHDLsXG1BWoXQc
	ZVijLUJNyCl8yyNClj9Iv2jYbWuSgLePCr3TvdQmu0j7QSjOhnL6kDTT8hNp+I+g/d/0
	4teg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WvHVRvYNf1dSUUnbBTOnkw7cP47K9ot2dHjCYcILjJk=;
	b=rHCJ2aBm/zUupXVVFF9G4gqRYAuBb+gYjBJS2wutviQLHFnWBrpz4q/aHTh1KwC0Hu
	F5hBSgGgfvqGYlCUfUAgqP4DQdQ4rZHFFzPr6NV4PEsdvjzJS9RdnU/7usMVLKSn68FY
	hZ1VfnVzZ91ftTPdAQrRz0c3JaE04bEL3YhsHju4aX/r8mw2w4ElVr+/A7waRb1uu6cm
	BgFKu1//tNtQ2oBZxei0BmvERxAn8miTSF7jbaTXNY6eWdSL/CnBqW7x24qBsrwhNMES
	LhoqzgQC+wQDwLTF8BCXOuKfH7Xt/7MSDaq/hH/S3Gc6pnRDcDDXPdkGpjYfa7/rnJ6l
	5VbA==
X-Gm-Message-State: AJaThX5arvhuGFbN+R6DcCJbw4qQzOGeGPbQb1pRd61aPA+HwIMZyijD
	flysC+mSuDGxhGyluYrnhdwmiw==
X-Google-Smtp-Source: AGs4zMZyOjM/78ki8WBfaG76SOeXTwwBtT6rTccBNSUx6bT84z0QQckySrNSPk0Q4lXFySBet6buaQ==
X-Received: by 10.159.195.72 with SMTP id z8mr28703742pln.183.1512711996330;
	Thu, 07 Dec 2017 21:46:36 -0800 (PST)
Received: from neosoft.neocat.org (67-5-135-101.ptld.qwest.net. [67.5.135.101])
	by smtp.gmail.com with ESMTPSA id w12sm75701pge.59.2017.12.07.21.46.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Dec 2017 21:46:35 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Dec 2017 21:45:48 -0800
Message-Id: <20171208054548.26218-13-bill.randle@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171208054548.26218-1-bill.randle@gmail.com>
References: <20171208054548.26218-1-bill.randle@gmail.com>
Subject: [meta-python][V2 PATCH 12/12] python3-wtforms: new recipe
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
X-List-Received-Date: Fri, 08 Dec 2017 05:46:35 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 meta-python/recipes-devtools/python/python3-wtforms_2.1.bb | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-wtforms_2.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-wtforms_2.1.bb b/meta-python/recipes-devtools/python/python3-wtforms_2.1.bb
new file mode 100644
index 0000000..add59cf
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-wtforms_2.1.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-wtforms.inc
-- 
2.7.4


