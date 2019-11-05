Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id EB5E37F93F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Nov 2019 00:58:22 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id 15so12768447pgt.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Nov 2019 16:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=K22NL5njPTnLtnpEsCya+c3sxH5mgCsOUs7VXa6bMsk=;
	b=arSoq0a/GnQlmUmf4DBz0kIbODxO8/Byfjbh3lGdoqIFxk11NRenizWCw63Hyoub+X
	yNwjXAB+HRv2BgvhEwCLjESw/nYVlfD0wFOtZoKxaLmgE8FYUzaz+fUNF6oQ64BzhF5D
	RCEJiy7MnQnQCIuRc8LAhUMqdW+LCT87zxIhvKYtGJvIota7Jh+m+vNCwG392uby6+PJ
	zLb2Qgmps3+j6qfGdYwMdZMiEO8puasc7FVhWrWpuUYjFQhYAMnQNpgch1ChGLqZAQ6S
	LfW2sxZa4Wxgr7FwVUI/QxdBB/1fqNYvAGD3up6htBvn9nImwumCKcaqqysnBZZL3rno
	GIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=K22NL5njPTnLtnpEsCya+c3sxH5mgCsOUs7VXa6bMsk=;
	b=KxSCWGB23CKd+8fEHmzdbkxfw+gInBnsCHTt6JdD6b8yC7qVK+zdoxxmS1PZvoqsg1
	xgU01zK4MyNNK6otqiXrD0SB5MwOIBuuOHTGKPluNKAnf5lboBnHIBrvXQT2SEC9iUvr
	f26eP2FrP8U8TdFxXbEJveO1NlJdeG4FE0X3saVubuFbS+FbvFOslM1GpwincwY8GsNC
	7pn42nZHypYkQD0Iw9UhyA0fvkCJL+tLXUbCHV4twO9sSwXihTksEg5o9grcP9zwPKD0
	VzZcl3mJj7nxkFGZs5DhJ1rhmAWrG+2lseU+kchuew8WKv+bol7d3lK7Z8Urz3gzpgVu
	uxQA==
X-Gm-Message-State: APjAAAVO+pf5gRbl+wIjuFGGkr07NYlHKY37TWZOmvkq+64p7nHpzifu
	fgcB3YZ5+MSYtu2FBt4bo8kBVzIBzZk=
X-Google-Smtp-Source: APXvYqxdiVaYfOmTV4e8U9EE8tg9E6b45VqheYHpq5CoHe4hnxYNz4SqtJ5Ys1uHNiSyxF3B3niTEg==
X-Received: by 2002:a63:5a03:: with SMTP id o3mr32762475pgb.381.1572915503130; 
	Mon, 04 Nov 2019 16:58:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::5caf])
	by smtp.gmail.com with ESMTPSA id
	b23sm18856620pju.16.2019.11.04.16.58.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 04 Nov 2019 16:58:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Nov 2019 16:58:10 -0800
Message-Id: <20191105005811.2708915-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] iwd: Fix installed-vs-shipped QA errors on systemd units
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
X-List-Received-Date: Tue, 05 Nov 2019 00:58:23 -0000
Content-Transfer-Encoding: 8bit

package missing pieces when using systemd

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/iwd/iwd_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.0.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.0.bb
index 94d86d1dc2..81260cc020 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.0.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.0.bb
@@ -26,7 +26,7 @@ do_install_append() {
     install -m644 ${S}/doc/*.txt ${D}${docdir}/${BPN}
 }
 
-FILES_${PN} += "${datadir}/dbus-1 ${libdir}/modules-load.d"
+FILES_${PN} += "${datadir}/dbus-1 ${libdir}/modules-load.d ${systemd_unitdir}/network/"
 
 SYSTEMD_SERVICE_${PN} = "iwd.service ${@bb.utils.contains('PACKAGECONFIG', 'wired', 'ead.service', '', d)}"
 
-- 
2.24.0


