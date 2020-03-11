Return-Path: <nick83ola@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 928B161BD2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 07:04:47 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id z15so1155251wrl.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 00:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=I8tMnzA3jtI70iuNB3GpkQVjVdOoGQ9fklrrzxcZXHM=;
	b=lMnFsfvuaEh1zGZ6SoTfbXdP+8z8yk6G1/GKQ/1OaXGVikwtSZIsB3kGmzfUt5yvBn
	ix1yRMXvt9IWvkItv1cEGDist3b5owsN8s8e4kmRi5V45vw9Ul4fEgrdGxsggG4tlE5B
	EhgCM5aMaSjiIMOMmzsMfpKkKl0aLDqqbiTXj6qPxOSSVLI+rs40bWOXBJSSilFNCf+4
	u2SfW31hpKT/O2RT3kyeeOUgrqZjJW9tEr0tgHeN9PHwOV+gQPDeqWU80oaNziZvNZKr
	cHPOvFnFyJFouhVdWBOBzN56GMXYXedmme0RLTpjUQJPZ4zuH/2Ku8uxs/30uatvaDm1
	vdog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=I8tMnzA3jtI70iuNB3GpkQVjVdOoGQ9fklrrzxcZXHM=;
	b=P6cMFjLHd73Sk/iL2g8C9/ZZPnzbSTQFZtJV41+BPFRSZNioWL/jhyfkRd7iVr4T8a
	mncoSuDvaie3jv0atxUwm++1725OwLdgr9+doAhhLZvgpRA+xYrgd+aqiTQneR9Pdzag
	MEbh+kTIwY+uctkiKqx+DBkPRz5mDZiFHU0fp1+pirMKxp6yNqzOUr1ty6OVZbw7rq5w
	CTbjcxdT1V+sydNqJgRvj+SjuZsTHHiN65O7eIykewC9BsiNnW/7P2HXvhdQI/Wwd3Qt
	Op2Ew5DV9K3hPfQ9dKP9qYsSedvW1LTFWODiwhdm8OFGKXDuRkcp7nJebdbS+Ah/43bW
	Zw5w==
X-Gm-Message-State: ANhLgQ0ZTFoVBJQm7laFkGplYdOS+Z86G2IO+0h3H6/KjglyAjLjCGfR
	5R2ZcvDIHU50qjYHQk8VLCizPMsoy61YaA==
X-Google-Smtp-Source: ADFU+vvXJBB5/P2oatLrBMfs7hgM/+59/OGQXrEFFm1ad+yoNH7MHG/fenw3HTMzhr7sAyOTFgktiQ==
X-Received: by 2002:a05:6000:18f:: with SMTP id
	p15mr2766225wrx.149.1583910287921; 
	Wed, 11 Mar 2020 00:04:47 -0700 (PDT)
Received: from localhost.localdomain ([79.97.95.10])
	by smtp.gmail.com with ESMTPSA id f2sm9567312wrv.48.2020.03.11.00.04.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 00:04:47 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Mar 2020 07:04:00 +0000
Message-Id: <20200311070359.18480-2-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200311070359.18480-1-nick83ola@gmail.com>
References: <20200311070359.18480-1-nick83ola@gmail.com>
MIME-Version: 1.0
Cc: Parthiban Nallathambi <parthitce@gmail.com>
Subject: [meta-python][PATCH 2/3] python3-kiwisolver: add recipe for version 1.1.0
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
X-List-Received-Date: Wed, 11 Mar 2020 07:04:47 -0000
Content-Transfer-Encoding: 8bit

This is a dependency for python3-matplotlib

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 .../python/python3-kiwisolver_1.1.0.bb           | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-kiwisolver_1.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-kiwisolver_1.1.0.bb b/meta-python/recipes-devtools/python/python3-kiwisolver_1.1.0.bb
new file mode 100644
index 000000000..a10830257
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-kiwisolver_1.1.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "A fast implementation of the Cassowary constraint solver"
+HOMEPAGE = "https://github.com/nucleic/kiwi"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://setup.py;endline=7;md5=1c177d169db050341d3b890c69fb80e3"
+
+SRC_URI[md5sum] = "fc8a614367f7ba0d34a02fd08c535afc"
+SRC_URI[sha256sum] = "53eaed412477c836e1b9522c19858a8557d6e595077830146182225613b11a75"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "\
+    python3-core \
+    python3-setuptools \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


