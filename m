Return-Path: <george.mccollister@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id E702E786C5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Nov 2017 21:13:07 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id n134so2558580itg.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Nov 2017 13:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=TPfGVdouK/FQxNO7ZBOCiMgQghQuM7z2P2/hAkppBhE=;
	b=ZyAmceC6aMb9JvpYvkeil2LKdafY6tkiA5wzMks5ZHOQU1GiRoigwrBpwSe/Hsw/Eb
	YaLtvY8WnU1/Tgq8Cv8tULYO2TpoYMrzRqgkFtvegLRkNGBUyJlEdbT0Eu54the/qfsH
	FzneoPnDOY4lwt+eJXHLdqlg/i+mMhhOyEy5URKfoskoyY1m5hSYxNq6LfMAJIGwVFHP
	6asMnVdVGIFs3q/L1pciJmibsW+I8SWnNRQLJDZIprGqmezLjgd8mY9i3npQKo0D4f1y
	8R9P6sCtd+qMu7hDo+jkldjRoI1I7aruCms6JVIgjanEMfzlY0GQDClmoSwF/XbZl1Aa
	5SAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TPfGVdouK/FQxNO7ZBOCiMgQghQuM7z2P2/hAkppBhE=;
	b=D0LQymXzayU4LtqcOLQ1L/mvjjLu49ACA6h2DWKzSuy1QjJ1kaho/O9TmmgAskegJc
	PFW22f2GGJjjvSAGoNeZVmlx5wG03yi8CXPmFwEysqtENl4zYHqSaXF0RKMWPtd5dh2S
	Ou5F5MtYfSF42b64MgAOXuzIiSDT/AIl+rWBgzTOnkUqWhLDChmh1m7C3US1rA/q1IGM
	AnX40iH3UG4w8/CrEMY3Y+WUsaZLHjBQLNOMyo6iTi2fEG7oMqh+fNc8FPSnws9QEadr
	qZyNBlyUp6gEskkrCQCb00boyAK3O6rhVXs8C6uPrjbK8A21ES67rPr/lVa1eDDcbYRj
	amnw==
X-Gm-Message-State: AJaThX5D2wWA0M7meTjtqCAXAu0qwNnCoMIOYhxgFdT597UebYpMLS2z
	J7MoZG8HAblAVEa/F2IVsJN9
X-Google-Smtp-Source: AGs4zMYlCQMrtDm0u0hQZQ+WczckwDXClmc2MkDpCiUMUsTdjH6Klo94VWewr95DQmxmhA1SFXwdQw==
X-Received: by 10.36.208.207 with SMTP id m198mr11858255itg.131.1510607588713; 
	Mon, 13 Nov 2017 13:13:08 -0800 (PST)
Received: from localhost.localdomain ([216.21.169.52])
	by smtp.gmail.com with ESMTPSA id k66sm4611181ita.6.2017.11.13.13.13.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Nov 2017 13:13:08 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Nov 2017 15:13:00 -0600
Message-Id: <20171113211300.30138-1-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.15.0
Subject: [meta-oe][PATCH] postgresql: Update to 9.4.15
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
X-List-Received-Date: Mon, 13 Nov 2017 21:13:08 -0000

Update to 9.4.15 to pickup "a variety of fixes" from 9.4.14.
Included are fixes for CVE-2017-15098 and CVE-2017-12172.

Upstream release notes:
https://www.postgresql.org/docs/9.4/static/release-9-4-15.html

Backporting all supported stable branches to this version should be
considered.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 .../postgresql/{postgresql_9.4.14.bb => postgresql_9.4.15.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/postgresql/{postgresql_9.4.14.bb => postgresql_9.4.15.bb} (67%)

diff --git a/meta-oe/recipes-support/postgresql/postgresql_9.4.14.bb b/meta-oe/recipes-support/postgresql/postgresql_9.4.15.bb
similarity index 67%
rename from meta-oe/recipes-support/postgresql/postgresql_9.4.14.bb
rename to meta-oe/recipes-support/postgresql/postgresql_9.4.15.bb
index 5a78ea3ed..eec099a12 100644
--- a/meta-oe/recipes-support/postgresql/postgresql_9.4.14.bb
+++ b/meta-oe/recipes-support/postgresql/postgresql_9.4.15.bb
@@ -11,5 +11,5 @@ do_compile_prepend_libc-musl() {
     sed -i -e 's/\-lnsl//g' ${B}/src/Makefile.global
 }
 
-SRC_URI[md5sum] = "2b7e2a2b0232063b68b3f8a0a01902bd"
-SRC_URI[sha256sum] = "8e7df23a104b057b360d03180ebcb67f645e198a4a0bee94bf56b2bc9505ec6b"
+SRC_URI[md5sum] = "0aada0833a9208ae5fab966c73c39379"
+SRC_URI[sha256sum] = "12bfb3c7e8e45515ef921ad365e122682a5c4935dcc0032644433af2de31acc4"
-- 
2.15.0


