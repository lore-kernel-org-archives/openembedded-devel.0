Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9D9AB7D344
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Apr 2019 00:56:29 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id a96so6854689pla.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2019 17:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=znQp7J72pbgKBVllk0K1emwIiOXP+xWaiIao9BoMXCI=;
	b=bJdqB8DG+CoYsOtY3ojsxcAZZTD6ZEWRYjEwT1OWBKKVFNSMkxTqiw2mvSlLUTJnBM
	ziMXKZHL1oxzLaDSC+iNMCK3MoR9DBkNN32yThxebHZNN/31nlU5/Gfs4FKFUNsLzcV6
	oySfmbknrggeouU16yNiAkxfzLrQIIzRQXSxXbkVHY9hvs1Xg64cvq8qnyTnw+SmiR26
	FZv/mKafYRZcY26dS9ApD88SbQfdWX0H2JaMak2L3aIIL7l7BToNKxGgVTgFKgwHGcJj
	EP+7rkZ+maDIqtkGiIpTLIYW5Rrd/0qACJLM977k0oKPaO1boBUTZcCp0KpbpCO8wl6U
	eGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=znQp7J72pbgKBVllk0K1emwIiOXP+xWaiIao9BoMXCI=;
	b=R5iHHsf611F7c5qxQYznIQssaK9qln2I70ZH8FZy5+4NVEKCG424dVaAmBnxqr5utP
	pZT5hequfLRAI7mWHYTkqGUhXarU/Xop28knntZQuKvs+zQZsAiY3m+XQ1f3kXuZpcMR
	2gIi/9plk4Zk5NbXStl+V2hJh/DOaE6Q2fWz5sb/7OLdIKjoghYp/g1OGGe61GvHcAjR
	Hrb93lOFjMSoIjeO03Sna7NsfnVDFPufGnBgfJ3qZSZA2vEAzlifrvaAlxbBAgfk/g9Y
	2qrMzbRK3nf9BylPePEWDwb+yBCUAvEPHQ2NBUWtBexPHawbSYE4OzZ5H3XxmDLkHVgK
	DP/Q==
X-Gm-Message-State: APjAAAXzBkWAPb+rgsJYezrFRf9Ik4R1Oga5qmKD1wrDeOxpSWbUWIW+
	QvNUzJQmhnJ8wdI8kEqfr/x69z4Q/o0=
X-Google-Smtp-Source: APXvYqzCrtuMVe/t6Kqsxau8a7SN/mtNvV6srCxdv8O5N4dgbhZ8LpqAiYItfbj5DH/tWsE/NGYP+g==
X-Received: by 2002:a17:902:1105:: with SMTP id
	d5mr42995960pla.311.1555203389947; 
	Sat, 13 Apr 2019 17:56:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::6a6c])
	by smtp.gmail.com with ESMTPSA id
	13sm56603134pfi.172.2019.04.13.17.56.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 13 Apr 2019 17:56:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2019 17:56:19 -0700
Message-Id: <20190414005619.6582-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] redis: Upgrade to 4.0.14
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
X-List-Received-Date: Sun, 14 Apr 2019 00:56:30 -0000
Content-Transfer-Encoding: 8bit

Add needed depends
Do not build jemalloc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../redis/{redis_4.0.12.bb => redis_4.0.14.bb}            | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-extended/redis/{redis_4.0.12.bb => redis_4.0.14.bb} (89%)

diff --git a/meta-oe/recipes-extended/redis/redis_4.0.12.bb b/meta-oe/recipes-extended/redis/redis_4.0.14.bb
similarity index 89%
rename from meta-oe/recipes-extended/redis/redis_4.0.12.bb
rename to meta-oe/recipes-extended/redis/redis_4.0.14.bb
index f09d226cc6..63ab44b6a4 100644
--- a/meta-oe/recipes-extended/redis/redis_4.0.12.bb
+++ b/meta-oe/recipes-extended/redis/redis_4.0.14.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://redis.io"
 SECTION = "libs"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3c01b49fed4df1a79843688fa3f7b9d6"
-DEPENDS = ""
+DEPENDS = "readline lua ncurses"
 
 SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://hiredis-use-default-CC-if-it-is-set.patch \
@@ -19,8 +19,8 @@ SRC_URI_append_mips = " file://remove-atomics.patch"
 SRC_URI_append_arm = " file://remove-atomics.patch"
 SRC_URI_append_powerpc = " file://remove-atomics.patch"
 
-SRC_URI[md5sum] = "48f240fd2d96b1b579300b866398edbc"
-SRC_URI[sha256sum] = "6447259d2eed426a949c9c13f8fdb2d91fb66d9dc915dd50db13b87f46d93162"
+SRC_URI[md5sum] = "96ae20ffd68b9daee24b702b754d89f3"
+SRC_URI[sha256sum] = "1e1e18420a86cfb285933123b04a82e1ebda20bfb0a289472745a087587e93a7"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
@@ -32,7 +32,7 @@ GROUPADD_PARAM_${PN} = "--system redis"
 REDIS_ON_SYSTEMD = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}"
 
 do_compile_prepend() {
-    (cd deps && oe_runmake hiredis lua jemalloc linenoise)
+    (cd deps && oe_runmake hiredis lua linenoise)
 }
 
 do_install() {
-- 
2.21.0


