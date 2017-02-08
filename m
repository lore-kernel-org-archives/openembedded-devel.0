Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id EC47F60602
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 18:12:46 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id s140so131271410qke.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2017 10:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=Wj7fVSfLXT5B9ueznJxXZHAvuC0NvmBMGfQfTGhCBB4=;
	b=XHtf3eADU9p/gQphD/fueXoqwF5T84Cm+G8mdU6j1IIRM2TEb9LV0bi2R2/mR1nepD
	MXWzhJJ7480czCxeduyNI+3aqCJeNPnXLQIusWzi9Y7YK3rO1DwYrS/5+LUZTxhsK7l3
	E2dhIoCSgTWVf2Goentv0lN+O5yskJJGml/H/bGiNe67GbSB6/4a8ohaXc0IyxG8uTe1
	A+CioFikFOMWyteVddnANvxH1unqYs6sed+9Do+iE20vclIyJJO8+NAIiJBAcudLBmwz
	iR1nuhlRmNccwqmhJBVIgfpf0ZpkOKBi6MHIjBkIzbmQp8Q65OrG2RYFqKbOESW8c48+
	jNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=Wj7fVSfLXT5B9ueznJxXZHAvuC0NvmBMGfQfTGhCBB4=;
	b=d93rdKfjuZn0uO/FOGW1lzS+uRFHT/wIGRfF5haAX31PoxO1JbIJa38AevkGR7KqZF
	O+twQ7uLhIS8Ezl3w1/xuW9JcPAxYFZjzGf8IcUMa3Vk2HpLab6t7vo4B4u9mhOZx6Jm
	GfvAFF/+HZMg0e0gntg+rQHBn+GdmuKr+fnT/2uY/KQdedM3wBA/u7Wa9hhUKL3dUHS7
	y65yWZ76Qce6QZcdi7s3hEY4DIQKOQGjidsnF8xIX/BVxAzaVVrQPrOvTSzk6DCgbSGs
	kE8vrYtvIKKdYfHGCk7TpoRYV2lvPOeGiywdbMhrcKLT2HGdKFbOWqKV1DKeD8zJ0BTz
	x8dA==
X-Gm-Message-State: AMke39nIItgw6VcBK8aGqQm92zAbvNael3O0AhBs/olAfqkUcguaXSCGHUqgCMvyzbRtPg==
X-Received: by 10.55.87.194 with SMTP id l185mr20417983qkb.209.1486577566300; 
	Wed, 08 Feb 2017 10:12:46 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id
	y23sm6792676qtc.38.2017.02.08.10.12.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Feb 2017 10:12:44 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2017 16:13:18 -0200
Message-Id: <20170208181320.21119-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.11.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe][PATCH v2 1/3] libev: Add recipe for version 4.24
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
X-List-Received-Date: Wed, 08 Feb 2017 18:12:48 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-oe/recipes-connectivity/libev/libev_4.24.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libev/libev_4.24.bb

diff --git a/meta-oe/recipes-connectivity/libev/libev_4.24.bb b/meta-oe/recipes-connectivity/libev/libev_4.24.bb
new file mode 100644
index 000000000..f236eacab
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libev/libev_4.24.bb
@@ -0,0 +1,16 @@
+SUMMARY = "A full-featured and high-performance event loop that is loosely \
+modelled after libevent."
+HOMEPAGE = "http://software.schmorp.de/pkg/libev.html"
+LICENSE = "BSD-2-Clause | GPL-2.0+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d6ad416afd040c90698edcdf1cbee347"
+
+SRC_URI = "http://dist.schmorp.de/libev/Attic/${BP}.tar.gz"
+
+SRC_URI[md5sum] = "94459a5a22db041dec6f98424d6efe54"
+SRC_URI[sha256sum] = "973593d3479abdf657674a55afe5f78624b0e440614e2b8cb3a07f16d4d7f821"
+
+S = "${WORKDIR}/${PN}-${PV}"
+
+inherit autotools
+
+EXTRA_OECONF += "--with-pic"
-- 
2.11.0


