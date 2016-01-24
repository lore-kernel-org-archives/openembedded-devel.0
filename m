Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8DF1F769F8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2016 13:18:00 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id q184so4325219qkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2016 05:18:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=m5xncimz/flxVfzEqOgUqzjWK9lgfU9Cnk/4m9AAUOM=;
	b=LlGKEbT5SUZdmiuPHcdEz/mKJIiJx0M8zvNdiVFL6ZyCbqOWzmu9sQW5qaKBjH6dZf
	pprzegr/myChxdZzN0MV7A5v5PAKhqH6XSkD8ENTF8Tv3Nmer49PmLoSRqepuNYM3YA0
	4GK1KV7r4MU4oxdJuW+CG5/HpoGkgF/0rAY7YyjBRiSRZW8clamzDvTo0LjToJH5E8k+
	/NhvAlZEV0WOTdIVIU8ziO4Rbnl+g7ERHPHHjLEwNuNW5d0sfoJwOuaci8ENGoF0WVX/
	KDZwVWqvS49iJfZhZpt+JxWQ/T/Xm0y5CnUjUPufavsXTUad1EiZfa04I41XiBsB9PvG
	Jh2Q==
X-Gm-Message-State: AG10YOShektdqlrKt9FwKXuc4j/PrtAZqmbgeKcuTGnqEY0pPZBe4noUDkSKgsrr1EY8sQ==
X-Received: by 10.55.195.147 with SMTP id r19mr4485508qkl.33.1453641481328;
	Sun, 24 Jan 2016 05:18:01 -0800 (PST)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	d188sm6865927qkb.9.2016.01.24.05.18.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Jan 2016 05:18:00 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jan 2016 08:17:36 -0500
Message-Id: <e9d7ef7044e92e7247a27671f58e24afe5791982.1453589999.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
Subject: [meta-python][PATCH 03/13] pyrtm: update to 0.4.2
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
X-List-Received-Date: Sun, 24 Jan 2016 13:18:00 -0000

---
 .../recipes-devtools/python/{pyrtm_0.2.bb => pyrtm_0.4.2.bb}      | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{pyrtm_0.2.bb => pyrtm_0.4.2.bb} (57%)

diff --git a/meta-python/recipes-devtools/python/pyrtm_0.2.bb b/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb
similarity index 57%
rename from meta-python/recipes-devtools/python/pyrtm_0.2.bb
rename to meta-python/recipes-devtools/python/pyrtm_0.4.2.bb
index 3d382b9..5d47e2b 100644
--- a/meta-python/recipes-devtools/python/pyrtm_0.2.bb
+++ b/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb
@@ -3,7 +3,9 @@ AUTHOR = "Sridhar Ratnakumar / srid"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=a53cbc7cb75660694e138ba973c148df"
 
-inherit pypi distutils
+PYPI_PACKAGE_EXT = "tar.bz2"
+
+SRC_URI[md5sum] = "7c87da94656b620dfe532ca63d642eb8"
+SRC_URI[sha256sum] = "b2d701b25ad3f9a1542057f3eb492c5c1d7dbe2b8d1e8f763043dcc14ee1d933"
 
-SRC_URI[md5sum] = "34423f39caf7df8a9db8e243be9cf1a0"
-SRC_URI[sha256sum] = "d9d46d096a38cb692b55f4ee9f364d54348298e9497b11c1ef057539b5de1567"
+inherit pypi distutils
-- 
1.9.1


