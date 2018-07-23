Return-Path: <freebendy@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id B7AAC74F78
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 13:49:55 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id 31-v6so258050plc.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 06:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=msspVUCnHV+zAB2SacVjYu4zEaZ+xeCDS5LffKxMfUA=;
	b=BvVUNg615T1FdUGxvqLBriCB9MIwD+4p/Ejp0SHf8vuNkOevq/7s1wwBh6hdYvRtii
	matnlQeQeFAqhMUwgOvNKfy62I6H5+lheAP6BIntp6izguRFyKNIjFsWEb1fcbVbXGLo
	V2ihvHm98x+eMylBEsTOf6+YX8xG5jiAiCpen1UcGXbBJOGJRlaeFm9CDEdc4F1THv5M
	6srkDH9P7kCsE5lLTb0ZYz/GIrD+0J32F+PyuTq4nUpLM3un9xVYVZaOtxSgm92ZBHhh
	QaZTFzRACbwX5O/pqdXD4D2GbEzAKwA3C2s/YfmCVZVz8rP89IZm31KmzRorR1krxLGN
	q21w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=msspVUCnHV+zAB2SacVjYu4zEaZ+xeCDS5LffKxMfUA=;
	b=j30Igooce7cdYqxaWK2pv0MHVaYBm3LoUYj55DujIZimR+4muOg5g8hUZRdyLL1l1D
	I/UI5nEjTXHg7RosRzBjf7hGqg5L19vW/5DugbHXU2HgT4DPYZO37WZ6YMRTyTTFXVQP
	nKYcbEgFH+1Q0GomkFMAbHmKqcnWuP9MaH2UshKdps+gN9gAHsFbOidVWViOIN7mxac3
	cXXW6GykAR4yJ7k/D3EJD5+7x9te/CHXZoPwy7yposZjjs1Xppk7T5J/PNbNoXdoGLzC
	tQXbZOnAgvrYDD9+YDm1yi7jboBFUb08OrvTPKW9Q1OuOft9NUjc8iuDUSK3eYLknpVh
	NMfg==
X-Gm-Message-State: AOUpUlFLyUX14/Gyv1zrgK/kdibx8qMqtvCZfkyHsWt0n9CXiLuqJSh4
	kXyDLPQYNJ0Gw2xHCL3vXn91FGFqnA==
X-Google-Smtp-Source: AAOMgpfGEqMxwC7GZPpNkUimniECgIBsX7yPmOkOQxSSvDchjUAkkEIaamSlWMKgCgFBo7G/1aRdjw==
X-Received: by 2002:a17:902:4203:: with SMTP id
	g3-v6mr12837973pld.315.1532353796631; 
	Mon, 23 Jul 2018 06:49:56 -0700 (PDT)
Received: from localhost.localdomain ([116.7.218.38])
	by smtp.gmail.com with ESMTPSA id
	v23-v6sm4182356pfm.80.2018.07.23.06.49.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jul 2018 06:49:55 -0700 (PDT)
From: Binghua Guan <freebendy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Jul 2018 21:29:50 +0800
Message-Id: <20180723132950.4543-7-freebendy@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180723132950.4543-1-freebendy@gmail.com>
References: <20180723132950.4543-1-freebendy@gmail.com>
Subject: [meta-oe] [PATCH 7/7] python-cmd2: add native and nativesdk
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
X-List-Received-Date: Mon, 23 Jul 2018 13:49:55 -0000

Signed-off-by: Binghua Guan <freebendy@gmail.com>
---
 meta-python/recipes-devtools/python/python-cmd2_0.9.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.9.2.bb b/meta-python/recipes-devtools/python/python-cmd2_0.9.2.bb
index 74dbaefc1..95d2601cd 100644
--- a/meta-python/recipes-devtools/python/python-cmd2_0.9.2.bb
+++ b/meta-python/recipes-devtools/python/python-cmd2_0.9.2.bb
@@ -19,3 +19,5 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-threading \
     ${PYTHON_PN}-textutils \
     "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


