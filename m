Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id BB94C7DE74
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 18:53:57 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id 2so253029pfg.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 10:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dK6O1U3Crhi4oYBTfLPmg5A9+E/AsmT+2KxZMYG4zHM=;
	b=C/j4bHb/hmhF4PbD4GJYBBP2zyCjt6Isu9rDQfBTk8YlTKLNbMT5O506qdJCLyLYpr
	0ef28FYGz/LFwkl/GjusTtu6roqSYKMEQKd6S+On8ZDtDxhEVWQncXZu7e3aho774sjE
	E8DRRd7TGV1XFOaRw5albR7R2Nkbo0ghsDuVPc/2HTyjH5ZczsJqLZExYP3lXfqIQZUx
	7wNOGs6VryUx8/1hdquwkqlFlTFB9oX8xJVj//qThu2jT2+Ch2ovhHxigrk0NUhoRrws
	/Px/qvcyxuUaU95XGJh1AB8btJUvwhf3jYsAdLb6ebhdsEBfP32w28zcP0IReyvcEAfe
	5bkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dK6O1U3Crhi4oYBTfLPmg5A9+E/AsmT+2KxZMYG4zHM=;
	b=Py1D3Zuq5/QgYWta9dWFNalKpbytv+PgGQIEYbj9/qrEGtxdLrssik2QDQmLg2K/FG
	ltc4NT1wdMUpnvGnp7bNJYooSIS03JqEupeI0UOz9PvUTdFks4RxomsqpsSKDK0SskaC
	1Zl3ckfKr6ZnAOYbk0P5rfxP2UpY4cPLK203dMZglOdWi8yAtkGuLOl4BRIT6uliAzKN
	o2OmX0OBk1M5z3RFxIz7ohza85YdMXC3OznWn9Xuz4mmZKDOZ44lwjMFlckln5rqQUW6
	Mk44dl4FrznkHsbwGcLdFf70d6p+dnQRURscutXKFQp8xz9gl/UY5XFkCkASNLT6lqPZ
	Zq0A==
X-Gm-Message-State: APjAAAXCHIViih9CpaewP88THYUPj0EVFjxBA43RtR+APlI+qLv0gfLk
	6S5fLmnx0/g0K1Vx+BKV6blJNEtpEkw=
X-Google-Smtp-Source: APXvYqz0sfmNxYQ7CTRGGsKF0mohSKvBtLy87wWVIQqkBiT6uv0h+VGR5yAbeZ5EEkzp0dkG4j7PKw==
X-Received: by 2002:a62:a21e:: with SMTP id m30mr3728613pff.56.1579719238395; 
	Wed, 22 Jan 2020 10:53:58 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id f1sm4130758pjq.31.2020.01.22.10.53.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jan 2020 10:53:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jan 2020 10:53:55 -0800
Message-Id: <20200122185355.3258860-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python2][PATCH] python-pyconnman: Fix conman -> connman typo in rdeps
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
X-List-Received-Date: Wed, 22 Jan 2020 18:53:57 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-connectivity/python-pyconnman/python-pyconnman_0.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-connectivity/python-pyconnman/python-pyconnman_0.1.0.bb b/recipes-connectivity/python-pyconnman/python-pyconnman_0.1.0.bb
index 761ce08..264d2dd 100644
--- a/recipes-connectivity/python-pyconnman/python-pyconnman_0.1.0.bb
+++ b/recipes-connectivity/python-pyconnman/python-pyconnman_0.1.0.bb
@@ -10,4 +10,4 @@ SRC_URI[sha256sum] = "46c64c0692063fd0c9fb0216d49f7884bec9fa9760d8473db4b1e2f816
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "conman python-dbus python-pprint"
+RDEPENDS_${PN} += "connman python-dbus python-pprint"
-- 
2.25.0


