Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9E53F7FCFF
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Jan 2020 16:39:12 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id q10so2688193pfs.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Jan 2020 08:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xMjVTryRl7+hL3WRBM/4sRnSskYTXvjtNoxCXcVUVE8=;
	b=ZOGu+htSzVWNB2Ul/WohlHopdmkBSlSiDEbpZsbv1EhiGiTNkAuNEAQVSN85tAF79E
	liUEkKcweypcrWAf6O9MHVyjC5o+utJLbM61VgsF9IpdRIE/DkCeByrnBPTKRWkw5ZLS
	k2GvBqEzEA5UfYOhhY8fP2IJyuWnZ1ugSfCc2oen2PYd8I0N7mbHMdUBVj4JGl7oNrIy
	iKrkZVljmcEBIR9Xy1DDC+xgdywS76/0pb2tm9AC+3tgieY7UBHSBkpZ2jpTspFD3jVK
	O3bxZAwBvVvmbkI68hvsmp9RcxD8ySvQTT/YQNGlVhqFamQ9PODCT5+zaCELfhnJzMCi
	WZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xMjVTryRl7+hL3WRBM/4sRnSskYTXvjtNoxCXcVUVE8=;
	b=ISd3SW33Kpd9xgbft6PIAxjwnQAabASGagw+domvj57P2f7IhYgo0hA0MIJ/MyoKLB
	+nS4c5csndnzrYzHg0umZEyHZxjDrl1JQFU6xF9UbT7b6xKxII4wiWw4fIyP2zUEmdP6
	eyDnNJvm6vOcVegDt7EgaF71Yotk6d0mCOD4tPTZ6see2F0OPOVTsSCmnYtLgTVgSgAW
	qt057+zeJMGFk39sNj23FO3FM61aLVTXDflqvAc2DTuBWHrOx/j8ppck17h9gj1/4zH8
	j70rgsYoHZ5+G7SLJ9LZCcvRmqD0BO9jYx7NQcy3y5vDZK/Ezimo4UrHvUxScPE2W8Y/
	Nzyw==
X-Gm-Message-State: APjAAAX3P0S4R3XyVI5itXcbnTjbxz1y6uBEKchOD9jZeP2JwBVTG/J8
	3dMUtOo9ntpt/R/QGYPVGe0WdqC0eh8=
X-Google-Smtp-Source: APXvYqzpGIOchhx4xW1DvGi9RsmLJozB+YzMH8uTVVNG7rHj9h9OVpKOO5o7zw77ftZaFaER4POaPA==
X-Received: by 2002:a63:360a:: with SMTP id d10mr11613798pga.366.1578760753411;
	Sat, 11 Jan 2020 08:39:13 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::a983])
	by smtp.gmail.com with ESMTPSA id y6sm7196521pgc.10.2020.01.11.08.39.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 11 Jan 2020 08:39:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Jan 2020 08:39:06 -0800
Message-Id: <20200111163906.675731-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200111163906.675731-1-raj.khem@gmail.com>
References: <20200111163906.675731-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 5/5] spirv-tools: Disable Werror
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
X-List-Received-Date: Sat, 11 Jan 2020 16:39:12 -0000
Content-Transfer-Encoding: 8bit

Using newer compilers e.g. gcc10/clang10 it spews new warnings so its
better to disable warning as errors for now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/spir/spirv-tools_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/spir/spirv-tools_git.bb b/meta-oe/recipes-graphics/spir/spirv-tools_git.bb
index c4db017e8c..8e8388e8d4 100644
--- a/meta-oe/recipes-graphics/spir/spirv-tools_git.bb
+++ b/meta-oe/recipes-graphics/spir/spirv-tools_git.bb
@@ -24,6 +24,8 @@ SRCREV_googletest = "f2fb48c3b3d79a75a88a99fba6576b25d42ec528"
 
 inherit cmake python3native
 
+EXTRA_OECMAKE += "-DSPIRV_WERROR=OFF"
+
 do_install_append() {
 	install -d ${D}/${includedir}/spirv
 	install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/1.2/* ${D}/${includedir}/spirv	
-- 
2.24.1


