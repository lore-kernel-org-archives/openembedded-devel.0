Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id EC07E6B50B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 14:59:41 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id z7so10415949lji.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 07:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=HgHmlanzQssGZPkxVSDLRdu3DBOCjc9Dj6RdypBdzso=;
	b=gIQTtOAmhyFme6uFloEf4FMBHiDD9NcuF6tIuRZl9Ww+k+yLLO68WDloQLKsPeIEBf
	dDfz0SxlxVxvYiU7yjgMHvTS/6l8QYAbWDJuPxydKDwMP6NXeyimZgNkkcsQKmhPodQB
	edcDwnNSmtyC3MIPI42B311wJWiN5FvrS4Ph/B1AF4Bw7/CfIxYAvxYbjVDkwKlNLUPO
	yY705BzCibz6zVqRTIsDV4rEQeNyUmyNR710NgGANc1i6goG2EQ55VuCevcz/CC0yunx
	KhKOl1Hgg6OQxXsDdKmvoG9kmZSJhw0yqngZMsjYZ/ezpCW+uNejW7wFz2DQ+sm08JbE
	aenw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HgHmlanzQssGZPkxVSDLRdu3DBOCjc9Dj6RdypBdzso=;
	b=gziqx9MforZ1RtKR5UprJeQBdNdjFnxNYhXB5DO6Xsx8r0ed5TAFxYl6B707mW0bk4
	nYXGcNXIxV+tQmh3RiyKha7V0iDX55hmgMqA4M9cX0ZnS+ljqMCZuzGF1SZseKlaoONP
	yhcXyKF/TsLgO6l8ojZ7g4BbARH/kBoPJixEvPb/poprdOG3NiXcmuwzz53Em3kzIIKz
	buhcqG9ic1xZLTwzuLLtSubJmOqVDavWYBb6ClC21a9dKK7pqxJt3HEP1FGHTStmbujR
	5rgwkzxI7gaAM86ZJOrhOeMlat25V/9gCI7EpIffw8yihXMY3IGuDl4+rqvT11F2IaxH
	o6rA==
X-Gm-Message-State: APjAAAVUwAimblwFOTZ88D/rk44slaiA8gLdnyyhv1CtRQvI0tINR4vj
	9+jiCv2QIu67NnP+22/Fem95uxCpUZc=
X-Google-Smtp-Source: APXvYqyKe+US3dizPBCB21qf8K6f10S4CpqJ7jLfZPG36TvDX8bO0gbqeTQLX7XiV61/ffb+ztjIgQ==
X-Received: by 2002:a2e:8e8e:: with SMTP id z14mr5312241ljk.86.1552748382097; 
	Sat, 16 Mar 2019 07:59:42 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id 21sm1029506ljw.95.2019.03.16.07.59.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Mar 2019 07:59:41 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Mar 2019 15:59:24 +0100
Message-Id: <20190316145924.16486-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-networking][PATCH] wolfssl: update to 3.15.7
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
X-List-Received-Date: Sat, 16 Mar 2019 14:59:42 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../wolfssl/{wolfssl_3.15.5.bb => wolfssl_3.15.7.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_3.15.5.bb => wolfssl_3.15.7.bb} (77%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.5.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.7.bb
similarity index 77%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.5.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.7.bb
index 37ba4aa32..0a0a6075d 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.5.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.7.bb
@@ -12,9 +12,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 PROVIDES += "cyassl"
 RPROVIDES_${PN} = "cyassl"
 
-SRC_URI[md5sum] = "bc2dff70ba6e91aa3748d36ae6c6bc3d"
-SRC_URI[sha256sum] = "f6c04c25355b340373931f43f8041b3cef78b61122e8a8edf9ee63c07b7a58be"
-SRC_URI = "https://www.wolfssl.com/wolfssl-3.15.5.zip"
+SRC_URI = "https://www.wolfssl.com/wolfssl-${PV}.zip"
+SRC_URI[md5sum] = "6ec08c09e3f51cccbb1686b4fd45f92f"
+SRC_URI[sha256sum] = "4cc318c49580d3b9c361fe258fac6106624aa744f1d34e03977b587766a753ee"
 
 inherit autotools
 
-- 
2.17.1


