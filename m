Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id B3D7D77A91
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Mar 2017 18:45:54 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id o126so28157410pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Mar 2017 11:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Y5GpKYKnkKkolvga7FWyWUC2Ebne5GQInhJjBQQ/ghk=;
	b=O//lZb51G9Mt7hqN2sjxLMTTDXvHl2TB/L7O3Q+xuVzF0k18/wcnsmlpw41ZceusBJ
	yhATS6WHCnzbeHKaGgvwtspaGgcs3SQcfrNpTX70qpb/94WDnvHT3xmosT0yRkq5u2hq
	oDHiWBZQd4qb3T1MBV7W7CdrICs7LzXoAdRkUt5GTub9CvjO8OibOmZhEyK7ttBMEb36
	hf7AEhqxPGNrvTd2sHQ/Hc1NvXISPVvZJykolNmsP5iRORpPQ/oM/7hfM18MQ7V8vLYu
	Ftm6asHjhpwaiIb2Rknxryyv+gDXaqVyKxDNjneceS0jTmbR3Q+mf+1kFugkzO4eFHIx
	GWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Y5GpKYKnkKkolvga7FWyWUC2Ebne5GQInhJjBQQ/ghk=;
	b=qO80mIAb/VYQnP+xXkWj5rAVM+tw6pgf8lIJaLrxt1XeCRq9R0CqmT3QB/4vd0iivW
	uTNyhWL9pyoQzX13saiovZw+kG92DmC8W8ls/FG2T5IqHkvBUF4cYf6Pq1eGDshFv7P2
	2firSKnjs9r9Fn0ToIKti7pxdBSBvLs4K0iadR8XKO3oBQj6OKzixQoU+5Nbc1PsKiRH
	U/TGkn/JAxc50agDAiU9I+0ybwgWNsQtEnvJ+SeSUb+vnW2rxlHSQ5yjWO7Gq9cbnAFG
	zU+aQvvuvbXie+eg+ooqwqVPWgdQQm5iXXGaS4UOTHJsSRFZhAl26+3efJ+i+K1fPzTW
	6pAw==
X-Gm-Message-State: AFeK/H0zRS8H4akDM/7G/qFh7m/FDNlgT4w0Gc1QXAgpe3mFSuqCmez34o7oCACnfFHuMQ==
X-Received: by 10.84.224.3 with SMTP id r3mr48432994plj.130.1490208355987;
	Wed, 22 Mar 2017 11:45:55 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id z4sm5404494pge.49.2017.03.22.11.45.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Mar 2017 11:45:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Mar 2017 11:45:32 -0700
Message-Id: <20170322184533.6501-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170322184533.6501-1-raj.khem@gmail.com>
References: <20170322184533.6501-1-raj.khem@gmail.com>
Subject: [meta-python][PATCH 09/10] python-slip-dbus: Update SRC_URI to github
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
X-List-Received-Date: Wed, 22 Mar 2017 18:45:54 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python-slip-dbus_0.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-slip-dbus_0.6.1.bb b/meta-python/recipes-devtools/python/python-slip-dbus_0.6.1.bb
index 785cecc35..8081416ee 100644
--- a/meta-python/recipes-devtools/python/python-slip-dbus_0.6.1.bb
+++ b/meta-python/recipes-devtools/python/python-slip-dbus_0.6.1.bb
@@ -14,7 +14,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 SRCNAME = "python-slip"
 
-SRC_URI = "https://fedorahosted.org/released/${SRCNAME}/${SRCNAME}-${PV}.tar.bz2"
+SRC_URI = "https://github.com/nphilipp/${SRCNAME}/releases/download/${SRCNAME}-${PV}/${SRCNAME}-${PV}.tar.bz2"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools
-- 
2.12.0


