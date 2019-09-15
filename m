Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
	[209.85.208.171])
	by mail.openembedded.org (Postfix) with ESMTP id E73B27ED22
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 23:41:30 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id y23so31986657lje.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 16:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=4jXCQQ/MQsWM0FAZN6OYTEVodJ41dMNNt0IuM7R7QUI=;
	b=jCHZGTs8js5lYfKGuwIaFRS3e7QdI1OzCVc2yNkfUMxPlnekl3uN96K/OtTViPApIr
	POJ9g0i0fggt8neOItr1y52NgyjnWuiRWMjjlBRvqK/QiFu5yv5iThR4KMwlD1/QqxS7
	TSNGGKy+od+fA3ssvpCmPbkQ7IbZAhDiH71oZAyRo+ZTuvsTdz/OfL8UaU+wP6MSmpz7
	tbflsqp7FeZyFajk5n5V9nCXRxlvds+rJcSNe5i04IctUp8xOMCpA19CmU7LWvJQtIA0
	8qsvZaHRs7e/EaL2zE1O9zkPADQ+YzT/lhv00ugAAMY5mi5MT00l+vBpxfizv5Oo0R9q
	9DMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4jXCQQ/MQsWM0FAZN6OYTEVodJ41dMNNt0IuM7R7QUI=;
	b=VetfY0UNjSckc6FZiz+p91jQR0K6sIFGxqRRdHS1Jc65sojJUUiEPwxHkfMriYe+V4
	okMIErzkeSeZ3sbqtqEou00/Zyp2D6r5m3SayC7eWjSrCTo8bz5pZ/YHKc4Fr4Ipdg1w
	ytHlbIHAl81UPr8X3e/6XnSNKYRCs4BtOqoZ85dFRmMnzq7AFfcAA/NjJXKNXcmxaFUF
	CdhzNvMaY8gkAuWGo+GZyQ8Pag/elBYiMkkA1s3JPv9sEG5x1WeSo0pWn/q4HfLNLXoP
	iQi3/ACe0L4WlOzn+ZID8Xv4k5lzAg+tQNL1BBNhmY6CAefwxFxPk0UYQ5oeznXLBfaC
	rYnQ==
X-Gm-Message-State: APjAAAU2FtEpOKX8Yye26oTufyq1ZzWuFGEgzcSNkqBsLqKhu66aSWhd
	t3xbMZBPD6vrGZmNKFMpAjQwkI8HAqo=
X-Google-Smtp-Source: APXvYqyIIshA8B9+6+9BjOiDrbs7fyX6nAM5UL/Vr41tJTzkQM5YxKz9Ot1I1AgF18Illeg2E/jZTQ==
X-Received: by 2002:a2e:90c6:: with SMTP id o6mr36160154ljg.144.1568590891348; 
	Sun, 15 Sep 2019 16:41:31 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	f28sm8736579lfp.28.2019.09.15.16.41.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Sep 2019 16:41:30 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2019 01:41:29 +0200
Message-Id: <20190915234129.12136-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] python-pyobject: update to 3.34.0
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
X-List-Received-Date: Sun, 15 Sep 2019 23:41:31 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...{python-pygobject_3.32.2.bb => python-pygobject_3.34.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/python/{python-pygobject_3.32.2.bb => python-pygobject_3.34.0.bb} (89%)

diff --git a/meta-oe/recipes-devtools/python/python-pygobject_3.32.2.bb b/meta-oe/recipes-devtools/python/python-pygobject_3.34.0.bb
similarity index 89%
rename from meta-oe/recipes-devtools/python/python-pygobject_3.32.2.bb
rename to meta-oe/recipes-devtools/python/python-pygobject_3.34.0.bb
index 0ea70b23b..0cbd07f66 100644
--- a/meta-oe/recipes-devtools/python/python-pygobject_3.32.2.bb
+++ b/meta-oe/recipes-devtools/python/python-pygobject_3.34.0.bb
@@ -15,8 +15,8 @@ SRC_URI = " \
     file://0001-python-pyobject-fix-install-dir.patch \
 "
 
-SRC_URI[md5sum] = "92ffa25351782feb96362f0dace2089f"
-SRC_URI[sha256sum] = "c39ca2a28364b57fa00549c6e836346031e6b886c3ceabfd8ab4b4fed0a83611"
+SRC_URI[md5sum] = "ca1dc4f31c1d6d283758e8f315a88ab6"
+SRC_URI[sha256sum] = "87e2c9aa785f352ef111dcc5f63df9b85cf6e05e52ff04f803ffbebdacf5271a"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.17.1


