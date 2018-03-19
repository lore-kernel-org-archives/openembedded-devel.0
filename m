Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id CA1CF78849
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 12:18:39 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id v11so9723335qtj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 05:18:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QBEUzt+xj5nid3B8nKaI3z7HeszeKz5Abnr6x7NB85Y=;
	b=dvkSSTzTIr9elrQLSRIzqCQhar3Hh3f3xYO+It/ff/CQf63hOqyi/weV8cYWuR12Wp
	yqH9yk2B283jsL+ayxo0uR3fX/VD2NmyzZimMGHRst7M2GIQ/KnCAYU0jwyPRUEE9NNn
	PpGD/bJbvxD0RM477CjShnWXIbThJTuf5Ex5xH3mZFXD0JW1VPscJG6gVgWjAVvMcJxu
	+bBEWcP3S8ZUJmhEXu7zdBi74vMfQTvnow+ZiMdarGQhhuVXqWtT9O+p9BwW2OUWH9Kb
	qRRUU0NMmTHBAwrHMBwc7NSqdDXkkad7T4Usa8KRpu501X1URqBDK8nS2pNOhUVLT4IS
	p9Bw==
X-Gm-Message-State: AElRT7GGk8eb8Vzgd/FK1mKl6MVvykWgPrEw9GhUs/2sh25TBJeGjSzf
	/Uv6upz+9+VxhShOeZux7m7LjD7w
X-Google-Smtp-Source: AG47ELsRhut3t9DNYP6F5C3qdVUGz0jg9VGH0yv5paz+vSJOo8MYdV9vrp6jQkkp7MapSWqkmTaylQ==
X-Received: by 10.237.48.34 with SMTP id 31mr17592570qte.325.1521461920830;
	Mon, 19 Mar 2018 05:18:40 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	16sm10390215qtp.88.2018.03.19.05.18.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Mar 2018 05:18:40 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Mar 2018 08:18:34 -0400
Message-Id: <1521461914-11416-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cassandra-driver: update to version 3.13.0
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
X-List-Received-Date: Mon, 19 Mar 2018 12:18:40 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cassandra-driver.inc       | 4 ++--
 ...-cassandra-driver_3.12.0.bb => python3-cassandra-driver_3.13.0.bb} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cassandra-driver_3.12.0.bb => python3-cassandra-driver_3.13.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cassandra-driver.inc b/meta-python/recipes-devtools/python/python-cassandra-driver.inc
index d11e657..1648d3e 100644
--- a/meta-python/recipes-devtools/python/python-cassandra-driver.inc
+++ b/meta-python/recipes-devtools/python/python-cassandra-driver.inc
@@ -8,8 +8,8 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
 SRCNAME = "cassandra-driver"
 
-SRC_URI[md5sum] = "33bfaebe3245bc9f9be3993baf67962f"
-SRC_URI[sha256sum] = "cbd9504e241c6b16d8e50b32ccca2a48b04bb3b855741f010a92b3f3bbbc5627"
+SRC_URI[md5sum] = "5c8b4a3adfc48180e8ec38b8c4e996fd"
+SRC_URI[sha256sum] = "61b670fb2ba95d51d91fa7b589aae3666df494713f5d1ed78bb5c510778d77f0"
 
 DISTUTILS_BUILD_ARGS += " \
     --no-libev \
diff --git a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.12.0.bb b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.13.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cassandra-driver_3.12.0.bb
rename to meta-python/recipes-devtools/python/python3-cassandra-driver_3.13.0.bb
-- 
2.7.4


