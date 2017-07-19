Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 981FD781F6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jul 2017 15:41:48 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id q85so302093pfq.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jul 2017 08:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kbkbwkw0ILKQ7cQaHwgFyWV2sf1B3S+JplASlialCkc=;
	b=f8H+oOJosHh739swmvSKQy2vmc6/vc0QgjTZ0MfrT/eN2utHRwlM+t7phk/3UDX8cL
	/6YgIb40bFwICiFzE2CZ3n5TMHMBQtAgit/GLK0p260A+Kg83YhhyavQUMMoPnbh9sd8
	5Nl1joTwANutONTKLi21hPPkJI8HIXpqTB7LHepQgX6nk+M2aHjX6HWeK2TX8aWCJW6j
	QgT98Zgl0S0B439y4E60V3bGCLJWCbywjQ5iPFKA1UKrcuC35p4RUW+3WZWTMfN551r6
	5Q9Xg6iIilWMGJ4euEFRWvX8y/8ievMVPbnJOcHahU2qIsavxga6b+yAd9AqhATvNEck
	x1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kbkbwkw0ILKQ7cQaHwgFyWV2sf1B3S+JplASlialCkc=;
	b=WrEFAGgGH0TzWFRRCTU/StAE+t+b3Fs0jrclaG+9iIaJExKJyFkghzBve71gq4Miqk
	dh2SOaPWWjj8BPr/0wkl9hV3qNmiSxyE9jNnB3Z2MB+M3b2u9pr2eW+q0e5bKkjQ0XrQ
	Garx6VqbUFH/jz5wEXQaTTda1zYalJIYOrPJivVBgeW24zb+gvPBT7uu0zmzZh60ZdOV
	jOGLPA7ApzvLh8QDQgfHxvUbjtRRh25lvzZrhunDEjYnUsWr07WKHJpHN34KAi/Op4Mp
	AYC4I8zRhZ5z5UjR/9xo6BPMS8NRiH4LpsWV3VxDQ2WBDhVUg5pjDuycWyU3Vx8WknDG
	g4LA==
X-Gm-Message-State: AIVw113qz05rhZwPdEIwq3VwZ9KalassY6Bqko9WpjUBXQ90mzFyGXoh
	CR8s7MgPgF64XImD
X-Received: by 10.84.178.37 with SMTP id y34mr541394plb.223.1500478909921;
	Wed, 19 Jul 2017 08:41:49 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	b85sm494845pfe.94.2017.07.19.08.41.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Jul 2017 08:41:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jul 2017 08:41:31 -0700
Message-Id: <20170719154132.20556-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170719154132.20556-1-raj.khem@gmail.com>
References: <20170719154132.20556-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/4] postgresql: Do not link with libnsl on musl
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
X-List-Received-Date: Wed, 19 Jul 2017 15:41:48 -0000

libnsl is not available on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/postgresql/postgresql_9.4.11.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/postgresql/postgresql_9.4.11.bb b/meta-oe/recipes-support/postgresql/postgresql_9.4.11.bb
index e4d2edad0..7043b272a 100644
--- a/meta-oe/recipes-support/postgresql/postgresql_9.4.11.bb
+++ b/meta-oe/recipes-support/postgresql/postgresql_9.4.11.bb
@@ -7,5 +7,9 @@ SRC_URI += "\
     file://not-check-libperl.patch \
 "
 
+do_compile_prepend_libc-musl() {
+    sed -i -e 's/\-lnsl//g' ${B}/src/Makefile.global
+}
+
 SRC_URI[md5sum] = "2fee03f2034034dbfcb3321a0bb0f829"
 SRC_URI[sha256sum] = "e3eb51d045c180b03d2de1f0c3af9356e10be49448e966ca01dfc2c6d1cc9d23"
-- 
2.13.3


