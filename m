Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 954767F771
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 17:28:54 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id c9so25573104wrw.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 09:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=bNq/OKa0RVXjoMxmLykl0ZN3jdUeKOV0K8f5VAODMCI=;
	b=WuVnzhNhB3vZTkgVOcK+5rcjwpr4aGEqDrkfTcUkfdqWTveszJkR7tOtMM4UWsBYQU
	QvdyBoPL0LAUrILH+vb6iS84fz116WM0X1Ntv4YEIrgnN0P8Y5uVOP357y+6cY0HKPQ7
	oEc5ezZdJ3u1f+7M+N5b9FsMm8IBTcGhdPYbo7+nQUwr/e0UYNTHe9EGvbq0Q8h2gUhA
	fluUCiCS4gQpquvynbJk4PvBgJM5rSZ3/chv+B4+MQHPQPlUZZcHVyGUH0+dyTI1TgP5
	sSnep+QaqCn8m6jauzfhKkLvkDrvIJGMS7MVLfSymfrCOozJfOplYTdd7cLLLcS3JE/7
	CiMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bNq/OKa0RVXjoMxmLykl0ZN3jdUeKOV0K8f5VAODMCI=;
	b=eeW/JIH7CqA5fPY2PeX7QddkLIpTx+ZIs3TMySQOp6oxUqykUGkMXGMDGFEOBDKG6a
	zwj6Z85oeFFpyX6hgzF/ucGE7sOVD71TWjoyoCPzNrvGySCIgLHe91bRsZTjB9k3iwfk
	6WZbQe88odq17swsbqowPdXj+ZRhyNM0D7x+fBLghyJ3wFx53E85vxtmOoFMpGtal5hf
	w8bj0NfYF1sXJ2NJlQ8Pbhk2cFS217QcWXhoTQIjwEb4mc4URD/QCJqtEoFkn3e+f9O8
	Kpv6fc5DtM0rokEl0CoJMed6Sw4ge1qDn+j2uyBqWI9ab1La7AKya5xOJw21ZoDVx404
	tG8A==
X-Gm-Message-State: APjAAAXSruF5hcShoQdteDSrBkkOwxZqw8z1ISFa5kRrBagYccpVunlj
	uQLV2/aG0juy2IdG1F5kSqYSRJfR
X-Google-Smtp-Source: APXvYqx4jeJ3AQGe4m1L0UsuDB1jvDIX1vkITj7feNGW3LvZbLdn1E+kAVEsLMzes7PCirT+56WjyQ==
X-Received: by 2002:a05:6000:1248:: with SMTP id
	j8mr8830496wrx.44.1579368534844; 
	Sat, 18 Jan 2020 09:28:54 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	y17sm1076197wma.36.2020.01.18.09.28.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 09:28:54 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jan 2020 17:28:49 +0000
Message-Id: <20200118172849.120625-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] xxhash: Add recipe
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
X-List-Received-Date: Sat, 18 Jan 2020 17:28:54 -0000

xxHash is an extremely fast non-cryptographic hash algorithm, working at
speeds close to RAM limits.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../recipes-support/xxhash/xxhash_0.7.2.bb    | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-support/xxhash/xxhash_0.7.2.bb

diff --git a/meta-oe/recipes-support/xxhash/xxhash_0.7.2.bb b/meta-oe/recipes-support/xxhash/xxhash_0.7.2.bb
new file mode 100644
index 000000000000..df106e4a5ad0
--- /dev/null
+++ b/meta-oe/recipes-support/xxhash/xxhash_0.7.2.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Extremely fast non-cryptographic hash algorithm"
+DESCRIPTION = "xxHash is an extremely fast non-cryptographic hash algorithm, \
+working at speeds close to RAM limits."
+HOMEPAGE = "http://www.xxhash.com/"
+LICENSE = "BSD-2-Clause & GPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ed3511a67991a5923907dff2ed268026"
+
+SRC_URI = "git://github.com/Cyan4973/xxHash.git"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
+
+SRCREV = "e2f4695899e831171ecd2e780078474712ea61d3"
+
+S = "${WORKDIR}/git"
+
+do_compile () {
+	oe_runmake all
+}
+
+do_install () {
+	oe_runmake DESTDIR=${D} install
+}
-- 
2.17.1


