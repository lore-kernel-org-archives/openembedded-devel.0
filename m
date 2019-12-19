Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id AF3AB7FD87
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2019 15:25:40 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id x184so3460975pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2019 07:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=3w5YcCuijQ96+R/eIr3Nfbm/J/lLXhRVGoMwNKSFQT4=;
	b=HdQ/c1K1oJhmJXQn1mYdVXzHP/mX+XlHQMGgCy6SHLna98fx1s8c4xfSmVMW4WWClV
	IuHhKbCnPcmmauQkNECRgl/YdO7xFxrkHVYYQjmcUzuTmHo/0yMcXKgBKD7vDAO9/A67
	FLFGZehyAqSxvnnqJsLJbKrJv+U0gpfHhk+Abz1+EyXY0vwEMmcL33gjq/H5EWQkc9F6
	vW3xKgOuttdmrIpAO5trQhYL44Mg/mVeS63/wZy0bc8AyY9txQgBv1c34WC1XuomrgEh
	K83jz0qYkm2gB8nFs2aYjz8OTA3+ootmL9vqO1x5/G9SJ3bXBSvXTNK2KvUZeCDr/YN4
	283g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3w5YcCuijQ96+R/eIr3Nfbm/J/lLXhRVGoMwNKSFQT4=;
	b=iaXT068IBYaMQWxVD8MLPxZbTEBjYuWHXgHa6dRvgA+JlIZdy4VGgO/Qhbnt9vLxPD
	5kCOUDuWyNkKamQ7fEp++hPpet+zODbKaLhIIc8yRstb8NmvSXeH2RXSokGcGfmfZhcE
	/dC5euGDtI3VyApNOHXULkGQP2BadANP8sYWflCXGztl+US0ag/tgCa5ZOs+/1/WF1/t
	TD6pVVSacC6ZvZ1l9M4U8UUTUzCJSb+zeZBgOCWIoRQVt15DvqQFqrWQ44l+v10VWzm8
	VYKkPMbceoXmaKI15kAoXO2eVm5feHGbbOa8DN1/OjnZIinaZRYQC0jpgr4zjPVXjhvt
	NRTw==
X-Gm-Message-State: APjAAAWi2lNqKQcgFTv70RUID4kzeVhgngUYbGCOfMZNTDm+rKxXp6MA
	HxIS+/LDqyvZx4IGHNqQ/E6AtngZQEE=
X-Google-Smtp-Source: APXvYqyX6Gb5XK8BZpN8ACqaaP1mIUP92SfY7caoT8Svozn2lKbLqA12cMuD0O2n9eQszulC/imxQg==
X-Received: by 2002:a63:6d8d:: with SMTP id i135mr9587919pgc.90.1576769141343; 
	Thu, 19 Dec 2019 07:25:41 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4b])
	by smtp.gmail.com with ESMTPSA id
	s18sm8840470pfs.20.2019.12.19.07.25.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 07:25:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Dec 2019 07:25:26 -0800
Message-Id: <20191219152529.725879-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191219152529.725879-1-raj.khem@gmail.com>
References: <20191219152529.725879-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 5/8] libgit2: Upgrade to 0.28.4
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
X-List-Received-Date: Thu, 19 Dec 2019 15:25:40 -0000
Content-Transfer-Encoding: 8bit

Fix library install path to consider multilib as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libgit2/{libgit2_0.28.3.bb => libgit2_0.28.4.bb}           | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-support/libgit2/{libgit2_0.28.3.bb => libgit2_0.28.4.bb} (84%)

diff --git a/meta-oe/recipes-support/libgit2/libgit2_0.28.3.bb b/meta-oe/recipes-support/libgit2/libgit2_0.28.4.bb
similarity index 84%
rename from meta-oe/recipes-support/libgit2/libgit2_0.28.3.bb
rename to meta-oe/recipes-support/libgit2/libgit2_0.28.4.bb
index 82acc4926f..9b9c191049 100644
--- a/meta-oe/recipes-support/libgit2/libgit2_0.28.3.bb
+++ b/meta-oe/recipes-support/libgit2/libgit2_0.28.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3f2cd5d3cccd71d62066ba619614592b"
 DEPENDS = "curl openssl zlib libssh2 libgcrypt"
 
 SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v0.28"
-SRCREV = "7ce88e66a19e3b48340abcdd86aeaae1882e63cc"
+SRCREV = "106a5f27586504ea371528191f0ea3aac2ad432b"
 
 S = "${WORKDIR}/git"
 
@@ -15,6 +15,7 @@ inherit cmake
 EXTRA_OECMAKE = "\
     -DBUILD_CLAR=OFF \
     -DCMAKE_BUILD_TYPE=RelWithDebInfo \
+    -DLIB_INSTALL_DIR=${libdir} \
 "
 
 BBCLASSEXTEND = "native"
-- 
2.24.1


