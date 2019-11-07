Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 300A77FA48
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 11:15:37 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id q130so1961994wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Nov 2019 03:15:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=x4hJUyFXWq6NCyYJh18PA6WhWI6hD2jKZxF8uQrKk8g=;
	b=LRAAw4JnkKczuUs+mIcgh73HfP2YS7XQ5jabCpjTsF2TrGPSelF8z4BJWbGBAuT5tI
	ytSuHgGkvvFqwloXucjuDCxYs2DTGTVv18NfhFcgXYueQKVMHH9AExKoLdoF8QmTSdxG
	Eiu4ajtWXuagzRjkbnODtzkpOk5Og9xRu78momWRXF9N2OJU6MySkFnLoplOw2tROZCg
	MlKunAFta0thpEI16smp1vA86R+nR7kYnkWQNf6aLEnZx6KrX58sphuYIe7lKeYNIvt+
	qh0I7eeC64/gElQ/5KPx+fN0x4t1CfIUH6JMD6PhxxETaOYF9UrHQFzoQYwVvK2VyOfE
	e0gw==
X-Gm-Message-State: APjAAAV1NHegjfnUQAZC+odH0XjqmAgyyWnxs5aFoLG0YKFn2PE7QMXf
	2FFsch3H5Ynwa8yJrWPMFV9uQb8H
X-Google-Smtp-Source: APXvYqwjuvWiib+hUSnttnU8ALlg1Ws0VKIR0Cj7HvhrIjjlFwsNBvam0iEd7t+dz6CxAWmhLqp63w==
X-Received: by 2002:a1c:e90b:: with SMTP id q11mr2298711wmc.125.1573125337820; 
	Thu, 07 Nov 2019 03:15:37 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id d4sm428610wrw.83.2019.11.07.03.15.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 03:15:37 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Nov 2019 11:15:34 +0000
Message-Id: <20191107111535.40523-2-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20191107111535.40523-1-git@andred.net>
References: <20191107111535.40523-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/3] cunit: allow to build a -native package
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
X-List-Received-Date: Thu, 07 Nov 2019 11:15:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This will e.g. enable us to use it from nghttp2-native

Signed-off-by: André Draszik <git@andred.net>
---
 meta-oe/recipes-test/cunit/cunit_2.1-3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-test/cunit/cunit_2.1-3.bb b/meta-oe/recipes-test/cunit/cunit_2.1-3.bb
index c9d87e36d..98f2cacf1 100644
--- a/meta-oe/recipes-test/cunit/cunit_2.1-3.bb
+++ b/meta-oe/recipes-test/cunit/cunit_2.1-3.bb
@@ -17,3 +17,5 @@ EXTRA_OECONF = "--enable-memtrace --enable-automated --enable-basic --enable-con
 
 FILES_${PN}-dev += "${datadir}/CUnit"
 FILES_${PN}-doc += "${docdir}"
+
+BBCLASSEXTEND = "native"
-- 
2.23.0.rc1


