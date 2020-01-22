Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id 33A3E7FFD4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 00:59:46 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id a6so2249391pjh.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 16:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BqO5QtWd3T1cLl+9pkqa+DMydDeb6Sae7Ov4J4huwvM=;
	b=LrjiXuzJYWQrb4QImuR0nEQfd7mA+ufV99Qa7euvV56pMC/DHDKqrrIdKXFWm1+bqL
	MhPezOeS43w1gbNMwiX6JNn/IO2772+fh1wvCMyiTLEK8YZB6c7wcEdSIH3BMQlm8P9E
	7/+4eXYYru8xup37j4YmWVLsDd9JXCsuvMtdoHQWzUNtVqPByZUhQi719ufN/8zZjZYx
	ySBHrhNotvoOwLE3EMdWfyeEZ22TAg7l9ThhC1HtuWCDnT3deJwSigFfgMmT3jw8cTPf
	8GbyaZvPN2V8NZOqbhbinxfBvLAbIHc/D2jSiRS765ThykZ+mhDuTuz0/n+H4/y5m6Gs
	mNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BqO5QtWd3T1cLl+9pkqa+DMydDeb6Sae7Ov4J4huwvM=;
	b=Euo63QNJq6MknkIgFMtUgGIXsGuxVryUtWfUJT/DHxoKXEQ8vy0f5sMmjUSCrQsw02
	9p0qXIxLyLZOvNzeAL3kQ5g9KFHc3QO5aAJW2f27saa2BSLsHPMMh4unx6J4zOu+9C16
	QO2uicZa28kT9VxUZaoxC7N8XjalAa9/2m14EgG8daQB9GQJNC8dF8F5rvut6OEOXPCR
	KzqEZd4k20W/C3jQtoDnw0+5nrOthZdlvco8STNCz4DJYKo9hyyMWroSIZG5TYPfaQ+7
	apyWNDXJuESHxNIV6l0kyqvXIyin5s+YE1T7HL0D/OPA+O1qzOdhFs+sRAigQZeTdSVx
	vurA==
X-Gm-Message-State: APjAAAVZCVgUV9vK2oIY5FYvL1mlX8Q9GMLryNSCdkUG2gMKZkq4L3ZZ
	/btcSdZ5jJuyeiDpt/SHmf0gIpfJ/p8=
X-Google-Smtp-Source: APXvYqzBH9Tq6SnGu5ttlA+Lk+JmwrLKqdMy++KaaM24SN1IqwigS7+xT8jOR6PT0twWxyruqOOTqA==
X-Received: by 2002:a17:90a:2486:: with SMTP id i6mr53902pje.9.1579654786771; 
	Tue, 21 Jan 2020 16:59:46 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	z26sm46107269pfa.90.2020.01.21.16.59.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 16:59:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Jan 2020 16:59:39 -0800
Message-Id: <20200122005941.3706171-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122005941.3706171-1-raj.khem@gmail.com>
References: <20200122005941.3706171-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 5/7] openlmi-tools: Use S to access setup.py
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
X-List-Received-Date: Wed, 22 Jan 2020 00:59:46 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb b/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
index 754476d67b..513bd11acf 100644
--- a/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
+++ b/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
@@ -17,7 +17,7 @@ SRC_URI[sha256sum] = "292b8f5f2250655a4add8183c529b73358bc980bd4f23cfa484a940953
 S = "${WORKDIR}/${BP}/cli"
 
 do_configure_prepend() {
-    sed 's/@@VERSION@@/$(VERSION)/g' setup.py.skel >setup.py
+    sed 's/@@VERSION@@/$(VERSION)/g' ${S}/setup.py.skel > ${S}/setup.py
 }
 
 python() {
-- 
2.25.0


